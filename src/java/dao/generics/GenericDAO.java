package dao.generics;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import domain.Persistent;
import annotation.KeyType;
import annotation.ColumnTable;
import annotation.Table;
import exceptions.KeyTypeNotFoundException;
import exceptions.DAOException;
import exceptions.MoreDeOneRecordException;
import exceptions.TableException;
import exceptions.TypeElementNotKnownException;

/*
 *
 * @author leandro.amaral
 *
 *Generic class that implements generic interface with CRUD methods
 */
public abstract class GenericDAO<T extends Persistent, E extends Serializable> implements IGenericDAO<T, E> {

    public abstract Class<T> getClassType();

    public abstract void updateData(T entity, T registeredEntity);

    protected abstract String getQueryInsertion();

    protected abstract String getQueryExclusion();

    protected abstract String getQueryUpdate();

    protected abstract void setParametrosQueryInsertion(PreparedStatement stmInsert, T entity) throws SQLException;

    protected abstract void setParametrosQueryExclusion(PreparedStatement stmDelete, E value) throws SQLException;

    protected abstract void setParametrosQueryUpdate(PreparedStatement stmUpdate, T entity) throws SQLException;

    protected abstract void setParametrosQuerySelect(PreparedStatement stmUpdate, E value) throws SQLException;

    public GenericDAO() {

    }

    public E getKey(T entity) throws KeyTypeNotFoundException {
        Field[] fields = entity.getClass().getDeclaredFields();
        E returnValue = null;
        for (Field field : fields) {
            if (field.isAnnotationPresent(KeyType.class)) {
                KeyType keyType = field.getAnnotation(KeyType.class);
                String methodName = keyType.value();
                try {
                    Method method = entity.getClass().getMethod(methodName);
                    returnValue = (E) method.invoke(entity);
                    return returnValue;
                } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
                    e.printStackTrace();
                    throw new KeyTypeNotFoundException("Object primary key " + entity.getClass() + " not found", e);
                }
            }
        }
        if (returnValue == null) {
            String msg = "Object primary key " + entity.getClass() + " not found";
            System.out.println("**** ERROR ****" + msg);
            throw new KeyTypeNotFoundException(msg);
        }
        return null;
    }

    @Override
    public Boolean cadastrar(T entity) throws KeyTypeNotFoundException, DAOException {
        Connection connection = null;
        PreparedStatement stm = null;
        try {
            connection = getConnection();
            stm = connection.prepareStatement(getQueryInsertion(), Statement.RETURN_GENERATED_KEYS);
            setParametrosQueryInsertion(stm, entity);
            int rowsAffected = stm.executeUpdate();

            if (rowsAffected > 0) {
                try ( ResultSet rs = stm.getGeneratedKeys()) {
                    if (rs.next()) {
                        Persistent per = (Persistent) entity;
                        per.setId(rs.getLong(1));
                    }
                }
                return true;
            }

        } catch (SQLException e) {
            throw new DAOException("ERROR REGISTERING OBJECT", e);
        } finally {
            closeConnection(connection, stm, null);
        }
        return false;
    }

    @Override
    public void excluir(E value) throws DAOException {
        Connection connection = getConnection();
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(getQueryExclusion());
            setParametrosQueryExclusion(stm, value);
            int rowsAffected = stm.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("ERROR DELETING OBJECT ", e);
        } finally {
            closeConnection(connection, stm, null);
        }

    }

    @Override
    public void alterar(T entity) throws KeyTypeNotFoundException, DAOException {

        Connection connection = getConnection();
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(getQueryUpdate());
            setParametrosQueryUpdate(stm, entity);
            int rowsAffected = stm.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("ERROR ALTERING OBJECT ", e);
        } finally {
            closeConnection(connection, stm, null);
        }

    }

    @Override
    public T consultar(E value) throws MoreDeOneRecordException, TableException, DAOException {
        try {
            validarMaisDeUmRegistro(value);
            Connection connection = getConnection();
            PreparedStatement stm = connection.prepareStatement("SELECT * FROM " + getTableName() + " WHERE " + getNomeCampoChave(getClassType()) + " = ?");
            setParametrosQuerySelect(stm, value);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                T entity = getClassType().getConstructor(null).newInstance(null);
                Field[] fields = entity.getClass().getDeclaredFields();
                for (Field field : fields) {
                    if (field.isAnnotationPresent(ColumnTable.class)) {
                        ColumnTable column = field.getAnnotation(ColumnTable.class);
                        String dbName = column.dbName();
                        String javaSetName = column.setJavaName();
                        Class<?> classField = field.getType();
                        try {
                            Method method = entity.getClass().getMethod(javaSetName, classField);
                            setValueByType(entity, method, classField, rs, dbName);

                        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
                            throw new DAOException("ERRO CONSULTANDO OBJETO ", e);
                        } catch (TypeElementNotKnownException e) {
                            throw new DAOException("ERRO CONSULTANDO OBJETO ", e);
                        }
                    }
                }
                return entity;
            }

        } catch (SQLException | InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException | KeyTypeNotFoundException e) {
            throw new DAOException("ERRO CONSULTANDO OBJETO ", e);
        }
        return null;
    }

    public String getNomeCampoChave(Class clazz) throws KeyTypeNotFoundException {
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            if (field.isAnnotationPresent(KeyType.class)
                    && field.isAnnotationPresent(ColumnTable.class)) {
                ColumnTable coluna = field.getAnnotation(ColumnTable.class);
                return coluna.dbName();
            }
        }

        return null;
    }

    private void setValueByType(T entity, Method method, Class<?> classField, ResultSet rs, String fieldName) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, SQLException, TypeElementNotKnownException {

        if (classField.equals(Integer.class)) {
            Integer val = rs.getInt(fieldName);
            method.invoke(entity, val);
        } else if (classField.equals(Long.class)) {
            Long val = rs.getLong(fieldName);
            method.invoke(entity, val);
        } else if (classField.equals(Double.class)) {
            Double val = rs.getDouble(fieldName);
            method.invoke(entity, val);
        } else if (classField.equals(Short.class)) {
            Short val = rs.getShort(fieldName);
            method.invoke(entity, val);
        } else if (classField.equals(BigDecimal.class)) {
            BigDecimal val = rs.getBigDecimal(fieldName);
            method.invoke(entity, val);
        } else if (classField.equals(String.class)) {
            String val = rs.getString(fieldName);
            method.invoke(entity, val);
        } else {
            throw new TypeElementNotKnownException("TIPO DE CLASSE NÃO CONHECIDO: " + classField);
        }

    }

    private Object getValueByType(Class<?> typeField, ResultSet rs, String fieldName) throws SQLException, TypeElementNotKnownException {
        if (typeField.equals(Integer.TYPE)) {
            return rs.getInt(fieldName);
        } else if (typeField.equals(Long.TYPE)) {
            return rs.getLong(fieldName);
        } else if (typeField.equals(Double.TYPE)) {
            return rs.getDouble(fieldName);
        } else if (typeField.equals(Short.TYPE)) {
            return rs.getShort(fieldName);
        } else if (typeField.equals(BigDecimal.class)) {
            return rs.getBigDecimal(fieldName);
        } else if (typeField.equals(String.class)) {
            return rs.getString(fieldName);
        } else {
            throw new TypeElementNotKnownException("TIPO DE CLASSE NÃO CONHECIDO: " + typeField);
        }
    }

    private Long validarMaisDeUmRegistro(E value) throws MoreDeOneRecordException, TableException, KeyTypeNotFoundException, DAOException {
        Connection connection = getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        Long count = null;
        try {
            stm = connection.prepareStatement("SELECT count(*) FROM " + getTableName() + " WHERE " + getNomeCampoChave(getClassType()) + " = ?");
            setParametrosQuerySelect(stm, value);
            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getLong(1);
                if (count > 1) {
                    throw new MoreDeOneRecordException("ENCONTRADO MAIS DE UM REGISTRO DE " + getTableName());
                }
            }

            return count;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection, stm, rs);
        }
        return count;
    }

    protected void closeConnection(Connection connection, PreparedStatement stm, ResultSet rs) {
        try {
            if (rs != null && !rs.isClosed()) {
                rs.close();
            }
            if (stm != null && !stm.isClosed()) {
                stm.close();
            }
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
    }

    private String getTableName() throws TableException {
        if (getClassType().isAnnotationPresent(Table.class)) {
            Table table = getClassType().getAnnotation(Table.class);
            return table.value();
        } else {
            throw new TableException("TABELA NO TIPO " + getClassType().getName() + " NÃO FOI ENCONTRADA");
        }
    }

    @Override
    public Collection<T> buscarTodos() throws DAOException {
        List<T> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {

            connection = getConnection();
            stm = connection.prepareStatement("SELECT * FROM " + getTableName());
            rs = stm.executeQuery();
            while (rs.next()) {
                T entity = getClassType().getConstructor(null).newInstance(null);
                Field[] fields = entity.getClass().getDeclaredFields();
                for (Field field : fields) {
                    if (field.isAnnotationPresent(ColumnTable.class)) {
                        ColumnTable coluna = field.getAnnotation(ColumnTable.class);
                        String dbName = coluna.dbName();
                        String javaSetName = coluna.setJavaName();
                        Class<?> classField = field.getType();
                        try {
                            Method method = entity.getClass().getMethod(javaSetName, classField);
                            setValueByType(entity, method, classField, rs, dbName);

                        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
                            throw new DAOException("ERRO LISTANDO OBJETOS ", e);
                        } catch (TypeElementNotKnownException e) {
                            throw new DAOException("ERRO LISTANDO OBJETOS ", e);
                        }
                    }
                }
                list.add(entity);

            }

        } catch (SQLException | InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException | TableException e) {
            throw new DAOException("ERRO LISTANDO OBJETOS ", e);
        } finally {
            closeConnection(connection, stm, rs);
        }
        return list;
    }

    protected Connection getConnection() throws DAOException {
        try {
            return ConnectionFactory.getConnection();
        } catch (SQLException e) {
            throw new DAOException("ERRO ABRINDO CONEXAO COM O BANCO DE DADOS ", e);
        }
    }
}

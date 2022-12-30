package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import dao.generics.GenericDAO;
import domain.User;

/*
 *
 * @author leandro.amaral
 */
public class UserDAO extends GenericDAO<User, Long> implements IUserDAO {

    public UserDAO() {
        super();
    }

    @Override
    public Class<User> getTipoClasse() {
        return User.class;
    }

    @Override
    public void atualiarDados(User entity, User entityCadastrado) {
        entityCadastrado.setName(entity.getName());
        entityCadastrado.setCpf(entity.getCpf());
        entityCadastrado.setMobilePhone(entity.getMobilePhone());
        entityCadastrado.setEmail(entity.getEmail());
        entityCadastrado.setAddress(entity.getAddress());
        entityCadastrado.setNumber(entity.getNumber());
        entityCadastrado.setDistrict(entity.getDistrict());
        entityCadastrado.setCity(entity.getCity());
        entityCadastrado.setState(entity.getState());
        entityCadastrado.setCep(entity.getCep());
        entityCadastrado.setPassword(entity.getPassword());
        entityCadastrado.setLevel(entity.getLevel());
        entityCadastrado.setImage(entity.getImage());

    }

    @Override
    protected String getQueryInsercao() {
        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO TB_USERS ");
        sb.append("(NAME, CPF, MOBILEPHONE, EMAIL, ADDRESS, NUMBER, DISTRICT, CITY, STATE, CEP, PASSWORD, LEVEL, IMAGE)");
        sb.append("VALUES (?,?,?,?,?,?,?,?,?,?, ?, ?)");
        return sb.toString();
    }

    @Override
    protected void setParametrosQueryInsercao(PreparedStatement stmInsert, User entity) throws SQLException {
        stmInsert.setString(1, entity.getName());
        stmInsert.setString(2, entity.getCpf());
        stmInsert.setLong(3, entity.getMobilePhone());
        stmInsert.setString(4, entity.getEmail());
        stmInsert.setString(5, entity.getAddress());
        stmInsert.setLong(6, entity.getNumber());
        stmInsert.setString(7, entity.getDistrict());
        stmInsert.setString(8, entity.getCity());
        stmInsert.setString(9, entity.getState());
        stmInsert.setLong(10, entity.getCep());
        stmInsert.setString(11, entity.getPassword());
        stmInsert.setString(12, entity.getImage());

    }

    @Override
    protected String getQueryExclusao() {
        return "DELETE FROM TB_USERS WHERE CPF = ?";
    }

    @Override
    protected void setParametrosQueryExclusao(PreparedStatement stmExclusao, Long valor) throws SQLException {
        stmExclusao.setLong(1, valor);
    }

    @Override
    protected String getQueryAtualizacao() {
        StringBuilder sb = new StringBuilder();
        sb.append("UPDATE TB_USERS ");
        sb.append("SET NAME = ?,");
        sb.append("MOBILEPHONE = ?,");
        sb.append("EMAIL = ?,");
        sb.append("ADDRESS = ?,");
        sb.append("NUMBER = ?,");
        sb.append("DISTRICT = ?");
        sb.append("CITY = ?");
        sb.append("STATE = ?");
        sb.append("CEP = ?");
        sb.append("PASSWORD = ?");
        sb.append("IMAGE = ?");
        sb.append("WHERE CPF = ? ");
        return sb.toString();
    }

    @Override
    protected void setParametrosQueryAtualizacao(PreparedStatement stmUpdate, User entity) throws SQLException {
        stmUpdate.setString(1, entity.getName());
        stmUpdate.setString(2, entity.getCpf());
        stmUpdate.setLong(3, entity.getMobilePhone());
        stmUpdate.setString(4, entity.getEmail());
        stmUpdate.setString(5, entity.getAddress());
        stmUpdate.setLong(6, entity.getNumber());
        stmUpdate.setString(7, entity.getDistrict());
        stmUpdate.setString(8, entity.getCity());
        stmUpdate.setString(9, entity.getState());
        stmUpdate.setLong(10, entity.getCep());
        stmUpdate.setString(11, entity.getPassword());
        stmUpdate.setString(12, entity.getImage());
    }

    @Override
    protected void setParametrosQuerySelect(PreparedStatement stmSelect, Long valor) throws SQLException {
        stmSelect.setLong(1, valor);
    }

}

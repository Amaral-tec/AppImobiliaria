package dao.generics;

import java.util.Collection;

import domain.Persistent;
import exceptions.DAOException;
import exceptions.KeyTypeNotFoundException;
import exceptions.MoreDeOneRecordException;
import exceptions.TableException;

import java.io.Serializable;
import java.util.Collection;

/*
 *
 * @author leandro.amaral
 *
 * Interface genérica para métodos de CRUD(Create, Read, Update and Delete)
 */
public interface IGenericDAO <T extends Persistent, E extends Serializable> {

    /**
     * Método para cadastrar novos registro no banco de dados
     *
     * @param entity a ser cadastrado
     * @return retorna verdadeiro para cadastrado e falso para não cadastrado
     */
    public Boolean cadastrar(T entity) throws KeyTypeNotFoundException, DAOException;

    /**
     * Método para excluir um registro do banco de dados
     *
     * @param valor chave única do dado a ser excluído
     */
    public void excluir(E valor) throws DAOException;

    /**
     *Método para alterar um registro no bando de dados.
     *
     * @param entity a ser atualizado
     */
    public void alterar(T entity) throws KeyTypeNotFoundException, DAOException;

    /**
     * Método para consultar um registro no banco de dados
     *
     * @param valor chave única do dado a ser consultado
     * @return
     * @throws MaisDeUmRegistroException 
     * @throws TableException 
     */
    public T consultar(E valor) throws MoreDeOneRecordException, TableException, DAOException;

    /**
     * Método que irá retornar todos os registros do banco de dados de uma determinado dado ou tabela
     *
     * @return Registros encontrados
     * @throws DAOException 
     */
    public Collection<T> buscarTodos() throws DAOException;
}
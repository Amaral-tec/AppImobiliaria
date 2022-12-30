package test;

import static org.junit.Assert.assertTrue;

import java.util.Collection;

import org.junit.Assert;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

import dao.IUserDAO;
import dao.UserDAO;
import domain.User;
import exceptions.DAOException;
import exceptions.InvalidDataException;
import exceptions.KeyTypeNotFoundException;
import exceptions.MoreDeOneRecordException;
import exceptions.TableException;

/**
 *
 * @author leandro.amaral
 */
public class UserDAOTest {

    private IUserDAO userDao;

    public UserDAOTest() {
        userDao = new UserDAO();
    }

    @Before
    public void init() throws KeyTypeNotFoundException {
        User user = new User();
        user.setName("Fulano de Tal");
        user.setCpf(12345678912L);
        user.setMobilePhone(84999992222L);
        user.setEmail("teste@email.com");
        user.setAddress("Rua teste");
        user.setNumber(1);
        user.setDistrict("District");
        user.setCity("City");
        user.setState("State");
        user.setCep(50000000L);
        user.setPassword("123");
        user.setPhoto("link");

        userDao.cadastrar(user);
    }

    @After
    public void end() throws DAOException {
        Collection<User> list = userDao.buscarTodos();
        list.forEach(use -> {
            try {
                userDao.excluir(use.getCpf());
            } catch (DAOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        });
    }

    @Test
    public void pesquisarUser() throws MoreDeOneRecordException, TableException, KeyTypeNotFoundException, DAOException {
        User userConsultado = userDao.consultar(user.getCpf());
        Assert.assertNotNull(userConsultado);
    }

    @Test
    public void salvarUser() throws KeyTypeNotFoundException {
        Boolean retorno = userDao.cadastrar(user);
        Assert.assertTrue(retorno);
    }

    @Test
    public void excluirUser() {
        userDao.excluir(user.getCpf());
    }

    @Test
    public void alterarUser() throws KeyTypeNotFoundException {
        user.setName("Fulano de Tal da Silva");
        user.setCpf(12345678912L);
        user.setMobilePhone(84999992222L);
        user.setEmail("testealteracao@email.com");
        user.setAddress("Rua Teste Alteracao");
        user.setNumber(1);
        user.setDistrict("Teste Alteracao");
        user.setCity("Teste Alteracao");
        user.setState("Teste Alteracao");
        user.setCep(50000000L);
        user.setPassword("123");
        user.setPhoto("link");

        userDao.alterar(user);
        Assert.assertEquals("Fulano de Tal da Silva", user.getName());
    }
}

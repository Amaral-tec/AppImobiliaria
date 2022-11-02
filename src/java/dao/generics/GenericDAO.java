
package dao.generics;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import exceptions.KeyTypeNotFoundException;
import domain.Persistent;
import annotation.KeyType;

/**
 *
 * @author leandro.amaral
 */
/**
 * @author leandro.amaral
 *
 * Classe genérica que implementa interface genérica com os métodos de CRUD
 **/

public abstract class GenericDAO<T extends Persistent, E extends Serializable> implements IGenericDAO<T,E> {

    /**
     * Necessário utilizar Singleton para ter apenas um MAP no sistema
     */
    private SingletonMap singletonMap;

    public abstract Class<T> getTipoClasse();

    public abstract void atualiarDados(T entity, T entityCadastrado);

    public GenericDAO() {
        this.singletonMap = SingletonMap.getInstance();
    }

    public E getChave(T entity) throws KeyTypeNotFoundException {
        Field[] fields = entity.getClass().getDeclaredFields();
        E returnValue = null;
        for (Field field : fields) {
            if (field.isAnnotationPresent(KeyType.class)) {
                KeyType tipoChave = field.getAnnotation(KeyType.class);
                String nomeMetodo = tipoChave.value();
                try {
                    Method method = entity.getClass().getMethod(nomeMetodo);
                    returnValue = (E) method.invoke(entity);
                    return returnValue;
                  //Criar exception de negócio TipoChaveNaoEncontradaException
                } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
                    e.printStackTrace();
                    throw new KeyTypeNotFoundException("Chave principal do objeto " + entity.getClass() + " não encontrada", e);
                }
            }
        }
        if (returnValue == null) {
            String msg = "Chave principal do objeto " + entity.getClass() + " não encontrada";
            System.out.println("**** ERRO ****" + msg);
            throw new KeyTypeNotFoundException(msg);
        }
        return null;
    }

  
  /*  public Boolean cadastrar(T entity) throws KeyTypeNotFoundException {
        Map<E, T> mapaInterno = getMapa();
        E chave = getChave(entity);
        if (mapaInterno.containsKey(chave)) {
            return false;
        }

        mapaInterno.put(chave, entity);
        return true;
    } */

	private Map<E, T> getMapa() {
		Map<E, T> mapaInterno = (Map<E, T>) this.singletonMap.getMap().get(getTipoClasse());
		if (mapaInterno == null) {
			mapaInterno = new HashMap<>();
			this.singletonMap.getMap().put(getTipoClasse(), mapaInterno);
		}
		return mapaInterno;
	}

    @Override
    public void excluir(E valor) {
        Map<E, T> mapaInterno = getMapa();
        T objetoCadastrado = mapaInterno.get(valor);
        if (objetoCadastrado != null) {
            mapaInterno.remove(valor, objetoCadastrado);
        }
    }

    @Override
    public void alterar(T entity) throws KeyTypeNotFoundException {
        Map<E, T> mapaInterno = getMapa();
        E chave = getChave(entity);
        T objetoCadastrado = mapaInterno.get(chave);
        if (objetoCadastrado != null) {
            atualiarDados(entity, objetoCadastrado);
        }
    }

    @Override
    public T consultar(E valor) {
        Map<E, T> mapaInterno = getMapa();
        return mapaInterno.get(valor);
    }

    @Override
    public Collection<T> buscarTodos() {
        Map<E, T> mapaInterno = getMapa();
        return mapaInterno.values();
    }
}

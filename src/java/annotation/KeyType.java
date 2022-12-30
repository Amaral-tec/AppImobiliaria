package annotation;

import java.lang.annotation.*;

/**
 *
 * @author leandro.amaral
 */
@Documented
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)

public @interface KeyType {

    String value();
}

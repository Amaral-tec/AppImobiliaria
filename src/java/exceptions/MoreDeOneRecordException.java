package exceptions;

/**
 *
 * @author leandro.amaral
 */
public class MoreDeOneRecordException extends Exception {

    private static final long serialVersionUID = -7509649433607067138L;

    public MoreDeOneRecordException(String msg) {
        super(msg);
    }
}

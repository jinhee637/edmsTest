package kr.co.kibi.edms.com;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

public class KibiComExcepHndlr implements ExceptionHandler {

    protected Log log = LogFactory.getLog(this.getClass());

    /**
     * 발생된 Exception을 처리한다.
     */
    public void occur(Exception ex, String packageName) {
	//log.debug(" EgovServiceExceptionHandler run...............");
	try {
	    //mailSender. send(ex, packageName);
	    //log.debug(" sending a alert mail  is completed ");
	    log.error(packageName, ex);
	    ex.printStackTrace();
	} catch (Exception e) {
	    //e.printStackTrace();
		log.fatal(packageName, ex);// 2011.10.10 보안점검 후속조치
	    //throw new RuntimeException(ex);	
	}
    }
}

package mypackage;

import org.junit.Test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;

import static org.junit.Assert.assertEquals;

public class HelloworldServletTest {

    private HelloworldServlet servlet;

    
    private HttpServletRequest request;

    
    private HttpServletResponse response;

    
    public void setUp() throws Exception {        
        servlet = new HelloworldServlet();        		
    }

    @Test
    public void testDoGet() throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        PrintWriter writer = new PrintWriter(out);       

        servlet.doGet(request, response);
        assertEquals("Hello", new String( out.toByteArray(), "UTF-8"));
    }
}
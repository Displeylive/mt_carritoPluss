
package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ProcesaServlet", urlPatterns = {"/ProcesaServlet"})
public class ProcesaServlet extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String op = request.getParameter("op");
            
            if (op.equals("vaciar")){

       //obtener acceso al objeto session
        HttpSession ses = request.getSession();
       // se elimina la session
       ses.invalidate();
       //trasfiere el control de index.jsp
       response.sendRedirect("index.jsp");
        }
         if (op.equals("eliminar")){
                int pos =-1;
                int buscado=-1;
                
               int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses = request.getSession();
        ArrayList<Productos> lista= (ArrayList<Productos>)ses.getAttribute("almacen");
                
                for (Productos p : lista){
                    pos++;
                    if(p.getId() == id){
                        buscado = pos;
                    }
                }
                lista.remove(buscado);
                response.sendRedirect("index.jsp");
         }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         // recupera el rpoducto desde el formulario
       int id = Integer.parseInt(request.getParameter("id"));
       String producto = request.getParameter("producto");
       int cantidad = Integer.parseInt(request.getParameter("cantidad"));
       double precio = Double.parseDouble(request.getParameter("precio"));
        
       Productos prod = new Productos();
        prod.setId(id);
        prod.setProducto(producto);
        prod.setCantidad(cantidad);
        prod.setPrecio(precio);
        
       //se optiene el acesso ala session
        HttpSession ses = request.getSession();
         // se optiene la lista que esta como atributo de session
        ArrayList<Productos> lista= (ArrayList<Productos>)ses.getAttribute("almacen");
        // A la coleccion  se adiciona  el elento producto
        lista.add(prod);
        //se redirecciona a index.jsp
        response.sendRedirect("index.jsp");
    }

    
}

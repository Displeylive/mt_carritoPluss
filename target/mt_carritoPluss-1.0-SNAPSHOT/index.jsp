<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Productos"%>
<%
    // verifica si existe la coneccion dl abjeto session
    if(session.getAttribute("almacen")== null){
    //inicialisar la lista auxiliar
    ArrayList<Productos> lisaux= new ArrayList<Productos>();
    //creando con una coleccio vacia
    session.setAttribute("almacen",lisaux);

    }
    // se obtiene la coleccion lista que esta como atributo de session
   ArrayList<Productos> almacen = (ArrayList<Productos>)session.getAttribute("almacen");
   
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>GRAN CARRITO DE COMPRAS!! MT 2</h1>
        <form action="ProcesaServlet" method="POST">
            <table>
               
                    <tr>
                        <td>ID</td>
                        <td><input required type="text" name="id" value="0"></td>
                    </tr>
                    <tr>
                        <td>PRODUCTO</td>
                        <td><input required type="text" name="producto" value=""></td>
                    </tr>
                    <tr>
                        <td>CAMTIDAD</td>
                        <td><input required type="text" name="cantidad" value="0"></td>
                    </tr>
                    <tr>
                        <td>PRECIO</td>
                        <td><input required type="text" name="precio" value="0"></td>
                    </tr>
                     <br>
                     <tr>
                        <td></td>
                        <td> <input type="submit" value="Procesar"></td>
                    </tr>
            </table>
        </form>
        <br>
        <a href="ProcesaServlet?op=vaciar">VACIAR EL CARRITO</a>
        <h2>CONTENIDO DEL CARRITO</h2>
        <h3>listado de productos insertados</h3>
        <table border="1">
            <tr>
            <td>ID</th>
            <th>PRODUCTO</th>
            <th>CANTIDAD</th>
            <th>PRECIO</th>
            <th></th>
            </tr>
            <%
               if (almacen != null){
            for (Productos p : almacen){
            out.print("<li>"+ p +"</li>");
            %>
            <tr>
            <td><%= p.getId() %></th>
            <th><%= p.getProducto() %></th>
            <th><%= p.getCantidad() %></th>
            <th><%= p.getPrecio() %></th>
            <th><a href="ProcesaServlet?op=eliminar&id=<%= p.getId()%>">eliminar</a></th>
            </tr>
            <%
                }
                }
            %>
        </table>
    </body>
</html>

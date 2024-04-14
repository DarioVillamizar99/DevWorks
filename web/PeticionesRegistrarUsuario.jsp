<%-- 
    Document   : PeticionesRegistrarUsuario
    Created on : 26/03/2024, 11:51:56 a. m.
    Author     : Usuario
--%>

<%@page import="Java.Logica.Usuario_dao"%>
<%@page import="Java.Logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String respuesta = "{";

    List<String> tareas = Arrays.asList(new String[]{
        "iniciarSesion",
        "cerrarSesion",
        "guardarUsuario",});

    String proceso = "" + request.getParameter("proceso");

    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";

        if (proceso.equals("iniciarSesion")) {
            String Nombre_usu = request.getParameter("Nombre_usu");
            String Contrasena = request.getParameter("Contrasena");
            Usuario u = new Usuario_dao().validarUsu(Nombre_usu, Contrasena);
            //System.out.println(u.getNombre_usu() + Nombre_usu);
            if (Nombre_usu.equals(u.getNombre_usu())) {
                respuesta += "\"" + proceso + "\":true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        } else if (proceso.equals("cerrarSesion")) {
            session.invalidate();
            respuesta += "\"" + proceso + "\":true";
        } else if (proceso.equals("guardarUsuario")) {
            String Nombre = request.getParameter("Nombre");
            String Nombre_usu = request.getParameter("Nombre_usu");
            String Contrasena = request.getParameter("Contrasena");
            String Direccion = request.getParameter("Direccion");
            Usuario_dao r = new Usuario_dao();
            if (r.Registrar (Nombre,Nombre_usu,Contrasena, Direccion)) {
                respuesta += "\"" + proceso + "\":true";
            } else {
                respuesta += "\"" + proceso + "\"false";
            }
        } else if (proceso.equals("cerrarSesion")) {
            session.invalidate();
            respuesta += "\"" + proceso + "\": true";
        }
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }

    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);

%>
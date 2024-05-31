<%-- 
    Document   : PeticionesSalas
    Created on : 28/05/2024, 8:56:45 p. m.
    Author     : Usuario
--%>

<%@page import="Java.Logica.Salasdao"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String respuesta = "{";

    List<String> tareas = Arrays.asList(new String[]{
        "registrarSala",
        "actualizarSala",
        "eliminarSala",});

    String proceso = "" + request.getParameter("proceso");

    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        //declaro las variables a utilizar en los metodos
        String Nombre = request.getParameter("Nombre");
        String numMesaStr = request.getParameter("Num_mesa");
        int Num_mesa = 0;
        try {
            Num_mesa = Integer.parseInt(numMesaStr);
        } catch (NumberFormatException e) {
            respuesta += "\"error\": \"Numero de mesa invalido\",";
        }

        String idSalaStr = request.getParameter("idSala");
        int idSala = 0;

        try {
            idSala = Integer.parseInt(idSalaStr);
        } catch (NumberFormatException e) {
            respuesta += "\"error\": \"ID de sala invalido\",";
        }
        Salasdao s = new Salasdao();

        if (proceso.equals("registrarSala")) {
            if (s.insertarSala(Nombre, Num_mesa)) {
                respuesta += "\"" + proceso + "\":true";
            } else {
                respuesta += "\"" + proceso + "\"false";
            }
        } else if (proceso.equals("actualizarSala")) {
            if (s.Modificar(idSala, Nombre, Num_mesa)) {
                respuesta += "\"" + proceso + "\":true";
            } else {
                respuesta += "\"" + proceso + "\":false";
            }
        } else if (proceso.equals("eliminarSala")) {
            if (s.Eliminar(idSala)) {
                respuesta += "\"" + proceso + "\":true";
            } else {
                respuesta += "\"" + proceso + "\":false";
            }
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

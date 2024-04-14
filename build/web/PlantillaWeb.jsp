<%-- 
    Document   : PlantillaWeb
    Created on : 7/04/2024, 3:51:38 p. m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><%= request.getParameter("titulo")%></title> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- Font Awesome -->
        <link rel="stylesheet" href="CSS/PlantillaWeb.css">
    </head>
    <body>
        <div class="column left">
            <div class="sidebar">
                <div class="logo">
                    <!-- Inserta aquí el logo del negocio -->
                    <button id="boton-logo" onclick="location.href = 'Principal.jsp'">
                        <image id="logoF" src="IMG/Logo_friends.png.png" alt="Logo">
                    </button>
                </div>
                <ul class="menu">
                    <li><a href="#"><i class="fas fa-shopping-cart"></i> Nueva Venta</a></li>
                    <li><a href="Salas.jsp"><i class="fas fa-couch"></i> Salas</a></li>
                    <li><a href="#"><i class="fas fa-ellipsis-h"></i> Opción 3</a></li>
                    <li><a href="#"><i class="fas fa-ellipsis-h"></i> Opción 4</a></li>
                    <li><a href="#"><i class="fas fa-ellipsis-h"></i> Opción 5</a></li>
                </ul>
            </div>
        </div>
        <div class="content ">
            <div class="header">
                <div class="user-actions">
                    <a href="#"><i class="fas fa-user"></i> Actualizar Perfil</a>
                    <a href="#"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
                </div>
            </div>
        </div>
    </body>
</html>

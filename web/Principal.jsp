<%-- 
    Document   : prueba
    Created on : 2/04/2024, 8:36:59 p. m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Principal</title> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="CSS/Principal.css"> 
    </head>
    <body>

        <%@include file="PlantillaWeb.jsp" %>

        <div class="container-principal">
            <div class="welcome-section">
                <h2>¡Bienvenido nuevamente!</h2>
                <p>¡Que tengas un día lleno de éxitos y motivación!</p>
            </div>
            
            <div class="container-carousel">
                <div class="carruseles" id="slider">
                    <section class="slider-section">
                        <img src="IMG/imagen1.jpg">
                    </section>
                    <section class="slider-section">
                        <img src="IMG/imagen2.jpg">
                    </section>
                    <section class="slider-section">
                        <img src="IMG/imagen3.jpg">
                    </section>
                </div>
                <div class="btn-left">
                    <i class='bx bx-chevron-left'></i>
                </div>
                <div class="btn-right">
                    <i class='bx bx-chevron-right'></i>
                </div>
            </div>
        </div>

        <script src="JS/carrusel.js"></script>

    </body>
</html>

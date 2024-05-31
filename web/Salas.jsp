<%-- 
    Document   : Salas
    Created on : 7/04/2024, 3:47:20 p. m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <title><%= request.getParameter("titulo")%></title> 
        <link rel="stylesheet" href="CSS/Salas.css">
    </head>
    <body>

        <%@include file="PlantillaWeb.jsp" %>

        <div class="container-pr" ng-app="salasController" ng-controller="salasController as sc1">

            <div class="container-agregar">
                <div class="content-sala">
                    <h2 class="titulo">Nueva sala</h2>
                    <div class="form-group">
                        <label for="nombre_sala">Nombre de la Sala:</label>
                        <input type="text" id="nombre_sala" name="nombre_sala" required ng-model="sc1.nombre_sala">
                    </div>
                    <div class="form-group">
                        <label for="nombre_sala">Numero de mesas:</label>
                        <input type="number" id="num_mesa" name="num_mesa" required ng-model="sc1.num_mesa">
                    </div>
                    <div class="botones">
                        <ul class="btn">
                            <li><button ng-click="sc1.validar()">Registrar</button></li>
                            <li><button ng-click="sc1.actualizarSala()"> Actualizar</button></li>
                            <li><button>Eliminar</button>
                        </ul>
                    </div>
                </div> 
            </div>

            <div class="container-mostrar">
                <div class="content-sala">
                    <h2 class="titulo"> Salas registradas</h2>
                    <table>
                        <tr>
                            <td>Id</td>
                            <td>Nombre</td>
                            <td>Número de mesas</td>
                        </tr>
                        <tr></tr>
                    </table>

                </div>
            </div>
        </div>

        <script>
            var app = angular.module('salasController', []);
            app.controller('salasController', ['$http', controladorSalas]);

            function controladorSalas($http) {
                var sc1 = this;

                sc1.registrarSala = function () {
                    var parametros = {
                        proceso: 'registrarSala',
                        Nombre: sc1.nombre_sala,
                        Num_mesa: sc1.num_mesa
                    };

                    $http({
                        method: 'POST',
                        url: 'PeticionesSalas.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.registrarSala === true) {
                                window.location.href = "Salas.jsp";
                            } else {
                                alert('No se pudo registrar la sala.');
                            }
                        } else {
                            alert(res.data.errorMag);
                        }
                    });
                };

                sc1.validar = function () {
                    if (!sc1.nombre_sala || !sc1.num_mesa) {
                        alert('Por favor, llenar todos los campos');
                    } else {
                        sc1.registrarSala();
                    }
                };

                sc1.actualizarSala = function () {
                    var parametros = {
                        proceso: 'actualizarSala',
                        Nombre: sc1.nombre_sala,
                        Num_mesa: sc1.num_mesa
                    };
                    $http({
                        method: 'POST',
                        url: 'PeticionesSalas.jsp',
                        paramas: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.actualizarSala === true) {
                                window.location.href = "Salas.jsp";
                            } else {
                                alert('No se pudo registrar la sala.');
                            }
                        } else {
                            alert(res.data.errorMag);
                        }
                    });
                }
            }
        </script>
    </body>
</html>

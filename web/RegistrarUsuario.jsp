<%-- 
    Document   : RegistrarUsuario
    Created on : 26/03/2024, 9:51:11 a. m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registra Usuario</title>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/RegistroUsuario.css">
        
    </head>
    <section>
        <form>
            <div class="container" ng-app="cont1" ng-controller="c1Cont as c1">
                <h2>Registro de Usuario</h2>
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" required ng-model="c1.nom">
                </div>
                <div class="form-group">
                    <label for="nombre_usuario">Nombre de Usuario:</label>
                    <input type="text" id="nombre_usuario" name="nombre_usuario" required ng-model="c1.nom_usu">
                </div>
                <div class="form-group">
                    <label for="contrasena">Contraseña:</label>
                    <input type="password" id="contrasena" name="contrasena" required ng-model="c1.contra1">
                </div>
                <div class="form-group">
                    <label for="confirmar_contrasena">Confirmar Contraseña:</label>
                    <input type="password" id="confirmar_contrasena" name="confirmar_contrasena" required ng-model="c1.contra2">
                </div>
                <div class="form-group">
                    <label for="direccion">Dirección:</label>
                    <input type="text" id="direccion" name="direccion" ng-model="c1.dire">
                </div>
                <button type="button" class="btn btn-primary" ng-click="c1.validar()">Registrarse</button>
            </div>
        </form>
    </section>

    <script>
        var app = angular.module('cont1', []);
        app.controller('c1Cont', ['$http', Contc1]);
        function Contc1($http) {
            var c1 = this;
            registrar = function () {
                var parametros = {
                    proceso: 'guardarUsuario', //proceso que se quiere hacer, se encuentra en las peticiones 
                    Nombre: c1.nom,
                    Nombre_usu: c1.nom_usu,
                    Contrasena: c1.contra1,
                    Direccion: c1.dire
                };
                $http({
                    method: 'POST',
                    url: 'PeticionesRegistrarUsuario.jsp', // url del archivo de las peticiones .jsp
                    params: parametros
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data.guardarUsuario === true) {
                            alert('Se guardo correctamente');
                            window.location.href = "index.html";
                        } else {
                            alert('No se guardo el usuario');
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }

                });
            };

            c1.validar = function () {
                if (c1.nom === undefined || c1.nom_usu === undefined || c1.contra1 === undefined || c1.contra2 === undefined || direccion === undefined) {
                    alert('Llenar todos los campos');
                } else {
                    if (c1.contra1 === c1.contra2) {
                        registrar();
                    } else {
                        alert("Las contraseñas no coinsiden");
                    }
                }
            };
        }

    </script>
</html>

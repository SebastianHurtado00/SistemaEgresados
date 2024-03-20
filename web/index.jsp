<%-- 
    Document   : index
    Created on : 10/12/2023, 12:05:05 PM
    Author     : ASUS
--%>

<html lang="en">
    <head>
        <title>Inicio sesion</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS v5.2.1 -->

        <link rel="stylesheet" href="CSS/Login.css">
        <link rel="stylesheet" href="CSS/Footer.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="JS/main.js"></script>

    </head>

    <body style="background-color: #f5f5f5;">

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">

                    <form method="post" action="purueba" class="login100-form">
                        <img class="mb-4"src="IMG/Logo_Sena_Sin_Fondo.png" width="50%" height="20%" alt="alt" style="margin-left: 55%"/>
                        <span class="login100-form-title p-b-43 mb-5">
                            Inicio de sesion
                        </span>

                        <div class="wrap-input100 validate-input mt-3 mb-4">
                            <input class="input100" type="number" maxlength="99999999999" name="" placeholder="Usuario">
                        </div>
                        <div class="wrap-input100 validate-input mb-4">
                            <input class="input100" type="password" maxlength="200" name="pass" placeholder="Password">                        
                        </div>

                        <div class="flex-sb-m w-full p-t-3 p-b-32 mb-4">
                            <div>
                                <a href="#" class="txt1">
                                    ¿Olvido su contraseña?
                                </a>
                            </div>
                        </div>


                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Inicio de sesion
                            </button>
                        </div>

                    </form>
                    <div class="login100-more" style="background-image: url('https://agenciapublicadeempleo.sena.edu.co/imgLayout/Boletines%20de%20prensa/_DSC0302.jpg');">
                    </div>
                </div>
            </div>
        </div>

        <footer style="max-height: 160px; font-family: monospace; background-color: #35C35D">
            <div class="container-fluid">
                <!--Row Principal-->
                <div class="row">
                    <!--Primera Columna-->
                    <div class="col-md-4" id="redes">
                        <!--Rows Internos-->
                        <div class="row col-md-12" style="margin-left: 15px;">
                            <a href="https://github.com/SebastianHurtado00" target="_blank" style="color: white; font-family: serif;">
                                <label class="form-label mt-3"> <img src="IMG/github.png" alt="" style="width: 25px;">
                                    GitHub</a></label>
                        </div>
                        <div class="row col-md-12" style="margin-left: 15px;">
                            <a href="https://www.linkedin.com/in/sebastian-hurtado-72a564267/" target="_blank" style="color: white;">
                                <label class="form-label mt-3"> <img src="IMG/linkedin.png" alt="linkedin" style="width: 25px;"> Linkedid
                                </label>
                            </a>
                        </div>
                        <!--https://www.instagram.com/sebastian_hurtado86/-->
                        <div class="row" style="margin-left: 15px;">
                            <a href="https://www.instagram.com/sebastian_hurtado86/?next=%2F" target="_blank" style="color: white;">
                                <label class="form-label mt-3"> <img src="IMG/instagram.png" alt="" style="width: 25px;"> Instagram</label>
                            </a>
                        </div>
                    </div>
                    <!--Segunda Columna-->
                    <div class="col-md-4 d-flex align-items-center justify-content-center mt-3">
                        <p class="contact-info" style="margin-left: 10%; color: white; font-family: monospace"> &copy; By Sebastian Navaja - Crystian Peralta
                            <br>
                            Teléfono: +57 310 299 5093
                            <!-- Esto evitará que el salto de línea se aplique en dispositivos más pequeños -->
                            Email: slnavaja@soy.sena.edu.co
                        </p>
                    </div>

                    <!--Columna Logo Personal-->
                    <div class="col-md-4 mt-5" id="logoPersonal">
                        <div class="col-md-4">
                            <img src="IMG/letra-n.png" alt="Descripción de la imagen"
                                 style="width: 70px; margin-top: 10; margin-left: 200%;">
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>

</html>

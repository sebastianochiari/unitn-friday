<!DOCTYPE html>
<html lang="it">

<!--
    Friday - Shopping List Manager
    Copyright (C) 2018 Tommaso Bosetti, Sebastiano Chiari, Leonardo Remondini, Marta Toniolli
-->

<!-- @author: Sebastiano Chiari -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Friday</title>

    <link rel="shortcut icon" type="image/png" href="images/favicon.png">

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <!-- Slick -->
    <link rel="stylesheet" type="text/css" href="slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />

</head>

<body id="top">
    
    <!-- HEADER -->
    <jsp:include page="jsp/components/header.jsp" />

    <!-- START: parte principale -->
    <main>

        <!-- section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside widget -->
                        <div class="aside">

                            <h3 class="aside-title">Le mie liste:</h3>
                            <ul class="list-links">
                                <li><a href="#">Lista #1</a></li>
                                <li><a href="#">Lista #2</a></li>
                                <li class="active"><a href="#">Gestisci liste</a></li>
                            </ul>

                            <h3 class="aside-title">Liste condivise:</h3>
                            <p>Non hai nessuna lista condivisa</p>
                            <ul class="list-links">
                                <li><a href="#">Lista #1</a></li>
                                <li><a href="#">Lista #2</a></li>
                            </ul>

                        </div>

                    </div>

                    <!-- START: main -->
                    <div id="main" class="col-md-9">

                        <!-- START: list -->
                        <div id="list">
                            
                            <h4>Gestione Liste</h4>
                            <p>
                                Tramite questa pagina, potrai gestire comodamente tutte le tue liste, sia quelle personali che quelle che altri utenti hanno condiviso con te
                            </p>
                            <p>
                                <a href="#" class="text-link">Clicca qui</a> nel caso tu voglia creare una nuova lista
                            </p>
                            
                            <h5>
                                Liste personali
                            </h5>
                            <table class="table table-striped table-borderless">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;" scope="col">#</th>
                                        <th scope="col">Nome lista</th>
                                        <th scope="col">Categoria di lista</th>
                                        <th style="text-align: center;" scope="col">Condivisa</th>
                                        <th style="text-align: center;" scope="col">Elimina</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th style="text-align: center;" scope="row">1</th>
                                        <td>Scuola Giovanni</td>
                                        <td>Scuola</td>
                                        <td style="text-align: center;">
                                            <i class="fas fa-check"></i>
                                        </td>
                                        <td style="text-align: center;">
                                            <a href="#" title="Elimina questa lista">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="text-align: center;" scope="row">2</th>
                                        <td>Lasagne</td>
                                        <td>Alimentari</td>
                                        <td style="text-align: center;">
                                            <i class="fas fa-times"></i>
                                        </td>
                                        <td style="text-align: center;">
                                            <a href="#" title="Elimina questa lista">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="text-align: center;" scope="row">3</th>
                                        <td>Beer Pong</td>
                                        <td>Alcolici</td>
                                        <td style="text-align: center;">
                                            <i class="fas fa-times"></i>
                                        </td>
                                        <td style="text-align: center;">
                                            <a href="#" title="Elimina questa lista">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            
                            <h5 class="mt-5">
                                Liste condivise
                            </h5>
                            <table class="table table-striped table-borderless">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;" scope="col">#</th>
                                        <th scope="col">Nome lista</th>
                                        <th scope="col">Categoria di lista</th>
                                        <th style="text-align: center;" scope="col">Esci</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th style="text-align: center;" scope="row">1</th>
                                        <td>Scuola Giovanni</td>
                                        <td>Scuola</td>
                                        <td style="text-align: center;">
                                            <a href="#">
                                                <i class="fas fa-sign-out-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="text-align: center;" scope="row">2</th>
                                        <td>Lasagne</td>
                                        <td>Alimentari</td>
                                        <td style="text-align: center;">
                                            <a href="#">
                                                <i class="fas fa-sign-out-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="text-align: center;" scope="row">3</th>
                                        <td>Beer Pong</td>
                                        <td>Alcolici</td>
                                        <td style="text-align: center;">
                                            <a href="#">
                                                <i class="fas fa-sign-out-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            
                        
                        </div>
                        <!-- END: list -->
                    
                    </div>
                    <!-- END: main -->
                
                </div>
            
            </div>
        
        </div>

    </main>
    <!-- END: parte principale -->

    <!-- Footer -->
    <jsp:include page="jsp/components/footer.jsp" />



    <!-- JS Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    <!-- slick JS -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.zoom.min.js"></script>
    <script type="text/javascript" src="slick/slick.min.js"></script>

    <!-- personal JS -->
    <script type="text/javascript" src="js/main.js"></script>

</body>

</html>

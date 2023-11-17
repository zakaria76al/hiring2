<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Hiring.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>ML Hiring</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="static/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/owl.carousel.min.css">
    <link rel="stylesheet" href="static/css/magnific-popup.css">
    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/css/themify-icons.css">
    <link rel="stylesheet" href="static/css/nice-select.css">
    <link rel="stylesheet" href="static/css/flaticon.css">
    <link rel="stylesheet" href="static/css/gijgo.css">
    <link rel="stylesheet" href="static/css/animate.css">
    <link rel="stylesheet" href="static/css/slick.css">
    <link rel="stylesheet" href="static/css/slicknav.css">
    <link rel="stylesheet" href="static/css/style.css">
    <link rel="stylesheet" type="text/css" href="static/css/hirringform.css">
    <style type="text/css">
        .invalid {
            background-color: white !important;
            border-bottom: 1px solid red !important;
        }

        label {
            margin-bottom: .1rem;
        }

        input {
            font-family: "Helvetica","Arial",sans-serif !important;
        }
    </style>
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
</head>
<body>
    <header>
        <div class="header-area ">
            
            <div id="sticky-header" class="main-header-area">
                <div class="container">
                    <div class="header_bottom_border">
                        <div class="row align-items-center justify-content-between">
                            <div class="col-xl-3 col-lg-2">
                                <div class="logo">
                                    <a href="index.aspx">
                                        <img style="height: 35px;" src="static/img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-7">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a class="active" href="index.aspx">home</a></li>
                                            <li><a href="offres.aspx">Offres</a></li>
                                            <li><a href="hiring.aspx">Hirring</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </header>

    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider  d-flex align-items-center slider_bg_1 overlay2">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="slider_text ">
                                <h3>Gestion d'embauche à base de Machine Learning</h3>
                                <div class="video_service_btn">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider  d-flex align-items-center slider_bg_2 overlay2">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="slider_text ">
                                <h3>Gestion d'embauche à base de Machine Learning</h3>
                                <div class="video_service_btn">
                                    <!--a href="#" class="boxed-btn3">A propos</a-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider  d-flex align-items-center slider_bg_1 overlay2">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="slider_text ">
                                <h3>Gestion d'embauche à base de Machine Learning</h3>
                                <div class="video_service_btn">
                                    <!--a href="#" class="boxed-btn3">A propos</a-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider  d-flex align-items-center slider_bg_2 overlay2">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="slider_text ">
                                <h3>Gestion d'embauche à base de Machine Learning</h3>
                                <div class="video_service_btn">
                                    <!--a href="#" class="boxed-btn3">A propos</a-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider_area_end -->

    <!-- service_area_start -->
    <div class="service_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title text-center mb-50">
                        <h3>A propos du projet</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="single_service text-center">
                        <div class="service_icon">
                            <img src="static/img/svg_icon/2.svg" alt="">
                        </div>
                        <h3>Gestion d'embauche</h3>
                        <p>Creation des offres d'emplois</p>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="single_service text-center">
                        <div class="service_icon">
                            <img src="static/img/svg_icon/1.svg" alt="">
                        </div>
                        <h3>Selection automatique des candidats</h3>
                        <p>Après la clôturation de chaque offre un modèle Machine Learning se charge à prendre la d&eacute;cision d'embauche</p>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="single_service text-center">
                        <div class="service_icon">
                            <img src="static/img/svg_icon/3.svg" alt="">
                        </div>
                        <h3>Envoie des emails</h3>
                        <p>Envoyer des courriers personnalis&eacute;s aux candidats accept&eacute;s</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- service_area_end -->

    <!-- about_info_area start  -->
    <div class="about_info_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-6 col-lg-6">
                    <div class="about_text">
                        <h3>Objectif du projet</h3>
                        <p style="font-size: large;">Notre objectif est une application qui va permettre aux sociétés la gestion d’embauche automatique ainsi la sélection des candidats.</p>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6">
                    <div class="about_thumb">
                        <img src="static/img/service/about.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /about_info_area end  -->

    <div class="testimonial_area overlay ">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="testmonial_active owl-carousel">
                        <div class="single_carousel">
                            <div class="single_testmonial text-center">
                                <div class="quote">
                                    <h2 class="pb-3" style="color:white;">Qui nous sommes?</h2>
                                </div>
                                <div class="row justify-content-lg-around">
                                    <div class="col-sm-4">
                                        <div class="mb-2">
                                            <img style="height: 150px; border-radius:50%;" src="static/img/zakariaAlouani.jpg" alt="">
                                        </div>
                                        <h3 style="color:white;">Alouani Zakaria</h3>
                                        <span style="color:white;">Étudiant Big Data</span>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="mb-2">
                                            <img style="height: 150px; border-radius:50%;" src="static/img/mehdi.jpeg" alt="">
                                        </div>
                                        <h3 style="color:white;">Hmiche El Mehdi</h3>
                                        <span style="color:white;">Étudiant Big Data</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer start -->
    <footer class="footer">
        <div style="padding-top: 100px; padding-bottom:60px;" class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="footer_widget">
                            <div class="footer_logo">
                                <a href="#">
                                    <img class="pt-4 mt-3" style="height: 80px;" src="static/img/footer_logo.png" alt="">
                                </a>
                            </div>                            
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="footer_widget">
                            <h2 class="footer_title">
                                    Contact
                            </h2>
                            <p>
                                <a href="mailto:zakaria76alouani@gmail.com">zakaria76alouani@gmail.com</a>
                                <br>
                                +212 615 588 967<br>
                                Marrakech
                            </p>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                    <br />
                            </h3>
                            <p>
                                <a href="mailto:mehdi.hmiche@gmail.com">mehdi.hmiche@gmail.com</a>
                                <br>
                                +212 707 383 367<br>
                                Casablanca
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy-right_text">
            <div class="container">
                <div class="footer_border"></div>
                <div class="row">
                    <div class="col-xl-12">
                        <p class="copy_right text-center">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/ footer end  -->

    <!-- link that opens popup -->


    <!-- JS here -->
    <script src="static/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="static/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="static/js/popper.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/owl.carousel.min.js"></script>
    <script src="static/js/isotope.pkgd.min.js"></script>
    <script src="static/js/ajax-form.js"></script>
    <script src="static/js/waypoints.min.js"></script>
    <script src="static/js/jquery.counterup.min.js"></script>
    <script src="static/js/imagesloaded.pkgd.min.js"></script>
    <script src="static/js/scrollIt.js"></script>
    <script src="static/js/jquery.scrollUp.min.js"></script>
    <script src="static/js/wow.min.js"></script>
    <script src="static/js/nice-select.min.js"></script>
    <script src="static/js/jquery.slicknav.min.js"></script>
    <script src="static/js/jquery.magnific-popup.min.js"></script>
    <script src="static/js/plugins.js"></script>
    <script src="static/js/gijgo.min.js"></script>
    <script src="static/js/slick.min.js"></script>
    <!--contact js-->
    <script src="static/js/contact.js"></script>
    <script src="static/js/jquery.ajaxchimp.min.js"></script>
    <script src="static/js/jquery.form.js"></script>
    <script src="static/js/jquery.validate.min.js"></script>
    <script src="static/js/mail-script.js"></script>

    <script src="static/js/main.js"></script>
</body>
</html>

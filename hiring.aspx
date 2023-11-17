<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hiring.aspx.cs" Inherits="Hiring.hiring" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Postuler</title>
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
                                            <li><a href="index.aspx">home</a></li>
                                            <li><a href="offres.aspx">Offres</a></li>
                                            <li><a class="active" href="hiring.aspx">Hirring</a></li>
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
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="contact_form_quote mt-4">
        <div id="postulerBlock" runat="server" class="container">
            <div class="row justify-content-center">
                <div class="col-xl-12 col-lg-12 col-xs-12">
                    <div class="form_wrap">
                        <div id="hiringInfo" runat="server"></div>
                        <form class="col-xl-10 col-lg-10 col-sm-10 col-xs-12 p-0" id="regForm" action="hiringtraitement.aspx" method="post">
                            <h1 id="offreNom" runat="server">Postuler</h1>
                            <input style="color: white; border: none;" type="text" id="offreId" name="offreId" readonly runat="server" />
                            <!-- Circles which indicates the steps of the form: -->
                            <div class="justify-content-between row" style="margin-top: 40px; margin-bottom:40px;">
                                <p class="col-sm-3 m-0 p-0" style="font-size: small;display: flex; flex-direction: column; align-items: center;"><span class="step" style="display: block; text-align: center;"><label style="color: white;">1</label></span>Informations personnelles</p>
                                <p class="col-sm-3 m-0 p-0" style="font-size: small;display: flex; flex-direction: column; align-items: center;"><span class="step" style="display: block; text-align: center;"><label style="color: white;">2</label></span>Parcours universitaire</p>
                                <p class="col-sm-3 m-0 p-0" style="font-size: small;display: flex; flex-direction: column; align-items: center;"><span class="step" style="display: block; text-align: center;"><label style="color: white;">3</label></span>Exp&eacute;riences</p>
                                <p class="col-sm-3 m-0 p-0" style="font-size: small;display: flex; flex-direction: column; align-items: center;"><span class="step" style="display: block; text-align: center;"><label style="color: white;">4</label></span>Comp&eacute;tences</p>
                            </div>
                            <!-- One "tab" for each step in the form: -->
                            <div class="tab">
                                <div class="row pt-1">
                                    <p class="col-sm-6"><input type="name" name="firstName" id="firstName" placeholder="Pr&eacute;nom" onchange="textChange(this)" oninput="" required></p>
                                    <p class="col-sm-6"><input type="name" name="lastName" id="lastName" placeholder="Nom" onchange="textChange(this)" oninput="" required></p>
                                </div>
                                
                                <div class="row pt-1 pb-1">
                                    <div class="row col-sm-6 m-0 p-0 pl-3">
                                        <div class="row justify-content-between col-sm-12 m-1">
                                            <label class="row col-sm-6 ml-2">
                                                <div class="primary-radio m-0 p-0 pl-3">
                                                    <input style="height: 15px; width: auto; margin: 6px; margin-left: 30px;" type="radio" name="sexe" id="sexeF" value="Femme" checked>
                                                    <label for="primary-radio"></label>
                                                </div>
                                                <span class="pl-2">Femme</span>
                                            </label>
                                            <label class="row col-sm-6 ">
                                                <div class="confirm-radio m-0 p-0 pl-3">
                                                    <input style="height: 15px; width: auto; margin: 6px; margin-left: 30px;" type="radio" name="sexe" id="sexeH" value="Homme">
                                                    <label for="primary-radio"></label>
                                                </div>
                                                <span class="pl-2">Homme</span>
                                            </label>
                                        </div>
                                            
                                    </div>
                                    <p class="col-sm-6">
                                        <select style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" class="form-control" name="familialeSituation" id="familialeSituation">
                                            <option value="" disabled selected>Situation Familiale</option>
                                            <option value="C&eacute;libataire">C&eacute;libataire</option>
                                            <option value="Mari&eacute;(e)">Mari&eacute;(e)</option>
                                        </select>
                                    </p>
                                </div>

                                <div class="row pt-1 mt-3">
                                    <p class="col-sm-6">
                                        <input type="tel" id="phone" name="phone" pattern="^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$" placeholder="T&eacute;l&eacute;phone" onchange="textChange(this)" oninput="" required>
                                    </p>
                                    <p class="col-sm-6">
                                        <input type="email" name="email" id="email" placeholder="E-mail" onchange="textChange(this)">
                                    </p>
                                    
                                </div>

                                <div class="row pt-1">
                                    <p class='col-sm-6'>
                                        <input style="border-radius: 0%;" name="dateNaissance" type='text' placeholder="Date Naissance" class="form-control" id='dateNaissance' required  onchange="textChange(this)"/>
                                    </p>
                                    <script type="text/javascript">
                                        $(function () {
                                            $('#dateNaissance').datepicker({
                                                format: 'dd/mm/yyyy'
                                            });
                                        });
                                    </script>
                                    <p class="col-sm-6">
                                        <select style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" class="form-control" name="ville" id="ville">
                                            <option value="" disabled selected>Choisir la ville</option>
                                            <option value="AGADIR">AGADIR</option>
                                            <option value="AIT WERIR">AIT WERIR</option>
                                            <option value="BENGUERIR">BENGUERIR</option>
                                            <option value="BENI MELLAL">BENI MELLAL</option>
                                            <option value="BENSLIMANE">BENSLIMANE</option>
                                            <option value="BERRECHID">BERRECHID</option>
                                            <option value="BOUJAAD">BOUJAAD</option>
                                            <option value="BRADIA">BRADIA</option>
                                            <option value="BROUJ">BROUJ</option>
                                            <option value="CASABLANCA">CASABLANCA</option>
                                            <option value="DAR CHAFII">DAR CHAFII</option>
                                            <option value="DOUAR KSOULA">DOUAR KSOULA</option>
                                            <option value="ELGARA">ELGARA</option>
                                            <option value="ELJADIDA">ELJADIDA</option>
                                            <option value="ESSAOUIRA">ESSAOUIRA</option>
                                            <option value="FES">FES</option>
                                            <option value="HATTANE-KHOURIBGA">HATTANE-KHOURIBGA</option>
                                            <option value="HOCEIMA">HOCEIMA</option>
                                            <option value="KALAA MEGOUNA">KALAA MEGOUNA</option>
                                            <option value="KALAAT SRAGHNA">KALAAT SRAGHNA</option>
                                            <option value="KELAAT SERAGHNA">KELAAT SERAGHNA</option>
                                            <option value="KENITRA">KENITRA</option>
                                            <option value="KHOURIBGA">KHOURIBGA</option>
                                            <option value="MARRAKECH">MARRAKECH</option>
                                            <option value="NOUACEUR">NOUACEUR</option>
                                            <option value="OUAZZANE">OUAZZANE</option>
                                            <option value="OUEDZEM">OUEDZEM</option>
                                            <option value="OUELD MRAH">OUELD MRAH</option>
                                            <option value="RABAT">RABAT</option>
                                            <option value="SALE">SALE</option>
                                            <option value="SETTAT">SETTAT</option>
                                            <option value="SETTAT(BENI MESKIN)">SETTAT(BENI MESKIN)</option>
                                            <option value="SIDI BANNOUR">SIDI BANNOUR</option>
                                            <option value="SIDI ELAIDI">SIDI ELAIDI</option>
                                            <option value="TETOUAN">TETOUAN</option>
                                            <option value="YOUSSOUFIA">YOUSSOUFIA</option>
                                            <option value="NANISS(FRANCE)">Etranger</option>
                                        </select>
                                    </p>
                                </div>
                                <div class="row">
                                    <p class="col-sm-6">
                                        <select style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" class="form-control" name="milieuResidence" id="milieuResidence">
                                            <option value="" disabled selected>Milieu de r&eacute;sidence</option>
                                            <option value="Rural">Rural</option>
                                            <option value="Urbain">Urbain</option>
                                        </select>
                                    </p>
                                </div>
                            </div>

                            <div class="tab">
                                <fieldset class="pl-4 pr-4 pb-0 mb-5" style="border: 1px solid #eee;">
                                    <legend class="pl-2 pr-2" style="width: auto !important;">Baccalaur&eacute;at</legend>
                                    <div class="row">
                                        <p class="col-sm-6">
                                            <label>Filière</label>
                                            <select class="col pt-0 mt-0" style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%; height: 31.4px;" class="form-control" name="bacFiliere" id="bacFiliere" required>
                                                <option value="" disabled selected>Choisir la filière</option>
                                                <option value="Economie et gestion">Economie et gestion</option>
                                                <option value="Lettres">Lettres</option>
                                                <option value="SCIENCES PHYSIQUE">SCIENCES PHYSIQUE</option>
                                                <option value="SVT">SVT</option>
                                                <option value="Sciences et techniques &eacute;lectriques">Sciences et techniques &eacute;lectriques</option>
                                                <option value="Sciences et technologie">Sciences et technologie</option>
                                                <option value="Sciences exp&eacute;rimentales">Sciences exp&eacute;rimentales</option>
                                                <option value="Sciences math&eacute;matiques">Sciences math&eacute;matiques</option>
                                                <option value="Techniques industrielles">Techniques industrielles</option>
                                                <option value="sciences humaines">sciences humaines</option>
                                            </select>
                                        </p>
                                        <div class="col-sm-6">
                                            <label>Ann&eacute;e</label>
                                            <input style="border-radius: 0%;" name="anneeBac" type='text' placeholder="Ann&eacute;e Baccalaur&eacute;at" class="form-control" id='anneeBac' required  onchange="textChange(this)"/>
                                            <script type="text/javascript">
                                                $(function () {
                                                    $('#anneeBac').datepicker({
                                                        format: 'yyyy'
                                                    });
                                                });
                                            </script>
                                        </div>
                                        
                                    </div>
                                    <div class="row mb-0 pb-0">
                                        <p class=" col-sm-6">
                                            <label>Mention</label>
                                            <select class="col pt-0 mt-0" name="mentionBac" id="mentionBac" style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%; height: 36.4px !important;" required>
                                                <option value="" disabled selected>Choisir votre mention</option>
                                                <option value="Passable">Passable</option>
                                                <option value="Assez bien">Assez bien</option>
                                                <option value="Bien">Bien</option>
                                                <option value="Très bien">Très bien</option>
                                                <option value="Excellent">Excellent</option>
                                            </select>
                                        </p>
                                        <p class=" col-sm-6">
                                            <label>Note</label>
                                            <input style="border-radius: 0%;" name="moyBac" id="moyBac" type='number' step="0.01" min="0" max="20" placeholder="Moyenne Baccalaur&eacute;at" class="form-control" required  onchange="textChange(this)"/>
                                        </p>
                                    </div>
                                </fieldset>
                                
                                    
                                <!--hr class="m-0 p-0 mb-4 pb-4" style="border-color: #6f6f6f;"-->
                                <div id="formations">
                                    <fieldset class="pl-4 pr-4 pb-0 mb-5" style="border: 1px solid #eee;" id="fdd1">
                                        <legend class="pl-2 pr-2" style="width: auto;">Dernier diplôme obtenu
                                            <!--button class="btn btn-danger p-2 btn-sm" type="button" onclick="deleteFormation(this.parentNode)">Supprimer</button-->
                                        </legend>
                                        <div class="row">
                                            <p class="col-sm-12">
                                                <input placeholder="Formation" name="formation" id="formation" onchange="textChange(this)">
                                            </p>
                                        </div>

                                        <div class="row">
                                            <p class='col-sm-6'>
                                                <label>Diplôme obtenu</label>
                                                <select class="form-control col pt-0 mt-0" name="diplomeObtenu" style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" id="diplomeObtenu">
                                                    <option value="" disabled selected>Choisir votre diplôme</option>
                                                    <option value="DUT">DUT ou &eacute;quivalent (Bac +2)</option>
                                                    <option value="Licence fondamentale">Licence fondamentale</option>
                                                    <option value="Licence sciences et techniques">Licence sciences et techniques</option>
                                                    <option value="Licence professionnelle">Licence professionnelle</option>
                                                    <option value="Diplôme d'ing&eacute;nieur">Diplôme d'ing&eacute;nieur</option>
                                                    <option value="Diplôme de L'ENCG">Diplôme de L'ENCG</option>
                                                    <option value="Master sp&eacute;cialis&eacute;">Master sp&eacute;cialis&eacute;</option>
                                                    <option value="Master recherche">Master recherche</option>
                                                    <option value="Doctorat">Doctorat</option>
                                                </select>
                                            </p>
                                            <p class='col-sm-6'>
                                                <label>Filière</label>
                                                <select class="form-control col pt-0 mt-0" name="diplomeFiliere" style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" id="diplomeFiliere">
                                                    <option value="" disabled selected>Choisir la filière</option>
                                                    <option value="Batiment">Batiment</option>
                                                    <option value="Biologie">Biologie</option>
                                                    <option value="Chimie">Chimie</option>
                                                    <option value="Droit">Droit</option>
                                                    <option value="ELECTRIQUE">ELECTRIQUE</option>
                                                    <option value="Electrique">Electrique</option>
                                                    <option value="Electronique">Electronique</option>
                                                    <option value="Fiscale">Fiscale</option>
                                                    <option value="Gestion">Gestion</option>
                                                    <option value="G&eacute;ogeaphie">G&eacute;ogeaphie</option>
                                                    <option value="Industriel">Industriel</option>
                                                    <option value="Informatique">Informatique</option>
                                                    <option value="Lettre">Lettre</option>
                                                    <option value="Logistique">Logistique</option>
                                                    <option value="Mathematique">Mathematique</option>
                                                    <option value="Mathematique Informatique">Mathematique Informatique</option>
                                                    <option value="Mathematique Informatique Physique Chimie">Mathematique Informatique Physique Chimie</option>
                                                    <option value="Math&eacute;matique">Math&eacute;matique</option>
                                                    <option value="M&eacute;canique">M&eacute;canique</option>
                                                    <option value="Physique">Physique</option>
                                                    <option value="Reseau">Reseau</option>
                                                    <option value="R&eacute;seau Informatique">R&eacute;seau Informatique</option>
                                                </select>
                                            </p>
                                        </div>
                                        <div class="row">
                                            <p class="col-sm-6">
                                                <label>&eacute;tablissement de diplôme</label>
                                                <select class="form-control col pt-0 mt-0" name="etablisementDiplome" style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" id="etablisementDiplome">
                                                    <option value="" disabled selected>Choisir votre &eacute;tablissement</option>
                                                    <option value="ENCG">ENCG</option>
                                                    <option value="ENSA">ENSA</option>
                                                    <option value="ESTB">ESTB</option>
                                                    <option value="FPK">FPK</option>
                                                    <option value="FSJES">FSJES</option>
                                                    <option value="FST">FST</option>
                                                </select>
                                            </p>
                                            <p class="col-sm-6">
                                                <label>As-tu effectu&eacute; un stage durant formation?</label>
                                                <select class="col pt-0 mt-0" name="stageDurantFormation" style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" class="form-control" id="stageDurantFormation">
                                                    <option value="" disabled selected>Choisir votre r&eacute;ponse</option>
                                                    <option value="Oui">Oui</option>
                                                    <option value="Non">Non</option>
                                                </select>
                                            </p>
                                        </div>
                                    </fieldset>
                                </div>

                                <!--span><i class="fa fa-plus btn btn-success p-3 rounded-circle" onclick="addFormation()"></i></span-->
                            </div>                            

                            <div class="tab">
                                <fieldset class="pl-4 pr-4 pb-0 mb-5" style="border: 1px solid #eee;">
                                    <legend>Comp&eacute;tences</legend>
                                    <div class="row">
                                        <p class="col-sm-6">
                                            <label>Connaissance Th&eacute;oriques</label>
                                            <select style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" class="form-control" name="connaissanceTheorique" id="connaissanceTheorique">
                                                <option value="" disabled selected>Selectionner</option>
                                                <option value="Faible">Faible</option>
                                                <option value="Moyen">Moyen</option>
                                                <option value="Fort">Fort</option>
                                                <option value="Très fort">Très fort</option>
                                            </select>
                                        </p>
                                        <p class="col-sm-6">
                                            <label>Connaissance Pratiques</label>
                                            <select style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" class="form-control" name="connaissancePratique" id="connaissancePratique">
                                                <option value="" disabled selected>Selectionner</option>
                                                <option value="Très faible">Très faible</option>
                                                <option value="Faible">Faible</option>
                                                <option value="Moyen">Moyen</option>
                                                <option value="Fort">Fort</option>
                                                <option value="Très fort">Très fort</option>
                                            </select>
                                        </p>
                                    </div>

                                    <div class="row">
                                        <p class="col-sm-6 pt-2">
                                            <label>Informatique Outils Technologiques</label>
                                            <select style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" class="form-control" name="connaissanceInformatique" id="connaissanceInformatique">
                                                <option value="" disabled selected>Selectionner</option>
                                                <option value="Très faible">Très faible</option>
                                                <option value="Faible">Faible</option>
                                                <option value="Moyen">Moyen</option>
                                                <option value="Fort">Fort</option>
                                                <option value="Très fort">Très fort</option>
                                            </select>
                                        </p>

                                        <p class="col-sm-6 pt-2">
                                            <label>Planification Coordination Organisation</label>
                                            <select style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" class="form-control" name="planificationCoordination" id="planificationCoordination">
                                                <option value="" disabled selected>Selectionner</option>
                                                <option value="Faible">Faible</option>
                                                <option value="Moyen">Moyen</option>
                                                <option value="Fort">Fort</option>
                                                <option value="Très fort">Très fort</option>
                                            </select>
                                        </p>
                                    </div>

                                    <div class="row">
                                        <p class="col pt-2">
                                            <label>Si vous aviez à refaire vos &eacute;tudes sup&eacute;rieures choisiriez vous le même diplôme?</label>
                                            <select class="form-control col-sm-6" name="refaireEtude" style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" id="refaireEtude">
                                                <option value="" disabled selected>Selectionner</option>
                                                <option value="Ne sais pas">Ne sais pas</option>
                                                <option value="Oui">Oui</option>
                                                <option value="Non">Non</option>
                                            </select>
                                        </p>
                                    </div>

                                    
                                </fieldset>

                                <fieldset class="pl-4 pr-4 pb-0 mb-5" style="border: 1px solid #eee;">
                                    <legend>Langues</legend>
                                    <div class="row">
                                        <p class="col-sm-6">
                                            <label>Niveau Français</label>
                                            <select style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" class="form-control" name="niveauFrancais" id="niveauFrancais">
                                                <option value="" disabled selected>Selectionner</option>
                                                <option value="Très faible">Très faible</option>
                                                <option value="Faible">Faible</option>
                                                <option value="Moyen">Moyen</option>
                                                <option value="Fort">Fort</option>
                                                <option value="Très fort">Très fort</option>
                                            </select>
                                        </p>
                                        
                                        <p class="col-sm-6">
                                            <label>Niveau Anglais</label>
                                            <select style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" class="form-control" name="niveauAnglais" id="niveauAnglais">
                                                <option value="" disabled selected>Selectionner</option>
                                                <option value="Très faible">Très faible</option>
                                                <option value="Faible">Faible</option>
                                                <option value="Moyen">Moyen</option>
                                                <option value="Fort">Fort</option>
                                                <option value="Très fort">Très fort</option>
                                            </select>
                                        </p>
                                    </div>

                                    <div class="row">
                                        <p class="col-sm-6">
                                            <label>Niveau Espagnol</label>
                                            <select style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" class="form-control" name="niveauEspagnol" id="niveauEspagnol">
                                                <option value="" disabled selected>Selectionner</option>
                                                <option value="Très faible">Très faible</option>
                                                <option value="Faible">Faible</option>
                                                <option value="Moyen">Moyen</option>
                                                <option value="Fort">Fort</option>
                                                <option value="Très fort">Très fort</option>
                                            </select>
                                        </p>

                                        <p class="col-sm-6">
                                            <label>Communication Pratique Langues</label>
                                            <select style="border: none; border-bottom: 1px solid #E8E8E8; border-radius: 0%;" class="form-control" name="communicationPratique" id="communicationPratique">
                                                <option value="" disabled selected>Selectionner</option>
                                                <option value="Très faible">Très faible</option>
                                                <option value="Faible">Faible</option>
                                                <option value="Moyen">Moyen</option>
                                                <option value="Fort">Fort</option>
                                                <option value="Très fort">Très fort</option>
                                            </select>
                                        </p>
                                    </div>
                                </fieldset>
                            </div>

                            <div class="tab">
                                <fieldset class="pl-4 pr-4 pb-0 mb-5" style="border: 1px solid #eee;">
                                    <legend>Stages</legend>
                                    <div class="row">
                                        <p class="col-sm-6">
                                            <label>Dur&eacute;e des stages en mois</label>
                                            <input type="number" name="dureeStage" id="dureeStage" value="0">
                                        </p>
                                    </div>
                                </fieldset>

                                <fieldset class="pl-4 pr-4 pb-0 mb-5" style="border: 1px solid #eee;">
                                    <legend>Exp&eacute;riences</legend>
                                    <div class="row">
                                        <p class="row col-sm-12">
                                            <label class="col-sm-8">Votre ancien emploi ou stage correspond à vos attentes ?</label>
                                            <select class="col-sm-4" name="EmploiCorrespondAttente" id="EmploiCorrespondAttente">
                                                <option value="" disabled selected>Choisir votre r&eacute;ponse</option>
                                                <option value="Pas du tout">Pas du tout</option>
                                                <option value="En Partie">En Partie</option>
                                                <option value="Complètement">Complètement</option>
                                            </select>
                                        </p>
                                        <p class="row col-sm-12">
                                            <label class="col-sm-8">Votre ancien emploi ou stage correspond à votre formation ?</label>
                                            <select class="col-sm-4" name="EmploiCorrespondFormation" id="EmploiCorrespondFormation">
                                                <option value="" disabled selected>Choisir votre r&eacute;ponse</option>
                                                <option value="Pas du tout">Pas du tout</option>
                                                <option value="En Partie">En Partie</option>
                                                <option value="Complètement">Complètement</option>
                                            </select>
                                        </p>
                                    </div>
                                </fieldset>
                            </div>

                            <div>
                                <div class="">
                                    <button class="boxed-btn3 p-2 m-1" type="button" id="prevBtn" onclick="nextPrev(-1)" style="float:left; width: auto;">Previous</button>
                                    <button class="boxed-btn3 p-2 m-1" type="button" id="nextBtn" onclick="nextPrev(1)" style="float:right; width: auto;">Next</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                
            </div>
        </div>
    </div>

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
    <form id="form1" runat="server">
        <div>
        </div>
    </form>


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
    <script src="static/js/hiringform.js"></script>
</body>
</html>
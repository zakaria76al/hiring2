<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="newpersonnel.aspx.cs" Inherits="Hiring.admin.newpersonnel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Ajouter Personnel</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navLeft" runat="server">
    <ul class="nav pcoded-inner-navbar ">
        <li class="nav-item pcoded-menu-caption">
            <label>Navigation</label>
        </li>
        <li class="nav-item">
            <a href="index.aspx" class="nav-link "><span class="pcoded-micon"><i class="feather icon-home"></i></span><span class="pcoded-mtext">Dashboard</span></a>
        </li>
        <%
            if(Session["role"].ToString() == "admin")
            {
                Response.Write("<li class='nav-item pcoded-hasmenu'><a href='#!' class='nav-link '><span class='pcoded-micon'><i class='feather icon-users'></i></span><span class='pcoded-mtext'>Personnels</span></a><ul class='pcoded-submenu'><li><a href='newpersonnel.aspx'>Créer un personnel</a></li><li><a href='personnel.aspx'>Gestion de personnels</a></li></ul></li>");
            }
        %>
        <li class="nav-item pcoded-hasmenu">
            <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-layout"></i></span><span class="pcoded-mtext">Offres</span></a>
            <ul class="pcoded-submenu">
                <li><a href="newoffre.aspx">Créer des offres</a></li>
                <li><a href="offre.aspx">Gestion des offres</a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a href="candidature.aspx" class="nav-link "><span class="pcoded-micon"><i class="feather icon-home"></i></span><span class="pcoded-mtext">Candidatures</span></a>
        </li>
        <li class="nav-item">
            <a href="settings.aspx" class="nav-link "><span class="pcoded-micon"><i class="feather icon-settings"></i></span><span class="pcoded-mtext">Paramètres</span></a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="mainContent" runat="server">
    <div class="pcoded-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Form Elements</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#!">Form Components</a></li>
                            <li class="breadcrumb-item"><a href="#!">Form Elements</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Basic Component</h5>
                    </div>
                    <div class="card-body">
                        <form action="newpersonnel.aspx" method="post">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="floating-label" for="nom">Nom</label>
                                        <input type="text" name="lastname" class="form-control" id="nom" >
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="floating-label" for="prenom">Prénom</label>
                                        <input type="text" name="firstname" class="form-control" id="prenom">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="floating-label" for="Email">Email</label>
                                        <input type="email" name="email" class="form-control" id="Email" aria-describedby="emailHelp">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="floating-label" for="userName">User Name</label>
                                        <input type="text" name="userName" class="form-control" id="userName" aria-describedby="emailHelp">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <input type="submit" name="Ajouter" class="btn btn-primary">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

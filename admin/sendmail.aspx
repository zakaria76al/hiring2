<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="sendmail.aspx.cs" Inherits="Hiring.admin.sendmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
                            <h5 class="m-b-10">Candidats</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#!">Envoyer des emails</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
        <div class="row">
            <div class="col-sm-12">
                <div id="alert" runat="server"></div>
                <div class="card">
                    <div class="card-header">
                        <h5>Envoyer des emails aux candidats acceptés</h5>
                    </div>
                    <div class="card-body">
                        <form id="sendMail" method="post" runat="server" >
                            <input style="color:white; border:none; height: 1px;" type="number" id="idOffre" name="idOffre" runat="server" readonly />
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="floating-label" for="mailTxt">Votre email pour insérer le nom du candidat mettre {nom}</label>
                                        <textarea runat="server" class="form-control" id="mailTxt" style="height: 250px;"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <asp:Button ID="send" CssClass="btn btn-primary" runat="server" Text="Envoyer les Emails" OnClick="send_Click" />
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
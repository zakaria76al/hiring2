<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="newoffre.aspx.cs" Inherits="Hiring.admin.newoffre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Nouvelle Offre</title>
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
                            <h5 class="m-b-10">Offres</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#!">Ajouter une offre</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
        <div class="row">
            <div class="col-sm-12" id="alert" runat="server"></div>
            <div class="col-sm-12" id="contentForm" runat="server">
                <div class="card">
                    <div class="card-header">
                        <h5>Ajouter une offre</h5>
                    </div>
                    <div class="card-body">
                        <form runat="server" id="formOffre" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="floating-label" for="nom">Nom Offre</label>
                                        <input runat="server" type="text" name="offreName" class="form-control" id="offreName" >
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="floating-label" for="description">Description</label>
                                        <textarea runat="server" style="width:100%; height:200px;" type="text" rows="7" name="description" class="form-control" id="description" aria-describedby="emailHelp"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="row col-sm-12">
                                    <div class="form-group col-sm-6">
                                        <label class="mb-0 pb-0">Date Final</label>
                                        <input type="date" runat="server" id="finalDate" class="form-control mt-0 bt-0" />
                                        <script>
                                            var today = new Date();
                                            var dd = String(today.getDate()).padStart(2, '0');
                                            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                                            var yyyy = today.getFullYear();

                                            today = yyyy + '-' + mm + "-" + dd;
                                            document.getElementById("mainContent_finalDate").setAttribute("min", today);
                                            document.getElementById("mainContent_finalDate").value = today;
                                        </script>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label>Image de l'offre</label><br />
                                        <asp:FileUpload ID="image" runat="server" />
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="row float-right m-1">
                                <asp:Button CssClass="btn btn-outline-primary" ID="Ajouter" runat="server" onclick="Ajouter_Click" Text="Ajouter" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
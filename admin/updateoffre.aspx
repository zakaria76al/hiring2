<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="updateoffre.aspx.cs" Inherits="Hiring.admin.updateoffre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Modifier offre</title>
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
                            <li class="breadcrumb-item"><a href="#!">Modifier une offre</a></li>
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
                        <h5>Ajouter une offre</h5>
                    </div>
                    <div class="card-body">
                        <form runat="server" id="updateOffreForm" enctype="multipart/form-data">
                            <input style="color:white; border:none; height: 1px;" type="text" id="idOffre" name="idOffre" runat="server" readonly />
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="floating-label" for="offreName">Nom Offre</label>
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
                                <div class="form-group col-sm-6">
                                    <label>Image de l'offre</label><br />
                                    <asp:FileUpload ID="image" runat="server" />
                                </div>
                                <div class="form-group col-sm-6" id="offreImg" runat="server">
                                    
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="floating-label" for="etat">
                                            <input class="btn btn-outline-info" type="text" name="etat" id="etat" runat="server" readonly/>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label class="mb-0 pb-0">Date Final</label>
                                    <input type="date" runat="server" id="finalDate" class="form-control mt-0 bt-0" />
                                    <div id="script" runat="server"></div>
                                    <script>
                                        var today = new Date();
                                        var dd = String(today.getDate()).padStart(2, '0');
                                        var mm = String(today.getMonth() + 1).padStart(2, '0');
                                        var yyyy = today.getFullYear();

                                        today = yyyy + '-' + mm + "-" + dd;
                                        document.getElementById("mainContent_finalDate").setAttribute("min", today);
                                    </script>
                                </div>
                                
                                <div id="closeHtml" runat="server" class="col-sm-6">
                                    <div class="form-group">
                                        <label class="floating-label" for="cloturer">Vouler vous clôturer l'offre? 
                                            <input type="checkbox" runat="server" name="cloturer" id="cloturer" /> Oui
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row float-right m-1">
                                <asp:Button ID="Modifier" runat="server" Text="Modifier" CssClass="btn btn-primary" OnClick="Modifier_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

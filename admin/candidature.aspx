<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="candidature.aspx.cs" Inherits="Hiring.admin.candidature" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Candidatures</title>
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
    <div runat="server" id="filter">
        <form class="row bg-white form-group pl-5 pt-4" action="candidature.aspx" method="get" id="filterForm">
            <p class="" style="width:0px;">
                <input class="invisible" type="text" id="idFilterForm" name="id" value="" runat="server" readonly />
            </p>
            <p class="col-sm-5">
                <label class="col-sm-12">
                    Sexe
                <select name="sexe" id="sexe" class="form-control col-sm-8">
                    <option value="Homme">Homme</option>
                    <option value="Femme">Femme</option>
                    <option value="all">Les deux</option>
                </select>
                </label>
            </p>
            <p class="col-sm-5">
                <label class="col-sm-12">
                    Decision Embauche
                <select name="decision" id="decision" class="form-control col-sm-8">
                    <option value="Oui">Oui</option>
                    <option value="Non">Non</option>
                    <option value="all">Les deux</option>
                </select>
                </label>
            </p>
            <p class="col-sm-2">
                <input type="submit" class="btn btn-outline-info mt-2" value="Filtrer" />
            </p>
        </form>
    </div>
    
    <div id="col12content" runat="server" class="col-xl-12 mt-2 pt-3">
        <div id="offres" runat="server" class="card-columns">
            
        </div>
    </div>
</asp:Content>

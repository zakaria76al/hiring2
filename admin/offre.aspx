<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="offre.aspx.cs" Inherits="Hiring.admin.offre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Offres</title>
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
							<h5 class="m-b-10">Collapse</h5>
						</div>
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html"><i class="feather icon-home"></i></a></li>
							<li class="breadcrumb-item"><a href="#!">Offres</a></li>
							<li class="breadcrumb-item"><a href="#!"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- [ breadcrumb ] end -->
		<!-- [ Main Content ] start -->
		<div class="row" id="offresTabs" runat="server">
			
		</div>
		<!-- [ Main Content ] end -->
	</div>
</asp:Content>

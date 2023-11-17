using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Hiring.admin
{
    public partial class print : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (Request.QueryString["id"] != null)
            {
                try
                {
                    int idOffre = int.Parse(Request.QueryString["id"].ToString());
                    SqlCommand query1 = new SqlCommand("select * from Candidature where idCandidature = @id", cnx);
                    query1.Parameters.AddWithValue("id", idOffre);
                    SqlDataReader reader1;
                    if (cnx.State != System.Data.ConnectionState.Open)
                        cnx.Open();
                    reader1 = query1.ExecuteReader();
                    int id;
                    string nom, sexe, email, decision;
                    int DateNaissance;
                    string StuationFamiliale;
                    string Ville;
                    int AnneeBac;
                    string SerieBac;
                    string MentionBac;
                    string EtablisementDiplome;
                    string TypeDiplome;
                    string Filiere;
                    string StageDurantFormation;
                    int DureeStage;
                    string ConnaissancesTheoriques;
                    string ConnaissancesPratiques;
                    string ConnaissancesLangueEtrangère;
                    string ConnaissancesInformatiqueOutilsTechnologiques;
                    string ConnaissancesPlanificationCoordinationOrganisation;
                    string ConnaissancesCommunicationLangues;
                    string SatisfactionDiplomeObtenu;
                    string EmploiCorrespondAttente;
                    string EmploiCorrespondFormation;
                    string MilieuResidence;
                    string HTML = "";
                    if (reader1.Read())
                    {
                        id = reader1.GetInt32(0);
                        nom = reader1.GetString(1) + " " + reader1.GetString(2);
                        sexe = reader1.GetString(3);
                        email = reader1.GetString(5);
                        try { decision = reader1.GetString(28); } catch { decision = "L'offre est en cours"; }
                        DateNaissance = reader1.GetInt32(6);
                        StuationFamiliale = reader1.GetString(7);
                        Ville = reader1.GetString(8);
                        AnneeBac = reader1.GetInt32(9);
                        SerieBac = reader1.GetString(10);
                        MentionBac = reader1.GetString(11);
                        EtablisementDiplome = reader1.GetString(12);
                        TypeDiplome = reader1.GetString(13);
                        Filiere = reader1.GetString(14);
                        StageDurantFormation = reader1.GetString(15);
                        DureeStage = reader1.GetInt32(16);
                        ConnaissancesTheoriques = reader1.GetString(17);
                        ConnaissancesPratiques = reader1.GetString(18);
                        ConnaissancesLangueEtrangère = reader1.GetString(19);
                        ConnaissancesInformatiqueOutilsTechnologiques = reader1.GetString(20);
                        ConnaissancesPlanificationCoordinationOrganisation = reader1.GetString(21);
                        ConnaissancesCommunicationLangues = reader1.GetString(22);
                        SatisfactionDiplomeObtenu = reader1.GetString(23);
                        EmploiCorrespondAttente = reader1.GetString(24);
                        EmploiCorrespondFormation = reader1.GetString(25);
                        MilieuResidence = reader1.GetString(26);
                        HTML = "<link rel='stylesheet' href='assets/css/style.css'><div class='card mb-0'><div class='card-header' id='heading" + id + "'><h5 class='mb-0 col-sm-12'><a href='#!' data-toggle='collapse' data-target='#collapse" + id + "' aria-expanded='false' aria-controls='collapse" + id + "' class='collapsed row justify-content-between'><div class='col-sm-3'>" + nom + "</div><div class='col-sm-3'>" + sexe + "</div><div class='col-sm-4'>" + email + "</div><div class='col-sm-2'>Decision : " + decision + "</div></a></h5></div><div id='collapse" + id + "' class='collapse' aria-labelledby='heading" + id + "' data-parent='#accordionExample' style='><div class='card-body'><div class='row col-sm-12'><table class='table col-sm-6'><tbody><tr><th scope='row'>Date Naissance</th><td>" + DateNaissance + "</td></tr><tr><th scope='row'>Stuation Familiale</th><td>" + StuationFamiliale + "</td></tr><tr><th scope='row'>Ville</th><td>" + Ville + "</td></tr><tr><th scope='row'>Annee Bac</th><td>" + AnneeBac + "</td></tr><tr><th scope='row'>Serie Bac</th><td>" + SerieBac + "</td></tr><tr><th scope='row'>Mention Bac</th><td>" + MentionBac + "</td></tr><tr><th scope='row'>Etablisement Diplome</th><td>" + EtablisementDiplome + "</td></tr><tr><th scope='row'>Type Diplome</th><td>" + TypeDiplome + "</td></tr><tr><th scope='row'>Filiere</th><td>" + Filiere + "</td></tr><tr><th scope='row'>Stage Durant Formation</th><td>" + StageDurantFormation + "</td></tr></tbody></table><table class='table col-sm-6'><tbody><tr><th scope='row'>Duree Stage</th><td>" + DureeStage + "</td></tr><tr><th scope='row'>Connaissances Theoriques</th><td>" + ConnaissancesTheoriques + "</td></tr><tr><th scope='row'>Connaissances Pratiques</th><td>" + ConnaissancesPratiques + "</td></tr><tr><th scope='row'>Connaissances Langue Etrangère</th><td>" + ConnaissancesLangueEtrangère + "</td></tr><tr><th scope='row'>Informatique Outils Technologiques</th><td>" + ConnaissancesInformatiqueOutilsTechnologiques + "</td></tr><tr><th scope='row'>Connaissances Planification Coordination Organisation</th><td>" + ConnaissancesPlanificationCoordinationOrganisation + "</td></tr><tr><th scope='row'>Connaissances Communication Pratique Langues</th><td>" + ConnaissancesCommunicationLangues + "</td></tr><tr><th scope='row'>Satisfaction Diplome Obtenu</th><td>" + SatisfactionDiplomeObtenu + "</td></tr><tr><th scope='row'>Emploi Correspond Attente</th><td>" + EmploiCorrespondAttente + "</td></tr><tr><th scope='row'>Emploi Correspond Formation</th><td>" + EmploiCorrespondFormation + "</td></tr><tr><th scope='row'>Milieu Residence</th><td>" + MilieuResidence + "</td></tr></tbody></table></div></div></div>";
                        
                        var Renderer = new IronPdf.HtmlToPdf();
                        var PDF = Renderer.RenderHtmlAsPdf(HTML);
                        //var PDF = Renderer.RenderUrlAsPdf("https://www.google.com/");
                        string path = "C:/Users/Z. Alouani/source/repos/Hiring/Hiring/documents/" + id + nom + "_" + ".pdf";
                        PDF.SaveAs(path);

                        //Response.Redirect("file:///" + path);
                        Response.ContentType = "application/pdf";
                        Response.AppendHeader("Content-Disposition", "attachment; filename="+id+".pdf");
                        Response.TransmitFile(path);
                    }
                    else
                    {
                        Response.Redirect("candidature.aspx");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message + "<br>" + ex);
                }
            }
            else
            {
                Response.Redirect("candidature.aspx");
            }
        }
    }
}
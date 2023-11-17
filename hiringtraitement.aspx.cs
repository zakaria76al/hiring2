using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Hiring
{
    public partial class hiringtraitement : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["firstName"] != null && Request.Form["lastName"] != null)
            {
                try
                {
                    string nom = Request.Form["firstName"];
                    string prenom = Request.Form["lastName"];
                    string sexe = Request.Form["sexe"];
                    string tele = Request.Form["phone"];
                    string email = Request.Form["email"];
                    DateTime dateNaissance = DateTime.Parse(Request.Form["dateNaissance"]);
                    int dateYear = (int)dateNaissance.Year;
                    string situationFamiliale = Request.Form["familialeSituation"];
                    int anneeBac = int.Parse(Request.Form["anneeBac"].ToString());
                    string serieBac = Request.Form["bacFiliere"];
                    string mentionBac = Request.Form["mentionBac"];
                    string EtablisementDiplome = Request.Form["etablisementDiplome"];
                    string TypeDiplome = Request.Form["diplomeObtenu"];
                    string Filiere = Request.Form["diplomeFiliere"];
                    string StageDurantFormation = Request.Form["stageDurantFormation"];
                    int DureeStage = int.Parse(Request.Form["dureeStage"]);
                    string ConnaissanceTheoriques = Request.Form["connaissanceTheorique"];
                    string ConnaissancePratiques = Request.Form["connaissancePratique"];

                    string niveauFrancais = Request.Form["niveauFrancais"];
                    string niveauAnglais = Request.Form["niveauAnglais"];
                    string niveauEspagnol = Request.Form["niveauEspagnol"];

                    int num = 0;
                    switch(niveauFrancais)
                    {
                        case "Faible":
                            num += 1;
                            break;
                        case "Fort":
                            num += 3;
                            break;
                        case "Moyen":
                            num += 2;
                            break;
                        case "Très faible":
                            num += 0;
                            break;
                        case "Très fort'":
                            num += 4;
                            break;
                    }

                    switch (niveauAnglais)
                    {
                        case "Faible":
                            num += 1;
                            break;
                        case "Fort":
                            num += 3;
                            break;
                        case "Moyen":
                            num += 2;
                            break;
                        case "Très faible":
                            num += 0;
                            break;
                        case "Très fort'":
                            num += 4;
                            break;
                    }

                    double moyLangue = num / 2;
                    string niveauLG = "Faible";
                    switch (int.Parse(moyLangue.ToString()))
                    {
                        case 1:
                            niveauLG = "Faible";
                            break;
                        case 3:
                            niveauLG = "Fort";
                            break;
                        case 2:
                            niveauLG = "Moyen";
                            break;
                        case 0:
                            niveauLG = "Très faible";
                            break;
                        default:
                            niveauLG = "Très fort";
                            break;
                    }
                    string ConnaissanceLangueEtrangère = niveauLG;
                    string ConnaissanceInformatiqueOutilsTechnologiques = Request.Form["connaissanceInformatique"];
                    string ConnaissancesPlanificationCoordinationOrganisation = Request.Form["planificationCoordination"];
                    string ConnaissancesCommunicationPratiqueLangues = Request.Form["communicationPratique"];
                    string SatisfactionDiplomeObtenu = Request.Form["refaireEtude"];
                    string EmploiCorrespondAttente = Request.Form["EmploiCorrespondAttente"];
                    string EmploiCorrespondFormation = Request.Form["EmploiCorrespondFormation"];
                    string MilieuResidence = Request.Form["milieuResidence"];
                    string ville = Request.Form["ville"];

                    string queryString = "INSERT INTO Candidature(nom, prenom, sexe, tele, email, dateNaissance, situationFamiliale, anneeBac, serieBac, mentionBac, EtablisementDiplome, TypeDiplome, Filiere, StageDurantFormation, DureeStage, ConnaissanceTheoriques, ConnaissancePratiques, ConnaissanceLangueEtrangère, ConnaissanceInformatiqueOutilsTechnologiques, ConnaissancesPlanificationCoordinationOrganisation, ConnaissancesCommunicationPratiqueLangues, SatisfactionDiplomeObtenu, EmploiCorrespondAttente, EmploiCorrespondFormation, MilieuResidence, ville, offre) VALUES (@nom, @prenom, @sexe, @tele, @email, @dateNaissance, @situationFamiliale, @anneeBac, @serieBac, @mentionBac, @EtablisementDiplome, @TypeDiplome, @Filiere, @StageDurantFormation, @DureeStage, @ConnaissanceTheoriques, @ConnaissancePratiques, @ConnaissanceLangueEtrangère, @ConnaissanceInformatiqueOutilsTechnologiques, @ConnaissancesPlanificationCoordinationOrganisation, @ConnaissancesCommunicationPratiqueLangues, @SatisfactionDiplomeObtenu, @EmploiCorrespondAttente, @EmploiCorrespondFormation, @MilieuResidence, @ville, @offre)";
                    SqlCommand query = new SqlCommand(queryString, cnx);

                    query.Parameters.AddWithValue("nom", nom);
                    query.Parameters.AddWithValue("prenom", prenom);
                    query.Parameters.AddWithValue("sexe", sexe);
                    query.Parameters.AddWithValue("tele", tele);
                    query.Parameters.AddWithValue("email", email);
                    query.Parameters.AddWithValue("dateNaissance", dateYear);
                    query.Parameters.AddWithValue("situationFamiliale", situationFamiliale);
                    query.Parameters.AddWithValue("anneeBac", anneeBac);
                    query.Parameters.AddWithValue("serieBac", serieBac);
                    query.Parameters.AddWithValue("mentionBac", mentionBac);
                    query.Parameters.AddWithValue("EtablisementDiplome", EtablisementDiplome);
                    query.Parameters.AddWithValue("TypeDiplome", TypeDiplome);
                    query.Parameters.AddWithValue("Filiere", Filiere);
                    query.Parameters.AddWithValue("StageDurantFormation", StageDurantFormation);
                    query.Parameters.AddWithValue("DureeStage", DureeStage);
                    query.Parameters.AddWithValue("ConnaissanceTheoriques", ConnaissanceTheoriques);
                    query.Parameters.AddWithValue("ConnaissancePratiques", ConnaissancePratiques);
                    query.Parameters.AddWithValue("ConnaissanceLangueEtrangère", ConnaissanceLangueEtrangère);
                    query.Parameters.AddWithValue("ConnaissanceInformatiqueOutilsTechnologiques", ConnaissanceInformatiqueOutilsTechnologiques);
                    query.Parameters.AddWithValue("ConnaissancesPlanificationCoordinationOrganisation", ConnaissancesPlanificationCoordinationOrganisation);
                    query.Parameters.AddWithValue("ConnaissancesCommunicationPratiqueLangues", ConnaissancesCommunicationPratiqueLangues);
                    query.Parameters.AddWithValue("SatisfactionDiplomeObtenu", SatisfactionDiplomeObtenu);
                    query.Parameters.AddWithValue("EmploiCorrespondAttente", EmploiCorrespondAttente);
                    query.Parameters.AddWithValue("EmploiCorrespondFormation", EmploiCorrespondFormation);
                    query.Parameters.AddWithValue("MilieuResidence", MilieuResidence);
                    query.Parameters.AddWithValue("ville", ville);
                    query.Parameters.AddWithValue("offre", Request.Form["offreId"]);

                
                    if (cnx.State == System.Data.ConnectionState.Closed)
                        cnx.Open();
                    query.ExecuteNonQuery();
                    if (cnx.State != System.Data.ConnectionState.Closed)
                        cnx.Close();
                    Response.Redirect("hiring.aspx?candidature=sent");
                    
                }
                catch (Exception ex)
                {
                    //Response.Redirect("hiring.aspx?candidature=failed");
                    Response.Write(ex.Message + "<br>" + ex.ToString());
                    return;
                }
            }
        }
    }
}
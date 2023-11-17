using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using Newtonsoft.Json;
using System.Net;
using System.IO;

namespace Hiring.admin
{
    public partial class updateoffre : System.Web.UI.Page
    {
        private String sqlDatoToJson(SqlDataReader dataReader)
        {
            var dataTable = new DataTable();
            dataTable.Load(dataReader);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(dataTable);
            return JSONString;
        }

        SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
                Response.Redirect("login.aspx");

            if (Request.QueryString["offre"] != null && Request.QueryString["offre"] == "updated")
            {
                alert.InnerHtml = "<div class='alert alert-success' role='alert'>Offre modifiée avec success</div>";
            }

            if(Request.QueryString["id"] != null)
            {
                //Response.Redirect("offre.aspx");
                int id = int.Parse(Request.QueryString["id"].ToString());
                SqlCommand query = new SqlCommand("select libelle ,description, etat, dateFinal,image from Offre where idOffre = @id", cnx);
                query.Parameters.AddWithValue("id", id);
                SqlDataReader reader;
                try
                {
                    if (cnx.State != ConnectionState.Open)
                        cnx.Open();
                    reader = query.ExecuteReader();
                    if (reader.Read())
                    {
                        offreName.Value = reader.GetString(0);
                        description.Value = reader.GetString(1);
                        if (reader[3] != null)
                        {
                            DateTime dt = DateTime.Parse(reader[3].ToString());
                            //finalDate.Value = dt.ToString("dd/MM/yyyy");
                            string Sdate = dt.ToString("dd/MM/yyyy");
                            script.InnerHtml = "<script>var today = new Date();var dd = '" + Sdate.Substring(0,2) + "';var mm = '" + Sdate.Substring(3, 2) + "';var yyyy = " + dt.Year + ";today = yyyy + '-' + mm + '-' + dd;document.getElementById('mainContent_finalDate').value = today;</script>";
                        }
                            
                        etat.Value = (reader.GetString(2) == "open") ? "Ouverte" : "Clôtué";
                        if (reader.GetString(2) != "open")
                        {
                            closeHtml.InnerHtml = "";
                            closeHtml.InnerHtml = "<a href='sendmail.aspx?idOffre=" + Request.QueryString["id"] + "' class='btn btn-outline-dark' >Envoyer Email</a>";
                        }
                        idOffre.Value = id.ToString();
                        string img = reader.GetString(4);
                        offreImg.InnerHtml = "<img src='../imagesOffres/" + img + "' style='height:100px;' />";
                        cnx.Close();
                        reader.Close();
                    }
                    else
                    {
                        Response.Redirect("offre.aspx");
                    }
                }
                catch (Exception)
                {

                }
            }
            else
            {
                Response.Redirect("offre.aspx");
            }
        }

        protected void Modifier_Click(object sender, EventArgs e)
        {
            SqlCommand cmd11 = new SqlCommand("update Offre set libelle = @libelle, dateFinal = @dateFinal, description = @description, etat = @etat where idOffre = @idOffre", cnx);
            cmd11.Parameters.Clear();
            cmd11.Parameters.AddWithValue("libelle", Request.Form["ctl00$mainContent$offreName"]);
            cmd11.Parameters.AddWithValue("description", Request.Form["ctl00$mainContent$description"]);
            cmd11.Parameters.AddWithValue("dateFinal", Request.Form["ctl00$mainContent$finalDate"]);
            string etat1 = (Request.Form["ctl00$mainContent$cloturer"] == null) ? "open" : "closed";
            cmd11.Parameters.AddWithValue("etat", etat1);
            cmd11.Parameters.AddWithValue("idOffre", Request.Form["ctl00$mainContent$idOffre"]);
            try
            {
                DateTime runAt = new DateTime();
                if (image.HasFile)
                {
                    int id = int.Parse(idOffre.Value);
                    string filename = "";
                    try
                    {
                        filename = Path.GetFileName(image.FileName);
                        SqlCommand query = new SqlCommand("update Offre set image = @image where idOffre = @id", cnx);
                        query.Parameters.AddWithValue("id", id);
                        query.Parameters.AddWithValue("image", id + Path.GetExtension(filename).ToLower());
                        if (cnx.State != ConnectionState.Open)
                            cnx.Open();
                        query.ExecuteNonQuery();
                        image.SaveAs(Server.MapPath("~/imagesOffres/") + id + Path.GetExtension(filename).ToLower()); ;
                        cnx.Close();
                    }
                    catch (Exception)
                    {

                    }
                    runAt = new DateTime(int.Parse(DateTime.Parse(finalDate.Value).AddDays(1).Year.ToString()), int.Parse(DateTime.Parse(finalDate.Value).AddDays(1).Month.ToString()), int.Parse(DateTime.Parse(finalDate.Value).AddDays(1).Day.ToString()), 0, 0, 0);
                    if (runAt <= DateTime.Now)
                    {
                        Console.WriteLine("Test");
                        schedule.cloturer(id, offreName.Value);
                    }
                    else
                    {
                        Console.WriteLine("Test 2");
                        var delay = runAt - DateTime.Now;
                        System.Threading.Tasks.Task.Delay(delay).ContinueWith(_ => schedule.cloturer(id, offreName.Value));
                    }
                }

                if (cnx.State != ConnectionState.Open)
                    cnx.Open();
                cmd11.ExecuteNonQuery();
                cnx.Close();
                alert.InnerHtml = "<div class='alert alert-success' role='alert'>Offre modifiée avec success</div>";

            }
            catch (Exception ex)
            {
                alert.InnerHtml = "<div class='alert alert-danger' role='alert'>" + ex.Message + "<br>" + ex + "</div>";
            }

            List<int> ids = new List<int>();
            if (etat1 == "closed")
            {
                SqlCommand cmd0 = new SqlCommand("select idCandidature from Candidature where offre = @offre", cnx);
                try
                {
                    cmd0.Parameters.AddWithValue("offre", idOffre.Value);
                    if (cnx.State != ConnectionState.Open)
                        cnx.Open();
                    SqlDataReader reader0;
                    reader0 = cmd0.ExecuteReader();
                    while (reader0.Read())
                    {
                        ids.Add(reader0.GetInt32(0));
                    }
                    cnx.Close();
                    reader0.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message + "<br>" + ex.ToString());
                    return;
                    if (cnx.State == ConnectionState.Open)
                        cnx.Close();
                }

                

                if (ids.Count <= 0)
                    return;

                SqlCommand cmd1 = new SqlCommand("select AnneeBac,SerieBac,MentionBac,EtablisementDiplome,TypeDiplome,Filiere,StageDurantFormation,DureeStage,ConnaissanceTheoriques,ConnaissancePratiques,ConnaissanceLangueEtrangère,ConnaissanceInformatiqueOutilsTechnologiques,ConnaissancesPlanificationCoordinationOrganisation,ConnaissancesCommunicationPratiqueLangues,SatisfactionDiplomeObtenu,Ville,EmploiCorrespondAttente,EmploiCorrespondFormation,MilieuResidence,dateNaissance,Sexe,SituationFamiliale from Candidature where offre = @offre", cnx);
                cmd1.Parameters.AddWithValue("offre", idOffre.Value);
                try
                {
                    if (cnx.State != ConnectionState.Open)
                        cnx.Open();
                    SqlDataReader reader1;
                    reader1 = cmd1.ExecuteReader();
                    string Json = sqlDatoToJson(reader1);

                    var httpWebRequest = (HttpWebRequest)WebRequest.Create("https://hiringapi2.herokuapp.com");
                    httpWebRequest.ContentType = "application/json";
                    httpWebRequest.Method = "POST";

                    using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                    {
                        streamWriter.Write(Json);
                    }

                    var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                    using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                    {
                        var result = streamReader.ReadToEnd();

                        string json2 = result.Substring(15, result.Length - 18);

                        List<string> decisionList = JsonConvert.DeserializeObject<List<string>>(json2);
                        int entier = 0;
                        SqlCommand cmd00 = new SqlCommand("update Candidature set DecisionEmbauche = @decision where idCandidature = @id", cnx);
                        foreach (string r in decisionList)
                        {
                            if (cnx.State != ConnectionState.Open)
                                cnx.Open();
                            cmd00.Parameters.AddWithValue("decision", r);
                            cmd00.Parameters.AddWithValue("id", ids[entier]);
                            cmd00.ExecuteNonQuery();
                            cnx.Close();
                            entier++;
                            cmd00.Parameters.Clear();
                        }
                    }
                    if (cnx.State == ConnectionState.Open)
                        cnx.Close();
                    //Response.Write(ids
                    reader1.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message + "<br>" + ex.ToString());
                    return;
                }
            }

            if (Request.QueryString["id"] != null)
            {
                //Response.Redirect("offre.aspx");
                int id = int.Parse(Request.QueryString["id"].ToString());
                SqlCommand query = new SqlCommand("select libelle ,description, etat, dateFinal from Offre where idOffre = @id", cnx);
                query.Parameters.AddWithValue("id", id);
                SqlDataReader reader;
                try
                {
                    if (cnx.State != ConnectionState.Open)
                        cnx.Open();
                    reader = query.ExecuteReader();
                    if (reader.Read())
                    {
                        offreName.Value = reader.GetString(0);
                        description.Value = reader.GetString(1);
                        if (reader[3] != null)
                            finalDate.Value = reader[3].ToString();
                        etat.Value = (reader.GetString(2) == "open") ? "Ouverte" : "Clôtué";
                        if (reader.GetString(2) != "open")
                        {
                            closeHtml.InnerHtml = "";
                            closeHtml.InnerHtml = "<a href='sendmail.aspx?idOffre=" + Request.QueryString["id"] + "' class='btn btn-outline-dark' >Envoyer Email</a>";
                        }
                        idOffre.Value = id.ToString();
                        cnx.Close();
                        reader.Close();
                    }
                    else
                    {
                        Response.Redirect("offre.aspx");
                    }
                }
                catch (Exception)
                {

                }
            }
            else
            {
                Response.Redirect("offre.aspx");
            }

            //Response.Redirect("offre.aspx?id=" + Request.Form["ctl00$mainContent$idOffre"]);
        }
    }
}
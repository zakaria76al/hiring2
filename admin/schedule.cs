using EASendMail;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;

namespace Hiring.admin
{
    public class schedule
    {
        static SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);

        static String sqlDatoToJson(SqlDataReader dataReader)
        {
            var dataTable = new DataTable();
            dataTable.Load(dataReader);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(dataTable);
            return JSONString;
        }

        public static void cloturer(int idOffre, string offreName)
        {
            SqlCommand cmd = new SqlCommand("select datefinal from Offre where idOffre = " + idOffre, cnx);
            if(cnx.State != ConnectionState.Open)
                cnx.Open();
            if (DateTime.Parse(cmd.ExecuteScalar().ToString()) > DateTime.Today)
            {
                cnx.Close();
                return;
            }

            List<int> ids = new List<int>();
            SqlCommand cmd0 = new SqlCommand("select idCandidature from Candidature where offre = @offre", cnx);
            try
            {
                cmd0.Parameters.AddWithValue("offre", idOffre);
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
                //return;
                /*if (cnx.State == ConnectionState.Open)
                    cnx.Close();*/
            }

            if (ids.Count <= 0)
                return;

            SqlCommand cmd1 = new SqlCommand("select AnneeBac,SerieBac,MentionBac,EtablisementDiplome,TypeDiplome,Filiere,StageDurantFormation,DureeStage,ConnaissanceTheoriques,ConnaissancePratiques,ConnaissanceLangueEtrangère,ConnaissanceInformatiqueOutilsTechnologiques,ConnaissancesPlanificationCoordinationOrganisation,ConnaissancesCommunicationPratiqueLangues,SatisfactionDiplomeObtenu,Ville,EmploiCorrespondAttente,EmploiCorrespondFormation,MilieuResidence,dateNaissance,Sexe,SituationFamiliale from Candidature where offre = @offre", cnx);
            cmd1.Parameters.AddWithValue("offre", idOffre);
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
                reader1.Close();
            }
            catch (Exception ex)
            {
                
            }

            try
            {
                SmtpMail oMail = new SmtpMail("TryIt");

                oMail.From = "Hiring ML";
                oMail.To = "zakariaalouani2@gmail.com";

                oMail.Subject = "Read Me Please";
                oMail.HtmlBody = "<h1>L'offre " + offreName + " a été cloturée</h1><br><p>Veuillez consulter votre page d'administration pour voir les résultats de la sélection des candidats</p>";

                // Your SMTP server address
                SmtpServer oServer = new SmtpServer("smtp.gmail.com");
                // User and password for ESMTP authentication
                oServer.User = "zakaria76alouani@gmail.com";
                oServer.Password = "cmdojttevgvfhrsh";

                // Set SSL 465 port
                oServer.Port = 465;
                // Set direct SSL connection, you can also use ConnectSSLAuto
                oServer.ConnectType = SmtpConnectType.ConnectDirectSSL;

                SmtpClient oSmtp = new SmtpClient();
                oSmtp.SendMail(oServer, oMail);

                
            }
            catch (Exception ep)
            {
                
            }
        }
    }
}
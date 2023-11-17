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
    public partial class charts : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (Session["login"] == null)
                Response.Redirect("login.aspx");*/
            SqlCommand query = new SqlCommand("select O.Libelle, count(C.idCandidature) as Nombre, O.dateFinal from Candidature C right join Offre O on C.offre = O.idOffre where O.etat = 'open' group by O.idOffre, O.Libelle, O.dateFinal", cnx);

            try
            {
                SqlDataReader reader;
                if (cnx.State != System.Data.ConnectionState.Open)
                    cnx.Open();
                reader = query.ExecuteReader();
                string libelle;
                int count;
                DateTime dateFinal = new DateTime(); ;
                while (reader.Read())
                {
                    libelle = reader.GetString(0);
                    count = reader.GetInt32(1);
                    dateFinal = reader.GetDateTime(2);
                    double days = (dateFinal - DateTime.Today).TotalDays;
                    if (days < 0)
                        days = 0;
                    candidatureOffre.InnerHtml += "<tr><th scope='row'>" + libelle + "</th><td style=''>" + count + "</td><td style=''>" + days + "</td></tr>";
                }
                cnx.Close();
            }
            catch (Exception ex)
            {
                candidatureOffre.InnerHtml += ex;
            }

            List<int> ids = new List<int>();
            List<string> offres = new List<string>();
            try
            {
                SqlCommand cmd1 = new SqlCommand("select idOffre, libelle from Offre where etat = 'closed'", cnx);
                if(cnx.State != System.Data.ConnectionState.Open)
                    cnx.Open();
                SqlDataReader reader1 = cmd1.ExecuteReader();
                while(reader1.Read())
                {
                    ids.Add(reader1.GetInt32(0));
                    offres.Add(reader1.GetString(1));
                }
                cnx.Close();
            }
            catch (Exception)
            {

            }

            SqlCommand query1 = new SqlCommand("select count(*) from Candidature where offre = @offre and DecisionEmbauche = 'Oui'", cnx);
            SqlCommand query2 = new SqlCommand("select count(*) from Candidature where offre = @offre and DecisionEmbauche = 'Non'", cnx);
            int i = 0;
            foreach (int id in ids)
            {
                try
                {
                    query1.Parameters.AddWithValue("offre", id);
                    query2.Parameters.AddWithValue("offre", id);
                    if(cnx.State != System.Data.ConnectionState.Open)
                        cnx.Open();
                    int oui = int.Parse(query1.ExecuteScalar().ToString());
                    int non = int.Parse(query2.ExecuteScalar().ToString());
                    double Poui = System.Math.Round((double.Parse(oui.ToString()) * 100 / (oui + non)), 2);
                    double Pnon = System.Math.Round((double.Parse(non.ToString()) * 100 / (oui + non)), 2);
                    double Odeg = Poui * 360 / 100;
                    double Ndeg = Pnon * 360 / 100;
                    acceptedPerOffre.InnerHtml += "<div class='card col-sm-4'><div class='card-header'></div><div class='card-body'><style>.o-" + id + " {--value: " + Poui + " %;} .n-" + id + " {--value: " + Pnon + " %;}</style><div class='column'><h5>" + offres[i] + "</h5><h5>Candidatures total : " + (oui + non) + "</h5><p><div class='chart o-" + id + "' style='background-image:conic-gradient(lightseagreen " + Convert.ToInt32(Odeg )+ "deg, lightgrey 0deg)'><p style='text-align:center;'>" + Poui + "<br>Acceptés</p></div><div class='chart n-" + id + "' style='background-image:conic-gradient(#e42a3b " + Convert.ToInt32(Ndeg) + "deg, lightgrey 0deg)'><p style='text-align:center;'>" + Pnon + "<br>Refusés</p></div></p></div></div></div>";

                    query1.Parameters.Clear();
                    query2.Parameters.Clear();
                    cnx.Close();
                }
                catch (Exception ex)
                {
                    acceptedPerOffre.InnerText += ex.ToString();
                }
            }
        }
    }
}
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
    public partial class offre : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand query = new SqlCommand("select idOffre, libelle, description, etat from Offre", cnx);
            SqlDataReader reader;

            try
            {
                if (cnx.State != System.Data.ConnectionState.Open)
                    cnx.Open();
                reader = query.ExecuteReader();
                int id;
                string libelle = "";
                string description = "";
                string etat;
                int i = 0;
                while (reader.Read())
                {
                    id = reader.GetInt32(0);
                    libelle = reader.GetString(1);
                    description = reader.GetString(2);
                    etat = reader.GetString(3);
                    string html = "<div class='col-sm-12'><div class='card'><div class='card-header'><h5 class='mb-0'>" + libelle + "</h5><hr><button class='btn btn-primary  m-t-5' type='button' data-toggle='collapse' data-target='#collapseExample" + i + "' aria-expanded='false' aria-controls='collapseExample" + i + "'>Afficher plus</button></div><div class='collapse' id='collapseExample" + i + "'><div class='card-body'><pre style='font-family:Open Sans, sans-serif; white-space: pre-wrap;word-wrap: break-word;white-space: -o-pre-wrap;white-space: -pre-wrap;white-space: -moz-pre-wrap;' class='mb-0'>" + description + "</pre><a href='updateoffre.aspx?id=" + id + "' class='btn btn-primary m-2'>Modifier</a></div></div></div></div>";
                    offresTabs.InnerHtml += html;
                    i++;
                }
            }
            catch (Exception ex)
            {
                
            }
        }
    }
}
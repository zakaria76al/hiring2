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
    public partial class hiring : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["id"] == null && Request.QueryString["candidature"] == null)
            {
                Response.Redirect("offres.aspx");
            }
            
            if(Request.QueryString["id"] != null)
            {
                //add offre id to form
                SqlCommand cmd = new SqlCommand("select libelle, etat from Offre where idOffre = @idOffre", cnx);
                cmd.Parameters.AddWithValue("idOffre", Request.QueryString["id"]);
                SqlDataReader reader;
                try
                {
                    if (cnx.State == System.Data.ConnectionState.Closed)
                        cnx.Open();
                    reader = cmd.ExecuteReader();
                    if(reader.Read())
                    {
                        if(reader.GetString(1) != "open")
                        {
                            Response.Redirect("offres.aspx");
                        }
                        string nameOffre = reader.GetString(0);
                        
                        offreNom.InnerText += " " + nameOffre;
                        offreId.Value = Request.QueryString["id"];
                    }
                    else
                    {
                        Response.Redirect("offres.aspx");
                    }

                    
                }
                catch (Exception)
                {
                    Response.Redirect("offres.aspx");
                }
                
            }

            if(Request.QueryString["candidature"] != null)
            {
                if(Request.QueryString["candidature"] == "sent")
                {
                    postulerBlock.InnerHtml = "";
                    postulerBlock.InnerHtml = "<div class='alert alert-success alert-dismissible fade show' role='alert'><strong> Candidature confirmer! </strong> avec success<button type = 'button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                    return;
                }
                else
                {
                    postulerBlock.InnerHtml = "";
                    postulerBlock.InnerHtml = "<div class='alert alert-warning alert-dismissible fade show' role='alert'><strong> Candidature échoué! </strong> <button type = 'button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                    return;
                }
            }
        }
    }
}
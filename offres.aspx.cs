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
    public partial class offres : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataReader reader;
            if (Request.QueryString["id"] != null)
            {
                string Str = "select idOffre, libelle, description, etat, image, dateFinal from Offre where idOffre = @id";
                SqlCommand cmd = new SqlCommand(Str, cnx);
                cmd.Parameters.AddWithValue("id", Request.QueryString["id"]);

                try
                {
                    if (cnx.State != System.Data.ConnectionState.Open)
                        cnx.Open();
                    reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        if (reader.GetString(3) == "open")
                        {
                            string nomOffre = reader.GetString(1);
                            string description = reader.GetString(2);
                            int id = reader.GetInt32(0);
                            string image = "no-image.png";
                            DateTime dateFinal = reader.GetDateTime(5).Date;
                            try
                            {
                                image = reader.GetString(4);
                            }
                            catch (Exception)
                            {

                            }
                            offreInfos.InnerHtml = "<section class='col-sm-12 m-0 p-0'><div class='row justify-content-between'><h3 class='text-heading'>" + nomOffre + "</h3><p>Date finale : "+ dateFinal.DayOfWeek + " " + dateFinal.Day + " / " + dateFinal.Month + " / " + dateFinal.Year + "</p></div><div class='service_icon'><img class='col-sm-6 pb-3' src='imagesOffres/" + image + "' ></div><div class='container box_1170'><pre style='width: 100%; overflow: hidden; font-family: Poppins, sans-serif; font-size: medium;' class='sample-text'>" + description + "</pre></div><a href='hiring.aspx?id=" + id + "' class='genric-btn primary'>Postuler</a></section>";
                            return;
                        }
                        else
                        {
                            Response.Redirect("offres.aspx?offre=notfound");
                        }
                    }
                    else
                    {
                        Response.Redirect("offres.aspx?offre=notfound");
                    }
                    return;
                }
                catch (Exception)
                {
                    Response.Redirect("offres.aspx");
                }
            }

            string queryStr = "select idOffre, libelle, description, image from Offre where etat = 'open'";
            SqlCommand query = new SqlCommand(queryStr, cnx);

            try
            {
                if (cnx.State != System.Data.ConnectionState.Open)
                    cnx.Open();
                reader = query.ExecuteReader();
                while(reader.Read())
                {
                    string libelle = reader.GetString(1);
                    string text;
                    string image = "no-image.png";
                    try
                    {
                        image = reader.GetString(3);
                    }
                    catch (Exception)
                    {

                    }
                    try
                    {
                        text = reader.GetString(2).ToString().Substring(0, 120) + "...";
                    }
                    catch (Exception)
                    {
                        text = reader.GetString(2);
                    }
                    
                    int idOffre = reader.GetInt32(0);
                    offresActive.InnerHtml += "<div class='col-xl-4 col-md-6 col-lg-4'><div style='max-height: 250px;' class='service_icon'><img style='width:100%;' src='imagesOffres/" + image+"' ></div><div class='single_service text-center'><h3>" + libelle + "</h3><p>" + text + "</p><a href='offres.aspx?id="+ idOffre +"' class='learn_more'>Afficher plus</a></div></div>";
                }
                cnx.Close();
            }
            catch (Exception ex)
            {
                //offresActive.InnerText += ex.Message;
            }
            
        }
    }
}
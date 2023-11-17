using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

namespace Hiring.admin
{
    public partial class newoffre : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
                Response.Redirect("login.aspx");
            /*if (Request.QueryString["offre"] != null && Request.QueryString["offre"] == "added")
            {
                alert.InnerHtml = "<div class='alert alert-success' role='alert' style='font-weight: 800;'>Offre ajouté avec success</div>";
                //contentForm.InnerHtml = "";
            }*/
        }

        protected void Ajouter_Click(object sender, EventArgs e)
        {
            SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
            
            string queryStr = "insert into Offre(libelle, description, etat, dateFinal) values (@libelle, @description, @etat, @dateFinal)";
            SqlCommand query = new SqlCommand(queryStr, cnx);
            query.Parameters.AddWithValue("libelle", offreName.Value);
            query.Parameters.AddWithValue("description", description.Value);
            query.Parameters.AddWithValue("dateFinal", finalDate.Value);
            query.Parameters.AddWithValue("etat", "open");

            DateTime runAt = new DateTime();
            try
            {
                if (cnx.State == System.Data.ConnectionState.Closed)
                    cnx.Open();
                query.ExecuteNonQuery();
                //Response.Redirect("newoffre.aspx?offre=added");
                cnx.Close();
                alert.InnerHtml = "<div class='alert alert-success' role='alert' style='font-weight: 800;'>Offre ajouté avec success</div>";

                runAt = new DateTime(int.Parse(DateTime.Parse(finalDate.Value).AddDays(1).Year.ToString()), int.Parse(DateTime.Parse(finalDate.Value).AddDays(1).Month.ToString()), int.Parse(DateTime.Parse(finalDate.Value).AddDays(1).Day.ToString()), 0, 0, 0);
            }
            catch (Exception ex)
            {
                alert.InnerHtml = "<div class='alert alert-warning' role='alert' style='font-weight: 800;'>Une erreur est survenu lors l'ajout de l'offre</div><br>"+ ex.Message;
                //Response.Redirect("newoffre.aspx?error=err");
                //return;
            }

            int idOffre00 = 0;
            if(image.HasFile)
            {
                int id = 0;
                string filename = "";
                try
                {
                    query = new SqlCommand("select max(idOffre) from Offre", cnx);
                    try
                    {
                        if (cnx.State != System.Data.ConnectionState.Open)
                            cnx.Open();
                        id = int.Parse(query.ExecuteScalar().ToString());
                        idOffre00 = id;
                        filename = Path.GetFileName(image.FileName);
                        
                        image.SaveAs(Server.MapPath("~/imagesOffres/") + id + Path.GetExtension(filename).ToLower());
                        cnx.Close();
                    }
                    catch (Exception)
                    {

                    }
                    query = new SqlCommand("update Offre set image = @image where idOffre = @id", cnx);
                    query.Parameters.AddWithValue("id", id);
                    query.Parameters.AddWithValue("image", id + Path.GetExtension(filename).ToLower());
                    if (cnx.State != System.Data.ConnectionState.Open)
                        cnx.Open();
                    query.ExecuteNonQuery();
                    cnx.Close();
                }
                catch (Exception)
                {

                }
            }
            else
            {
                int id1 = 0;
                query = new SqlCommand("select max(idOffre) from Offre", cnx);
                try
                {
                    if (cnx.State != System.Data.ConnectionState.Open)
                        cnx.Open();
                    id1 = int.Parse(query.ExecuteScalar().ToString());
                    idOffre00 = id1;
                    cnx.Close();
                }
                catch (Exception)
                {

                }
                query = new SqlCommand("update Offre set image = @image where idOffre = @id", cnx);
                query.Parameters.AddWithValue("id", id1);
                query.Parameters.AddWithValue("image", "no-image.png");
                if (cnx.State != System.Data.ConnectionState.Open)
                    cnx.Open();
                query.ExecuteNonQuery();
                cnx.Close();
            }

            if (runAt <= DateTime.Now)
            {
                Console.WriteLine("Test");
                schedule.cloturer(idOffre00, offreName.Value);
            }
            else
            {
                Console.WriteLine("Test 2");
                var delay = runAt - DateTime.Now;
                System.Threading.Tasks.Task.Delay(delay).ContinueWith(_ => schedule.cloturer(idOffre00,offreName.Value));
            }
        }
    }
}
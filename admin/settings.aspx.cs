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
    public partial class settings : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
        SqlCommand query;
        protected void Page_Load(object sender, EventArgs e)
        {
            query = new SqlCommand("select nom, email from Administrateur where userName = @username", cnx);
            query.Parameters.AddWithValue("username", Session["login"]);
            try
            {
                if (cnx.State != System.Data.ConnectionState.Open)
                    cnx.Open();
                SqlDataReader reader = query.ExecuteReader();
                if(reader.Read())
                {
                    nom.Value = reader.GetString(0);
                    email.Value = reader.GetString(1);
                }
                cnx.Close();
            }
            catch (Exception ex)
            {
                nom.Value = ex.Message;
            }
        }

        protected void Modifier_Click(object sender, EventArgs e)
        {
            if(password.Value != "" && password.Value == password2.Value && nom.Value != "" && email.Value != "")
            {
                query = new SqlCommand("update Administrateur set nom = @nom, email = @email, password = @password where userName = @username", cnx);
                query.Parameters.AddWithValue("nom", nom.Value);
                query.Parameters.AddWithValue("email", email.Value);
                query.Parameters.AddWithValue("password", password.Value);
                query.Parameters.AddWithValue("username", Session["login"]);
                try
                {
                    if (cnx.State != System.Data.ConnectionState.Open)
                        cnx.Open();
                    query.ExecuteNonQuery();
                    cnx.Close();
                    Response.Redirect("settings.aspx?modification=done");
                }
                catch (Exception)
                {

                }
            }
            else if (password.Value == "" && password.Value == password2.Value && nom.Value != "" && email.Value != "")
            {
                query = new SqlCommand("update Administrateur set nom = @nom, email = @email where userName = @username", cnx);
                query.Parameters.AddWithValue("nom", nom.Value);
                query.Parameters.AddWithValue("email", email.Value);
                query.Parameters.AddWithValue("username", Session["login"]);
                try
                {
                    if (cnx.State != System.Data.ConnectionState.Open)
                        cnx.Open();
                    query.ExecuteNonQuery();
                    cnx.Close();
                    Response.Redirect("settings.aspx?modification=done");
                }
                catch (Exception)
                {

                }
            }
            else
            {
                Response.Redirect("settings.aspx??modification=error");
            }
        }
    }
}
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
    public partial class login : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] != null)
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void Signin_Click(object sender, EventArgs e)
        {
            SqlDataReader reader;
            SqlCommand query = new SqlCommand("select userName,password,role from Administrateur where userName = @login", cnx);
            query.Parameters.AddWithValue("login", user.Text);
            /*try
            {*/
                cnx.Open();
                reader = query.ExecuteReader();
                //cnx.Close();
                if (reader.HasRows)
                {
                    reader.Read();
                    if (Password.Text == reader.GetString(1))
                    {
                        Session["login"] = reader.GetString(0);
                        Session["role"] = reader.GetString(2);
                        Response.Redirect("index.aspx");
                        return;
                    }
                    else
                    {
                        Response.Redirect("login.aspx?mdp=err");
                        return;
                    }
                }
                else
                {
                    Response.Redirect("login.aspx?account=notfound");
                    return;
                }
            /*}
            catch (Exception ex)
            {
                Response.Redirect(ex.Message);
            }*/
        }
    }
}
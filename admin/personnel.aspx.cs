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
    public partial class personnel : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if (Session["role"].ToString() != "admin")
                {
                    Response.Redirect("index.aspx");
                }
            }

            SqlCommand query = new SqlCommand("select userName, nom, email,role from Administrateur where role <> 'admin'", cnx);
            SqlDataReader reader;
            try
            {
                if (cnx.State != System.Data.ConnectionState.Open)
                    cnx.Open();
                reader = query.ExecuteReader();
                string nom, email, role, username;
                while (reader.Read())
                {
                    username = reader.GetString(0);
                    nom = reader.GetString(1);
                    email = reader.GetString(2);
                    role = reader.GetString(3);
                    personnels.InnerHtml += "<tr><td>" + nom + "</td><td>" + email + "</td><td>" + role + "</td><td>" + "<a href='deletePers.aspx?username=" + username + "' class='btn btn-outline-danger' >Supprimer</a></td></tr>";
                }
                cnx.Close();
            }
            catch (Exception ex)
            {
                personnels.InnerText += ex.Message;
            }
        }
    }
}
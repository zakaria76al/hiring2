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
    public partial class admin : System.Web.UI.MasterPage
    {
        SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
            {
                Response.Redirect("login.aspx");
            }
            SqlCommand query = new SqlCommand("select nom from Administrateur where username = @user", cnx);
            query.Parameters.AddWithValue("user", Session["login"]);
            
            try
            {
                if (cnx.State != System.Data.ConnectionState.Open)
                    cnx.Open();
                SqlDataReader reader = query.ExecuteReader();
                reader.Read();
                moredetails.InnerText = reader.GetString(0);
                cnx.Close();
            }
            catch (Exception)
            {

            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["login"] = null;
            Session["role"] = null;
            Response.Redirect("login.aspx");
        }
    }
}
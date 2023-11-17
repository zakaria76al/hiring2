using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Hiring.admin
{
    public partial class deletePers : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["login"] == null)
                Response.Redirect("login.aspx");
            else if(Request.QueryString["username"] != null)
            {
                SqlCommand query = new SqlCommand("delete Administrateur where username = @username and role <> 'admin'", cnx);
                if (cnx.State != ConnectionState.Open)
                    cnx.Open();
                query.Parameters.AddWithValue("username", Request.QueryString["username"]);
                query.ExecuteNonQuery();
                cnx.Close();
                Response.Redirect("personnel.aspx");
            }
            else
            {
                Response.Redirect("personnel.aspx");
            }
        }
    }
}
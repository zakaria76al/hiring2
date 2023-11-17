using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using EASendMail;

namespace Hiring.admin
{
    public partial class newpersonnel : System.Web.UI.Page
    {
        public string CreatePassword(int length)
        {
            const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            System.Text.StringBuilder res = new System.Text.StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }

        public void sendMail(string nom, string email, string password, string userName)
        {
            try
            {
                SmtpMail oMail = new SmtpMail("TryIt");

                oMail.From = "zakaria76alouani@gmail.com";
                oMail.To = email;

                oMail.Subject = "HiringML Password";
                oMail.HtmlBody =  "<strong>Hello " + nom + ",</strong><br>Your username is : " + userName + "<br>Your password is : " + password;

                // Your SMTP server address
                SmtpServer oServer = new SmtpServer("smtp.gmail.com");
                // User and password for ESMTP authentication
                oServer.User = "zakaria76alouani@gmail.com";
                oServer.Password = "cmdojttevgvfhrsh";

                // Set SSL 465 port
                oServer.Port = 465;
                // Set direct SSL connection, you can also use ConnectSSLAuto
                oServer.ConnectType = SmtpConnectType.ConnectDirectSSL;

                EASendMail.SmtpClient oSmtp = new EASendMail.SmtpClient();
                oSmtp.SendMail(oServer, oMail);

            }
            catch (Exception ex)
            {
                //Response.Redirect("newpersonnel.aspx?error=" + ex.Message);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if (Session["role"].ToString() != "admin")
                {
                    Response.Redirect("index.aspx");
                }
            }
            SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
            if (Request.Form["lastname"] != null && Request.Form["firstname"] != null && Request.Form["email"] != null)
            {
                string nom = Request.Form["firstname"];
                string prenom = Request.Form["lastname"];
                string email = Request.Form["email"];
                string userName = Request.Form["userName"];
                string password = CreatePassword(8);
                string queryStr = "insert into Administrateur(userName, nom, email, role, password) values (@userName, @nom, @email, @role, @password)";
                SqlCommand query = new SqlCommand(queryStr, cnx);
                query.Parameters.AddWithValue("userName", userName);
                query.Parameters.AddWithValue("nom", prenom + " " + nom);
                query.Parameters.AddWithValue("email", email);
                query.Parameters.AddWithValue("role", "RH");
                query.Parameters.AddWithValue("password", password);

                sendMail(prenom + " " + nom, email, password, userName);

                try
                {
                    if (cnx.State != System.Data.ConnectionState.Open)
                        cnx.Open();
                    query.ExecuteNonQuery();
                    cnx.Close();
                    Response.Redirect("newpersonnel.aspx?personnel=added");
                }
                catch (Exception ex)
                {
                    Response.Redirect("newpersonnel.aspx?username=used" + ex.Message);
                    return;
                }
            }
        }
    }
}
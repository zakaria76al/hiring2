using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using EASendMail;

namespace Hiring.admin
{
    public partial class sendmail : System.Web.UI.Page
    {
        SqlConnection cnx = new SqlConnection(WebConfigurationManager.ConnectionStrings["hiringDatabase"].ConnectionString);
        List<string> listEmails = new List<string>();
        List<string> listNames = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["login"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (Request.QueryString["idOffre"] == null)
                Response.Redirect("updateoffre.aspx");
            else
            {
                idOffre.Value = Request.QueryString["idOffre"];
            }
        }

        public void sendAnMail(string email, string Nom, string mailText)
        {
            try
            {
                SmtpMail oMail = new SmtpMail("TryIt");

                oMail.From = "Hiring ML";
                oMail.To = email;
                oMail.Subject = "Hiring";
                string a = mailText;
                oMail.TextBody = a.Replace("{nom}", Nom);

                // Your SMTP server address
                SmtpServer oServer = new SmtpServer("smtp.gmail.com");
                // User and password for ESMTP authentication
                oServer.User = "zakaria76alouani@gmail.com";
                oServer.Password = "cmdojttevgvfhrsh";

                // Set SSL 465 port
                oServer.Port = 465;
                // Set direct SSL connection, you can also use ConnectSSLAuto
                oServer.ConnectType = SmtpConnectType.ConnectDirectSSL;

                Console.WriteLine("start to send email ...");

                SmtpClient oSmtp = new SmtpClient();
                oSmtp.SendMail(oServer, oMail);
            }
            catch (Exception)
            {

            }
        }

        protected void send_Click(object sender, EventArgs e)
        {
            SqlDataReader reader;
            SqlCommand cmd = new SqlCommand("select nom + ' ' + prenom as name, email from Candidature where Offre = @offre and DecisionEmbauche = 'Oui'", cnx);
            try
            {
                int idoffre = int.Parse(idOffre.Value);
                cmd.Parameters.AddWithValue("offre", idoffre);
                if (cnx.State != ConnectionState.Open)
                    cnx.Open();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    listEmails.Add(reader.GetString(1));
                    listNames.Add(reader.GetString(0));
                }
                cnx.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            for (int i = 0; i < listNames.Count; i++)
            {
                sendAnMail(listEmails[i], listNames[i], mailTxt.Value);
            }
            Response.Redirect("sendmail.aspx?mail=sent&idOffre=" + idOffre.Value);
        }
    }
}
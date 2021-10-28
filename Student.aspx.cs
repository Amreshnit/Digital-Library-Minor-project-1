using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strPreviousPage = "";
        if (Request.UrlReferrer != null)
        {
            strPreviousPage = Request.UrlReferrer.Segments[Request.UrlReferrer.Segments.Length - 1];
        }
        if (strPreviousPage == "")
        {
            Response.Redirect("~/Login.aspx");
        }

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {

        try
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["LIBRARYConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("insert into Student (studentid,studentname,studentbranch,studentyear) values (@id,@name,@branch,@year)", conn);
            cmd.Parameters.AddWithValue("@id", txtStudentId.Text);
            cmd.Parameters.AddWithValue("@name", txtStudentName.Text);
            cmd.Parameters.AddWithValue("@branch", ddlBranch.SelectedValue );
            cmd.Parameters.AddWithValue("@year", ddlyear.SelectedValue);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                txtStudentId.Text = "";
                txtStudentName.Text = "";
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('"+ex.Message+"');", true);


            }
            finally
            {
                conn.Close();
            }


        }
        catch (Exception ex)
        {
            string script = "<script>alert('" + ex.Message + "');</script>";
        }
        
    }
}
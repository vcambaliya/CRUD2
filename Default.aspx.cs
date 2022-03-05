using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\ABC\Documents\Visual Studio 2010\WebSites\WebSite4\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string lan="";
        foreach (ListItem li in CheckBoxList1.Items)
        {
            if (li.Selected)
            {
                lan += li.Text + ",";

            }
        }
SqlCommand cmd=new SqlCommand("INSERT INTO [Student] ([StudentName], [Gender], [Language], [City]) VALUES (@StudentName, @Gender, @Language, @City)",con);
        cmd.Parameters.AddWithValue("@StudentName",TextBox1.Text);
        cmd.Parameters.AddWithValue("@Gender",RadioButtonList1.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@Language",lan);
        cmd.Parameters.AddWithValue("@City",DropDownList1.SelectedItem.Text);
        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();
        if (s == 1)
        {
            Literal1.Text = "Record is Successfully Inserted";
            Clear();
            Print();
        }
    }
    protected void  TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn=(Button)sender;
        SqlCommand cmd = new SqlCommand("DELETE FROM [Student] WHERE [id]=@id",con);
        cmd.Parameters.AddWithValue("@id",btn.CommandArgument);
        con.Open();
        int s=cmd.ExecuteNonQuery();
        con.Close();
        if (s == 1)
        {
            Literal1.Text = "Successfully Delete";
            Clear();
            Print();
        }
        else
        {
            Literal1.Text = "Error";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string check="";
        foreach(ListItem li in CheckBoxList1.Items)
        {
            li.Selected = false;    
        }
        Button btn = (Button)sender;
SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[StudentName],[Gender],[Language],[City] FROM [Student] WHERE [id]=" + btn.CommandArgument, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        TextBox1.Text = dt.Rows[0][1].ToString();
        RadioButtonList1.Text= dt.Rows[0][2].ToString();
        check = dt.Rows[0][3].ToString();
        string[] cl = check.Split(',');
        foreach (var item in cl)
        {
            foreach (ListItem li in CheckBoxList1.Items)
            {
                if (item == li.ToString())
                {
                    li.Selected = true;
                }
            }
        }

        DropDownList1.Text = dt.Rows[0][4].ToString();
        ViewState["id"] = btn.CommandArgument;

    }
    public void Clear()
    {
        TextBox1.Text = "";
        RadioButtonList1.ClearSelection();
        CheckBoxList1.ClearSelection();
        DropDownList1.ClearSelection();
    }
    public void Print()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id],[StudentName],[Gender],[Language],[City] FROM [Student]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        string lan = "";
        foreach (ListItem li in CheckBoxList1.Items)
        {
            if (li.Selected)
            {
                lan += li.Text + ",";

            }
        }
        SqlCommand cmd = new SqlCommand("UPDATE [Student] SET [StudentName] = @StudentName, [Gender] = @Gender, [Language] = @Language, [City] = @City WHERE [id] = @id", con);
        cmd.Parameters.AddWithValue("@StudentName", TextBox1.Text);
        cmd.Parameters.AddWithValue("@Gender", RadioButtonList1.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@Language", lan);
        cmd.Parameters.AddWithValue("@City", DropDownList1.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@id",ViewState["id"]);
        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();
        if (s == 1)
        {
            Literal1.Text = "Record is Successfully UpDated";
            Clear();
            Print();
        }
 
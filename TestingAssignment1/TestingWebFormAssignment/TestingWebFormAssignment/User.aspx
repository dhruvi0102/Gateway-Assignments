﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="UserForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    protected void btn_autogeneratenumber_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UserEntities"].ToString());        
        con.Open();
        SqlCommand cmd = new SqlCommand("proc_InsertAutoGenNumber", con);        
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@recordid", SqlDbType.VarChar).Value = lblrecordid.Text;
        cmd.Parameters.Add("@recordname", SqlDbType.VarChar).Value = txtrecordname.Text;
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            lblerror.Text = "Record Inserted Successfully...";
        }
        else
        {
            lblerror.Text = "Error in Record Inserting...";
        }
        con.Close();
    }
</script>




<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #table1
      {
          border-collapse:collapse;
      }
      #table1 th, #table1 td, td1, td2, #table1 #td1, #td2
      {
          border:1px solid #dddddd;
      }
      #table1 th
      {
          padding:5px 7px 5px 7px;
          color:cyan;
          font-weight:bold;
          background:#000000;
      }
      #table1 td, td1, td2, #table1 #td1, #td2, #table1 #txtrecordname, #table1 #txtrecordname:hover
      {     
          padding:5px;
      }
      #table1 #td1, #td2
      {    
          font-weight:bold;
          background:#fafafa;
      }
      #table1 #btn_autogeneratenumber
      {
          padding:5px 7px 5px 7px;
          border-color:#2c2c2c;
      }
      #table1 #txtrecordname, #table1 #txtrecordname:hover
      {
          width:200px;
      }
      #table1 #txtrecordname:hover, #table1 #btn_autogeneratenumber
      {
          background:#2c2c2c;
          color:#ffffff;
      }
      #table1 #btn_autogeneratenumber:hover
      {
          background:#0000cc;
          padding:5px 7px 5px 7px;
          color:#fafafa;
          border-color:#0000cc;
      }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table id="table1">
      
      
      <tr>
       <td id="td1">Passenger Number : </td>
       <td colspan="2"><asp:Label ID="lblpassengerNumber" runat="server"></asp:Label></td>
      </tr>
      <tr>
       <td id="td2">First Name :</td>
       <td colspan="2"><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
      </tr> 
      <tr>
      <td colspan="3"><asp:Button ID="btn_autogeneratenumber" Text="Create Record" 
              runat="server" style="text-align:center;" 
              onclick="btn_autogeneratenumber_Click" /></td>
      </tr> 
     </table>
    </div>
 
    <br />
    <br />
    <br />
    <asp:HyperLink ID="LinkButton1" NavigateUrlrl="~/AutoGenerateNumberForm.aspx" 
        runat="server" NavigateUrl="~/AutoGenerateNumberForm.aspx">Create New Entry </asp:HyperLink>
    </form>
</body>
</html>
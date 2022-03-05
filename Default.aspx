<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
        .style2
        {
            height: 24px;
        }
        .style3
        {
            height: 23px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <table align="center" style="width: 61%; height: 156px;">
        <tr>
            <td class="style3" colspan="2">
                REGISTRATION</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label1" runat="server" Text="StudentName"></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="TextBox1" runat="server" Width="196px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label2" runat="server" Text="Gender"></asp:Label>
            </td>
            <td class="style1">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label3" runat="server" Text="Language"></asp:Label>
            </td>
            <td class="style1">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem>C#</asp:ListItem>
                    <asp:ListItem>SEO</asp:ListItem>
                    <asp:ListItem>ASP.Net</asp:ListItem>
                    <asp:ListItem>Java</asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" Text="City"></asp:Label>
            </td>
            <td class="style2">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Gondal</asp:ListItem>
                    <asp:ListItem>Rajkot</asp:ListItem>
                    <asp:ListItem>Surat</asp:ListItem>
                    <asp:ListItem>Ahemdabad</asp:ListItem>
                    <asp:ListItem>Baroda</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    style="text-align: center" Text="INSERT" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" Text="UPDATE" onclick="Button4_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style1">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("id") %>' 
                                    onclick="Button2_Click" Text="DELETE" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Update">
                            <ItemTemplate>
                                <asp:Button ID="Button3" runat="server" CommandArgument='<%# Eval("id") %>' 
                                    onclick="Button3_Click" Text="UPDATE" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
    </form>
</body>
</html>

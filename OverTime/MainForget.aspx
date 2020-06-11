<%@ Page Title="Forget Password" Language="C#" MasterPageFile="~/MasterAbout.master" AutoEventWireup="true" CodeFile="MainForget.aspx.cs" Inherits="MainForget" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
       
        .style22
        {
            padding-left:20px;
            width: 100%;
            height: 290px;
            background-repeat:repeat-x;
            background-image: url("images/img79.jpg");
            background-position: right;
        }
        .style23
        {
            font-weight: bold;
            
        }
        .style25
        {
            width:198px;
            height:303px;
            float:left;
            padding-left:20px;
        }
        .style26
        {
            padding-right:300px;
            
        }
        .style29
        {
            text-align: center;
        }
    .style30
    {
        height: 22px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <br/>
    <div align="center">
        <table border="1px" width="100%" align="center" frame="border" bgcolor="#FFFFFF">
            <tr>
                <td bgcolor="#CCCCCC" class="style22">
                    <table width="100%" style="height: 247px">
                    <tr>
                    <td align="center" class="style26">
                        
                <img src="images/img1009.png" class="style25"/><h1 style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: blink;
                font-size: 28px; width: 238px;" >
                <asp:Button ID="Button2" runat="server" Text="Go Back" Font-Names="Courier New" 
                    Font-Size="Large" Width="100px" CssClass="style23" onclick="Button2_Click"  />
                   

                        </h1>
                            
                            
                            <table>
                            <tr><td colspan="2" align="center">
                        <h1 style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" >
                    FORGET PASSWORD</h1></td></tr>
                    <tr><td align="center">
                        <h1 style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration:  blink;
                font-size: 28px;" >
                    PS No.:</h1></td>
                        <td align="center">
                            <asp:TextBox ID="TextBox1" runat="server" autocompelete="off" ToolTip="PS NO. of Employee"></asp:TextBox></td></tr>
                            <tr><td colspan="2" align="center">
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="     Adminstrator" 
                                    style="font-family: 'Courier New'; font-weight: 700; font-size: medium" /></td></tr>
                    <tr><td class="style29" colspan="2">
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Change Password" Font-Names="Courier New" 
                    Font-Size="Large" Width="178px" CssClass="style23" onclick="Button1_Click"  />
                        </td>
                    </tr>
                    <tr><td class="style30" colspan="2" align="center">
                        <asp:Label ID="Label1" runat="server" 
                            style="color: #CC0000; font-weight: 700; font-family: 'Courier New'; font-size: medium" 
                            Text="Label" Visible="false"></asp:Label>
                        </td></tr>
                        <tr><td class="style30" colspan="2" align="center">
                        <asp:Label ID="Label2" runat="server" 
                            style="color: #CC0000; font-weight: 700; font-family: 'Courier New'; font-size: medium" 
                             ></asp:Label>
                        </td></tr>
                        <tr><td><asp:Label ID="Label3" runat="server" 
                            style="color: #CC0000; font-weight: 700; font-family: 'Courier New'; font-size: medium" 
                            visible= "false" ></asp:Label></td></tr>
                    </table>
                 </td>
                 </tr>
            
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>



<%@ Page Title="Logout" Language="C#" MasterPageFile="~/MasterAbout.master" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

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
            width: 140px;
            text-align: center;
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
                font-size: 28px;" >
                            &nbsp;</h1>
                            
                            
                            <table>
                            <tr><td colspan="2" align="center">
                        <h1 style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" >
                    Logout</h1></td></tr>
                    <tr><td class="style29">
            &nbsp;<asp:Button ID="Button1" runat="server" Text="YES" Font-Names="Courier New" 
                    Font-Size="Large" Width="100px" CssClass="style23" onclick="Button1_Click" />
                        </td>
                        <td class="style29">
                <asp:Button ID="Button2" runat="server" Text="NO" Font-Names="Courier New" 
                    Font-Size="Large" Width="100px" CssClass="style23" onclick="Button2_Click" />
                   

                    </td>
                    </tr>
                    </table>
                 </td>
                 </tr>
            
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>



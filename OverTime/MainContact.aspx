<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/MasterContact.master" AutoEventWireup="true" CodeFile="MainContact.aspx.cs" Inherits="MainContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style92
        {
            border-style: ridge;
            border-color: Silver;
            border-width: 10px;
            width: 91%;
        }
        .style93
        {
            padding-left: 50px;
            height: 269px;
            width: 10px;
        }
        .style95
        {
            height: 50px;
        }
        .style100
        {
            height: 269px;
            text-align: justify;
            vertical-align: top;
        }
        .style102
        {
            height: 270px;
            width: 59px;
        }
        .style109
        {
            font-size: large;
            text-align: justify;
        }
        .style110
        {
            padding-left: 60px;
            text-align: justify;
        }
        .style111
        {
            width: 90px;
            height: 90px;
            float: left;
        }
        .style117
        {
            width: 380px;
            height: 127px;
        }
        .style118
        {
            font-size: x-large;
            text-align: justify;
            text-decoration: underline;
            font-family: "Courier New";
        }
        .style119
        {
            text-decoration: underline;
        }
        .style120
        {
            border-color: Silver;
            background-color: White;
        }
        .style121
        {
            width: 100%;
            height: 479px;
            background-repeat: repeat-x;
            background-image: url("images/img83.png");
            background-position: bottom;
            background-color: #CCCCCC;
        }
        .style125
        {
            font-size: large;
            text-align: justify;
            font-family: "Courier New";
        }
        .style126
        {
            font-size: x-large;
            text-align: justify;
            font-family: "Courier New";
        }
        .style128
        {
            font-family: "Courier New";
            font-weight: bold;
            font-size: x-large;
        }
        .style129
        {
            font-family: "Courier New";
            font-weight: bold;
            font-size: x-large;
            background-color: White;
        }
        .style130
        {
            width: 100%;
            height: 479px;
            background-repeat: repeat-x;
            background-image: url("images/img83.png");
            background-position: bottom;
            background-color: white;
        }
    .style131
    {
        color: #CC0000;
        font-weight: bold;
        font-size: large;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table border="2px" width="100%" bgcolor="#003366">
        <tr>
            <td align="center" bgcolor="#333333">
                <table>
                    <tr>
                     <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                        <div class="dropdown">
                                <button class="dropbtn">
                                    Login
                                </button>
                                    <div class="dropdown-content">
                                    <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ps No.:&nbsp;&nbsp<asp:TextBox ID="TextBox1" runat="server" autocomplete="off"></asp:TextBox><asp:Label ID="Label7" runat="server" Text="*" CssClass="style131" Visible= "false"></asp:Label></a>
                                    <a>&nbsp;&nbsp;&nbsp;Password:&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server" autocomplete="off" TextMode="Password"></asp:TextBox><asp:Label ID="Label8" runat="server" Text="*" CssClass="style131" Visible="false"></asp:Label></a>
                                    <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox1" runat="server" Text="     Adminstrator" /></a>
                                    <a><asp:Button ID="Button2" runat="server" Text="Login" Font-Size="20px" Width="300px"
                                                Font-Names="Courier New" Font-Bold="True" ToolTip="Login" 
                                    onclick="Button2_Click1" /></a>
                                    <asp:HyperLink ID="HyperLink2" runat="server"   
                                    NavigateUrl="~/MainForget.aspx" ForeColor="#003366">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>Forget Password</u>&nbsp;&nbsp;</asp:HyperLink>
                                   
                                </div>
                            </div>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <div class="dropdown">
                                <button class="dropbtn">
                                    <a href="MainHome.aspx" title="Home">Home</a>
                                </button>
                            </div>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <div class="dropdown">
                                <button class="dropbtn">
                                    <a href="MainAbout.aspx" title="About">About</a>
                                </button>
                            </div>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <div class="dropdown">
                                <button class="dropbtn">
                                    <a href="MainContact.aspx">Contact Us</a>
                                </button>
                            </div>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br/>
    
    <div align="center">
        <asp:Label ID="Label6" runat="server" Text="dept" Visible="False"></asp:Label>
        <table border="1px" width="100%" align="center" frame="border" bgcolor="#FFFFFF"
            class="style121">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td colspan="2" class="style95">
                                <h1 style="font-family: 'Courier New'; font-weight: bold; font-style: normal; font-variant: normal;
                                    text-transform: none; color: #102030; text-decoration: underline blink; font-size: 28px;"
                                    class="style110">
                                    Contact Us
                                </h1>
                            </td>
                        </tr>
                        <tr>
                            <td class="style93">
                            </td>
                            <td class="style100">
                                <img class="style92" src="images/img99.jpg" /><br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="style102">
                            </td>
                            <td class="style109" valign="top">
                                <table border="2px" class="style120">
                                    <tr>
                                        <td colspan="2">
                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63620.65610006513!2d71.45150406874428!3d20.931282323941097!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be24c1c3de2ab3b%3A0xad35e538a2b22df1!2sUltraTech+Cement!5e0!3m2!1sen!2sin!4v1456892928823"
                                                width="1150" height="300" frameborder="0" style="border: 0" allowfullscreen>
                                            </iframe>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style117">
                                            <img class="style111" src="images/icons/img110.png" /> <span class="style119">
                                            <span class="style126"><strong>Location:</strong></span><span
                                                class="style109"><strong><br class="style9" /></strong></span></span>
                                            <span class="style125"><strong>Gujarat Cement Works,</strong></span><strong><br
                                                    class="style9" /></strong><span class="style9"><strong>Ultratech Cement Ltd.,</strong></span><strong><br
                                                    class="style9" /></strong><span class="style9"><strong>Village.Kovaya,Tal.Rajula</strong></span><strong><br
                                                    class="style9" /></strong><span class="style9"><strong>Dist.Amreli, Gujarat</strong></span><strong><br
                                                    class="style9" /></strong><span class="style9"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pin.365541</strong></span><br />
                                        </td>
                                        <td class="style117">
                                            <img class="style111" src="images/icons/img111.png" /> <span class="style118">
                                            <strong>Contact No.: </strong></span><strong>
                                            <br class="style8" /><span class="style9">+91 814-148-3673 </span></strong>
                                            <br />&nbsp;
                                            <br />&nbsp;
                                            <br />&nbsp;
                                            <br />&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="style130">
                                            <img class="style111" src="images/icons/img112.png" />
                                            <table>
                                                <tr>
                                                    <td>
                                                        <span class="style118"><strong>Mail Us: </strong></span><strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <asp:Label ID="Label1" runat="server" Text="To:" CssClass="style128"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox3" runat="server" ReadOnly="true" Text="overtime.alert@gmail.com"
                                                            CssClass="style128" Width="450px"></asp:TextBox>
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <asp:Label ID="Label3" runat="server" Text="Name:" CssClass="style128"></asp:Label>
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="style128" Width="450px" autocompelete="off" ToolTip="Name"></asp:TextBox>
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <asp:Label ID="Label4" runat="server" Text="E-mail:" CssClass="style128"></asp:Label>
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="style128" Width="450px" autocompelete="off" ToolTip="E-mail"></asp:TextBox>
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <asp:Label ID="Label5" runat="server" Text="Subject:" CssClass="style128"></asp:Label>
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="style128" Width="450px" autocompelete="off" ToolTip="Subject"></asp:TextBox>
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <asp:Label ID="Label2" runat="server" Text="Message:" CssClass="style128" ></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="style128" TextMode="MultiLine"
                                                            Height="100px" Width="450px" autocompelte="off" ToolTip="Message"></asp:TextBox>
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        
                                                        <asp:Button ID="Button1" runat="server" Text="Send" CssClass="style129" 
                                                            onclick="Button1_Click" />
                                                        <asp:Label ID="Label10" runat="server" Text="Label" 
                                                            
                                                            style="font-family: 'Courier New'; font-weight: 700; color: #CC0000; background-color: #909090;" 
                                                            visible="false"></asp:Label>
                                                        <br />
                                                    </td>
                                                </tr>
                                            </table>
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




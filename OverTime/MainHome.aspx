<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterHome.master" AutoEventWireup="true" CodeFile="MainHome.aspx.cs" Inherits="MainHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                                    <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ps No.:&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" autocomplete="off"></asp:TextBox>
				                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="TextBox1"></asp:RequiredFieldValidator></a>
                                    <a>&nbsp;&nbsp;&nbsp;Password:&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server" autocomplete="off" TextMode="Password"></asp:TextBox>
				                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                    ForeColor="#CC0000" ControlToValidate="TextBox2"></asp:RequiredFieldValidator></a>
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
        <table border="1px" width="100%" align="center" frame="border" bgcolor="#FFFFFF" class="style95">
            <tr>
                <td bgcolor="#ffffff" class="style13" class="style95">
                    <table >
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <img class="style115" src="images/ts-slider-img3.png" /></td>
                            <td>
                                <br />
                                <h1 style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" >
                                    OverView:</h1>
                                <p style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; font-size: 28px;" >
                                    <span class="style109">Gujarat Cement Works was strategically established 2 
                            km from the southern coastline of Gujarat. The unit has self reliant on power 
                            and water, has state-of-the-art facilities like captive power plant, jetty 
                            facility, desalination and RO plant. Since inception the unit is maintaining 
                            zero water discharge and zero ground water usage...<asp:HyperLink 
                                ID="HyperLink1" runat="server" Font-Italic="True" ForeColor="#CC0000" NavigateUrl="~/MainAbout.aspx">Read More</asp:HyperLink>
                                    </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td class="style90" colspan="3">
                                <h1 style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" >
                                    OverTime:</h1>
                                <h5 class="style117">
                                    <b>Overtime is when an employee works extra time.</b></h5>
                                <h5 class="style117">
                                    <b>It can include work done: beyond their ordinary hours of work. outside the agreed number of hours. outside the spread of ordinary hours.</b></h5>
                                <p class="style24">
                                    &nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                &nbsp;</td>
                            <td align="left" class="style92" rowspan="3">
                                <p class="style24">
                                    &nbsp;</p>
                                <h1 style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px; width: 665px;" >
                                    Objective</h1>
                                <h5 class="style117">
                                    <b>->	Make application that maintain the Overtime record of Employee.<br/>->	Very user friendly and easy to use.<br/>->	Each and Every node of the Company which is connected to server is able to use this application.<br/>->	Very flexible as when new Employee came then it not require to modification.<br/>->	Very secure as each every O&S Employee have their own user name and password as there is ER department admin.<br/>->	Generate Overtime report as per requirement.<br/>
                                    </b>
                                </h5>
                            </td>
                            <td align="left" class="style110" rowspan="3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td >
                                <img class="style91" src="images/1.png" /></td>
                        </tr>
                        <tr>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="3">
                            </td>
                        </tr>
                    </table>
    </div>
    </div>
    </div>
</asp:Content>



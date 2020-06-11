<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/MasterContact.master" AutoEventWireup="true" CodeFile="HosdContact.aspx.cs" Inherits="HosdContact" %>

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
                                            <a href="HosdHome.aspx" title="Home">Home</a>
                                        </button>
                                    </div>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="dropbtn">
                                            <a href="HosdAbout.aspx" title="About">About</a>
                                        </button>
                                    </div>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="dropbtn">
                                            Services
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="HosdSerApplyOT.aspx">Apply For OverTime</a> 
                                            <a href="HosdSerApproveOT.aspx">Approve Over Time</a>
                                            <a href="HosdSerChangePwd.aspx">Change Password</a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="dropbtn">
                                            Report
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="HosdRptAllo.aspx">Allocation Wise Summary Report</a>
                                            <a href="HosdRptOTStatus.aspx">Approved Over Time Status Report</a> 
                                            <a href="HosdRptNApprove.aspx">Department's Non-Approved Report</a> 
                                            <a href="HosdRptDept.aspx">Department Summary Report</a>
                                            <a href="HosdRptEmp.aspx">Employee Wise Summary Report</a>
                                            <a href="HosdRptMnt.aspx">Month Wise Summary Report</a>
                                            <a href="HosdRptPMnt.aspx">Paid Month Wise Summary Report</a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="dropbtn">
                                            <a href="HosdContact.aspx">Contact Us</a>
                                        </button>
                                    </div>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="dropbtn">
                                            <a href="Logout.aspx" title="Logout">Logout</a>
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
    <h1 align="right" 
        style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; 
                font-size: large; width: 1037px; height: 11px; margin-top: 0px; text-align: left;">
        <span class="style11">&nbsp;welcome</span><span class="style7">&nbsp;</span>
        <asp:Label ID="Label1003" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label1002" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label1001" runat="server"  style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #FFFFFF; 
                font-size: large; width: 1037px; height: 11px; margin-top: 0px; text-align: left;"  
                                                ToolTip="Employee's Name(Employee Name)"    
                        Font-Size="Large"></asp:Label>
    </h1>
    <br/>
    <div align="center">
        <asp:Label ID="Label6" runat="server" Text="email" Visible="False"></asp:Label>
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
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                                    <ContentTemplate>
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
                                                    <td valign="top" align="right">
                                                        <asp:Label ID="Label1" runat="server" Text="To:" CssClass="style128"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true" Text="overtime.alert@gmail.com"
                                                            CssClass="style128" Width="450px"></asp:TextBox>
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top" align="right">
                                                        <asp:Label ID="Label3" runat="server" Text="Subject:" CssClass="style128"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="style128" Width="450px" ToolTip="E-Mail's Subject" autocompelete = "off"></asp:TextBox>
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top" align="right">
                                                        <asp:Label ID="Label2" runat="server" Text="Message:" CssClass="style128"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="style128" TextMode="MultiLine"
                                                            Height="100px" Width="450px" ToolTip="E-mail Message" autocompelete = "off"></asp:TextBox>
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
                                                        <asp:Label ID="Label10" runat="server" Text="Label" style="font-family: 'Courier New'; font-weight: 700; color: #CC0000; background-color: #909090;" 
                                                            visible="false"></asp:Label>
                                                        <br/>
                                                    </td>
                                                </tr>
                                            </table>
                                            </ContentTemplate>
            
        </asp:UpdatePanel> 
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



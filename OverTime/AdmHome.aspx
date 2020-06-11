<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterHome.master" AutoEventWireup="true" CodeFile="AdmHome.aspx.cs" Inherits="AdmHome" %>

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
                                            <a href="AdmHome.aspx" title="Home">Home</a>
                                        </button>
                                    </div>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="dropbtn">
                                            <a href="AdmAbout.aspx" title="About">About</a>
                                        </button>
                                    </div>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="dropbtn">
                                            Entry Services
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="AdmESerVerifyTO.aspx">Verify Over Time By Time Office</a>
                                            <a href="AdmESerApprovedRptChange.aspx">Approved Report Changes</a>
                                            <a href="AdmESerEmp.aspx">Wage Board Employee Entry</a> 
                                            <a href="AdmESerOS.aspx">O&S Staff Entry</a>
                                            <a href="AdmESerUser.aspx">Administrator Entry</a>
                                            <a href="AdmESerDH.aspx">Department Entry</a>
                                            <a href="AdmESerSec.aspx">Section Entry</a>
                                            <a href="AdmESerArea.aspx">Area Entry</a>
                                            <a href="AdmESerCost.aspx">Cost Center Code Entry</a>
                                            <a href="AdmESerChangePwd.aspx">Change Password</a>
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
                                            <a href="AdmRptAllo.aspx">Allocation Wise Summary Report</a>
                                            <a href="AdmRptDept.aspx">Department Wise Summary Report</a> 
                                            <a href="AdmRptEmp.aspx">Employee Wise Summary Report</a>
                                            <a href="AdmRptMnt.aspx">Month Wise Summary Report</a>
                                            <a href="AdmRptPMnt.aspx">Paid Month Wise Summary Report</a>
                                            <a href="AdmRptTOApprove.aspx">Time Office Approved Summary Report</a>
                                            <a href="AdmRptTOBApprove.aspx">Time Office Before Approved Report</a>
                                            <a href="AdmRptTONApprove.aspx">Time Office Non-Approved Report</a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="dropbtn">
                                            <a href="AdmContact.aspx">Contact Us</a>
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
                                ID="HyperLink1" runat="server" Font-Italic="True" ForeColor="#CC0000" NavigateUrl="~/AdmAbout.aspx">Read More</asp:HyperLink>
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
</asp:Content>



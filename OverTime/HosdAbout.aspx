<%@ Page Title="About" Language="C#" MasterPageFile="~/MasterAbout.master" AutoEventWireup="true" CodeFile="HosdAbout.aspx.cs" Inherits="HosdAbout" %>

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
        <table border="1px" width="100%" align="center" frame="border" bgcolor="#FFFFFF">
            <tr>
                <td bgcolor="#CCCCCC" class="style13">
                    <asp:Label ID="Label6" runat="server" Text="dept" Visible="False"></asp:Label>
                    <table>
                        <tr>
                            <td colspan="2" class="style95">
                                <h1 style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" class="style110">
                                    About Us
                                </h1>
                            </td>
                        </tr>
                        <tr>
                            <td class="style93">
                            </td>
                            <td class="style100">
                                <img class="style92" src="images/img2.jpg" /></td>
                            <td>
                            </td>
                            <td class="style100">
                                <span class="style108"></span><span class="style109">Gujarat Cement Works was strategically established 2 km from the southern coastline of Gujarat. The unit has self reliant on power and water, has state-of-the-art facilities like captive power plant, jetty facility, desalination and RO plant. Since inception the unit is maintaining zero water discharge and zero ground water usage. The bulk terminals associated with the integrated plant is Navi Mumbai Bulk Terminal, near JNPT.<br />
                                <br/>The installed clinker productions capacity of GCW in 1995 was 4.2 MTPA, with the two kilns of 6,500 TPD each. GCW reached the milestone of 5.20 MTPA clinker in year 2009, after series of up gradations carried out in stages. Kiln-I was commissioned in March 1996 and kiln-II in April 1997. Its thermal power plant capacity is 92 MW.<br/>
                                <br/>It is accredited&nbsp; with Quality Management System&nbsp;&nbsp;&nbsp; (ISO 9001:2008), Environment 
                                Management System (ISO 14001:2004), Occupational Health&nbsp; and&nbsp; Safety&nbsp; 
                                Assurance&nbsp; System&nbsp;&nbsp; (18001:2007), Information Security Management System (ISO 27001: 2007), Social Accountability ( SA 8000: 2008 ), complied&nbsp;&nbsp; with&nbsp; International Ship and Port Facility&nbsp; Security 
                                Code ( ISPS )&nbsp; Level-II, having unique</span><br />
                            </td>
                            <td class="style51">
                            </td>
                        </tr>
                        <tr>
                            <td class="style102">
                            </td>
                            <td class="style109" colspan="3" valign="top">
                                &nbsp;World Class Manufacturing (WCM) framework based on TPM, TQM & Six sigma concepts. Also Energy Management System (ISO 50001) is being pursued by the organization.
                            The unit transports clinker and cement to Magdalla, Ratnagiri, Navi Mumbai, Manglore, Kochi and Sri Lanka. To capitalize on the strategic location, the jetty facility and to reach various markets opportunity, UltraTech has planned further expansion of the unit along with long-term charter of dedicated cement ships and upcoming sister units at Cochin and Navi Mumbai.
                                <br/>
                                <br/>It has one of the largest limestone handling mine for cement plant in India. The mining lease area of GCW is 953 hectares with production planning of 60% conventional and 40% surface mining. The fixed fuel-based coal, lignite, petcock) power plant was set up in year 2008 with a capacity of 92 MW. The four units of Gujarat Cement Works (of 23 MW each) were commissioned in a span of one financial year (2008-09).<br/>
                                <br/><u><b>Milestones:</b></u><br/>
                                <br/>•	Phase – 1 Kiln: 1996 - installed capacity of 6500 TPD.<br/>•	Phase – 2 Kiln: 1998 - installed capacity of 6500 TPD.<br/>•	Larsen and Toubro’s  plant merged with Aditya Birla Group in 2004.<br/>•	Cement grinding capacity increased from 4.2 MTPA to 6.4 MTPA in the year 2010-12 by installing roller press.<br/>•	Jetty expansion is in progress and will be completed by year 2015. With this Jetty expansion, at a time two ships loading will be possible.<br/>
                                <br/><u><b>Awards:</b></u><br/>
                                <br/>•	IMC Ramakrishna Bajaj National Quality Award - Certificate of Merit (2012).<br/>•	Rajiv Gandhi National Quality Award - Commendation Certificate (2011).<br/>•	CAPEXIL Award for Highest Exporter of Cement / Clinker in India from Government of India (consecutively for last 15 years).<br/>•	Greentech Environment Excellence Award - Gold in 2011 and 2012.<br/>•	Kovaya Limestone Mine bagged Sita Ram Rungta National Social Awareness Award of Federation of Indian Mineral Industries for the year 2011-12.<br/>•	Greentech CSR Award - Gold in Year (2012).<br/>•	Greentech HR Award-2012 Outstanding Achievement in Training Excellence – Gold.<br/>•	49th Rank in India’s ‘Great place to Work in 2011’ by The Economic Times.<br/>•	Greentech Environment Excellence Award Silver for Year 2010.<br/>•	Greentech HR Excellence Award 2010 - GOLD Award for Outstanding Achievement in Innovation in Employees Retention Strategies.<br/>•	Kovaya Limestone Mine bagged Misrilall Jain Environment Award 2009-10 of Federation of Indian Mineral Industries for Outstanding contribution to the National Goal of Sustainable Development through conservation of Environment and Natural Resources.<br/>•	Awarded the best Mine in safety excellence from 2007-08 to 2011-12 consecutively to our Kovaya Limestone Mine in Gujarat Mine Safety Week Competition.<br/>•	Overall Environment Excellence award from 2008-09 consecutively to our Kovaya Limestone Mine in Gujarat Mine Environment & Mineral Conservation Week Competition.<br/>
                            </td>
                        </tr>
                    </table>
                    <img src="images/img51.png" name="Cement Factory" width="1328px" /></td>
            </tr>
        </table>
    </div>
</asp:Content>



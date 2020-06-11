<%@ Page Title="Approve OverTime" Language="C#" MasterPageFile="~/MasterHosd.master" AutoEventWireup="true" CodeFile="HosdSerApproveOT.aspx.cs" Inherits="HosdSerApproveOT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
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
                </h1><br/>
            <div align="center">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
            <ContentTemplate>   
                <table border="1px" width="100%" align="center" frame="border" bgcolor="#FFFFFF">
                    <tr>
                        <td bgcolor="#CCCCCC" class="style13">
                        <table>
                <tr>
                <td>
                <h1 align="left" style="font-family: 'Courier New'; font-weight: bold; font-style: normal;
                font-variant: normal; text-transform: none; color: #102030; text-decoration: underline blink;
                font-size: 28px;" class="style16">
                    Approve Over Time
                   </h1>
                </td>
                </tr>
                <tr>
                <td>
                

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                         Width="100%" BorderWidth="3px" Font-Size="8pt" 
                        AllowPaging="True" AllowSorting="True" HeaderStyle-BackColor="#333333" 
                        BorderColor="WhiteSmoke" style="font-family: 'Courier New'; font-weight: 700; font-size: medium" 
                        Height="55px" onrowupdating="GridView1_RowUpdating1" onrowediting="GridView1_RowEditing1" 
                                    onselectedindexchanged="GridView1_SelectedIndexChanged1" AutoPostBack="True" >
                       
                        
                        <Columns>
                                <asp:ButtonField ButtonType="Button" CommandName="Update" HeaderText="Approve" 
                                ShowHeader="True" Text="Approve" runat="server" CausesValidation="False"/>
                                <asp:ButtonField ButtonType="Button" CommandName="Edit" HeaderText="Edit" 
                                ShowHeader="True" Text="Edit" runat="server" CausesValidation="False"/>
                                                
                            <asp:BoundField DataField="srno" HeaderText="Sr No." SortExpression="srno" 
                                ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" 
                                HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px" >
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="psno" HeaderText="PS No." SortExpression="psno" 
                                ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" 
                                HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px">
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" 
                                ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" 
                                HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px">
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="shift" HeaderText="Shift" SortExpression="shift" 
                                ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" 
                                HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px">
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="otshift" HeaderText="OT Shift" 
                                SortExpression="otshift" ControlStyle-BorderWidth="2px" 
                                FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" 
                                ItemStyle-BorderWidth="2px">
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sec" HeaderText="Section" SortExpression="sec" 
                                ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" 
                                HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px">
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="area" HeaderText="Area" SortExpression="area" 
                                ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" 
                                HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px">
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="otentrydt" HeaderText="OT Date" 
                                SortExpression="otentrydt" DataFormatString = "{0:dd/MM/yyyy}" 
                                ControlStyle-BorderWidth="2px" FooterStyle-BorderWidth="2px" 
                                HeaderStyle-BorderWidth="2px" ItemStyle-BorderWidth="2px">
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="allocation" HeaderText="Allocation" 
                                SortExpression="allocaion" ControlStyle-BorderWidth="2px" 
                                FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" 
                                ItemStyle-BorderWidth="2px">
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="totalhrs" HeaderText="Total Hours" 
                                SortExpression="totalhrs" ControlStyle-BorderWidth="2px" 
                                FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" 
                                ItemStyle-BorderWidth="2px">
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="lunchded" HeaderText="Lunch Deduction" 
                                SortExpression="lunchded" ControlStyle-BorderWidth="2px" 
                                FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" 
                                ItemStyle-BorderWidth="2px">
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="usrremark" HeaderText="User Remark" 
                                SortExpression="usrremark" ControlStyle-BorderWidth="2px" 
                                FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" 
                                ItemStyle-BorderWidth="2px">
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="replacepsno" HeaderText="Replace PS No." 
                                SortExpression="replacepsno" ControlStyle-BorderWidth="2px" 
                                FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" 
                                ItemStyle-BorderWidth="2px">
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="replacename" HeaderText="Replace Name" 
                                SortExpression="replacename" ControlStyle-BorderWidth="2px" 
                                FooterStyle-BorderWidth="2px" HeaderStyle-BorderWidth="2px" 
                                ItemStyle-BorderWidth="2px">
                            <ControlStyle BorderWidth="2px" />
                                <ControlStyle BorderWidth="2px" />
                            <FooterStyle BorderWidth="2px" />
                            <HeaderStyle BorderWidth="2px" />
                            <ItemStyle BorderWidth="2px" />
                            </asp:BoundField>
                            
                            
                            
                            
                            
                        </Columns>

<HeaderStyle BackColor="#333333"></HeaderStyle>
                    </asp:GridView>                    


                                <%--<asp:SqlDataSource ID="SqlDataSourceOTApprove" runat="server">
                    </asp:SqlDataSource>


                                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                                    DataFile="~/App_Data/Do_not_Delete.mdf" 
                                    
                                    
                                    SelectCommand="SELECT [srno], [Userid], [department], [sec], [Area], [centercode], [allocation], [dt], [replacename], [name], [psno], [designation], [jobdescription], [oshift], [shift], [othoursfrom], [othoursto], [totalhours], [remarks], [Approve],[timeofficeremarks] FROM [otentrytablehod] WHERE (([Approve] = ?) AND ([department] = ?) AND ([sec] = ?))">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Label2" Name="Approve" PropertyName="Text" 
                                            Type="String" />
                                        <asp:ControlParameter ControlID="id0" Name="department" PropertyName="Text" 
                                            Type="String" />
                                        <asp:ControlParameter ControlID="id1" Name="sec" PropertyName="Text" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:AccessDataSource>--%>
                    <asp:Label ID="Label1" runat="server" Text="dept" Visible="false"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="sec" Visible="false"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="Approved" Visible="false"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="N" Visible="false"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text="hodemail" Visible="false"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Text="Yes" Visible="false"></asp:Label>
                </td>
                </tr>
                </table>
                 </ContentTemplate>
            
        </asp:UpdatePanel> 
        </td></tr></table>
                        </div>
            </div>
            </div>
</asp:Content>



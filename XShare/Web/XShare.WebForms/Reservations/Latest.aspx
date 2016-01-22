<%@ Page Title="Lastest Reservations" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Latest.aspx.cs" Inherits="XShare.WebForms.Reservations.Latest" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="container">
            <asp:LoginView runat="server" ViewStateMode="Disabled">
                <LoggedInTemplate>
                    <div class="row text-center">
                        <div class="col-md-8 col-md-offset-2">
                            <asp:Button Text="Make new reservation" runat="server" CssClass="btn btn-lg btn-primary" />
                        </div>
                    </div>
                </LoggedInTemplate>
            </asp:LoginView>
            <br />
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading text-center"><%: Title %></div>
                        <asp:ListView ID="ViewLastestReservations" runat="server"
                            SelectMethod="GridViewAll_GetData"
                            ItemType="XShare.Data.Models.Reservation"
                            AutoGenerateColumns="false">
                            <LayoutTemplate>
                                <table class="table table-striped table-hover">
                                    <tr>
                                        <th class="text-center">
                                            <asp:Literal Text="Reserved from" runat="server" />
                                        </th>
                                        <th class="text-center">
                                            <asp:Literal Text="Reserved to" runat="server" />
                                        </th>
                                        <th class="text-center">
                                            <asp:Literal Text="From" runat="server" />
                                        </th>
                                        <th class="text-center">
                                            <asp:Literal Text="To" runat="server" />
                                        </th>
                                        <th class="text-center">
                                            <asp:Literal Text="Car" runat="server" />
                                        </th>
                                        <th class="text-center">
                                            <asp:Literal Text="User" runat="server" />
                                        </th>
                                    </tr>
                                    <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                                </table>
                            </LayoutTemplate>

                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label Text='<%# Item.FromTime %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%# Item.ToTime %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%# Item.From %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%# Item.To %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%# Item.Car.Description %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%#  Item.User.UserName %>' runat="server" />

                                    </td>
                                </tr>
                            </ItemTemplate>

                            <EmptyDataTemplate>
                                <h5 class="content-empty">No items available</h5>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
            <asp:Literal Text="" ID="test" runat="server" />
        </div>
    </div>
</asp:Content>

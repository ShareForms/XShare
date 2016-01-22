<%@ Page Title="All Cars" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="XShare.WebForms.Cars.All" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container fluid">
        <asp:LoginView runat="server" ViewStateMode="Disabled">
            <LoggedInTemplate>
                <div class="row text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <asp:Button Text="Add new Car" runat="server" CssClass="btn btn-lg btn-primary" />
                    </div>
                </div>
            </LoggedInTemplate>
        </asp:LoginView>
        <br />
        <div class="row text-center">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading text-center"><%: Title %></div>
                    <asp:ListView ID="ViewAllCars" runat="server"
                        SelectMethod="GridViewAll_GetData"
                        ItemType="XShare.Data.Models.Car"
                        AutoGenerateColumns="false">
                        <LayoutTemplate>
                            <table class="table table-striped table-hover">
                                <tr>
                                    <th class="text-center">
                                        <asp:Literal Text="Image" runat="server" />
                                    </th>
                                    <th class="text-center">
                                        <asp:Literal Text="Model" runat="server" />
                                    </th>
                                    <th class="text-center">
                                        <asp:Literal Text="Type" runat="server" />
                                    </th>
                                    <th class="text-center">
                                        <asp:Literal Text="Fuel Economy" runat="server" />
                                    </th>
                                    <th class="text-center">
                                        <asp:Literal Text="Details" runat="server" />
                                    </th>
                                </tr>
                                <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                            </table>
                        </LayoutTemplate>

                        <ItemTemplate runat="server">
                            <tr>
                                <td>
                                    <asp:Image ImageUrl='<%# Item.pictureUrl %>' Width="50px" runat="server" />
                                </td>
                                <td>
                                    <asp:Label Text='<%# Item.Description %>' runat="server" />
                                </td>
                                <td>
                                    <asp:Label Text='<%# Item.CarType %>' runat="server" />
                                </td>
                                <td>
                                    <asp:Label Text='<%# Item.FuelEconomy + " l/100 km" %>' runat="server" />
                                </td>
                                <td>
                                    <asp:HyperLink NavigateUrl='<%# "Details/" + Item.Id %>' runat="server"> Details
                            </asp:HyperLink>
                                </td>
                            </tr>
                        </ItemTemplate>

                        <EmptyDataTemplate runat="server">
                            <h5 class="content-empty">No items available</h5>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
        <asp:Literal Text="" ID="test" runat="server" />
    </div>
</asp:Content>

<%@ Page Title="Car Detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarDetails.aspx.cs" Inherits="XShare.WebForms.Cars.CarDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron text-center">
        <asp:FormView runat="server" ID="ViewCarDetails"
            ItemType="XShare.Data.Models.Car"
            SelectMethod="ViewCarDetails_GetItem">
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <div class="row">
                            <asp:Image ImageUrl='<%# Item.PictureUrl %>' Width="50px" runat="server" />
                        </div>
                        <div class="col-md-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Details</h3>
                                </div>
                                <div class="panel-body">
                                    <ul class="list-group">
                                        <li class="list-group-item">Model: <asp:Label Text='<%# Item.Description %>' runat="server" /></li>
                                        <li class="list-group-item">Fuel Economy: <asp:Label Text='<%# Item.FuelEconomy %>' runat="server" /> l/100km</li>
                                        <li class="list-group-item">Car Type: <asp:Label Text='<%# Item.CarType %>' runat="server" /></li>
                                        <li class="list-group-item">Features: </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:FormView>
        <div class="back-link">
            <a href="/Cars/All">Back to Cars</a>
        </div>
    </div>
</asp:Content>

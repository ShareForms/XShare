<%@ Page Title="Car Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarDetails.aspx.cs" Inherits="XShare.WebForms.Cars.CarDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="row text-center">
            <div class="col-md-8 col-md-offset-2">
                <asp:FormView runat="server" ID="ViewCarDetails"
                    ItemType="XShare.Data.Models.Car"
                    SelectMethod="ViewCarDetails_GetItem">
                    <ItemTemplate>
                        <header>
                            <h1><%: Title %></h1>
                        </header>
                        <div>
                            <asp:Image ImageUrl='<%# Item.PictureUrl %>' Width="75%" runat="server" />
                        </div>
                        <br />
                        <div>
                            <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>                            
                            <asp:Label Text='<%# Item.Description %>' runat="server" />
                        </div>
                        <div>
                            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                            <asp:Label Text='<%# Item.CarType %>' runat="server" />
                        </div>
                        <div>
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                            <asp:Label Text='<%# Item.Ratings.Any() ? Item.Ratings.Average(r => r.Value) : 0.0f %>' runat="server" />
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <div class="back-link">
                    <a href="/Cars/All">Back to cars</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

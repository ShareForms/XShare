<%@ Page Title="Car Detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarDetails.aspx.cs" Inherits="XShare.WebForms.Cars.CarDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView runat="server" ID="ViewCarDetails" 
        ItemType="XShare.Data.Models.Car" 
        SelectMethod="ViewCarDetails_GetItem">
        <ItemTemplate>
            <header>
                <h1><%: Title %></h1>
            </header>
            <div class="row-fluid">
                <div class="span12 book-description">
                    <p><%#: Item.Description %></p>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>

    <div class="back-link">
        <a href="/Cars/All">Back to Cars</a>
    </div>
</asp:Content>

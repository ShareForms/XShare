<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="XShare.WebForms.About" %>

<%@ OutputCache CacheProfile="ShortLived" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron text-center">
        <h2><%: Title %>.</h2>
        <h3>What is Carsharing?</h3>
        <p>Carsharing is smart: you get to use a car without owning one. That’s what we’re all about: making life greener and more affordable for all of us.</p>
    </div>
    <div class="jumbotron text-center">
        <div class="row">
            <div class="col-md-4">
                <div><strong>Users</strong></div>
                <div><asp:Label ID="UsersCount" runat="server" Text=""></asp:Label></div>
            </div>
            <div class="col-md-4">
                
                <div><strong>Reservations</strong></div>
                <div><asp:Label ID="ReservationsCount" runat="server" Text=""></asp:Label></div>
            </div>
            <div class="col-md-4">
                <div><strong>Cars</strong></div>
                <div><asp:Label ID="CarsCount" runat="server" Text=""></asp:Label></div>
            </div>
        </div>
    </div>
</asp:Content>

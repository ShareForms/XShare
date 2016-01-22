<%@ Page Title="All Cars" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="XShare.WebForms.Cars.All" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container fluid">
        <div class="row text-center">
            <h2><%: Title %>.</h2>
        </div>
        <asp:Literal Text="" ID="test" runat="server" />
    </div>
</asp:Content>

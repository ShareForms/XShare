<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XShare.WebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>XShare</h1>
        <p class="lead">Drive and Park. Lock and leave. Done and dusted</p>
    </div>

    <div class="jumbotron">
        <div class="text-center">   
            <iframe name="myIframe" id="myIframe" width="640" height="360" runat="server" frameborder="0"></iframe>
        </div>       
    </div>

</asp:Content>

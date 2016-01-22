<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="XShare.WebForms.Http404ErrorPage" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron text-center">
        <h1><span class="text-danger">404</span></h1>
        <h1>THE PATH IS <span class="text-danger">NOT</span> OUT THERE</h1>
        <img src="/Content/Assets/Images/x-sign.png" class="" />
        <br />
        <h2>
           <a href='/Default' class="text-info">GO TO THE RIGHT PATH</a>
        </h2>
    </div>
</asp:Content>

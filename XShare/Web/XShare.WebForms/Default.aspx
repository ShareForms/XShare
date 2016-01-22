<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XShare.WebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>XShare</h1>
        <p class="lead">Drive and Park. Lock and leave. Done and dusted</p>
    </div>

    <div class="jumbotron">
        <div class="container">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="text-center">
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" name="myIframe" id="myIframe" runat="server" frameborder="0" style="opacity: 0.35;"></iframe>
                </div>
            </div>
        </div>
            </div>
    </div>

</asp:Content>

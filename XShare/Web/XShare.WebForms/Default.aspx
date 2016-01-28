<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XShare.WebForms._Default" %>

<%@ Register Src="~/Controls/YoutubeIfreme/YouTubeIframe.ascx" TagPrefix="xcontrol" TagName="YouTubeIframe" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>XShare</h1>
        <p class="lead">Drive and Park. Lock and leave. Done and dusted</p>
    </div>

    <div class="jumbotron">
        <div class="container">
            <div class="col-lg-8 col-lg-offset-2">
                <div class="text-center" style="opacity: 0.35;">
                    <div class="embed-responsive embed-responsive-16by9">
                        <xcontrol:YouTubeIframe runat="server" id="YouTubeIframe" VideoId="r8BOh82Pwvo" Loop="true" Volume="0" VQuality="large"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

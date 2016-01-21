<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageMail.aspx.cs" Inherits="XShare.WebForms.Account.ManageMail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:PlaceHolder runat="server" ID="changeMail" Visible="true">
        <div class="form-horizontal">
            <h4>Change Mail Form</h4>
            <hr />
            <div class="form-group">
                <asp:Label ID="MailLabel" CssClass="col-md-2 control-label" runat="server">Enter New Mail</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="NewMail" TextMode="EMail" CssClass="form-control" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" Text="Change Mail" OnClick="ChangeMail_Click" CssClass="btn btn-default" />
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
</asp:Content>

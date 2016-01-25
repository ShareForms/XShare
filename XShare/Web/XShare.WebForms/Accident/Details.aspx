<%@ Page Title="Accident Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="XShare.WebForms.Accident.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron text-center">
        <div class="container">
            <div class="row ">
                <asp:FormView runat="server" ID="ViewAccidentDetails"
                    ItemType="XShare.Data.Models.Accident"
                    SelectMethod="ViewAccidentDetails_GetItem"
                    CssClass="full-width">
                    <ItemTemplate>
                        <div class=" col-md-12">
                            <h2 class="page-header"><%: Title %></h2>
                        </div>
                        <div class=" col-md-12">
                            <div class="col-md-6">
                                <div class="panel panel-info">
                                    <div class="panel-heading">Image</div>
                                    <div class="panel-body">
                                        <asp:Image id="CrashImage" runat="server" ImageUrl='<%#: Item.Picture %>'/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="panel panel-info">
                                    <div class="panel-heading"><%#: Item.Location %></div>
                                    <div class="panel-body">
                                        <asp:Label Text='<%#: Item.Description %>' runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                <hr />
                <div class="row">
                    <div class="back-link">
                        <a href="/" class="btn btn-default">Back Home</a>
                    </div>
                </div>
                <br />
            </div>
        </div>
    </div>
</asp:Content>

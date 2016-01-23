<%@ Page Title="Report an Accident" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="XShare.WebForms.Accident.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row text-center">  
            <h2><%: Title %></h2>          
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
            <div class="row form-horizontal">
                <div class="col-md-6 col-md-offset-3">                    
                    <fieldset>
                        <div class="form-group">
                            <label for="Image" class="col-md-3 control-label">Image</label>
                            <div class="col-md-9">
                                <asp:FileUpload ID="Image" runat="server" CssClass="form-control"></asp:FileUpload>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Description" class="col-md-3 control-label">Description</label>
                            <div class="col-md-9">
                                <asp:TextBox ID="Description" runat="server" CssClass="form-control" rows="5" TextMode="multiline"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Location" class="col-md-3 control-label">Location</label>
                            <div class="col-md-9">
                                <asp:TextBox ID="Location" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-9 col-lg-offset-3 pull-right">
                                <asp:Button ID="Btn" runat="server" OnClick="Btn_Report" Text="Report!" CssClass="btn btn-info full-width" />
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>            
        </div>
    </div>
</asp:Content>

<%@ Page Title="Add a New Car" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="XShare.WebForms.Cars.Add" %>

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
                            <label for="Description" class="col-md-2 control-label">Car Description</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="Description" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="FuelEconomy" class="col-md-2 control-label">Fuel Economy</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="FuelEconomy" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="PictureUrl" class="col-md-2 control-label">Picture Url</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="PictureUrl" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group text-left">
                            <label for="Features" class="col-md-2 control-label text-center">Features</label>
                            <div class="col-md-10">
                                <asp:CheckBoxList ID="Features" runat="server" SelectMethod="GetFeatures" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Features" class="col-md-2 control-label">CarType</label>
                            <div class="col-md-10">
                                <asp:DropDownList ID="CarType" runat="server" SelectMethod="GetCarType" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-10 col-lg-offset-2 pull-right">
                                <asp:Button ID="Btn" runat="server" OnClick="Btn_AddCar" Text="Add Car!" CssClass="btn btn-succcess" />
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

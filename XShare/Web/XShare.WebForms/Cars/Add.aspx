﻿<%@ Page Title="Add a New Car" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="XShare.WebForms.Cars.Add" %>

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
                            <label for="Description" class="col-md-3 control-label">Car Description</label>
                            <div class="col-md-9">
                                <asp:TextBox ID="Description" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="FuelEconomy" class="col-md-3 control-label">Fuel Economy</label>
                            <div class="col-md-9">
                                <asp:TextBox ID="FuelEconomy" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="PictureUrl" class="col-md-3 control-label">Picture Url</label>
                            <div class="col-md-9">
                                <asp:TextBox ID="PictureUrl" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group text-left">
                            <label for="Features" class="col-md-3 control-label">Features</label>
                            <div class="col-md-9">
                                <div CssClass="form-control">
                                    <asp:CheckBoxList ID="Features" runat="server" SelectMethod="GetFeatures"
                                        RepeatColumns="1"
                                        RepeatDirection="Vertical"
                                        RepeatLayout="Flow"
                                        TextAlign="Right"
                                        EnableTheming="True">
                                    </asp:CheckBoxList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="CarType" class="col-md-3 control-label">CarType</label>
                            <div class="col-md-9">
                                <asp:DropDownList ID="CarType" runat="server" CssClass="form-control select" SelectMethod="GetCarType" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-9 col-lg-offset-3 pull-right">
                                <asp:Button ID="Btn" runat="server" OnClick="Btn_AddCar" Text="Add Car!" CssClass="btn btn-info full-width" />
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

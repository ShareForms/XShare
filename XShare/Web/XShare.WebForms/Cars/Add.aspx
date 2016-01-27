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
                            <label for="Description" class="col-md-3 control-label">Car Description</label>
                            <div class="col-md-9">
                                <asp:TextBox ID="Description"
                                    runat="server"
                                    CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Description is requared" ControlToValidate="Description" runat="server" ForeColor="Red" />
                                <asp:RegularExpressionValidator ErrorMessage="Description is maximum 200 characters long" ControlToValidate="Description" runat="server" ForeColor="Red"
                                    ValidationExpression="^[\s\S]{1,200}$" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="FuelEconomy" class="col-md-3 control-label">Fuel Economy</label>
                            <div class="col-md-9">
                                <asp:TextBox ID="FuelEconomy" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RangeValidator ErrorMessage="Fuel Econmomy must be between 3 and 30 l/100km" ControlToValidate="FuelEconomy" runat="server" ForeColor="Red"
                                    MinimumValue="3"
                                    MaximumValue="30"
                                    Type="Double" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="PictureUrl" class="col-md-3 control-label">Picture Url</label>
                            <div class="col-md-9">
                                <asp:TextBox ID="PictureUrl"
                                    runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Picture Url is mandatory" ControlToValidate="PictureUrl" runat="server" ForeColor="Red" />
                                <asp:RegularExpressionValidator ErrorMessage="Picture Url is not valid" ControlToValidate="PictureUrl"
                                    ValidationExpression="(?:([^:/?#]+):)?(?://([^/?#]*))?([^?#]*\.(?:jpg|gif|png))(?:\?([^#]*))?(?:#(.*))?"
                                    runat="server" />
                            </div>
                        </div>
                        <div class="form-group text-left">
                            <label for="Features" class="col-md-3 control-label">Features</label>
                            <div class="col-md-9">
                                <div>
                                    <asp:CheckBoxList ID="Features" runat="server"
                                        SelectMethod="GetFeatures"
                                        RepeatColumns="1"
                                        ItemType="XShare.Data.Models.Feature"
                                        DataTextField="Value"
                                        DataValueField="Id"
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
                            <label for="readytosave" class="col-md-3 control-label">Ready to create?</label>
                            <div class="col-md-9 text-left">
                                <asp:CheckBox ID="readytoave"
                                    runat="server"
                                    CssClass="big-checkbox "
                                    OnCheckedChanged="SetDataParams"
                                    AutoPostBack="true" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-9 col-lg-offset-3 pull-right">
                                <asp:Button ID="BtnAddCar"
                                    Enabled="false"
                                    runat="server"
                                    OnCommand="Btn_AddCar"
                                    Text="Add Car!"
                                    CssClass="btn btn-info full-width"
                                    data-placeholder='huc'
                                    data-toggle="modal"
                                    data-target="#confirmator"
                                    OnClientClick="return xconfirm(this, 'Danger', 'You are about create new car with model{0}, fuel economy {1}, picture url {2}, and car type {3}', 'info');" />
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

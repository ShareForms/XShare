<%@ Page Title="All Cars" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="XShare.WebForms.Cars.All" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container fluid">
        <div class="row text-center">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading text-center"><%: Title %></div>
                    <asp:ListView ID="ViewAllCars" runat="server"
                        SelectMethod="GridViewAll_GetData"
                        ItemType="XShare.Data.Models.Car"
                        AutoGenerateColumns="false">
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                        </LayoutTemplate>

                        <ItemTemplate runat="server">
                            <asp:HyperLink NavigateUrl='<%# "Details/" + Item.Id %>' runat="server"> Details
                            </asp:HyperLink>
                            <asp:Label Text='<%# Item.CarType %>' runat="server" />
                        </ItemTemplate>
                        <EmptyDataTemplate runat="server">
                            <h5 class="content-empty">No items available</h5>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
        <asp:Literal Text="" ID="test" runat="server" />
    </div>
</asp:Content>

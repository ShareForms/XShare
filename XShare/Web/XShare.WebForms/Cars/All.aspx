<%@ Page Title="All Cars" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="XShare.WebForms.Cars.All" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="container-fluid">

            <br />
            <div class="row text-center">
                <div class="col-md-12">
                    <div class="panel panel-info">
                        <div class="panel-heading text-center"><%: Title %></div>
                        <asp:ListView ID="ViewAllCars" runat="server"
                            SelectMethod="GridViewAll_GetData"
                            ItemType="XShare.Data.Models.Car"
                            AllowPaging="True"
                            EnableSortingAndPagingCallback="True"
                            AllowSorting="True"
                            DataKeyNames="Id"
                            AutoGenerateColumns="false">
                            <LayoutTemplate>
                                <div class="table-responsive">
                                    <table class="table table-striped  table-bordered table-hover">
                                        <tr>
                                            <th class="text-center">
                                                <asp:Literal Text="Image" runat="server" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="Model" runat="server"
                                                    ID="SortByModel"
                                                    CommandName="Sort"
                                                    CommandArgument="Description" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="Type" runat="server"
                                                    ID="SortByCarType"
                                                    CommandName="Sort"
                                                    CommandArgument="CarType" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="Fuel Economy" runat="server"
                                                    ID="SortByFuelEconomy"
                                                    CommandName="Sort"
                                                    CommandArgument="FuelEconomy" />
                                            </th>
                                            <th class="text-center">
                                                <asp:Literal Text="Details" runat="server" />
                                            </th>
                                        </tr>
                                        <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                                    </table>
                                </div>
                            </LayoutTemplate>

                            <ItemTemplate runat="server">
                                <tr>
                                    <td>
                                        <asp:Image ImageUrl='<%#: Item.PictureUrl %>' CssClass="img-table" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%#: Item.Description %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%#: Item.CarType %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%#: Item.FuelEconomy + " l/100 km" %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:HyperLink NavigateUrl='<%#: string.Format("~/Cars/CarDetails.aspx?id={0}", Item.Id) %>' runat="server"> Details
                                        </asp:HyperLink>
                                    </td>
                                </tr>
                            </ItemTemplate>

                            <EmptyDataTemplate runat="server">
                                <h5 class="content-empty">No items available</h5>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
            <div class="bs-component text-center">
                <asp:DataPager ID="DataPagerAll" PagedControlID="ViewAllCars" PageSize="5" runat="server" CssClass="btn-group btn-group-sm">
                    <Fields>
                        <asp:NextPreviousPagerField PreviousPageText="<" FirstPageText="<<" ShowPreviousPageButton="true"
                            ShowFirstPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false" ButtonType="Button"
                            ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />

                        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-primary disabled" RenderNonBreakingSpacesBetweenControls="false"
                            NumericButtonCssClass="btn btn-default" ButtonCount="10" NextPageText="..." NextPreviousButtonCssClass="btn btn-default" />

                        <asp:NextPreviousPagerField NextPageText=">" LastPageText=">>" ShowNextPageButton="true"
                            ShowLastPageButton="true" ShowPreviousPageButton="false" ShowFirstPageButton="false" ButtonType="Button"
                            ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                    </Fields>
                </asp:DataPager>
            </div>
        </div>
    </div>
</asp:Content>

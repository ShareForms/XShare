﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageReservations.aspx.cs" Inherits="XShare.WebForms.Admin.ManageReservations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="container">
            <div class="row text-center">
                <h1>Manage reservations </h1>
            </div>

            <br />
            <div class="row text-center">
                <div class="col-md-12">
                    <div class="panel panel-info">
                        <div class="panel-heading text-center"><%: Title %></div>
                        <asp:ListView ID="ViewLastestReservations" runat="server"
                            AllowPaging="True"
                            SelectMethod="GridViewAll_GetData"
                            DeleteMethod="ListViewReservations_DeleteItem"
                            UpdateMethod="ListViewReservations_UpdateItem"
                            ItemType="XShare.Data.Models.Reservation"
                            EnableSortingAndPagingCallback="True"
                            AllowSorting="True"
                            DataKeyNames="Id"
                            AutoGenerateColumns="false">
                            <LayoutTemplate>
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover table-bordered">
                                        <tr>
                                            <th class="text-center">
                                                <asp:LinkButton Text="Id" runat="server"
                                                    ID="SortById"
                                                    CommandName="Sort"
                                                    CommandArgument="Id" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="Reserved from" runat="server"
                                                    ID="SortByFromTime"
                                                    CommandName="Sort"
                                                    CommandArgument="FromTime" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="Reserved to" runat="server"
                                                    ID="SortByToTime"
                                                    CommandName="Sort"
                                                    CommandArgument="ToTime" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="From" runat="server"
                                                    ID="SortByFrom"
                                                    CommandName="Sort"
                                                    CommandArgument="From" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="To" runat="server"
                                                    ID="SortByTo"
                                                    CommandName="Sort"
                                                    CommandArgument="To" />
                                            </th>
                                            <th class="text-center no-wrap">
                                                <asp:LinkButton Text="Car" runat="server"
                                                    ID="SortByDescription"
                                                    CommandName="Sort"
                                                    CommandArgument="Car.Description" />
                                            </th>
                                            <th class="text-center no-wrap">
                                                <asp:LinkButton Text="User" runat="server"
                                                    ID="SortByUser"
                                                    CommandName="Sort"
                                                    CommandArgument="User.UserName" />
                                            </th>
                                            <th class="text-center">
                                                <asp:Literal Text="Details" runat="server" />
                                            </th>
                                            <th class="text-center">
                                                <asp:Literal Text="Action" runat="server" />
                                            </th>
                                        </tr>
                                        <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                                    </table>
                                </div>
                            </LayoutTemplate>

                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Literal Text='<%#: Item.Id %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal Text='<%#: String.Format("{0} {1}",Item.FromTime.ToShortDateString(), Item.FromTime.ToShortTimeString())   %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal Text='<%#: String.Format("{0} {1}",Item.ToTime.ToShortDateString(), Item.ToTime.ToShortTimeString())  %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal Text='<%#: Item.From %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal Text='<%#: Item.To %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal Text='<%#: Item.Car.Description %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%#:  Item.User.UserName %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:HyperLink NavigateUrl='<%#: string.Format("~/Reservations/Details?id={0}", Item.Id) %>' runat="server"> Details
                                        </asp:HyperLink>
                                    </td>
                                    <td>
                                        <asp:LinkButton CssClass="btn btn-xs btn-warning" runat="server" ID="LinkButtonEdit" Text="Edit" CommandName="Edit" />
                                        <asp:LinkButton CssClass="btn btn-xs btn-danger" runat="server" ID="LinkButtonDelete" Text="Delete" CommandName="Delete" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <td>
                                    <asp:Label ID="TextBoxId" Text='<%#: BindItem.Id %>' runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxFromTime" TextMode="DateTimeLocal" Text='<%#: Bind("FromTime", "{0:yyyy-MM-ddTHH:mm:ss}") %>' runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxFromToTime" TextMode="DateTimeLocal" Text='<%#: Bind("ToTime", "{0:yyyy-MM-ddTHH:mm:ss}")  %>' runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxFrom" TextMode="SingleLine" Text='<%#: BindItem.From %>' runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxTo" TextMode="SingleLine" Text='<%#: BindItem.To %>' runat="server" />
                                </td>
                                <td  class="no-wrap">
                                    <asp:Label ID="TextBoxModel"  CssClass="no-wrap" Text='<%#: BindItem.Car.Description %>' runat="server" />
                                </td>
                                <td>
                                    <asp:Label ID="TextBoxUser" TextMode="SingleLine" Text='<%#:  BindItem.User.UserName %>' runat="server" />
                                </td>
                                <td>
                                    <asp:HyperLink NavigateUrl='<%#: string.Format("~/Reservations/Details?id={0}", Item.Id) %>' runat="server"> Details
                                    </asp:HyperLink>
                                </td>
                                <td class="no-wrap">
                                    <asp:LinkButton CssClass="btn btn-xs btn-warning" runat="server" ID="LinkButtonUpdate" Text="Update" CommandName="Update" />
                                    <asp:LinkButton  CssClass="btn btn-xs btn-info" runat="server" ID="LinkButtonCancel" Text="Cancel" CommandName="Cancel" />
                                </td>
                            </EditItemTemplate>

                            <EmptyDataTemplate>
                                <h5 class="content-empty">No items available</h5>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>

            <div class="row text-center bs-component">
                <asp:DataPager ID="PagerReservations" PagedControlID="ViewLastestReservations" runat="server" CssClass="btn-group btn-group-sm" PageSize="5">
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

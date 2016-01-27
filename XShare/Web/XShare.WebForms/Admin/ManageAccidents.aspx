<%@ Page Title="Menage Accidents" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageAccidents.aspx.cs" Inherits="XShare.WebForms.Admin.ManageAccidents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <div class="container">
            <div class="row text-center">
                <h1><%: Title %></h1>
            </div>


            <br />
            <div class="row text-center">
                <div class="col-md-12">
                    <div class="panel panel-warning">
                        <div class="panel-heading text-center"><%: Title %></div>

                        <div class="table-responsive">
                            <table class="table table-striped table-hover table-bordered">

                                <tr>
                                    <th class="text-center">
                                        <asp:TextBox CssClass="form-control input-sm" runat="server" ID="TB_FiltreById" />
                                    </th>
                                    <th></th>
                                    <th class="text-center">
                                        <asp:TextBox CssClass="form-control input-sm" runat="server" ID="TB_FiltreByUserName" />
                                    </th>
                                    <th class="text-center no-wrap">
                                        <asp:TextBox CssClass="form-control input-sm" runat="server" ID="TB_FiltreByCarModel" />
                                    </th>
                                    <th class="text-center">
                                        <asp:DropDownList
                                            ID="DDL_FilterByType"
                                            CssClass="form-control input-sm"
                                            SelectMethod="GetCarType"
                                            runat="server"
                                            OnDataBound="DDL_FilterByType_DataBound" />
                                    </th>
                                    <th class="text-center">
                                        <asp:TextBox CssClass="form-control input-sm" runat="server" ID="TB_FiltreByLocation" />
                                    </th>

                                    <th class="text-center">
                                        <asp:TextBox CssClass="form-control input-sm" runat="server" ID="TB_FiltreDescription" />
                                    </th>
                                    <th class="text-center">
                                        <asp:LinkButton runat="server" Text="Clear all filters" ID="LB_ClearFilters"
                                            OnClick="OnClearFIltersClick" CssClass="btn btn-danger btn-sm full-width" />
                                    </th>
                                    <th class="text-center min-width-10" colspan="2">
                                        <asp:LinkButton runat="server" Text="Filter" ID="LB_FilterFromLocation"
                                            OnClick="OnFilterClick" CssClass="btn btn-success btn-sm full-width" />
                                    </th>
                                </tr>

                                <asp:ListView ID="ViewLastestReservations" runat="server"
                                    AllowPaging="True"
                                    SelectMethod="ListViewAll_GetData"
                                    DeleteMethod="ListViewAccidents_DeleteItem"
                                    UpdateMethod="ListViewAccidents_UpdateItem"
                                    ItemType="XShare.Data.Models.Accident"
                                    EnableSortingAndPagingCallback="True"
                                    AllowSorting="True"
                                    DataKeyNames="Id"
                                    AutoGenerateColumns="false">
                                    <LayoutTemplate>

                                        <tr>
                                            <th class="text-center">
                                                <asp:LinkButton Text="Id" runat="server"
                                                    ID="SortById"
                                                    CommandName="Sort"
                                                    CommandArgument="Id" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="Date" runat="server"
                                                    ID="SortByDate"
                                                    CommandName="Sort"
                                                    CommandArgument="Date" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="User" runat="server"
                                                    ID="SortByUserName"
                                                    CommandName="Sort"
                                                    CommandArgument="User.UserName" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="Car model" runat="server"
                                                    ID="SortCarModel"
                                                    CommandName="Sort"
                                                    CommandArgument="Car.Description" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="Car type" runat="server"
                                                    ID="SortCarType"
                                                    CommandName="Sort"
                                                    CommandArgument="Car.CarType" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="Location" runat="server"
                                                    ID="SortLocation"
                                                    CommandName="Sort"
                                                    CommandArgument="Location" />
                                            </th>
                                            <th class="text-center no-wrap">
                                                <asp:LinkButton Text="Description" runat="server"
                                                    ID="SortByDescription"
                                                    CommandName="Sort"
                                                    CommandArgument="Car.Description" />
                                            </th>
                                            <th class="text-center">
                                                <asp:Literal Text="Picture" runat="server" />
                                            </th>
                                            <th class="text-center">
                                                <asp:Literal Text="Details" runat="server" />
                                            </th>
                                            <th class="text-center min-width-10">
                                                <asp:Literal Text="Action" runat="server" />
                                            </th>
                                        </tr>
                                        <asp:PlaceHolder ID="itemplaceholder" runat="server" />

                                    </LayoutTemplate>

                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Literal Text='<%#: Item.Id %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label CssClass="no-wrap" Text='<%#: Item.Date %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Literal Text='<%#: Item.User.UserName  %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Literal Text='<%#: Item.Car.Description %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Literal Text='<%#: Item.Car.CarType %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Literal Text='<%#:  Item.Location %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Literal Text='<%#:  Item.Description %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Image ImageUrl='<%#:  Item.Picture %>' CssClass="img-table" runat="server" />
                                            </td>
                                            <td>
                                                <asp:HyperLink NavigateUrl='<%#: String.Format("~/Accident/Details?id={0}", Item.Id) %>' runat="server"> Details
                                                </asp:HyperLink>
                                            </td>
                                            <td class="wrap">
                                                <asp:LinkButton CssClass="btn btn-xs btn-warning full-width wrap" runat="server" ID="LinkButtonEdit" Text="Edit" CommandName="Edit" />
                                                <br />
                                                <asp:LinkButton CssClass="btn btn-xs btn-danger full-width wrap" runat="server" ID="LinkButtonDelete" Text="Delete" CommandName="Delete" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <td>
                                            <asp:Literal ID="LiteralBoxId" Text='<%#: BindItem.Id %>' runat="server" />
                                        </td>
                                        <td>
                                            <asp:Literal ID="TextBoxDate" Text='<%#: BindItem.Date %>' runat="server" />
                                        </td>
                                        <td>
                                            <asp:Literal ID="LiteralUser" Text='<%#: BindItem.User.UserName %>' runat="server" />
                                        </td>

                                        <td class="no-wrap">
                                            <asp:Literal ID="LiteralModel" Text='<%#: BindItem.Car.Description %>' runat="server" />
                                        </td>
                                        <td>
                                            <asp:Literal ID="LiteralCarType" Text='<%#: BindItem.Car.CarType %>' runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxLocation" TextMode="SingleLine" Text='<%#: BindItem.Location %>' runat="server" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBoxDescription" TextMode="SingleLine" Text='<%#: BindItem.Description %>' runat="server" />
                                        </td>
                                        <td>
                                            <asp:Image ImageUrl='<%#:  Item.Picture %>' CssClass="img-table" runat="server" />
                                        </td>
                                        <td>
                                            <asp:HyperLink NavigateUrl='<%#: String.Format("~/Accident/Details?id={0}", Item.Id) %>' runat="server"> Details
                                            </asp:HyperLink>
                                        </td>
                                        <td class="wrap">
                                            <asp:LinkButton CssClass="btn btn-xs btn-warning full-width wrap" runat="server" ID="LinkButtonUpdate" Text="Update" CommandName="Update" />
                                            <br />
                                            <asp:LinkButton CssClass="btn btn-xs btn-info full-width wrap" runat="server" ID="LinkButtonCancel" Text="Cancel" CommandName="Cancel" />
                                        </td>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <tr>
                                            <td colspan="8">
                                                <h4 class="content-empt text-danger">There are no accidents with that parameters!</h4>
                                                <h5 class="content-empty text-info">Try to search with other prams.</h5>
                                            </td>
                                        </tr>
                                    </EmptyDataTemplate>
                                </asp:ListView>
                            </table>
                        </div>
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

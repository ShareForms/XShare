<%@ Page Title="Manage users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="XShare.WebForms.Admin.ManageUsers" %>

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
                                        <asp:TextBox CssClass="form-control input-sm"
                                            placeholder="Filter by Id"
                                            runat="server"
                                            ID="TB_FiltreID"
                                            TextMode="SingleLIne" />
                                    </th>

                                    <th class="text-center">
                                        <asp:TextBox CssClass="form-control input-sm"
                                            placeholder="Filter by user name"
                                            runat="server"
                                            ID="TB_FiltreUserName"
                                            TextMode="SingleLIne" />
                                    </th>
                                    <th class="text-center">

                                        <asp:TextBox
                                            ID="TB_FilterEmail"
                                            placeholder="Filter email"
                                            CssClass="form-control input-sm"
                                            runat="server"
                                            TextMode="SingleLine" />

                                    </th>
                                    <th class="text-center no-wrap">
                                        <asp:TextBox CssClass="form-control input-sm"
                                            TextMode="Phone"
                                            runat="server"
                                            ID="TB_FiltrePhoneNumber"
                                            placeholder="Filter phone number" />
                                    </th>

                                    <th class="text-center" colspan="2">
                                        <asp:LinkButton runat="server" Text="Filter" ID="LB_FilterFromLocation"
                                            OnClick="OnFilterClick" CssClass="btn btn-success btn-sm full-width" />
                                    </th>

                                    <th class="text-center" colspan="2">
                                        <asp:LinkButton runat="server" Text="Clear all filters" ID="LB_ClearFilters"
                                            OnClick="OnClearFIltersClick" CssClass="btn btn-danger btn-sm full-width" />
                                    </th>
                                </tr>

                                <asp:ListView ID="ListViewAllUsers" runat="server"
                                    AllowPaging="True"
                                    SelectMethod="ListViewAllUsers_GetData"
                                    DeleteMethod="ListViewUsers_DeleteItem"
                                    UpdateMethod="ListViewUsers_UpdateItem"
                                    ItemType="XShare.Data.Models.User"
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
                                                <asp:LinkButton Text="User name" runat="server"
                                                    ID="SortByUserName"
                                                    CommandName="Sort"
                                                    CommandArgument="UserName" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="Email" runat="server"
                                                    ID="SortByEmail"
                                                    CommandName="Sort"
                                                    CommandArgument="Email" />
                                            </th>
                                            <th class="text-center">
                                                <asp:LinkButton Text="Phone number"
                                                    runat="server"
                                                    ID="SortByPhoneNumber"
                                                    CommandName="Sort"
                                                    CommandArgument="PhoneNumber" />
                                            </th>
                                            <th class="text-center">
                                                <asp:Label Text="Reservations" runat="server" />
                                            </th>
                                            <th class="text-center">
                                                <asp:Label Text="Accidents" runat="server" />
                                            </th>
                                            <th class="text-center">
                                                <asp:Label Text="Is admin" runat="server" />
                                            </th>
                                            <th class="text-center">
                                                <asp:Literal Text="Action" runat="server" />
                                            </th>
                                        </tr>

                                        <asp:PlaceHolder ID="itemplaceholder" runat="server" />

                                    </LayoutTemplate>

                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label Text='<%#: Item.Id %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label Text='<%#: Item.UserName %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label Text='<%#: Item.Email %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label Text='<%#: Item.PhoneNumber %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label Text='<%#: Item.Reservations.Count() %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label Text='<%#: Item.Accidents.Count() %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label runat="server"
                                                    Text='<%# Item.Roles.Any()%>' />
                                            </td>

                                            <td class="wrap">
                                                <asp:LinkButton CssClass="btn btn-xs btn-warning full-width" runat="server"
                                                    ID="LinkButtonEdit" Text="Edit" CommandName="Edit" />
                                                <br />
                                                <asp:LinkButton CssClass="btn btn-xs btn-danger full-width" runat="server"
                                                    ID="LinkButtonDeleteUser" Text="Delete" CommandName="Delete" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="TextBoxId"
                                                    Text='<%#: Item.Id %>'
                                                    runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="TextBoxImage"
                                                    TextMode="SingleLine"
                                                    Text='<%#: Item.UserName %>'
                                                    runat="server" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxEmail"
                                                    CssClass="form-control input-sm"
                                                    TextMode="Email"
                                                    Text='<%#: BindItem.Email %>'
                                                    runat="server" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxPhoneNumber"
                                                    CssClass="form-control input-sm"
                                                    TextMode="Phone"
                                                    Text='<%#: BindItem.PhoneNumber %>'
                                                    runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LavelReservations"
                                                    Text='<%#: Item.Reservations.Count() %>'
                                                    runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelAccidents"
                                                    Text='<%#: Item.Accidents.Count() %>'
                                                    runat="server" />
                                            </td>
                                            <td class="text-left">
                                                <asp:CheckBox runat="server"
                                                    ID="CbIsADmin"
                                                    Checked='<%# Item.Roles.Any() %>' />

                                            </td>
                                            <td class="wrap">
                                                <asp:LinkButton
                                                    CssClass="btn btn-xs btn-warning full-width wrap"
                                                    runat="server"
                                                    ID="linkbuttonupdateuser"
                                                    Text="Update"
                                                    CommandName="Update" />
                                                <br />
                                                <asp:LinkButton
                                                    CssClass="btn btn-xs btn-info fill-width wrap"
                                                    runat="server"
                                                    ID="linkbuttoncancel"
                                                    Text="Cancel"
                                                    CommandName="Cancel" />
                                            </td>
                                        </tr>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <tr>
                                            <td colspan="8">
                                                <h4 class="content-empt text-danger">There are no users with that parameters!</h4>
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
                <asp:DataPager ID="PagerUsers" PagedControlID="ListViewAllUsers" runat="server" CssClass="btn-group btn-group-sm" PageSize="5">
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

<%@ Page Title="Manage cars" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCars.aspx.cs" Inherits="XShare.WebForms.Admin.ManageCars" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

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
                                    <th class="text-center" colspan="2">
                                        <asp:LinkButton runat="server" Text="Clear all filters" ID="LB_ClearFilters"
                                            OnClick="OnClearFIltersClick" CssClass="btn btn-danger btn-sm full-width" />
                                    </th>

                                    <th class="text-center">
                                        <asp:TextBox CssClass="form-control input-sm"
                                            placeholder="Filter by car model"
                                            runat="server"
                                            ID="TB_FiltreModel" />
                                    </th>
                                    <th class="text-center">

                                        <asp:DropDownList
                                            ID="DDL_FilterByType"
                                            CssClass="form-control input-sm"
                                            SelectMethod="GetCarType"
                                            runat="server" 
                                            OnDataBound="DDL_FilterByType_DataBound"/>


                                    </th>
                                    <th class="text-center no-wrap">
                                        <asp:TextBox CssClass="form-control input-sm"
                                            TextMode="Number"
                                            runat="server"
                                            ID="TB_FiltreFuelEconomy"
                                            placeholder="Filter by car fuel economy" />
                                    </th>

                                    <th class="text-center" colspan="3">
                                        <asp:LinkButton runat="server" Text="Filter" ID="LB_FilterFromLocation"
                                            OnClick="OnFilterClick" CssClass="btn btn-success btn-sm full-width" />
                                    </th>
                                </tr>

                                <asp:ListView ID="ListViewAllCars" runat="server"
                                    AllowPaging="True"
                                    SelectMethod="ListViewAllCars_GetData"
                                    DeleteMethod="ListViewCar_DeleteItem"
                                    UpdateMethod="ListViewCar_UpdateItem"
                                    ItemType="XShare.Data.Models.Car"
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
                                                <asp:Literal Text="Features" runat="server" />
                                            </th>
                                            <th class="text-center">
                                                <asp:Literal Text="Details" runat="server" />
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
                                                <asp:Image ImageUrl='<%#: Item.PictureUrl %>' Width="50px" runat="server" />
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
                                                <asp:DropDownList CssClass="form-control input-sm"
                                                    DataSource='<%# Item.Features.Select(f => f.Value) %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:HyperLink NavigateUrl='<%#: String.Format("~/Cars/CarDetails.aspx?id={0}", Item.Id) %>'
                                                    runat="server"> Details
                                                </asp:HyperLink>
                                            </td>
                                            <td class="wrap">
                                                <asp:LinkButton CssClass="btn btn-xs btn-warning full-width wrap" runat="server"
                                                    ID="LinkButtonEdit" Text="Edit" CommandName="Edit" />
                                                <br />
                                                <asp:LinkButton CssClass="btn btn-xs btn-danger full-width wrap" runat="server"
                                                    ID="LinkButtonDelete" Text="Delete" CommandName="Delete" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="TextBoxId"
                                                    Text='<%#: BindItem.Id %>'
                                                    runat="server" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxImage"
                                                    CssClass="form-control input-sm"
                                                    TextMode="Url"
                                                    Text='<%#: BindItem.PictureUrl %>'
                                                    runat="server" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxModel"
                                                    CssClass="form-control input-sm"
                                                    TextMode="SingleLine"
                                                    Text='<%#: BindItem.Description %>'
                                                    runat="server" />
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DdlCarType"
                                                    CssClass="form-control input-sm"
                                                    SelectMethod="GetCarType"
                                                    SelectedValue='<%#: BindItem.CarType %>'
                                                    runat="server" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBoxFuelEconomy"
                                                    CssClass="form-control input-sm"
                                                    Text='<%#: BindItem.FuelEconomy %>'
                                                    runat="server" />
                                            </td>
                                            <td class="text-left">
                                                <%--<%--       <asp:CheckBoxList ID="DdlFeatures" runat="server" 
                                                    SelectMethod="GetAllFeatures"
                                                    RepeatColumns="1"
                                                    SelectedValues='<%#: BindItem.Features %>' 
                                                    ItemType="XShare.Data.Models.Feature"
                                                    DataTextField="Value"
                                                    DataValueField="Id"
                                                    RepeatDirection="Vertical"
                                                    RepeatLayout="Flow"
                                                    TextAlign="Right"
                                                    EnableTheming="True">
                                                </asp:CheckBoxList>--%>
                                                <%--      <asp:ListBox ID="DdlFeatures"
                                                    CssClass="form-control input-sm"
                                                    SelectionMode="Multiple"
                                                    SelectMethod="GetAllFeatures"
                                                    DataTextField="Value"
                                                    DataValueField="Id"
                                                    SelectedItem='<%#: BindItem.Features %>'
                                                    runat="server"></asp:ListBox>--%>

                                                <asp:DropDownList CssClass="form-control input-sm"
                                                    DataSource='<%# Item.Features.Select(f => f.Value) %>'
                                                    runat="server" />

                                            </td>
                                            <td>
                                                <asp:HyperLink NavigateUrl='<%#: String.Format("~/Cars/CarDetails.aspx?id={0}", Item.Id) %>' runat="server"> Details
                                                </asp:HyperLink>
                                            </td>
                                            <td class="wrap">
                                                <asp:LinkButton CssClass="btn btn-xs btn-warning full-width wrap" runat="server"
                                                    ID="linkbuttonupdate" Text="update" CommandName="update" />
                                                <br />
                                                <asp:LinkButton CssClass="btn btn-xs btn-info fill-width wrap" runat="server"
                                                    ID="linkbuttoncancel" Text="cancel" CommandName="cancel" />
                                            </td>
                                        </tr>
                                    </EditItemTemplate>

                                    <EmptyDataTemplate>
                                        <h5 class="content-empty">No items available</h5>
                                    </EmptyDataTemplate>
                                </asp:ListView>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row text-center bs-component">
                <asp:DataPager ID="PagerReservations" PagedControlID="ListViewAllCars" runat="server" CssClass="btn-group btn-group-sm" PageSize="5">
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

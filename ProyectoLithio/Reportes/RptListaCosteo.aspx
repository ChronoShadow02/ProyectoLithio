<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RptListaCosteo.aspx.cs" Inherits="ProyectoLithio.Views.Reportes.RptListaCosteo" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Listado de Costeos</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />
</head>
<body>
    <div style="margin: 10px">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center">Reporte de listado de costeos</h2>
            </div>
        </div>

        <hr />
        <form runat="server" id="frmBusquedaReporte">
            <div class="row col-md-12">
                <div class="form-group col-md-3 ">
                    <asp:Label ID="lblCosteo" runat="server" Text="Costeo"></asp:Label>
                    <asp:TextBox ID="txtNumeroCosteo" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                </div>
                <div class="clearfix"></div>
                <div class="form-group col-md-3 ">
                    <asp:Label ID="lblDUA" runat="server" Text="DUA"></asp:Label>
                    <asp:TextBox ID="txtDUA" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="clearfix"></div>
                <div class="form-group col-md-3 ">
                    <asp:Label ID="lblFechaInicial" runat="server" Text="Fecha Inicio"></asp:Label>
                    <asp:TextBox ID="txtFechaInicial" runat="server" class="form-control" TextMode="Date" ></asp:TextBox>
                </div>
                <div class="form-group col-md-3 ">
                    <asp:Label ID="lblFechaFinal" runat="server" Text="Fecha Final"></asp:Label>
                    <asp:TextBox ID="txtFechaFinal" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="clearfix"></div>
                <div class="form-group col-md-3 ">
                    <asp:Button ID="btVerReporte" runat="server" OnClick="btBuscar_Click" Text="Ver Reporte" class="btn btn-success" />
                </div>
            </div>
            <br />
            <div class="row">
                <asp:ScriptManager ID="scmReporteCosteos" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="rpvCosteos" runat="server" Width="100%" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226">
                    <LocalReport ReportPath="Reportes\RptListaCosteo.rdlc">
                    </LocalReport>
                </rsweb:ReportViewer>
            </div>
        </form>
    </div>
</body>
</html>

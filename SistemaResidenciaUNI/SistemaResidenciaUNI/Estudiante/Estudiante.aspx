<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Estudiante.aspx.cs" Inherits="SistemaResidenciaUNI.Estudiante.Estudiante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-primary">
        <div class="panel-heading">Registrar Estudiante</div>
        <div class="panel-body">

            <div class="form-group row">
                <label for="lblperCedula" class="col-sm-2 col-form-label">Cédula del Estudiante</label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtPerCedula" CssClass="form-control" placeholder="Ingrese cédula del Estudiante" />

                </div>
            </div>
            <div class="form-group row">
                <label for="lblperPrimerNombre" class="col-sm-2 col-form-label">Primer Nombre del Estudiante</label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtPerPrimerNombre" CssClass="form-control" placeholder="Primer Nombre del Estudiante" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPerPrimerNombre"
                        CssClass="text-danger" ErrorMessage="El campo Primer Nombre del Estudiante es requerido." />
                </div>
            </div>
            <div class="form-group row">
                <label for="lblperSegundoNombre" class="col-sm-2 col-form-label">Segundo Nombre del Estudiante</label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtPerSegundoNombre" CssClass="form-control" placeholder="Segundo Nombre del Estudiante" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPerSegundoNombre"
                        CssClass="text-danger" ErrorMessage="El campo Segundo Nombre del Estudiante es requerido." />
                </div>
            </div>
            <div class="form-group row">
                <label for="lblPerPrimerApellido" class="col-sm-2 col-form-label">Primer Apellido del Estudiante</label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtPerPrimerApellido" CssClass="form-control" placeholder="Primer Apellido del Estudiante" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPerPrimerApellido"
                        CssClass="text-danger" ErrorMessage="El campo Primer Apellido del Estudiante es requerido." />
                </div>
            </div>
            <div class="form-group row">
                <label for="lblPerSegundoApellido" class="col-sm-2 col-form-label">Segundo Apellido del Estudiante</label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtPerSegundoApellido" CssClass="form-control" placeholder="Segundo Apellido del Estudiante" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPerSegundoApellido"
                        CssClass="text-danger" ErrorMessage="El campo Segundo Apellido del Estudiante es requerido." />
                </div>
            </div>
            <%-- <div class="form-group row">
                <label for="lblPerFechaNacimiento" class="col-sm-2 col-form-label">Fecha de Nacimiento del Estudiante</label>

                <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                </div>
                <input type="text" class="form-control" id="txtPerFechaNacimiento" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask />
            </div>--%>

            <div class="form-group">
                <label for="lblPerFechaNacimiento" class="col-sm-2 col-form-label">Fecha de Nacimiento del Estudiante</label>
                <div class="input-group">
                    <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                    </div>
                    <input type="text" class="form-control" id="txtPerFechaNacimiento" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask />
                </div>
                <!-- /.input group -->
            </div>
            <!-- /.form group -->

        </div>
        <div class="form-group row">
            <label for="ddlNumeroCuarto" class="col-sm-2 col-form-label">Número de Cuarto</label>
            <div class="col-sm-10">
                <asp:DropDownList ID="ddlNumeroCuarto" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group row">
            <label for="txtEstCarnet" class="col-sm-2 col-form-label">Número de Carnet</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" ID="txtEstCarnet" CssClass="form-control" placeholder="Ingrese carnet" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEstCarnet"
                    CssClass="text-danger" ErrorMessage="El campo Número de Carnet es requerido." />
            </div>
        </div>

        <div class="form-group row">
            <label for="chkEstEstado" class="col-sm-2 col-form-label">Estado del Estudiante</label>
            <div class="col-sm-10">
                <asp:CheckBox ID="chkEstEstado" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <asp:Button runat="server" OnClick="GuardarEstudiante_Click"
                Text="Guardar" CssClass="btn btn-primary" />
        </div>
    </div>

    <div class="panel panel-primary">
        <div class="panel-heading">Listado de Estudiantes</div>
        <div class="panel-body">
        </div>
    </div>

    <!-- ./wrapper -->
    <script type="text/javascript">
        $(function () {
            
            //Datemask dd/mm/yyyy
            $("#datemask").inputmask("dd/mm/yyyy", { "placeholder": "dd/mm/yyyy" });
            //Datemask2 mm/dd/yyyy
            $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
            //Money Euro
            $("[data-mask]").inputmask();

            //Date range picker
            $('#reservation').daterangepicker();
            //Date range picker with time picker
            $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' });
            //Date range as a button
            $('#daterange-btn').daterangepicker(
                    {
                        ranges: {
                            'Today': [moment(), moment()],
                            'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                            'Last 7 Days': [moment().subtract('days', 6), moment()],
                            'Last 30 Days': [moment().subtract('days', 29), moment()],
                            'This Month': [moment().startOf('month'), moment().endOf('month')],
                            'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                        },
                        startDate: moment().subtract('days', 29),
                        endDate: moment()
                    },
            function (start, end) {
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
            }
            );

            //iCheck for checkbox and radio inputs
            $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                checkboxClass: 'icheckbox_minimal-blue',
                radioClass: 'iradio_minimal-blue'
            });
            //Red color scheme for iCheck
            $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                checkboxClass: 'icheckbox_minimal-red',
                radioClass: 'iradio_minimal-red'
            });
            //Flat red color scheme for iCheck
            $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
            });

            //Colorpicker
            $(".my-colorpicker1").colorpicker();
            //color picker with addon
            $(".my-colorpicker2").colorpicker();

            //Timepicker
            $(".timepicker").timepicker({
                showInputs: false
            });
        });
    </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" ClientIDMode="Static"  AutoEventWireup="true" CodeBehind="Estudiante.aspx.cs" Inherits="SistemaResidenciaUNI.Estudiante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container">
                <div class="row">
                    <div class="col-md-11">
                        <div class="form-horizontal">
                            <div id="SmartWizard">
                                <ul class="nav-justified">
                                    <li> <a href="#InfoEstu">Informacion del Estudiante<br /><small>Datos Personales</small></a> </li>
                                    <li> <a href="#InfoContac">Informacìon de Contacto<br /><small>Datos para Contactar</small></a> </li>
                                    <li> <a href="#InfoDomi">Dirección(Nuevo)<br /><small>Domicilio del Estudiante</small></a> </li>
                                    
                                </ul>
                                <div>
                                    <div id="InfoEstu">
                                        <br />
                                        <div class="panel panel-primary ">
                                            <div class="panel-heading">Información Estudiante (Nuevo Residente )</div>
                                            <div class="panel-body">

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <%--<label for="lblperFoto" class="col-sm-6 col-form-label">Foto</label>--%>
                                                            <div class="col-sm-10">
                                                               <%-- <img src="../dist/img/grupo.jpg" class="img-responsive img-thumbnail" alt="Foto Est">
                                                                <asp:FileUpload ID="FilUpImagen" runat="server" onchange="OnChangeUpload(this);" />--%>

                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="col-md-6">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="lblTipId" class="col-sm-6 col-form-label">Tipo de Identificación</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="ddlTipId" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="lblCarrera" class="col-sm-6 col-form-label">(*)Carrera</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="ddCarId" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">

                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="lblGenId" class="col-sm-6 col-form-label">Género</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="ddlGenId" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="lblperCedula" class="col-sm-6 col-form-label">Identificación</label>
                                                            <div class="col-sm-10">
                                                                <asp:TextBox runat="server" ID="txtPerCedula" MaxLength="20" CssClass=" Limpiar form-control Cedula" placeholder="000-000000-0000X" />
                                                                <asp:RequiredFieldValidator ControlToValidate="txtPerCedula" runat="server" CssClass="text-danger" ErrorMessage="El Campo Identificación deve ser llenado "></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="txtPerPrimerNombre"  class="col-sm-6 col-form-label">Primer Nombre del Estudiante</label>
                                                            <div class="col-sm-10">
                                                                <asp:TextBox runat="server" ID="txtPerPrimerNombre" MaxLength="50" onkeypress="return soloLetras(event);" CssClass=" Limpiar form-control" placeholder="Primer Nombre del Estudiante" />
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPerSegundoNombre" ErrorMessage="Deve Ingresar letras" ValidationExpression="[A-Za-z]*"></asp:RegularExpressionValidator>
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPerPrimerNombre"
                                                                    CssClass="text-danger" ErrorMessage="El campo Primer Nombre del Estudiante es requerido." />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="lblperSegundoNombre" class="col-sm-6 col-form-label">Segundo Nombre del Estudiante</label>
                                                            <div class="col-sm-10">
                                                                <asp:TextBox runat="server" ID="txtPerSegundoNombre" MaxLength="50" onkeypress="return soloLetras(event);" CssClass=" Limpiar form-control" placeholder="Segundo Nombre del Estudiante" />
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPerSegundoNombre"
                                                                    CssClass="text-danger" ErrorMessage="El campo Segundo Nombre del Estudiante es requerido." />
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="lblPerPrimerApellido" class="col-sm-6 col-form-label">Primer Apellido</label>
                                                            <div class="col-sm-10">
                                                                <asp:TextBox runat="server" ID="txtPerPrimerApellido" MaxLength="50" onkeypress="return soloLetras(event);" CssClass= " Limpiar form-control" placeholder="Primer Apellido del Estudiante" />
                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPerPrimerApellido"
                                                                    CssClass="text-danger" ErrorMessage="El campo Primer Apellido del Estudiante es requerido." />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">

                                                        <div class="form-group row">
                                                            <label for="lblPerSegundoApellido" class="col-sm-6 col-form-label">Segundo Apellido</label>
                                                            <div class="col-sm-10">
                                                                <asp:TextBox runat="server" ID="txtPerSegundoApellido" MaxLength="50" onkeypress="return soloLetras(event);" CssClass=" Limpiar form-control" placeholder="Segundo Apellido del Estudiante" />
                                                                
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="lblPerFechaNacimiento" class="col-sm-6 col-form-label ">Fecha de Nacimiento del Estudiante</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" placeholder="dd/dd/yyyy" class=" Limpiar Fecha form-control datetimepicker" id="txtPerFechaNacimiento" runat="server" />
                                                            </div>
                                                            <!-- /.input group -->
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="ddlNumeroCuarto" class="col-sm-6 col-form-label">Lista de Cuarto Disponibles</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="ddlNumeroCuarto" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="txtEstCarnet" class="col-sm-6 col-form-label">Número de Carnet</label>
                                                            <div class="col-sm-10">
                                                                <asp:TextBox runat="server" ID="txtEstCarnet" CssClass=" Limpiar Carnet form-control" placeholder="0000-0000U" />
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 ">
                                                        <div class="form-group row">
                                                            <div class="col-sm-10">
                                                                <label for="txtEstadoCivil" class=" col-sm-6 col-form-label">Estado Civil </label>


                                                                <asp:DropDownList ID="ddListEstadoCivil" CssClass="form-control" runat="server"></asp:DropDownList>
                                    
                                                            </div>


                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>  <%--finInfoEstu--%>
                                    <div id="InfoContac">
                                        <br />
                                         <div class="panel panel-primary">
                                            <div class="panel-heading">Informacìon de Contacto</div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="lblTelNumero" class="col-sm-6 col-form-label">Número Telefónico</label>
                                                            <div class="col-sm-10">

                                                                <asp:TextBox runat="server" ID="txtTelNumero" onkeypress="return justNumbers(event);" MaxLength="8" CssClass=" Limpiar form-control" TextMode="Phone" placeholder="Número Telefónico" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="lblCorDefinicion" class="col-sm-6 col-form-label">Correo</label>
                                                            <div class="col-sm-10">
                                                                <asp:TextBox runat="server" ID="TextCorDefinicion" CssClass=" Limpiar form-control" TextMode="Email" placeholder="Correo Electrónico" />
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                       
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="lblcompDescripcion" class="col-sm-6 col-form-label">Compañía Descripción</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="ddlcompDescripcion" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div> <%--finInfoContac--%>
                                    <br />
                                    <div id="InfoDomi">
                                         <div class="panel panel-primary">
                                            <div class="panel-heading">Dirección(Nuevo)</div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="lblDepartamento" class="col-sm-6 col-form-label">(*)Departamento</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="ddlDepNombre" CssClass="form-control" runat="server" ></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="lblMunicipio" class="col-sm-6 col-form-label">(*)Municipio</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="ddlMunicipio" CssClass="form-control"  runat="server" ></asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label for="lblBarrio" class="col-sm-6 col-form-label">(*)Barrio</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="ddlBarrio" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="form-group row">
                                                            <label for="lblNumeroCasa" class="col-sm-6 col-from-label">Número Casa </label>
                                                            <div class="col-sm-10">
                                                                <asp:TextBox runat="server" ID="txtNumCasa" onkeypress="return justNumbers(event);" CssClass=" Limpiar form-control" placeholder="Numero de Casa" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="form-group row">
                                                            <label for="lblDireccion" class="col-sm-6 col-from-label">Dirección</label>
                                                            <div class="col-sm-10">
                                                                <textarea id="txtDireccion" class=" Limpiar form-control" runat="server" placeholder="Descripción..."> </textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <br />
                                                <div class="col-md-6 col-sm-offset-3">
                                                    <div class="form-group">
                                                        <asp:Button runat="server" 
                                                            Text="Guardar" CssClass=" text-center form-control btn btn-primary btn-lg" ID="btnGuardadEstudiante" />
                                                    </div>
                                                </div>
                                                
                                             </div>
                                            </div>

                                         </div>
                                    </div> <%--finInfoDomi--%>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>

            
    
    <script type="text/javascript">

        function justNumbers(e) {
            var keynum = window.event ? window.event.keyCode : e.which;
            if ((keynum == 8 || keynum == 48))
                return true;
            if (keynum <= 47 || keynum >= 58) return false;
            return /\d/.test(String.fromCharCode(keynum));
        }


        function soloLetras(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return true;

            return false;
        }



       jQuery_382(document).ready(function () {

            function OnChangeUpload(o) {
                debugger;
                $('#' + o.id + '').next().find('input').val($('#' + o.id + '').val());
            }
            $('.Cedula').mask('000-00000-0000S');
            $('.Carnet').mask('0000-0000S');
            $('#txtPerFechaNacimiento').mask('00/00/0000');
           //Validaciones
             $('#form1').bootstrapValidator({
		       
		                feedbackIcons: {
		                    valid: 'glyphicon glyphicon-ok',
		                    invalid: 'glyphicon glyphicon-remove',
		                    validating: 'glyphicon glyphicon-refresh'
		                },
		                excluded: ':disabled',
		                fields: {
		                     <%= txtPerPrimerNombre.UniqueID%>: {
                            message: 'Ingrese El Nombre',
                            validators: {
                                notEmpty: {
                                    message: 'El Campo No puede Estar Vacio'
                                },
                                stringLength: {
                                    min: 3,
                                    max: 15,
                                    message: 'El Nombre debe Ser Mayor a 3 y Menor de 15 Caracteres'
                                },
                        
                               
                            }
		                    },
		                    <%=txtPerSegundoNombre.UniqueID%>: {
		                        message: 'Ingrese El Segundo Nombre',
		                        validators: {
		                            
		                        }
		                    },
		                    <%=txtPerPrimerApellido.UniqueID%>: {
		                        message: 'Ingrese El Nombre',
		                        validators: {
		                            notEmpty: {
		                                message: 'El Campo No puede Estar Vacio'
		                            },
		                            stringLength: {
		                                min: 3,
		                                max: 15,
		                                message: 'El Nombre debe Ser Mayor a 3 y Menor de 15 Caracteres'
		                            }
		                        }
		                    },
		                   
		                   
		                    <%=txtPerFechaNacimiento.UniqueID%>: {
		                        validators: {
		                            date: {
		                                format: 'DD/MM/YYYY',
		                                message: 'La Fecha No Es valida'
		                            },
		                            notEmpty: {
		                                message: 'El Campo No Puede Estar Vacio'
		                            }
		                        }
		                    },
		                   
		                   
		                    <%=txtEstCarnet.UniqueID%>: {
		                        message: 'Ingrese el Carnet del Estudiante',
		                        validators: {
		                            notEmpty: {
		                                message: 'El Campo No puede Estar Vacio'
		                            },
		                            stringLength: {
		                                min: 10,
		                        
		                                message: 'La Carnet debe Ser Mayor a 3 y Menor de 11 Caracteres'
		                            },

		                            
		                        }
		                    },
		                    <%=txtPerCedula.UniqueID%>: {
		                        message: 'Ingrese La Cedula del Estudiante',
		                        validators: {
		                            notEmpty: {
		                                message: 'El Campo No puede Estar Vacio'
		                            },
		                            stringLength: {
		                                min: 14,

		                                message: 'La Cedula debe tener el formato correcto'
		                            },

		                        }
		                    },
                             
		                } //findeField
		            });





                       <%--///INICIO DE SMARTWIZARD--%>
                <%--// Step show event--%>
                $("#SmartWizard").on("showStep", function (e, anchorObject, stepNumber, stepDirection, stepPosition) {
                    //alert("You are on step "+stepNumber+" now");

                    if (stepNumber == 0) {
                        $("#InfoEstu").addClass("active");

                    }

                    if (stepNumber == 1) {
                        $("#InfoEstu").removeClass("active");
                        $("#InfoContac").addClass("active");
                        

                    }

                    if (stepNumber == 2) {
                        $("#InfoDomi").addClass("active");
                        $("#InfoContac").removeClass("active");
                        $("#InfoEstu").removeClass("active");
                        

                    }


                    if (stepPosition === 'first') {
                        $("#prev-btn").addClass('disabled');
                    } else if (stepPosition === 'final') {
                        $("#next-btn").addClass('disabled');
                    } else {
                        $("#prev-btn").removeClass('disabled');
                        $("#next-btn").removeClass('disabled');
                    }
                });


                <%--// Smart Wizard 1--%>
                $('#SmartWizard').smartWizard({
                    selected: 0,
                    theme: 'arrows',
                    transitionEffect: 'fade',
                    showStepURLhash: false,


                });

                $("#SmartWizard").on("leaveStep", function(e, anchorObject, stepNumber, stepDirection) {
		       
                    var validator = $('#form1').data('bootstrapValidator');
                    validator.validate();
                    if (validator.isValid()) {
                        return true;
                    }
                    else{
		            
                        return false;
                    }

                    return false;

		       
                });


           $("#Btn_ayuda").on('click',function(e){
           
               e.preventDefault();
               Tutorial();

           
           
           });

           function Tutorial()
           {
           
           
               //initialize instance
               var enjoyhint_instance = new EnjoyHint({});
               //simple config. 
               //Only one step - highlighting(with description) "New" button 
               //hide EnjoyHint after a click on the button.
               var enjoyhint_script_steps = [
                 {
                     'next #ddlTipId' : 'Comencemos Seleccionando el Tipo de Identificacion',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'next #ddCarId' : 'Muy Bien, Ahora Selecione la Carrera a la Que Pertenece el Estudiante',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,  
                 {
                     'next #ddlGenId' : 'De Acuerdo, Sigamos los mismos paso anteriores',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "SKIP"},

                 } , 
                 {
                     'next #txtPerCedula' : 'Esta es una caja de Texto, Aca Digita la Cedula del Estudiante, Nosotros Colocaremos los guiones por Ti',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } , 
                 {
                     'next #txtPerPrimerNombre' : '¡Bien!, Aca Digita el Primer Nombre del Estudiante',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } , 
                 {
                     'next #txtPerSegundoNombre' : 'Sigamos Con el Segundo Nombre',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'next #txtPerPrimerApellido' : 'Ahora Continuemos con el Primer Apellido',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'next #txtPerSegundoApellido' : 'Ya Casi Acabamos con Este Paso!, Digita el Segundo Apellido',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'next #txtPerFechaNacimiento' : 'Has Clic en la Caja de Texto Y Selecciona la Fecha de Nacimiento en el Calendario',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 
                 {
                     'next #ddlNumeroCuarto' : 'Seleccione el Numero del Cuarto donde se Encuentra el Estudiante',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Siguiente"},

                 } ,
                 {
                     'next #txtEstCarnet' : 'Falta Poco!, Digita el Carnet del Estudiante',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'next #ddListEstadoCivil' : 'Selecciona el Estado Civil',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'click .sw-btn-next': 'Excelente!, Pasemos Al Siguiente Formulario',
                     "shape": "circle",
                     "radius":40,
                     "skipButton" : {className: "mySkip", text: "Siguiente"},

                 } ,
                 {
                     'next #txtTelNumero' : 'Ingresa el Numero de Telefono, Estos Datos Son Importantes! ',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'next #TextCorDefinicion' : 'Importante!, Este Dato es Muy Importante Para Notificar Al Estudiante Sus Asignaciones de Aseo ',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'next #ddlcompDescripcion' : 'Selecciona La Compañia Telefonica',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'click .sw-btn-next': 'Perfecto!, Unos Ultimos Datos Mas y Terminamos ',
                     "shape": "circle",
                     "radius":40,
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'next #ddlDepNombre' : 'Selecciona El Departamento de donde Proviene el Estudiante, Luego Se Te Mostraran Sus Respectivos Municipios',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'next #ddlMunicipio' : 'Selecciona El Departamento de donde Proviene el Estudiante, Luego Se Te Mostraran Sus Respectivos Municipios',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'next #txtNumCasa' : 'Ingresa el Numero Telefonico del Hogar del Estudiante!, Importante Para Notificar Cualquier Eventualidad',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'next #txtDireccion' : 'Este Campo Es Opcional!, Puedes Dejarlo vacio si la direccion no se conoce',
                     "nextButton" : {className: "myNext", text: "Siguiente"},
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,
                 {
                     'click #btnGuardadEstudiante': 'Agradecemos Tu Paciencia!, Has Clic Para Ingresar Estos Datos Al Sistema',
                     "shape": "circle",
                     "radius":40,
                     "skipButton" : {className: "mySkip", text: "Omitir"},

                 } ,

                 
                 
               ];

               //set script config
               enjoyhint_instance.set(enjoyhint_script_steps);

               //run Enjoyhint script
               enjoyhint_instance.run();
           
           }

        });
    </script>
</asp:Content>

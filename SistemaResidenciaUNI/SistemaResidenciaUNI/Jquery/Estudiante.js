var Barrio;
jQuery_382(document).ready(function () {
    
    FillDdlTipID();
    FillDdlDepartamento();
    FillDdlCarrera();
    FillDdlCuartos();
    FillDdlGenero();
    FillDdlEstadoCi();
    FillDdlTelCompania();



    

    $("#btnGuardadEstudiante").click(function (e) {
        e.preventDefault();
        IngresarNuevoEstu();
        
                $('#SmartWizard').smartWizard({
                    selected: 0,
                    theme: 'arrows',
                    transitionEffect: 'fade',
                    showStepURLhash: false,


                });
    });


    




   
    //enviar DepartamentoSeleccionado
    $("#ddlDepNombre").on('change', function () {

        if ($(this).val() == "0") {

            $("#ddlDepNombre").empty();
            $("#ddlDepNombre").append("<option value='0'>--Seleccione un Departamento--</option>");
            $("#ddlDepNombre").val('0');
            $("#ddlMunicipio").prop('disabled', true);

        }

        var DeparSelect = $("#ddlDepNombre option:selected").val();
        //console.log(DeparSelect);
        FillDdlMunicipio(DeparSelect);
    });

    //enviar Municipio
    $("#ddlMunicipio").on('change', function () {

        if ($(this).val() == "0") {

            $("#ddlMunicipio").empty();
            $("#ddlMunicipio").append("<option value='0'>--Seleccione un Departamento--</option>");
            $("#ddlMunicipio").val('0');
            

        }

        var MunSelect = $("#ddlMunicipio option:selected").val();
        //console.log(MunSelect);
        FillDdlBarrio(MunSelect);
        
    });




    //Llenado de DDL

        function FillDdlTipID() {
            $.ajax({

                type: "POST",
                url: "../Estudiante.aspx/ObtenerTipoIdentificaccion",
                contentType: 'application/json; charset=uft-8',
                datatype: "json",
                success: function (data) {
                    //console.log(data.d);
                    $("#ddlTipId").html('');
                    $("#ddlTipId").append("<option value='0'>---Selecione Identificacion---</option");

                    $.each(data.d.data, function () {

                        $("#ddlTipId").append($("<option />").val(this.TIP_IDE_ID).text(this.TIP_IDE_DESCRIPCION));

                    });
                }

            })

        }//fin fill

    //
    function FillDdlCarrera() {
            $.ajax({

                type: "POST",
                url: "../Estudiante.aspx/ObtenerCarrera",
                contentType: 'application/json; charset=uft-8',
                datatype: "json",
                success: function (data) {
                    //console.log(data.d);
                    $("#ddCarId").html('');
                    $("#ddCarId").append("<option value='0'>---Selecione una carrera---</option");

                    $.each(data.d.data, function () {

                        $("#ddCarId").append($("<option />").val(this.CAR_ID).text(this.CAR_DESCRIPCION));

                    });
                }

            })

    }//fin fill

    //

    function FillDdlCuartos() {
        $.ajax({

            type: "POST",
            url: "../Estudiante.aspx/ObtenerListaCuarto",
            contentType: 'application/json; charset=uft-8',
            datatype: "json",
            success: function (data) {
                console.log(data.d);
                $("#ddlNumeroCuarto").html('');
                $("#ddlNumeroCuarto").append("<option value='0'>---Selecione una cuarto---</option");

                $.each(data.d.data, function () {

                    $("#ddlNumeroCuarto").append($("<option />").val(this.CUA_ID).text(this.CUA_NUMERO));

                });
            }

        })

    }//fin fill

    function FillDdlDepartamento() {
        $.ajax({

            type: "POST",
            url: "../Estudiante.aspx/ObtenerDepartamentos",
            contentType: 'application/json; charset=uft-8',
            datatype: "json",
            success: function (data) {
                //console.log(data.d);
                $("#ddlDepNombre").html('');
                $("#ddlDepNombre").append("<option value='0'>---Selecione un Departamento---</option");

                $.each(data.d.data, function () {

                    $("#ddlDepNombre").append($("<option />").val(this.DEP_ID).text(this.DEP_NOMBRE));

                });
            }

        })

    }//fin fill

    function FillDdlMunicipio(data) {


        var params = new Object();
        params.depID = data;
        params = JSON.stringify(params);
        
        $.ajax({

            type: "POST",
            url: "../Estudiante.aspx/ObtenerMunicipiosPorDepartamentoId",
            data:params,
            contentType: 'application/json; charset=uft-8',
            datatype: "json",
            success: function (data) {
                //console.log(data.d);
                $("#ddlMunicipio").html('');
                $("#ddlMunicipio").append("<option value='0'>---Selecione un Municipio---</option");
                $("#ddlMunicipio").prop('disabled', false);

                $.each(data.d.data, function () {

                    $("#ddlMunicipio").append($("<option />").val(this.MUN_ID).text(this.MUN_NOMBRE));

                });
            }

        })

    }//fin fill
    
    //

    function FillDdlBarrio(data) {


        var params = new Object();
        params.munId = data;
        params = JSON.stringify(params);

        $.ajax({

            type: "POST",
            url: "../Estudiante.aspx/ObtenerBarrioPorMunicipioId",
            data: params,
            contentType: 'application/json; charset=uft-8',
            datatype: "json",
            success: function (data) {


                
                
                //console.log(data.d);

                Barrio = (data.d.data["0"].BAR_ID); //obtenemos el id del barrio

                $("#ddlBarrio").html('');
                
                

                $.each(data.d.data, function () {

                    $("#ddlBarrio").append($("<option />").val(this.BAR_ID).text(this.BAR_NOMBRE));

                });
            }

        })

        

    }//fin fill

    //

    function FillDdlTelCompania() {


        $.ajax({

            type: "POST",
            url: "../Estudiante.aspx/ObtenerComniaTel",
       
            contentType: 'application/json; charset=uft-8',
            datatype: "json",
            success: function (data) {
                //console.log(data.d);
                $("#ddlcompDescripcion").html('');
                $("#ddlcompDescripcion").append("<option value='0'>---Selecione una Compañia Celular---</option");
                $("#ddlcompDescripcion").prop('disabled', false);

                $.each(data.d.data, function () {

                    $("#ddlcompDescripcion").append($("<option />").val(this.COM_ID).text(this.COM_DESCRIPCION));

                });
            }

        })

    }//fin fill

    //

    function FillDdlEstadoCi() {


        $.ajax({

            type: "POST",
            url: "../Estudiante.aspx/ObtenerEstadoCvil",
            contentType: 'application/json; charset=uft-8',
            datatype: "json",
            success: function (data) {
                //console.log(data.d);
                $("#ddListEstadoCivil").html('');
                $("#ddListEstadoCivil").append("<option value='0'>---Selecione el Estado Civil---</option");
                $("#ddListEstadoCivil").prop('disabled', false);

                $.each(data.d.data, function () {

                    $("#ddListEstadoCivil").append($("<option />").val(this.EST_CIV_ID).text(this.EST_CIV_DESCRI));

                });
            }

        })

    }//fin fill


    //

    function FillDdlGenero() {


        $.ajax({

            type: "POST",
            url: "../Estudiante.aspx/ObtenerGenero",
            contentType: 'application/json; charset=uft-8',
            datatype: "json",
            success: function (data) {
                //console.log(data.d);
                $("#ddlGenId").html('');
                $("#ddlGenId").append("<option value='0'>---Selecione el genero---</option");
               

                $.each(data.d.data, function () {

                    $("#ddlGenId").append($("<option />").val(this.GEN_ID).text(this.GEN_DESCRIPCION));

                });
            }

        })

    }//fin fill



    //
    function IngresarNuevoEstu()
    {

        var params = new Object();
        params.Cedula = $("#txtPerCedula").val();
        params.TipoID = $("#ddlTipId option:selected").val();
        params.TipGene = $("#ddlGenId option:selected").val();
        params.PrimerN = $("#txtPerPrimerNombre").val();
        params.SegunN = $("#txtPerSegundoNombre").val();
        params.PApellido = $("#txtPerPrimerApellido").val();
        params.SApellido = $("#txtPerSegundoApellido").val();
        params.Nacimiento = $("#txtPerFechaNacimiento").val();
        params.Ecivil = $("#ddListEstadoCivil option:selected").val();
        params.Ncuarto = $("#ddlNumeroCuarto option:selected").val();
        params.Carrera = $("#ddCarId option:selected").val();
        params.Carnet = $("#txtEstCarnet").val();
        params.Correo = $("#TextCorDefinicion").val();
        params.Tcompania = $("#ddlcompDescripcion option:selected").val();
        params.TelNum = $("#txtTelNumero").val();
        params.barrio = Barrio;
        params.direc = $("#txtDireccion").val();
        params.Ncasa = $("#txtNumCasa").val();
        params = JSON.stringify(params);



        $.ajax({

            type: "POST",
            url: "../Estudiante.aspx/GuardarEstudian",
            data: params,
            contentType: 'application/json; charset=uft-8',
            datatype: "json",
            error: function (xhr, ajaxOptions, thrownError) {
                console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
            },
            success: function (response) {
               
                if (response.d) {
                    Swal.fire({

                        type: 'success',
                        title: 'El Estudiante Ha Sido Notificado',
                        showConfirmButton: false,
                        timer: 3500
                    });
                    $(".Limpiar").val('');
                } else {
                    Swal.fire({

                        type: 'error',
                        title: 'El Correo no Pudo Ser Enviado, Verifique Su Conexion a Internet o Que el Correo Sea Valido',
                        showConfirmButton: false,
                        timer: 3500
                    });
                }
                
            }

        })


    }

    //Limpieza de COntroles

    function Limpiar()
    {
    
        
    
    }

});
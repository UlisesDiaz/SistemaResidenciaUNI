
jQuery_382(document).ready(function () {

    var DATOS, Table, Auxiliar, Correo;

    FillDDL();


    function FillDDL() {
        $.ajax({

            type: "POST",
            url: "../AsignacionAseo.aspx/ListarCuarto",
            contentType: 'application/json; charset=uft-8',
            datatype: "json",
            success: function (data) {
                console.log(data.d);
                $("#DdlCuartoEstu").html('');
                $("#DdlCuartoEstu").append("<option value='0'>---Selecione un Cuarto---</option");

                $.each(data.d.data, function () {

                    $("#DdlCuartoEstu").append($("<option />").val(this.CUA_ID).text(this.CUA_NUMERO));

                });
            }

        })

    }//fin fill

    $("#DdlCuartoEstu").on('change', function () {

        if ($(this).val() == "0") {

            $("#DdlCuartoEstu").empty();
            $("#DdlCuartoEstu").append("<option value='0'>--Seleccione un Cuarto--</option>");
            $("#DdlCuartoEstu").val('0');
            $("#DdlCuartoEstu").prop('disabled', true);

        }

        var CuartoSelect = $("#DdlCuartoEstu option:selected").val();
        Auxiliar = CuartoSelect;
        console.log(CuartoSelect);
        ExtraerData(CuartoSelect);


    });//fin llenar DATATABLE



    function ExtraerData(CuartoSele) {

        var params = new Object();
        params.idCuarto = CuartoSele;
        params = JSON.stringify(params);
        $.ajax({

            type: "POST",
            url: "../AsignacionAseo.aspx/ListarCantAseo",
            data: params,
            contentType: 'application/json; charset=utf-8',
            datatype: "json",
            success: function (data) {

                FillDataTable(data.d.data);
                Auxiliar = data.d.data;
            }


        });

    }//finExtraerData


    function FillDataTable(data) {

        Table = $("#DTCantidadAsignacion").DataTable({

            destroy: true,
            responsive: true,
            "ScrollCollapse": true,
            "paging": false,
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
            },
            "data": data,

            columns: [

            { "data": "EST_ID" },
            { "data": "EST_CARNET" },
            { "data": "Estudiante" },
            { "data": "Cantidad_de_Aseos_Asignados" },
            { "data": "COR_DEFINICION" },

            {
                "defaultContent": '<button value="Notificar" title="Notificar" class="btn-mail btn btn-primary"><i class="fa fa-paper-plane"></i></button>'

            },
            {
                "defaultContent": '<button value="Actualizar" title="Actualizar" class="btn-EditCo btn btn-primary" data-target="#ModificarCorre" data-toggle="modal" ><i class="fa fa-pencil-square-o"></i></button>'

            }


            ]


        });

    }



    //evento para el boton actualizar

    $(document).on('click', '.btn-EditCo', function (e) {

        e.preventDefault();


        DATOS = Table.row($(this).parents("tr")).data();

        //var descrip = val(data.COR_DEFINICION);

        if (DATOS.COR_DEFINICION === null || DATOS.COR_DEFINICION === "") {
            $("#TxtCorreo").val("SIN ESPECIFICAR");

        }
        $("#TxtCorreo").val(DATOS.COR_DEFINICION);



    });

    $("#btnsavesMail").click(function (e) {

        e.preventDefault();

        updateDataAjax();

        console.log(DATOS.EST_ID);





    });


    function updateDataAjax() {

        var obj = JSON.stringify({ id: JSON.stringify(DATOS.EST_ID), correo: $("#TxtEditCorreo").val() });



        $.ajax({

            type: "POST",
            url: "../AsignacionAseo.aspx/UpdateCorreo",
            data: obj,
            contentType: 'application/json; charset=utf-8',
            datatype: "json",
            error: function (xhr, ajaxOptions, thrownError) {
                console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
            },
            success: function (response) {
                if (response.d) {

                    alert("Registro actualizado de manera correcta.");
                    $(".Limpiar").val('');

                } else {
                    alert("No se pudo actualizar el registro.");
                }
            }

        });

    }




    //evento para el boton enviar correo

    $(document).on('click', '.btn-mail', function (e) {

        e.preventDefault();
        console.log("click en boton actualizar");

        DATOS = Table.row($(this).parents("tr")).data();


        console.log(DATOS.COR_DEFINICION);

        Correo = DATOS.COR_DEFINICION;

        SendMail();



    });


    function SendMail() {
        var params = new Object();
        params.IDEstu = DATOS.EST_ID;
        params.correoEstu = Correo;
        params = JSON.stringify(params);



        $.ajax({

            type: "POST",
            url: "../AsignacionAseo.aspx/SENDMAIL",
            data: params,
            contentType: 'application/json; charset=utf-8',
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
                } else {
                    Swal.fire({

                        type: 'Fallo',
                        title: 'El Correo no Pudo Ser Enviado, Verifique Su Conexion a Internet o Que el Correo Sea Valido',
                        showConfirmButton: false,
                        timer: 3500
                    });
                }
            }


        });


    }


})
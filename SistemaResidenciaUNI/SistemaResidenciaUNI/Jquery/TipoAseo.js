var table, data, dataRow;

jQuery_382(document).ready(function () {

    Listar();






    function Listar() {
        table = $("#DTListar").DataTable({

            destroy: true,
            responsive: true,
            "scrollY": "250px",
            "scrollCollapse": true,
            "paging": false,
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
            },

            ajax: {
                method: "POST",
                url: "../TipoAseo.aspx/listaraseo",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: function (d) {
                    return JSON.stringify(d);
                },
                dataSrc: "d.data",

            },

            columns: [

                { "data": "TIP_ASE_ID" },
                { "data": "TIP_ASE_DESCRIPCION" },
                { "data": "ESTADO" },
                {
                    "defaultContent": '<button value="Actualizar" title="Actualizar" class="btn-editar btn btn-primary" data-target="#Ventana" data-toggle="modal" ><i class="fa fa-pencil-square-o"></i></button>&nbsp' +
                    '<button  value="Eliminar" title="Eliminar" class=" btn btn-danger btn-delete bg-red" data-target="#MEliminar" data-toggle="modal"  style="color:white;"><i class="fa fa-trash-o"></i></button>'
                }


            ]
        });

    }
    //evento para el boton actualizar

    $(document).on('click', '.btn-editar', function (e) {

        e.preventDefault();
        console.log("click en boton actualizar");

        data = table.row($(this).parents("tr")).data();

        var descrip = $("#TxtTipoAseo").val(data.TIP_ASE_DESCRIPCION);

        console.log(data.TIP_ASE_DESCRIPCION);




    });


    //evento para el boton Eliminar

    $(document).on('click', '.btn-delete', function (e) {

        e.preventDefault();
        dataRow = null;
        dataRow = table.row($(this).parents("tr")).data();

    });


    $("#btnsaveschange").click(function (e) {

        e.preventDefault();

        updateDataAjax();

        Listar();



    });

    $("#btneliminar").click(function (e) {
        e.preventDefault();
        DeleteAseo(dataRow.TIP_ASE_ID);

        $("#MEliminar").modal('hide')

        Listar();

    });



    function updateDataAjax() {

        var obj = JSON.stringify({ id: JSON.stringify(data.TIP_ASE_ID), descrip: $("#TxtEditAseo").val() });



        $.ajax({

            type: "POST",
            url: "../TipoAseo.aspx/ActualizarTipoAseo",
            data: obj,
            contentType: 'application/json; charset=utf-8',
            datatype: "json",
            error: function (xhr, ajaxOptions, thrownError) {
                console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
            },
            success: function (response) {
                if (response.d) {
                    alert("Registro actualizado de manera correcta.");
                } else {
                    alert("No se pudo actualizar el registro.");
                }
            }

        });

    }

    function DeleteAseo(data) {


        var obj = JSON.stringify({ id: JSON.stringify(data) });

        $.ajax({

            type: "POST",
            url: "../TipoAseo.aspx/DeleteAseo",
            data: obj,
            contentType: 'application/json; charset=utf-8',
            datatype: "json",
            error: function (xhr, ajaxOptions, thrownError) {
                console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
            },
            success: function (response) {
                if (response.d) {
                    alert("Registro Eliminado de forma correcta.");
                } else {
                    alert("No se pudo Eliminar el registro.");
                }
            }



        });

    }








})
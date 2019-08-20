
jQuery_382(document).ready(function () {

    var DATOS, Table;

    FillDDL();

    function FillDDL()
    {
        $.ajax({

            type:"POST",
            url: "../AsignacionAseo.aspx/ListarCuarto",
            contentType: 'application/json; charset=uft-8',
            datatype: "json",
            success: function (data)
            {
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
        console.log(CuartoSelect);
        ExtraerData(CuartoSelect);

    });//fin llenar DATATABLE



    function ExtraerData(CuartoSele) {
        
        var params = new Object();
        params.idCuarto = CuartoSele;
        params = JSON.stringify(params);
        $.ajax({

            type:"POST",
            url: "../AsignacionAseo.aspx/ListarCantAseo",
            data:params,
            contentType: 'application/json; charset=utf-8',
            datatype:"json",
            success: function (data) {

                FillDataTable(data.d.data);
            }


        });

    }//finExtraerData


    function FillDataTable(data) {

         Table = $("#DTCantidadAsignacion").DataTable({

            destroy: true,
            responsive:true,
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
                
            }


        ]


        });

    }


    //evento para el boton enviar correo

    $(document).on('click', '.btn-mail', function (e) {

        e.preventDefault();
        console.log("click en boton actualizar");

        DATOS = Table.row($(this).parents("tr")).data();
        
        
        console.log(DATOS.COR_DEFINICION);

        SendMail(DATOS.COR_DEFINICION, DATOS.EST_ID);



    });


    function SendMail (Correo,IdEstudent)
    {
        var obj= JSON.stringify({IDEstu:JSON.stringify(2068), correoEstu:JSON.stringify("jacuabarrios@gmail.com")});
    
        $.ajax({
        
            type:"POST",
            url:"../AsignacionAseo.aspx/SENDMAIL",
            data:obj,
            contentType:'application/json; charset=utf-8',
            datatype:"json",


        });
    
    
    }


})
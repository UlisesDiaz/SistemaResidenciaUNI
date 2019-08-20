﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapaDatos
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class dbResidenciaEntities : DbContext
    {
        public dbResidenciaEntities()
            : base("name=dbResidenciaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<TBL_BARRIO> TBL_BARRIO { get; set; }
        public virtual DbSet<TBL_CARRERA> TBL_CARRERA { get; set; }
        public virtual DbSet<TBL_COMPAÑIA> TBL_COMPAÑIA { get; set; }
        public virtual DbSet<TBL_CORREO> TBL_CORREO { get; set; }
        public virtual DbSet<TBL_CUARTO> TBL_CUARTO { get; set; }
        public virtual DbSet<TBL_DEPARTAMENTO> TBL_DEPARTAMENTO { get; set; }
        public virtual DbSet<TBL_DIRECCION> TBL_DIRECCION { get; set; }
        public virtual DbSet<TBL_ESTUDIANTE> TBL_ESTUDIANTE { get; set; }
        public virtual DbSet<TBL_FRECUENCIA> TBL_FRECUENCIA { get; set; }
        public virtual DbSet<TBL_GENERO> TBL_GENERO { get; set; }
        public virtual DbSet<TBL_HIS_ESTUDIANTE_CUARTO> TBL_HIS_ESTUDIANTE_CUARTO { get; set; }
        public virtual DbSet<TBL_HIS_ESTUDIANTE_REGISTRO> TBL_HIS_ESTUDIANTE_REGISTRO { get; set; }
        public virtual DbSet<TBL_HIS_ROL_ASEO> TBL_HIS_ROL_ASEO { get; set; }
        public virtual DbSet<TBL_MUNICIPIO> TBL_MUNICIPIO { get; set; }
        public virtual DbSet<TBL_PER_RELACION> TBL_PER_RELACION { get; set; }
        public virtual DbSet<TBL_PERSONA> TBL_PERSONA { get; set; }
        public virtual DbSet<TBL_RECINTO> TBL_RECINTO { get; set; }
        public virtual DbSet<TBL_RESPONSABLE> TBL_RESPONSABLE { get; set; }
        public virtual DbSet<TBL_ROL_ASEO> TBL_ROL_ASEO { get; set; }
        public virtual DbSet<TBL_TELEFONO> TBL_TELEFONO { get; set; }
        public virtual DbSet<TBL_TIP_PER_RELACION> TBL_TIP_PER_RELACION { get; set; }
        public virtual DbSet<TBL_TIPO_AREA_RESPONSABLE> TBL_TIPO_AREA_RESPONSABLE { get; set; }
        public virtual DbSet<TBL_TIPO_ASEO> TBL_TIPO_ASEO { get; set; }
        public virtual DbSet<TBL_TIPO_IDENTIFICACION> TBL_TIPO_IDENTIFICACION { get; set; }
        public virtual DbSet<TBL_TIPO_MOTIVO_REGISTRO> TBL_TIPO_MOTIVO_REGISTRO { get; set; }
        public virtual DbSet<TBL_USUARIO> TBL_USUARIO { get; set; }
        public virtual DbSet<TBL_ESTADO_CIVIL> TBL_ESTADO_CIVIL { get; set; }
    
        public virtual ObjectResult<string> BUCARPERSONA(string numducumento)
        {
            var numducumentoParameter = numducumento != null ?
                new ObjectParameter("numducumento", numducumento) :
                new ObjectParameter("numducumento", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("BUCARPERSONA", numducumentoParameter);
        }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    
        public virtual ObjectResult<spBuscarCuarto_Result> spBuscarCuarto(Nullable<int> numeroCuarto)
        {
            var numeroCuartoParameter = numeroCuarto.HasValue ?
                new ObjectParameter("NumeroCuarto", numeroCuarto) :
                new ObjectParameter("NumeroCuarto", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spBuscarCuarto_Result>("spBuscarCuarto", numeroCuartoParameter);
        }
    
        public virtual ObjectResult<spMostrarCuartosDisponibles_Result> spMostrarCuartosDisponibles()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spMostrarCuartosDisponibles_Result>("spMostrarCuartosDisponibles");
        }
    
        public virtual ObjectResult<TotalPersonas_Result> TotalPersonas()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<TotalPersonas_Result>("TotalPersonas");
        }
    
        public virtual ObjectResult<spBuscarEstudiantePorCuarto_Result> spBuscarEstudiantePorCuarto(Nullable<int> numeroCuarto)
        {
            var numeroCuartoParameter = numeroCuarto.HasValue ?
                new ObjectParameter("NumeroCuarto", numeroCuarto) :
                new ObjectParameter("NumeroCuarto", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spBuscarEstudiantePorCuarto_Result>("spBuscarEstudiantePorCuarto", numeroCuartoParameter);
        }
    
        public virtual ObjectResult<spInfoEstudiante_Result> spInfoEstudiante(string numCarnet)
        {
            var numCarnetParameter = numCarnet != null ?
                new ObjectParameter("NumCarnet", numCarnet) :
                new ObjectParameter("NumCarnet", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spInfoEstudiante_Result>("spInfoEstudiante", numCarnetParameter);
        }
    
        public virtual int sp_alterdiagram1(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram1", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram1(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram1", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram1(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram1", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition1_Result> sp_helpdiagramdefinition1(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition1_Result>("sp_helpdiagramdefinition1", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams1_Result> sp_helpdiagrams1(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams1_Result>("sp_helpdiagrams1", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram1(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram1", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_upgraddiagrams1()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams1");
        }
    
        public virtual int SPNuevoTipoAseo(string descripcion)
        {
            var descripcionParameter = descripcion != null ?
                new ObjectParameter("Descripcion", descripcion) :
                new ObjectParameter("Descripcion", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SPNuevoTipoAseo", descripcionParameter);
        }
    
        public virtual ObjectResult<spObtenerEventos_Result> spObtenerEventos(Nullable<System.DateTime> startD, Nullable<System.DateTime> endD)
        {
            var startDParameter = startD.HasValue ?
                new ObjectParameter("startD", startD) :
                new ObjectParameter("startD", typeof(System.DateTime));
    
            var endDParameter = endD.HasValue ?
                new ObjectParameter("endD", endD) :
                new ObjectParameter("endD", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spObtenerEventos_Result>("spObtenerEventos", startDParameter, endDParameter);
        }
    
        public virtual ObjectResult<spObtenerDetalleAseoSegunEvento_Result> spObtenerDetalleAseoSegunEvento(Nullable<int> cuaNum, Nullable<System.DateTime> startD)
        {
            var cuaNumParameter = cuaNum.HasValue ?
                new ObjectParameter("cuaNum", cuaNum) :
                new ObjectParameter("cuaNum", typeof(int));
    
            var startDParameter = startD.HasValue ?
                new ObjectParameter("startD", startD) :
                new ObjectParameter("startD", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spObtenerDetalleAseoSegunEvento_Result>("spObtenerDetalleAseoSegunEvento", cuaNumParameter, startDParameter);
        }
    
        public virtual ObjectResult<spMoverEstudianteDeCuarto_Result> spMoverEstudianteDeCuarto(string carnet)
        {
            var carnetParameter = carnet != null ?
                new ObjectParameter("carnet", carnet) :
                new ObjectParameter("carnet", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spMoverEstudianteDeCuarto_Result>("spMoverEstudianteDeCuarto", carnetParameter);
        }
    
        public virtual ObjectResult<spHistorialCuarto_Result> spHistorialCuarto(string nunCarnet)
        {
            var nunCarnetParameter = nunCarnet != null ?
                new ObjectParameter("nunCarnet", nunCarnet) :
                new ObjectParameter("nunCarnet", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spHistorialCuarto_Result>("spHistorialCuarto", nunCarnetParameter);
        }
    
        public virtual ObjectResult<spEstdianteGuardados_Result> spEstdianteGuardados()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spEstdianteGuardados_Result>("spEstdianteGuardados");
        }
    
        public virtual ObjectResult<Nullable<int>> spNumeroCuartoPorIDEST(Nullable<int> iD_EST)
        {
            var iD_ESTParameter = iD_EST.HasValue ?
                new ObjectParameter("ID_EST", iD_EST) :
                new ObjectParameter("ID_EST", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("spNumeroCuartoPorIDEST", iD_ESTParameter);
        }
    
        public virtual ObjectResult<ListadoEstuCuartoSP_Result> ListadoEstuCuartoSP(Nullable<int> numCuarto)
        {
            var numCuartoParameter = numCuarto.HasValue ?
                new ObjectParameter("NumCuarto", numCuarto) :
                new ObjectParameter("NumCuarto", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ListadoEstuCuartoSP_Result>("ListadoEstuCuartoSP", numCuartoParameter);
        }
    
        public virtual int SPDeletelogicaAseo(Nullable<int> idTipoAseo)
        {
            var idTipoAseoParameter = idTipoAseo.HasValue ?
                new ObjectParameter("idTipoAseo", idTipoAseo) :
                new ObjectParameter("idTipoAseo", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SPDeletelogicaAseo", idTipoAseoParameter);
        }
    
        public virtual int SPModificacionAseo(Nullable<int> idTipoAseo, string nuevaDescrip)
        {
            var idTipoAseoParameter = idTipoAseo.HasValue ?
                new ObjectParameter("idTipoAseo", idTipoAseo) :
                new ObjectParameter("idTipoAseo", typeof(int));
    
            var nuevaDescripParameter = nuevaDescrip != null ?
                new ObjectParameter("NuevaDescrip", nuevaDescrip) :
                new ObjectParameter("NuevaDescrip", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SPModificacionAseo", idTipoAseoParameter, nuevaDescripParameter);
        }
    
        public virtual ObjectResult<SPMostrarTipoAseo_Result> SPMostrarTipoAseo()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SPMostrarTipoAseo_Result>("SPMostrarTipoAseo");
        }
    
        public virtual ObjectResult<spCuartosDisponiblesCambioEstudiante_Result> spCuartosDisponiblesCambioEstudiante()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spCuartosDisponiblesCambioEstudiante_Result>("spCuartosDisponiblesCambioEstudiante");
        }
    
        public virtual ObjectResult<MostarEstuAsignacionSP_Result> MostarEstuAsignacionSP(Nullable<int> iD_Cuar)
        {
            var iD_CuarParameter = iD_Cuar.HasValue ?
                new ObjectParameter("ID_Cuar", iD_Cuar) :
                new ObjectParameter("ID_Cuar", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<MostarEstuAsignacionSP_Result>("MostarEstuAsignacionSP", iD_CuarParameter);
        }
    }
}

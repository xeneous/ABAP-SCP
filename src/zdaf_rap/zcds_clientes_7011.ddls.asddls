@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@Metadata.allowExtensions: true

define view entity ZCDS_Clientes_7011
  as select from ztb_clients_7011 as Cli
  inner join ztb_cls_lib_7011 as clLib
    on clLib.id_cliente = Cli.id_cliente  
{
  key clLib.id_libro  as IdLibro,
  key Cli.id_cliente  as IdCliente,
  key Cli.tipo_acceso as Acceso,
      Cli.nombre      as Nombre,
      Cli.apellidos   as Apellidos,
      Cli.emmail      as Email,
      Cli.url         as Imagen
}

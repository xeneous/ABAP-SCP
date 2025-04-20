@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_Libros_7011
  as select from    ztb_libros_7011     as Libros
    inner join      ZCDS_Categ_7011     as Categ on Libros.bi_categ = Categ.Categoria
    left outer join ZCDS_Clnts_lib_7011 as clLib on Libros.id_libro = clLib.IdLibro
  association [0..*] to ZCDS_Clientes_7011 as _Clientes on $projection.IdLibro = _Clientes.IdLibro

{
  key Libros.id_libro   as IdLibro,
      Libros.titulo     as Titulo,
      Libros.bi_categ   as Categoria,
      Categ.Descripcion as Descripcion,
      Libros.autor      as Autor,
      Libros.editorial  as Editorial,
      Libros.idioma     as Idioma,
      Libros.paginas    as Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      Libros.precio     as Precio,
      Libros.moneda     as Moneda,
      case
        when clLib.Ventas < 1 then 0
        when clLib.Ventas = 1 then 1
        when clLib.Ventas = 2 then 2
        else 3
      end               as Ventas,
      ''                as VentasValue,
      Libros.formato    as Formato,
      Libros.url        as Imagen,
      _Clientes
}

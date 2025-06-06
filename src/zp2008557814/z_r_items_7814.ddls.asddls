@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ITEMS Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_R_ITEMS_7814
  as select from zitems_7814
  association to parent Z_R_HEADER_7814 as _Header on $projection.Id = _Header.Id
{
  key id               as Id,
  key item             as Item,
      name             as Name,
      description      as Description,
      releasedate      as Releasedate,
      discontinueddate as Discontinueddate,
      price            as Price,
      @Semantics.quantity.unitOfMeasure : 'Unitofmeasure'
      height           as Height,
      @Semantics.quantity.unitOfMeasure : 'Unitofmeasure'
      width            as Width,
      depth            as Depth,
      quantity         as Quantity,
      unitofmeasure    as Unitofmeasure,
      _Header
}

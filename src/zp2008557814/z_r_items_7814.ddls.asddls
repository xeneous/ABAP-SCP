@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ITEMS Root Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_R_ITEMS_7814
  as select from zitems_7814
  association to parent Z_R_HEADER_7814 as _Header on $projection.Id = _Header.Id
{
  key id                    as Id,
  key item                  as Item,
      name                  as Name,
      description           as Description,
      release_date          as ReleaseDate,
      discontinued_date     as DiscontinuedDate,
      price                 as Price,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      height                as Height,
      @Semantics.quantity.unitOfMeasure : 'UnitOfMeasure'
      width                 as Width,
      depth                 as Depth,
      quantity              as Quantity,
      unit_of_measure       as UnitOfMeasure,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      _Header
}

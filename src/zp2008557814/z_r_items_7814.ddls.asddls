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

  association to parent Z_R_HEADER_7814 as _Header 
    on $projection.HeaderUuid = _Header.HeaderUuid    
    
{
    key items_uuid as ItemsUuid,
    parent_uuid as HeaderUuid,
    pos_id as PosId,
    name as Name,
    description as Description,
    release_date as ReleaseDate,
    discontinued_date as DiscontinuedDate,
    price as Price,
    @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
    height as Height,
    @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
    width as Width,
    depth as Depth,
    quantity as Quantity,
    unit_of_measure as UnitOfMeasure,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt
    ,_Header 
}

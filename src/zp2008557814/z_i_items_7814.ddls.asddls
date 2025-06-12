@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_ITEMS_7814
  provider contract transactional_interface
  as projection on Z_R_ITEMS_7814
{
  key Id,
  key Item,
      Name,
      Description,
      ReleaseDate,
      DiscontinuedDate,
      Price,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Height,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Width,
      Depth,
      Quantity,
      UnitOfMeasure,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt, 
      /* Associations */
      _Header
}

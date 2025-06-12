@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_C_ITEMS_7814
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
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _Header : redirected to parent Z_C_HEADER_7814
}

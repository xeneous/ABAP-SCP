@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_C_ITEMS_7814
  provider contract transactional_query
  as projection on Z_R_ITEMS_7814
{
  key Id,
  key Item,
      Name,
      Description,
      Releasedate,
      Discontinueddate,
      Price,
      @Semantics.quantity.unitOfMeasure: 'Unitofmeasure'
      Height,
      @Semantics.quantity.unitOfMeasure: 'Unitofmeasure'
      Width,
      Depth,
      Quantity,
      Unitofmeasure,
      /* Associations */
      _Header
}

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

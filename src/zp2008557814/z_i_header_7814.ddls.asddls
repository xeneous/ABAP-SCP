@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_HEADER_7814
  provider contract transactional_interface
  as projection on Z_R_HEADER_7814

{
  key Id,
      Email,
      Firstname,
      Lastname,
      Country,
      Createon,
      Deliverydate,
      Orderstatus,
      Imageurl,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Items
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity Z_C_HEADER_7814
  provider contract transactional_query
  as projection on Z_R_HEADER_7814
{
  key Id,
      Email,
      @Search.defaultSearchElement: true
      Firstname,
      @Search.defaultSearchElement: true
      Lastname,
      Country,
      Createon,
      Deliverydate,
      Orderstatus,
      Imageurl,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Items : redirected to composition child Z_C_ITEMS_7814 
}

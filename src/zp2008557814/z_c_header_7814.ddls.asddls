@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_C_HEADER_7814
  provider contract transactional_query as projection on Z_R_HEADER_7814
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
    /* Associations */
    _Items
}

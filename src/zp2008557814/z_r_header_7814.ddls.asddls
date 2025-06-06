@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_R_HEADER_7814
  as select from zheader_7814
     composition [0..*] of Z_R_ITEMS_7814          as _Items
        
{
  key id           as Id,
      email        as Email,
      firstname    as Firstname,
      lastname     as Lastname,
      country      as Country,
      createon     as Createon,
      deliverydate as Deliverydate,
      orderstatus  as Orderstatus,
      imageurl     as Imageurl 
      ,_Items 
}

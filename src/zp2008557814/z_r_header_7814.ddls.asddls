@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_R_HEADER_7814
  as select from zheader_7814
  composition [0..*] of Z_R_ITEMS_7814 as _Items

{
  key id                    as Id,
      email                 as Email,
      first_name            as Firstname,
      last_name             as Lastname,
      country               as Country,
      create_on             as Createon,
      delivery_date         as Deliverydate,
      order_status          as Orderstatus,
      image_url             as Imageurl,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      _Items
}

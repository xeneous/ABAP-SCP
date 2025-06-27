@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_R_HEADER_7814 
    as select from zheader_7814
    
     composition [0..*] of Z_R_ITEMS_7814 as _Items
 
{
    key header_uuid as HeaderUuid,
    id as Id,
    email as Email,
    first_name as FirstName,
    last_name as LastName,
    country as Country,
    create_on as CreateOn,
    delivery_date as DeliveryDate,
    order_status as OrderStatus,
    image_url as ImageUrl,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt
    , _Items
}

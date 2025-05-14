@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supply Root entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_R_BOOKSUP_DAF as select from ztb_booksup_daf
{
    key booksuppl_uuid as BooksupplUUID,
    key travel_uuid as TravelUUID,
    key booking_uuid as BookingUUID,
    key booking_supplement_id as BookingSupplementID,
    supplement_id as SupplementID,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as Price,
    currency_code as CurrencyCode,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt
}

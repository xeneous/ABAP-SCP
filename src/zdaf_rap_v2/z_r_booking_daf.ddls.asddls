@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_R_BOOKING_DAF 
    as select from ztb_booking_daf
    
    association to parent Z_R_TRAVEL_DAF as _Travel on $projection.TravelUUID = _Travel.TravelUUID
    
    composition [0..*] of Z_R_BOOKSUP_DAF as _BookingSupplement
    
{
    key booking_uuid as BookingUUID,
    parent_uuid as TravelUUID,
    booking_id as BookingID,
    booking_date as BookingDate,
    customer_id as CustomerID,
    carrier_id as CarrierID,
    connection_id as ConnectionID,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    booking_status as BookingStatus,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt, 
    _Travel ,
    _BookingSupplement
}

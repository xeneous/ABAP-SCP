@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Root entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_R_BOOKSUP_DAF 
    as select from ztb_booksup_daf
    
    association to parent Z_R_BOOKING_DAF as _Booking on $projection.BookingUUID = _Booking.BookingUUID
    
    association [1..1] to Z_R_TRAVEL_DAF as _Travel on $projection.TravelUUID = _Travel.TravelUUID
    association [1..1] to /DMO/I_Supplement as _Product on $projection.SupplementID = _Product.SupplementID
    association [1..*] to /DMO/I_SupplementText as _SupplementText on $projection.SupplementID = _SupplementText.SupplementID 
//  En la projection se va a resolver el tema de la el lenguaje del texto que hoy da lugar a la cardinalidad 1..*                                                                
                                                                   
    
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
    last_changed_at as LastChangedAt,
     
    _Booking, 
    _Travel,
    _Product,
    _SupplementText
}

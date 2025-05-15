@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Interface entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_BOOKSUP_DAF
  as projection on Z_R_BOOKSUP_DAF
{
  key BooksupplUUID,
  key TravelUUID,
  key BookingUUID,
  key BookingSupplementID,
      SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Booking : redirected to parent Z_I_BOOKING_DAF,
      _Product,
      _SupplementText,
      _Travel : redirected to Z_I_TRAVEL_DAF 
}

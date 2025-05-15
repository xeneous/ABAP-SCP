@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_TRAVEL_DAF
  provider contract transactional_interface // CUD Habilities (Create Update Insert)
  as projection on Z_R_TRAVEL_DAF
{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child Z_I_BOOKING_DAF,
      _Customer,
      _Overal_Status
}

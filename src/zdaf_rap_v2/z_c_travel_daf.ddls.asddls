@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity Z_C_TRAVEL_DAF
  provider contract transactional_query
  as projection on Z_R_TRAVEL_DAF
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      TravelID,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.valueHelpDefinition: [{ entity : { name: '/dmo/I_Agency_StdVH',
                                                      element: 'AgencyID' },
                                                      useForValidation: true } ]
      AgencyID,
      _Agency.Name as AgencyName,
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
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking,
      _Customer,
      _Overal_Status
}

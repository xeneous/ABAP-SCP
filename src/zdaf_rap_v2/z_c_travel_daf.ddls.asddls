@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity Z_C_TRAVEL_DAF
  provider contract transactional_query // (Select )
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
      
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Consumption.valueHelpDefinition: [{ entity : { name: '/DMO/I_Customer_StdVH',
                                                      element: 'CustomerID' },
                                                      useForValidation: true } ]      
      CustomerID,
      _Customer.LastName as CustomerName ,
      
      BeginDate,
      EndDate,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      
      @Consumption.valueHelpDefinition: [{ entity : { name: 'I_CurrencyStdVH',
                                                      element: 'Currency' },
                                                      useForValidation: true } ]         
      CurrencyCode,
      
      
      Description,
      
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      @Consumption.valueHelpDefinition: [{ entity : { name: '/DMO/I_Overall_Status_VH',
                                                      element: 'OverallStatus' },
                                                      useForValidation: true } ]      
      OverallStatus,
      _Overal_Status._Text.Text as OverallStatusText : localized ,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child Z_C_BOOKING_DAF,
      _Customer,
      _Overal_Status
}

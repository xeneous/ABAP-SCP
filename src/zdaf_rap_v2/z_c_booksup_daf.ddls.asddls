@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Consumption entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

define view entity Z_C_BOOKSUP_DAF
  as projection on Z_R_BOOKSUP_DAF
{
  key BooksupplUUID,
  key TravelUUID,
  key BookingUUID,

      @Search.defaultSearchElement: true
  key BookingSupplementID,
  
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ '' ]
      @Consumption.valueHelpDefinition: [{ entity : { name: '/DMO/I_Supplement_StdVH',
      
                                                      element: 'SupplementID' },
                                                                                                           
                                                      additionalBinding: [{ localElement:'Price',
                                                      element:'Price',
                                                      usage: #RESULT },        
                                                      { localElement:'CurrencyCode',                                                            
                                                      element: 'CurrencyCode',
                                                      usage: #RESULT }],
                                                      useForValidation: true } ]
      SupplementID,
      _SupplementText.Description as SupplementDescription : localized ,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      @Consumption.valueHelpDefinition: [{ entity : {   name: 'I_CurrencyStdVH',
                                                        element: 'CurrencyCode' },
                                                        useForValidation: true } ]      
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Booking : redirected to parent Z_C_BOOKING_DAF,
      _Product,
      _SupplementText,
      _Travel  : redirected to Z_C_TRAVEL_DAF

}

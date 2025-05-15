@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Consumption'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true

define view entity Z_C_BOOKING_DAF
  as projection on Z_R_BOOKING_DAF
{
  key BookingUUID,
      TravelUUID,
      
      BookingID,
      
      BookingDate,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Consumption.valueHelpDefinition: [{ entity : { name: '/DMO/I_Customer_StdVH',
                                                      element: 'CustomerID' },
                                                      useForValidation: true } ]      
      CustomerID,
      _Customer.LastName as CustomerName ,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CarrierName' ]
      
      @Consumption.valueHelpDefinition: [{ entity : {   name: '/DMO/I_Flight_StdVH',
                                                        element: 'AirlineID' },
                                                      
                                                        additionalBinding: [                                                                           
                                                                              { localElement: 'ConnectionID',
                                                                                element: 'ConnectionID',
                                                                                usage: #RESULT },
                                                                                
                                                                              { localElement: 'FlightDate',
                                                                                element: 'FlightDate',
                                                                                usage: #RESULT },
                                                                                    
                                                                              { localElement: 'FlightPrice',
                                                                                element: 'Price',
                                                                                usage: #RESULT },
                                                                                
                                                                              { localElement: 'CurrencyCode',
                                                                                element: 'CurrencyCode',
                                                                                usage: #RESULT } ] ,                                                                            
                                                                             
                                                        useForValidation: true } ]
                                                         
      AirlineID,
      _Carrier.Name as CarrierName ,

      @Consumption.valueHelpDefinition: [{ entity : {   name: '/DMO/I_Flight_StdVH',
                                                        element: 'ConnectionID' },
                                                      
                                                        additionalBinding: [                                                                           
                                                                              { localElement: 'AirlineID',
                                                                                element: 'AirlineID',
                                                                                usage: #FILTER_AND_RESULT },
    
                                                                              { localElement: 'FlightDate',
                                                                                element: 'FlightDate',
                                                                                usage: #RESULT },
                                                                                
                                                                              { localElement: 'FlightPrice',
                                                                                element: 'Price',
                                                                                usage: #RESULT },
                                                                                
                                                                              { localElement: 'CurrencyCode',
                                                                                element: 'CurrencyCode',
                                                                                usage: #RESULT } ] ,                                                                            
                                                                             
                                                        useForValidation: true } ]            
      ConnectionID,

      @Consumption.valueHelpDefinition: [{ entity : {   name: '/DMO/I_Flight_StdVH',
                                                        element: 'FlightDate' },
                                                      
                                                        additionalBinding: [                                                                           
                                                                              { localElement: 'AirlineID',
                                                                                element: 'AirlineID',
                                                                                usage: #FILTER_AND_RESULT },
    
                                                                              { localElement: 'ConnectionID',
                                                                                element: 'ConnectionID',
                                                                                usage: #FILTER_AND_RESULT },
                                                                                
                                                                              { localElement: 'FlightPrice',
                                                                                element: 'Price',
                                                                                usage: #RESULT },
                                                                                
                                                                              { localElement: 'CurrencyCode',
                                                                                element: 'CurrencyCode',
                                                                                usage: #RESULT } ] ,                                                                            
                                                                             
                                                        useForValidation: true } ]                  
      FlightDate,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'

      @Consumption.valueHelpDefinition: [{ entity : {   name: '/DMO/I_Flight_StdVH',
                                                        element: 'FlightPrice' },
                                                      
                                                        additionalBinding: [                                                                           
                                                                              { localElement: 'AirlineID',
                                                                                element: 'AirlineID',
                                                                                usage: #FILTER_AND_RESULT },
    
                                                                              { localElement: 'ConnectionID',
                                                                                element: 'ConnectionID',
                                                                                usage: #FILTER_AND_RESULT },
                                                                                
                                                                              { localElement: 'FlightDate',
                                                                                element: 'FlightDate',
                                                                                usage: #FILTER_AND_RESULT },
                                                                                
                                                                              { localElement: 'CurrencyCode',
                                                                                element: 'CurrencyCode',
                                                                                usage: #RESULT } ] ,                                                                            
                                                                             
                                                        useForValidation: true } ]
      
      FlightPrice,
      
      @Consumption.valueHelpDefinition: [{ entity : {   name: '/DMO/I_Flight_StdVH',
                                                        element: 'CurrencyCode' },
                                                      
                                                        additionalBinding: [                                                                           
                                                                              { localElement: 'AirlineID',
                                                                                element: 'AirlineID',
                                                                                usage: #FILTER_AND_RESULT },
    
                                                                              { localElement: 'ConnectionID',
                                                                                element: 'ConnectionID',
                                                                                usage: #FILTER_AND_RESULT },
                                                                                
                                                                              { localElement: 'FlightDate',
                                                                                element: 'FlightDate',
                                                                                usage: #FILTER_AND_RESULT },
                                                                                
                                                                              { localElement: 'FlightPrice',
                                                                                element: 'Price',
                                                                                usage: #FILTER_AND_RESULT } ] ,                                                                            
                                                                             
                                                        useForValidation: true } ]
      
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingSupplement,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent Z_C_TRAVEL_DAF 
}

CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
    begin of travel_status,
        open type c LENGTH 1 value 'O',
        accepted type c LENGTH 1 value 'A',
        rejected type c LENGTH 1 value 'X',
    END OF travel_status .

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Travel RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS precheck_create FOR PRECHECK
      IMPORTING entities FOR CREATE Travel.

    METHODS acceptTravel FOR MODIFY
      IMPORTING keys FOR ACTION Travel~acceptTravel RESULT result.

    METHODS deductDiscount FOR MODIFY
      IMPORTING keys FOR ACTION Travel~deductDiscount RESULT result.

    METHODS reCalcTotalPrice FOR MODIFY
      IMPORTING keys FOR ACTION Travel~reCalcTotalPrice.

    METHODS rejectTravel FOR MODIFY
      IMPORTING keys FOR ACTION Travel~rejectTravel RESULT result.

    METHODS Resume FOR MODIFY
      IMPORTING keys FOR ACTION Travel~Resume.

    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Travel~calculateTotalPrice.

    METHODS setStatusToOpen FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Travel~setStatusToOpen.

    METHODS setTravelNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR Travel~setTravelNumber.

    METHODS validateAgency FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateAgency.

    METHODS validateBookingFee FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateBookingFee.

    METHODS validateCurrency FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateCurrency.

    METHODS validateCustomer FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateCustomer.

    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateDates.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD precheck_create.
  ENDMETHOD.

  METHOD acceptTravel.

    MODIFY ENTITIES OF z_r_travel_daf IN LOCAL MODE
           ENTITY Travel
           update fields ( OverallStatus )
           with value #( for key in keys (  %tky = key-%tky
                                            OverallStatus = travel_status-accepted
           ) ).

    READ ENTITIES OF z_r_travel_daf IN LOCAL MODE
    ENTITY Travel
    ALL FIELDS WITH
    CORRESPONDING #( keys )
    RESULT data(travels) .

    result = value #( for travel in travels (   %tky = travel-%tky
                                                %param = travel )
                                                  ) .

  ENDMETHOD.

  METHOD deductDiscount.
  ENDMETHOD.

  METHOD reCalcTotalPrice.
  ENDMETHOD.

  METHOD rejectTravel.
      MODIFY ENTITIES OF z_r_travel_daf IN LOCAL MODE
           ENTITY Travel
           update fields ( OverallStatus )
           with value #( for key in keys (  %tky = key-%tky
                                            OverallStatus = travel_status-rejected
           ) ).

    READ ENTITIES OF z_r_travel_daf IN LOCAL MODE
    ENTITY Travel
    ALL FIELDS WITH
    CORRESPONDING #( keys )
    RESULT data(travels) .

    result = value #( for travel in travels (   %tky = travel-%tky
                                                %param = travel )
                                                  ) .
  ENDMETHOD.

  METHOD Resume.
  ENDMETHOD.

  METHOD calculateTotalPrice.
  ENDMETHOD.

  METHOD setStatusToOpen.
  ENDMETHOD.

  METHOD setTravelNumber.
  ENDMETHOD.

  METHOD validateAgency.
  ENDMETHOD.

  METHOD validateBookingFee.
  ENDMETHOD.

  METHOD validateCurrency.
  ENDMETHOD.

  METHOD validateCustomer.
  ENDMETHOD.

  METHOD validateDates.
  ENDMETHOD.

ENDCLASS.

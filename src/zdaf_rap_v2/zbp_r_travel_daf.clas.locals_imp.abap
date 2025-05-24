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

    READ ENTITIES OF z_r_travel_daf in local mode
    ENTITY Travel
    FIELDS ( OverallStatus )
    WITH CORRESPONDING #( keys )
    RESULT DATA(TRAVELS) .

    RESULT = VALUE #( FOR TRAvel in travels ( %tky = travel-%tky
                                              %field-BookingFee = cond #( when travel-OverallStatus = travel_status-accepted
                                                                      then if_abap_behv=>fc-f-read_only
                                                                      else if_abap_behv=>fc-f-unrestricted )
                                              %action-acceptTravel      = cond #( when travel-OverallStatus = travel_status-accepted
                                                                          then if_abap_behv=>fc-o-disabled
                                                                          else if_abap_behv=>fc-o-enabled )
                                              %action-rejectTravel      = cond #( when travel-OverallStatus = travel_status-rejected
                                                                          then if_abap_behv=>fc-o-disabled
                                                                          else if_abap_behv=>fc-o-enabled )
                                              %action-deductDiscount    = cond #( when travel-OverallStatus = travel_status-accepted
                                                                          then if_abap_behv=>fc-o-disabled
                                                                          else if_abap_behv=>fc-o-enabled )
                                              %assoc-_Booking           = cond #( when travel-OverallStatus = travel_status-rejected
                                                                          then if_abap_behv=>fc-o-disabled
                                                                          else if_abap_behv=>fc-o-enabled ) )
                                                                          ) .



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

    READ ENTITIES OF z_r_travel_daf IN LOCAL MODE
    ENTITY Travel
    fields ( OverallStatus )
    with CORRESPONDING #( keys )
    RESULT data(travels) .

    delete travels where OverallStatus is not initial.

    CHECK travels is not initial .

    MODIFY ENTITIES OF z_r_travel_daf IN LOCAL MODE
    ENTITY Travel
    update fields ( TravelID )
    with value #( for travel in travels index into i ( %tky = travel-%tky
                                          OverallStatus = travel_status-open ) ) .

  ENDMETHOD.

  METHOD setTravelNumber.

    READ ENTITIES OF z_r_travel_daf IN LOCAL MODE
    ENTITY Travel
    fields ( TravelID )
    with CORRESPONDING #( keys )
    RESULT data(travels) .

    delete travels where TravelID is not initial.

    CHECK travels is not initial .

    Select single from z_r_travel_daf
        fields max( travelID ) as maxId
        into @data(max_Travel_ID) .

    MODIFY ENTITIES OF z_r_travel_daf IN LOCAL MODE
    ENTITY Travel
    update fields ( TravelID )
    with value #( for travel in travels index into i ( %tky = travel-%tky
                                          TravelID = max_travel_id + i ) ) .


  ENDMETHOD.

  METHOD validateAgency.
  ENDMETHOD.

  METHOD validateBookingFee.
  ENDMETHOD.

  METHOD validateCurrency.
  ENDMETHOD.

  METHOD validateCustomer.

    data customers type SORTED TABLE OF /dmo/customer With UNIQUE KEY client customer_id .

    READ ENTITIES OF z_r_travel_daf IN LOCAL MODE
    ENTITY Travel
    fields ( CustomerID )
    with CORRESPONDING #( keys )
    RESULT data(travels) .

    customers = CORRESPONDING #( travels DISCARDING DUPLICATES MAPPING customer_id = CustomerID except * ) .
    delete customers where customer_id is initial .

    if customers is not initial .

        Select from /dmo/customer as db
        inner join @customers as it on db~customer_id = it~customer_id
        FIELDS db~customer_id
        into table @data(valid_customers) .
    endif .

    loop at travels into data(travel) .

        APPEND value #( %tky        = travel-%tky
                        %state_area = 'VALIDATE_CUSTOMER' ) to reported-travel .

        if travel-CustomerID is initial .
            APPEND value #( %tky        = travel-%tky ) to failed-travel .

            APPEND value #( %tky                    = travel-%tky
                            %state_area             = 'VALIDATE_CUSTOMER'
                            %msg                    = new /dmo/cm_flight_messages(  textid = /dmo/cm_flight_messages=>enter_customer_id
                                                                                    severity = if_abap_behv_message=>severity-error )
                            %element-CustomerID     = if_abap_behv=>mk-on
                            ) to reported-travel .

        elseif not line_exists( valid_customers[ customer_id = travel-CustomerID ] ) .

            APPEND value #( %tky        = travel-%tky ) to failed-travel .

            APPEND value #( %tky                    = travel-%tky
                            %state_area             = 'VALIDATE_CUSTOMER'
                            %msg                    = new /dmo/cm_flight_messages(  textid = /dmo/cm_flight_messages=>customer_unkown
                                                                                    customer_id = travel-CustomerID
                                                                                    severity = if_abap_behv_message=>severity-error )
                            %element-CustomerID     = if_abap_behv=>mk-on
                            ) to reported-travel .


        endif .


    ENDLOOP.
  ENDMETHOD.

  METHOD validateDates.
  ENDMETHOD.

ENDCLASS.

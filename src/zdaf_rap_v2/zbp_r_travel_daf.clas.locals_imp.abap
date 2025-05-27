CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF travel_status,
        open     TYPE c LENGTH 1 VALUE 'O',
        accepted TYPE c LENGTH 1 VALUE 'A',
        rejected TYPE c LENGTH 1 VALUE 'X',
      END OF travel_status .

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Travel RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Travel RESULT result.

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

    READ ENTITIES OF z_r_travel_daf IN LOCAL MODE
    ENTITY Travel
    FIELDS ( OverallStatus )
    WITH CORRESPONDING #( keys )
    RESULT DATA(travels) .

    result = VALUE #( FOR TRAvel IN travels ( %tky = travel-%tky
                                              %field-BookingFee = COND #( WHEN travel-OverallStatus = travel_status-accepted
                                                                      THEN if_abap_behv=>fc-f-read_only
                                                                      ELSE if_abap_behv=>fc-f-unrestricted )
                                              %action-acceptTravel      = COND #( WHEN travel-OverallStatus = travel_status-accepted
                                                                          THEN if_abap_behv=>fc-o-disabled
                                                                          ELSE if_abap_behv=>fc-o-enabled )
                                              %action-rejectTravel      = COND #( WHEN travel-OverallStatus = travel_status-rejected
                                                                          THEN if_abap_behv=>fc-o-disabled
                                                                          ELSE if_abap_behv=>fc-o-enabled )
                                              %action-deductDiscount    = COND #( WHEN travel-OverallStatus = travel_status-accepted
                                                                          THEN if_abap_behv=>fc-o-disabled
                                                                          ELSE if_abap_behv=>fc-o-enabled )
                                              %assoc-_Booking           = COND #( WHEN travel-OverallStatus = travel_status-rejected
                                                                          THEN if_abap_behv=>fc-o-disabled
                                                                          ELSE if_abap_behv=>fc-o-enabled ) )
                                                                          ) .



  ENDMETHOD.

  METHOD get_instance_authorizations.

    " Nothing to do with the CREATE operation .
    DATA: update_requested TYPE abap_bool,
          update_granted   TYPE abap_bool,
          delete_requested TYPE abap_bool,
          delete_granted   TYPE abap_bool.

    READ ENTITIES OF z_r_travel_daf IN LOCAL MODE
    ENTITY Travel
    FIELDS ( AgencyID )
    WITH CORRESPONDING #( keys )
    RESULT DATA(travels) .

    update_requested = COND #( WHEN requested_authorizations-%update        = if_abap_behv=>mk-on
                                 OR requested_authorizations-%action-Edit   = if_abap_behv=>mk-on
                               THEN abap_true
                               ELSE abap_false ).

    delete_requested = COND #( WHEN requested_authorizations-%delete        = if_abap_behv=>mk-on
                                   THEN abap_true
                                   ELSE abap_false ).

    DATA(lv_technical_name) = cl_abap_context_info=>get_user_technical_name(  ).

    LOOP AT travels INTO DATA(travel).

      IF travel-AgencyID IS NOT INITIAL .

        IF update_requested EQ abap_true .

          IF travel-AgencyID NE '70014' .  " Hard Code AgencyID 70014
            update_granted = abap_true .
          ELSE .
            update_granted = abap_false .

            APPEND VALUE #(     %tky                    = travel-%tky
                                %msg                    = NEW /dmo/cm_flight_messages(  textid      = /dmo/cm_flight_messages=>not_authorized_for_agencyid
                                                                                        agency_id   = travel-AgencyID
                                                                                        severity    = if_abap_behv_message=>severity-error )
                                %element-AgencyID     = if_abap_behv=>mk-on
                      ) TO reported-travel .
          ENDIF .
        ENDIF .

        IF delete_requested EQ abap_true .

          IF travel-AgencyID NE '70014' .
            delete_granted = abap_true .
          ELSE .
            delete_granted = abap_false .

            APPEND VALUE #(     %tky                    = travel-%tky
                                %msg                    = NEW /dmo/cm_flight_messages(  textid      = /dmo/cm_flight_messages=>not_authorized_for_agencyid
                                                                                        agency_id   = travel-AgencyID
                                                                                        severity    = if_abap_behv_message=>severity-error )
                                %element-AgencyID     = if_abap_behv=>mk-on
                      ) TO reported-travel .
          ENDIF .
        ENDIF .

      endif .

      data: upd_auth_t TYPE abp_behv_auth,
            del_auth_t TYPE abp_behv_auth .


      APPEND value #( let   upd_auth = cond #( when update_granted = abap_true
                                               then if_abap_behv=>auth-allowed
                                               else if_abap_behv=>auth-unauthorized )
                            del_auth = cond #( when delete_granted = abap_true
                                               then if_abap_behv=>auth-allowed
                                               else if_abap_behv=>auth-unauthorized )
                      in %tky           = travel-%tky
                         %update        = upd_auth
                         %action-Edit   = upd_auth
                         %delete        = del_auth ) to result .




      ENDLOOP.




    ENDMETHOD.

    METHOD precheck_create.
    ENDMETHOD.

    METHOD acceptTravel.

      MODIFY ENTITIES OF z_r_travel_daf IN LOCAL MODE
             ENTITY Travel
             UPDATE FIELDS ( OverallStatus )
             WITH VALUE #( FOR key IN keys (  %tky = key-%tky
                                              OverallStatus = travel_status-accepted
             ) ).

      READ ENTITIES OF z_r_travel_daf IN LOCAL MODE
      ENTITY Travel
      ALL FIELDS WITH
      CORRESPONDING #( keys )
      RESULT DATA(travels) .

      result = VALUE #( FOR travel IN travels (   %tky = travel-%tky
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
           UPDATE FIELDS ( OverallStatus )
           WITH VALUE #( FOR key IN keys (  %tky = key-%tky
                                            OverallStatus = travel_status-rejected
           ) ).

      READ ENTITIES OF z_r_travel_daf IN LOCAL MODE
      ENTITY Travel
      ALL FIELDS WITH
      CORRESPONDING #( keys )
      RESULT DATA(travels) .

      result = VALUE #( FOR travel IN travels (   %tky = travel-%tky
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
      FIELDS ( OverallStatus )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels) .

      DELETE travels WHERE OverallStatus IS NOT INITIAL.

      CHECK travels IS NOT INITIAL .

      MODIFY ENTITIES OF z_r_travel_daf IN LOCAL MODE
      ENTITY Travel
      UPDATE FIELDS ( TravelID )
      WITH VALUE #( FOR travel IN travels INDEX INTO i ( %tky = travel-%tky
                                            OverallStatus = travel_status-open ) ) .

    ENDMETHOD.

    METHOD setTravelNumber.

      READ ENTITIES OF z_r_travel_daf IN LOCAL MODE
      ENTITY Travel
      FIELDS ( TravelID )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels) .

      DELETE travels WHERE TravelID IS NOT INITIAL.

      CHECK travels IS NOT INITIAL .

      SELECT SINGLE FROM z_r_travel_daf
          FIELDS MAX( travelID ) AS maxId
          INTO @DATA(max_Travel_ID) .

        MODIFY ENTITIES OF z_r_travel_daf IN LOCAL MODE
        ENTITY Travel
        UPDATE FIELDS ( TravelID )
        WITH VALUE #( FOR travel IN travels INDEX INTO i ( %tky = travel-%tky
                                              TravelID = max_travel_id + i ) ) .


      ENDMETHOD.

      METHOD validateAgency.
      ENDMETHOD.

      METHOD validateBookingFee.
      ENDMETHOD.

      METHOD validateCurrency.
      ENDMETHOD.

      METHOD validateCustomer.

        DATA customers TYPE SORTED TABLE OF /dmo/customer WITH UNIQUE KEY client customer_id .

        READ ENTITIES OF z_r_travel_daf IN LOCAL MODE
        ENTITY Travel
        FIELDS ( CustomerID )
        WITH CORRESPONDING #( keys )
        RESULT DATA(travels) .

        customers = CORRESPONDING #( travels DISCARDING DUPLICATES MAPPING customer_id = CustomerID EXCEPT * ) .
        DELETE customers WHERE customer_id IS INITIAL .

        IF customers IS NOT INITIAL .

          SELECT FROM /dmo/customer AS db
          INNER JOIN @customers AS it ON db~customer_id = it~customer_id
          FIELDS db~customer_id
          INTO TABLE @DATA(valid_customers) .
          ENDIF .

          LOOP AT travels INTO DATA(travel) .

            APPEND VALUE #( %tky        = travel-%tky
                            %state_area = 'VALIDATE_CUSTOMER' ) TO reported-travel .

            IF travel-CustomerID IS INITIAL .
              APPEND VALUE #( %tky        = travel-%tky ) TO failed-travel .

              APPEND VALUE #( %tky                    = travel-%tky
                              %state_area             = 'VALIDATE_CUSTOMER'
                              %msg                    = NEW /dmo/cm_flight_messages(  textid = /dmo/cm_flight_messages=>enter_customer_id
                                                                                      severity = if_abap_behv_message=>severity-error )
                              %element-CustomerID     = if_abap_behv=>mk-on
                              ) TO reported-travel .

            ELSEIF NOT line_exists( valid_customers[ customer_id = travel-CustomerID ] ) .

              APPEND VALUE #( %tky        = travel-%tky ) TO failed-travel .

              APPEND VALUE #( %tky                    = travel-%tky
                              %state_area             = 'VALIDATE_CUSTOMER'
                              %msg                    = NEW /dmo/cm_flight_messages(  textid = /dmo/cm_flight_messages=>customer_unkown
                                                                                      customer_id = travel-CustomerID
                                                                                      severity = if_abap_behv_message=>severity-error )
                              %element-CustomerID     = if_abap_behv=>mk-on
                              ) TO reported-travel .


            ENDIF .


          ENDLOOP.
        ENDMETHOD.

        METHOD validateDates.
        ENDMETHOD.

        METHOD get_global_authorizations.

          DATA(lv_technical_name) = cl_abap_context_info=>get_user_technical_name(  ).

          IF requested_authorizations-%create EQ if_abap_behv=>mk-on .
            IF lv_technical_name = lv_technical_name .
              result-%create = if_abap_behv=>auth-allowed .
            ELSE .
              result-%create = if_abap_behv=>auth-unauthorized .

              APPEND VALUE #( %msg    = NEW /dmo/cm_flight_messages(  textid      = /dmo/cm_flight_messages=>not_authorized
                                                                      severity    = if_abap_behv_message=>severity-error )
                              %global = if_abap_behv=>mk-on ) TO reported-travel.


            ENDIF.
          ENDIF.

          IF requested_authorizations-%delete EQ if_abap_behv=>mk-on .
            IF lv_technical_name = lv_technical_name .
              result-%delete = if_abap_behv=>auth-allowed .
            ELSE .
              result-%delete = if_abap_behv=>auth-unauthorized .

              APPEND VALUE #( %msg    = NEW /dmo/cm_flight_messages(  textid      = /dmo/cm_flight_messages=>not_authorized
                                                                      severity    = if_abap_behv_message=>severity-error )
                              %global = if_abap_behv=>mk-on ) TO reported-travel.


            ENDIF.
          ENDIF.

          IF  requested_authorizations-%update EQ if_abap_behv=>mk-on OR
              requested_authorizations-%action-Edit EQ if_abap_behv=>mk-on.

            IF lv_technical_name = lv_technical_name .
              result-%update = result-%action-Edit = if_abap_behv=>auth-allowed .
            ELSE .
              result-%update = result-%action-Edit = if_abap_behv=>auth-unauthorized .

              APPEND VALUE #( %msg    = NEW /dmo/cm_flight_messages(  textid      = /dmo/cm_flight_messages=>not_authorized
                                                                      severity    = if_abap_behv_message=>severity-error )
                              %global = if_abap_behv=>mk-on ) TO reported-travel.


            ENDIF.
          ENDIF.


        ENDMETHOD.

ENDCLASS.

CLASS lhc_BookingSuplement DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR BookingSuplement RESULT result.

    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR BookingSuplement~calculateTotalPrice.

    METHODS SetBookSupplNumber FOR DETERMINE ON MODIFY
      IMPORTING keys FOR BookingSuplement~SetBookSupplNumber.

    METHODS validateCurrency FOR VALIDATE ON SAVE
      IMPORTING keys FOR BookingSuplement~validateCurrency.

    METHODS validatePrice FOR VALIDATE ON SAVE
      IMPORTING keys FOR BookingSuplement~validatePrice.

    METHODS validateSupplement FOR VALIDATE ON SAVE
      IMPORTING keys FOR BookingSuplement~validateSupplement.

ENDCLASS.

CLASS lhc_BookingSuplement IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD calculateTotalPrice.
  ENDMETHOD.

  METHOD SetBookSupplNumber.
  ENDMETHOD.

  METHOD validateCurrency.
  ENDMETHOD.

  METHOD validatePrice.
  ENDMETHOD.

  METHOD validateSupplement.
  ENDMETHOD.

ENDCLASS.

CLASS lcl_buffer DEFINITION .

  PUBLIC SECTION .

    CONSTANTS: created TYPE c LENGTH 1 VALUE 'C',
               updated TYPE c LENGTH 1 VALUE 'U',
               deleted TYPE c LENGTH 1 VALUE 'D'.

    TYPES: BEGIN OF ty_buffer_master .
             INCLUDE TYPE zhunm_master AS data .
    TYPES:   flag TYPE c LENGTH 1,
           END OF   ty_buffer_master .

    types: tt_master TYPE SORTED TABLE OF ty_buffer_master WITH UNIQUE KEY e_name .

    CLASS-DATA mt_buffer_master type tt_master .

ENDCLASS.

CLASS lhc_HUNMMASTER DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR hunmmaster RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR hunmmaster RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE hunmmaster.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE hunmmaster.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE hunmmaster.

    METHODS read FOR READ
      IMPORTING keys FOR READ hunmmaster RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK hunmmaster.

ENDCLASS.

CLASS lhc_HUNMMASTER IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_Z_R_HUNM_MASTER DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_Z_R_HUNM_MASTER IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.

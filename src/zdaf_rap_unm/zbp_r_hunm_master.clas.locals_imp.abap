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

    data ls_buffer type lcl_buffer=>ty_buffer_master.

    get time stamp field data(lv_tsl).

    select max( e_number ) as e_number
           from zhunm_master
           into @data(lv_e_number).

    loop at entities into data(ls_entities).

      ls_buffer-data-e_number = lv_e_number + 1.
      ls_buffer-data-crea_date_time = lv_tsl.
      ls_buffer-data-crea_uname = sy-uname.
      ls_buffer-data-e_name = ls_entities-%data-EmployeeName.
      ls_buffer-data-e_department = ls_entities-%data-EmployeeDepartment.
      ls_buffer-data-status = ls_entities-%data-EmployeeStatus.
      ls_buffer-data-job_title = ls_entities-%data-JobTitle.
      ls_buffer-data-start_date = ls_entities-%data-StartDate.
      ls_buffer-data-end_date = ls_entities-%data-EndDate.
      ls_buffer-data-email = ls_entities-%data-Email.
      ls_buffer-data-m_number = ls_entities-%data-ManagerNumber.
      ls_buffer-data-m_name = ls_entities-%data-ManagerName.
      ls_buffer-data-m_department = ls_entities-%data-ManagerDepartment.
      ls_buffer-data-crea_date_time = ls_entities-%data-CreatedOn.
      ls_buffer-data-crea_uname = ls_entities-%data-CreatedBy.

      ls_buffer-flag = lcl_buffer=>created.

      insert ls_buffer into table lcl_buffer=>mt_buffer_master.

      if ls_entities-%cid is not initial.
        insert value #( %cid           = ls_entities-%cid
                        EmployeeNumber = ls_entities-EmployeeNumber ) into table mapped-hunmmaster.
      endif.

    endloop.

  ENDMETHOD.

  method update.

    loop at entities into data(ls_entities).

      get time stamp field ls_entities-%data-ChangedOn.
      ls_entities-%data-ChangedBy = sy-uname.

      select single * from zhunm_master
             where e_number eq @ls_entities-EmployeeNumber
             into @data(ls_ddbb).

      if sy-subrc eq 0.


        insert value #( flag = lcl_buffer=>updated
                        data = value #( e_name = cond #( when ls_entities-%control-EmployeeName = if_abap_behv=>mk-on
                                                         then ls_entities-EmployeeName
                                                         else ls_ddbb-e_name )

                                        e_department = cond #( when ls_entities-%control-EmployeeDepartment = if_abap_behv=>mk-on
                                                               then ls_entities-EmployeeDepartment
                                                               else ls_ddbb-e_department )

                                        status       = cond #( when ls_entities-%control-EmployeeStatus = if_abap_behv=>mk-on
                                                                 then ls_entities-EmployeeStatus
                                                                 else ls_ddbb-status )

                                          job_title    = cond #( when ls_entities-%control-JobTitle = if_abap_behv=>mk-on
                                                                 then ls_entities-JobTitle
                                                                 else ls_ddbb-job_title )

                                          start_date   = cond #( when ls_entities-%control-StartDate = if_abap_behv=>mk-on
                                                                 then ls_entities-StartDate
                                                                 else ls_ddbb-start_date )

                                          end_date     = cond #( when ls_entities-%control-EndDate = if_abap_behv=>mk-on
                                                                 then ls_entities-EndDate
                                                                 else ls_ddbb-end_date )

                                          email        = cond #( when ls_entities-%control-Email = if_abap_behv=>mk-on
                                                                 then ls_entities-Email
                                                                 else ls_ddbb-email )
                                          m_number     = cond #( when ls_entities-%control-ManagerNumber = if_abap_behv=>mk-on
                                                                 then ls_entities-ManagerNumber
                                                                 else ls_ddbb-m_number )

                                          m_name       = cond #( when ls_entities-%control-ManagerName = if_abap_behv=>mk-on
                                                                 then ls_entities-ManagerName
                                                                 else ls_ddbb-m_name )

                                          m_department = cond #( when ls_entities-%control-ManagerDepartment = if_abap_behv=>mk-on
                                                                 then ls_entities-ManagerName
                                                                 else ls_ddbb-m_department )

                                          e_number       = ls_entities-EmployeeNumber
                                          crea_date_time = ls_ddbb-crea_date_time
                                          crea_uname     = ls_ddbb-crea_uname
                            ) ) into table lcl_buffer=>mt_buffer_master.

        if ls_entities-EmployeeNumber is not initial.
          insert value #( %cid           = ls_entities-EmployeeNumber
                          EmployeeNumber = ls_entities-EmployeeNumber ) into table mapped-hunmmaster.
        endif.
      endif.
    endloop.

  endmethod.

  method delete.

    loop at keys into data(ls_entities).
      insert value #( flag = lcl_buffer=>deleted
                      data = value #( e_number = ls_entities-EmployeeNumber ) ) into table lcl_buffer=>mt_buffer_master.
      if ls_entities-EmployeeNumber is not initial.
        insert value #( %cid           = ls_entities-EmployeeNumber
                        EmployeeNumber = ls_entities-EmployeeNumber ) into table mapped-hunmmaster.
      endif.
    endloop.

  endmethod.

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

    data: lt_data_created type standard table of zhunm_master,
          lt_data_updated type standard table of zhunm_master,
          lt_data_deleted type standard table of zhunm_master.

    lt_data_created = value #( for <row> in lcl_buffer=>mt_buffer_master where ( flag = lcl_buffer=>created ) ( <row>-data ) ).

    if lt_data_created is not initial.
     insert zhunm_master from table @lt_data_created.
    endif.

    lt_data_updated = value #( for <row> in lcl_buffer=>mt_buffer_master where ( flag = lcl_buffer=>updated ) ( <row>-data ) ).

    if lt_data_updated is not initial.
      update zhunm_master from table @lt_data_updated.
    endif.

    lt_data_deleted = value #( for <row> in lcl_buffer=>mt_buffer_master where ( flag = lcl_buffer=>deleted ) ( <row>-data ) ).

    if lt_data_deleted is not initial.
      delete zhunm_master from table @lt_data_deleted.
    endif.

  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.

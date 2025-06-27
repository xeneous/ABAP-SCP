CLASS zcl_load_data_rapfinal_7814 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PRIVATE SECTION.
    METHODS insert_header_and_items
      IMPORTING iv_index TYPE i.
    METHODS insert_items
      IMPORTING iv_parent_uuid TYPE sysuuid_x16.
ENDCLASS.

CLASS zcl_load_data_rapfinal_7814 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lv_index TYPE i.

    " Borrar datos anteriores
    DELETE FROM zitems_7814.
    DELETE FROM zheader_7814.

    " Insertar 20 headers con 3 ítems cada uno
    DO 20 TIMES.
      lv_index = sy-index.
      insert_header_and_items( iv_index = lv_index ).
    ENDDO.

    out->write( |Se insertaron 20 registros en zheader_7814 y 60 en zitems_7814.| ).
  ENDMETHOD.

  METHOD insert_header_and_items.
    DATA: ls_header TYPE zheader_7814,
          lv_uuid   TYPE sysuuid_x16.

    " Generar UUID para el header
    lv_uuid = cl_system_uuid=>create_uuid_x16_static( ).

    " Completar estructura del header
    ls_header-client = sy-mandt.
    ls_header-header_uuid = lv_uuid.
    ls_header-id = |ORD{ iv_index WIDTH = 4 PAD = '0' }|.
    ls_header-email = |cliente{ iv_index }@example.com|.
    ls_header-first_name = |Nombre{ iv_index }|.
    ls_header-last_name = |Apellido{ iv_index }|.
    ls_header-country = 'AR'.
    ls_header-create_on = sy-datum.
    ls_header-delivery_date = sy-datum + iv_index.
    ls_header-order_status = '0'.
    ls_header-image_url = |IMG{ iv_index }|.
    ls_header-created_by = sy-uname.
    ls_header-created_at = cl_abap_context_info=>get_system_time( ).
    ls_header-last_changed_by = sy-uname.
    ls_header-local_last_changed_at = cl_abap_context_info=>get_system_time( ).
    ls_header-last_changed_at = cl_abap_context_info=>get_system_time( ).

    INSERT zheader_7814 FROM @ls_header.

    " Insertar ítems relacionados
    insert_items( iv_parent_uuid = lv_uuid ).
  ENDMETHOD.

  METHOD insert_items.
    DATA: lt_items TYPE STANDARD TABLE OF zitems_7814,
          ls_item  TYPE zitems_7814,
          lv_uuid  TYPE sysuuid_x16.

    DO 3 TIMES.
      TRY.
          lv_uuid = cl_system_uuid=>create_uuid_x16_static( ).
        CATCH cx_uuid_error.
          "handle exception
      ENDTRY.

      CLEAR ls_item.
      ls_item-client = sy-mandt.
      ls_item-items_uuid = lv_uuid.
      ls_item-parent_uuid = iv_parent_uuid.
      ls_item-pos_id = sy-index.
      ls_item-name = |Producto { sy-index }|.
      ls_item-description = |Descripción del producto { sy-index }|.
      ls_item-release_date = sy-datum - 30.
      ls_item-discontinued_date = sy-datum + 365.
      ls_item-price = '10.00' * sy-index.
      ls_item-height = '10.0'.
      ls_item-width = '5.0'.
      ls_item-depth = '2.0'.
      ls_item-quantity = sy-index.
      ls_item-unit_of_measure = 'EA'.
      ls_item-local_last_changed_at = cl_abap_context_info=>get_system_time( ).
      ls_item-last_changed_at = cl_abap_context_info=>get_system_time( ).

      APPEND ls_item TO lt_items.
    ENDDO.

    INSERT zitems_7814 FROM TABLE @lt_items.
  ENDMETHOD.

ENDCLASS.


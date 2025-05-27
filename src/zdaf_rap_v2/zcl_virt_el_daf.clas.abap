CLASS zcl_virt_el_daf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_virt_el_daf IMPLEMENTATION.
    method if_sadl_exit_calc_element_read~get_calculation_info.
        case iv_entity .
            when 'Z_C_travel_daf' .
                loop AT it_requested_calc_elements into data(ls_requested_calc_elements) .
                    if ls_requested_calc_elements eq 'PRICEWITHVAT' .
                        insert conv #(  'TOTALPRICE' ) into table et_requested_orig_elements .
                     endif.
                ENDLOOP.
            when '' .
            endcase .
    ENDMETHOD.

    METHOD if_sadl_exit_calc_element_read~calculate .

    data lt_original_data type STANDARD TABLE OF z_c_travel_daf with DEFAULT KEY .

    lt_original_data = CORRESPONDING #(  it_original_data ).

    loop at lt_original_data assigning field-symbol(<fs_originak_data>) .
        <fs_originak_data>-PriceWithVAT = <fs_originak_data>-TotalPrice * '1.21' .
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_original_data ) .

    ENDMETHOD.

ENDCLASS.

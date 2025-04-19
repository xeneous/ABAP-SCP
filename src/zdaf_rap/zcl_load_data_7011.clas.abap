CLASS zcl_load_data_7011 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_load_data_7011 IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main .

        DATA:   lt_acc_cat    TYPE table of ztb_acc_cat_7011 ,
                lt_categ      TYPE table of ztb_catego_7011 ,
                lt_clientes   TYPE table of ztb_clients_7011 ,
                lt_cls_lib    TYPE table of ztb_cls_lib_7011 ,
                lt_libros     TYPE table of ztb_libros_7011 .




    ENDMETHOD.

ENDCLASS.

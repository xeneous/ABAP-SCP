CLASS zcl_load_data_7011 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LOAD_DATA_7011 IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main .

        DATA:   lt_acc_cat    TYPE table of ztb_acc_cat_7011 ,
                lt_categ      TYPE table of ztb_catego_7011 ,
                lt_clientes   TYPE table of ztb_clients_7011 ,
                lt_cls_lib    TYPE table of ztb_cls_lib_7011 ,
                lt_libros     TYPE table of ztb_libros_7011 .

            lt_acc_cat = VALUE #(
              ( client = sy-mandt bi_categ = '1' tipo_acceso = 'A' )
              ( client = sy-mandt bi_categ = '2' tipo_acceso = 'B' )
              ( client = sy-mandt bi_categ = '3' tipo_acceso = 'C' )
              ( client = sy-mandt bi_categ = '4' tipo_acceso = 'D' )
              ( client = sy-mandt bi_categ = '5' tipo_acceso = 'E' )
              ( client = sy-mandt bi_categ = '6' tipo_acceso = 'F' )
              ( client = sy-mandt bi_categ = '7' tipo_acceso = 'G' )
              ( client = sy-mandt bi_categ = '8' tipo_acceso = 'H' )
              ( client = sy-mandt bi_categ = '9' tipo_acceso = 'I' )
              ( client = sy-mandt bi_categ = '0' tipo_acceso = 'J' )
              ( client = sy-mandt bi_categ = 'A' tipo_acceso = '1' )
              ( client = sy-mandt bi_categ = 'B' tipo_acceso = '2' )
              ( client = sy-mandt bi_categ = 'C' tipo_acceso = '3' )
              ( client = sy-mandt bi_categ = 'D' tipo_acceso = '4' )
              ( client = sy-mandt bi_categ = 'E' tipo_acceso = '5' )
              ( client = sy-mandt bi_categ = 'F' tipo_acceso = '6' )
              ( client = sy-mandt bi_categ = 'G' tipo_acceso = '7' )
              ( client = sy-mandt bi_categ = 'H' tipo_acceso = '8' )
              ( client = sy-mandt bi_categ = 'I' tipo_acceso = '9' )
              ( client = sy-mandt bi_categ = 'J' tipo_acceso = '0' )
            ).

        INSERT ztb_acc_cat_7011 FROM TABLE @lt_acc_cat.

        IF sy-subrc = 0.
          out->write( |Se insertaron { sy-dbcnt } filas en ZTB_ACC_CAT_7011 para el cliente { sy-mandt }.| ).
        ELSE.
          out->write( 'Error al insertar en ZTB_ACC_CAT_7011. SY-SUBRC:' ).
          out->write( sy-subrc ).
        ENDIF.

        lt_categ = VALUE #(
          ( client = sy-mandt bi_categ = '1' descripcion = 'Categoría Uno' )
          ( client = sy-mandt bi_categ = '2' descripcion = 'Categoría Dos' )
          ( client = sy-mandt bi_categ = '3' descripcion = 'Categoría Tres' )
          ( client = sy-mandt bi_categ = '4' descripcion = 'Categoría Cuatro' )
          ( client = sy-mandt bi_categ = '5' descripcion = 'Categoría Cinco' )
          ( client = sy-mandt bi_categ = '6' descripcion = 'Categoría Seis' )
          ( client = sy-mandt bi_categ = '7' descripcion = 'Categoría Siete' )
          ( client = sy-mandt bi_categ = '8' descripcion = 'Categoría Ocho' )
          ( client = sy-mandt bi_categ = '9' descripcion = 'Categoría Nueve' )
          ( client = sy-mandt bi_categ = '0' descripcion = 'Categoría Diez' )
          ( client = sy-mandt bi_categ = 'A' descripcion = 'Categoría Once' )
          ( client = sy-mandt bi_categ = 'B' descripcion = 'Categoría Doce' )
          ( client = sy-mandt bi_categ = 'C' descripcion = 'Categoría Trece' )
          ( client = sy-mandt bi_categ = 'D' descripcion = 'Categoría Catorce' )
          ( client = sy-mandt bi_categ = 'E' descripcion = 'Categoría Quince' )
          ( client = sy-mandt bi_categ = 'F' descripcion = 'Categoría Dieciséis' )
          ( client = sy-mandt bi_categ = 'G' descripcion = 'Categoría Diecisiete' )
          ( client = sy-mandt bi_categ = 'H' descripcion = 'Categoría Dieciocho' )
          ( client = sy-mandt bi_categ = 'I' descripcion = 'Categoría Diecinueve' )
          ( client = sy-mandt bi_categ = 'J' descripcion = 'Categoría Veinte' )
        ).

        INSERT ztb_catego_7011 FROM table @lt_categ.
        IF sy-subrc = 0.
          out->write( |Se insertaron { sy-dbcnt } filas en ZTB_CATEGO_7011 para el cliente { sy-mandt }.| ).
        ELSE.
          out->write( |Error al insertar en ZTB_CATEGO_7011 para el cliente { sy-mandt }. SY-SUBRC: { sy-subrc }.| ).
        ENDIF.

        lt_clientes = VALUE #(
          ( client = sy-mandt id_cliente = 'CLI01' tipo_acceso = 'A' nombre = 'Nombre 1' apellidos = 'Apellido 1' emmail = 'email1@ejemplo.com' url = 'url1.com' )
          ( client = sy-mandt id_cliente = 'CLI02' tipo_acceso = 'B' nombre = 'Nombre 2' apellidos = 'Apellido 2' emmail = 'email2@ejemplo.com' url = 'url2.com' )
          ( client = sy-mandt id_cliente = 'CLI03' tipo_acceso = 'C' nombre = 'Nombre 3' apellidos = 'Apellido 3' emmail = 'email3@ejemplo.com' url = 'url3.com' )
          ( client = sy-mandt id_cliente = 'CLI04' tipo_acceso = 'D' nombre = 'Nombre 4' apellidos = 'Apellido 4' emmail = 'email4@ejemplo.com' url = 'url4.com' )
          ( client = sy-mandt id_cliente = 'CLI05' tipo_acceso = 'E' nombre = 'Nombre 5' apellidos = 'Apellido 5' emmail = 'email5@ejemplo.com' url = 'url5.com' )
          ( client = sy-mandt id_cliente = 'CLI06' tipo_acceso = 'F' nombre = 'Nombre 6' apellidos = 'Apellido 6' emmail = 'email6@ejemplo.com' url = 'url6.com' )
          ( client = sy-mandt id_cliente = 'CLI07' tipo_acceso = 'G' nombre = 'Nombre 7' apellidos = 'Apellido 7' emmail = 'email7@ejemplo.com' url = 'url7.com' )
          ( client = sy-mandt id_cliente = 'CLI08' tipo_acceso = 'H' nombre = 'Nombre 8' apellidos = 'Apellido 8' emmail = 'email8@ejemplo.com' url = 'url8.com' )
          ( client = sy-mandt id_cliente = 'CLI09' tipo_acceso = 'I' nombre = 'Nombre 9' apellidos = 'Apellido 9' emmail = 'email9@ejemplo.com' url = 'url9.com' )
          ( client = sy-mandt id_cliente = 'CLI10' tipo_acceso = 'J' nombre = 'Nombre 10' apellidos = 'Apellido 10' emmail = 'email10@ejemplo.com' url = 'url10.com' )
          ( client = sy-mandt id_cliente = 'CLI11' tipo_acceso = '1' nombre = 'Nombre 11' apellidos = 'Apellido 11' emmail = 'email11@ejemplo.com' url = 'url11.com' )
          ( client = sy-mandt id_cliente = 'CLI12' tipo_acceso = '2' nombre = 'Nombre 12' apellidos = 'Apellido 12' emmail = 'email12@ejemplo.com' url = 'url12.com' )
          ( client = sy-mandt id_cliente = 'CLI13' tipo_acceso = '3' nombre = 'Nombre 13' apellidos = 'Apellido 13' emmail = 'email13@ejemplo.com' url = 'url13.com' )
          ( client = sy-mandt id_cliente = 'CLI14' tipo_acceso = '4' nombre = 'Nombre 14' apellidos = 'Apellido 14' emmail = 'email14@ejemplo.com' url = 'url14.com' )
          ( client = sy-mandt id_cliente = 'CLI15' tipo_acceso = '5' nombre = 'Nombre 15' apellidos = 'Apellido 15' emmail = 'email15@ejemplo.com' url = 'url15.com' )
          ( client = sy-mandt id_cliente = 'CLI16' tipo_acceso = '6' nombre = 'Nombre 16' apellidos = 'Apellido 16' emmail = 'email16@ejemplo.com' url = 'url16.com' )
          ( client = sy-mandt id_cliente = 'CLI17' tipo_acceso = '7' nombre = 'Nombre 17' apellidos = 'Apellido 17' emmail = 'email17@ejemplo.com' url = 'url17.com' )
          ( client = sy-mandt id_cliente = 'CLI18' tipo_acceso = '8' nombre = 'Nombre 18' apellidos = 'Apellido 18' emmail = 'email18@ejemplo.com' url = 'url18.com' )
          ( client = sy-mandt id_cliente = 'CLI19' tipo_acceso = '9' nombre = 'Nombre 19' apellidos = 'Apellido 19' emmail = 'email19@ejemplo.com' url = 'url19.com' )
          ( client = sy-mandt id_cliente = 'CLI20' tipo_acceso = '0' nombre = 'Nombre 20' apellidos = 'Apellido 20' emmail = 'email20@ejemplo.com' url = 'url20.com' )
        ).

        INSERT ztb_clients_7011 FROM TABLE @lt_clientes.
        IF sy-subrc = 0.
          out->write( |Se insertaron { sy-dbcnt } filas en ZTB_CLIENTS_7011 para el cliente { sy-mandt }.| ).
        ELSE.
          out->write( |Error al insertar en ZTB_CLIENTS_7011 para el cliente { sy-mandt }. SY-SUBRC: { sy-subrc }.| ).
        ENDIF.

        lt_cls_lib = VALUE #(
          ( client = sy-mandt id_cliente = 'CLI01' id_libro = 'LIB01' )
          ( client = sy-mandt id_cliente = 'CLI02' id_libro = 'LIB02' )
          ( client = sy-mandt id_cliente = 'CLI03' id_libro = 'LIB03' )
          ( client = sy-mandt id_cliente = 'CLI04' id_libro = 'LIB04' )
          ( client = sy-mandt id_cliente = 'CLI05' id_libro = 'LIB05' )
          ( client = sy-mandt id_cliente = 'CLI06' id_libro = 'LIB06' )
          ( client = sy-mandt id_cliente = 'CLI07' id_libro = 'LIB07' )
          ( client = sy-mandt id_cliente = 'CLI08' id_libro = 'LIB08' )
          ( client = sy-mandt id_cliente = 'CLI09' id_libro = 'LIB09' )
          ( client = sy-mandt id_cliente = 'CLI10' id_libro = 'LIB10' )
          ( client = sy-mandt id_cliente = 'CLI11' id_libro = 'LIB11' )
          ( client = sy-mandt id_cliente = 'CLI12' id_libro = 'LIB12' )
          ( client = sy-mandt id_cliente = 'CLI13' id_libro = 'LIB13' )
          ( client = sy-mandt id_cliente = 'CLI14' id_libro = 'LIB14' )
          ( client = sy-mandt id_cliente = 'CLI15' id_libro = 'LIB15' )
          ( client = sy-mandt id_cliente = 'CLI16' id_libro = 'LIB16' )
          ( client = sy-mandt id_cliente = 'CLI17' id_libro = 'LIB17' )
          ( client = sy-mandt id_cliente = 'CLI18' id_libro = 'LIB18' )
          ( client = sy-mandt id_cliente = 'CLI19' id_libro = 'LIB19' )
          ( client = sy-mandt id_cliente = 'CLI20' id_libro = 'LIB20' )
        ).

        INSERT ztb_cls_lib_7011 FROM TABLE @lt_cls_lib.
        IF sy-subrc = 0.
          out->write( |Se insertaron { sy-dbcnt } filas en ZTB_CLS_LIB_7011 para el cliente { sy-mandt }.| ).
        ELSE.
          out->write( |Error al insertar en ZTB_CLS_LIB_7011 para el cliente { sy-mandt }. SY-SUBRC: { sy-subrc }.| ).
        ENDIF.

        lt_libros = VALUE #(
          ( client = sy-mandt id_libro = 'LIB01' bi_categ = '1' titulo = 'Título 1' autor = 'Autor Uno' editorial = 'Editorial A' idioma = 'E' paginas = 200 precio = '25.50' moneda = 'USD' formato = 'T' url = 'libro1.com' )
          ( client = sy-mandt id_libro = 'LIB02' bi_categ = '2' titulo = 'Título 2' autor = 'Autor Dos' editorial = 'Editorial B' idioma = 'E' paginas = 350 precio = '19.99' moneda = 'EUR' formato = 'B' url = 'libro2.com' )
          ( client = sy-mandt id_libro = 'LIB03' bi_categ = '3' titulo = 'Título 3' autor = 'Autor Tres' editorial = 'Editorial C' idioma = 'E' paginas = 150 precio = '12.75' moneda = 'USD' formato = 'D' url = 'libro3.com' )
          ( client = sy-mandt id_libro = 'LIB04' bi_categ = '4' titulo = 'Título 4' autor = 'Autor Cuatro' editorial = 'Editorial A' idioma = 'E' paginas = 400 precio = '30.00' moneda = 'EUR' formato = 'T' url = 'libro4.com' )
          ( client = sy-mandt id_libro = 'LIB05' bi_categ = '5' titulo = 'Título 5' autor = 'Autor Cinco' editorial = 'Editorial B' idioma = 'E' paginas = 280 precio = '22.00' moneda = 'USD' formato = 'B' url = 'libro5.com' )
          ( client = sy-mandt id_libro = 'LIB06' bi_categ = '6' titulo = 'Título 6' autor = 'Autor Seis' editorial = 'Editorial C' idioma = 'E' paginas = 310 precio = '15.99' moneda = 'EUR' formato = 'D' url = 'libro6.com' )
          ( client = sy-mandt id_libro = 'LIB07' bi_categ = '7' titulo = 'Título 7' autor = 'Autor Siete' editorial = 'Editorial A' idioma = 'E' paginas = 180 precio = '10.50' moneda = 'USD' formato = 'T' url = 'libro7.com' )
          ( client = sy-mandt id_libro = 'LIB08' bi_categ = '8' titulo = 'Título 8' autor = 'Autor Ocho' editorial = 'Editorial B' idioma = 'E' paginas = 450 precio = '28.75' moneda = 'EUR' formato = 'T' url = 'libro8.com' )
          ( client = sy-mandt id_libro = 'LIB09' bi_categ = '9' titulo = 'Título 9' autor = 'Autor Nueve' editorial = 'Editorial C' idioma = 'E' paginas = 220 precio = '17.20' moneda = 'USD' formato = 'B' url = 'libro9.com' )
          ( client = sy-mandt id_libro = 'LIB10' bi_categ = '0' titulo = 'Título 10' autor = 'Autor Diez' editorial = 'Editorial A' idioma = 'E' paginas = 380 precio = '21.50' moneda = 'EUR' formato = 'D' url = 'libro10.com' )
          ( client = sy-mandt id_libro = 'LIB11' bi_categ = 'A' titulo = 'Título 11' autor = 'Autor Once' editorial = 'Editorial B' idioma = 'F' paginas = 250 precio = '14.00' moneda = 'USD' formato = 'T' url = 'libro11.com' )
          ( client = sy-mandt id_libro = 'LIB12' bi_categ = 'B' titulo = 'Título 12' autor = 'Autor Doce' editorial = 'Editorial C' idioma = 'E' paginas = 300 precio = '26.99' moneda = 'EUR' formato = 'T' url = 'libro12.com' )
          ( client = sy-mandt id_libro = 'LIB13' bi_categ = 'C' titulo = 'Título 13' autor = 'Autor Trece' editorial = 'Editorial A' idioma = 'E' paginas = 190 precio = '11.50' moneda = 'USD' formato = 'B' url = 'libro13.com' )
          ( client = sy-mandt id_libro = 'LIB14' bi_categ = 'D' titulo = 'Título 14' autor = 'Autor Catorce' editorial = 'Editorial B' idioma = 'E' paginas = 420 precio = '32.00' moneda = 'EUR' formato = 'D' url = 'libro14.com' )
          ( client = sy-mandt id_libro = 'LIB15' bi_categ = 'E' titulo = 'Título 15' autor = 'Autor Quince' editorial = 'Editorial C' idioma = 'E' paginas = 270 precio = '18.25' moneda = 'USD' formato = 'T' url = 'libro15.com' )
          ( client = sy-mandt id_libro = 'LIB16' bi_categ = 'F' titulo = 'Título 16' autor = 'Autor Dieciséis' editorial = 'Editorial A' idioma = 'E' paginas = 330 precio = '24.50' moneda = 'EUR' formato = 'B' url = 'libro16.com' )
          ( client = sy-mandt id_libro = 'LIB17' bi_categ = 'G' titulo = 'Título 17' autor = 'Autor Diecisiete' editorial = 'Editorial B' idioma = 'E' paginas = 210 precio = '16.80' moneda = 'USD' formato = 'D' url = 'libro17.com' )
          ( client = sy-mandt id_libro = 'LIB18' bi_categ = 'H' titulo = 'Título 18' autor = 'Autor Dieciocho' editorial = 'Editorial C' idioma = 'E' paginas = 390 precio = '29.99' moneda = 'EUR' formato = 'T' url = 'libro18.com' )
          ( client = sy-mandt id_libro = 'LIB19' bi_categ = 'I' titulo = 'Título 19' autor = 'Autor Diecinueve' editorial = 'Editorial A' idioma = 'E' paginas = 230 precio = '13.10' moneda = 'USD' formato = 'T' url = 'libro19.com' )
          ( client = sy-mandt id_libro = 'LIB20' bi_categ = 'J' titulo = 'Título 20' autor = 'Autor Veinte' editorial = 'Editorial B' idioma = 'E' paginas = 360 precio = '27.50' moneda = 'EUR' formato = 'B' url = 'libro20.com' )
        ).

        INSERT ztb_libros_7011 FROM TABLE @lt_libros.
        IF sy-subrc = 0.
          out->write( |Se insertaron { sy-dbcnt } filas en ZTB_LIBROS_7011 para el cliente { sy-mandt }.| ).
        ELSE.
          out->write( |Error al insertar en ZTB_LIBROS_7011 para el cliente { sy-mandt }. SY-SUBRC: { sy-subrc }.| ).
        ENDIF.


    ENDMETHOD.
ENDCLASS.

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

        DATA:   lt_acc_cat    TYPE table of ztb_acc_cat_7011,
                lt_categ      TYPE table of ztb_catego_7011,
                lt_clientes   TYPE table of ztb_clients_7011,
                lt_cls_lib    TYPE table of ztb_cls_lib_7011,
                lt_libros     TYPE table of ztb_libros_7011 .

" *** Inicializando lt_acc_cat con 20 filas ***
lt_acc_cat = VALUE #(
  ( client = sy-mandt bi_categ = 'FIC' tipo_acceso = 'PREM' )
  ( client = sy-mandt bi_categ = 'TEC' tipo_acceso = 'BAS' )
  ( client = sy-mandt bi_categ = 'FIC' tipo_acceso = 'VIP' )
  ( client = sy-mandt bi_categ = 'HIS' tipo_acceso = 'PREM' )
  ( client = sy-mandt bi_categ = 'TEC' tipo_acceso = 'VIP' )
  ( client = sy-mandt bi_categ = 'BIO' tipo_acceso = 'BAS' )
  ( client = sy-mandt bi_categ = 'FIC' tipo_acceso = 'BAS' )
  ( client = sy-mandt bi_categ = 'HIS' tipo_acceso = 'VIP' )
  ( client = sy-mandt bi_categ = 'BIO' tipo_acceso = 'PREM' )
  ( client = sy-mandt bi_categ = 'TEC' tipo_acceso = 'PREM' )
  ( client = sy-mandt bi_categ = 'CIE' tipo_acceso = 'BAS' )
  ( client = sy-mandt bi_categ = 'ART' tipo_acceso = 'PREM' )
  ( client = sy-mandt bi_categ = 'FIL' tipo_acceso = 'VIP' )
  ( client = sy-mandt bi_categ = 'VIA' tipo_acceso = 'BAS' )
  ( client = sy-mandt bi_categ = 'COC' tipo_acceso = 'PREM' )
  ( client = sy-mandt bi_categ = 'DEI' tipo_acceso = 'VIP' )
  ( client = sy-mandt bi_categ = 'CIE' tipo_acceso = 'PREM' )
  ( client = sy-mandt bi_categ = 'ART' tipo_acceso = 'BAS' )
  ( client = sy-mandt bi_categ = 'FIL' tipo_acceso = 'PREM' )
  ( client = sy-mandt bi_categ = 'VIA' tipo_acceso = 'VIP' )
 ).

" *** Inicializando lt_categ con 20 filas ***
lt_categ = VALUE #(
  ( client = sy-mandt bi_categ = 'FIC' descripcion = 'Ficción' )
  ( client = sy-mandt bi_categ = 'TEC' descripcion = 'Técnico' )
  ( client = sy-mandt bi_categ = 'HIS' descripcion = 'Historia' )
  ( client = sy-mandt bi_categ = 'BIO' descripcion = 'Biografías' )
  ( client = sy-mandt bi_categ = 'CIE' descripcion = 'Ciencia' )
  ( client = sy-mandt bi_categ = 'ART' descripcion = 'Arte' )
  ( client = sy-mandt bi_categ = 'FIL' descripcion = 'Filosofía' )
  ( client = sy-mandt bi_categ = 'VIA' descripcion = 'Viajes' )
  ( client = sy-mandt bi_categ = 'COC' descripcion = 'Cocina' )
  ( client = sy-mandt bi_categ = 'DEI' descripcion = 'Deportes' )
  ( client = sy-mandt bi_categ = 'PSI' descripcion = 'Psicología' )
  ( client = sy-mandt bi_categ = 'ECO' descripcion = 'Economía' )
  ( client = sy-mandt bi_categ = 'POL' descripcion = 'Política' )
  ( client = sy-mandt bi_categ = 'MUS' descripcion = 'Música' )
  ( client = sy-mandt bi_categ = 'CRI' descripcion = 'Crimen' )
  ( client = sy-mandt bi_categ = 'FAN' descripcion = 'Fantasía' )
  ( client = sy-mandt bi_categ = 'TER' descripcion = 'Terror' )
  ( client = sy-mandt bi_categ = 'HUM' descripcion = 'Humor' )
  ( client = sy-mandt bi_categ = 'POE' descripcion = 'Poesía' )
  ( client = sy-mandt bi_categ = 'MAN' descripcion = 'Manga' )
 ).

 " *** Inicializando lt_clientes con 20 filas ***
lt_clientes = VALUE #(
  ( client = sy-mandt id_cliente = 'CL001' tipo_acceso = 'PREM' nombre = 'Ana' apellidos = 'García' emmail = 'ana.garcia@ejemplo.com' url = 'http://ana.ejemplo.com' )
  ( client = sy-mandt id_cliente = 'CL002' tipo_acceso = 'BAS' nombre = 'Carlos' apellidos = 'López' emmail = 'carlos.lopez@ejemplo.com' url = 'http://carlos.ejemplo.com' )
  ( client = sy-mandt id_cliente = 'CL003' tipo_acceso = 'VIP' nombre = 'Sofía' apellidos = 'Martínez' emmail = 'sofia.martinez@ejemplo.com' url = 'http://sofia.ejemplo.com' )
  ( client = sy-mandt id_cliente = 'CL004' tipo_acceso = 'PREM' nombre = 'Javier' apellidos = 'Pérez' emmail = 'javier.perez@ejemplo.com' url = 'http://javier.ejemplo.com' )
  ( client = sy-mandt id_cliente = 'CL005' tipo_acceso = 'BAS' nombre = 'Lucía' apellidos = 'Sánchez' emmail = 'lucia.sanchez@ejemplo.com' url = 'http://lucia.ejemplo.com' )
  ( client = sy-mandt id_cliente = 'CL006' tipo_acceso = 'VIP' nombre = 'Manuel' apellidos = 'Romero' emmail = 'manuel.romero@ejemplo.com' url = 'http://manuel.romero.com' )
  ( client = sy-mandt id_cliente = 'CL007' tipo_acceso = 'PREM' nombre = 'Carmen' apellidos = 'Díaz' emmail = 'carmen.diaz@ejemplo.com' url = 'http://carmen.ejemplo.com' )
  ( client = sy-mandt id_cliente = 'CL008' tipo_acceso = 'BAS' nombre = 'Pedro' apellidos = 'Ruiz' emmail = 'pedro.ruiz@ejemplo.com' url = 'http://pedro.ejemplo.com' )
  ( client = sy-mandt id_cliente = 'CL009' tipo_acceso = 'VIP' nombre = 'Isabel' apellidos = 'Alonso' emmail = 'isabel.alonso@ejemplo.com' url = 'http://isabel.alonso.com' )
  ( client = sy-mandt id_cliente = 'CL010' tipo_acceso = 'PREM' nombre = 'Miguel' apellidos = 'Herrera' emmail = 'miguel.herrera@ejemplo.com' url = 'http://miguel.ejemplo.com' )
  ( client = sy-mandt id_cliente = 'CL011' tipo_acceso = 'BAS' nombre = 'Elena' apellidos = 'Jiménez' emmail = 'elena.jimenez@ejemplo.com' url = 'http://elena.ejemplo.com' )
  ( client = sy-mandt id_cliente = 'CL012' tipo_acceso = 'VIP' nombre = 'Sergio' apellidos = 'Moreno' emmail = 'sergio.moreno@ejemplo.com' url = 'http://sergio.moreno.com' )
  ( client = sy-mandt id_cliente = 'CL013' tipo_acceso = 'PREM' nombre = 'Raquel' apellidos = 'Blanco' emmail = 'raquel.blanco@ejemplo.com' url = 'http://raquel.blanco.com' )
  ( client = sy-mandt id_cliente = 'CL014' tipo_acceso = 'BAS' nombre = 'Daniel' apellidos = 'Castro' emmail = 'daniel.castro@ejemplo.com' url = 'http://daniel.castro.com' )
  ( client = sy-mandt id_cliente = 'CL015' tipo_acceso = 'VIP' nombre = 'Paula' apellidos = 'Fernández' emmail = 'paula.fernandez@ejemplo.com' url = 'http://paula.fernandez.com' )
  ( client = sy-mandt id_cliente = 'CL016' tipo_acceso = 'PREM' nombre = 'Adrián' apellidos = 'Gil' emmail = 'adrian.gil@ejemplo.com' url = 'http://adrian.gil.com' )
  ( client = sy-mandt id_cliente = 'CL017' tipo_acceso = 'BAS' nombre = 'Sara' apellidos = 'Vargas' emmail = 'sara.vargas@ejemplo.com' url = 'http://sara.vargas.com' )
  ( client = sy-mandt id_cliente = 'CL018' tipo_acceso = 'VIP' nombre = 'Víctor' apellidos = 'Reyes' emmail = 'victor.reyes@ejemplo.com' url = 'http://victor.reyes.com' )
  ( client = sy-mandt id_cliente = 'CL019' tipo_acceso = 'PREM' nombre = 'Alba' apellidos = 'Rubio' emmail = 'alba.rubio@ejemplo.com' url = 'http://alba.rubio.com' )
  ( client = sy-mandt id_cliente = 'CL020' tipo_acceso = 'BAS' nombre = 'Jorge' apellidos = 'Soto' emmail = 'jorge.soto@ejemplo.com' url = 'http://jorge.soto.com' )
 ).

" *** Inicializando lt_libros con 20 filas ***
lt_libros = VALUE #(
  ( client = sy-mandt id_libro = 'LB001' bi_categ = 'FIC' titulo = 'El Señor de los Anillos' autor = 'J.R.R. Tolkien' editorial = 'Minotauro' idioma = 'ES' paginas = 1200 precio = '35.50' moneda = 'EUR' formato = 'Tapa Dura' url =
'http://libro001.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB002' bi_categ = 'TEC' titulo = 'Introducción a Python' autor = 'Eric Matthes' editorial = 'No Starch Press' idioma = 'ES' paginas = 500 precio = '42.00' moneda = 'EUR' formato = 'Tapa Blanda' url =
'http://libro002.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB003' bi_categ = 'FIC' titulo = 'El Hobbit' autor = 'J.R.R. Tolkien' editorial = 'Minotauro' idioma = 'ES' paginas = 300 precio = '25.00' moneda = 'EUR' formato = 'Tapa Dura' url = 'http://libro003.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB004' bi_categ = 'HIS' titulo = 'Sapiens' autor = 'Yuval Noah Harari' editorial = 'Debate' idioma = 'ES' paginas = 500 precio = '28.00' moneda = 'EUR' formato = 'Tapa Blanda' url = 'http://libro004.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB005' bi_categ = 'TEC' titulo = 'Clean Code' autor = 'Robert C. Martin' editorial = 'Prentice Hall' idioma = 'EN' paginas = 450 precio = '48.00' moneda = 'EUR' formato = 'Tapa Blanda' url = 'http://libro005.ejemplo.com'
)
  ( client = sy-mandt id_libro = 'LB006' bi_categ = 'BIO' titulo = 'Steve Jobs' autor = 'Walter Isaacson' editorial = 'Debate' idioma = 'ES' paginas = 600 precio = '29.95' moneda = 'EUR' formato = 'Tapa Blanda' url = 'http://libro006.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB007' bi_categ = 'FIC' titulo = 'Orgullo y Prejuicio' autor = 'Jane Austen' editorial = 'Alianza' idioma = 'ES' paginas = 400 precio = '15.00' moneda = 'EUR' formato = 'Tapa Blanda' url = 'http://libro007.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB008' bi_categ = 'HIS' titulo = 'Breve Historia del Tiempo' autor = 'Stephen Hawking' editorial = 'Crítica' idioma = 'ES' paginas = 250 precio = '19.90' moneda = 'EUR' formato = 'Tapa Blanda' url =
'http://libro008.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB009' bi_categ = 'BIO' titulo = 'Nelson Mandela' autor = 'Anthony Sampson' editorial = 'Debate' idioma = 'ES' paginas = 700 precio = '32.50' moneda = 'EUR' formato = 'Tapa Blanda' url = 'http://libro009.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB010' bi_categ = 'TEC' titulo = 'The Pragmatic Programmer' autor = 'Andrew Hunt & David Thomas' editorial = 'Addison-Wesley' idioma = 'EN' paginas = 350 precio = '45.00' moneda = 'EUR' formato = 'Tapa Blanda' url =
'http://libro010.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB011' bi_categ = 'CIE' titulo = 'Cosmos' autor = 'Carl Sagan' editorial = 'Planeta' idioma = 'ES' paginas = 380 precio = '22.00' moneda = 'EUR' formato = 'Tapa Blanda' url = 'http://libro011.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB012' bi_categ = 'ART' titulo = 'Historia del Arte' autor = 'E.H. Gombrich' editorial = 'Phaidon' idioma = 'ES' paginas = 700 precio = '55.00' moneda = 'EUR' formato = 'Tapa Dura' url = 'http://libro012.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB013' bi_categ = 'FIL' titulo = 'Así Habló Zaratustra' autor = 'Friedrich Nietzsche' editorial = 'Alianza' idioma = 'ES' paginas = 320 precio = '18.50' moneda = 'EUR' formato = 'Tapa Blanda' url =
'http://libro013.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB014' bi_categ = 'VIA' titulo = 'En el Camino' autor = 'Jack Kerouac' editorial = 'Anagrama' idioma = 'ES' paginas = 400 precio = '21.00' moneda = 'EUR' formato = 'Tapa Blanda' url = 'http://libro014.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB015' bi_categ = 'COC' titulo = 'El Arte de la Cocina Francesa' autor = 'Julia Child' editorial = 'Debolsillo' idioma = 'ES' paginas = 750 precio = '38.00' moneda = 'EUR' formato = 'Tapa Blanda' url =
'http://libro015.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB016' bi_categ = 'DEI' titulo = 'Open' autor = 'Andre Agassi' editorial = 'Debolsillo' idioma = 'ES' paginas = 480 precio = '24.95' moneda = 'EUR' formato = 'Tapa Blanda' url = 'http://libro016.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB017' bi_categ = 'PSI' titulo = 'El Hombre en Busca de Sentido' autor = 'Viktor Frankl' editorial = 'Herder' idioma = 'ES' paginas = 200 precio = '16.00' moneda = 'EUR' formato = 'Tapa Blanda' url =
'http://libro017.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB018' bi_categ = 'ECO' titulo = 'El Capital en el Siglo XXI' autor = 'Thomas Piketty' editorial = 'FCE' idioma = 'ES' paginas = 680 precio = '45.00' moneda = 'EUR' formato = 'Tapa Blanda' url =
'http://libro018.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB019' bi_categ = 'POL' titulo = '1984' autor = 'George Orwell' editorial = 'Debolsillo' idioma = 'ES' paginas = 350 precio = '14.50' moneda = 'EUR' formato = 'Tapa Blanda' url = 'http://libro019.ejemplo.com' )
  ( client = sy-mandt id_libro = 'LB020' bi_categ = 'MUS' titulo = 'El Ruido Eterno' autor = 'Alex Ross' editorial = 'Seix Barral' idioma = 'ES' paginas = 580 precio = '29.00' moneda = 'EUR' formato = 'Tapa Blanda' url = 'http://libro020.ejemplo.com' )
 ).


 " *** Inicializando lt_cls_lib con 20 filas ***
lt_cls_lib = VALUE #(
  ( client = sy-mandt id_cliente = 'CL001' id_libro = 'LB001' )
  ( client = sy-mandt id_cliente = 'CL001' id_libro = 'LB003' )
  ( client = sy-mandt id_cliente = 'CL002' id_libro = 'LB002' )
  ( client = sy-mandt id_cliente = 'CL003' id_libro = 'LB004' )
  ( client = sy-mandt id_cliente = 'CL004' id_libro = 'LB005' )
  ( client = sy-mandt id_cliente = 'CL005' id_libro = 'LB006' )
  ( client = sy-mandt id_cliente = 'CL006' id_libro = 'LB007' )
  ( client = sy-mandt id_cliente = 'CL007' id_libro = 'LB008' )
  ( client = sy-mandt id_cliente = 'CL008' id_libro = 'LB009' )
  ( client = sy-mandt id_cliente = 'CL009' id_libro = 'LB010' )
  ( client = sy-mandt id_cliente = 'CL010' id_libro = 'LB011' )
  ( client = sy-mandt id_cliente = 'CL011' id_libro = 'LB012' )
  ( client = sy-mandt id_cliente = 'CL012' id_libro = 'LB013' )
  ( client = sy-mandt id_cliente = 'CL013' id_libro = 'LB014' )
  ( client = sy-mandt id_cliente = 'CL014' id_libro = 'LB015' )
  ( client = sy-mandt id_cliente = 'CL015' id_libro = 'LB016' )
  ( client = sy-mandt id_cliente = 'CL016' id_libro = 'LB017' )
  ( client = sy-mandt id_cliente = 'CL017' id_libro = 'LB018' )
  ( client = sy-mandt id_cliente = 'CL018' id_libro = 'LB019' )
  ( client = sy-mandt id_cliente = 'CL019' id_libro = 'LB020' )
 ).

 " *** Insertando los datos desde las tablas internas a las tablas de la base de datos ***
INSERT ztb_acc_cat_7011 FROM TABLE @lt_acc_cat.
IF sy-subrc <> 0.
"  MESSAGE 'Error al insertar datos en ztb_acc_cat_7011' TYPE 'E'.
ENDIF.

INSERT ztb_catego_7011 FROM TABLE @lt_categ.
IF sy-subrc <> 0.
"  MESSAGE 'Error al insertar datos en ztb_catego_7011' TYPE 'E'.
ENDIF.

INSERT ztb_clients_7011 FROM TABLE @lt_clientes.
IF sy-subrc <> 0.
"  MESSAGE 'Error al insertar datos en ztb_clients_7011' TYPE 'E'.
ENDIF.

INSERT ztb_libros_7011 FROM TABLE @lt_libros.
IF sy-subrc <> 0.
"  MESSAGE 'Error al insertar datos en ztb_libros_7011' TYPE 'E'.
ENDIF.

INSERT ztb_cls_lib_7011 FROM TABLE @lt_cls_lib.
IF sy-subrc <> 0.
"  MESSAGE 'Error al insertar datos en ztb_cls_lib_7011' TYPE 'E'.
ENDIF.

COMMIT WORK.
"MESSAGE 'Datos de ejemplo insertados correctamente en las tablas.' TYPE 'S'.






    ENDMETHOD.

ENDCLASS.

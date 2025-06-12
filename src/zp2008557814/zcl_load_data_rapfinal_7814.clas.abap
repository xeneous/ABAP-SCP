CLASS zcl_load_data_rapfinal_7814 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_load_data_rapfinal_7814 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
        DATA:   lt_header    TYPE table of zheader_7814 ,
                lt_items      TYPE table of zitems_7814 .


DELETE FROM zheader_7814 .

lt_header = VALUE #(
    ( client          = sy-mandt
      id              = 'ORD001'
      email           = 'alice.smith@example.com'
      first_name      = 'Alice'
      last_name       = 'Smith'
      country         = 'US'
      create_on       = '20250601'
      delivery_date   = '20250615'
      order_status    = '0' " Numeric: 'NEW'
      image_url       = 'ORD001' )
    ( client          = sy-mandt
      id              = 'ORD002'
      email           = 'bob.jones@example.com'
      first_name      = 'Bob'
      last_name       = 'Jones'
      country         = 'CA'
      create_on       = '20250528'
      delivery_date   = '20250610'
      order_status    = '1' " Numeric: 'PENDING'
      image_url       = 'ORD002' )
    ( client          = sy-mandt
      id              = 'ORD003'
      email           = 'charlie.brown@example.com'
      first_name      = 'Charlie'
      last_name       = 'Brown'
      country         = 'DE'
      create_on       = '20250605'
      delivery_date   = '20250620'
      order_status    = '2' " Numeric: 'COMPLETED'
      image_url       = 'ORD003' )
    ( client          = sy-mandt
      id              = 'ORD004'
      email           = 'diana.prince@example.com'
      first_name      = 'Diana'
      last_name       = 'Prince'
      country         = 'US'
      create_on       = '20250602'
      delivery_date   = '20250618'
      order_status    = '0' " Numeric: 'NEW'
      image_url       = 'ORD004' )
    ( client          = sy-mandt
      id              = 'ORD005'
      email           = 'ethan.hunt@example.com'
      first_name      = 'Ethan'
      last_name       = 'Hunt'
      country         = 'GB'
      create_on       = '20250529'
      delivery_date   = '20250612'
      order_status    = '1' " Numeric: 'PENDING'
      image_url       = 'ORD005' )
    ( client          = sy-mandt
      id              = 'ORD006'
      email           = 'fiona.glen@example.com'
      first_name      = 'Fiona'
      last_name       = 'Glen'
      country         = 'FR'
      create_on       = '20250606'
      delivery_date   = '20250622'
      order_status    = '2' " Numeric: 'COMPLETED'
      image_url       = 'ORD006' )
    ( client          = sy-mandt
      id              = 'ORD007'
      email           = 'george.kahn@example.com'
      first_name      = 'George'
      last_name       = 'Kahn'
      country         = 'AU'
      create_on       = '20250603'
      delivery_date   = '20250619'
      order_status    = '0' " Numeric: 'NEW'
      image_url       = 'ORD007' )
    ( client          = sy-mandt
      id              = 'ORD008'
      email           = 'hannah.lee@example.com'
      first_name      = 'Hannah'
      last_name       = 'Lee'
      country         = 'CN'
      create_on       = '20250530'
      delivery_date   = '20250614'
      order_status    = '1' " Numeric: 'PENDING'
      image_url       = 'ORD008' )
    ( client          = sy-mandt
      id              = 'ORD009'
      email           = 'ian.clark@example.com'
      first_name      = 'Ian'
      last_name       = 'Clark'
      country         = 'JP'
      create_on       = '20250607'
      delivery_date   = '20250623'
      order_status    = '2' " Numeric: 'COMPLETED'
      image_url       = 'ORD009' )
    ( client          = sy-mandt
      id              = 'ORD010'
      email           = 'jessica.alba@example.com'
      first_name      = 'Jessica'
      last_name       = 'Alba'
      country         = 'US'
      create_on       = '20250604'
      delivery_date   = '20250620'
      order_status    = '0' " Numeric: 'NEW'
      image_url       = 'ORD010' )
    ( client          = sy-mandt
      id              = 'ORD011'
      email           = 'kevin.hart@example.com'
      first_name      = 'Kevin'
      last_name       = 'Hart'
      country         = 'IE'
      create_on       = '20250601'
      delivery_date   = '20250616'
      order_status    = '1' " Numeric: 'PENDING'
      image_url       = 'ORD011' )
    ( client          = sy-mandt
      id              = 'ORD012'
      email           = 'lara.croft@example.com'
      first_name      = 'Lara'
      last_name       = 'Croft'
      country         = 'EG'
      create_on       = '20250608'
      delivery_date   = '20250624'
      order_status    = '2' " Numeric: 'COMPLETED'
      image_url       = 'ORD012' )
    ( client          = sy-mandt
      id              = 'ORD013'
      email           = 'mike.tyson@example.com'
      first_name      = 'Mike'
      last_name       = 'Tyson'
      country         = 'US'
      create_on       = '20250605'
      delivery_date   = '20250621'
      order_status    = '0' " Numeric: 'NEW'
      image_url       = 'ORD013' )
    ( client          = sy-mandt
      id              = 'ORD014'
      email           = 'nora.allen@example.com'
      first_name      = 'Nora'
      last_name       = 'Allen'
      country         = 'ES'
      create_on       = '20250602'
      delivery_date   = '20250617'
      order_status    = '1' " Numeric: 'PENDING'
      image_url       = 'ORD014' )
    ( client          = sy-mandt
      id              = 'ORD015'
      email           = 'oliver.queen@example.com'
      first_name      = 'Oliver'
      last_name       = 'Queen'
      country         = 'BR'
      create_on       = '20250609'
      delivery_date   = '20250625'
      order_status    = '2' " Numeric: 'COMPLETED'
      image_url       = 'ORD015' )
).

INSERT zheader_7814 FROM TABLE @lt_header.

IF sy-subrc = 0.
  out->write( |Se insertaron { sy-dbcnt } filas en zheader_7814 para el cliente { sy-mandt }.| ).
ELSE.
  out->write( 'Error al insertar en zheader_7814. SY-SUBRC:' ).
  out->write( sy-subrc ).
ENDIF.

DELETE FROM zitems_7814 .

lt_items = VALUE #(
    ( client          = sy-mandt id = 'ORD001' item = 1 name = 'Product A1' description = 'Description for A1' release_date = '20240101' discontinued_date = '00000000' price = '10.50' height = '10.0' width = '5.0' depth = '2.0' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD001' item = 2 name = 'Product A2' description = 'Description for A2' release_date = '20240201' discontinued_date = '00000000' price = '20.75' height = '15.0' width = '8.0' depth = '3.0' quantity = 2
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD001' item = 3 name = 'Service A3' description = 'Description for A3' release_date = '20240301' discontinued_date = '20260101' price = '50.00' height = '0.0' width = '0.0' depth = '0.0' quantity = 1
unit_of_measure = 'HR' )
    ( client          = sy-mandt id = 'ORD002' item = 1 name = 'Product B1' description = 'Description for B1' release_date = '20240401' discontinued_date = '00000000' price = '15.20' height = '12.0' width = '6.0' depth = '2.5' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD002' item = 2 name = 'Product B2' description = 'Description for B2' release_date = '20240501' discontinued_date = '00000000' price = '30.90' height = '18.0' width = '9.0' depth = '3.5' quantity = 3
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD002' item = 3 name = 'License B3' description = 'Description for B3' release_date = '20240601' discontinued_date = '20270101' price = '100.00' height = '0.0' width = '0.0' depth = '0.0' quantity = 1
unit_of_measure = 'YR' )
    ( client          = sy-mandt id = 'ORD003' item = 1 name = 'Product C1' description = 'Description for C1' release_date = '20240701' discontinued_date = '00000000' price = '5.00' height = '5.0' width = '2.0' depth = '1.0' quantity = 5 unit_of_measure
= 'PC' )
    ( client          = sy-mandt id = 'ORD003' item = 2 name = 'Product C2' description = 'Description for C2' release_date = '20240801' discontinued_date = '00000000' price = '12.50' height = '8.0' width = '4.0' depth = '1.5' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD004' item = 1 name = 'Product D1' description = 'Description for D1' release_date = '20240901' discontinued_date = '00000000' price = '25.00' height = '20.0' width = '10.0' depth = '4.0' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD004' item = 2 name = 'Product D2' description = 'Description for D2' release_date = '20241001' discontinued_date = '00000000' price = '35.00' height = '22.0' width = '11.0' depth = '4.5' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD004' item = 3 name = 'Subscription D3' description = 'Description for D3' release_date = '20241101' discontinued_date = '20280101' price = '75.00' height = '0.0' width = '0.0' depth = '0.0' quantity = 1
unit_of_measure = 'MO' )
    ( client          = sy-mandt id = 'ORD005' item = 1 name = 'Product E1' description = 'Description for E1' release_date = '20241201' discontinued_date = '00000000' price = '8.00' height = '7.0' width = '3.0' depth = '1.5' quantity = 4 unit_of_measure
= 'PC' )
    ( client          = sy-mandt id = 'ORD005' item = 2 name = 'Product E2' description = 'Description for E2' release_date = '20250101' discontinued_date = '00000000' price = '18.00' height = '13.0' width = '7.0' depth = '2.5' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD005' item = 3 name = 'Support E3' description = 'Description for E3' release_date = '20250201' discontinued_date = '20270601' price = '60.00' height = '0.0' width = '0.0' depth = '0.0' quantity = 1
unit_of_measure = 'WK' )
    ( client          = sy-mandt id = 'ORD006' item = 1 name = 'Product F1' description = 'Description for F1' release_date = '20250301' discontinued_date = '00000000' price = '30.00' height = '25.0' width = '12.0' depth = '5.0' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD006' item = 2 name = 'Product F2' description = 'Description for F2' release_date = '20250401' discontinued_date = '00000000' price = '40.00' height = '28.0' width = '14.0' depth = '5.5' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD007' item = 1 name = 'Product G1' description = 'Description for G1' release_date = '20250501' discontinued_date = '00000000' price = '11.00' height = '9.0' width = '4.0' depth = '1.8' quantity = 2
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD007' item = 2 name = 'Product G2' description = 'Description for G2' release_date = '20250601' discontinued_date = '00000000' price = '22.00' height = '16.0' width = '8.0' depth = '3.2' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD007' item = 3 name = 'Training G3' description = 'Description for G3' release_date = '20250610' discontinued_date = '20260610' price = '150.00' height = '0.0' width = '0.0' depth = '0.0' quantity = 1
unit_of_measure = 'SES' )
    ( client          = sy-mandt id = 'ORD008' item = 1 name = 'Product H1' description = 'Description for H1' release_date = '20240115' discontinued_date = '00000000' price = '9.50' height = '11.0' width = '5.5' depth = '2.2' quantity = 3
unit_of_measure = 'PC' )
    ( client          = sy-mandt id = 'ORD008' item = 2 name = 'Product H2' description = 'Description for H2' release_date = '20240215' discontinued_date = '00000000' price = '19.50' height = '14.0' width = '7.0' depth = '2.8' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD008' item = 3 name = 'Consulting H3' description = 'Description for H3' release_date = '20240315' discontinued_date = '20251231' price = '200.00' height = '0.0' width = '0.0' depth = '0.0' quantity = 1
unit_of_measure = 'HR' )
    ( client          = sy-mandt id = 'ORD009' item = 1 name = 'Product I1' description = 'Description for I1' release_date = '20240415' discontinued_date = '00000000' price = '7.25' height = '6.0' width = '3.0' depth = '1.2' quantity = 2 unit_of_measure
= 'EA' )
    ( client          = sy-mandt id = 'ORD009' item = 2 name = 'Product I2' description = 'Description for I2' release_date = '20240515' discontinued_date = '00000000' price = '16.00' height = '11.0' width = '5.5' depth = '2.0' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD010' item = 1 name = 'Product J1' description = 'Description for J1' release_date = '20240615' discontinued_date = '00000000' price = '28.00' height = '21.0' width = '10.5' depth = '4.2' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD010' item = 2 name = 'Product J2' description = 'Description for J2' release_date = '20240715' discontinued_date = '00000000' price = '38.00' height = '23.0' width = '11.5' depth = '4.8' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD010' item = 3 name = 'Update J3' description = 'Description for J3' release_date = '20240815' discontinued_date = '20290101' price = '90.00' height = '0.0' width = '0.0' depth = '0.0' quantity = 1 unit_of_measure
= 'YR' )
    ( client          = sy-mandt id = 'ORD011' item = 1 name = 'Product K1' description = 'Description for K1' release_date = '20240915' discontinued_date = '00000000' price = '9.00' height = '8.0' width = '3.5' depth = '1.6' quantity = 2 unit_of_measure
= 'PC' )
    ( client          = sy-mandt id = 'ORD011' item = 2 name = 'Product K2' description = 'Description for K2' release_date = '20241015' discontinued_date = '00000000' price = '19.00' height = '14.0' width = '7.0' depth = '2.8' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD011' item = 3 name = 'Maintenance K3' description = 'Description for K3' release_date = '20241115' discontinued_date = '20261115' price = '70.00' height = '0.0' width = '0.0' depth = '0.0' quantity = 1
unit_of_measure = 'MO' )
    ( client          = sy-mandt id = 'ORD012' item = 1 name = 'Product L1' description = 'Description for L1' release_date = '20241215' discontinued_date = '00000000' price = '32.00' height = '26.0' width = '13.0' depth = '5.2' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD012' item = 2 name = 'Product L2' description = 'Description for L2' release_date = '20250115' discontinued_date = '00000000' price = '42.00' height = '29.0' width = '14.5' depth = '5.8' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD013' item = 1 name = 'Product M1' description = 'Description for M1' release_date = '20250215' discontinued_date = '00000000' price = '13.00' height = '10.0' width = '4.5' depth = '2.0' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD013' item = 2 name = 'Product M2' description = 'Description for M2' release_date = '20250315' discontinued_date = '00000000' price = '24.00' height = '17.0' width = '8.5' depth = '3.4' quantity = 2
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD013' item = 3 name = 'License M3' description = 'Description for M3' release_date = '20250415' discontinued_date = '20280415' price = '110.00' height = '0.0' width = '0.0' depth = '0.0' quantity = 1
unit_of_measure = 'YR' )
    ( client          = sy-mandt id = 'ORD014' item = 1 name = 'Product N1' description = 'Description for N1' release_date = '20250515' discontinued_date = '00000000' price = '10.00' height = '9.0' width = '4.0' depth = '1.8' quantity = 3
unit_of_measure = 'PC' )
    ( client          = sy-mandt id = 'ORD014' item = 2 name = 'Product N2' description = 'Description for N2' release_date = '20250601' discontinued_date = '00000000' price = '21.00' height = '15.0' width = '7.5' depth = '3.0' quantity = 1
unit_of_measure = 'EA' )
    ( client          = sy-mandt id = 'ORD014' item = 3 name = 'Service N3' description = 'Description for N3' release_date = '20250610' discontinued_date = '20260610' price = '75.00' height = '0.0' width = '0.0' depth = '0.0' quantity = 1
unit_of_measure = 'HR' )
    ( client          = sy-mandt id = 'ORD015' item = 1 name = 'Product O1' description = 'Description for O1' release_date = '20240105' discontinued_date = '00000000' price = '6.50' height = '7.0' width = '3.0' depth = '1.4' quantity = 2 unit_of_measure
= 'EA' )
    ( client          = sy-mandt id = 'ORD015' item = 2 name = 'Product O2' description = 'Description for O2' release_date = '20240205' discontinued_date = '00000000' price = '14.50' height = '10.0' width = '5.0' depth = '1.8' quantity = 1
unit_of_measure = 'EA' )
).

INSERT zitems_7814 FROM TABLE @lt_items.

IF sy-subrc = 0.
  out->write( |Se insertaron { sy-dbcnt } filas en zitems_7814 para el cliente { sy-mandt }.| ).
ELSE.
  out->write( 'Error al insertar en zitems_7814. SY-SUBRC:' ).
  out->write( sy-subrc ).
ENDIF.

  ENDMETHOD.

ENDCLASS.

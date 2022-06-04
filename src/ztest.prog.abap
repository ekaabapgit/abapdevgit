
report ztest.
 data value TYPE string.
   data: lnumber TYPE char10,
        f1 type char10.


   START-OF-SELECTION.
   DATA: lenght TYPE i,
        pos(2) TYPE n.

data str1 TYPE char10.
data numbers TYPE char10.
data v_value type string.
v_value = '11,3 adasda'.


str1 = v_value.

PERFORM stripstring using str1 CHANGING numbers .

WRITE numbers.

form stripstring using str1 TYPE char10 CHANGING lv_numbers TYPE char10.

  DATA: lenght TYPE i,
        pos(2) TYPE n.


      lenght = strlen( str1 ).
      CLEAR pos.
      DO lenght TIMES.
        IF NOT str1+pos(1) CO '0123456789.,'.
          CLEAR str1+pos(1).
        ENDIF.
        ADD 1 TO pos.
      ENDDO.

      lv_numbers = str1.
      CONDENSE lv_numbers.

endform.

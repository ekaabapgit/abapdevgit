report ztest1.
data: lv_string TYPE string.
TYPES:
BEGIN OF typ_data,
  line TYPE char20,
END OF typ_data.
DATA it_data TYPE TABLE OF typ_data  .
lv_string = 'IP90000877, IP90000877, EM00003170, EM00003396, EM00003245'.

SPLIT lv_string AT ',' into TABLE it_data.
LOOP AT it_data INTO data(data).
  CONDENSE data.
data(abc) = data.
ENDLOOP.
BREAK-POINT.


report ztest.
TABLES ekpo.
data a TYPE ekpo-ebelp.
data b type c LENGTH 10.

b = '0110'.

SHIFT b LEFT DELETING LEADING '0'.
b = b / 10.


WRITE:/ b.

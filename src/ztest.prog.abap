*&---------------------------------------------------------------------*
*& Report ZTEST_GOOD_MVMT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest.

DATA:ls_bapi_head    TYPE bapi2017_gm_head_01,
     ls_bapi_item    TYPE bapi2017_gm_item_create,
     lt_bapi_item    TYPE TABLE OF bapi2017_gm_item_create,
     lt_table_getall TYPE TABLE OF zmedst_event_details,
     lt_return       TYPE TABLE OF bapiret2.
CONSTANTS:
    lc_04         TYPE BAPI2017_GM_CODE VALUE '04'.

PARAMETERS: p_ebeln TYPE ebeln.


START-OF-SELECTION.

ls_bapi_head-pstng_date = sy-datum.
ls_bapi_head-doc_date = sy-datum.
ls_bapi_head-ref_doc_no = p_ebeln.

ls_bapi_head-header_txt = 'PO EXPIRED'.

*CALL FUNCTION 'ZISHMED_FM_BCODEPKTABLE_GETALL'
*  EXPORTING
*    i_einri               = '9010'
*    i_falnr               = '0180000387'
*  TABLES
*    et_table_getall       = lt_table_getall.
.

*CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
*  EXPORTING
*    input              = lv_matnr
* IMPORTING
*   OUTPUT             = lv_matnr
** EXCEPTIONS
**   LENGTH_ERROR       = 1
**   OTHERS             = 2
*          .
*IF sy-subrc <> 0.
** Implement suitable error handling here
*ENDIF.


ls_bapi_item-material = '000000000000503896'.
ls_bapi_item-plant = '8030'.
ls_bapi_item-stge_loc = 'NA03'.
ls_bapi_item-batch = ' '.
ls_bapi_item-move_type = '101'.
ls_bapi_item-entry_qnt = '1'.
ls_bapi_item-entry_uom = 'PC'.
ls_bapi_item-batch = ' '.
ls_bapi_item-po_number = p_ebeln.
ls_bapi_item-po_item = '00010'.
ls_bapi_item-move_stloc = ''.
ls_bapi_item-NO_MORE_GR = 'X'.
APPEND ls_bapi_item TO lt_bapi_item.



CALL FUNCTION 'BAPI_GOODSMVT_CREATE'
  EXPORTING
    goodsmvt_header = ls_bapi_head
    goodsmvt_code   = lc_04
*   TESTRUN         = ' '
*   GOODSMVT_REF_EWM              =
* IMPORTING
*   GOODSMVT_HEADRET              =
*   MATERIALDOCUMENT              =
*   MATDOCUMENTYEAR =
  TABLES
    goodsmvt_item   = lt_bapi_item
*   GOODSMVT_SERIALNUMBER         =
    return          = lt_return
*   GOODSMVT_SERV_PART_DATA       =
*   EXTENSIONIN     =
  .

CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
* EXPORTING
*   WAIT          =
* IMPORTING
*   RETURN        =
          .

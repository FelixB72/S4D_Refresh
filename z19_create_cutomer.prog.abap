*&---------------------------------------------------------------------*
*& Report z19_create_cutomer
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z19_create_cutomer.

PARAMETERS p_name TYPE z19_name OBLIGATORY.

DATA customer TYPE z19customer.

SELECT SINGLE FROM z19customer FIELDS MAX( customer_id ) AS max_customer_id INTO @DATA(max_customer_id).

customer-client = sy-mandt.
customer-customer_uuid = cl_system_uuid=>create_uuid_x16_static( ).
customer-customer_id = max_customer_id + 1.
customer-name = p_name.
customer-entry_date = sy-datlo.

INSERT z19customer FROM customer.
IF sy-subrc <> 0.
MESSAGE e001(z19_message) WITH customer-customer_uuid.
ENDIF.
MESSAGE s005(z19_message) WITH customer-customer_id.

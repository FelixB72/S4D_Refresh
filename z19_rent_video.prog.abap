*&---------------------------------------------------------------------*
*& Report z19_rent_video
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z19_rent_video.

PARAMETERS p_custid TYPE z19_customer_id OBLIGATORY.
PARAMETERS p_video TYPE z19_video_id OBLIGATORY.

DATA cust_uuid TYPE sysuuid_x16.
DATA video TYPE z19video.

AT SELECTION-SCREEN ON p_custid.
SELECT SINGLE FROM z19customer FIELDS customer_uuid WHERE customer_id = @p_custid  INTO @cust_uuid.
IF sy-subrc <> 0.
MESSAGE e006(z19_message) WITH p_custid.
ENDIF.

AT SELECTION-SCREEN ON p_video.
SELECT SINGLE FROM z19video FIELDS * WHERE video_id =  @p_video and status = 'X' INTO @video.
IF sy-subrc <> 0.
MESSAGE e007(z19_message) WITH p_video.
ENDIF.

START-OF-SELECTION.
SELECT SINGLE FROM z19rental FIELDS MAX( rental_id ) AS max_rental_id INTO @DATA(max_rental_id).
DATA rental TYPE z19rental.

rental-client = sy-mandt.
rental-rental_uuid = cl_system_uuid=>create_uuid_x16_static( ).
rental-rental_id = max_rental_id + 1.
rental-video_uuid = video-video_uuid.
rental-customer_uuid = cust_uuid.
rental-rental_date = sy-datlo.

insert z19rental from rental.
IF sy-subrc <> 0.
MESSAGE e001(z19_message) WITH rental-rental_uuid.
ENDIF.

video-status = ''.

update z19video from video.
IF sy-subrc <> 0.
MESSAGE e009(z19_message) WITH video-video_id.
ENDIF.

MESSAGE s008(z19_message) WITH rental-rental_id.

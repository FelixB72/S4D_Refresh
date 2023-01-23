*&---------------------------------------------------------------------*
*& Report z19_return_video
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z19_return_video.

PARAMETERS p_video TYPE z19_video_id.

DATA rental TYPE z19rental.
DATA video TYPE z19video.

AT SELECTION-SCREEN ON p_video.
SELECT SINGLE FROM z19video
 FIELDS *
 WHERE video_id = @p_video
 INTO @video.
IF sy-subrc <> 0.
 MESSAGE e007(z00video) WITH p_video.
ENDIF.

IF video-status <> ''.
 MESSAGE e007(z19_message) WITH p_video.
ENDIF.

START-OF-SELECTION.
SELECT SINGLE FROM z19rental
 FIELDS *
 WHERE video_uuid = @video-video_uuid
 INTO @rental.

data(rental_days) = sy-datlo - rental-rental_date + 1.

case video-medium.
when 'V'.
rental-rental_fee = '0.5' * rental_days.
when 'D'.
rental-rental_fee =  rental_days.
when others.
rental-rental_fee = 2 * rental_days.
endcase.

rental-return_date = sy-datlo.
rental-currency_code = 'EUR'.

UPDATE z19rental FROM rental.
IF sy-subrc <> 0.
 MESSAGE e011(z19_message) WITH rental-rental_uuid.
ENDIF.

video-status = 'X'.

UPDATE z19video FROM video.
IF sy-subrc <> 0.
 MESSAGE e007(z19_message) WITH video-video_uuid.
ENDIF.

MESSAGE i010(z19_message) WITH rental-rental_fee rental-currency_code.

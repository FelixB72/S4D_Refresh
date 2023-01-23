*&---------------------------------------------------------------------*
*& Report z19_create_video
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z19_create_video.

PARAMETERS p_movie TYPE z19_movie_id OBLIGATORY.
PARAMETERS p_medium TYPE z19_medium OBLIGATORY.

DATA video TYPE z19video.
DATA movie_uuid TYPE sysuuid_x16.


AT SELECTION-SCREEN ON p_movie.
SELECT SINGLE FROM z19movie FIELDS movie_uuid WHERE movie_id = @p_movie INTO @movie_uuid.
IF sy-subrc <> 0.
MESSAGE e004(z19_message) WITH p_movie.
ENDIF.


START-OF-SELECTION.
SELECT SINGLE FROM z19video FIELDS MAX( video_id ) AS max_video_id INTO @DATA(max_video_id).

video-client = sy-mandt.
video-video_uuid = cl_system_uuid=>create_uuid_x16_static( ).
video-video_id = max_video_id + 1.
video-movie_uuid = movie_uuid.
video-medium = p_medium.
video-status = 'X'.

INSERT z19video FROM video.
IF sy-subrc <> 0.
    MESSAGE e001(z19_message) WITH video-video_uuid.
ENDIF.

MESSAGE s003(z19_message) WITH video-video_id.

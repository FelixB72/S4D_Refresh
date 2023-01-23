*&---------------------------------------------------------------------*
*& Report z19_create_movie
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z19_create_movie.


PARAMETERS p_title TYPE z19_title OBLIGATORY.
PARAMETERS p_genre TYPE z19_genre OBLIGATORY.
PARAMETERS p_year TYPE z19_publishing_year OBLIGATORY.
PARAMETERS p_rating TYPE z19_rating OBLIGATORY.

SELECT SINGLE FROM z19movie FIELDS MAX( movie_id ) AS max_movie_id INTO @DATA(max_movie_id).

DATA movie TYPE z19movie.
movie-client = sy-mandt.
movie-genre = p_genre.
movie-movie_uuid = cl_system_uuid=>create_uuid_x16_static( ).
movie-publishing_year = p_year.
movie-rating = p_rating.
movie-title = p_title.
movie-movie_id = max_movie_id + 1.

INSERT z19movie FROM movie.
IF sy-subrc <> 0.
    MESSAGE e001(z19_message) WITH movie-movie_uuid.
ELSE.
    MESsAGE i002(Z19_Message) WITH movie-movie_id.
ENDIF.

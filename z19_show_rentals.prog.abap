*&---------------------------------------------------------------------*
*& Report z19_show_rentals
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z19_show_rentals.

PARAMETERS p_custid type z19_customer_id.
data cust_uuid type sysuuid_x16.

select single from z19customer fields customer_uuid where customer_id = @p_custid into @cust_uuid.

select from z19rental
*inner join z19video on z19rental~video_uuid = z19video~video_uuid
*inner join z19movie on z19video~movie_uuid = z19movie~movie_uuid
fields *
where customer_uuid = @cust_uuid
into table @data(rentals).

*loop at rentals into data(rental).
*write: / rental-z19rental-rental_date, rental-z19rental-rental_fee, rental-z19movie-title.
*endloop.

cl_demo_output=>display( rentals ).

call function 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
*    i_interface_check           = space
*    i_bypassing_buffer          = space
*    i_buffer_active             = space
*    i_callback_program          = space
*    i_callback_pf_status_set    = space
*    i_callback_user_command     = space
*    i_callback_top_of_page      = space
*    i_callback_html_top_of_page = space
*    i_callback_html_end_of_list = space
    i_structure_name            = 'Z19rental'
*    i_background_id             =
*    i_grid_title                =
*    i_grid_settings             =
*    is_layout                   =
*    it_fieldcat                 =
*    it_excluding                =
*    it_special_groups           =
*    it_sort                     =
*    it_filter                   =
*    is_sel_hide                 =
*    i_default                   = 'X'
*    i_save                      = space
*    is_variant                  =
*    it_events                   =
*    it_event_exit               =
*    is_print                    =
*    is_reprep_id                =
*    i_screen_start_column       = 0
*    i_screen_start_line         = 0
*    i_screen_end_column         = 0
*    i_screen_end_line           = 0
*    i_html_height_top           = 0
*    i_html_height_end           = 0
*    it_alv_graphics             =
*    it_hyperlink                =
*    it_add_fieldcat             =
*    it_except_qinfo             =
*    ir_salv_fullscreen_adapter  =
*    o_previous_sral_handler     =
*  IMPORTING
*    e_exit_caused_by_caller     =
*    es_exit_caused_by_user      =
  TABLES
    t_outtab                    = rentals
*  EXCEPTIONS
*    program_error               = 1
*    others                      = 2
  .
IF SY-SUBRC <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*   WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
ENDIF.

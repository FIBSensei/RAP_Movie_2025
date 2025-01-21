CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS validate_genre FOR VALIDATE ON SAVE
      IMPORTING keys FOR movie~validate_genre.

ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD validate_genre.
    " Ausgewählte Filme lesen

*   Alternativer Abruf
*    READ ENTITY IN LOCAL MODE ZI_GUENNI_Movie
*         FIELDS ( Genre )
*         WITH CORRESPONDING #( keys )
*         RESULT DATA(result).

    READ ENTITIES OF ZI_GUENNI_Movie IN LOCAL MODE
         ENTITY Movie
         FIELDS ( Genre )
         WITH CORRESPONDING #( keys )
         RESULT DATA(movies).

    LOOP AT movies INTO DATA(movie).
      " Genre prüfen und ggf. Fehlermeldung erstellen

      " Select Single liefert einen einzigen Datensatz, der die WHERE-Bedingung erfüllt
      SELECT SINGLE
        FROM ddcds_customer_domain_value_t( p_domain_name = 'ZABAP_GENRE' )
        " abap_true wird als Wert geliefert, wenn die WHERE-Bedingung erfüllt wird
        FIELDS @abap_true
        WHERE value_low = @movie-Genre
        INTO @DATA(exists).

      IF exists = abap_false.

        DATA(message) = NEW zcm_guenni_movie( textid   = zcm_guenni_movie=>zcm_guenni_movie
                                              severity = if_abap_behv_message=>severity-error
                                              value    = CONV #( movie-Genre )
                                              field    = 'Genre' ).
        APPEND VALUE #( %tky           = movie-%tky
                        %msg           = message
                        " Zusätzliche Anzeige des Feldes in Grau in der Fehlermeldung
                        %element-Genre = if_abap_behv=>mk-on )
               TO reported-movie.
        APPEND CORRESPONDING #( movie ) TO failed-movie.

      ENDIF.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

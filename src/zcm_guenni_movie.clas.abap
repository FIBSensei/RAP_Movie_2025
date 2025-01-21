CLASS zcm_guenni_movie DEFINITION
  PUBLIC
  INHERITING FROM zcm_abap
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  constants:
    begin of ZCM_GUENNI_MOVIE,
      msgid type symsgid value 'ZGUENNI_MOVIE',
      msgno type symsgno value '000',
      attr1 type scx_attrname value 'VALUE',
      attr2 type scx_attrname value 'FIELD',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of ZCM_GUENNI_MOVIE.

    DATA value TYPE string.
    DATA field TYPE string.

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key
        !severity TYPE if_abap_behv_message=>t_severity
        !previous LIKE previous OPTIONAL
        !value TYPE string OPTIONAL
        !field TYPE string OPTIONAL.
  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcm_guenni_movie IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    " TODO: parameter PREVIOUS is never used (ABAP cleaner)

    super->constructor( textid   = textid
                        severity = severity ).
    me->value = value.
    me->field = field.
  ENDMETHOD.
ENDCLASS.

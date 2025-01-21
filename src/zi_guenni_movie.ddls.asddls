@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie Root View'

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZI_GUENNI_Movie
  as select from ZR_GUENNI_Movie

  association [1..1] to ZI_GUENNI_GenreText     as _GenreText     on $projection.Genre = _GenreText.value_low
  association [0..1] to ZI_GUENNI_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUUID
  composition [0..*] of ZI_GUENNI_Rating as _Ratings

{
  key MovieUuid,

      Title,

      @ObjectModel.text.element: [ 'GenreText' ]
      Genre,

      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      /* Transient Data -> Wird in der Laufzeit berechnet */
      _GenreText.text              as GenreText, // Make association public
      _AverageRating.AverageRating as AverageRating, // Make association public

      case when _AverageRating.AverageRating > 6.6 then 3
           when _AverageRating.AverageRating > 3.3 then 2
           when _AverageRating.AverageRating > 0 then 1
           else 0
           end                     as AverageRatingCriticality,

      /* Associations */
      _Ratings
}

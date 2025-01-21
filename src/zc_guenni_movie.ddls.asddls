@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie Consumption View'

@Metadata.allowExtensions: true

@Search.searchable: true

define root view entity ZC_GUENNI_Movie
  provider contract transactional_query
  as projection on ZI_GUENNI_Movie

{
  key MovieUuid,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,

      //entity -> Value Help View, name -> Name des Value Helpers, element -> Element das eingefügt werden soll
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_GUENNI_GenreVH', element: 'value_low' } }]
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      /* Transient Data -> Wird in der Laufzeit berechnet */
      GenreText,
      AverageRating,
      AverageRatingCriticality,

      /* Associations */
      _Ratings : redirected to composition child ZC_GUENNI_Rating
}

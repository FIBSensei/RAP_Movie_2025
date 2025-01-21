@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Calculates Averge Rating'

define view entity ZI_GUENNI_AverageRating
  as select from zabap_rating_a

{
  key movie_uuid                   as MovieUUID,

      // Wichtig für Anzeige in WebApp
      @EndUserText.label: 'Average Rating'
      @EndUserText.quickInfo: 'Average Rating (1-10)'
      avg(rating as abap.dec(4,1)) as AverageRating
}

group by movie_uuid

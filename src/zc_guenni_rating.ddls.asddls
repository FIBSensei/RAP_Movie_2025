@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Rating Consumption View'

@Metadata.allowExtensions: true

define view entity ZC_GUENNI_Rating
  as projection on ZI_GUENNI_Rating

{
  key RatingUuid,

      MovieUuid,
      UserName,
      Rating,
      RatingDate,

      /* Associations */
      _Movie : redirected to parent ZC_GUENNI_Movie
}

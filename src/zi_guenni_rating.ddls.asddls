@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating Child View Entitty'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_GUENNI_Rating as select from ZR_GUENNI_Rating
association to parent ZI_GUENNI_Movie as _Movie
  on $projection.MovieUuid = _Movie.MovieUuid
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  _Movie // Make association public
}

@AbapCatalog.sqlViewName: 'ZI19MOVIE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic interface View: Movie'
@VDM.viewType: #BASIC
define view ZI_19_Movie as select from z19movie {
    key movie_uuid as MovieUuid,
    movie_id as MovieId,
    title as Title,
    genre as Genre,
    publishing_year as PublishingYear,
    rating as Rating
}

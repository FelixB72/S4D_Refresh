@AbapCatalog.sqlViewName: 'ZC19MOVIEVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help: Movie'
define view ZC_19_MovieVH as select from ZI_19_Movie {
    key MovieUuid,
    MovieId,
    Title,
    Genre,
    PublishingYear,
    Rating
}

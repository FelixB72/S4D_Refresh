@AbapCatalog.sqlViewName: 'ZC19VIDEOTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transactional Consumption View: Video'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
@Metadata.allowExtensions: true
@Search.searchable: true

@ObjectModel: {
transactionalProcessingDelegated: true,

 createEnabled: true,
 updateEnabled: true,
 deleteEnabled: true }
define view ZC_19_VideoTP as select from ZI_19_VideoTP 
association [*] to ZC_19_RentalTP as _Rentals on _Rentals.VideoUuid = ZI_19_VideoTP.VideoUuid 
association [1] to ZC_19_MovieVH as _Movie on _Movie.MovieUuid = ZI_19_VideoTP.MovieUuid{
      key VideoUuid,
      VideoId,
      @Consumption.valueHelp: '_Movie'
      MovieUuid,
      Medium,
      Status,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.6
      Title,
      Genre,
      PublishingYear,
      Rating,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Rentals,
      _Movie
}

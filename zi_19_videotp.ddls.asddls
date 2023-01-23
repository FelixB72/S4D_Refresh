@AbapCatalog.sqlViewName: 'ZI19VIDEOTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transactional Interface View: Video'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel: {
 transactionalProcessingEnabled: true,
 compositionRoot: true,
 writeActivePersistence: 'ZV_19_VIDEO',
 
 createEnabled: true,
 updateEnabled: true,
 deleteEnabled: true}
define view ZI_19_VideoTP as select from ZI_19_Video as Video 
inner join ZI_19_Movie as Movie on Movie.MovieUuid = Video.MovieUuid
association [*] to ZI_19_RentalTP as _Rentals on _Rentals.VideoUuid = Video.VideoUuid{

      key VideoUuid,
      VideoId,
      Video.MovieUuid,
      Medium,
      Status,
      @ObjectModel.readOnly: true
      Movie.Title,
      @ObjectModel.readOnly: true
      Movie.Genre,
      @ObjectModel.readOnly: true
      Movie.PublishingYear,
      @ObjectModel.readOnly: true
      Movie.Rating,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Rentals
    
}

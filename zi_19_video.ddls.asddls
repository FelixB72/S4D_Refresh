@AbapCatalog.sqlViewName: 'ZI19VIDEO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic interface View: Video'
@VDM.viewType: #BASIC
define view ZI_19_Video as select from z19video {
    key video_uuid as VideoUuid,
    video_id as VideoId,
    medium as Medium,
    status as Status,
    movie_uuid as MovieUuid
}

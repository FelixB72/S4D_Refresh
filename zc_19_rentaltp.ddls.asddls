@AbapCatalog.sqlViewName: 'ZC19RENTALTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transactional Consumption View: Rental'
@Metadata.allowExtensions: true
@ObjectModel: {

 createEnabled: true,
 updateEnabled: true}
define view ZC_19_RentalTP as select from ZI_19_RentalTP 
association [1] to ZC_19_VideoTP as _Video on _Video.VideoUuid = ZI_19_RentalTP.VideoUuid {
    key RentalUuid,
    RentalId,
    VideoUuid,
    CustomerUuid,
    RentalDate,
    ReturnDate,
    RentalFee,
    CurrencyCode,
    @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
    _Video
}

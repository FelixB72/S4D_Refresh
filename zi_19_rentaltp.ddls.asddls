@AbapCatalog.sqlViewName: 'ZU19RENTALTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transactional Interface View: Rental'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel: {

 writeActivePersistence: 'ZV_19_RENTAL',
 
 createEnabled: true,
 updateEnabled: true}
 
define view ZI_19_RentalTP as select from ZI_19_Rental 
association [1] to ZI_19_VideoTP as _Video on _Video.VideoUuid = ZI_19_Rental.VideoUuid{
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

@AbapCatalog.sqlViewName: 'ZI19RENTAL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic interface View: Rental'
@VDM.viewType: #BASIC
define view ZI_19_Rental as select from z19rental {
    key rental_uuid as RentalUuid,
    rental_id as RentalId,
    video_uuid as VideoUuid,
    customer_uuid as CustomerUuid,
    rental_date as RentalDate,
    return_date as ReturnDate,
    rental_fee as RentalFee,
    currency_code as CurrencyCode
}

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Reservation Tbale'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Zr_Ram_Reservation
  as select from resb
  association[1..*] to I_ProductText as _Text 
   on $projection.matnr = _Text.Product
                             
{
  key rsnum,
      matnr,
      @Semantics.quantity.unitOfMeasure: 'meins'
      bdmng,
      meins,
      _Text
}

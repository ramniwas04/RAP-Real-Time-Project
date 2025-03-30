@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BAse ProcessOrderDetail'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Zr_Ram_Processorderdetail
  as select from afko as OrderHeader
    inner join   aufk as OrderMaster on  OrderMaster.aufnr = OrderHeader.aufnr
                                     and OrderMaster.autyp = '40'
  association     to Zr_Ram_Reservation_Tf        as _Reservation on  $projection.rsnum = _Reservation.rsnum
  association [1] to I_ProductText                as _Text        on  $projection.plnbez = _Text.Product
                                                                  and _Text.Language     = $session.system_language
  association     to Zr_Ram_Processorderstatus_Tf as _Status      on  $projection.objnr = _Status.objnr
{
  key  OrderHeader.aufnr,
       OrderHeader.gstrs,
       OrderHeader.gltrs,
       OrderHeader.rsnum,
       @Semantics.quantity.unitOfMeasure: 'gmein'
       OrderHeader.gamng,
       OrderHeader.gmein,
       OrderHeader.plnbez,
       OrderHeader.aufpl,
       OrderHeader.aprio,
       OrderHeader.gluzs,
       OrderHeader.gsuzs,
       OrderHeader.cy_seqnr,
       OrderHeader.stlal,
       OrderHeader.klvari,
       OrderMaster.objnr,
       //  OrderMaster.werks ,  ///new
       _Reservation,
       _Text,
       _Status
}

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Process Order Interface view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity Zi_Ram_ProcessOrderDetail
  as select from I_WorkCenter              as WorrkCenterHeader //CRHD
    inner join   afvc                      as Operation   on  WorrkCenterHeader.WorkCenterInternalID = Operation.arbid
                                                          and Operation.phflg                        = '' //MfgOrderOperationIsPhase
    inner join   Zr_Ram_Processorderdetail as OrderHeader on Operation.aufpl = OrderHeader.aufpl
  association to afvv as _OperationSchedule on  $projection.aufpl = _OperationSchedule.aufpl
                                            and $projection.aplzl = _OperationSchedule.aplzl
  //  association to Zr_Ram_Processorderdetail as OrderHeader       on  $projection.aufpl = OrderHeader.aufpl

{
@Consumption.semanticObject: 'ProcessOrder'
  key  OrderHeader.aufnr,
  key  cast(Operation.vornr as zvdm_vornr preserving type ) as vornr,
       WorrkCenterHeader.WorkCenterInternalID, //objid
       WorrkCenterHeader.WorkCenter, //arbpl,
       WorrkCenterHeader.Plant, // werks,
       WorrkCenterHeader.SupplyArea, //prvbe
       Operation.aufpl,
       Operation.aplzl,
       Operation.arbid,
       Operation.objnr,
       //       Operation.phflg,
       Operation.pvzkn,
       _OperationSchedule.fsavd,
       _OperationSchedule.fsavz,


       OrderHeader.gstrs,
       OrderHeader.gltrs,
       OrderHeader.rsnum,
       @Semantics.quantity.unitOfMeasure: 'gmein'
       OrderHeader.gamng,
       OrderHeader.gmein,
       OrderHeader.plnbez,
       //       OrderHeader.aufpl,
       OrderHeader.aprio,
       OrderHeader.gluzs,
       OrderHeader.gsuzs,
       OrderHeader.cy_seqnr,
       OrderHeader.stlal,
       OrderHeader.klvari,
       OrderHeader._Reservation.matnr,
       OrderHeader._Reservation.maktx,
       OrderHeader._Text.ProductName,
       OrderHeader._Status.status,
       OrderHeader._Status.techo_closed,
       OrderHeader._Status.deleted




}

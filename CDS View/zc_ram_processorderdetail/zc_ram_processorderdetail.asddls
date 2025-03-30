@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Process Order'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_Ram_ProcessOrderDetail
  as projection on Zi_Ram_ProcessOrderDetail
{
  key       aufnr,
  key       vornr,
            WorkCenter,
            Plant,
            SupplyArea,
            arbid,
            objnr,
            pvzkn,
            fsavd,
            fsavz,
            gstrs,
            gltrs,
            rsnum,
            gamng,
            gmein,
            plnbez,
            aprio,
            gluzs,
            gsuzs,
            cy_seqnr,
            stlal,
            matnr,
            maktx,
            ProductName,
            status,
            techo_closed,
            @Consumption.filter.defaultValue: ' '
            deleted,
            @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_RAM_READ_TEXT'
  virtual   ltext :abap.string( 1000 ),
            klvari

}

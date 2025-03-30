@EndUserText.label: 'Reservation detail'
define table function Zr_Ram_Reservation_Tf
  //with parameters parameter_name : parameter_type
returns
{
  mandt : abap.clnt;
  rsnum : rsnum;
  matnr : matnr;
  maktx : maktx;

}
implemented by method
  ZCL_RAM_Process_ORDER=>Get_reservation_detail;
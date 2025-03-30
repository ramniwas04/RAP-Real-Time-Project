@EndUserText.label: 'Status of Process Orders'
define table function Zr_Ram_Processorderstatus_Tf
//with parameters parameter_name : parameter_type
returns {
  mandt  : abap.clnt;
  objnr  : j_objnr;
  status : abap.sstring( 650 );
  techo_closed : ztecho_closed_flag;
  deleted      : zdelete_flag;
  
}
implemented by method zcl_ram_process_order=>get_status;
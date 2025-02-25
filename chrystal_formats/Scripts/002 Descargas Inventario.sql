delete from report where code='0002';
insert into report(code,title,menu,report_type,virtualizer) values ('0002','Descargas Inventario ®','0002','F','f');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0002',0,'P_INITIAL_DATE','Date','');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0002',1,'P_FINAL_DATE','Date','');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0002',2,'P_INITIAL_DOCUMENT','String','');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0002',3,'P_FINAL_DOCUMENT','String','zzzzzzzzzzzz');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0002',4,'P_LIST_DOCUMENTS','String','');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0002',5,'P_USER','String','');
insert into report_panel(main_code,title,index_order) values ('0002','Generales',0);

insert into report_filter(main_code,title,index_order,filter_type,filter_configuration,main_panel,show_list) values ('0002','Seleccione el Período',0,'RANGE_DATE','PARAM1=P_INITIAL_DATE
PARAM2=P_FINAL_DATE
INDEX=2',0,'f');
insert into report_filter(main_code,title,index_order,filter_type,filter_configuration,main_panel,show_list) values ('0002','Seleccione el/los Documentos',1,'RANGE_GENERIC_CODE','PARAM1=P_INITIAL_DOCUMENT
PARAM2=P_FINAL_DOCUMENT
PARAM3=P_LIST_DOCUMENTS
DESCRIPTION1=Desde
DESCRIPTION2=Hasta
BROWSE1=020',0,'f');
insert into report_filter(main_code,title,index_order,filter_type,filter_configuration,main_panel,show_list) values ('0002','Seleccione el Usuario',2,'GENERIC_CODE','PARAM1=P_USER
DESCRIPTION=Usuario
BROWSE1=019',0,'f');

insert into report_display_format(main_code,title,format,index_order,visible,title_report,sub_title_report,page_type,page_orientation,is_copy,is_copy_selected) values ('0002','Descargas Inventario (Pagina Completa) ®','REP_FMT_INVENTORY_OPERATION_DOWNLOAD',0,'t','','',0,0,'f','f');
insert into report_display_format(main_code,title,format,index_order,visible,title_report,sub_title_report,page_type,page_orientation,is_copy,is_copy_selected) values ('0002','Descargas  Inventario (Pagina Media)','REP_FMT_INVENTORY_OPERATION_DOWNLOAD2',1,'t','','',0,0,'f','f');







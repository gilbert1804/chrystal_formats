delete from report where code='0015';
insert into report(code,title,menu,report_type,virtualizer) values ('0015','Retenciones Impuesto a Proveedores ®','0005','F','f');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0015',0,'P_INITIAL_DATE','Date','');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0015',1,'P_FINAL_DATE','Date','');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0015',2,'P_INITIAL_DOCUMENT','String','');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0015',3,'P_FINAL_DOCUMENT','String','zzzzzzzzzzzzzzzzzzzz');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0015',4,'P_LIST_DOCUMENTS','String','');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0015',5,'P_INITIAL_PROVIDER','String','');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0015',6,'P_FINAL_PROVIDER','String','zzzzzzzzzzzzzzzzzzzz');
insert into report_parameter(main_code,index_order,code,parameter_type,default_value) values ('0015',7,'P_LIST_PROVIDERS','String','');
insert into report_panel(main_code,title,index_order) values ('0015','Generales',0);
insert into report_panel(main_code,title,index_order) values ('0015','Adicionales',1);

insert into report_filter(main_code,title,index_order,filter_type,filter_configuration,main_panel,show_list) values ('0015','Seleccione el Período de Fechas',0,'RANGE_DATE','PARAM1=P_INITIAL_DATE
PARAM2=P_FINAL_DATE
INDEX=2',0,'f');
insert into report_filter(main_code,title,index_order,filter_type,filter_configuration,main_panel,show_list) values ('0015','Seleccione el/los Documentos',1,'RANGE_GENERIC_CODE','PARAM1=P_INITIAL_DOCUMENT
PARAM2=P_FINAL_DOCUMENT
PARAM3=P_LIST_DOCUMENTS
DESCRIPTION1=Desde
DESCRIPTION2=Hasta
BROWSE1=054',0,'f');
insert into report_filter(main_code,title,index_order,filter_type,filter_configuration,main_panel,show_list) values ('0015','Seleccione el/los Proveedores',2,'RANGE_GENERIC_CODE','PARAM1=P_INITIAL_PROVIDER
PARAM2=P_FINAL_PROVIDER
PARAM3=
DESCRIPTION1=Desde
DESCRIPTION2=Hasta
BROWSE1=045',0,'f');
insert into report_filter(main_code,title,index_order,filter_type,filter_configuration,main_panel,show_list) values ('0015','Seleccione el Usuario',0,'GENERIC_CODE','PARAM1=
DESCRIPTION=Usuario
BROWSE1=018',1,'f');

insert into report_display_format(main_code,title,format,index_order,visible,title_report,sub_title_report,page_type,page_orientation,is_copy,is_copy_selected) values ('0015','Retenciones Impuesto a Proveedores (Pagina Completa) ®','REP_FMT_RETENTION_TAX_PROVIDER',0,'t','','',0,0,'f','f');
insert into report_display_format(main_code,title,format,index_order,visible,title_report,sub_title_report,page_type,page_orientation,is_copy,is_copy_selected) values ('0015','Retenciones Impuesto a Proveedores (Pagina Media) ®','REP_FMT_RETENTION_TAX_PROVIDER2',1,'t','','',0,0,'f','f');
-- Function: zrep_fmt_inventory_operation_details_with_cost(integer)

-- DROP FUNCTION zrep_fmt_inventory_operation_details_with_cost(integer);

CREATE OR REPLACE FUNCTION zrep_fmt_inventory_operation_details_with_cost(IN p_correlative integer, OUT main_correlative integer, OUT line integer, OUT code_product character varying, OUT description_product character varying, OUT referenc character varying, OUT mark character varying, OUT model character varying, OUT amount double precision, OUT store character varying, OUT store_description character varying, OUT locations character varying, OUT locations_description character varying, OUT destination_store character varying, OUT destination_store_description character varying, OUT destination_location character varying, OUT destination_location_description character varying, OUT unit integer, OUT unit_description character varying, OUT conversion_factor double precision, OUT unit_type integer, OUT unitary_cost double precision, OUT buy_tax character varying, OUT aliquot double precision, OUT total_cost double precision, OUT total_tax double precision, OUT total double precision, OUT load_by_adjustment double precision, OUT download_by_adjustment double precision, OUT cost_load double precision, OUT cost_download double precision, OUT coin_code character varying, OUT coin_description character varying, OUT serials character varying, OUT lot_number character varying, OUT expire boolean, OUT expire_date date, OUT elaboration_date date, OUT department_code character varying, OUT department_description character varying)
  RETURNS SETOF record AS
$BODY$declare v_serial character varying;
declare v_line integer;
begin
	for
	  main_correlative,
	  line,
	  code_product,
	  description_product,
	  referenc,
	  mark,
	  model,
	  amount,	 
          store,
          store_description, 
	  locations,
          locations_description,
	  destination_store,
          destination_store_description,          
	  destination_location,
          destination_location_description,
	  unit,
          unit_description,
	  conversion_factor,
	  unit_type,
	  unitary_cost,
	  buy_tax,
	  aliquot,
	  total_cost,
	  total_tax,
	  total,
	  load_by_adjustment,
	  download_by_adjustment,
	  cost_load,
	  cost_download,
	  coin_code,
          coin_description,
          lot_number,
	  expire,
          expire_date,
          elaboration_date,
          department_code,
          department_description	  
	in
	select 
	  a.main_correlative,
	  a.line,
	  a.code_product,
	  a.description_product,
	  a.referenc,
	  a.mark,
	  a.model,
	  a.amount,
	  a.store,
	  s.description,
	  a.locations,
          l.description,          
	  a.destination_store,
          s1.description,         
	  a.destination_location,
          l1.description,
	  a.unit,
          u.description,
	  a.conversion_factor,
	  a.unit_type,
	  a.unitary_cost,
	  a.buy_tax,
	  a.aliquot,
	  a.total_cost,
	  a.total_tax,
	  a.total,
	  a.load_by_adjustment,
	  a.download_by_adjustment,
	  (a.unitary_cost*a.load_by_adjustment) as cost_load,
	  (a.unitary_cost*a.download_by_adjustment) as cost_load,
	  a.coin_code,
          c.description,	
	  sodlots.lot_number,
       	  sodlots.expire,
	  sodlots.expire_date,
	  sodlots.elaboration_date,
	  d.code,
	  d.description
	from inventory_operation_details a
        join products p on (p.code = a.code_product)
	join department d on (d.code = p.department)
	left join inventory_operation_details_lots sodlots on (sodlots.main_correlative = a.main_correlative and sodlots.main_line = a.line)	 
	join products_units pu on(pu.correlative = a.unit )
	join units u on(pu.unit=u.code)
	join store s on (a.store=s.code)
        join locations l on (a.locations=l.code)
        join store s1 on (a.destination_store=s1.code)
        join locations l1 on (a.destination_location=l1.code)
        join coin c on (c.code = a.coin_code)  
	where a.main_correlative = p_correlative order by a.line
	loop
		serials = '';
		v_line = line;

		for
		v_serial
		in
		select 
		serial_no 
		from inventory_operation_details_serials iods 
		where iods.main_line = v_line		 
		loop

			serials = serials || v_serial || chr(13);
				
			
		end loop;

		if(serials <> '')then

			serials = rtrim(serials, chr(13));
			
		end if;

	
		return next;
	end loop;
   
end$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION zrep_fmt_inventory_operation_details_with_cost(integer)
  OWNER TO postgres;

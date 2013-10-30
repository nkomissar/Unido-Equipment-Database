DELIMITER //

DROP PROCEDURE `SEARCH_ENTITIES`
//

CREATE PROCEDURE SEARCH_ENTITIES(
	p_template_code varchar(30)
  , p_filter varchar(2000))
BEGIN
	declare v_count INT;
	declare v_rownum INT;
	declare v_code varchar(30);
	declare v_value varchar(512);
	declare v_min INT;
	declare v_max INT;
	declare v_where varchar(3000);

	set v_count = extractvalue(p_filter, 'count(//property)');
	if v_count > 0 then
		set v_rownum = 1;
		set v_where = '';

		WHILE v_rownum <= v_count DO 
			set v_code = extractvalue(p_filter , '//child::*[$v_rownum]/@code');
			set v_value = extractvalue(p_filter , '//child::*[$v_rownum]/@value');
			set v_min = extractvalue(p_filter , '//child::*[$v_rownum]/@min');
			set v_max = extractvalue(p_filter , '//child::*[$v_rownum]/@max');
		
			IF v_min > v_max THEN
				set v_max = v_min;
			END IF;

			IF v_value != '' THEN
				SET v_where = CONCAT(v_where, '
				   and exists (select uep.ENTITY_PROPERTY_ID 
								 from UNIDO_ENTITY_PROPERTY uep
									, UNIDO_ENTITY_TEMPLATE_PROPERTY uetp
								where uep.ENTITY_ID = ue.ENTITY_ID
								  and uetp.ENTITY_TEMPLATE_ID = ue.ENTITY_TEMPLATE_ID
								  and uep.TEMPLATE_PROPERTY_ID = uetp.TEMPLATE_PROPERTY_ID
								  and uetp.PROPERTY_CODE = ', v_code, ' 
								  and uep.VALUE = \'', v_value,'\') ');
			END IF;

			IF v_min < v_max THEN
				SET v_where = CONCAT(v_where, '
				   and exists (select uep.ENTITY_PROPERTY_ID 
								 from UNIDO_ENTITY_PROPERTY uep
									, UNIDO_ENTITY_TEMPLATE_PROPERTY uetp
								where uep.ENTITY_ID = ue.ENTITY_ID
								  and uetp.ENTITY_TEMPLATE_ID = ue.ENTITY_TEMPLATE_ID
								  and uep.TEMPLATE_PROPERTY_ID = uetp.TEMPLATE_PROPERTY_ID
								  and uetp.PROPERTY_CODE = ', v_code, ' 
								  and CAST(uep.VALUE as DECIMAL) between ', 
								  v_min, ' and ', v_max,') ');
			END IF;
			
		SET v_rownum = v_rownum + 1; 
		END WHILE; 

	end if;

	SET @query = CONCAT('
				select ue.ENTITY_ID
                     , ue.ENTITY_TEMPLATE_ID
                     , ue.ENTITY_NAME
					 , ue.VERSION
                     , ue.STATUS
                     , ue.UPDATED_BY
                     , ue.UPDATE_DATE
					 , uep.ENTITY_PROPERTY_ID
                     , uep.TEMPLATE_PROPERTY_ID
                     , uep.VALUE
				  from UNIDO_ENTITY ue
					 , UNIDO_ENTITY_TEMPLATE uet
					 , UNIDO_ENTITY_PROPERTY uep
					 , UNIDO_ENTITY_TEMPLATE_PROPERTY uept
				 where uet.ENTITY_TEMPLATE_ID = ue.ENTITY_TEMPLATE_ID
				   and uet.TEMPLATE_CODE = \'', p_template_code, '\'
				   and uep.ENTITY_ID = ue.ENTITY_ID
				   and uept.TEMPLATE_PROPERTY_ID = uep.TEMPLATE_PROPERTY_ID
				   and DISPLAY_IN_GRID = 1 ' , v_where);

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END
//

GRANT execute ON PROCEDURE `SEARCH_ENTITIES` TO eetSite
//


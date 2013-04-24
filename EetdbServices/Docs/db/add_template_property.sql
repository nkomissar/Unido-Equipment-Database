delimiter $$

drop procedure if exists `eetdb`.`add_template_property`$$

CREATE procedure `eetdb`.`add_template_property`(
	p_template_id 	integer
  , p_code 			varchar(30) 
  , p_name 			varchar(100)
  , p_type			varchar(45)
  , p_units			varchar(30)
  , p_display		tinyint(1)
  , p_search        tinyint(1)
  , p_mandatory		tinyint(1)
) 
BEGIN
	declare v_id INTEGER;
	declare v_type_id INTEGER;
	declare v_found_id INTEGER;
	declare v_count INTEGER;

	select count(TEMPLATE_PROPERTY_ID), IFNULL(TEMPLATE_PROPERTY_ID,0)
	  into v_count, v_found_id
	  from eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY
     where ENTITY_TEMPLATE_ID = p_template_id
	   and PROPERTY_CODE = p_code;

	select VALUE_TYPE_ID
	  into v_type_id
	  from eetdb.UNIDO_VALUE_TYPE
     where `TYPE` = p_type; 

	if v_count = 0 then
		select IFNULL(max(TEMPLATE_PROPERTY_ID),0)+1
		  into v_id
		  from eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY;

		INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY (
			  TEMPLATE_PROPERTY_ID
			, ENTITY_TEMPLATE_ID
			, PROPERTY_CODE
			, PROPERTY_NAME
			, VERSION
			, VALUE_TYPE_ID
			, UNIT_OF_MEASURE
			, DISPLAY_IN_GRID
			, SEARCHABLE
			, MANDATORY
			, UPDATED_BY
			, UPDATE_DATE) 
		VALUES (
			  v_id
			, p_template_id
			, p_code
			, p_name
			, 0
			, v_type_id
			, p_units
			, p_display
			, p_search
			, p_mandatory
			, 'system'
			, sysdate());
	else
		UPDATE eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY
		   SET PROPERTY_NAME = p_name
			 , VERSION = VERSION + 1
			 , VALUE_TYPE_ID = v_type_id
			 , UNIT_OF_MEASURE = p_units
			 , DISPLAY_IN_GRID = p_display
			 , SEARCHABLE = p_search
			 , MANDATORY = p_mandatory
			 , UPDATE_DATE = sysdate()
		 WHERE TEMPLATE_PROPERTY_ID = v_found_id;
	end if;
END$$
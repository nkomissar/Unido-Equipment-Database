delimiter $$

drop procedure if exists `eetdb`.`add_template_property`$$

CREATE procedure `eetdb`.`add_template_property`(
	p_template_id 	integer
  , p_code 			varchar(30) 
  , p_name 			varchar(100)
  , p_type			varchar(45)
  , p_catalog		varchar(30)
  , p_units			varchar(30)
  , p_display		tinyint(1)
  , p_search        tinyint(1)
  , p_mandatory		tinyint(1)
) 
BEGIN
	declare v_id INTEGER;
	declare v_type_id INTEGER;

	select IFNULL(max(TEMPLATE_PROPERTY_ID),0)+1
	  into v_id
      from eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY;

	select VALUE_TYPE_ID
	  into v_type_id
	  from eetdb.UNIDO_VALUE_TYPE
     where `TYPE` = p_type; 

	INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY (
		  TEMPLATE_PROPERTY_ID
		, ENTITY_TEMPLATE_ID
		, PROPERTY_CODE
		, PROPERTY_NAME
		, VERSION
		, VALUE_TYPE_ID
		, CATALOG_CODE
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
		, p_catalog
		, p_units
		, p_display
		, p_search
		, p_mandatory
		, 'system'
		, sysdate());
END$$
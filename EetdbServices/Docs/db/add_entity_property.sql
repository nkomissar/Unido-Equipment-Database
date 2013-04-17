delimiter $$

drop procedure if exists `eetdb`.`add_entity_property`$$

CREATE procedure `eetdb`.`add_entity_property`(
	p_entity_id 	integer
  , p_code			varchar(30) 
  , p_value			varchar(1024)
  , p_blob			TEXT
) 
BEGIN
	declare v_id INTEGER;
	declare v_template_id INTEGER;
	declare v_template_property_id INTEGER;
	declare v_type_id INTEGER;
	declare v_found_id INTEGER;

	select IFNULL(max(ENTITY_PROPERTY_ID),0)+1
	  into v_id
      from eetdb.UNIDO_ENTITY_PROPERTY;

	select ENTITY_TEMPLATE_ID
	  into v_template_id
	  from eetdb.UNIDO_ENTITY
	 where ENTITY_ID = p_entity_id;

	select TEMPLATE_PROPERTY_ID, VALUE_TYPE_ID
	  into v_template_property_id, v_type_id
	  from eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY
     where PROPERTY_CODE = p_code
	   and ENTITY_TEMPLATE_ID = v_template_id; 

	select entity_property_id
      into v_found_id
	  from eetdb.UNIDO_ENTITY_PROPERTY
     where ENTITY_ID = p_entity_id
       and TEMPLATE_PROPERTY_ID = v_template_property_id;

	if v_found_id IS NULL then
		INSERT INTO eetdb.UNIDO_ENTITY_PROPERTY (
			  ENTITY_PROPERTY_ID
			, ENTITY_ID
			, TEMPLATE_PROPERTY_ID
			, VALUE
			, VALUE_BLOB
			, VERSION
			, UPDATED_BY
			, UPDATE_DATE) 
		VALUES (
			  v_id
			, p_entity_id
			, v_template_property_id
			, p_value
			, p_blob
			, 1
			, 'system'
			, sysdate());
	else
		UPDATE eetdb.UNIDO_ENTITY_PROPERTY uep
		   SET VALUE = p_value
			 , VALUE_BLOB = p_blob
			 , VERSION = uep.VERSION + 1
			 , UPDATE_DATE = sysdate()
		 WHERE ENTITY_PROPERTY_ID = v_found_id;
    end if;
END$$
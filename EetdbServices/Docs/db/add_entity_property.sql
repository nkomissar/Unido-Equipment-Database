delimiter $$

drop procedure if exists `eetdb`.`add_entity_property`$$

CREATE procedure `eetdb`.`add_entity_property`(
	p_entity_id 	integer
  , p_code			varchar(30) 
  , p_value			varchar(1024)
  , p_blob			TEXT
  , p_type			varchar(100)
  , p_name			varchar(100) 
) 
BEGIN
	declare v_id INTEGER;
	declare v_template_id INTEGER;
	declare v_template_property_id INTEGER;
	declare v_type_id INTEGER;
	declare v_found_id INTEGER;
	declare v_blob_id INTEGER;

	select ENTITY_TEMPLATE_ID
	  into v_template_id
	  from eetdb.UNIDO_ENTITY
	 where ENTITY_ID = p_entity_id;

	select TEMPLATE_PROPERTY_ID, VALUE_TYPE_ID
	  into v_template_property_id, v_type_id
	  from eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY
     where PROPERTY_CODE = p_code
	   and ENTITY_TEMPLATE_ID = v_template_id; 

	if p_blob IS NOT NULL then
		select IFNULL(max(BLOB_ID),0)+1
		  into v_blob_id
		  from eetdb.UNIDO_BLOB;

		INSERT INTO eetdb.UNIDO_BLOB (
			BLOB_ID
		  , DATA_TYPE
		  , FILE_NAME
		  , CONTENT
		  , UPDATED_BY
		  , UPDATE_DATE)
		VALUES (
			v_id
		  , p_type
		  , p_name
		  , p_blob
		  , 'system'
		  , sysdate());
	end if;

	select entity_property_id
      into v_found_id
	  from eetdb.UNIDO_ENTITY_PROPERTY
     where ENTITY_ID = p_entity_id
       and TEMPLATE_PROPERTY_ID = v_template_property_id;

	if v_found_id IS NULL then
		select IFNULL(max(ENTITY_PROPERTY_ID),0)+1
		  into v_id
		  from eetdb.UNIDO_ENTITY_PROPERTY;

		INSERT INTO eetdb.UNIDO_ENTITY_PROPERTY (
			  ENTITY_PROPERTY_ID
			, ENTITY_ID
			, TEMPLATE_PROPERTY_ID
			, VALUE
			, VERSION
			, UPDATED_BY
			, UPDATE_DATE) 
		VALUES (
			  v_id
			, p_entity_id
			, v_template_property_id
			, IFNULL(v_blob_id, p_value)
			, 1
			, 'system'
			, sysdate());
	else
		UPDATE eetdb.UNIDO_ENTITY_PROPERTY uep
		   SET VALUE = IFNULL(v_blob_id, p_value)
			 , VERSION = uep.VERSION + 1
			 , UPDATE_DATE = sysdate()
		 WHERE ENTITY_PROPERTY_ID = v_found_id;
    end if;
END$$
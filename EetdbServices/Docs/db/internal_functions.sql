delimiter $$

drop function if exists add_topic$$

CREATE function `eetdb`.`add_topic`(
	p_name varchar(100), 
	p_desc varchar(300)
) RETURNS INTEGER
BEGIN
	declare v_id INTEGER;
	select IFNULL(max(TOPIC_ID),0)+1
	  into v_id
      from eetdb.UNIDO_TOPIC;

	INSERT INTO eetdb.UNIDO_TOPIC (
		  TOPIC_ID
		, TOPIC_NAME
		, DESCRIPTION
		, VERSION
		, UPDATED_BY
		, UPDATE_DATE) 
	VALUES (
		  v_id
		, p_name
		, p_desc
		, 0
		, 'system'
		, sysdate());
 
	RETURN v_id;
END$$

drop procedure if exists `eetdb`.`link_topics`$$

CREATE PROCEDURE `eetdb`.`link_topics`(
	p_parent_id 	integer
  , p_linked_id     integer
)
BEGIN
	INSERT INTO eetdb.UNIDO_TOPIC_LINK (
		  LINKED_TOPIC_ID
		, PARENT_TOPIC_ID) 
	VALUES (
		  p_linked_id
		, p_parent_id);
END$$

drop function if exists add_middle_topic$$

CREATE function `eetdb`.`add_middle_topic`(
	p_parent_id INTEGER
  , p_name varchar(100)
  , p_desc varchar(300)
) returns INTEGER
BEGIN
	declare v_id INTEGER;
	set v_id = add_topic(p_name, p_desc);
	call link_topics(p_parent_id, v_id);
	return v_id;
END$$

drop procedure if exists `eetdb`.`add_child_topic`$$

CREATE procedure `eetdb`.`add_child_topic`(
	p_parent_id INTEGER
  , p_name varchar(100)
  , p_desc varchar(300)
)
BEGIN
	declare v_id INTEGER;
	set v_id = add_topic(p_name, p_desc);
	call link_topics(p_parent_id, v_id);
END$$

drop function if exists `eetdb`.`add_template`$$

CREATE function `eetdb`.`add_template`(
	p_code varchar(30), 
	p_name varchar(45)) 
RETURNS INTEGER
BEGIN
	declare v_id INTEGER;
	declare v_found_id INTEGER;
	declare v_count INTEGER;

	select count(ENTITY_TEMPLATE_ID), ifnull(ENTITY_TEMPLATE_ID,0)
	  into v_count, v_found_id
	  from eetdb.UNIDO_ENTITY_TEMPLATE
	 where upper(TEMPLATE_CODE) = upper(p_code);

	if v_count = 0 then
		select IFNULL(max(ENTITY_TEMPLATE_ID),0)+1
		  into v_id
		  from eetdb.UNIDO_ENTITY_TEMPLATE;

		INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE (
			  ENTITY_TEMPLATE_ID
			, TEMPLATE_CODE
			, TEMPLATE_NAME
			, VERSION
			, UPDATED_BY
			, UPDATE_DATE) 
		VALUES (
			  v_id
			, p_code
			, p_name
			, 0
			, 'system'
			, sysdate());

		RETURN v_id;
	else
		UPDATE eetdb.UNIDO_ENTITY_TEMPLATE
		   SET TEMPLATE_NAME = p_name
			 , VERSION = VERSION + 1
			 , UPDATE_DATE = sysdate()
		 WHERE ENTITY_TEMPLATE_ID = v_found_id;

		RETURN v_found_id;
	end if;
END$$

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

drop function if exists add_entity $$

CREATE function `eetdb`.`add_entity`(
	p_template  varchar(30)
  , p_name      varchar(300)
) RETURNS INTEGER
BEGIN
	declare v_id INTEGER;
	declare v_template_id INTEGER;
	declare v_found_id INTEGER;
	declare v_count INTEGER;

	select ENTITY_TEMPLATE_ID
	  into v_template_id
	  from eetdb.UNIDO_ENTITY_TEMPLATE
	 where UPPER(TEMPLATE_CODE) = UPPER(p_template);

	select count(entity_id), IFNULL(entity_id, 0)
	  into v_count, v_found_id
	  from eetdb.UNIDO_ENTITY
	 where ENTITY_TEMPLATE_ID = v_template_id
	   and UPPER(ENTITY_NAME) = UPPER(p_name);

	if v_count = 0 then
		select IFNULL(max(ENTITY_ID),0)+1
		  into v_id
		  from eetdb.UNIDO_ENTITY;

		INSERT INTO eetdb.UNIDO_ENTITY (
			  ENTITY_ID
			, ENTITY_TEMPLATE_ID
			, ENTITY_NAME
			, VERSION
			, UPDATED_BY
			, UPDATE_DATE) 
		VALUES (
			  v_id
			, v_template_id
			, p_name
			, 1
			, 'system'
			, sysdate());
		
		RETURN v_id;
	else
		UPDATE eetdb.UNIDO_ENTITY
		   SET VERSION = VERSION + 1
			 , UPDATE_DATE = sysdate()
		 WHERE ENTITY_ID = v_found_id;

		RETURN v_found_id;
	end if;
END$$

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
	declare v_count INTEGER;

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

	select count(entity_property_id), ifnull(entity_property_id, 0)
      into v_count, v_found_id
	  from eetdb.UNIDO_ENTITY_PROPERTY
     where ENTITY_ID = p_entity_id
       and TEMPLATE_PROPERTY_ID = v_template_property_id;

	if v_count = 0 then
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

drop procedure if exists `eetdb`.`link_entity`$$

CREATE procedure `eetdb`.`link_entity`(
	  p_id            integer
  , p_topic     	varchar(100)
) 
BEGIN
	declare v_topic_id INTEGER;
	declare v_count INTEGER;

	select TOPIC_ID
	  into v_topic_id
	  from eetdb.UNIDO_TOPIC
	 where UPPER(TOPIC_NAME) = UPPER(p_topic);

	select count(*)
	  into v_count
	  from eetdb.UNIDO_ENTITY_REFERENCE
	 where TOPIC_ID = v_topic_id and ENTITY_ID = p_id;

	if v_count = 0 then
		INSERT INTO eetdb.UNIDO_ENTITY_REFERENCE (
			  TOPIC_ID
			, ENTITY_ID) 
		VALUES (
			  v_topic_id
			, p_id);
	end if;

END$$

drop procedure if exists `eetdb`.`link_entities`$$

CREATE procedure `eetdb`.`link_entities`(
	p_entity_id     integer
  , p_parent_name  	varchar(300)
) 
BEGIN
	declare v_parent_id INTEGER;
	select ENTITY_ID
	  into v_parent_id
	  from eetdb.UNIDO_ENTITY
	 where UPPER(ENTITY_NAME) = UPPER(p_parent_name);

	INSERT INTO eetdb.UNIDO_ENTITY_LINK (
		  LINKED_ENTITY_ID
		, PARENT_ENTITY_ID) 
	VALUES (
		  p_entity_id
		, v_parent_id);
END$$

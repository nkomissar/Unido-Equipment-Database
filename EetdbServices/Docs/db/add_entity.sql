delimiter $$

drop function if exists add_entity $$

CREATE function `eetdb`.`add_entity`(
	p_template  varchar(30)
  , p_name      varchar(300)
) RETURNS INTEGER
BEGIN
	declare v_id INTEGER;
	declare v_template_id INTEGER;
	declare v_found_id INTEGER;

	select IFNULL(max(ENTITY_ID),0)+1
	  into v_id
      from eetdb.UNIDO_ENTITY;

	select ENTITY_TEMPLATE_ID
	  into v_template_id
	  from eetdb.UNIDO_ENTITY_TEMPLATE
	 where UPPER(TEMPLATE_CODE) = UPPER(p_template);

	select IFNULL(entity_id, 0)
	  into v_found_id
	  from eetdb.UNIDO_ENTITY
	 where ENTITY_TEMPLATE_ID = v_template_id
	   and UPPER(ENTITY_NAME) = UPPER(p_name);

	if v_found_id = 0 then
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
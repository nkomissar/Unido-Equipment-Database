delimiter $$

drop function if exists `eetdb`.`add_template`$$

CREATE function `eetdb`.`add_template`(
	p_code varchar(30), 
	p_name varchar(45),
	p_is_reference tinyint(1)) 
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
			, IS_REFERENCE
			, VERSION
			, UPDATED_BY
			, UPDATE_DATE) 
		VALUES (
			  v_id
			, p_code
			, p_name
			, p_is_reference
			, 0
			, 'system'
			, sysdate());

		RETURN v_id;
	else
		UPDATE eetdb.UNIDO_ENTITY_TEMPLATE
		   SET TEMPLATE_NAME = p_name
		     , IS_REFERENCE = p_is_reference
			 , VERSION = VERSION + 1
			 , UPDATE_DATE = sysdate()
		 WHERE ENTITY_TEMPLATE_ID = v_found_id;

		RETURN v_found_id;
	end if;
END$$


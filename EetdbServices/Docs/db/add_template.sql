delimiter $$

drop function if exists add_template$$

CREATE function `eetdb`.`add_template`(
	p_code varchar(30), 
	p_name varchar(45)) 
RETURNS INTEGER
BEGIN
	declare v_id INTEGER;
	select IFNULL(max(ENTITY_TEMPLATE_ID),0)+1
	  into v_id
      from eetdb.UNIDO_ENTITY_TEMPLATE;

	INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE (
		  ENTITY_TEMPLATE_ID
		, TEMPLATE_CODE
		, TEMPLATE_NAME
		, UPDATED_BY
		, UPDATE_DATE) 
	VALUES (
		  v_id
		, p_code
		, p_name
		, 'system'
		, sysdate());
 
	RETURN v_id;
END$$


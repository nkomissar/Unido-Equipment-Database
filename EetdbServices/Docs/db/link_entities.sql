delimiter $$

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
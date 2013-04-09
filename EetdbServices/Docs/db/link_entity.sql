delimiter $$

drop procedure if exists `eetdb`.`link_entity`$$

CREATE procedure `eetdb`.`link_entity`(
	p_id            integer
  , p_topic     	varchar(100)
) 
BEGIN
	declare v_topic_id INTEGER;
	select TOPIC_ID
	  into v_topic_id
	  from eetdb.UNIDO_TOPIC
	 where UPPER(TOPIC_NAME) = UPPER(p_topic);

	INSERT INTO eetdb.UNIDO_ENTITY_REFERENCE (
		  TOPIC_ID
		, ENTITY_ID) 
	VALUES (
		  v_topic_id
		, p_id);
END$$
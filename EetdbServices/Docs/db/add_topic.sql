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
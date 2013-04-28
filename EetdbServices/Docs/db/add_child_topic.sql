delimiter $$

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
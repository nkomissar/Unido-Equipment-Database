delimiter $$

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
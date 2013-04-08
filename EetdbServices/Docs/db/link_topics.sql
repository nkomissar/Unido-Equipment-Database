delimiter $$

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


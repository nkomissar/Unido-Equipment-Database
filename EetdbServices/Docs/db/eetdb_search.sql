DELIMITER //

DROP PROCEDURE `SEARCH_TOPIC`
//

DROP PROCEDURE `SEARCH`
//

CREATE PROCEDURE SEARCH_TOPIC(P_TEXT varchar(200))
BEGIN
	declare v_text VARCHAR(200);
	set v_text = format_search_string(p_text);

	SELECT *
		 , MATCH (TOPIC_NAME, DESCRIPTION) AGAINST (v_text IN BOOLEAN MODE) as REL
	FROM `UNIDO_TOPIC`
	WHERE MATCH (TOPIC_NAME, DESCRIPTION) AGAINST (v_text IN BOOLEAN MODE) > 0
	ORDER BY REL DESC;
END//

CREATE PROCEDURE SEARCH(P_TEXT varchar(200))
BEGIN
	declare v_text VARCHAR(200);
	set v_text = format_search_string(p_text);

	SELECT e.entity_id
		 , e.entity_name
         , (SELECT `value` 
              FROM UNIDO_ENTITY_PROPERTY 
		     WHERE ENTITY_ID = e.ENTITY_ID
			   AND TEMPLATE_PROPERTY_ID = 
				   (SELECT TEMPLATE_PROPERTY_ID
                      FROM UNIDO_ENTITY_TEMPLATE_PROPERTY
                     WHERE PROPERTY_CODE = 'DESCRIPTION'
                       AND ENTITY_TEMPLATE_ID = e.ENTITY_TEMPLATE_ID)) as description
		 , MATCH (e.entity_name) AGAINST (v_text IN BOOLEAN MODE) as REL
	FROM UNIDO_ENTITY e
	WHERE MATCH (e.entity_name) AGAINST (v_text IN BOOLEAN MODE) > 0
       OR e.entity_id in (SELECT `entity_id`
                          FROM UNIDO_ENTITY_PROPERTY
						 WHERE MATCH (`value`) AGAINST (v_text IN BOOLEAN MODE) > 0)
	ORDER BY REL DESC;
END//

GRANT execute ON PROCEDURE `SEARCH_TOPIC` TO eetSite
//

GRANT execute ON PROCEDURE `SEARCH` TO eetSite
//


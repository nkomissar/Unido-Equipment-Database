DELIMITER //

DROP PROCEDURE `SEARCH_TOPIC`
//

DROP PROCEDURE `SEARCH`
//

CREATE PROCEDURE SEARCH_TOPIC(P_TEXT varchar(200))
BEGIN
	declare v_text VARCHAR(200);
	set v_text = format_search_string(p_text);

	SELECT ut.*
		 , MATCH (uts.TOPIC_NAME, uts.DESCRIPTION) AGAINST (v_text IN BOOLEAN MODE) > 0 as REL
	  FROM `UNIDO_TOPIC` ut
         , `UNIDO_TOPIC_SEARCH` uts
	 WHERE ut.UNIDO_TOPIC_ID = uts.UNIDO_TOPIC_ID
	   AND MATCH (uts.TOPIC_NAME, uts.DESCRIPTION) AGAINST (v_text IN BOOLEAN MODE) > 0
	ORDER BY REL DESC;
END//

CREATE PROCEDURE SEARCH(P_TEXT varchar(200))
BEGIN
	declare v_text VARCHAR(200);
	set v_text = format_search_string(p_text);

	SELECT ue.*
		 , MATCH (ues.ENTITY_NAME, ues.DESCRIPTION) AGAINST (v_text IN BOOLEAN MODE) as REL
		 , MATCH (ues.VENDOR_CODE) AGAINST (v_text IN BOOLEAN MODE) REL_CODE
	  FROM `UNIDO_ENTITY` ue
         , `UNIDO_ENTITY_SEARCH` ues
	 WHERE (MATCH (ues.ENTITY_NAME, ues.DESCRIPTION) AGAINST (v_text IN BOOLEAN MODE) > 0
        OR MATCH (ues.VENDOR_CODE) AGAINST (v_text IN BOOLEAN MODE) > 0)
       AND ue.ENTITY_ID = ues.ENTITY_ID
	   AND ue.`STATUS` <> 'PENDING'
	 ORDER BY REL_CODE, REL DESC;
END//

GRANT execute ON PROCEDURE `SEARCH_TOPIC` TO eetSite
//

GRANT execute ON PROCEDURE `SEARCH` TO eetSite
//


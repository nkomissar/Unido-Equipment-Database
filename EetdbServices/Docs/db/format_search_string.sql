delimiter $$

CREATE FUNCTION `eetdb`.`format_search_string`(P_TEXT varchar(200)) 
RETURNS varchar(200)
BEGIN
	return CONCAT(
					TRIM(
						REPLACE(
							REPLACE(
								REPLACE(p_text
									, ','
									, ' '
								)
							  , '  '
							  , ' '
							)
						  , ' '
						  , '* '
						)
					)
				  , '*');
END$$


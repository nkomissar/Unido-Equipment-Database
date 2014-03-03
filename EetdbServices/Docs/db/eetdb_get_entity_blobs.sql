DELIMITER //

DROP PROCEDURE IF EXISTS `eetdb`.`GET_ENTITY_BLOBS`
//

CREATE PROCEDURE GET_ENTITY_BLOBS(  
    p_entity_id     integer
)
BEGIN
DECLARE done INT DEFAULT FALSE; 
DECLARE csvIds varchar(1024);
declare foundPos tinyint unsigned; 
declare tmpTxt text; 
declare delimLen tinyint unsigned; 
declare element text;
DECLARE delim varchar(10);
DECLARE cur1 CURSOR FOR 
            select
                prop.VALUE 
            from
                UNIDO_ENTITY entity
            inner join
                UNIDO_ENTITY_PROPERTY prop 
                    on entity.ENTITY_ID=prop.ENTITY_ID 
            inner join
                UNIDO_ENTITY_TEMPLATE_PROPERTY template2prop
                    on prop.TEMPLATE_PROPERTY_ID=template2prop.TEMPLATE_PROPERTY_ID 
            inner join
                UNIDO_VALUE_TYPE valType 
                    on template2prop.VALUE_TYPE_ID=valType.VALUE_TYPE_ID 
            inner join
                UNIDO_ENTITY_TEMPLATE template2entity 
                    on entity.ENTITY_TEMPLATE_ID=template2entity.ENTITY_TEMPLATE_ID 
            where
                (
                    valType.type in (
                        'FILE' , 'IMG'
                    )
                ) 
                and entity.ENTITY_ID= p_entity_id;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    drop temporary table if exists tmpValues; 
    create temporary table tmpValues 
    ( 
        `values` varchar(1024) not null default '' 
    ) engine = memory; 

    OPEN cur1;
    
    set delim = ',';
    
    read_loop: LOOP
        FETCH cur1 INTO csvIds;
        IF done THEN
          LEAVE read_loop;
        END IF;
        
        set delimLen = length(delim); 
        set tmpTxt = csvIds; 
        
        set foundPos = instr(tmpTxt,delim); 
        while foundPos <> 0 do 
            set element = substring(tmpTxt, 1, foundPos-1); 
            set tmpTxt = replace(tmpTxt, concat(element,delim), ''); 
            
            
            insert into tmpValues (`values`) values ( element); 
            
            set foundPos = instr(tmpTxt,delim); 
        end while; 
        
        if tmpTxt <> '' then 
            insert into tmpValues (`values`) values (tmpTxt); 
        end if; 

    END LOOP;   
    
    select BLOB_ID, DATA_TYPE, FILE_NAME, VERSION, UPDATED_BY, UPDATE_DATE 
        from UNIDO_BLOB 
        where BLOB_ID IN 
			(
				select CAST(`values` AS UNSIGNED) from tmpValues
			); 
    
END//

GRANT execute ON PROCEDURE `GET_ENTITY_BLOBS` TO eetSite //

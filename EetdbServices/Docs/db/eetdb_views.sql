<<<<<<< HEAD
-- -----------------------------------------------------
-- View `eetdb`.`V_ROOT_TOPIC`
-- -----------------------------------------------------

CREATE OR REPLACE VIEW V_ROOT_TOPIC AS
  SELECT *
    FROM UNIDO_TOPIC ut
   WHERE not exists (SELECT 1 
                       FROM UNIDO_TOPIC_LINK utl
                      WHERE utl.LINKED_TOPIC_ID = ut.TOPIC_ID);
=======
-- -----------------------------------------------------
-- View `eetdb`.`V_ROOT_TOPIC`
-- -----------------------------------------------------

CREATE OR REPLACE VIEW V_ROOT_TOPIC AS
  SELECT *
    FROM UNIDO_TOPIC ut
   WHERE not exists (SELECT 1 
                       FROM UNIDO_TOPIC_LINK utl
                      WHERE utl.LINKED_TOPIC_ID = ut.TOPIC_ID);
>>>>>>> search

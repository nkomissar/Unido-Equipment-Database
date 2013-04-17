-- -------------------------------------------------------------------
-- Delete all data
-- -------------------------------------------------------------------
DELETE FROM UNIDO_ENTITY_PROPERTY;
DELETE FROM UNIDO_ENTITY_REFERENCE;
DELETE FROM UNIDO_ENTITY;
DELETE FROM UNIDO_TOPIC_LINK;
DELETE FROM UNIDO_TOPIC;
DELETE FROM UNIDO_ENTITY_TEMPLATE_PROPERTY;
DELETE FROM UNIDO_ENTITY_TEMPLATE;
DELETE FROM UNIDO_VALUE_TYPE;

-- -------------------------------------------------------------------
-- fill VALUE_TYPE
-- -------------------------------------------------------------------
INSERT INTO eetdb.UNIDO_VALUE_TYPE
(VALUE_TYPE_ID, FORMAT, TYPE, UPDATED_BY, UPDATE_DATE) 
VALUES (1, 'TXT', 'STRING', 'system', sysdate());

INSERT INTO eetdb.UNIDO_VALUE_TYPE
(VALUE_TYPE_ID, FORMAT, TYPE, UPDATED_BY, UPDATE_DATE) 
VALUES (2, 'HTML', 'TEXT', 'system', sysdate());

INSERT INTO eetdb.UNIDO_VALUE_TYPE
(VALUE_TYPE_ID, FORMAT, TYPE, UPDATED_BY, UPDATE_DATE) 
VALUES (3, '2', 'NUMBER', 'system', sysdate());

INSERT INTO eetdb.UNIDO_VALUE_TYPE
(VALUE_TYPE_ID, FORMAT, TYPE, UPDATED_BY, UPDATE_DATE) 
VALUES (4, '', 'INTEGER', 'system', sysdate());

INSERT INTO eetdb.UNIDO_VALUE_TYPE
(VALUE_TYPE_ID, FORMAT, TYPE, UPDATED_BY, UPDATE_DATE) 
VALUES (5, '', 'BOOLEAN', 'system', sysdate());

INSERT INTO eetdb.UNIDO_VALUE_TYPE
(VALUE_TYPE_ID, FORMAT, TYPE, UPDATED_BY, UPDATE_DATE) 
VALUES (6, 'URL', 'URL', 'system', sysdate());

INSERT INTO eetdb.UNIDO_VALUE_TYPE
(VALUE_TYPE_ID, FORMAT, TYPE, UPDATED_BY, UPDATE_DATE) 
VALUES (7, 'ENTITY_ID', 'REFERENCE', 'system', sysdate());
 
INSERT INTO eetdb.UNIDO_VALUE_TYPE
(VALUE_TYPE_ID, FORMAT, TYPE, UPDATED_BY, UPDATE_DATE) 
VALUES (8, 'BINARY', 'FILE', 'system', sysdate());

INSERT INTO eetdb.UNIDO_VALUE_TYPE
(VALUE_TYPE_ID, FORMAT, TYPE, UPDATED_BY, UPDATE_DATE) 
VALUES (9, 'BINARY', 'IMG', 'system', sysdate());

-- -------------------------------------------------------------------
-- fill TOPIC
-- -------------------------------------------------------------------
set @top_id = add_topic('Энергосберегающие технологии', 'Примеры и описания энергосберегающих технологий');

set @top_id = add_topic('Оборудование', 'Оборудование');

set @last_id = add_middle_topic(@top_id, 'Оборудование для производства тепла', 'Оборудование для производства тепла');
call add_child_topic(@last_id, 'Жидкотопливные и газовые горелки', 'Жидкотопливные и газовые горелки');
call add_child_topic(@last_id, 'Блочные котельные', 'Блочные котельные');
call add_child_topic(@last_id, 'Жидкотопливные и газовые котлы', 'Жидкотопливные и газовые котлы');
call add_child_topic(@last_id, 'Котлы на биомассе', 'Котлы на биомассе');
call add_child_topic(@last_id, 'Тепловые насосы', 'Тепловые насосы');
call add_child_topic(@last_id, 'Солнечные водонагреватели', 'Солнечные водонагреватели');
call add_child_topic(@last_id, 'Инфракрасные газовые нагреватели', 'Инфракрасные газовые нагреватели');

set @last_id = add_middle_topic(@top_id, 'Оборудование для производства электроэнергии', 'Оборудование для производства электроэнергии');
call add_child_topic(@last_id, 'Мини-когенерационные установки', 'Мини-когенерационные установки');
call add_child_topic(@last_id, 'Фотоэлектрические системы', 'Фотоэлектрические системы');
call add_child_topic(@last_id, 'Микро ВЭУ', 'Микро ВЭУ');
call add_child_topic(@last_id, 'Микро ГЭС', 'Микро ГЭС');

set @last_id = add_middle_topic(@top_id, 'Системы контроля', 'Системы контроля');

set @last_id = add_middle_topic(@top_id, 'Оборудование для распределения тепла и холода', 'Оборудование для распределения тепла и холода');
call add_child_topic(@last_id, 'Предизолированные трубы', 'Предизолированные трубы');

set @last_id = add_middle_topic(@top_id, 'Электрооборудование', 'Электрооборудование');
call add_child_topic(@last_id, 'Трансформаторы', 'Трансформаторы');
call add_child_topic(@last_id, 'Компенсаторы реактивной мощности', 'Компенсаторы реактивной мощности');

set @last_id = add_middle_topic(@top_id, 'Оборудование для регенерации тепла', 'Оборудование для регенерации тепла');
call add_child_topic(@last_id, 'Теплообменники', 'Теплообменники');

set @last_id = add_middle_topic(@top_id, 'Системы сжатого воздуха', 'Системы сжатого воздуха');
call add_child_topic(@last_id, 'Компрессоры', 'Компрессоры');
call add_child_topic(@last_id, 'Резервуар сжатого воздуха', 'Резервуар сжатого воздуха');
call add_child_topic(@last_id, 'Осушители сжатого воздуха', 'Осушители сжатого воздуха');

set @last_id = add_middle_topic(@top_id, 'Системы электродвигателей', 'Системы электродвигателей');
call add_child_topic(@last_id, 'Двигатели до 375 кВт', 'Двигатели до 375 кВт');
call add_child_topic(@last_id, 'Двигатели > 375 кВт', 'Двигатели > 375 кВт');
call add_child_topic(@last_id, 'Частотные преобразователи электроприводов', 'Частотные преобразователи электроприводов');

set @last_id = add_middle_topic(@top_id, 'Насосные и вентиляционные системы', 'Насосные и вентиляционные системы');
call add_child_topic(@last_id, 'Насос + двигатель + встроенный частотный преобразователь', 'Насос + двигатель + встроенный частотный преобразователь');
call add_child_topic(@last_id, 'Вентилятор + двигатель + встроенный частотный преобразователь', 'Вентилятор + двигатель + встроенный частотный преобразователь');

set @last_id = add_middle_topic(@top_id, 'Системы охлаждения', 'Системы охлаждения');
call add_child_topic(@last_id, 'Чиллеры для холодильных камер', 'Чиллеры для холодильных камер');

set @last_id = add_middle_topic(@top_id, 'Системы отопления, вентиляции и кондиционирования воздуха в зданиях', 'Системы отопления, вентиляции и кондиционирования воздуха в зданиях');

set @last_id = add_middle_topic(@top_id, 'Тепло- и энергосберегающее оборудование и материалы в зданиях', 'Тепло- и энергосберегающее оборудование и материалы в зданиях');
call add_child_topic(@last_id, 'Окна и остекление', 'Окна и остекление');
call add_child_topic(@last_id, 'Изоляция зданий', 'Изоляция зданий');
call add_child_topic(@last_id, 'Высокоскоростные ворота', 'Высокоскоростные ворота');

set @last_id = add_middle_topic(@top_id, 'Системы освещения', 'Системы освещения');
call add_child_topic(@last_id, 'Лампы', 'Лампы');

set @last_id = add_middle_topic(@top_id, 'Системы энергомониторинга', 'Системы мониторинга данных по энергопотреблению');
set @last_id = add_middle_topic(@top_id, 'Маркированное электрооборудование', 'Маркированное электрооборудование');
set @last_id = add_middle_topic(@top_id, 'Маркированное офисное электрооборудование', 'Маркированное офисное электрооборудование');

set @last_id = add_middle_topic(@top_id, 'Сельскохозяйственное оборудование', 'Сельскохозяйственное оборудование');
call add_child_topic(@last_id, 'Зерносушилки', 'Зерносушилки');
call add_child_topic(@last_id, 'СХ Техника с GPS', 'СХ Техника с GPS');

set @top_id = add_topic('Жизненный цикл', 'Жизненный цикл');
set @last_id = add_middle_topic(@top_id, 'Призводство', 'Призводство');
set @last_id = add_middle_topic(@top_id, 'Транспортировка', 'Транспортировка');
call add_child_topic(@last_id, 'Передача тепла', 'Передача тепла');
set @last_id = add_middle_topic(@top_id, 'Потребление', 'Потребление');
call add_child_topic(@last_id, 'Потребление тепла', 'Потребление тепла');
set @last_id = add_middle_topic(@top_id, 'Водозабор', 'Водозабор');

set @top_id = add_topic('Экономия ресурсов', 'Экономия ресурсов');
call add_child_topic(@top_id, 'Экономия тепловой энергии', 'Экономия тепловой энергии');
call add_child_topic(@top_id, 'Экономия электрической энергии', 'Экономия электрической энергии');
call add_child_topic(@top_id, 'Экономия воды', 'Экономия воды');
call add_child_topic(@top_id, 'Экономия топлива', 'Экономия топлива');
call add_child_topic(@top_id, 'Уменьшение выброса CO2', 'Уменьшение выброса CO2');

set @top_id = add_topic('Область использования', 'Область использования');
set @last_id = add_middle_topic(@top_id, 'Промышленный сектор', 'Промышленный сектор');
set @last_id = add_middle_topic(@top_id, 'Здания', 'Здания');
set @last_id = add_middle_topic(@top_id, 'Сельское хозяйство', 'Сельское хозяйство');
set @last_id = add_middle_topic(@top_id, 'Жилищный сектор', 'Жилищный сектор');
set @last_id = add_middle_topic(@top_id, 'Центральное отопление', 'Центральное отопление');

set @top_id = add_topic('Область применения', 'Область применения');
set @last_id = add_middle_topic(@top_id, 'Производство тепла', 'Производство тепла');
set @last_id = add_middle_topic(@top_id, 'Выработка электроэнергии', 'Выработка электроэнергии');
set @last_id = add_middle_topic(@top_id, 'Производственные процессы', 'Производственные процессы');
set @last_id = add_middle_topic(@top_id, 'Сельскохозяйственные процессы', 'Сельскохозяйственные процессы');
set @last_id = add_middle_topic(@top_id, 'Производство тепла и холода', 'Производство тепла и холода');
set @last_id = add_middle_topic(@top_id, 'Возобновляемая энергия', 'Возобновляемая энергия');
set @last_id = add_middle_topic(@top_id, 'Общие меры', 'Общие меры');

commit;
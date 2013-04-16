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
VALUES (6, 'JPG', 'IMAGE', 'system', sysdate());

INSERT INTO eetdb.UNIDO_VALUE_TYPE
(VALUE_TYPE_ID, FORMAT, TYPE, UPDATED_BY, UPDATE_DATE) 
VALUES (7, 'ENTITY_ID', 'REFERENCE', 'system', sysdate());

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

-- -------------------------------------------------------------------
-- fill TEMPLATES
-- -------------------------------------------------------------------
set @last_id = eetdb.add_template('ARTICLE', 'Описание технологии');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'TEXT', 'Полное описание', 'TEXT', '', 1, 1, 0);
call add_template_property(@last_id, 'ECONOMY_PERCENT', 'Процент экономии ресурса', 'NUMBER', '%', 1, 1, 1);
call add_template_property(@last_id, 'ECONOMY_COMMENT', 'Условия экономии ресурса', 'STRING', '', 0, 0, 0);

-- TEMPLATE PIPE --
set @last_id = eetdb.add_template('PIPE', 'Труба');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'DIAMETER', 'Диаметр', 'NUMBER', 'СМ', 1, 1, 1);
call add_template_property(@last_id, 'DIAMETER_MIDDLE', 'Внутренний диаметр', 'NUMBER', 'СМ', 1, 1, 0);
call add_template_property(@last_id, 'DIAMETER_OUT', 'Внешний диаметр', 'NUMBER', 'СМ', 1, 1, 0);
call add_template_property(@last_id, 'LAMBDA', 'Коэффициент', 'NUMBER', 'СМ', 0, 0, 0);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);

-- TEMPLATE BOILER --
set @last_id = eetdb.add_template('BOILER', 'Нагреватель воды');
call add_template_property(@last_id, 'BOILER_TYPE', 'Тип нагревателя', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '', 1, 0, 1);
call add_template_property(@last_id, 'FUEL', 'Топливо', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'POWER', 'Мощность', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'STEAM_POWER', 'Мощность пара', 'NUMBER', 'кг/ч', 1, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);

-- TEMPLATE BOILERS_BLOCK --
set @last_id = eetdb.add_template('BOILERS_BLOCK', 'Блочные котельные');
call add_template_property(@last_id, 'BOILERS_BLOCK_TYPE', 'Тип котельной', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '', 1, 0, 1);
call add_template_property(@last_id, 'FUEL', 'Топливо', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'POWER', 'Мощность', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'STEAM_POWER', 'Мощность пара', 'NUMBER', 'кг/ч', 1, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);

-- TEMPLATE BURNER --
set @last_id = eetdb.add_template('BURNER', 'Нагреватель воды');
call add_template_property(@last_id, 'BURNER_TYPE', 'Тип нагревателя', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '', 1, 0, 1);
call add_template_property(@last_id, 'FUEL', 'Топливо', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'POWER', 'Выходная мощность', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'POWER_MIN', 'Выходная мощность минимальная', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'POWER_MAX', 'Выходная мощность максимальная', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);

-- TEMPLATE VENDOR --
set @last_id = eetdb.add_template('VENDOR', 'Производитель');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Сайт компании', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'ADDRESS', 'Адрес', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'PHONE', 'Телефон', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR', 'Дистрибьютор в России', 'STRING', '', 1, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_URL', 'Сайт дистрибьютора в России', 'STRING', '', 1, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_ADDRESS', 'Адрес дистрибьютора', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_PHONE', 'Телефон дистрибьютора', 'STRING', '', 0, 1, 0);

-- -------------------------------------------------------------------
-- fill CATALOGUES
-- -------------------------------------------------------------------
-- FUEL --
set @last_id = eetdb.add_template('FUEL', 'Топливо');
set @gaz = eetdb.add_entity('FUEL', 'Природный газ');
set @propan = eetdb.add_entity('FUEL', 'Пропан');
set @mazut = eetdb.add_entity('FUEL', 'Мазут');
set @diesel = eetdb.add_entity('FUEL', 'Дизельное топливо');

set @last_id = eetdb.add_template('BOILER_TYPE', 'Тип нагревателя');
set @boiler_type1 = eetdb.add_entity('BOILER_TYPE', 'Паровой котел');
set @boiler_type2 = eetdb.add_entity('BOILER_TYPE', 'Отопительный котел');
set @boiler_type3 = eetdb.add_entity('BOILER_TYPE', 'Конденсационный котел');
set @boiler_type4 = eetdb.add_entity('BOILER_TYPE', 'Низкотемпературный котел');

set @last_id = eetdb.add_template('BOILERS_BLOCK_TYPE', 'Тип котельной');
set @last_id = eetdb.add_entity('BOILERS_BLOCK_TYPE', 'Отопительные блочные котлы');
set @last_id = eetdb.add_entity('BOILERS_BLOCK_TYPE', 'Конденсационные блочные котлы');

set @last_id = eetdb.add_template('BURNER_TYPE', 'Тип горелки');
set @last_id = eetdb.add_entity('BURNER_TYPE', 'Промышленная горелка');
set @last_id = eetdb.add_entity('BURNER_TYPE', 'Мазутная горелка');
set @last_id = eetdb.add_entity('BURNER_TYPE', 'Газовая горелка');
set @last_id = eetdb.add_entity('BURNER_TYPE', 'Дизельная горелка');
set @last_id = eetdb.add_entity('BURNER_TYPE', 'Комбинированная горелка');

-- -------------------------------------------------------------------
-- fill ENTITY
-- -------------------------------------------------------------------
-- entity 1
set @last_id = eetdb.add_entity('ARTICLE', 'Автоматизация режимов горения');
call link_entity(@last_id, 'Энергосберегающие технологии');
call link_entity(@last_id, 'Экономия топлива');
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_02.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.energosovet.ru/', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Автоматизация режимов горения (поддержание оптимального соотношения топливо-воздух)', null);
call add_entity_property(@last_id, 'ECONOMY_PERCENT', '16', null);
call add_entity_property(@last_id, 'ECONOMY_COMMENT', '', null);

-- entity 2
set @last_id = eetdb.add_entity('ARTICLE', 'Автономная тепловая установка');
call link_entity(@last_id, 'Энергосберегающие технологии');
call link_entity(@last_id, 'Экономия топлива');
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_02.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.ptechnology.ru/', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Автономная тепловая установка модульного типа на базе гидродросселя вихревого - генератора тепла', null);
call add_entity_property(@last_id, 'TEXT', null, '<div style="text-align: left; "><b>Общая характеристика</b></div><br />Установка - модуль тепловой (в дальнейшем МТ) предназначена для автономного отопления и горячего водоснабжения жилых домов, коттеджей, производственных помещений, теплиц и т.д. <p>Действие установки основано на работе вихревого гидродросселя - генератора тепла.</p><p>Нагрев теплоносителя в теплогенераторе происходит за счет высокой скорости движения теплоносителя, трения и гидродинамического эффекта. При этом повышение температуры жидкости до необходимого уровня происходит в результате многократной ее циркуляции по замкнутому контуру. В качестве теплоносителя может использоваться как специально подготовленная, так и неподготовленная вода. Установка работает автоматически в заданном диапазоне температур и является экологически чистой (для нагрева воды не используется прямое сжигание топлива).</p><p><b>Вариант схемы подключения установки в варианте гвс и отопления</b><br /></p></div><img width="500" hspace="10" height="219" border="1" align="left" src="http://www.ptechnology.ru/MainPart/Energy/pic/Energy20.gif"  /><p></p><div>1. Бак-накопитель</div><div>2. Задвижки</div><div>3. Насосы 1-го контура</div><div>4. Теплогенератор</div><div>5. Теплообменники</div><div>6. Радиатор отопления</div><div>7. Насосы циркуляции</div><div>8. Расширительный бак</div><div>9. Воздухосборник</div><div>10. Термодатчики</div><div><br /><div align="justify">Возможны другие схемы подключения установки с сантехническими системами. <br /><br /><div><b>Описание работы схемы:</b></div><p>Насосные агрегаты из бака накопителя подают холодную воду в теплогенератор, где происходит ее нагрев. Нагретая вода поступает в бак-накопитель, затем вновь подается в теплогенератор, что позволяет быстро достичь заданной рабочей температуры. При достижении заданной температуры воды в баке-накопителе силовые насосные установки автоматически отключаются. Теплоноситель из бака-накопителя с помощью насоса циркуляции поступает в скоростные водоподогреватели систем ГВС или отопления, отдает тепло рабочему телу и возвращается обратно.</p></div><br /><div><table border="1"><caption><b>Модификации теплогенераторов</b></caption><colgroup><col></col><col align="left"></col></colgroup><tbody><tr><th rowspan="2">№</th><th rowspan="2" colspan="2">Наименование параметра</th><th colspan="5">Модификации</th></tr><tr><td>ГТ 1</td><td>ГТ 2</td><td>ГТ 3</td><td>ГТ 4</td><td>ГТ 5</td></tr><tr><td>1</td><td>Габаритные размеры (мм)</td><td>Длина L <br />Ширина S</td><td>430 <br />230</td><td>730 <br />330</td><td>1105 <br />540</td><td>1260 <br />570</td><td>1615 <br />720</td></tr><tr><td>2</td><td colspan="2">Масса, кг (сухая)</td><td>12</td><td>52</td><td>130</td><td>194</td><td>367</td></tr><tr><td>3</td><td colspan="2">Тепловая мощность номинальная, кВт</td><td>4,85</td><td>18,43</td><td>48,5</td><td>101,85</td><td>107,0</td></tr><tr><td>4</td><td>Установленная мощность электродвигателей насосной установки, кВт</td><td>Минимальная <br />Номинальная <br />Максимальная</td><td>0,6 <br />5,0 <br />10,0</td><td>8,0 <br />19,0 <br />30,0</td><td>20,0 <br />50,0 <br />80,0</td><td>60,0 <br />105,0 <br />160,0</td><td>55,0 <br />110,0 <br />180,0</td></tr><tr><td>5</td><td>Расход рабочего тела при циркуляции, м<sup>3</sup>/час</td><td>Минимальный <br />Номинальный <br />Максимальный</td><td>3 <br />12 <br />20</td><td>18 <br />25 <br />55</td><td>30 <br />60 <br />120</td><td>180 <br />300 <br />400</td><td>160 <br />320 <br />350</td></tr><tr><td>6</td><td>Давление рабочего тела на входе, МПа</td><td>Минимальное <br />Номинальное <br />Максимальное</td><td>0,30 <br />0,40 <br />0,55</td><td>0,50 <br />0,60 <br />0,80</td><td>0,60 <br />0,70 <br />1,10</td><td>0,70 <br />0,80 <br />2,00</td><td>0,70 <br />0,80 <br />2,00</td></tr><tr><td>7</td><td>Диапазон температур рабочего тела, &deg;С</td><td>Минимальная <br />Максимальная</td><td>40 <br />95</td><td>40 <br />95</td><td>40 <br />95</td><td>40 <br />95</td><td>40 <br />95</td></tr><tr><td>8</td><td colspan="2">Объем внутренней полости теплогенератора, дм<sup>3</sup></td><td>1,5</td><td>15,2</td><td>28,4</td><td>73,9</td><td>-</td></tr><tr><td>9</td><td colspan="2">Диаметр условного прохода dТ, мм</td><td>50</td><td>90</td><td>140</td><td>160</td><td>200</td></tr><tr><td>10</td><td colspan="2">Условный диаметр фланцев вход. выход, dФ, мм</td><td>32</td><td>65</td><td>100</td><td>125</td><td>160</td></tr></tbody></table></div><br /><div><table border="1"><colgroup><col align="right"></col></colgroup><caption>Установка подготовки горячей воды <br /><br /></caption><tbody><tr><th>Тип установки</th><th>MT 001</th><th>МТ 003</th><th>МТ 005</th></tr><tr><td>Потребляемая мощность, кВт</td><td>30</td><td>120</td><td>220</td></tr><tr><td>Теплопроизводительность, Гкал/час</td><td>0,024</td><td>0,10</td><td>0,18</td></tr><tr><td>Температура теплоносителя</td><td>Не выше 100 °С <br />95 °С - рабочая</td><td>Не выше 100 °С <br />95 °С - рабочая</td><td>Не выше 100 °С <br />95 °С - рабочая</td></tr><tr><td>Напряжение сети, В</td><td>380</td><td>380</td><td>380</td></tr><tr><td>Режим работы</td><td>автомат.</td><td>автомат.</td><td>автомат.</td></tr><tr><td>Габаритные размеры, мм</td><td>1992 х 938 х 1486</td><td>2950 х 1722 х 1610</td><td>3410 х 2000 х 2324</td></tr><tr><td>Масса, кг</td><td>950</td><td>2100</td><td>3500</td></tr><tr><td>Теплогенератор</td><td>ГТ 2</td><td>ГT 3</td><td>ГT 5</td></tr><tr><td>Количество теплогенераторов</td><td>1</td><td>2</td><td>2</td></tr><tr><td>Объем бака накопителя, м<sup>3</sup></td><td>0,45</td><td>2,3</td><td>4,47</td></tr><tr><td>Объем отапливаемого помещения, м<sup>3</sup></td><td>до 700</td><td>до 4500</td><td>до 8500</td></tr></tbody></table></div><p>Возможны варианты изготовления установок мощностью 15 кВт, 60 кВт, 110 кВт и др. <br /></p>');
call add_entity_property(@last_id, 'ECONOMY_PERCENT', '10', null);
call add_entity_property(@last_id, 'ECONOMY_COMMENT', '', null);

-- entity 3
set @last_id = eetdb.add_entity('ARTICLE', 'Аэрогель для теплоизоляции');
call link_entity(@last_id, 'Энергосберегающие технологии');
call link_entity(@last_id, 'Экономия тепловой энергии');
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_03.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_03.html', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Также он известен, как «твердый воздух» и «замороженный дым» или «голубой дым».', null);
call add_entity_property(@last_id, 'TEXT', null, 'Также он известен, как «твердый воздух» и «замороженный дым» или «голубой дым». Подобные имена ему присвоены благодаря молекулярной структуре, это губка с открытыми нано-порами. Такую структуру получили достаточно просто: смешав диоксид силикона и воду, под высоким давлением заменили молекулы воды на молекулы сжиженного газа, после возвращения нормального атмосферного давления газ полностью испаряется, оставляя после себя те самые нано- поры, размером с молекулу. Таким образом, получилась практически идеальная структура для теплоизоляции, кроме того, аэрогель прозрачен, тверд и легок (самая низкая плотность из твердых материалов), очень хрупок. Теплопроводность данного теплоизолятора около 0,01 Вт/мК при температуре 38º С и атмосферном давлении 760 мм. рт. ст. Для бытового применения разработан ряд материалов на основе аэрогеля, при помощи которых можно теплоизолировать теплотрассы и различное тепловое оборудование, а также дома. Так же существуют материалы специально для каркасного строительства. Они представляет из себя «сплав» стеклоткани и аэрогеля толщиной 5 и 10 мм, с рекордными показателями теплопроводности 0,015 Вт/мК. Не трудно рассчитать, что 10 мм такой теплоизоляции заменит 42 мм стандартной минеральной ваты.');
call add_entity_property(@last_id, 'ECONOMY_PERCENT', '6', null);
call add_entity_property(@last_id, 'ECONOMY_COMMENT', '', null);

set @vendor03 = eetdb.add_entity('VENDOR', 'Производитель 3');
call add_entity_property(@vendor03, 'PICTURE', 'http://www.links.com/small_03.jpg', null);
call add_entity_property(@vendor03, 'URL', 'http://www.links.com/tech_03.html', null);
call add_entity_property(@vendor03, 'DESCRIPTION', 'Описание производителя 3', null);
call add_entity_property(@vendor03, 'ADDRESS', 'Адрес 3', null);
call add_entity_property(@vendor03, 'PHONE', 'Телефон 3', null);
call add_entity_property(@vendor03, 'DISTRIBUTOR', 'Производитель 3', null);
call add_entity_property(@vendor03, 'DETAILS', 'Производитель 3, дополнительные характеристики.', null);
call add_entity_property(@vendor03, 'DISTRIBUTOR_ADDRESS', 'Адрес 33', null);
call add_entity_property(@vendor03, 'DISTRIBUTOR_PHONE', 'Телефон 33', null);

set @vendor05 = eetdb.add_entity('VENDOR', 'Производитель 5');
call add_entity_property(@vendor05, 'PICTURE', 'http://www.links.com/small_05.jpg', null);
call add_entity_property(@vendor05, 'URL', 'http://www.links.com/tech_05.html', null);
call add_entity_property(@vendor05, 'DESCRIPTION', 'Описание производителя 5', null);
call add_entity_property(@vendor05, 'ADDRESS', 'Адрес 5', null);
call add_entity_property(@vendor05, 'PHONE', 'Телефон 5', null);
call add_entity_property(@vendor05, 'DISTRIBUTOR', 'Производитель 5', null);
call add_entity_property(@vendor05, 'DETAILS', 'Производитель 5, дополнительные характеристики.', null);
call add_entity_property(@vendor05, 'DISTRIBUTOR_ADDRESS', 'Адрес 55', null);
call add_entity_property(@vendor05, 'DISTRIBUTOR_PHONE', 'Телефон 55', null);

set @last_id = eetdb.add_entity('BOILER', 'Продукт 33');
call link_entity(@last_id, 'Жидкотопливные и газовые горелки');
call link_entity(@last_id, 'Призводство');
call link_entity(@last_id, 'Промышленный сектор');
call add_entity_property(@last_id, 'BOILER_TYPE', convert(@boiler_type1, char), null);
call add_entity_property(@last_id, 'VENDOR', convert(@vendor03, char), null);
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_33.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_33.html', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Описание модели К33', null);
call add_entity_property(@last_id, 'PI', 'КПД', '82');
call add_entity_property(@last_id, 'FUEL', convert(@diesel, char), null);
call add_entity_property(@last_id, 'POWER', '2500', null);
call add_entity_property(@last_id, 'DETAILS', null, 'Характеристики 33');
call add_entity_property(@last_id, 'VENDOR_CODE', 'NS-567JK', null);

set @last_id = eetdb.add_entity('BOILER', 'Продукт 34');
call link_entity(@last_id, 'Жидкотопливные и газовые горелки');
call link_entity(@last_id, 'Призводство');
call link_entity(@last_id, 'Жилищный сектор');
call add_entity_property(@last_id, 'BOILER_TYPE', convert(@boiler_type2, char), null);
call add_entity_property(@last_id, 'VENDOR', convert(@vendor03, char), null);
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_34.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_34.html', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Описание модели К34', null);
call add_entity_property(@last_id, 'PI', 'КПД', '88');
call add_entity_property(@last_id, 'FUEL', convert(@gaz, char), null);
call add_entity_property(@last_id, 'POWER', '1240', null);
call add_entity_property(@last_id, 'DETAILS', null, 'Характеристики 34');
call add_entity_property(@last_id, 'VENDOR_CODE', 'TS-234HG', null);

set @last_id = eetdb.add_entity('PIPE', 'Продукт 35');
call link_entity(@last_id, 'Предизолированные трубы');
call link_entity(@last_id, 'Передача тепла');
call link_entity(@last_id, 'Экономия тепловой энергии');
call add_entity_property(@last_id, 'VENDOR', convert(@vendor05, char), null);
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_35.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_35.html', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Описание модели К35', null);
call add_entity_property(@last_id, 'DIAMETER', '51.4', null);
call add_entity_property(@last_id, 'DIAMETER_MIDDLE', '63', null);
call add_entity_property(@last_id, 'DIAMETER_OUT', '200', null);
call add_entity_property(@last_id, 'LAMBDA', '0.03', null);
call add_entity_property(@last_id, 'DETAILS', null, 'Характеристики 35');
call add_entity_property(@last_id, 'VENDOR_CODE', 'IT-350B', null);

-- -------------------------------------------------------------------
-- fill VENDORS
-- -------------------------------------------------------------------
set @last_id = eetdb.add_entity('VENDOR', 'Adrian Group');
call add_entity_property(@last_id, 'PICTURE', 'http://www.adrian.eu/images/parts/logo.gif', null);
call add_entity_property(@last_id, 'URL', 'http://www.adrian.eu', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания предлагает комплексную систему отопления, которая состоит не только из газовых инфракрасных обогревателей и тепловоздушных агрегатов собственного производства, но и включает системы управления, приборы дестратификации и рекуперации, мониторинг, оптимизацию, а также элементы оценки качества окружающей среды и безопасности.', null);
call add_entity_property(@last_id, 'DETAILS', '', null);
call add_entity_property(@last_id, 'ADDRESS', 'ADRIAN GROUP s.r.o. Lazovná 53 97401 Banská Bystrica Slovakia', null);
call add_entity_property(@last_id, 'PHONE', '+421 48 471 04 44', null);

set @last_id = eetdb.add_entity('VENDOR', 'AL-KO Lufttechnik');
call add_entity_property(@last_id, 'PICTURE', 'http://www.al-ko.com/layout/alko_logo.png', null);
call add_entity_property(@last_id, 'URL', 'http://www.al-ko.com', null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null);
call add_entity_property(@last_id, 'DETAILS', '', null);
call add_entity_property(@last_id, 'ADDRESS', 'AL-KO Therm GmbH Maschinenfabrik Postfach 51 D-89343 Jettingen Scheppach, Germany', null);
call add_entity_property(@last_id, 'PHONE', '+49 (8221) 97-0', null);

set @last_id = eetdb.add_entity('VENDOR', 'Avogadro Energy S.R.L.');
call add_entity_property(@last_id, 'PICTURE', 'http://www.avogadroenergy.com/immagini/logo.png', null);
call add_entity_property(@last_id, 'URL', 'http://www.avogadroenergy.com ', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания производит: <ul><li>паровые котлы и парогенераторы</li><li>водогрейные котлы и котлы для производства перегретой воды</li><li>котлы на диатермическом масле (котлы с ВОТ)</li><li>котлы-утилизаторы и теплообменники</li><li>когенерационные установки</li><li>твердотопливные котлы и установки</li><li>контейнерные котельные</li><li>установки для обработки воды</li></ul>', null);
call add_entity_property(@last_id, 'DETAILS', '', null);
call add_entity_property(@last_id, 'ADDRESS', 'Galleria Crispi, 41 Vicenza 36100 Italy IT02479590800', null);
call add_entity_property(@last_id, 'PHONE', '(+39) 030 294861', null);

set @last_id = eetdb.add_entity('VENDOR', 'AVS Aggregatebau GmbH');
call add_entity_property(@last_id, 'PICTURE', 'http://www.avs-aggregatebau.de/images/kopf_home.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.avs-aggregatebau.de', null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null);
call add_entity_property(@last_id, 'DETAILS', '', null);
call add_entity_property(@last_id, 'ADDRESS', 'AVS Salemstraße 43 89584 Ehingen Germany', null);
call add_entity_property(@last_id, 'PHONE', '+49 (0)7393 9507', null);

set @last_id = eetdb.add_entity('VENDOR', 'Bosch');
call add_entity_property(@last_id, 'PICTURE', '', null);
call add_entity_property(@last_id, 'URL', '', null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null);
call add_entity_property(@last_id, 'DETAILS', '', null);
call add_entity_property(@last_id, 'ADDRESS', 'Bosch Thermotechnik GmbH 35576 Germany, Wetzlar, Sophienstrasse 30-32', null);
call add_entity_property(@last_id, 'PHONE', '', null);

set @last_id = eetdb.add_entity('VENDOR', 'Buderus');
call add_entity_property(@last_id, 'PICTURE', 'http://www.buderus.ua/images/logo_big.gif', null);
call add_entity_property(@last_id, 'URL', 'http://www.buderus.ua/', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Buderus предлагает компаниям, работающим в сфере отопления, широкий спектр продукции, а также обеспечивает надежный сервиси информационную поддержку.', null);
call add_entity_property(@last_id, 'DETAILS', '', null);
call add_entity_property(@last_id, 'ADDRESS', 'Киев 02660, ул. Крайня 1', null);
call add_entity_property(@last_id, 'PHONE', '+38-044-390-71-93 ', null);

set @last_id = eetdb.add_entity('VENDOR', 'Capstone');
call add_entity_property(@last_id, 'PICTURE', '', null);
call add_entity_property(@last_id, 'URL', 'http://www.capstoneturbine.com', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Capstone Turbine Corporation® is the world''s leading producer of low-emission microturbine systems, and was first to market with commercially viable air bearing turbine technology. The company has shipped thousands of Capstone turbines to customers worldwide. These award-winning systems have logged millions of documented runtime operating hours.', null);
call add_entity_property(@last_id, 'DETAILS', 'Capstone is a member of the U.S. Environmental Protection Agency''s Combined Heat and Power Partnership which is committed to improving the efficiency of the nation''s energy infrastructure and reducing emissions of pollutants and greenhouse gases.', null);
call add_entity_property(@last_id, 'ADDRESS', '21211 Nordhoff Street Chatsworth, CA 91311 United States', null);
call add_entity_property(@last_id, 'PHONE', '1 818 734 5300', null);

set @last_id = eetdb.add_entity('VENDOR', 'CASE');
call add_entity_property(@last_id, 'PICTURE', 'http://www.caseih.com/PublishingImages/landing/images/logo.png', null);
call add_entity_property(@last_id, 'URL', 'http://www.caseih.com', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Бренд Case IH представляет собой традицию лидерства. Это комбинация больших сельскохозяйственных машиностроительных предприятий и брендов, в том числе CASE, International Harvester и David Brown и другие.', null);
call add_entity_property(@last_id, 'DETAILS', 'Каждый из брендов играет важную роль в истории и эволюции Case IH. За эти годы многое изменилось, но легендарный красный бренд всегда будет представлять собой стремление сделать сельхозпроизводителей успешными.', null);
call add_entity_property(@last_id, 'ADDRESS', 'Case IH Max Service c/o CNH America LLC 621 State Street Racine, WI 53404', null);
call add_entity_property(@last_id, 'PHONE', '(813) 631-0000', null);

set @last_id = eetdb.add_entity('VENDOR', 'CINK Hydro - Energy k. s.');
call add_entity_property(@last_id, 'PICTURE', 'http://www.cink-hydro-energy.com/gfx/headers/foot_cz.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.cink-hydro-energy.com', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Наша компания принадлежит к лидерам в области поставок технологического оборудования для малых и средних гидроэлектростанций. Команда разработчиков компании CINK Hydro-Energy поставила перед собой задачу совместно со своими заказчиками превратить водный потенциал во всем мире в рентабельный и экологически щадящий по отношению к окружающей природной среде источник энергии.', null);
call add_entity_property(@last_id, 'DETAILS', 'Мы являемся одной из нескольких компаний в мире, которые располагают ноу-хау, необходимым для проведения технически хорошо обеспеченных поставок всех известных типов турбин, таких как турбина «Crossflow» (проточная), поворотнолопастная турбина (турбина Каплана), ковшовая турбина (турбина Пелтона) и радиально-осевая турбина (турбина Френсиса), до 3 МВт единичной мощности. Кроме того, компания «CINK Hydro-Energy» специализируется на установке гидроэлектростанций в системах питьевой воды, и для этой цели имеет ряд лицензий.', null);
call add_entity_property(@last_id, 'ADDRESS', 'Lesov 125 360 01 Sadov Česká Republika', null);
call add_entity_property(@last_id, 'PHONE', '+420 353 579 154', null);

set @last_id = eetdb.add_entity('VENDOR', 'Riello S.p.A.');
call add_entity_property(@last_id, 'PICTURE', 'http://www.riellogroup.com/engines/images/logo.png', null);
call add_entity_property(@last_id, 'URL', 'http://www.riellogroup.com', null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null);
call add_entity_property(@last_id, 'DETAILS', '<p>Сегодня концерн RIELLO - это:</p><ul><li>Оборот 500 - 600 млн. евро год;</li><li>8 заводов - 6 заводов расположены в Италии, по одному заводу - в Польше и Канаде;</li><li>7 торговых марок;</li><li>27 филиалов и подразделений по всему миру;</li><li>Самый большой в Европе Центр прикладных исследований горения;</li><li>Мировой лидер в производстве горелок - более 400000 шт. в год;</li><li>2500 человек персонала;</li><li>Сертификат качества ISO 9001.</li></ul>', null);
call add_entity_property(@last_id, 'ADDRESS', 'Via Ing. Pilade Riello, 7, 37045 Legnago (VR) Italy', null);
call add_entity_property(@last_id, 'PHONE', '', null);

set @last_id = eetdb.add_entity('VENDOR', 'De Dietrich Thermique');
call add_entity_property(@last_id, 'PICTURE', 'http://www.dedietrich-heating.com/design/ddth/images/logo_dedietrich.gif', null);
call add_entity_property(@last_id, 'URL', 'http://www.dedietrich-heating.com', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'De Dietrich Thermique - один из ведущих мировых производителей отопительной техники и номер один во Франции. Экономия энергии и защита окружающей среды многие годы являются приоритетными направлениями  развития компании. Во Франции и за ее пределами De Dietrich Thermique насчитывает более 2 000 сотрудников.', null);
call add_entity_property(@last_id, 'DETAILS', '<p>Годовой  оборот компании составляет более 400 миллионов евро. В 2004 году была образована промышленная группа  с целью занять место среди пяти крупнейших производителей отопительного оборудования.</p><p>С 2009 года De Dietrich-Remeha входит в состав холдинга BDR Thermea - ведущего мирового производителя и поставщика инновационных систем отопления и горячего водоснабжения. Компания представлена более чем в 60-ти странах.</p><p>Объем продаж De Dietrich-Remeha 300 000 котлов в год: твердотопливных, низкотемпературных на жидком топливе и газе, в том числе 2/3  конденсационных.</p>', null);
call add_entity_property(@last_id, 'ADDRESS', '57, rue de la Gare – B.P. 30, 67580 MERTZWILLER, France', null);
call add_entity_property(@last_id, 'PHONE', '+33-388-802-791', null);

set @last_id = eetdb.add_entity('VENDOR', 'COSMOGAS S.r.l.');
call add_entity_property(@last_id, 'PICTURE', '', null);
call add_entity_property(@last_id, 'URL', 'www.cosmogas.com', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Фирма «COSMOGAS» занимается изготовлением отопительной техники в течении сорока лет. В научно-исследовательском центре работают высококвалифицированные специалисты, которые обоснованно и выверено воплощают новые технические идеи в конструкции котлов. В ассортименте имеются газовые котлы мощностью от 15 до 40 кВт и термические модули конденсационного типа мощностью до 720 кВт.', null);
call add_entity_property(@last_id, 'DETAILS', '', null);
call add_entity_property(@last_id, 'ADDRESS', 'Via L. Da Vinci 16, 47014 Meldola (FC)', null);
call add_entity_property(@last_id, 'PHONE', '+39 0543 49.83.83', null);

set @last_id = eetdb.add_entity('VENDOR', 'Viessmann');
call add_entity_property(@last_id, 'PICTURE', 'http://www.viessmann.de/content/dam/internet-global/images/general/7590.gif', null);
call add_entity_property(@last_id, 'URL', 'http://www.viessmann.de', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Промышленная группа Viessmann - крупнейший производитель оборудования для систем теплоснабжения мирового уровня. Компания была основана в 1917 году. Сегодня её успешно возглавляет доктор Мартин Виссманн, который представляет собой уже третье поколение владельцев предприятия.', null);
call add_entity_property(@last_id, 'DETAILS', 'Годовой оборот компании Viessmann составляет 1,7 млрд. евро, а количество сотрудников насчитывает около 9400 человек. Компания Viessmann владеет 22 заводами в 10 странах. Ею создана разветвленная сеть крупных центров сбыта, не только в Германии, но и в 74 других странах. Во всем мире открыты 120 торговых филиалов компании. Таким образом, компания Viessmann является крупным игроком на мировом рынке отопительной техники, где 56% всего оборота предприятия приходится на экспорт.', null);
call add_entity_property(@last_id, 'ADDRESS', 'Viessmann Werke GmbH & Co. KG, Viessmannstraße 1, 35108 Allendorf (Eder)', null);
call add_entity_property(@last_id, 'PHONE', '+ 49 6452 70-0', null);

set @last_id = eetdb.add_entity('VENDOR', 'Укртехнопром');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_98.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.ukrtehnoprom.com', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'ЗАО «ХК «Укртехнопром» — лидер рынка отопительной техники Украины.', null);
call add_entity_property(@last_id, 'DETAILS', '', null);
call add_entity_property(@last_id, 'ADDRESS', '04073, Украина, г. Киев, ул. Ливарская, 5', null);
call add_entity_property(@last_id, 'PHONE', '+38 (044) 467-66-48', null);

-- set @last_id = eetdb.add_entity('VENDOR', '');
-- call add_entity_property(@last_id, 'PICTURE', '', null);
-- call add_entity_property(@last_id, 'URL', '', null);
-- call add_entity_property(@last_id, 'DESCRIPTION', '', null);
-- call add_entity_property(@last_id, 'DETAILS', '', null);
-- call add_entity_property(@last_id, 'ADDRESS', '', null);
-- call add_entity_property(@last_id, 'PHONE', '', null);

commit;
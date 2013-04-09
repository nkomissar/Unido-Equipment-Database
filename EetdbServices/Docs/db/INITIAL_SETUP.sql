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

-- -------------------------------------------------------------------
-- fill TOPIC
-- -------------------------------------------------------------------
set @top_id = add_topic('Оборудование', 'Оборудование');

set @last_id = add_middle_topic(@top_id, 'Энергосберегающие технологии', 'Примеры и описания энергосберегающих технологий');

set @last_id = add_middle_topic(@top_id, 'Производство тепла', 'Оборудование для производства тепла');
call add_child_topic(@last_id, 'Жидкотопливные и газовые горелки', 'Жидкотопливные и газовые горелки');
call add_child_topic(@last_id, 'Блочные котельные', 'Блочные котельные');
call add_child_topic(@last_id, 'Жидкотопливные и газовые котлы', 'Жидкотопливные и газовые котлы');
call add_child_topic(@last_id, 'Котлы на биомассе', 'Котлы на биомассе');
call add_child_topic(@last_id, 'Тепловые насосы', 'Тепловые насосы');
call add_child_topic(@last_id, 'Солнечные водонагреватели', 'Солнечные водонагреватели');
call add_child_topic(@last_id, 'Инфракрасные газовые нагреватели', 'Инфракрасные газовые нагреватели');

set @last_id = add_middle_topic(@top_id, 'Производство электроэнергии', 'Оборудование для производства электроэнергии');
call add_child_topic(@last_id, 'Мини-когенерационные установки', 'Мини-когенерационные установки');
call add_child_topic(@last_id, 'Фотоэлектрические системы', 'Фотоэлектрические системы');
call add_child_topic(@last_id, 'Микро ВЭУ', 'Микро ВЭУ');
call add_child_topic(@last_id, 'Микро ГЭС', 'Микро ГЭС');

set @last_id = add_middle_topic(@top_id, 'Системы контроля', 'Системы контроля');

set @last_id = add_middle_topic(@top_id, 'Распределение тепла и холода', 'Распределение тепла и холода');
call add_child_topic(@last_id, 'Предизолированные трубы', 'Предизолированные трубы');

set @last_id = add_middle_topic(@top_id, 'Электрооборудование', 'Электрооборудование');
call add_child_topic(@last_id, 'Трансформаторы', 'Трансформаторы');
call add_child_topic(@last_id, 'Компенсаторы реактивной мощности', 'Компенсаторы реактивной мощности');

set @last_id = add_middle_topic(@top_id, 'Регенерация тепла', 'Регенерация тепла');
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

-- -------------------------------------------------------------------
-- fill TEMPLATES
-- -------------------------------------------------------------------
set @last_id = eetdb.add_template('ARTICLE', 'Описание технологии');
call add_template_property(@last_id, 'TITLE', 'Описание', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'TEXT', 'Полное описание', 'TEXT', '', 1, 1, 0);
call add_template_property(@last_id, 'ECONOMY_PERCENT', 'Процент экономии ресурса', 'NUMBER', '%', 1, 1, 1);
call add_template_property(@last_id, 'ECONOMY_COMMENT', 'Условия экономии ресурса', 'STRING', '', 0, 0, 0);

-- TEMPLATE PIPE --
set @last_id = eetdb.add_template('PIPE', 'Труба');
call add_template_property(@last_id, 'TITLE', 'Название', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '', 1, 0, 1);
call add_template_property(@last_id, 'DIAMETER', 'Диаметр', 'NUMBER', 'СМ', 1, 1, 1);
call add_template_property(@last_id, 'DIAMETER_MIDDLE', 'Внутренний диаметр', 'NUMBER', 'СМ', 1, 1, 0);
call add_template_property(@last_id, 'DIAMETER_OUT', 'Внешний диаметр', 'NUMBER', 'СМ', 1, 1, 0);
call add_template_property(@last_id, 'LAMBDA', 'Коэффициент', 'NUMBER', 'СМ', 0, 0, 0);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);

-- TEMPLATE BOILER --
set @last_id = eetdb.add_template('BOILER', 'Нагреватель воды');
call add_template_property(@last_id, 'TITLE', 'Название', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '', 1, 0, 1);
call add_template_property(@last_id, 'FUEL', 'Топливо', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'POWER', 'Мощность', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);

-- TEMPLATE VENDOR --
set @last_id = eetdb.add_template('VENDOR', 'Производитель');
call add_template_property(@last_id, 'TITLE', 'Название', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'ADDRESS', 'Адрес', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'PHONE', 'Телефон', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DISTRIBUTOR', 'Дистрибьютор в России', 'STRING', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_ADDRESS', 'Адрес дистрибьютора', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_PHONE', 'Телефон дистрибьютора', 'STRING', '', 0, 1, 0);

-- -------------------------------------------------------------------
-- fill ENTITY
-- -------------------------------------------------------------------
-- entity 1
set @last_id = eetdb.add_entity('ARTICLE', 'Автоматизация режимов горения');
call link_entity(@last_id, 'Энергосберегающие технологии');
call link_entity(@last_id, 'Экономия топлива');
call add_entity_property(@last_id, 'TITLE', 'Автоматизация режимов горения', null);
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_02.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.energosovet.ru/', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Автоматизация режимов горения (поддержание оптимального соотношения топливо-воздух)', null);
call add_entity_property(@last_id, 'ECONOMY_PERCENT', '16', null);
call add_entity_property(@last_id, 'ECONOMY_COMMENT', '', null);

-- entity 2
set @last_id = eetdb.add_entity('ARTICLE', 'Автономная тепловая установка');
call link_entity(@last_id, 'Энергосберегающие технологии');
call link_entity(@last_id, 'Экономия топлива');
call add_entity_property(@last_id, 'TITLE', 'Автономная тепловая установка', null);
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
call add_entity_property(@last_id, 'TITLE', 'Аэрогель для теплоизоляции', null);
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_03.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_03.html', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Также он известен, как «твердый воздух» и «замороженный дым» или «голубой дым».', null);
call add_entity_property(@last_id, 'TEXT', null, 'Также он известен, как «твердый воздух» и «замороженный дым» или «голубой дым». Подобные имена ему присвоены благодаря молекулярной структуре, это губка с открытыми нано-порами. Такую структуру получили достаточно просто: смешав диоксид силикона и воду, под высоким давлением заменили молекулы воды на молекулы сжиженного газа, после возвращения нормального атмосферного давления газ полностью испаряется, оставляя после себя те самые нано- поры, размером с молекулу. Таким образом, получилась практически идеальная структура для теплоизоляции, кроме того, аэрогель прозрачен, тверд и легок (самая низкая плотность из твердых материалов), очень хрупок. Теплопроводность данного теплоизолятора около 0,01 Вт/мК при температуре 38º С и атмосферном давлении 760 мм. рт. ст. Для бытового применения разработан ряд материалов на основе аэрогеля, при помощи которых можно теплоизолировать теплотрассы и различное тепловое оборудование, а также дома. Так же существуют материалы специально для каркасного строительства. Они представляет из себя «сплав» стеклоткани и аэрогеля толщиной 5 и 10 мм, с рекордными показателями теплопроводности 0,015 Вт/мК. Не трудно рассчитать, что 10 мм такой теплоизоляции заменит 42 мм стандартной минеральной ваты.');
call add_entity_property(@last_id, 'ECONOMY_PERCENT', '6', null);
call add_entity_property(@last_id, 'ECONOMY_COMMENT', '', null);

set @last_id = eetdb.add_entity('VENDOR', 'Производитель 3');
call add_entity_property(@last_id, 'TITLE', 'Производитель 3', null);
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_03.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_03.html', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Описание производителя 3', null);
call add_entity_property(@last_id, 'ADDRESS', 'Адрес 3', null);
call add_entity_property(@last_id, 'PHONE', 'Телефон 3', null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'Производитель 3', null);
call add_entity_property(@last_id, 'DETAILS', 'Производитель 3, дополнительные характеристики.', null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', 'Адрес 33', null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', 'Телефон 33', null);

set @last_id = eetdb.add_entity('VENDOR', 'Производитель 5');
call add_entity_property(@last_id, 'TITLE', 'Производитель 5', null);
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_05.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_05.html', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Описание производителя 5', null);
call add_entity_property(@last_id, 'ADDRESS', 'Адрес 5', null);
call add_entity_property(@last_id, 'PHONE', 'Телефон 5', null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'Производитель 5', null);
call add_entity_property(@last_id, 'DETAILS', 'Производитель 5, дополнительные характеристики.', null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', 'Адрес 55', null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', 'Телефон 55', null);

set @last_id = eetdb.add_entity('BOILER', 'Продукт 33');
call link_entity(@last_id, 'Жидкотопливные и газовые горелки');
call link_entity(@last_id, 'Призводство');
call link_entity(@last_id, 'Промышленный сектор');
call link_entities(@last_id, 'Производитель 3');
call add_entity_property(@last_id, 'TITLE', 'Продукт 33', null);
call add_entity_property(@last_id, 'VENDOR', 'Производитель 3', null);
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_33.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_33.html', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Описание модели К33', null);
call add_entity_property(@last_id, 'PI', 'КПД', '82');
call add_entity_property(@last_id, 'FUEL', 'Дизель', null);
call add_entity_property(@last_id, 'POWER', '2500', null);
call add_entity_property(@last_id, 'DETAILS', null, 'Характеристики 33');
call add_entity_property(@last_id, 'VENDOR_CODE', 'NS-567JK', null);


set @last_id = eetdb.add_entity('BOILER', 'Продукт 34');
call link_entity(@last_id, 'Жидкотопливные и газовые горелки');
call link_entity(@last_id, 'Призводство');
call link_entity(@last_id, 'Жилищный сектор');
call link_entities(@last_id, 'Производитель 3');
call add_entity_property(@last_id, 'TITLE', 'Продукт 34', null);
call add_entity_property(@last_id, 'VENDOR', 'Производитель 3', null);
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_34.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_34.html', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Описание модели К34', null);
call add_entity_property(@last_id, 'PI', 'КПД', '88');
call add_entity_property(@last_id, 'FUEL', 'Газ', null);
call add_entity_property(@last_id, 'POWER', '1240', null);
call add_entity_property(@last_id, 'DETAILS', null, 'Характеристики 34');
call add_entity_property(@last_id, 'VENDOR_CODE', 'TS-234HG', null);

set @last_id = eetdb.add_entity('PIPE', 'Продукт 35');
call link_entity(@last_id, 'Предизолированные трубы');
call link_entity(@last_id, 'Передача тепла');
call link_entity(@last_id, 'Экономия тепловой энергии');
call link_entities(@last_id, 'Производитель 5');
call add_entity_property(@last_id, 'TITLE', 'Продукт 35', null);
call add_entity_property(@last_id, 'VENDOR', 'Производитель 5', null);
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_35.jpg', null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_35.html', null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Описание модели К35', null);
call add_entity_property(@last_id, 'DIAMETER', '51.4', null);
call add_entity_property(@last_id, 'DIAMETER_MIDDLE', '63', null);
call add_entity_property(@last_id, 'DIAMETER_OUT', '200', null);
call add_entity_property(@last_id, 'LAMBDA', '0.03', null);
call add_entity_property(@last_id, 'DETAILS', null, 'Характеристики 35');
call add_entity_property(@last_id, 'VENDOR_CODE', 'IT-350B', null);

commit;
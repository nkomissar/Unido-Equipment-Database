-- -------------------------------------------------------------------
-- Delete old data
-- -------------------------------------------------------------------
DELETE FROM eetdb.UNIDO_ENTITY_PROPERTY;
DELETE FROM eetdb.UNIDO_ENTITY_REFERENCE;
DELETE FROM eetdb.UNIDO_TOPIC_LINK;
DELETE FROM eetdb.UNIDO_TOPIC;
DELETE FROM eetdb.UNIDO_ENTITY;
DELETE FROM eetdb.UNIDO_VALUE_TYPE;
DELETE FROM eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY;
DELETE FROM eetdb.UNIDO_ENTITY_TEMPLATE;

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


-- -------------------------------------------------------------------
-- fill TOPIC
-- -------------------------------------------------------------------
INSERT INTO eetdb.UNIDO_TOPIC
(TOPIC_ID, TOPIC_NAME, DESCRIPTION, UPDATED_BY, UPDATE_DATE) 
VALUES (1, 'Building Materials', 'Строительные материалы', 'system', sysdate());

INSERT INTO eetdb.UNIDO_TOPIC
(TOPIC_ID, TOPIC_NAME, DESCRIPTION, UPDATED_BY, UPDATE_DATE) 
VALUES (2, 'Power Equipment', 'Оборудование для передачи и потребления электроэнергии', 'system', sysdate());

INSERT INTO eetdb.UNIDO_TOPIC
(TOPIC_ID, TOPIC_NAME, DESCRIPTION, UPDATED_BY, UPDATE_DATE) 
VALUES (3, 'Cement mixes', 'Сухие смеси', 'system', sysdate());

INSERT INTO eetdb.UNIDO_TOPIC
(TOPIC_ID, TOPIC_NAME, DESCRIPTION, UPDATED_BY, UPDATE_DATE) 
VALUES (4, 'Sockets', 'Оконечное оборудование электрической сети', 'system', sysdate());

INSERT INTO eetdb.UNIDO_TOPIC
(TOPIC_ID, TOPIC_NAME, DESCRIPTION, UPDATED_BY, UPDATE_DATE) 
VALUES (5, 'Power cables', 'Силовые кабели', 'system', sysdate());

INSERT INTO eetdb.UNIDO_TOPIC
(TOPIC_ID, TOPIC_NAME, DESCRIPTION, UPDATED_BY, UPDATE_DATE) 
VALUES (6, 'Энергосберегающие технологии', 'Примеры и описания', 'system', sysdate());

INSERT INTO eetdb.UNIDO_TOPIC_LINK
(LINKED_TOPIC_ID, PARENT_TOPIC_ID) 
VALUES (3, 1);

INSERT INTO eetdb.UNIDO_TOPIC_LINK
(LINKED_TOPIC_ID, PARENT_TOPIC_ID) 
VALUES (4, 2);

INSERT INTO eetdb.UNIDO_TOPIC_LINK
(LINKED_TOPIC_ID, PARENT_TOPIC_ID) 
VALUES (5, 2);


-- -------------------------------------------------------------------
-- fill TEMPLATE
-- -------------------------------------------------------------------
INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE
(ENTITY_TEMPLATE_ID, TEMPLATE_CODE, TEMPLATE_NAME, UPDATED_BY, UPDATE_DATE) 
VALUES (1, 'MIX', 'Сухая смесь', 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE
(ENTITY_TEMPLATE_ID, TEMPLATE_CODE, TEMPLATE_NAME, UPDATED_BY, UPDATE_DATE) 
VALUES (2, 'CABLE', 'Провод', 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE
(ENTITY_TEMPLATE_ID, TEMPLATE_CODE, TEMPLATE_NAME, UPDATED_BY, UPDATE_DATE) 
VALUES (3, 'SOCKET', 'Розетка', 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE
(ENTITY_TEMPLATE_ID, TEMPLATE_CODE, TEMPLATE_NAME, UPDATED_BY, UPDATE_DATE) 
VALUES (4, 'ARTICLE', 'Статья', 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY
(TEMPLATE_PROPERTY_ID, ENTITY_TEMPLATE_ID, PROPERTY_CODE, PROPERTY_NAME, UNIT_OF_MEASURE, DISPLAY_IN_GRID, MANDATORY, UPDATED_BY, UPDATE_DATE) 
VALUES (1, 1, 'WEIGHT', 'Вес', 'кг', 1, 1, 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY
(TEMPLATE_PROPERTY_ID, ENTITY_TEMPLATE_ID, PROPERTY_CODE, PROPERTY_NAME, UNIT_OF_MEASURE, DISPLAY_IN_GRID, MANDATORY, UPDATED_BY, UPDATE_DATE) 
VALUES (2, 2, 'LENGTH', 'Длина', 'M', 1, 1, 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY
(TEMPLATE_PROPERTY_ID, ENTITY_TEMPLATE_ID, PROPERTY_CODE, PROPERTY_NAME, UNIT_OF_MEASURE, DISPLAY_IN_GRID, MANDATORY, UPDATED_BY, UPDATE_DATE) 
VALUES (3, 2, 'DIAMETER', 'Диаметр', 'MM', 1, 1, 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY
(TEMPLATE_PROPERTY_ID, ENTITY_TEMPLATE_ID, PROPERTY_CODE, PROPERTY_NAME, UNIT_OF_MEASURE, DISPLAY_IN_GRID, MANDATORY, UPDATED_BY, UPDATE_DATE) 
VALUES (4, 3, 'EARTHING', 'Заземление', '', 1, 1, 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY
(TEMPLATE_PROPERTY_ID, ENTITY_TEMPLATE_ID, PROPERTY_CODE, PROPERTY_NAME, UNIT_OF_MEASURE, DISPLAY_IN_GRID, MANDATORY, UPDATED_BY, UPDATE_DATE) 
VALUES (5, 3, 'COLOR', 'Цвет', '', 1, 1, 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY
(TEMPLATE_PROPERTY_ID, ENTITY_TEMPLATE_ID, PROPERTY_CODE, PROPERTY_NAME, UNIT_OF_MEASURE, DISPLAY_IN_GRID, MANDATORY, UPDATED_BY, UPDATE_DATE) 
VALUES (6, 4, 'URL', 'Оригинальный источник', '', 1, 1, 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_TEMPLATE_PROPERTY
(TEMPLATE_PROPERTY_ID, ENTITY_TEMPLATE_ID, PROPERTY_CODE, PROPERTY_NAME, UNIT_OF_MEASURE, DISPLAY_IN_GRID, MANDATORY, UPDATED_BY, UPDATE_DATE) 
VALUES (7, 4, 'TEXT', 'Текст', '', 1, 1, 'system', sysdate());

-- -------------------------------------------------------------------
-- fill ENTITY
-- -------------------------------------------------------------------
-- entity 1
INSERT INTO eetdb.UNIDO_ENTITY
(ENTITY_ID, ENTITY_TEMPLATE_ID, ENTITY_NAME, UPDATED_BY, UPDATE_DATE) 
VALUES (1, 1, 'Cement 100', 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_REFERENCE
(ENTITY_ID, TOPIC_ID) 
VALUES (1, 3);

INSERT INTO eetdb.UNIDO_ENTITY_PROPERTY
(ENTITY_PROPERTY_ID, ENTITY_ID, TEMPLATE_PROPERTY_ID, VALUE_TYPE_ID, VALUE, VALUE_BLOB, UPDATED_BY, UPDATE_DATE) 
VALUES (1, 1, 1, 3, '25', NULL, 'system', sysdate());

-- entity 2
INSERT INTO eetdb.UNIDO_ENTITY
(ENTITY_ID, ENTITY_TEMPLATE_ID, ENTITY_NAME, UPDATED_BY, UPDATE_DATE) 
VALUES (2, 2, 'Copper cable', 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_REFERENCE
(ENTITY_ID, TOPIC_ID) 
VALUES (2, 4);

INSERT INTO eetdb.UNIDO_ENTITY_PROPERTY
(ENTITY_PROPERTY_ID, ENTITY_ID, TEMPLATE_PROPERTY_ID, VALUE_TYPE_ID, VALUE, VALUE_BLOB, UPDATED_BY, UPDATE_DATE) 
VALUES (2, 2, 2, 3, '50', NULL, 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_PROPERTY
(ENTITY_PROPERTY_ID, ENTITY_ID, TEMPLATE_PROPERTY_ID, VALUE_TYPE_ID, VALUE, VALUE_BLOB, UPDATED_BY, UPDATE_DATE) 
VALUES (3, 2, 3, 3, '0.5', NULL, 'system', sysdate());

-- entity 3
INSERT INTO eetdb.UNIDO_ENTITY
(ENTITY_ID, ENTITY_TEMPLATE_ID, ENTITY_NAME, UPDATED_BY, UPDATE_DATE) 
VALUES (3, 3, 'Extension socket', 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_REFERENCE
(ENTITY_ID, TOPIC_ID) 
VALUES (3, 5);

INSERT INTO eetdb.UNIDO_ENTITY_PROPERTY
(ENTITY_PROPERTY_ID, ENTITY_ID, TEMPLATE_PROPERTY_ID, VALUE_TYPE_ID, VALUE, VALUE_BLOB, UPDATED_BY, UPDATE_DATE) 
VALUES (4, 3, 4, 5, '1', NULL, 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_PROPERTY
(ENTITY_PROPERTY_ID, ENTITY_ID, TEMPLATE_PROPERTY_ID, VALUE_TYPE_ID, VALUE, VALUE_BLOB, UPDATED_BY, UPDATE_DATE) 
VALUES (5, 3, 5, 1, 'WHITE', NULL, 'system', sysdate());

-- entity 4
INSERT INTO eetdb.UNIDO_ENTITY
(ENTITY_ID, ENTITY_TEMPLATE_ID, ENTITY_NAME, UPDATED_BY, UPDATE_DATE) 
VALUES (4, 4, 'Автоматизация режимов горения (поддержание оптимального соотношения топливо-воздух)', 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_REFERENCE
(ENTITY_ID, TOPIC_ID) 
VALUES (4, 6);

INSERT INTO eetdb.UNIDO_ENTITY_PROPERTY
(ENTITY_PROPERTY_ID, ENTITY_ID, TEMPLATE_PROPERTY_ID, VALUE_TYPE_ID, VALUE, VALUE_BLOB, UPDATED_BY, UPDATE_DATE) 
VALUES (6, 4, 6, 1, 'http://www.energosovet.ru/', NULL, 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_PROPERTY
(ENTITY_PROPERTY_ID, ENTITY_ID, TEMPLATE_PROPERTY_ID, VALUE_TYPE_ID, VALUE, VALUE_BLOB, UPDATED_BY, UPDATE_DATE) 
VALUES (7, 4, 7, 2, NULL, '<p align="justify"><b>Общая характеристика</b><br /></p><p align="justify">Оптимизация процессов горения в различных котлах осуществляется посредством внедрения автоматической системы управления. Процесс работы котла контролируется компьютером, посредством ввода оператором исходных параметров. Уменьшается время работы человека с котельным оборудованием, отсутствует влияние человеческого фактора </p><p align="justify">Автоматизация процессов горения (подержание оптимального соотношения топливо-воздух) снижает ПДВ, что влечет к устранению перерасхода топлива, повышению безопасности процесса выработки тепловой энергии.</p><p align="justify">Существует два способа решения данной проблемы: полная автоматизация процесса выработки тепловой энергии, на источниках, включая насосное и вспомогательное оборудование (АСУ ТП) или частичная (только котлоагрегаты) автоматизация (АСУ ТП). На малых котельных можно рекомендовать установку блочных горелочных устройств с автоматическим регулированием процесса сжигания топлива. </p><p align="justify">Всё управление технологическими процессами на источниках происходит автоматически при помощи программируемого устройства контроллера (нижний уровень АСУ ТП), контроль над технологическим процессом осуществляется обслуживающим персоналом с пульта управления через персональный компьютер с мнемосхемой управления процессом (верхний уровень АСУ ТП). Обслуживающий персонал только даёт команды на &laquo;пуск&raquo; или «стоп» того или иного оборудования или вносит свои корректировки в технологический процесс работы источника тепловой энергии. Также используются автоматические корректирующие газоанализаторы.</p><p align="justify">Оптимизация процессов горения может осуществляться в котельных на любом виде топлива, но наиболее эффективна при новом строительстве или модернизации котельной. Большинство современных котлов выпускается с системами автоматического управления. При использовании нескольких котлов в котельной, для выбора оптимальной загрузки котлоагрегатов требуется выполнять проект по автоматизации.</p><p align="justify"><b>АСУ ТП позволяет решать следующие задачи:</b></p><div align="justify"><ul><li>автоматическая подготовка котлоагрегата к розжигу;</li><li>автоматический розжиг горелок котла с переходом в режим минимальной мощности;</li><li>управление нагрузкой и оптимизация соотношения топливо-воздух каждой из горелок котла;</li><li>управление тепловым режимом котла;</li><li>регулирование температуры сетевой воды на выходе из котельной в зависимости от температуры наружного воздуха;</li><li>защита, сигнализация и блокировка работы котла при неисправностях;</li><li>управление с операторских станций технологическим оборудованием (дымосос, вентиляторы, задвижки);</li><li>обеспечение оперативно-технологического персонала информацией о параметрах теплового режима и состоянии технологического оборудования;</li><li>регистрация в режиме реального времени параметров технологического процесса и действий оперативного персонала;</li><li>протоколирование и архивирование информации;</li><li>представление архивной информации и результатов расчетов.</li></ul></div><p align="justify">Управляющие и информационные функции системы реализуются соответствующими подсистемами и схемами, выделенными по функциональным признакам.</p><strong></strong><p align="justify">Всё управление технологическими процессами на источниках происходит автоматически при помощи программируемого устройства контроллера (нижний уровень АСУ ТП), контроль над технологическим процессом осуществляется обслуживающим персоналом с пульта управления через персональный компьютер с мнемосхемой управления процессом (верхний уровень АСУ ТП). Обслуживающий персонал только даёт команды на «пуск» или «стоп» того или иного оборудования или вносит свои корректировки в технологический процесс работы источника тепловой энергии. Также используются автоматические корректирующие газоанализаторы.</p>Внедрение данных методов позволит сэкономить до 5% используемого топлива.', 'system', sysdate());

-- entity 5
INSERT INTO eetdb.UNIDO_ENTITY
(ENTITY_ID, ENTITY_TEMPLATE_ID, ENTITY_NAME, UPDATED_BY, UPDATE_DATE) 
VALUES (5, 4, 'Автономная тепловая установка модульного типа на базе гидродросселя вихревого - генератора тепла', 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_REFERENCE
(ENTITY_ID, TOPIC_ID) 
VALUES (5, 6);

INSERT INTO eetdb.UNIDO_ENTITY_PROPERTY
(ENTITY_PROPERTY_ID, ENTITY_ID, TEMPLATE_PROPERTY_ID, VALUE_TYPE_ID, VALUE, VALUE_BLOB, UPDATED_BY, UPDATE_DATE) 
VALUES (8, 5, 6, 1, 'http://www.ptechnology.ru/', NULL, 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_PROPERTY
(ENTITY_PROPERTY_ID, ENTITY_ID, TEMPLATE_PROPERTY_ID, VALUE_TYPE_ID, VALUE, VALUE_BLOB, UPDATED_BY, UPDATE_DATE) 
VALUES (9, 5, 7, 2, NULL, '<div style="text-align: left; "><b>Общая характеристика</b></div><br />Установка - модуль тепловой (в дальнейшем МТ) предназначена для автономного отопления и горячего водоснабжения жилых домов, коттеджей, производственных помещений, теплиц и т.д. <p>Действие установки основано на работе вихревого гидродросселя - генератора тепла.</p><p>Нагрев теплоносителя в теплогенераторе происходит за счет высокой скорости движения теплоносителя, трения и гидродинамического эффекта. При этом повышение температуры жидкости до необходимого уровня происходит в результате многократной ее циркуляции по замкнутому контуру. В качестве теплоносителя может использоваться как специально подготовленная, так и неподготовленная вода. Установка работает автоматически в заданном диапазоне температур и является экологически чистой (для нагрева воды не используется прямое сжигание топлива).</p><p><b>Вариант схемы подключения установки в варианте гвс и отопления</b><br /></p></div><img width="500" hspace="10" height="219" border="1" align="left" src="http://www.ptechnology.ru/MainPart/Energy/pic/Energy20.gif"  /><p></p><div>1. Бак-накопитель</div><div>2. Задвижки</div><div>3. Насосы 1-го контура</div><div>4. Теплогенератор</div><div>5. Теплообменники</div><div>6. Радиатор отопления</div><div>7. Насосы циркуляции</div><div>8. Расширительный бак</div><div>9. Воздухосборник</div><div>10. Термодатчики</div><div><br /><div align="justify">Возможны другие схемы подключения установки с сантехническими системами. <br /><br /><div><b>Описание работы схемы:</b></div><p>Насосные агрегаты из бака накопителя подают холодную воду в теплогенератор, где происходит ее нагрев. Нагретая вода поступает в бак-накопитель, затем вновь подается в теплогенератор, что позволяет быстро достичь заданной рабочей температуры. При достижении заданной температуры воды в баке-накопителе силовые насосные установки автоматически отключаются. Теплоноситель из бака-накопителя с помощью насоса циркуляции поступает в скоростные водоподогреватели систем ГВС или отопления, отдает тепло рабочему телу и возвращается обратно.</p></div><br /><div><table border="1"><caption><b>Модификации теплогенераторов</b></caption><colgroup><col></col><col align="left"></col></colgroup><tbody><tr><th rowspan="2">№</th><th rowspan="2" colspan="2">Наименование параметра</th><th colspan="5">Модификации</th></tr><tr><td>ГТ 1</td><td>ГТ 2</td><td>ГТ 3</td><td>ГТ 4</td><td>ГТ 5</td></tr><tr><td>1</td><td>Габаритные размеры (мм)</td><td>Длина L <br />Ширина S</td><td>430 <br />230</td><td>730 <br />330</td><td>1105 <br />540</td><td>1260 <br />570</td><td>1615 <br />720</td></tr><tr><td>2</td><td colspan="2">Масса, кг (сухая)</td><td>12</td><td>52</td><td>130</td><td>194</td><td>367</td></tr><tr><td>3</td><td colspan="2">Тепловая мощность номинальная, кВт</td><td>4,85</td><td>18,43</td><td>48,5</td><td>101,85</td><td>107,0</td></tr><tr><td>4</td><td>Установленная мощность электродвигателей насосной установки, кВт</td><td>Минимальная <br />Номинальная <br />Максимальная</td><td>0,6 <br />5,0 <br />10,0</td><td>8,0 <br />19,0 <br />30,0</td><td>20,0 <br />50,0 <br />80,0</td><td>60,0 <br />105,0 <br />160,0</td><td>55,0 <br />110,0 <br />180,0</td></tr><tr><td>5</td><td>Расход рабочего тела при циркуляции, м<sup>3</sup>/час</td><td>Минимальный <br />Номинальный <br />Максимальный</td><td>3 <br />12 <br />20</td><td>18 <br />25 <br />55</td><td>30 <br />60 <br />120</td><td>180 <br />300 <br />400</td><td>160 <br />320 <br />350</td></tr><tr><td>6</td><td>Давление рабочего тела на входе, МПа</td><td>Минимальное <br />Номинальное <br />Максимальное</td><td>0,30 <br />0,40 <br />0,55</td><td>0,50 <br />0,60 <br />0,80</td><td>0,60 <br />0,70 <br />1,10</td><td>0,70 <br />0,80 <br />2,00</td><td>0,70 <br />0,80 <br />2,00</td></tr><tr><td>7</td><td>Диапазон температур рабочего тела, &deg;С</td><td>Минимальная <br />Максимальная</td><td>40 <br />95</td><td>40 <br />95</td><td>40 <br />95</td><td>40 <br />95</td><td>40 <br />95</td></tr><tr><td>8</td><td colspan="2">Объем внутренней полости теплогенератора, дм<sup>3</sup></td><td>1,5</td><td>15,2</td><td>28,4</td><td>73,9</td><td>-</td></tr><tr><td>9</td><td colspan="2">Диаметр условного прохода dТ, мм</td><td>50</td><td>90</td><td>140</td><td>160</td><td>200</td></tr><tr><td>10</td><td colspan="2">Условный диаметр фланцев вход. выход, dФ, мм</td><td>32</td><td>65</td><td>100</td><td>125</td><td>160</td></tr></tbody></table></div><br /><div><table border="1"><colgroup><col align="right"></col></colgroup><caption>Установка подготовки горячей воды <br /><br /></caption><tbody><tr><th>Тип установки</th><th>MT 001</th><th>МТ 003</th><th>МТ 005</th></tr><tr><td>Потребляемая мощность, кВт</td><td>30</td><td>120</td><td>220</td></tr><tr><td>Теплопроизводительность, Гкал/час</td><td>0,024</td><td>0,10</td><td>0,18</td></tr><tr><td>Температура теплоносителя</td><td>Не выше 100 °С <br />95 °С - рабочая</td><td>Не выше 100 °С <br />95 °С - рабочая</td><td>Не выше 100 °С <br />95 °С - рабочая</td></tr><tr><td>Напряжение сети, В</td><td>380</td><td>380</td><td>380</td></tr><tr><td>Режим работы</td><td>автомат.</td><td>автомат.</td><td>автомат.</td></tr><tr><td>Габаритные размеры, мм</td><td>1992 х 938 х 1486</td><td>2950 х 1722 х 1610</td><td>3410 х 2000 х 2324</td></tr><tr><td>Масса, кг</td><td>950</td><td>2100</td><td>3500</td></tr><tr><td>Теплогенератор</td><td>ГТ 2</td><td>ГT 3</td><td>ГT 5</td></tr><tr><td>Количество теплогенераторов</td><td>1</td><td>2</td><td>2</td></tr><tr><td>Объем бака накопителя, м<sup>3</sup></td><td>0,45</td><td>2,3</td><td>4,47</td></tr><tr><td>Объем отапливаемого помещения, м<sup>3</sup></td><td>до 700</td><td>до 4500</td><td>до 8500</td></tr></tbody></table></div><p>Возможны варианты изготовления установок мощностью 15 кВт, 60 кВт, 110 кВт и др. <br /></p>', 'system', sysdate());

-- entity 6
INSERT INTO eetdb.UNIDO_ENTITY
(ENTITY_ID, ENTITY_TEMPLATE_ID, ENTITY_NAME, UPDATED_BY, UPDATE_DATE) 
VALUES (6, 4, 'Аэрогель для теплоизоляции', 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_REFERENCE
(ENTITY_ID, TOPIC_ID) 
VALUES (6, 6);

INSERT INTO eetdb.UNIDO_ENTITY_PROPERTY
(ENTITY_PROPERTY_ID, ENTITY_ID, TEMPLATE_PROPERTY_ID, VALUE_TYPE_ID, VALUE, VALUE_BLOB, UPDATED_BY, UPDATE_DATE) 
VALUES (10, 6, 6, 1, 'Электронная научно-техническая база по вопросам энергосбережения, инвестиционных и инновационных проектов', NULL, 'system', sysdate());

INSERT INTO eetdb.UNIDO_ENTITY_PROPERTY
(ENTITY_PROPERTY_ID, ENTITY_ID, TEMPLATE_PROPERTY_ID, VALUE_TYPE_ID, VALUE, VALUE_BLOB, UPDATED_BY, UPDATE_DATE) 
VALUES (11, 6, 7, 2, NULL, 'Также он известен, как «твердый воздух» и «замороженный дым» или «голубой дым». Подобные имена ему присвоены благодаря молекулярной структуре, это губка с открытыми нано-порами. Такую структуру получили достаточно просто: смешав диоксид силикона и воду, под высоким давлением заменили молекулы воды на молекулы сжиженного газа, после возвращения нормального атмосферного давления газ полностью испаряется, оставляя после себя те самые нано- поры, размером с молекулу. Таким образом, получилась практически идеальная структура для теплоизоляции, кроме того, аэрогель прозрачен, тверд и легок (самая низкая плотность из твердых материалов), очень хрупок. Теплопроводность данного теплоизолятора около 0,01 Вт/мК при температуре 38º С и атмосферном давлении 760 мм. рт. ст. Для бытового применения разработан ряд материалов на основе аэрогеля, при помощи которых можно теплоизолировать теплотрассы и различное тепловое оборудование, а также дома. Так же существуют материалы специально для каркасного строительства. Они представляет из себя «сплав» стеклоткани и аэрогеля толщиной 5 и 10 мм, с рекордными показателями теплопроводности 0,015 Вт/мК. Не трудно рассчитать, что 10 мм такой теплоизоляции заменит 42 мм стандартной минеральной ваты.', 'system', sysdate());
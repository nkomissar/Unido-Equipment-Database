-- -------------------------------------------------------------------
-- fill ENTITY
-- -------------------------------------------------------------------
-- entity 1
set @last_id = eetdb.add_entity('ARTICLE', 'Автоматизация режимов горения');
call link_entity(@last_id, 'Энергосберегающие технологии');
call link_entity(@last_id, 'Экономия топлива');
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_02.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.energosovet.ru/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Автоматизация режимов горения (поддержание оптимального соотношения топливо-воздух)', null, null, null);
call add_entity_property(@last_id, 'ECONOMY_PERCENT', '16', null, null, null);
call add_entity_property(@last_id, 'ECONOMY_COMMENT', '', null, null, null);

-- entity 2
set @last_id = eetdb.add_entity('ARTICLE', 'Автономная тепловая установка');
call link_entity(@last_id, 'Энергосберегающие технологии');
call link_entity(@last_id, 'Экономия топлива');
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_02.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.ptechnology.ru/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Автономная тепловая установка модульного типа на базе гидродросселя вихревого - генератора тепла', null, null, null);
call add_entity_property(@last_id, 'TEXT', null, '<div style="text-align: left; "><b>Общая характеристика</b></div><br />Установка - модуль тепловой (в дальнейшем МТ) предназначена для автономного отопления и горячего водоснабжения жилых домов, коттеджей, производственных помещений, теплиц и т.д. <p>Действие установки основано на работе вихревого гидродросселя - генератора тепла.</p><p>Нагрев теплоносителя в теплогенераторе происходит за счет высокой скорости движения теплоносителя, трения и гидродинамического эффекта. При этом повышение температуры жидкости до необходимого уровня происходит в результате многократной ее циркуляции по замкнутому контуру. В качестве теплоносителя может использоваться как специально подготовленная, так и неподготовленная вода. Установка работает автоматически в заданном диапазоне температур и является экологически чистой (для нагрева воды не используется прямое сжигание топлива).</p><p><b>Вариант схемы подключения установки в варианте гвс и отопления</b><br /></p></div><img width="500" hspace="10" height="219" border="1" align="left" src="http://www.ptechnology.ru/MainPart/Energy/pic/Energy20.gif"  /><p></p><div>1. Бак-накопитель</div><div>2. Задвижки</div><div>3. Насосы 1-го контура</div><div>4. Теплогенератор</div><div>5. Теплообменники</div><div>6. Радиатор отопления</div><div>7. Насосы циркуляции</div><div>8. Расширительный бак</div><div>9. Воздухосборник</div><div>10. Термодатчики</div><div><br /><div align="justify">Возможны другие схемы подключения установки с сантехническими системами. <br /><br /><div><b>Описание работы схемы:</b></div><p>Насосные агрегаты из бака накопителя подают холодную воду в теплогенератор, где происходит ее нагрев. Нагретая вода поступает в бак-накопитель, затем вновь подается в теплогенератор, что позволяет быстро достичь заданной рабочей температуры. При достижении заданной температуры воды в баке-накопителе силовые насосные установки автоматически отключаются. Теплоноситель из бака-накопителя с помощью насоса циркуляции поступает в скоростные водоподогреватели систем ГВС или отопления, отдает тепло рабочему телу и возвращается обратно.</p></div><br /><div><table border="1"><caption><b>Модификации теплогенераторов</b></caption><colgroup><col></col><col align="left"></col></colgroup><tbody><tr><th rowspan="2">№</th><th rowspan="2" colspan="2">Наименование параметра</th><th colspan="5">Модификации</th></tr><tr><td>ГТ 1</td><td>ГТ 2</td><td>ГТ 3</td><td>ГТ 4</td><td>ГТ 5</td></tr><tr><td>1</td><td>Габаритные размеры (мм)</td><td>Длина L <br />Ширина S</td><td>430 <br />230</td><td>730 <br />330</td><td>1105 <br />540</td><td>1260 <br />570</td><td>1615 <br />720</td></tr><tr><td>2</td><td colspan="2">Масса, кг (сухая)</td><td>12</td><td>52</td><td>130</td><td>194</td><td>367</td></tr><tr><td>3</td><td colspan="2">Тепловая мощность номинальная, кВт</td><td>4,85</td><td>18,43</td><td>48,5</td><td>101,85</td><td>107,0</td></tr><tr><td>4</td><td>Установленная мощность электродвигателей насосной установки, кВт</td><td>Минимальная <br />Номинальная <br />Максимальная</td><td>0,6 <br />5,0 <br />10,0</td><td>8,0 <br />19,0 <br />30,0</td><td>20,0 <br />50,0 <br />80,0</td><td>60,0 <br />105,0 <br />160,0</td><td>55,0 <br />110,0 <br />180,0</td></tr><tr><td>5</td><td>Расход рабочего тела при циркуляции, м<sup>3</sup>/час</td><td>Минимальный <br />Номинальный <br />Максимальный</td><td>3 <br />12 <br />20</td><td>18 <br />25 <br />55</td><td>30 <br />60 <br />120</td><td>180 <br />300 <br />400</td><td>160 <br />320 <br />350</td></tr><tr><td>6</td><td>Давление рабочего тела на входе, МПа</td><td>Минимальное <br />Номинальное <br />Максимальное</td><td>0,30 <br />0,40 <br />0,55</td><td>0,50 <br />0,60 <br />0,80</td><td>0,60 <br />0,70 <br />1,10</td><td>0,70 <br />0,80 <br />2,00</td><td>0,70 <br />0,80 <br />2,00</td></tr><tr><td>7</td><td>Диапазон температур рабочего тела, &deg;С</td><td>Минимальная <br />Максимальная</td><td>40 <br />95</td><td>40 <br />95</td><td>40 <br />95</td><td>40 <br />95</td><td>40 <br />95</td></tr><tr><td>8</td><td colspan="2">Объем внутренней полости теплогенератора, дм<sup>3</sup></td><td>1,5</td><td>15,2</td><td>28,4</td><td>73,9</td><td>-</td></tr><tr><td>9</td><td colspan="2">Диаметр условного прохода dТ, мм</td><td>50</td><td>90</td><td>140</td><td>160</td><td>200</td></tr><tr><td>10</td><td colspan="2">Условный диаметр фланцев вход. выход, dФ, мм</td><td>32</td><td>65</td><td>100</td><td>125</td><td>160</td></tr></tbody></table></div><br /><div><table border="1"><colgroup><col align="right"></col></colgroup><caption>Установка подготовки горячей воды <br /><br /></caption><tbody><tr><th>Тип установки</th><th>MT 001</th><th>МТ 003</th><th>МТ 005</th></tr><tr><td>Потребляемая мощность, кВт</td><td>30</td><td>120</td><td>220</td></tr><tr><td>Теплопроизводительность, Гкал/час</td><td>0,024</td><td>0,10</td><td>0,18</td></tr><tr><td>Температура теплоносителя</td><td>Не выше 100 °С <br />95 °С - рабочая</td><td>Не выше 100 °С <br />95 °С - рабочая</td><td>Не выше 100 °С <br />95 °С - рабочая</td></tr><tr><td>Напряжение сети, В</td><td>380</td><td>380</td><td>380</td></tr><tr><td>Режим работы</td><td>автомат.</td><td>автомат.</td><td>автомат.</td></tr><tr><td>Габаритные размеры, мм</td><td>1992 х 938 х 1486</td><td>2950 х 1722 х 1610</td><td>3410 х 2000 х 2324</td></tr><tr><td>Масса, кг</td><td>950</td><td>2100</td><td>3500</td></tr><tr><td>Теплогенератор</td><td>ГТ 2</td><td>ГT 3</td><td>ГT 5</td></tr><tr><td>Количество теплогенераторов</td><td>1</td><td>2</td><td>2</td></tr><tr><td>Объем бака накопителя, м<sup>3</sup></td><td>0,45</td><td>2,3</td><td>4,47</td></tr><tr><td>Объем отапливаемого помещения, м<sup>3</sup></td><td>до 700</td><td>до 4500</td><td>до 8500</td></tr></tbody></table></div><p>Возможны варианты изготовления установок мощностью 15 кВт, 60 кВт, 110 кВт и др. <br /></p>', 'HTML', null);
call add_entity_property(@last_id, 'ECONOMY_PERCENT', '10', null, null, null);
call add_entity_property(@last_id, 'ECONOMY_COMMENT', '', null, null, null);

-- entity 3
set @last_id = eetdb.add_entity('ARTICLE', 'Аэрогель для теплоизоляции');
call link_entity(@last_id, 'Энергосберегающие технологии');
call link_entity(@last_id, 'Экономия тепловой энергии');
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_03.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_03.html', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Также он известен, как «твердый воздух» и «замороженный дым» или «голубой дым».', null, null, null);
call add_entity_property(@last_id, 'TEXT', null, 'Также он известен, как «твердый воздух» и «замороженный дым» или «голубой дым». Подобные имена ему присвоены благодаря молекулярной структуре, это губка с открытыми нано-порами. Такую структуру получили достаточно просто: смешав диоксид силикона и воду, под высоким давлением заменили молекулы воды на молекулы сжиженного газа, после возвращения нормального атмосферного давления газ полностью испаряется, оставляя после себя те самые нано- поры, размером с молекулу. Таким образом, получилась практически идеальная структура для теплоизоляции, кроме того, аэрогель прозрачен, тверд и легок (самая низкая плотность из твердых материалов), очень хрупок. Теплопроводность данного теплоизолятора около 0,01 Вт/мК при температуре 38º С и атмосферном давлении 760 мм. рт. ст. Для бытового применения разработан ряд материалов на основе аэрогеля, при помощи которых можно теплоизолировать теплотрассы и различное тепловое оборудование, а также дома. Так же существуют материалы специально для каркасного строительства. Они представляет из себя «сплав» стеклоткани и аэрогеля толщиной 5 и 10 мм, с рекордными показателями теплопроводности 0,015 Вт/мК. Не трудно рассчитать, что 10 мм такой теплоизоляции заменит 42 мм стандартной минеральной ваты.', 'HTML', null);
call add_entity_property(@last_id, 'ECONOMY_PERCENT', '6', null, null, null);
call add_entity_property(@last_id, 'ECONOMY_COMMENT', '', null, null, null);

set @vendor03 = eetdb.add_entity('VENDOR', 'Производитель 3');
call add_entity_property(@vendor03, 'PICTURE', 'http://www.links.com/small_03.jpg', null, null, null);
call add_entity_property(@vendor03, 'URL', 'http://www.links.com/tech_03.html', null, null, null);
call add_entity_property(@vendor03, 'DESCRIPTION', 'Описание производителя 3', null, null, null);
call add_entity_property(@vendor03, 'ADDRESS', 'Адрес 3', null, null, null);
call add_entity_property(@vendor03, 'PHONE', 'Телефон 3', null, null, null);
call add_entity_property(@vendor03, 'DISTRIBUTOR', 'Производитель 3', null, null, null);
call add_entity_property(@vendor03, 'DETAILS', 'Производитель 3, дополнительные характеристики.', null, null, null);
call add_entity_property(@vendor03, 'DISTRIBUTOR_ADDRESS', 'Адрес 33', null, null, null);
call add_entity_property(@vendor03, 'DISTRIBUTOR_PHONE', 'Телефон 33', null, null, null);

set @vendor05 = eetdb.add_entity('VENDOR', 'Производитель 5');
call add_entity_property(@vendor05, 'PICTURE', 'http://www.links.com/small_05.jpg', null, null, null);
call add_entity_property(@vendor05, 'URL', 'http://www.links.com/tech_05.html', null, null, null);
call add_entity_property(@vendor05, 'DESCRIPTION', 'Описание производителя 5', null, null, null);
call add_entity_property(@vendor05, 'ADDRESS', 'Адрес 5', null, null, null);
call add_entity_property(@vendor05, 'PHONE', 'Телефон 5', null, null, null);
call add_entity_property(@vendor05, 'DISTRIBUTOR', 'Производитель 5', null, null, null);
call add_entity_property(@vendor05, 'DETAILS', 'Производитель 5, дополнительные характеристики.', null, null, null);
call add_entity_property(@vendor05, 'DISTRIBUTOR_ADDRESS', 'Адрес 55', null, null, null);
call add_entity_property(@vendor05, 'DISTRIBUTOR_PHONE', 'Телефон 55', null, null, null);

set @last_id = eetdb.add_entity('BOILER', 'Продукт 33');
call link_entity(@last_id, 'Жидкотопливные и газовые горелки');
call link_entity(@last_id, 'Призводство');
call link_entity(@last_id, 'Промышленный сектор');
call add_entity_property(@last_id, 'BOILER_TYPE', convert(@boiler_type1, char), null, null, null);
call add_entity_property(@last_id, 'VENDOR', convert(@vendor03, char), null, null, null);
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_33.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_33.html', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Описание модели К33', null, null, null);
call add_entity_property(@last_id, 'PI', '82', null, null, null);
call add_entity_property(@last_id, 'FUEL', convert(@diesel, char), null, null, null);
call add_entity_property(@last_id, 'POWER', '2500', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Характеристики 33', 'TEXT', null);
call add_entity_property(@last_id, 'VENDOR_CODE', 'NS-567JK', null, null, null);

set @last_id = eetdb.add_entity('BOILER', 'Продукт 34');
call link_entity(@last_id, 'Жидкотопливные и газовые горелки');
call link_entity(@last_id, 'Призводство');
call link_entity(@last_id, 'Жилищный сектор');
call add_entity_property(@last_id, 'BOILER_TYPE', convert(@boiler_type2, char), null, null, null);
call add_entity_property(@last_id, 'VENDOR', convert(@vendor03, char), null, null, null);
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_34.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_34.html', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Описание модели К34', null, null, null);
call add_entity_property(@last_id, 'PI', '88', null, null, null);
call add_entity_property(@last_id, 'FUEL', convert(@gaz, char), null, null, null);
call add_entity_property(@last_id, 'POWER', '1240', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Характеристики 34', 'TEXT', null);
call add_entity_property(@last_id, 'VENDOR_CODE', 'TS-234HG', null, null, null);

set @last_id = eetdb.add_entity('PIPE', 'Продукт 35');
call link_entity(@last_id, 'Предизолированные трубы');
call link_entity(@last_id, 'Передача тепла');
call link_entity(@last_id, 'Экономия тепловой энергии');
call add_entity_property(@last_id, 'VENDOR', convert(@vendor05, char), null);
call add_entity_property(@last_id, 'PICTURE', 'http://www.links.com/small_35.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.links.com/tech_35.html', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Описание модели К35', null, null, null);
call add_entity_property(@last_id, 'DIAMETER', '51.4', null, null, null);
call add_entity_property(@last_id, 'DIAMETER_MIDDLE', '63', null, null, null);
call add_entity_property(@last_id, 'DIAMETER_OUT', '200', null, null, null);
call add_entity_property(@last_id, 'LAMBDA', '0.03', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Характеристики 35', 'TEXT', null);
call add_entity_property(@last_id, 'VENDOR_CODE', 'IT-350B', null, null, null);

commit;
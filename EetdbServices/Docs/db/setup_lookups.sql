-- -------------------------------------------------------------------
-- fill LOOKUPS
-- -------------------------------------------------------------------
set @last_id = eetdb.add_template('FUEL', 'Топливо');
set @last_id = eetdb.add_entity('FUEL', 'Природный газ');
set @last_id = eetdb.add_entity('FUEL', 'Пропан');
set @last_id = eetdb.add_entity('FUEL', 'Мазут');
set @last_id = eetdb.add_entity('FUEL', 'Дизельное топливо');
set @last_id = eetdb.add_entity('FUEL', 'Биогаз');

set @last_id = eetdb.add_template('BOILER_TYPE', 'Тип нагревателя');
set @last_id = eetdb.add_entity('BOILER_TYPE', 'Паровой котел');
set @last_id = eetdb.add_entity('BOILER_TYPE', 'Отопительный котел');
set @last_id = eetdb.add_entity('BOILER_TYPE', 'Конденсационный котел');
set @last_id = eetdb.add_entity('BOILER_TYPE', 'Низкотемпературный котел');

set @last_id = eetdb.add_template('BOILERS_BLOCK_TYPE', 'Тип котельной');
set @last_id = eetdb.add_entity('BOILERS_BLOCK_TYPE', 'Отопительные блочные котлы');
set @last_id = eetdb.add_entity('BOILERS_BLOCK_TYPE', 'Конденсационные блочные котлы');

set @last_id = eetdb.add_template('BURNER_TYPE', 'Тип горелки');
set @last_id = eetdb.add_entity('BURNER_TYPE', 'Промышленная горелка');
set @last_id = eetdb.add_entity('BURNER_TYPE', 'Мазутная горелка');
set @last_id = eetdb.add_entity('BURNER_TYPE', 'Газовая горелка');
set @last_id = eetdb.add_entity('BURNER_TYPE', 'Дизельная горелка');
set @last_id = eetdb.add_entity('BURNER_TYPE', 'Комбинированная горелка');

set @last_id = eetdb.add_template('INFRARED_GAS_HEATER_TYPE', 'Тип нагревателя');
set @last_id = eetdb.add_entity('INFRARED_GAS_HEATER_TYPE', 'Трубчатый радиационный');
set @last_id = eetdb.add_entity('INFRARED_GAS_HEATER_TYPE', 'Люминисцентно-радиационный');

set @last_id = eetdb.add_template('TRANSFORMER_TYPE', 'Тип трансформатора');
set @last_id = eetdb.add_entity('TRANSFORMER_TYPE', 'Сухой');
set @last_id = eetdb.add_entity('TRANSFORMER_TYPE', 'Масляный');

set @last_id = eetdb.add_template('HEAT_EXCHANGER_TYPE', 'Тип теплообменника');
set @last_id = eetdb.add_entity('HEAT_EXCHANGER_TYPE', 'Спиральная конструкция');

set @last_id = eetdb.add_template('PRIMARY_MEDIUM', 'Первичная среда');
set @last_id = eetdb.add_entity('PRIMARY_MEDIUM', 'Дымовые газы');

set @last_id = eetdb.add_template('SECONDARY_MEDIUM', 'Вторичная среда');
set @last_id = eetdb.add_entity('SECONDARY_MEDIUM', 'Горячая вода');
set @last_id = eetdb.add_entity('SECONDARY_MEDIUM', 'Пар');

set @last_id = eetdb.add_template('COMPENSATOR_TYPE', 'Тип компенсатора');
set @last_id = eetdb.add_entity('COMPENSATOR_TYPE', 'Автоматический');
set @last_id = eetdb.add_entity('COMPENSATOR_TYPE', 'Стационарный');

set @last_id = eetdb.add_template('HEAT_SOURCE', 'Тепловой источник');
set @last_id = eetdb.add_entity('HEAT_SOURCE', 'Воздух');
set @last_id = eetdb.add_entity('HEAT_SOURCE', 'Грунт');

set @last_id = eetdb.add_template('HEAT_PUMP_TYPE', 'Тип насоса');
set @last_id = eetdb.add_entity('HEAT_PUMP_TYPE', 'Воздух-Вода');
set @last_id = eetdb.add_entity('HEAT_PUMP_TYPE', 'Вода-Вода');
set @last_id = eetdb.add_entity('HEAT_PUMP_TYPE', 'Соляной раствор');

set @last_id = eetdb.add_template('BIO_BOILER_TYPE', 'Тип котла на биомассе');
set @last_id = eetdb.add_entity('BIO_BOILER_TYPE', 'Отопительный котёл');
set @last_id = eetdb.add_entity('BIO_BOILER_TYPE', 'Тепловой генератор');
set @last_id = eetdb.add_entity('BIO_BOILER_TYPE', 'Комбинированный котел');

set @last_id = eetdb.add_template('BIO_FUEL', 'Биотопливо');
set @last_id = eetdb.add_entity('BIO_FUEL', 'Дрова');
set @last_id = eetdb.add_entity('BIO_FUEL', 'Уголь');
set @last_id = eetdb.add_entity('BIO_FUEL', 'Торф');
set @last_id = eetdb.add_entity('BIO_FUEL', 'Солома');
set @last_id = eetdb.add_entity('BIO_FUEL', 'Древесная Щепа');
set @last_id = eetdb.add_entity('BIO_FUEL', 'Пеллеты');
set @last_id = eetdb.add_entity('BIO_FUEL', 'Природный газ');

set @last_id = eetdb.add_template('COMPRESSOR_TYPE', 'Тип компрессора');
set @last_id = eetdb.add_entity('COMPRESSOR_TYPE', 'Винтовой компрессор');
set @last_id = eetdb.add_entity('COMPRESSOR_TYPE', 'Винтовой компрессор с ЧП');
set @last_id = eetdb.add_entity('COMPRESSOR_TYPE', 'Поршневой компрессор');

set @last_id = eetdb.add_template('DESICCANT_DRYER_TYPE', 'Тип осушителя');
set @last_id = eetdb.add_entity('DESICCANT_DRYER_TYPE', 'Влагоудаляющий осушитель');
set @last_id = eetdb.add_entity('DESICCANT_DRYER_TYPE', 'Рефрижераторный осушитель');
set @last_id = eetdb.add_entity('DESICCANT_DRYER_TYPE', 'Комбинированный осушитель');

set @last_id = eetdb.add_template('ENGINE_IE_CLASS', 'Класс IE');
set @last_id = eetdb.add_entity('ENGINE_IE_CLASS', 'IE2');
set @last_id = eetdb.add_entity('ENGINE_IE_CLASS', 'IE3');

set @last_id = eetdb.add_template('PUMP_TYPE', 'Тип насоса');
set @last_id = eetdb.add_entity('PUMP_TYPE', 'Насос с частотным преобразователем');

set @last_id = eetdb.add_template('FAN_TYPE', 'Тип вентилятора');
set @last_id = eetdb.add_entity('FAN_TYPE', 'Центробежный вентилятор с частотным преобразователем');

set @last_id = eetdb.add_template('HVAC_TYPE', 'Тип вентилляции');
set @last_id = eetdb.add_entity('HVAC_TYPE', 'Приточная и вытяжная вентиляция');

set @last_id = eetdb.add_template('GLAZING_TYPE', 'Тип остекления');
set @last_id = eetdb.add_entity('GLAZING_TYPE', '5-камерные');
set @last_id = eetdb.add_entity('GLAZING_TYPE', '6-камерные');

set @last_id = eetdb.add_template('INSULATION_TYPE', 'Тип изоляции');
set @last_id = eetdb.add_entity('INSULATION_TYPE', 'Минеральная вата');
set @last_id = eetdb.add_entity('INSULATION_TYPE', 'Стекловолокно');
set @last_id = eetdb.add_entity('INSULATION_TYPE', 'Синтетический материал');

set @last_id = eetdb.add_template('LIGHTING_TYPE', 'Тип светильника');
set @last_id = eetdb.add_entity('LIGHTING_TYPE', 'Флуоресцентные светильники');
set @last_id = eetdb.add_entity('LIGHTING_TYPE', 'Светодиодные светильники');
set @last_id = eetdb.add_entity('LIGHTING_TYPE', 'Светильники с разрядными лампами с высокой интенсивностью');

set @last_id = eetdb.add_template('MONITORING_TYPE', 'Тип системы мониторинга');
set @last_id = eetdb.add_entity('MONITORING_TYPE', 'Система мониторинга и хранения данных потребления энергии');

set @last_id = eetdb.add_template('AGRO_GPS_TYPE', 'Тип техники');
set @last_id = eetdb.add_entity('AGRO_GPS_TYPE', 'Трактор');
set @last_id = eetdb.add_entity('AGRO_GPS_TYPE', 'Комбайн');
set @last_id = eetdb.add_entity('AGRO_GPS_TYPE', 'Самоходный опрыскиватель');

commit;

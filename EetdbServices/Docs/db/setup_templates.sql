-- -------------------------------------------------------------------
-- fill TEMPLATES
-- -------------------------------------------------------------------
set @last_id = eetdb.add_template('ARTICLE', 'Описание технологии');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'TEXT', 'Полное описание', 'TEXT', '', 1, 1, 0);
call add_template_property(@last_id, 'ECONOMY_PERCENT', 'Процент экономии ресурса', 'NUMBER', '%', 1, 1, 1);
call add_template_property(@last_id, 'ECONOMY_COMMENT', 'Условия экономии ресурса', 'STRING', '', 0, 0, 0);

-- TEMPLATE PIPE --
set @last_id = eetdb.add_template('PIPE', 'Труба');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'DIAMETER', 'Номинальный диаметр', 'NUMBER', 'мм', 1, 1, 1);
call add_template_property(@last_id, 'DIAMETER_MIDDLE', 'Внешний диаметр средней трубы', 'NUMBER', 'мм', 1, 1, 0);
call add_template_property(@last_id, 'DIAMETER_OUT', 'Внешний диаметр обсадной трубы', 'NUMBER', 'мм', 1, 1, 0);
call add_template_property(@last_id, 'LAMBDA', 'Коэффициент', 'NUMBER', 'Вт/мК', 0, 0, 0);

-- TEMPLATE BOILER --
set @last_id = eetdb.add_template('BOILER', 'Нагреватель воды');
call add_template_property(@last_id, 'BOILER_TYPE', 'Тип нагревателя', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '', 1, 0, 1);
call add_template_property(@last_id, 'FUEL', 'Топливо', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'STEAM_POWER', 'Мощность пара', 'NUMBER', 'кг/ч', 1, 1, 1);

-- TEMPLATE BIO_BOILER --
set @last_id = eetdb.add_template('BIO_BOILER', 'Котел на биомассе');
call add_template_property(@last_id, 'BIO_BOILER_TYPE', 'Тип котла', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '', 1, 0, 1);
call add_template_property(@last_id, 'BIO_FUEL', 'Топливо', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 1, 1);

-- TEMPLATE BOILERS_BLOCK --
set @last_id = eetdb.add_template('BOILERS_BLOCK', 'Блочные котельные');
call add_template_property(@last_id, 'BOILERS_BLOCK_TYPE', 'Тип котельной', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '', 1, 0, 1);
call add_template_property(@last_id, 'FUEL', 'Топливо', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'STEAM_POWER', 'Мощность пара', 'NUMBER', 'кг/ч', 1, 1, 1);

-- TEMPLATE BURNER --
set @last_id = eetdb.add_template('BURNER', 'Жидкотопливная/газовая горелка');
call add_template_property(@last_id, 'BURNER_TYPE', 'Тип горелки', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'FUEL', 'Топливо', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Выходная мощность', 'NUMBER', 'кВт', 1, 1, 1);

-- HEAT_PUMP --
set @last_id = eetdb.add_template('HEAT_PUMP', 'Тепловой насос');
call add_template_property(@last_id, 'HEAT_PUMP_TYPE', 'Тип насоса', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'HEAT_SOURCE', 'Тепловой источник', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 1, 1);
call add_template_property(@last_id, 'HEAT_CAPACITY', 'Теплоемкость', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'COOL_CAPACITY', 'Хладопроизводительность', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'HEATING_PI', 'Коэффициент производительности (отопление)', 'NUMBER', '', 1, 1, 1);
call add_template_property(@last_id, 'COOLING_PI', 'Коэффициент производительности (охлаждение)', 'NUMBER', '', 1, 1, 1);

-- SOLAR_WATERHEATER --
set @last_id = eetdb.add_template('SOLAR_WATERHEATER', 'Солнечный водонагреватель');
call add_template_property(@last_id, 'SOLAR_WATERHEATER_TYPE', 'Тип нагревателя', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Объем', 'NUMBER', 'л', 1, 1, 1);
call add_template_property(@last_id, 'AREA', 'Площадь', 'NUMBER', 'кв.м.', 1, 1, 1);

-- INFRARED_GAS_HEATER --
set @last_id = eetdb.add_template('INFRARED_GAS_HEATER', 'Инфракрасный газовый нагреватель');
call add_template_property(@last_id, 'INFRARED_GAS_HEATER_TYPE', 'Тип нагревателя', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 1, 1);

-- MICRO_HYDRO_TURBINE --
set @last_id = eetdb.add_template('MICRO_HYDRO_TURBINE', 'Микро ГЭС');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);

-- MICRO_WIND_TURBINES --
set @last_id = eetdb.add_template('MICRO_WIND_TURBINES', 'Микро ВЭУ');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 0, 1);

-- PHOTOVOLTAIC_SYSTEM --
set @last_id = eetdb.add_template('PHOTOVOLTAIC_SYSTEM', 'Фотоэлектрическая система');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'AREA', 'Площадь', 'NUMBER', 'кв.м.', 1, 0, 1);

-- SMALL_SCALE_CHP --
set @last_id = eetdb.add_template('SMALL_SCALE_CHP', 'Мини-когенерационная установка');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'FUEL', 'Топливо', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Электрическая мощность', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'ELECTRIC_PI', 'Электрический КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'HEAT_CAPACITY', 'Теплоемкость', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'PI', 'Общий КПД', 'NUMBER', '%', 1, 0, 1);

-- TRANSFORMER --
set @last_id = eetdb.add_template('TRANSFORMER', 'Трансформатор');
call add_template_property(@last_id, 'TRANSFORMER_TYPE', 'Тип трансформатора', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВА', 1, 0, 1);
call add_template_property(@last_id, 'PRIMARY_VOLTAGE', 'Первичное напряжение', 'NUMBER', 'V', 1, 0, 1);
call add_template_property(@last_id, 'SECONDARY_VOLTAGE', 'Вторичное напряжение', 'NUMBER', 'V', 1, 0, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);

-- COMPENSATOR --
set @last_id = eetdb.add_template('COMPENSATOR', 'Компенсатор реактивной мощности');
call add_template_property(@last_id, 'COMPENSATOR_TYPE', 'Тип компенсатора', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВАр', 1, 0, 1);
call add_template_property(@last_id, 'VOLTAGE', 'Напряжение', 'NUMBER', 'V', 1, 0, 1);

-- EXHAUST_GAS_BOILER  --
set @last_id = eetdb.add_template('HEAT_EXCHANGER', 'Теплообменник');
call add_template_property(@last_id, 'HEAT_EXCHANGER_TYPE', 'Тип теплообменника', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PRIMARY_MEDIUM', 'Первичная среда', 'REFERENCE', '', 1, 0, 1);
call add_template_property(@last_id, 'SECONDARY_MEDIUM', 'Вторичная среда', 'REFERENCE', '', 1, 0, 1);
call add_template_property(@last_id, 'PRESSURE', 'Максимальное давление', 'NUMBER', 'бар', 1, 0, 1);
call add_template_property(@last_id, 'TEMPERATURE_MAX', 'Максимальная температура', 'NUMBER', '°C', 1, 0, 1);
call add_template_property(@last_id, 'TEMPERATURE_DIFF', 'Перепад температур', 'NUMBER', '°C', 1, 0, 1);

-- COMPRESSOR --
set @last_id = eetdb.add_template('COMPRESSOR', 'Компрессор');
call add_template_property(@last_id, 'COMPRESSOR_TYPE', 'Тип компрессора', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'Нм3/ч', 1, 0, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);

-- AIR_RECEIVER --
set @last_id = eetdb.add_template('AIR_RECEIVER', 'Резервуар сжатого воздуха');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Объем', 'NUMBER', 'Нм3', 1, 0, 1);
call add_template_property(@last_id, 'PRESSURE', 'Давление', 'NUMBER', 'бар', 1, 0, 1);

-- DESICCANT_DRYER --
set @last_id = eetdb.add_template('DESICCANT_DRYER', 'Осушитель сжатого воздуха');
call add_template_property(@last_id, 'DESICCANT_DRYER_TYPE', 'Тип', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'Нм3/ч', 1, 0, 1);
call add_template_property(@last_id, 'PRESSURE', 'Давление', 'NUMBER', 'бар', 1, 0, 1);

-- ENGINE --
set @last_id = eetdb.add_template('ENGINE', 'Двигатель');
call add_template_property(@last_id, 'ENGINE_IE_CLASS', 'Класс двигателя', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'VOLTAGE', 'Напряжение', 'NUMBER', 'V', 1, 0, 1);
call add_template_property(@last_id, 'POLES', 'Количество полюсов', 'NUMBER', '', 1, 0, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);

-- DRIVE --
set @last_id = eetdb.add_template('DRIVE', 'Частотный преобразователь электроприводов');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'VOLTAGE', 'Напряжение', 'NUMBER', 'V', 1, 0, 1);

-- PUMP --
set @last_id = eetdb.add_template('PUMP', 'Насос');
call add_template_property(@last_id, 'PUMP_TYPE', 'Тип насоса', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'м3/ч', 1, 0, 1);
call add_template_property(@last_id, 'PRESSURE', 'Максимальное давление', 'NUMBER', 'бар', 1, 0, 1);
call add_template_property(@last_id, 'HEAD', 'Напор', 'NUMBER', 'м', 1, 0, 1);

-- FAN --
set @laChillerst_id = eetdb.add_template('FAN', 'Вентилятор');
call add_template_property(@last_id, 'FAN_TYPE', 'Тип вентилятора', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'м3/ч', 1, 0, 1);

-- CHILLER --
set @last_id = eetdb.add_template('CHILLER', 'Чиллер для холодильных камер');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'TEMPERATURE', 'Температура охлаждения', 'NUMBER', '°C', 1, 0, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);

-- HVAC --
set @last_id = eetdb.add_template('HVAC', 'Системы отопления, вентиляции и кондиционирования воздуха');
call add_template_property(@last_id, 'HVAC_TYPE', 'Тип ', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'м3/ч', 1, 0, 1);

-- GLAZING --
set @last_id = eetdb.add_template('GLAZING', 'Окна и остекление');
call add_template_property(@last_id, 'GLAZING_TYPE', 'Тип остекления', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'FACTOR', 'Коэффициент теплопередачи', 'NUMBER', 'Вт/[м2/K]', 1, 0, 1);

-- INSULATION --
set @last_id = eetdb.add_template('INSULATION', 'Изоляция зданий');
call add_template_property(@last_id, 'INSULATION_TYPE', 'Тип изоляции', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'WIDTH', 'Толщина', 'NUMBER', 'мм', 1, 0, 1);

-- GATE --
set @last_id = eetdb.add_template('GATE', 'Высокоскоростные ворота');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'AREA', 'Площадь', 'NUMBER', 'м2', 1, 0, 1);

--  --
set @last_id = eetdb.add_template('', '');
call add_template_property(@last_id, '_TYPE', 'Тип ', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'м3/ч', 1, 0, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);

-- TEMPLATE VENDOR --
set @last_id = eetdb.add_template('VENDOR', 'Производитель');
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Сайт компании', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'URL', '', 0, 1, 1);
call add_template_property(@last_id, 'ADDRESS', 'Адрес', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'PHONE', 'Телефон', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'TEXT', '', 0, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR', 'Дистрибьютор в России', 'STRING', '', 1, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_URL', 'Сайт дистрибьютора в России', 'STRING', '', 1, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_ADDRESS', 'Адрес дистрибьютора', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_PHONE', 'Телефон дистрибьютора', 'STRING', '', 0, 1, 0);

commit;
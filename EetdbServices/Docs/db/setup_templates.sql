-- -------------------------------------------------------------------
-- fill TEMPLATES
-- -------------------------------------------------------------------
set @last_id = eetdb.add_template('ARTICLE', 'Описание технологии', 0);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'TEXT', 'Полное описание', 'TEXT', '', 1, 1, 0);
call add_template_property(@last_id, 'ECONOMY_PERCENT', 'Процент экономии ресурса', 'NUMBER', '%', 1, 1, 1);
call add_template_property(@last_id, 'ECONOMY_COMMENT', 'Условия экономии ресурса', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- TEMPLATE PIPE --
set @last_id = eetdb.add_template('PIPE', 'Труба', 0);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'DIAMETER', 'Номинальный диаметр', 'NUMBER', 'мм', 1, 1, 1);
call add_template_property(@last_id, 'DIAMETER_MIDDLE', 'Внешний диаметр средней трубы', 'NUMBER', 'мм', 1, 1, 0);
call add_template_property(@last_id, 'DIAMETER_OUT', 'Внешний диаметр обсадной трубы', 'NUMBER', 'мм', 1, 1, 0);
call add_template_property(@last_id, 'LAMBDA', 'Коэффициент', 'NUMBER', 'Вт/мК', 0, 0, 0);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- TEMPLATE BOILER --
set @last_id = eetdb.add_template('BOILER', 'Нагреватель воды', 0);
call add_template_property(@last_id, 'BOILER_TYPE', 'Тип нагревателя', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'FUEL', 'Топливо', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'STEAM_POWER', 'Мощность пара', 'NUMBER', 'кг/ч', 1, 1, 0);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- TEMPLATE BIO_BOILER --
set @last_id = eetdb.add_template('BIO_BOILER', 'Котел на биомассе', 0);
call add_template_property(@last_id, 'BIO_BOILER_TYPE', 'Тип котла', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'BIO_FUEL', 'Топливо', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- TEMPLATE BOILERS_BLOCK --
set @last_id = eetdb.add_template('BOILERS_BLOCK', 'Блочные котельные', 0);
call add_template_property(@last_id, 'BOILERS_BLOCK_TYPE', 'Тип котельной', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'FUEL', 'Топливо', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'STEAM_POWER', 'Мощность пара', 'NUMBER', 'кг/ч', 1, 1, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- TEMPLATE BURNER --
set @last_id = eetdb.add_template('BURNER', 'Жидкотопливная/газовая горелка', 0);
call add_template_property(@last_id, 'BURNER_TYPE', 'Тип горелки', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'FUEL', 'Топливо', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Выходная мощность', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- HEAT_PUMP --
set @last_id = eetdb.add_template('HEAT_PUMP', 'Тепловой насос', 0);
call add_template_property(@last_id, 'HEAT_PUMP_TYPE', 'Тип насоса', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'HEAT_SOURCE', 'Тепловой источник', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 1, 1);
call add_template_property(@last_id, 'HEAT_CAPACITY', 'Теплоемкость', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'COOL_CAPACITY', 'Хладопроизводительность', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'HEATING_PI', 'Коэффициент производительности (отопление)', 'NUMBER', '', 1, 1, 1);
call add_template_property(@last_id, 'COOLING_PI', 'Коэффициент производительности (охлаждение)', 'NUMBER', '', 1, 1, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- SOLAR_WATERHEATER --
set @last_id = eetdb.add_template('SOLAR_WATERHEATER', 'Солнечный водонагреватель', 0);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Объем', 'NUMBER', 'л', 1, 1, 1);
call add_template_property(@last_id, 'AREA', 'Площадь', 'NUMBER', 'кв.м.', 1, 1, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- INFRARED_GAS_HEATER --
set @last_id = eetdb.add_template('INFRARED_GAS_HEATER', 'Инфракрасный газовый нагреватель', 0);
call add_template_property(@last_id, 'INFRARED_GAS_HEATER_TYPE', 'Тип нагревателя', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 1, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- MICRO_HYDRO_TURBINE --
set @last_id = eetdb.add_template('MICRO_HYDRO_TURBINE', 'Микро ГЭС', 0);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- MICRO_WIND_TURBINES --
set @last_id = eetdb.add_template('MICRO_WIND_TURBINES', 'Микро ВЭУ', 0);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- PHOTOVOLTAIC_SYSTEM --
set @last_id = eetdb.add_template('PHOTOVOLTAIC_SYSTEM', 'Фотоэлектрическая система', 0);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'AREA', 'Площадь', 'NUMBER', 'кв.м.', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- SMALL_SCALE_CHP --
set @last_id = eetdb.add_template('SMALL_SCALE_CHP', 'Мини-когенерационная установка', 0);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'FUEL', 'Топливо', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Электрическая мощность', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'ELECTRIC_PI', 'Электрический КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'HEAT_CAPACITY', 'Теплоемкость', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'PI', 'Общий КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- TRANSFORMER --
set @last_id = eetdb.add_template('TRANSFORMER', 'Трансформатор', 0);
call add_template_property(@last_id, 'TRANSFORMER_TYPE', 'Тип трансформатора', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВА', 1, 0, 1);
call add_template_property(@last_id, 'PRIMARY_VOLTAGE', 'Первичное напряжение', 'NUMBER', 'V', 1, 0, 1);
call add_template_property(@last_id, 'SECONDARY_VOLTAGE', 'Вторичное напряжение', 'NUMBER', 'V', 1, 0, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- COMPENSATOR --
set @last_id = eetdb.add_template('COMPENSATOR', 'Компенсатор реактивной мощности', 0);
call add_template_property(@last_id, 'COMPENSATOR_TYPE', 'Тип компенсатора', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВАр', 1, 0, 1);
call add_template_property(@last_id, 'VOLTAGE', 'Напряжение', 'NUMBER', 'V', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- EXHAUST_GAS_BOILER  --
set @last_id = eetdb.add_template('HEAT_EXCHANGER', 'Теплообменник', 0);
call add_template_property(@last_id, 'HEAT_EXCHANGER_TYPE', 'Тип теплообменника', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PRIMARY_MEDIUM', 'Первичная среда', 'REFERENCE', '', 1, 0, 1);
call add_template_property(@last_id, 'SECONDARY_MEDIUM', 'Вторичная среда', 'REFERENCE', '', 1, 0, 1);
call add_template_property(@last_id, 'PRESSURE', 'Максимальное давление', 'NUMBER', 'бар', 1, 0, 1);
call add_template_property(@last_id, 'TEMPERATURE_MAX', 'Максимальная температура', 'NUMBER', '°C', 1, 0, 1);
call add_template_property(@last_id, 'TEMPERATURE_DIFF', 'Перепад температур', 'NUMBER', '°C', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- COMPRESSOR --
set @last_id = eetdb.add_template('COMPRESSOR', 'Компрессор', 0);
call add_template_property(@last_id, 'COMPRESSOR_TYPE', 'Тип компрессора', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'Нм3/ч', 1, 0, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- AIR_RECEIVER --
set @last_id = eetdb.add_template('AIR_RECEIVER', 'Резервуар сжатого воздуха', 0);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Объем', 'NUMBER', 'Нм3', 1, 0, 1);
call add_template_property(@last_id, 'PRESSURE', 'Давление', 'NUMBER', 'бар', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- DESICCANT_DRYER --
set @last_id = eetdb.add_template('DESICCANT_DRYER', 'Осушитель сжатого воздуха', 0);
call add_template_property(@last_id, 'DESICCANT_DRYER_TYPE', 'Тип осушителя', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'Нм3/ч', 1, 0, 1);
call add_template_property(@last_id, 'PRESSURE', 'Давление', 'NUMBER', 'бар', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- ENGINE --
set @last_id = eetdb.add_template('ENGINE', 'Двигатель', 0);
call add_template_property(@last_id, 'ENGINE_IE_CLASS', 'Класс двигателя', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'VOLTAGE', 'Напряжение', 'NUMBER', 'V', 1, 0, 1);
call add_template_property(@last_id, 'POLES', 'Количество полюсов', 'NUMBER', '', 1, 0, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- DRIVE --
set @last_id = eetdb.add_template('DRIVE', 'Частотный преобразователь электроприводов', 0);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'VOLTAGE', 'Напряжение', 'NUMBER', 'V', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- PUMP --
set @last_id = eetdb.add_template('PUMP', 'Насос', 0);
call add_template_property(@last_id, 'PUMP_TYPE', 'Тип насоса', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'м3/ч', 1, 0, 1);
call add_template_property(@last_id, 'PRESSURE', 'Максимальное давление', 'NUMBER', 'бар', 1, 0, 1);
call add_template_property(@last_id, 'HEAD', 'Напор', 'NUMBER', 'м', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- FAN --
set @laChillerst_id = eetdb.add_template('FAN', 'Вентилятор', 0);
call add_template_property(@last_id, 'FAN_TYPE', 'Тип вентилятора', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'м3/ч', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- CHILLER --
set @last_id = eetdb.add_template('CHILLER', 'Чиллер для холодильных камер', 0);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'кВт', 1, 0, 1);
call add_template_property(@last_id, 'TEMPERATURE', 'Температура охлаждения', 'NUMBER', '°C', 1, 0, 1);
call add_template_property(@last_id, 'PI', 'КПД', 'NUMBER', '%', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- HVAC --
set @last_id = eetdb.add_template('HVAC', 'Системы вентиляции и кондиционирования', 0);
call add_template_property(@last_id, 'HVAC_TYPE', 'Тип системы', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'CAPACITY', 'Мощность', 'NUMBER', 'м3/ч', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- GLAZING --
set @last_id = eetdb.add_template('GLAZING', 'Окна и остекление', 0);
call add_template_property(@last_id, 'GLAZING_TYPE', 'Тип остекления', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'FACTOR', 'Коэффициент теплопередачи', 'NUMBER', 'Вт/[м2/K]', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- INSULATION --
set @last_id = eetdb.add_template('INSULATION', 'Изоляция зданий', 0);
call add_template_property(@last_id, 'INSULATION_TYPE', 'Тип изоляции', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'WIDTH', 'Толщина', 'NUMBER', 'мм', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- GATE --
set @last_id = eetdb.add_template('GATE', 'Высокоскоростные ворота', 0);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'AREA', 'Площадь', 'NUMBER', 'м2', 1, 0, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- LIGHTING --
set @last_id = eetdb.add_template('LIGHTING', 'Светильники', 0);
call add_template_property(@last_id, 'LIGHTING_TYPE', 'Тип светильника', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- MONITORING --
set @last_id = eetdb.add_template('MONITORING', 'Система мониторинга', 0);
call add_template_property(@last_id, 'MONITORING_TYPE', 'Тип системы мониторинга', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- SEED_DRYER --
set @last_id = eetdb.add_template('SEED_DRYER', 'Зерносушилка', 0);
call add_template_property(@last_id, 'SEED_DRYER_TYPE', 'Тип зерносушилки', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- CASE --
set @last_id = eetdb.add_template('AGRO_GPS', 'С/Х Техника с GPS', 0);
call add_template_property(@last_id, 'AGRO_GPS_TYPE', 'Тип техники', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'STRING', '', 0, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Описание', 'HTML', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR_CODE', 'Код в каталоге производителя', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'VENDOR', 'Производитель', 'REFERENCE', '', 1, 1, 1);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

-- TEMPLATE VENDOR --
set @last_id = eetdb.add_template('VENDOR', 'Производитель', 0);
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'STRING', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Сайт компании', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'URL', '', 0, 1, 1);
call add_template_property(@last_id, 'ADDRESS', 'Адрес', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'PHONE', 'Телефон', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Детальное описание', 'TEXT', '', 0, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR', 'Дистрибьютор в России', 'STRING', '', 1, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_URL', 'Сайт дистрибьютора в России', 'STRING', '', 1, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_ADDRESS', 'Адрес дистрибьютора', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_PHONE', 'Телефон дистрибьютора', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'IMAGE', 'Иллюстрация', 'IMG', '', 0, 0, 0);
call add_template_property(@last_id, 'DOCUMENT', 'Документ', 'FILE', '', 0, 0, 0);

commit;
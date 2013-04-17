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
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
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
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
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
call add_template_property(@last_id, 'PICTURE', 'Изображение', 'URL', '', 0, 0, 0);
call add_template_property(@last_id, 'URL', 'Оригинальный источник', 'URL', '', 1, 1, 1);
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
call add_template_property(@last_id, 'URL', 'Сайт компании', 'URL', '', 1, 1, 1);
call add_template_property(@last_id, 'DESCRIPTION', 'Краткое описание', 'URL', '', 0, 1, 1);
call add_template_property(@last_id, 'ADDRESS', 'Адрес', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'PHONE', 'Телефон', 'STRING', '', 1, 1, 1);
call add_template_property(@last_id, 'DETAILS', 'Дополнительные характеристики', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR', 'Дистрибьютор в России', 'STRING', '', 1, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_URL', 'Сайт дистрибьютора в России', 'STRING', '', 1, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_ADDRESS', 'Адрес дистрибьютора', 'STRING', '', 0, 1, 0);
call add_template_property(@last_id, 'DISTRIBUTOR_PHONE', 'Телефон дистрибьютора', 'STRING', '', 0, 1, 0);

commit;
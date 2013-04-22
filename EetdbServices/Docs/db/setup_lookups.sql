-- -------------------------------------------------------------------
-- fill LOOKUPS
-- -------------------------------------------------------------------
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

set @last_id = eetdb.add_template('TRANSFORMER_TYPE', 'Тип трансформатора');
set @last_id = eetdb.add_entity('TRANSFORMER_TYPE', 'Сухой');
set @last_id = eetdb.add_entity('TRANSFORMER_TYPE', 'Масляный');

commit;

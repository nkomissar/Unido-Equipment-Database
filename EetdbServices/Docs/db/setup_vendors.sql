-- -------------------------------------------------------------------
-- fill VENDORS
-- -------------------------------------------------------------------
set @last_id = eetdb.add_entity('VENDOR', 'Adrian Group');
call add_entity_property(@last_id, 'PICTURE', 'http://www.adrian.eu/images/parts/logo.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.adrian.eu', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания предлагает комплексную систему отопления, которая состоит не только из газовых инфракрасных обогревателей и тепловоздушных агрегатов собственного производства, но и включает системы управления, приборы дестратификации и рекуперации, мониторинг, оптимизацию, а также элементы оценки качества окружающей среды и безопасности.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, null, null, null);
call add_entity_property(@last_id, 'ADDRESS', 'ADRIAN GROUP s.r.o. Lazovná 53 97401 Banská Bystrica Slovakia', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+421 48 471 04 44', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'AL-KO Lufttechnik');
call add_entity_property(@last_id, 'PICTURE', 'http://www.al-ko.com/layout/alko_logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.al-ko.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
call add_entity_property(@last_id, 'DETAILS', '', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', 'AL-KO Therm GmbH Maschinenfabrik Postfach 51 D-89343 Jettingen Scheppach, Germany', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+49 (8221) 97-0', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Avogadro Energy S.R.L.');
call add_entity_property(@last_id, 'PICTURE', 'http://www.avogadroenergy.com/immagini/logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.avogadroenergy.com ', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания производит: <ul><li>паровые котлы и парогенераторы</li><li>водогрейные котлы и котлы для производства перегретой воды</li><li>котлы на диатермическом масле (котлы с ВОТ)</li><li>котлы-утилизаторы и теплообменники</li><li>когенерационные установки</li><li>твердотопливные котлы и установки</li><li>контейнерные котельные</li><li>установки для обработки воды</li></ul>', null, null, null);
call add_entity_property(@last_id, 'DETAILS', '', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', 'Galleria Crispi, 41 Vicenza 36100 Italy IT02479590800', null, null, null);
call add_entity_property(@last_id, 'PHONE', '(+39) 030 294861', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'AVS Aggregatebau GmbH');
call add_entity_property(@last_id, 'PICTURE', 'http://www.avs-aggregatebau.de/images/kopf_home.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.avs-aggregatebau.de', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
call add_entity_property(@last_id, 'DETAILS', '', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', 'AVS Salemstraße 43 89584 Ehingen Germany', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+49 (0)7393 9507', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Bosch');
call add_entity_property(@last_id, 'PICTURE', '', null, null, null);
call add_entity_property(@last_id, 'URL', '', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
call add_entity_property(@last_id, 'DETAILS', '', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', 'Bosch Thermotechnik GmbH 35576 Germany, Wetzlar, Sophienstrasse 30-32', null, null, null);
call add_entity_property(@last_id, 'PHONE', '', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Buderus');
call add_entity_property(@last_id, 'PICTURE', 'http://www.buderus.ua/images/logo_big.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.buderus.ua/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Buderus предлагает компаниям, работающим в сфере отопления, широкий спектр продукции, а также обеспечивает надежный сервиси информационную поддержку.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', '', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', 'Киев 02660, ул. Крайня 1', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+38-044-390-71-93 ', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Capstone');
call add_entity_property(@last_id, 'PICTURE', '', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.capstoneturbine.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Capstone Turbine Corporation® is the world''s leading producer of low-emission microturbine systems, and was first to market with commercially viable air bearing turbine technology. The company has shipped thousands of Capstone turbines to customers worldwide. These award-winning systems have logged millions of documented runtime operating hours.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Capstone is a member of the U.S. Environmental Protection Agency''s Combined Heat and Power Partnership which is committed to improving the efficiency of the nation''s energy infrastructure and reducing emissions of pollutants and greenhouse gases.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '21211 Nordhoff Street Chatsworth, CA 91311 United States', null, null, null);
call add_entity_property(@last_id, 'PHONE', '1 818 734 5300', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'CASE');
call add_entity_property(@last_id, 'PICTURE', 'http://www.caseih.com/PublishingImages/landing/images/logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.caseih.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Бренд Case IH представляет собой традицию лидерства. Это комбинация больших сельскохозяйственных машиностроительных предприятий и брендов, в том числе CASE, International Harvester и David Brown и другие.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Каждый из брендов играет важную роль в истории и эволюции Case IH. За эти годы многое изменилось, но легендарный красный бренд всегда будет представлять собой стремление сделать сельхозпроизводителей успешными.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Case IH Max Service c/o CNH America LLC 621 State Street Racine, WI 53404', null, null, null);
call add_entity_property(@last_id, 'PHONE', '(813) 631-0000', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'CINK Hydro - Energy k. s.');
call add_entity_property(@last_id, 'PICTURE', 'http://www.cink-hydro-energy.com/gfx/headers/foot_cz.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.cink-hydro-energy.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Наша компания принадлежит к лидерам в области поставок технологического оборудования для малых и средних гидроэлектростанций. Команда разработчиков компании CINK Hydro-Energy поставила перед собой задачу совместно со своими заказчиками превратить водный потенциал во всем мире в рентабельный и экологически щадящий по отношению к окружающей природной среде источник энергии.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Мы являемся одной из нескольких компаний в мире, которые располагают ноу-хау, необходимым для проведения технически хорошо обеспеченных поставок всех известных типов турбин, таких как турбина «Crossflow» (проточная), поворотнолопастная турбина (турбина Каплана), ковшовая турбина (турбина Пелтона) и радиально-осевая турбина (турбина Френсиса), до 3 МВт единичной мощности. Кроме того, компания «CINK Hydro-Energy» специализируется на установке гидроэлектростанций в системах питьевой воды, и для этой цели имеет ряд лицензий.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Lesov 125 360 01 Sadov Česká Republika', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+420 353 579 154', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Clayton Industries');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_104.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.claytonindustries.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'С момента своего основания 20 октября 1930 года, компания Clayton Industries получила всемирную известность как ведущий производитель оборудования для промышленного производства технологического пара с использованием традиционных топливосжигающих котлов и котлов, работающих на отходящих газах.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Их уникальная контролируемая циркуляция потоков в комбинации с противоточным дизайном предлагает множество эксплуатационных преимуществ и выгод по сравнению с традиционными котлами. Принципы проектирования и разработок Clayton Industries, с использованием новейших технологий в системах управления, делает их выгодным техническим решением на многих рынках энергоэффективного оборудования.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Clayton Industries 17477 Hurley Street City of Industry CA 91744 USA Clayton of Belgium NV Rijksweg 30 2880 Bornem, Belgium', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+32 (0)3 890 57 00', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'CLINT');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_133.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.clint.it', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Отличительные особенности компании CLINT - 25-летний опыт работы на рынке кондиционирования и сильный предпринимательский дух. Мы предлагаем наилучший вариант максимально гибких и высокотехнологичных решений.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Сильная сторона CLINT - это умение предоставлять заказчику индивидуально разработанные решения задач любой сложности, по самым специфическим запросам, особенно для больших объектов. Благодаря огромному опыту в области централизованного кондиционирования воздуха, с использованием передовых технологий, а ткже ряда инновационных научно-исследовательских и опытно-конструкторских решений, компания CLINT проектирует и разрабатывает для заказчиков всеобъемлющий диапазон интегрированных машин для центрального кондиционирования воздуха жилых, торговых и промышленных зданий, предоставляя обширную сеть пред- и послепродажного сервиса, охватывающую большинство Европейских стран.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Via Max Piccini 11/13 - 33050 RIVIGNANO (UD) ITALY', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+39 0432 823011', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'COSMOGAS S.r.l.');
call add_entity_property(@last_id, 'PICTURE', '', null, null, null);
call add_entity_property(@last_id, 'URL', 'www.cosmogas.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Фирма «COSMOGAS» занимается изготовлением отопительной техники в течении сорока лет. В научно-исследовательском центре работают высококвалифицированные специалисты, которые обоснованно и выверено воплощают новые технические идеи в конструкции котлов. В ассортименте имеются газовые котлы мощностью от 15 до 40 кВт и термические модули конденсационного типа мощностью до 720 кВт.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', '', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', 'Via L. Da Vinci 16, 47014 Meldola (FC)', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+39 0543 49.83.83', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'De Dietrich Thermique');
call add_entity_property(@last_id, 'PICTURE', 'http://www.dedietrich-heating.com/design/ddth/images/logo_dedietrich.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.dedietrich-heating.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'De Dietrich Thermique - один из ведущих мировых производителей отопительной техники и номер один во Франции. Экономия энергии и защита окружающей среды многие годы являются приоритетными направлениями  развития компании. Во Франции и за ее пределами De Dietrich Thermique насчитывает более 2 000 сотрудников.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '<p>Годовой  оборот компании составляет более 400 миллионов евро. В 2004 году была образована промышленная группа  с целью занять место среди пяти крупнейших производителей отопительного оборудования.</p><p>С 2009 года De Dietrich-Remeha входит в состав холдинга BDR Thermea - ведущего мирового производителя и поставщика инновационных систем отопления и горячего водоснабжения. Компания представлена более чем в 60-ти странах.</p><p>Объем продаж De Dietrich-Remeha 300 000 котлов в год: твердотопливных, низкотемпературных на жидком топливе и газе, в том числе 2/3  конденсационных.</p>', 'HTML', null);
call add_entity_property(@last_id, 'ADDRESS', '57, rue de la Gare – B.P. 30, 67580 MERTZWILLER, France', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+33-388-802-791', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Efaflex');
call add_entity_property(@last_id, 'PICTURE', 'http://www.efaflex.com/fileadmin/templates/images/logo.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.efaflex.com/ru/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'EFAFLEX - Ворота и системы безопасности', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Выбирая высокоскоростные ворота компании EFAFLEX, Вы выбираете лучшую в мире технологию и получаете эксклюзивную выгоду от нашего технического превосходства. Собственные научно-исследовательские и опытно-конструкторские разработки являются важной составляющей философии компании EFAFLEX. Так мы заботимся о постоянном прогрессе. Быть признанным лидером в сфере технологий непросто, но мы продолжаем разрабатывать революционные воротные системы. Наша сбытовая система охватывает все пять континентов, а дочерние предприятия находятся в Германии, Австрии, Словении, Чехии, Польше, Нидерландах и Японии.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Fliederstrasse 14 | 84079 Bruckberg | Germany', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+49 8765 82-0', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Flexalen');
call add_entity_property(@last_id, 'PICTURE', 'http://euroterm.com/uploads/category_images/8_1.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.thermaflex.ru', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '49-летнюю гарантию в РФ предоставляет Международный холдинг Thermaflex на теплоизоляционные материалы «Thermaflex» и гибкие теплоизолированные трубы из полибутена «Flexalen». Гарантия обеспечивается производителем совместно с международным страховым холдингом «Chartis Europe S.A.».', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '141100,  Московская  обл., г. Щелково, Пролетарский пр-т,  д. 10,  ТЦ Щелково', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+7 495 981-11-50', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Giersch');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_74.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.giersch.de/?mi=3', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'В 1951 году фирма была основана предпринимателем Райнхольдом Гирш. В 1954 году Райнхольт Гирш приступил к выпуску горелок на жидком топливе, переняв производство у американской фирмы. Отопление на жидком топливе в то время было для Германии сенсационным новшеством. Это была работа сравнимая с работой первооткрывателей.
В отличие от большинства других поставщиков горелок на немецкий рынок, Гирш решил не только продавать, но и производить монтаж с обслуживанием своих горелок. Почти до 70 годов было не видно в каком направлении пойдёт отрасль. И только потом стало ясно, что Гирш выбрал правильное направление и что покупатели, которые один раз попробовали отопительные агрегаты с набором сервисного обслуживания, стали постоянными клиентами.
Гирш стал не только продавать старые, но и разрабатывать и производить новые горелки. Первая разработанная горелка была показана на выставке во Франкфурте-на-Майне 30 лет назад. Первое производство было организовано в арендованных помещениях, но постоянный рост производства позволил Гиршу построить в 1966 г. свои первые производственные помещения на 1000 м2. Эти производственные площади были в 1977 удвоены.
Фирма имеет 21 представительство по Германии, из них 3 в новых землях. Квалифицированные специалисты не только продают, но и могут всегда дать технически грамотный совет касательно монтажа и обслуживания. Большое значение фирма Гирш придаёт повышению квалификации обслуживающего персонала. В 1996 году на курсах повышения квалификации приняло участие около 1000 человек. Уже в 1997 году было продано более 60000 горелок. Количество проданных горелок на газе составило 12%.
Экспорт составляет около 35 %. В Швейцарии Гирш имеет дочернее предприятие. В Бельгии фирма Гирш продаёт свои изделия через одну из крупнейших в стране специализированных торговых фирм. Успешная реализация своей продукции позволила фирме Гирш подняться на 3 место среди производителей горелок. Горелки экспортируются более чем в 22 страны.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Adjutantenkamp, 18 58675 Hemer GERMANY', null, null, null);
call add_entity_property(@last_id, 'PHONE', '(02372) 965-0', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'GRIDMANAGER');
call add_entity_property(@last_id, 'PICTURE', 'http://www.gridmanager.dk/image/data/basisgrafik/logo_gridmanager.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'www.gridmanager.dk', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '"ЕСЛИ ВЫ НЕ МОЖЕТЕ ОБЪЕКТ ИЗМЕРИТЬ, ВЫ НЕ СМОЖЕТЕ ЕГО УЛУЧШИТЬ!"', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'GridManager дает вашей компании детальный анализ затрат на отдельные электронные блоки. Она служит основой для однозначного, быстрого выявления потенциальных сбережений. GridManager становится даже еще умнее благодаря тому, что система позволяет автоматизировать энергопотребление компании для того, чтобы клиентам можно было воспользоваться преимуществами низких тарифов на энергоносители (ночью, например), и свести к минимуму потребление, когда цена высокая. В будущем умные потребители смогут иметь определенное преимущество с системой GridManager: 
- Обеспечивает детальный анализ потребления энергии;
- Гарантирует сохранение данных по потреблению;
- Использует динамические цены таким образом, что колебания цен на энергоносители могут быть использованы в интересах клиента.
GridManager - это гораздо больше, чем просто система мониторинга. Это новое поколение систем управления энергорессурсами.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'GRID MANAGER A/S, Livøvej 21, 8800 Viborg', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+45 5077 0170', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Horus Energia');
call add_entity_property(@last_id, 'PICTURE', 'http://www.horus-energia.pl/dokumenty/szablonyimg/7-logo_horus.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.horus-energia.pl/portal/her/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'HORUS-ENERGIA работает на рынке автономного и резервного питания электроэнергией. Предлагаем всё, что связано с электроагрегатами и UPS, начиная от подбора оборудования, далее приготовление необходимых проектов и согласований, поставка оборудования, комплексный монтаж и установка, запуск оборудования, дальнейший сервис гарантийный и послегарантийный.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '<p>Наш опыт и компетентность подтверждает обширный референционный лист . На данный момент находится на нём около 1200 объектов, из которых 80 % - это специализированный монтаж электроагрегатов.</p>
<p>Специализированный монтаж –это комплексное исполнение застройки помещения под агрегат и установка необходимого для работы агрегата оборудования: автоматической вентиляции, системы подачи топлива, распределительные устройства, шкафы АВР (автоматического включения резерва) и т.п.</p>
<p>Предлагаемое нами качество услуг, опыт персонала и эластичная ценовая политика позволили нам соискать клиентов и потребителей в разных отраслях: телекоммуникация, банки, офисные здания, больницы, супурмаркеты, промышленные и военные объекты и много других.</p>
<p>О высоком качестве деятельности нашей фирмы свидетельствует факт признания нам права продажи, монтажа и сервиса продукции фирмы FG Wilson.</p>
<p>В след за количеством проданных и установленных агрегатов идёт исправно работающий, опытный и специалистический сервис. В отделе сервиса работают специалисты, которые имеют многолетнюю практику в обслуживании и сервисе агрегатов. Их знания, опыт и умения всё время развиваются во время участия в различных курсах и обучении.</p>
<p>Наши сервисные бригады предлагают свою помощь 24 часа в сутки на протяжении всего года. Бесперебойное функционирование авторизированного сервиса агрегатов фирмы FG Wilson гарантирует также постоянно пополняющийся склад запчастей.</p>
<p>Много фирм, которые регулярно пользуются нашими услугами, также используют услуги нашего сервисного центра.</p>', 'HTML', null);
call add_entity_property(@last_id, 'ADDRESS', 'P.P.U.H. Horus-Energia Sp. z o.o., Drobiarska 43 Str., 05-070 Sulejówek, Poland', null, null, null);
call add_entity_property(@last_id, 'PHONE', '(022) 33 15 310', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'IMBAT');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_132.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.imbat.com/Default.aspx', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Уже 21 год компания IMBAT не сдает своих позиций в индустрии холодильного оборудования, благодаря высокому качеству своих продуктов. IMBAT представляет проверенные торговые марки, заключая дистрибьюторские соглашения, основываясь на долгосрочных партнерских отношениях.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '<p>В своей отрасли IMBAT рад предложить уникальный дизайн и разнообразие продуктов, ведь с самого момента основания компания вкладывала свои усилия в проведение научно-исследовательских и опытно-конструкторских работ.</p>
<p>Стремительное развитие IMBAT обеспечивается качеством продуктов и услуг, которые предоставляются более чем 50 дилерами, а также эффективностью сети обслуживания на внутреннем рынке и растущими объемами экспортных продаж.</p>
<p>Продукция компании поставляется покупателю только после проведения контроля качества производства.</p>
<p>Основами деятельности компании IMBAT является абсолютное удовлетворение потребностей клиента, чему способствует сертификация в соответствии с системой управления качества ISO 9001:2000.Так же компания обладает великолепной технологической базой, позволяющей удовлетворять любые потребности рынка, быстро адаптироваться и идти в ногу со временем.</p> ', 'HTML', null);
call add_entity_property(@last_id, 'ADDRESS', 'Atatürk Mh. 62. Sk. No:16 Ulucak, Kemalpaşa İZMİR, Turkey', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+90 232 877 21 01', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'IMP Pumps');
call add_entity_property(@last_id, 'PICTURE', 'http://imp-pumps.com/media/dsg/header.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://imp-pumps.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания IMPPUMPSd.o.o. – словенский производитель насосов и насосных установок, расположенный в Иге около Любляны (IgpriLjubljani). Компания проектирует, разрабатывает, производит, распространяет и обслуживает насосы и насосные установки.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Используя дополнительную программу товаров и услуг стратегических партнеров, предприятие позиционирует себя как один из мировых лидеров по производству насосного оборудования. Располагая собственным производственный и научный потенциал компания вносит свои решения в разработку и решение проблем, связанных с транспортировкой жидких веществ, обеспечивая тем самым комфорт в домашней обстановке и оптимальные условия труда на производстве.
IMPPUMPSреализует более 90% от общего объема производства более чем в 50 стран мира. Предприятие является новатором по производству энергосберегающих насосов соответствующих всем требованиям энергетической эффективности которые будут введены в Европе с января 2013 года и еще более усилены в 2015 году.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'IMP PUMPS d.o.o.
Zagorica 18
1292 Ig
Slovenia', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+386 (0)1 28 06 400', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Isover');
call add_entity_property(@last_id, 'PICTURE', 'http://www.isover.com/var/isover_com/storage/images/logo-isover-home.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.isover.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'ISOVER – абсолютный лидер в производстве и продаже тепловой изоляции и занимает первое место в мире на рынке теплоизоляционных материалов.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Les Miroirs 18, avenue d''Alsace 92400, Courbevoie, France', null, null, null);
call add_entity_property(@last_id, 'PHONE', '', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Kalvis UAB');
call add_entity_property(@last_id, 'PICTURE', 'http://www.kalvis.lt/images/logo_lt.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.kalvis.lt', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Ассортимент серийного производства ЗАО Kalvis составляют более 150 видов твердотопливных котлов. Все серийные изделия испытаны и сертифицированы по требованиям стандартов ЕС, России, Белоруссии и Украины.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Pramonės g. 15, LT-78135, Šiauliai, Lietuva', null, null, null);
call add_entity_property(@last_id, 'PHONE', '(8-41) 540-562', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'KBE');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_89.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.kbe-online.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Немецкая марка КБЕ – лидер на российском рынке производителей и поставщиков высокотехнологичного пластикового профиля для оконных и дверных систем.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'profine GmbH, KBE Fenstersysteme, Motzener Straße 31-33, D-12277 Berlin', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+49 (0) 30 / 8 68 73 - 0', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'ЗАО "профайн РУС"', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.kbe.ru', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', '115419, Москва, 2-ой Рощинский проезд, д. 8, стр. 6', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '(495) 232-93-30', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'KMZ Industries');
call add_entity_property(@last_id, 'PICTURE', 'http://www.kmz.pl.ua/img/logo.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.kmz.pl.ua', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'KMZ INDUSTRIES (КМЗ) – лидирующий поставщик комплексных решений для отрасли хранения и обработки зерна', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'ул. Пархоменко, 2, г. Карловка, Полтавская обл., 39500, Украина', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+380 (5346) 2-34-68', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'KÖMMERLING');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_91.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.koemmerling.com/ecomaXL/index.php?site=KOE_EN_home', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'KÖMMERLING - это премиум-марка среди производителей профильных систем. Предлагая широкий выбор профильных систем, и, используя самые современные материалы и технологии, KÖMMERLING предлагает своим партнерам уже готовые продуманные решения для изготовления оконных и дверных конструкций на самом высоком уровне.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'profine GmbH, P.O. Box 2165, D-66929 Pirmasens', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+ 49 6331 56 2592', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'ЗАО "профайн РУС"', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.kbe.ru', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', '115419, Москва, 2-ой Рощинский проезд, д. 8, стр. 6', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '(495) 232-93-30', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'LEDEL');
call add_entity_property(@last_id, 'PICTURE', 'http://www.ledel.ru/admin/img.php?img=../pic/tmain/123_4&w=174&h=45', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.ledel.ru', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Сфера деятельности компании LEDEL — разработка и производство светодиодных приборов освещения для различных областей применения: от общественных и офисных зданий до автотрасс и промышленных объектов.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Разработкой и созданием светодиодных светильников наша компания занимается с 2007 года, сразу после появления сверхярких светодиодов для освещения. Производством электронных компонентов и продукции на ее основе мы занимаемся с 2003 года. За это время мы накопили достаточный опыт, на котором и базируются инновационные разработки нашего предприятия в сфере светодиодных технологий.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '420095, Республика Татарстан, г.Казань, ул. Шамиля Усманова д.31а', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+7 (843) 544 0 544', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'LEDLIFE');
call add_entity_property(@last_id, 'PICTURE', 'http://www.ledlife.com.ua/assets/images/logo-main-me.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.ledlife.com.ua/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Ledlife - украинская компания, которая производит, проектирует и устанавливает системы светодиодного освещения.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Ассортимент нашей компании представлен широким спектром светодиодной продукции как бытового, офисного и промышленного применения, так и светильниками для наружного освещения, архитектурной подсветки и светильниками специального назначения.
Современное высокотехнологичное оборудование компании позволяет изготавливать светодиодные изделия нестандартных размеров и различных конфигураций по заказу клиентов. А собственная светотехническая лаборатория дает возможность проводить измерения фотометрических показателей выпускаемых изделий.
В своих изделиях мы используем светодиоды известных производителей, а также качественные комплектующие, которые проходят несколько этапов тестирования. Все это сочетается с конкурентоспособными ценами.
Качество наших светильников и ламп подтверждается официальной гарантией 3 года, кроме того имеется расширенная 5-летняя гарантия, что превышает срок окупаемости любого из наших проектов. Вся наша продукция сертифицирована.
Наши клиенты – крупные торговые и офисные центры, промышленные предприятия, а также ведущие предприятия агропромышленного комплекса Украины.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '61002, г.Харьков, ул. Клочковская, 111А, офис 2-8, Украина', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+38-057-701-24-28', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Logstor');
call add_entity_property(@last_id, 'PICTURE', 'http://www.logstor.com/assets/img/skin/logstor_logo.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.logstor.com/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания LOGSTOR - международная компания, уделяющая особое внимание вопросам эффективности передачи энергии потребителям. Компания имеет многолетний опыт и технологии в области теплоизоляции как средства повышения энергоэффективности.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Системы централизованного тепло- и холодоснабжения (особенно на базе комбинированного производства тепла и электричества) приобретают все большую популярность как наиболее энегоэффективный, безопасный, проверенный и экологически чистый способ отопления или охлаждения зданий.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Danmarksvej 11 DK-9670 Løgstør Denmark', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+45 99 66 10 00', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'MIDEA');
call add_entity_property(@last_id, 'PICTURE', 'http://www.midea.com./zh/images/website/logo.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.midea.ru/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'MIDEA представляет собой громадный конгломерат компаний по бытовой технике, строительству коммерческой и жилой недвижимости, транспортных и логистических компаний. MIDEA является одним из крупнейших производителей и экспортеров бытовой техники в Китае.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Компания Midea Holding Co. специализируется на выпуске кондиционеров различного класса. За 40 лет компания стала мировым лидером и ведущим специалистом в области климатики. Кондиционеры Midea продаются во всем мире и пользуются популярностью среди потребителей более чем 120 стран. Марке Midea доверяют за сочетание высокого качества техники, которое поддерживается из года в год, и постоянных инноваций. Внедрением инноваций и контролем качества занимается специально созданный исследовательский центр.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Midea Group ShunDe, FoShan, GuangDong China', null, null, null);
call add_entity_property(@last_id, 'PHONE', '', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Mitsubishi Electric');
call add_entity_property(@last_id, 'PICTURE', 'http://www.mitsubishielectric.ru/images/logo.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.mitsubishielectric.com/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Основные направления деятельности компании: энергетика и электрические системы, системы индустриальной автоматики, информационные и коммуникационные системы, оборудование для жилых домов, электронные устройства.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Программа Eco Changes отражает приверженность Mitsubishi Electric идее рационального природопользования и стремление компании сделать будущее экологически чистым благодаря новейшим технологиям и производственному ноу-хау. Используя различные технологические решения в создании продукции для использования в быту, промышленности и социальной сфере, компания нацелена на создание устойчивого, экологически чистого общества. Дополняя слоган компании Changes for the better («Перемены к лучшему»), отражающий постоянное стремление компании совершенствовать свою продукцию и услуги, слоган «Eco Changes — for a greener tomorrow» («Eco Changes — за зеленое завтра») представляет намерение Mitsubishi Electric в сотрудничестве со своими клиентами улучшать экологическую ситуацию во всем мире.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Tokyo Building 2-7-3, Marunouchi, Chiyoda-ku, Tokyo 100-8310, Japan', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+81 (3) 3218-2111', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'Представительство ЗАО «Мицубиси Электрик Юроп  Б. В.»', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.mitsubishielectric.ru', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', 'Космодамианская наб., д. 52, стр. 3', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', 'Космодамианская наб., д. 52, стр. 3', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'NEW HOLLAND');
call add_entity_property(@last_id, 'PICTURE', 'http://agriculture.newholland.com/PublishingImages/cnhimg/shared/logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://agriculture.newholland.com/us/en/Pages/Homepage.aspx', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания New Holland – один из мировых лидеров в производстве сельскохозяйственной техники и оборудования. New Holland является производителем широкого спектра сельскохозяйственных машин. В линейке моделей этой компании присутствуют тракторы, зернуборочные комбайны, пресс-подборщики, косилки, комбайны для уборки винограда и т.п.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'В своем нынешнем состоянии New Holland представляет собой объединение 4-х сельскохозяйственных брендов Ford, Fiat Trattori, Claeys и непосредственно New Holland. На сегодня New Holland является одним из главных новаторов в производстве сельхозтехники. В частности, с 2001 по 2010 год различная продукция компании получила более 30 премий за технические и инженерные инновации. Кроме того, на Парижской Сельскохозяйственной выставке в 2009 году компания представила прототип трактора на водордном топливе New Holland NH2.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'New Holland Agriculture, 120 Brubaker Avenue, New Holland, PA 17557', null, null, null);
call add_entity_property(@last_id, 'PHONE', '866-639-4563', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Petrokraft AB');
call add_entity_property(@last_id, 'PICTURE', 'http://www.petrokraft.com/wp-content/themes/petrokraft/images/petro.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'www.petrokraft.se', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Мировые энергетические ресурсы небезграничны. Мы, группа компаний Petro, занимаемся сложной задачей, с точки зрения охраны окружающей среды, по переводу различных видов топлива – как исчерпаемых, так и возобновляемых – в энергию для промышленного, коммерческого и бытового использования.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Являясь ответственным деловым партнером, мы стремимся не только к оптимизации производства энергии, но также и к снижению негативного воздействия на окружающую среду. Наша программа исследований и разработок, в сочетании с особенностями продукции и технологиями производства, помогает снизить вредное воздействие на окружающую среду, вызванное выбросами.
Наш подход к проектированию компонентов гарантирует соответствие всего ассортимента выпускаемой продукции самым строгим требованиям по уровню выбросов вредных веществ в атмосферу. Мы непрерывно работаем над совершенствованием методов эффективного использования энергетических ресурсов, которые не загрязняют окружающую среду.
Мы можем предложить вам продукцию и решения в следующих областях: § Горелки с низким выбросом NOx для жидкого топлива, газа и других видов топлива.
Передовые технологии сжигания измельченной биомассы, такой, как древесина, оливковые косточки, рапс и т.д.
Сжигание отходов, таких, как сланцевые масла, отходы нефтепереработки, судовой шлам.
Системы снижения выбросов NOx на основе разработанной нами технологии SNCR.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Box 52090, SE-400 25 GÖTEBORG, SWEDEN', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+46 31 83 06 80', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Philips');
call add_entity_property(@last_id, 'PICTURE', 'http://www.crsc.philips.com/crsc/images/mainlogo.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.philips.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Royal Philips Electronics of the Netherlands (Нидерланды) – это международная компания, работающая в индустрии «здоровья и благополучия» и нацеленная на улучшение жизни людей путем постоянного внедрения инноваций. Являясь мировым лидером в области здравоохранения, потребительских товаров и световых решений, Philips в своих технологических и дизайнерских решениях ориентируется на людей. Потребности потребителей и принцип «разумно и просто» лежат в основе всех разработок компании.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Потребности потребителей и принцип «разумно и просто» лежат в основе всех разработок компании. Штаб-квартира Philips находится в Нидерландах, 122 000 сотрудников работают в представительствах компании более чем в 100 странах мира.
Компания занимает лидирующие позиции в разработке оборудования для кардиологии, неотложной помощи и медицинского обслуживания на дому, в области энергоэффективных светотехнических решений и инновационных систем освещения, а также потребительских товаров для персонального ухода, задавая высокие стандарты в сегментах электробритв и  средств личной гигиены, портативных систем развлечения, а также приборов и средств для ухода за полостью рта.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Philips International B.V., Amstelplein 2, 1096 BC Amsterdam, The Netherlands', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+3120 59 77777', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Polytechnik');
call add_entity_property(@last_id, 'PICTURE', 'http://www.polytechnik.com/RU/images/logo-polytechnik-biomass-energy-245mm-72pp_sbp.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.polytechnik.com/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'POLYTECHNIK готовые «под ключ» котельные установки на биотопливе от всемирноизвестного профессионала.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Hainfelderstr. 69 Postcode/Town: A-2564 Weissenbach (NÖ) Austria (Lower Austria)', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+43/2672/890-0', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Progeny Solar');
call add_entity_property(@last_id, 'PICTURE', 'http://progenysolar.com/Progeny_Solar%28ru%29/Solnecnye_moduli_files/Screen%20shot%202012-07-31%20at%204.05.38%20AM.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://progenysolar.com/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Осуществляя свою деятельность в Европе, "Проджени Солар"  имеет ряд преимуществ. Основными из которых, является высокое качество солнечных панелей по доступным ценам и доставка в короткие сроки.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '"Проджени Солар" - это американская компания, основанная в штате Массачусетс, и с тех пор занимается производством в Европе. В каждый модуль мы вкладываем самые современные технологии и частичку души, заботясь о окружающей среде. Мы спроектировали солнечные модули и разработали процессы производства в Америке, и сейчас наши технологии  успешно применяется на производстве в Украине', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '115 Silver Leaf Way, Suite 21 Marlborough, MA 01752 USA', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+1 (617) 379-2912', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Rehau');
call add_entity_property(@last_id, 'PICTURE', 'http://www.rehau.com/contentblob/58/rehau_logo/data.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.rehau.com/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Помогать в строительстве и дизайне жилой и рабочей среды в инновативной форме – наша цель. Поэтому REHAU предлагает технологии будущего, доступные уже сегодня.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'С 1948 года полимерные инновации REHAU успешно применяются в строительстве, производстве мебели, автомобилестроении и других индустриях промышленности и каждый день обеспечивают комфорт миллионов людей с позиции «невидимого чемпиона» - скрытые от глаз системы надежно несут свою службу.
Комфортный климат в доме с нулевым энергопотреблением, стильный и функциональный дизайн мебели, безопасность управления автомобиля…Широкие возможности полимеров представляют безграничную свободу строителям, архитекторам, инженерам, производителям различных отраслей промышленности, а в конечном итоге – обеспечивают высокий уровень жизни конечным потребителям.
Снижение расходов при эксплуатации и строительстве являются ключевыми направлениями в работе REHAU, поскольку принципы «устойчивого развития» и зеленых технологий становятся неотъемлемой частью жизни в будущем каждого из нас. Энергоэффективное строительство возможно только при использовании материалов высокого качества и современных технологий.
Многообразие решений для мебельного дизайна закрепил позиции REHAU как лидера комплектующих материалов для мебели, которые обеспечивают максимальное сочетание эстетики и функции. Что позволяет отвечать  самым требовательным запросам и постоянно развивать дизайн и процесс производства кухонь, офисной мебели, ванных комнат и корпусной мебели.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'REHAU AG + Co Rheniumhaus Otto-Hahn-Straße 2 95111 Rehau Germany', null, null, null);
call add_entity_property(@last_id, 'PHONE', '8 800 555 33 55', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'REHAU МОСКВА', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.rehau.com/RU_ru/', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', '115088, г. Москва, ул. Угрешская д. 2, строение 15', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '+7 (495) 66 333 88', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Reticel Insulation');
call add_entity_property(@last_id, 'PICTURE', 'http://www.recticelinsulation.be/sites/all/themes/recticel960/logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'www.recticelinsulation.eu', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания Recticel Insulation - ведущий европейский производитель термоизоляционных плит из полиуретана (ПУР) и полиизоцианурата (ПИР). Инновационные технологии и современное производство, позволяют Recticel создавать продукцию с лучшими на рынке техническими характеристиками', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '<p>Инновационные технологии и современное производство, позволяют Recticel создавать продукцию с лучшими на рынке техническими характеристиками:</p>
<ul><li>Низкая теплопроводность &#8212; 50мм термоизоляции Recticel Insulation заменяют до 90мм минеральной ваты</li>
<li>Срок службы равный, a зачастую и превышающий срок службы здания</li>
<li>Неизменная форма в течение всего срока службы &#8212; не усаживается, не проседает, не подвержена гниению</li>
<li>Не впитывает и не пропускает влагу</li>
<li>Не поддерживает самостоятельного горения</li>
<li>Легкий вес и простота установки</li>
<li>Высочайшее качество и точность изготовления</li>
<li>Экологическая чистота и безопасность для потребителей</li></ul>', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Recticel Insulation, Tramstraat 6, 8560 Wevelgem', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+32(0)56 43 89 43', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'ООО «ЛИДЕР»', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://leader-spb.ru/', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', 'Санкт-Петербург, ул. Партизанская д.25', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '+7 (812) 646 71 08 ,  +7 (921) 438 25 27', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Riello S.p.A.');
call add_entity_property(@last_id, 'PICTURE', 'http://www.riellogroup.com/engines/images/logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.riellogroup.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '<p>Сегодня концерн RIELLO - это:</p><ul><li>Оборот 500 - 600 млн. евро год;</li><li>8 заводов - 6 заводов расположены в Италии, по одному заводу - в Польше и Канаде;</li><li>7 торговых марок;</li><li>27 филиалов и подразделений по всему миру;</li><li>Самый большой в Европе Центр прикладных исследований горения;</li><li>Мировой лидер в производстве горелок - более 400000 шт. в год;</li><li>2500 человек персонала;</li><li>Сертификат качества ISO 9001.</li></ul>', 'HTML', null);
call add_entity_property(@last_id, 'ADDRESS', 'Via Ing. Pilade Riello, 7, 37045 Legnago (VR) Italy', null, null, null);
call add_entity_property(@last_id, 'PHONE', '', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Saacke');
call add_entity_property(@last_id, 'PICTURE', 'http://www.saacke.com/fileadmin/templates/main/layout_img/saacke-logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.saacke.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Фирма SAACKE основана в 1931 году. Головное предприятие находится в г. Бремен, Германия. Дополнительные производственные мощности в Англии, Аргентине, Хорватии и Китае. Дочерние компании, партнеры и сервисные центры в 50 странах мира. Численность сотрудников – более 1000 чел.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '<p>Основные направления деятельности:</p>
<ul><li>Производство и поставка индивидуальных автоматических промышленных горелочных устройств единичной тепловой мощностью 1 - 134 МВт на любом жидком и газообразном топливе для новых котлов или реконструкции старых. Область применения: коммунальная и промышленная теплоэнергетика</li>
<li>Производство и поставка индивидуальных автоматических промышленных горелочных устройств единичной тепловой мощностью 1-134 МВт для мусоро - сжигающих станций, ТЭЦ ( дожига выхлопных газов после газотурбинной установки). Область применения: коммунальная и промышленная теплоэнергетика</li>
<li>Производство и поставка генераторов горячих газов (воздухонагревателей) 1- 56 МВт для сушильных камер и технологических процессов</li>
<li>Производство и поставка судовых паровых котельных установок 6 -110 т\ч в полной комплектации. Область применения: судовая теплоэнергетика</li>
<li>Инжиниринг</li>
<li>Шеф - монтаж, шеф-наладка, гарантийное и послегарантийное техническое обслуживание горелочных устройств SAACKE, поставка запасных частей</li></ul>
<p>Основные преимущества:</p>
<ul><li>Ведущие позиции в применении современных технологий сжигания и средств автоматизации</li>
<li>Большой модельный ряд промышленных горелочных устройств на любом жидком, газообразном и пылевидном топливе</li>
<li>Большое количество реализованных объектов</li>
<li>Высокая надежность и энергоэффективность оборудования</li>
<li>Высококлассный инжиниринг</li></ul>', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Suedweststrasse 13, 28237, Bremen, Germany', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+49-421-64 95 0', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'SAACKE Представительство в РФ', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.saacke.ru', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', '129164, Москва, ул. Ярославская, дом 8, кор. 6, офис 12А', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '+7-495-6860987, +7-495-7893117', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Schneider Electric');
call add_entity_property(@last_id, 'PICTURE', 'http://www.schneider-electric.com/navigation/images/se_logo.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.schneider-electric.com/site/home/index.cfm/ru/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Schneider Electric - компания мирового уровня в области управления электроэнергией - предлагает комплексные решения для ключевых сегментов рынка: гражданского и жилищного строительства, промышленности, энергетики и инфраструктуры, центров обработки данных и сетей. Благодаря решениям Schneider Electric электроэнергия становится безопаснее, надежнее, эффективнее.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Помимо разработки и внедрения энергоэффективных решений компания предлагает российским клиентам сервисное обслуживание, эффективную логистику, энергоаудит, передачу инновационных технологий и обучение.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Schneider Electric SA 35 rue Joseph Monier 92500 Rueil Malmaison - France', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+33 (0) 1 41 29 70 00', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Siemens');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_63.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://w3.siemens.ru', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '«Сименс» является не только производителем и поставщиком современного оборудования для российских предприятий, но и партнером, который предлагает эффективные системные решения для модернизации инфраструктуры и осуществляет комплексную поддержку заказчика при решении разнообразных производственных и технических задач. «Сименс» в России работает по всем традиционным направлениям своей деятельности, предлагая продукты, услуги и комплексные решения для промышленности, энергетики, здравоохранения и защиты окружающей среды.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Siemens AG, Wittelsbacherplatz 2, 80333 Munich, Germany', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+49 (69) 797 6660', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Traktionssysteme GmbH');
call add_entity_property(@last_id, 'PICTURE', 'http://www.traktionssysteme.at/images/logo.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.traktionssysteme.at/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Ассортимент нашей продукции включает тяговые асинхронные электродвигатели и генераторы с воздушным и жидкостным охлаждением для применения в сфере производства межрегионального и регионального рельсового и городского электрического транспорта. Кроме того мы владеем современной технологией производства электрических вращающихся машин на постоянных магнитах.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Traktionssysteme Austria – это австрийская компания, расположенная в регионе, богатом традициями. Вот уже более 50 лет на бывшем заводе Броун Бовери в городе Винер Нойдорф изготавливаются тяговые приводы. Все эти годы мы росли и развивались вместе с нашими клиентами, накапливая специальные знания и опыт. На сегодняшний день, условия деятельности компании и требования к продуктам производства значительно изменились. Качество, доступность и цена ведут к достижению успеха, как для производителя вагонов, так и для поставщиков составных частей. Будучи независимой компанией, мы готовы взять на себя всю ответственность по удовлетворению самых требовательных запросов наших заказчиков. Опыт, накопленный в течение многих десятков лет работы в отрасли, мощный научно-технический потенциал, совершенное оборудование и современные технологии – вот факторы, позволяющие нам добиться неоспоримых успехов на мировом рынке. На нашем заводе в Австрии осуществляется разработка и проектирование тяговых приводов, включающих в себя моторы и редукторы, согласно специфическим требованиям наших клиентов. Продукция компании Traktionssysteme Austria получила распространение во всём мире, в том числе приятно отметить успешное использование наших изделий в России, Украине и Белоруссии.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Brown-Boveri-Strasse 1 2351 Wr. Neudorf Austria', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+43-(0)2236-8118-249, +43-(0)2236-8118-203', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Trocal');
call add_entity_property(@last_id, 'PICTURE', 'http://www.profine-group.com/ecomaXL/get_blob.php?name=TROCAL_logo', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.trocal-profile.com/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'ТРОКАЛЬ - один из ведущих мировых поставщиков оконных систем из ПВХ. 50 лет назад ТРОКАЛЬ первым в мире наладил массовое производство окон из ПВХ, став родоначальником отрасли. ТРОКАЛЬ и по сей день занимает лидирующую позицию в разработке инновационных продуктов и услуг в соответствии с развитием рынка.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Для декоративной отделки оконных систем TROCAL предлагает самый широкий на рынке ассортимент вариантов: ламинация, алюминиевые накладки и коэкструдированное акриловое покрытие.
Профильные системы TROCAL отличаются современным стильным дизайном, прогрессивной бессвинцовой рецептурой и уникальными конструктивными особенностями. 
Предлагая свою продукцию в среднем верхнем сегменте рынка, в качестве целевой аудитории TROCAL рассматривает профессионалов – переработчиков ПВХ-профиля, архитекторов, дизайнеров, проектировщиков, а также конечных потребителей, которые привлекают к оформлению интерьера специалистов. ', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'profine GmbH TROCAL Profilsysteme Mülheimer Straße 26 D-53840 Troisdorf', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+49 (0)2241 85-06', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'ЗАО "профайн РУС"', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.kbe.ru', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', '115419, Москва, 2-ой Рощинский проезд, д. 8, стр. 6', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '(495) 232-93-30', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Uponor');
call add_entity_property(@last_id, 'PICTURE', 'http://www.uponor.ru/images/Layout/uponor.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.uponor.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Корпорация Uponor – ведущий европейский поставщик решений для водоснабжения и микроклимата помещений и теплотрасс. Решения Uponor успешно применяются на объектах жилого, коммерческого и промышленного строительства в Европе, Азии и Северной Америки.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Ключевые решения для микроклимата помещений включают такие системы, как автоматизированные теплые полы для загородных домов, потолочное охлаждение, термоактивные строительные конструкции, системы для подключения тепловых насосов, снеготаяние и многое другое. Другим важным направлением компании являются теплоизолированные трубы для теплотрасс. Компания Uponor является поставщиком №1 для ЖКХ скандинавских стран.
Всего в 30 странах, где работает корпорация Uponor, насчитывается около 3200 сотрудников. В 2008г. чистая выручка составила 749.2 млн. Евро. Uponor Corp. - это публичная Корпорация, чьи акции котируются на Хельсинской фондовой бирже (NASDAQ OMX Helsinki Ltd), Финляндия. 
Российское представительство Корпорации открылось в 1995 году. Впоследствии было открыто 6 региональных офисов и создана партнерская сеть, обслуживающая все крупные города страны. 
Системы UPONOR установлены на таких знаковых для России объектах, как Город Столиц (Москва-Сити), Центральный Телеграф в Москве, жилой комплекс Ладья в Самаре (признан лучшим архитектурным проектом России 2003 года), мечеть Кул-Шариф в Казани.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Äyritie 20, FI-01511 Vantaa, Finland', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+358 (20) 129 211', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'ЗАО Упонор Рус', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.uponor.ru', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', '129085, г. Москва, ул. Годовикова, д.9. стр.1', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '+7 800 700 69 82', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Viessmann');
call add_entity_property(@last_id, 'PICTURE', 'http://www.viessmann.de/content/dam/internet-global/images/general/7590.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.viessmann.de', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Промышленная группа Viessmann - крупнейший производитель оборудования для систем теплоснабжения мирового уровня. Компания была основана в 1917 году. Сегодня её успешно возглавляет доктор Мартин Виссманн, который представляет собой уже третье поколение владельцев предприятия.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Годовой оборот компании Viessmann составляет 1,7 млрд. евро, а количество сотрудников насчитывает около 9400 человек. Компания Viessmann владеет 22 заводами в 10 странах. Ею создана разветвленная сеть крупных центров сбыта, не только в Германии, но и в 74 других странах. Во всем мире открыты 120 торговых филиалов компании. Таким образом, компания Viessmann является крупным игроком на мировом рынке отопительной техники, где 56% всего оборота предприятия приходится на экспорт.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Viessmann Werke GmbH & Co. KG, Viessmannstraße 1, 35108 Allendorf (Eder)', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+ 49 6452 70-0', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Weishaupt');
call add_entity_property(@last_id, 'PICTURE', 'http://www.weishaupt.de/++resource++weishaupt.policy-images/weishaupt.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.weishaupt.de', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания Weishaupt была основана в 1932 году как ремесленное предприятие. Сейчас здесь занято более 2 500 сотрудников. Примерно половина из них работает на главном предприятии в Швенди, остальные в филиалах фирмы в Германии и дочерних компаниях за границей. На предприятии, полезная площадь которого составляет 60 000 кв.м., каждый год производится более 150 000 горелок. Кроме того, разработана обширная программа выпуска водогрейных котлов, шкафов управления и принадлежностей. Программа Weishaupt охватывает газовые, жидкотопливные, комбинированные горелки с одноступенчатым, двухступенчатым, плавно-двухступенчатым и модулируемым регулированием. Это полностью автоматические горелки.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Max Weishaupt GmbH Max-Weishaupt-Strasse 14 88477 Schwendi Germany', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+49 7353 83-0', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Wilo');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_99.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.wilo.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Энергосберегающие насосы Wilo были установлены на ведущие предприятия ЖКХ, промышленные предприятия и водоканалы России. Применение нашего оборудования позволило значительно сократить расходы на электроэнергию. ', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Дочернее предприятие WILO на территории России - ООО "ВИЛО РУС" - начало работать в 1997 году.
В настоящее время "ВИЛО РУС" поставляет в Россию современное насосное оборудование для систем отопления, водоснабжения, вентиляции, кондиционирования марок WILO, Salmson , а также оборудование для бассейнов, аквапарков и подготовки технической (котловой) и питьевой воды в рамках программы "WILO-Водоподготовка".Надежность оборудования WILO, обусловленная высоким качеством конструкции и изготовления, удобство в монтаже и эксплуатации. Об успешной работе ООО "ВИЛО РУС" на российском рынке можно судить по росту продаж. На сегодняшний день ООО "ВИЛО РУС" - это 27 филиалов в регионах Российской Федерации от Калининграда до Владивостока.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'WILO SE, Nortkirchenstraße 100, 44263 Dortmund, Deutschland', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+49 231 4102-0', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'Вило РУС', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.wilo.ru', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', '123592 Москва, ул. Кулакова, 20', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '+7 495 781 06 90', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'ABB');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_27.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.abb.com/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'АББ-лидер в области технологий для электроэнергетики и автоматизации. Технологии, созданные Группой, позволяют промышленным предприятиям и энергетическим компаниям повышать свою производительность, снижая негативное воздействие на окружающую среду. 
Группа компаний АББ владеет предприятиями в 100 странах, а ее штат насчитывает около 145 000 человек', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Affolternstrasse 44, CH-8050 Zurich, Switzerland', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+41 (0)43 317 7111', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'ABB Russia', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.abb.ru/', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', 'Москва, Обручева 30/1', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '+7 495 777 222 0', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Алиста');
call add_entity_property(@last_id, 'PICTURE', 'http://alista.com.ua/images/static/alista_logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://alista.com.ua/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания «Алиста» является официальным дилером мировых производителей промышленного оборудования, металлообрабатывающего инструмента и возобновляемых источников энергии.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Компания "Алиста" была основана в 2000 году. Начиная с 2007 года компания  также представляет на рынке Украины современные энергосберегающие технологии - возобновляемые источники энергии.
Компания имеет мощную производственную базу, а также собственные складские, торговые и экспозиционные площади.
Развитая филиальная сеть успешно работает на всей территории Украины.
Эффективное использование инновационных технологий и современный подход к бизнесу являются успешной основой стратегии компании «Алиста».', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Украина, г. Днепропетровск, ул. Собинова, 1', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+38(056)732-25-34', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Вентс');
call add_entity_property(@last_id, 'PICTURE', 'http://vents.ua/i/logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://vents.ua', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания ВЕНТС – крупнейшее в мире предприятие по производству вентиляционного оборудования', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'ВЕНТС – мощное научно-производственное предприятие, которое владеет крупнейшей современной производственной базой в Европе и самостоятельно производит полный спектр оборудования для систем вентиляции и кондиционирования любой степени сложности под торговыми марками ВЕНТС, Домовент, Пластивент, Алювент, X-VENT, AirVENTS.
Ассортимент вентиляционной продукции ВЕНТС составляет более 10 000 наименований для бытовой, коммерческой и промышленной вентиляции, различных целевых аудиторий потребителей и мировых географических регионов.
Производственные мощности расположены более чем на 60 000 м2. Каждый из 16 цехов компании оборудован в соответствии с международными стандартами и осуществляет полноценный производственный цикл. На предприятии работают более 2 000 профессионалов, которые обеспечивают воплощение вентиляционной продукции от идеи и конструкторского решения до готового высокотехнологичного продукта. Для этого ВЕНТС реализует стратегию постоянного развития, которая основана на внедрении инноваций и применении передовых технологий в области климатического оборудования.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Украина, 01030, г. Киев, ул. М. Коцюбинского, 1', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+38 044 406-36-25', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Группа ПОЛИМЕРТЕПЛО');
call add_entity_property(@last_id, 'PICTURE', 'http://www.polymerteplo.ru/images/logo.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.polymerteplo.ru/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Группа ПОЛИМЕРТЕПЛО — лидер в производстве гибких полимерных теплоизолированных трубопроводов для распределительных сетей ГВС и отопления', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Группа ПОЛИМЕРТЕПЛО — ведущий разработчик, крупнейший в России и Восточной Европе производитель гибких полимерных теплоизолированных трубопроводов для распределительных сетей горячего водоснабжения и отопления, а также незамерзающих водопроводов коммунального и промышленного назначения. Основана в 2002 году акционерами Группы ПОЛИПЛАСТИК — признанного лидера в разработке и производстве инженерных пластмасс и полимерных трубопроводных систем в России и странах СНГ. Разработчик и единственный в России производитель гибких полимерных труб для тепловых сетей ИЗОПРОФЛЕКС и КАСАФЛЕКС. Лидер рынка предизолированных трубопроводов для распределительных сетей ГВС и отопления России и СНГ. Суммарный объем поставки трубопроводов на рынки России и стран СНГ (2002–2011 гг.): более 6 000 км. Производственные мощности расположены в России и Республике Беларусь.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Россия, 119530, г. Москва, Очаковское шоссе, д. 18, стр. 3', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+7 (495) 745-68-57', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Dalgakıran');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_75.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://dalgakiran.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Международный промышленный холдинг «DALGAKIRAN» является одним из крупнейших производителей воздушных компрессоров, экспортирующий оборудование более чем в 100 стран мира. Представительства компании находятся в России, на Украине, в Англии и Германии.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Российское представительство «DALGAKIRAN» уже более 10-ти предлагает высокоэффективное качественное компрессорное оборудование, используемое для поддержания давления выше атмосферного на определенном уровне. Хотя сжатый воздух, генерируемый воздушными компрессорами, относится к дорогостоящим источникам получения энергии, применяемым во многих сферах промышленности, спрос на данное оборудование среди потребителей со всего мира неуклонно растет. ', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Eyüp Sultan Mahallesi Müminler Cd. No: 70 34885, Sancaktepe, İstanbul / Türkiye', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+90 216 311 71 81', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', '', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.dalgakiran.su/ru/', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', '117246, г.Москва, Научный проезд, д.19, офис 502', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '+7(495) 231-42-15', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Джон Дир');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_123.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.deere.com/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Следовать традициям всегда нелегко. Особенно если традиции - это 175 лет производства качественной продукций, инновационных решений и честной цены. John Deere и его достижения живут в каждом работнике, каждом продукте и в каждом решении, которое мы используем для улучшения качества жизни. Это стремление выделяет нас на рынке и ведет к еще большим достижениям в производстве.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'За прошедшие 175 лет компания John Deere претерпела множество изменений в коммерческой деятельности, производимой продукции и услугах. Изменения всегда создают новые возможности. И компания John Deere всегда была готова и приветствовала их. И по сей день компания John Deere продолжает создавать решения для тех, кто работает на земле: фермеров, владельцев ранчо, землевладельцев, строителей. Компания John Deere никогда не преступала и не забывала главные ценности ее основателя: честность, качество, долг и инновационность. Эти ценности определяют стиль нашей работы, предлагаемое нами качество и непревзойденный уровень обслуживания, которое вы получаете, будучи клиентом, инвестором или работником компании.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Deere & Company World Headquarters One John Deere Place Moline, Illinois 61265 USA', null, null, null);
call add_entity_property(@last_id, 'PHONE', '(800)765-9588', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'Филиал корпорации "Джон Дир Агрикалчерэл Холдингз, Инк."', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.deere.ru', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', '115114 Москва, ул. Летниковская, д.2, стр.3 корпус "Осень"', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '+7 (495) 783-3999', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Инжиниринговая компания «Альтернативная энергетика»');
call add_entity_property(@last_id, 'PICTURE', 'http://aenergy.com.ua/images/stories/contcts/logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://aenergy.com.ua', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Инжиниринговая компания «Альтернативная энергетика» разрабатывает, монтирует и вводит в эксплуатацию комплексные энергосберегающие системы для обеспечения электроэнергией и теплом различных групп потребителей от бытовых систем тепло- и электро- обеспечения до промышленных проектов мегаватт-класса, используя возобновляемые источники энергии ветра, солнца, земли и воды.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Наша компания представляет Вашему вниманию самый широкий перечень продукции для обеспечения Вашего дома и бизнеса альтернативной энергией: ветрогенераторы, солнечные батареи, микро и мини ГЭС, солнечные коллекторы, тепловые насосы, твердотопливные котлы, биогазовые установки, светодиодное освещение.
Глобальной задачей нашей компании является внедрение экологически чистых технологий и альтернативной энергетики в повседневную жизнь нашего государства. Таким образом, наша компания вносит свой вклад в построение экологического будущего нашей страны и планеты в целом, способствует сохранению чистой природы для последующих поколений.
Стремиться к тому, чтобы сделать новые энергосберегающие технологии и альтернативную энергетику доступными для жителей Украины, развить культуру использования альтернативных источников энергии для широких кругов населения страны – от частных лиц и предпринимателей, до государственных служащих, отвечающих за энергосбережение и экологию в нашей стране.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Украина, 65114, г.Одесса, проспект Маршала Жукова, 47/3, офис 9-2', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+38 048 70 06 511', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Квазар');
call add_entity_property(@last_id, 'PICTURE', 'http://www.kvazar.com/templates/yt_core/images/logoru.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.kvazar.com/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Мы производим и предлагаем полный ассортимент продукции PV-энергетики, начиная от фотоэлектрических преобразователей любого размера и формы, моно или поликристаллических, 4`, 5`, 6`. Модулей, мощностью от 1 до 200 Ват. И заканчивая солнечными зарядными устройствами и источниками питания разной мощности и функциональности, а так же системами автономного энергоснабжения бытовых и промышленных объектов.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '04136, Украина, г. Киев, ул. Северо-Сырецкая, 3', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+380 (44) 200 95 95', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'KAESER KOMPRESSOREN');
call add_entity_property(@last_id, 'PICTURE', 'http://www.kaeser.de/Images/Kompressoren_tcm6-2147.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.kaeser.de/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'один из самых крупных и преуспевающих производителей пневмосистем Европы с общей численностью сотрудников почти 4000 человек. Основа всех основ – ориентированность на потребности заказчика в сочетании с инновационной продукцией и комплексными решениями.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Carl-Kaeser-Straße 26, 96450 Coburg, Postfach 2143, 96410 Coburg, GERMANY', null, null, null);
call add_entity_property(@last_id, 'PHONE', '(+49) 95 61 / 640 0', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'OOO "Кезер Компрессорен ГмбХ"', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.kaeser.ru', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', '129344, г. Москва, ул. Искры 17"A", стр. 2', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '+7 (495) 797 30 37', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'KNAUF Insulation');
call add_entity_property(@last_id, 'PICTURE', 'http://www.knaufinsulation.ru/sites/ru.knaufinsulation.emakina.net/files/Logo_RU_0.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.knaufinsulation.ru', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'КНАУФ - это семейная фирма и в то же время международная промышленная группа мирового масштаба. Крупнейший в мире производитель строительных материалов для внутренней и внешней отделки, таких как гипсокартонные КНАУФ-листы и гипсоволокнистые КНАУФ-суперлисты, гипсовые пазогребневые плиты для межкомнатных перегородок (КНАУФ-гипсоплиты), сухие строительные смеси на основе гипса и цемента, изоляционные материалы, оборудование для машинной штукатурки.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Утеплители KNAUF Insulation – это безопасные материалы, которые производятся по инновационной технологии ECOSE®: они состоят из натуральных компонентов, не содержат фенол-формальдегидных и акриловых смол, обладают отличными тепло- и звукоизолирующими свойствами, являются негорючими и устойчивыми к насекомым и грызунам.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Knauf Insulation GmbH Parkring 15-17 85748 Garching bei München Germany', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+32 (0)10 48.84.60 ', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'KNAUF Insulation', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.knaufinsulation.ru', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', '119415, Москва, ул. Удальцова, 1а, 4-й этаж', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '+7 (495) 933-61-30', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Kriger');
call add_entity_property(@last_id, 'PICTURE', 'http://kriger.com.ua/i/logo-kriger-ru.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://kriger.com.ua/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Модельный ряд нашей продукции базируется на принципах гибкости и избирательности и выпускается с характеристиками по тепловой мощности от 12 кВт до 3500 кВт.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Внедрили международную систему качества ISO-9001:2000. Успешно прошли ресертификацию на соответствие международным требованиям системы менеджмента ISO 9001:2008. Сертифицировали свой продукт в Украине, странах СНГ и в странах Европейского Союза. Само предприятие не пользуется газом, а обеспечивает себя теплом за счет утилизации биомассы в своих котлах.Сегодня мы занимаем пятое место в Европе среди производителей котлов, которые работают на твердом топливе. С целью создания конкурентоспособной продукции в сфере биоэнергетики - плодотворно и успешно работаем с ведущими компаниями мира (Франция, Латвия).
Сегодня компания «Кригер» - вертикально-интегрированный энергохолдинг, который владеет полным циклом построения бизнеса «под ключ» связанного с выработкой тепловой энергии: подбор и разработка оборудования производства ТМ «Кригер», реконструкция и новое строительство котельных, технологии производства и продажи тепловой энергии, производство и логистика поставок биотоплива, сопровождение технологии выработки тепловой энергии. Ряд успешно реализованных нашей компанией такого рода проектов позволило нашим партнерам реализовать их во многих областях Украины.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'г.Житомир, ул. Щорса, 81, 10003, Украина', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+380-412-481-532, +380-412-481-509', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Минский Тракторный Завод');
call add_entity_property(@last_id, 'PICTURE', 'http://www.belarus-tractor.com/sm_full.aspx?guid=1213', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.belarus-tractor.com/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, ' Производственное объединение Минский тракторный завод было основано 29 мая 1946 года. За более чем полувековую историю своего существования завод превратился в одного из крупнейших производителей сельскохозяйственной техники в мире, на котором работает почти 30000 человек. За свою историю МТЗ произвел более 3 млн. тракторов, из которых более 500 тыс. поставлено примерно в 100 стран мира. Сегодня заказчикам предлагаются 62 модели разных видов машин , более чем в ста сборочных вариантах для всех климатических и эксплуатационных условий. Новые модели тракторов обладают широкими возможностями агрегатирования с сельхозмашинами различных производителей. На все продаваемые тракторы получены международные сертификаты, подтверждающие их соответствие стандартам Евросоюза. ПО "МТЗ" помимо тракторов предлагает потребителю широкий ассортимент машин специального назначения для заготовки и ухода за лесом, погрузчики, машины для коммунального хозяйства, для работ в шахтах.
В начале мая 2000 г. наше предприятие получило сертификат соответствия системы качества по ИСО-9001 на проектирование и производство тракторов. А это значит, что на Минском тракторном заводе создана система качества, соответствующая требованиям международных стандартов. Это подтвердили и результаты сертификационного аудита, проведенного фирмой ТЮФ-Тюрингия (Германия).', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Республика Беларусь, 220009, г.Минск, ул. Долгобродская, 29', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+375 17 2466009', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'СВЕТОРЕЗЕРВ');
call add_entity_property(@last_id, 'PICTURE', 'http://www.svetorezerv.ru/sites/default/files/logo_ru.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.svetorezerv.ru/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Светотехнический Завод Светорезерв был образован в 2003 году в Москве. Компания занимается разработками, производством и внедрением экономичных уличных и подъездных светильников, прожекторов и другой светотехнической продукции на основе светодиодных технологий.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Компания Светорезерв прогнозирует замену традиционных источников освещения улиц, подъездов, дворов, придомовых территорий, подвалов, улиц и парков к 2012-2015 гг. на источники света на основе светодиодных технологий. Компания ставит своей целью играть важную роль в развитии страны и общества, предоставлять услуги и продукцию высочайшего качества, использовать гибкую ценовую политику и является надежным партнером для каждого нашего клиента. Наработанная практика и накопленный опыт использования и применения светодиодных светильников помогает производственной компании Светорезерв участвовать в процесс модернизации освещения ЖКХ в России и странах СНГ.
Производственная компания Светорезерв постоянно проходит процедуры получения сертификатов соответствия на всю продукцию в РОСТЕСТе и обладает изобретениями, полезными моделями и промышленными образцами, зарегистрированными в Федеральной службе по интеллектуальной собственности, патентам и товарным знакам Российской Федерации (Роспатент).', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '123056, Россия, г. Москва, ул. Красина, д. 3', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+7 (495) 223-30-19, +7 (495) 662-98-25', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Украинские технологические системы');
call add_entity_property(@last_id, 'PICTURE', '', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.tehnosystems.com/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Предприятие занимающееся разработкой, изготовлением и реализацией теплогенераторов горячего воздуха, которые генерируют тепло путем сжигания отходов деревообрабатывающего и сельскохозяйственного производства (дрова, опилки, отходы мебельного пр-ва, семенное шелухи, измельченная солома и др.).', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Украина, Тернопольская область, Тернопольский район, пгт. В.Биркы, ул Грушевского 71.', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+38-0352-49-2179', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Укртехнопром');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_98.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.ukrtehnoprom.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'ЗАО «ХК «Укртехнопром» — лидер рынка отопительной техники Украины.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', '', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', '04073, Украина, г. Киев, ул. Ливарская, 5', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+38 (044) 467-66-48', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'УкрЭЛКОМ');
call add_entity_property(@last_id, 'PICTURE', 'http://ukrelcom.com/verx_files/top_logo.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://ukrelcom.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания «УкрЭЛКОМ» работает на украинском электротехническом рынке с 2003 года. Сегодня предприятие динамично развивается, и его продукция завоевала доверие потребителей оптимальным сочетанием высокого качества и профессионального сервиса. Предприятие занимается разработкой, проектированием, производством, монтажом и наладкой электротехнического оборудования. Мы поставляем электротехническую продукцию собственного производства, а также ведущих отечественных и зарубежных производителей.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'ул. Пилотская 77 Б, г. Хмельницкий, Украина, 29000', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+38 (0382) 70-49-49, +38 (0382) 74-01-01', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Фабрика Свет Украины 24');
call add_entity_property(@last_id, 'PICTURE', 'http://ledlighting.com.ua/images/logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://ledlighting.com.ua', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Фабрика СУ-24 «Свет Украины» изготавливает светодиодные светильники мощностью от 5 до 240 watt.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Led лампы для коридоров и для паркингов, офисные потолочные и настенные, промышленные, для ЖКХ, бытовые, светодиодные модули и т.п.. Светильники могут использоваться для освещения автомагистралей, городских улиц, парков, офисов, залов торговых точек, внешней и внутренней рекламы, промышленных помещений и так далее. При применении светильников в других сферах, исходя из эксплуатационной целесообразности, необходимо руководствоваться требованиями этих технических условий.
Особенности светильников СУ-24:
- экономичные (КПД 95% -96%) драйверы светодиодов. Драйвер отслеживает ток и напряжение на светодиодах, температуру Led и движение перед светильником;
- многократное резервирование питания светодиодов. Например, внутри дорожного светильника одновременно работают 4 драйвера;
- применение высококачественных светодиодов (Cree) с температурами свечения 4000K и 6000K;
- специализированные формы светильников (например, для дорог светильники – трансформеры которые равномерно освещают дорогу и не ослепляют водителей);
- низкая цена Led светильников.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '61145, г. Харьков, ул. Серповая, 4, офис 214', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+38-057-702-16-86, +38-057-702-16-87', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Fendt');
call add_entity_property(@last_id, 'PICTURE', 'http://www.fendt.com/layout/fendt_logo_facelift.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.fendt.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Fendt - марка корпорации AGCO, которая относится к самому большому в мире производителю и поставщику тракторов и сельхозмашин. В общем ассортименте AGCO имеются тракторы, комбайны, машины для уборки и посева, разбрасыватели удобрений и почвообрабатывающие орудия. В сфере сбыта корпорация сотрудничает с сильной дилерской сетью этой области – это более 3000 независимых дилеров, торговых точек, и обладателей лицензий в более 140 стран мира.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Fendt является новой высокосовременной маркой с высокими требованиями в концерне. Под крышей AGCO фирма Fendt будет представлять свои инновации не только в Европе, но и на рынках всего мира.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'AGCO 4205 River Green Parkway Duluth, GA 30096 USA', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+1.770.813.9200', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Challenger');
call add_entity_property(@last_id, 'PICTURE', 'http://www.challenger-ag.com/EMEA/RU/static/images/logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.challenger-ag.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Бренд Challenger, принадлежащий корпорации AGCO, по праву считается одной из ведущих марок сельскохозяйственной техники. Узнайте больше о корпорации AGCO, ее предприятиях и торговых марках, а также о том, как компания стала одним из лидеров по производству сельскохозяйственной техники', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Бренд Challenger появился в 1987 году, когда компания Caterpillar стала производить тракторы на гусеничном ходу. С тех пор ассортимент техники, выпускаемой под маркой Challenger, значительно расширился и пополнился колесными тракторами, комбайнами, кормозаготовительной техникой, самоходными опрыскивателями и разбрасывателями удобрений, почвообрабатывающими агрегатами и навесными орудиями. Каждая единица техники имеет свою долгую историю успеха. Под брендом Challenger объедены лучшие модели сельскохозяйственной техники, способные удовлетворить запросы, как небольших фермерских хозяйств, так и крупных агропромышленных холдингов.
Весь ассортимент техники Challenger, поставляемой на рынки Восточной Европы, Африки и Ближнего Востока, изготавливается на собственных заводах корпорации AGCO, расположенных по всему миру. Это современные промышленные предприятия, оснащенные самым лучшим оборудованием, что позволяет производить самые надежные, долговечные и экономичные машины.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '', null, null, null);
call add_entity_property(@last_id, 'PHONE', '', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR', 'OOO АГКО МАШИНЕРИ', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_URL', 'http://www.agro-machinery.ru/', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_ADDRESS', '127015 г. Москва, ул. Большая Новодмитровская д. 23 стр. 3', null, null, null);
call add_entity_property(@last_id, 'DISTRIBUTOR_PHONE', '+7 495 660 92 99', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'ECOLIGHT');
call add_entity_property(@last_id, 'PICTURE', 'http://www.ecolight.ru/sites/all/themes/ecolightzen/images/logo_main.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.ecolight.ru/', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания «ЭКОЛАЙТ» является ведущим поставщиком светодиодных светильников и ламп российского производства под торговой маркой ECOLIGHT.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Почему именно светильники ECOLIGHT?
— самое выгодное соотношение цена /качество на российском рынке светодиодного освещения и светильников;
— продуманная складская программа позволяет обеспечить нашим клиентам постоянное наличие востребованных моделей светильников в большом объеме;
— система крепления обеспечивает простоту монтажа;
— качественные источники питания собственного производства;
— защита цепочки светодиодов диодами Зенера, что гарантирует бесперебойную работу светильника, даже при перегорании любого из светодиодов.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '127521, г. Москва, Анненский пр-д, д.3, эт.4', null, null, null);
call add_entity_property(@last_id, 'PHONE', '8.800.700.07.06, +7.495.981.80.40', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Экосинерго');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_146.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.ecosynergo.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Применение наших светильников сразу решает задачу получения равномерного немерцающего освещения, не зависящего от качества подаваемой электроэнергии.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Один, самый маломощный светодиодный светильник из производимой нами линейки, в течение года экономит его владельцу свыше 50 USD, затрачиваемых на оплату потребленной электроэнергии по действующим ныне тарифам. Вот полученные нами практические результаты по полной замене ртутных и натриевых ламп освещения центральной городской площади. Мы заменили 42 стандартных светильника на столбах, на светодиодные. До замены стандартные светильники заставляли небогатые городские власти тратить ежемесячно до 100 USD на оплату электроэнергии по данному участку, имеющему размеры 120 на 105 м. После замены расходы сократились до 12 USD. Колоссальная экономия, при том здесь еще не учтены расходы на закупку и замену ртутных ламп, а следовало бы добавить еще и стоимость их утилизации.
Это простой пример из сравнительно простой сферы городского хозяйства. А ведь несравнимо большее количество светильников используется в производственных цехах, на железной дороге, в шахтах и туннелях с их повышенными требованиями к механической прочности, надежности, взрывобезопасности и защите от внешних воздействий. Всем этим требованиям идеально соответствует линейка промышленных светодиодных светильников, предлагаемая НПО Экосинерго. Трудно даже подсчитать, какое громадное количество сил, времени и ресурсов будет экономиться только из-за того, что светодиодные источники света не требуется обслуживать или заменять более 10 лет.
А главной особенностью нашей компании является то, что мы предлагаем заказчикам не просто набор товаров, а готовые решения для каждой отрасли, предприятия, покупателя.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Украина, 03190 Киев, ул. Щербакова, 4', null, null, null);
call add_entity_property(@last_id, 'PHONE', '380 (44) 427-05-80', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Энкордис');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_76.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.enkordis.com.ua ', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Основным направлением деятельности ООО "НПП "Энкордис" является решение задач связанных с компенсацией реактивной энергии и повышением качества электросетей. Специалистами компании разработано и серийно выпускается ряд устройств для компенсации реактивной мощности и повышения энергоэффективности предприятий отвечающие современным требованием потребителей.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Украина, 61177, г.Харьков, ул. Золочевская, 1 ', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+38 057 764-20-22, +38 057 751-12-01', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Южтеплоэнергомонтаж');
call add_entity_property(@last_id, 'PICTURE', '', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.utem.com.ua', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Предприятие «ЮТЭМ – Инжиниринг» является лидером продаж Группы ЮТЭМ и специализируется на выполнении сложных, комплексных проектов и предоставлении инжиниринговых услуг.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Украина, 01601, г. Киев, ул. Пушкинская, 27', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+380 (44) 499-65-55; 499-65-33', null, null, null);

commit;
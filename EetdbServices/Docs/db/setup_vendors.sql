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

set @last_id = eetdb.add_entity('VENDOR', '');
call add_entity_property(@last_id, 'PICTURE', '', null, null, null);
call add_entity_property(@last_id, 'URL', '', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '', null, null, null);
call add_entity_property(@last_id, 'PHONE', '', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', '');
call add_entity_property(@last_id, 'PICTURE', '', null, null, null);
call add_entity_property(@last_id, 'URL', '', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '', null, null, null);
call add_entity_property(@last_id, 'PHONE', '', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', '');
call add_entity_property(@last_id, 'PICTURE', '', null, null, null);
call add_entity_property(@last_id, 'URL', '', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '', null, null, null);
call add_entity_property(@last_id, 'PHONE', '', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', '');
call add_entity_property(@last_id, 'PICTURE', '', null, null, null);
call add_entity_property(@last_id, 'URL', '', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '', null, null, null);
call add_entity_property(@last_id, 'PHONE', '', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', '');
call add_entity_property(@last_id, 'PICTURE', '', null, null, null);
call add_entity_property(@last_id, 'URL', '', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', '', null, null, null);
call add_entity_property(@last_id, 'PHONE', '', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Riello S.p.A.');
call add_entity_property(@last_id, 'PICTURE', 'http://www.riellogroup.com/engines/images/logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.riellogroup.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, '<p>Сегодня концерн RIELLO - это:</p><ul><li>Оборот 500 - 600 млн. евро год;</li><li>8 заводов - 6 заводов расположены в Италии, по одному заводу - в Польше и Канаде;</li><li>7 торговых марок;</li><li>27 филиалов и подразделений по всему миру;</li><li>Самый большой в Европе Центр прикладных исследований горения;</li><li>Мировой лидер в производстве горелок - более 400000 шт. в год;</li><li>2500 человек персонала;</li><li>Сертификат качества ISO 9001.</li></ul>', 'HTML', null);
call add_entity_property(@last_id, 'ADDRESS', 'Via Ing. Pilade Riello, 7, 37045 Legnago (VR) Italy', null, null, null);
call add_entity_property(@last_id, 'PHONE', '', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Viessmann');
call add_entity_property(@last_id, 'PICTURE', 'http://www.viessmann.de/content/dam/internet-global/images/general/7590.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.viessmann.de', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Промышленная группа Viessmann - крупнейший производитель оборудования для систем теплоснабжения мирового уровня. Компания была основана в 1917 году. Сегодня её успешно возглавляет доктор Мартин Виссманн, который представляет собой уже третье поколение владельцев предприятия.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', null, 'Годовой оборот компании Viessmann составляет 1,7 млрд. евро, а количество сотрудников насчитывает около 9400 человек. Компания Viessmann владеет 22 заводами в 10 странах. Ею создана разветвленная сеть крупных центров сбыта, не только в Германии, но и в 74 других странах. Во всем мире открыты 120 торговых филиалов компании. Таким образом, компания Viessmann является крупным игроком на мировом рынке отопительной техники, где 56% всего оборота предприятия приходится на экспорт.', 'TEXT', null);
call add_entity_property(@last_id, 'ADDRESS', 'Viessmann Werke GmbH & Co. KG, Viessmannstraße 1, 35108 Allendorf (Eder)', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+ 49 6452 70-0', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Укртехнопром');
call add_entity_property(@last_id, 'PICTURE', 'http://db.ukeep.org//data/manufacturer/s_logo_98.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.ukrtehnoprom.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'ЗАО «ХК «Укртехнопром» — лидер рынка отопительной техники Украины.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', '', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', '04073, Украина, г. Киев, ул. Ливарская, 5', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+38 (044) 467-66-48', null, null, null);

-- set @last_id = eetdb.add_entity('VENDOR', '');
-- call add_entity_property(@last_id, 'PICTURE', '', null, null, null);
-- call add_entity_property(@last_id, 'URL', '', null, null, null);
-- call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
-- call add_entity_property(@last_id, 'DETAILS', null, '', 'TEXT', null);
-- call add_entity_property(@last_id, 'ADDRESS', '', null, null, null);
-- call add_entity_property(@last_id, 'PHONE', '', null, null, null);

commit;
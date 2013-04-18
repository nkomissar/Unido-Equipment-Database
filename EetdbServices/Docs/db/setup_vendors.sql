-- -------------------------------------------------------------------
-- fill VENDORS
-- -------------------------------------------------------------------
set @last_id = eetdb.add_entity('VENDOR', 'Adrian Group');
call add_entity_property(@last_id, 'PICTURE', 'http://www.adrian.eu/images/parts/logo.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.adrian.eu', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Компания предлагает комплексную систему отопления, которая состоит не только из газовых инфракрасных обогревателей и тепловоздушных агрегатов собственного производства, но и включает системы управления, приборы дестратификации и рекуперации, мониторинг, оптимизацию, а также элементы оценки качества окружающей среды и безопасности.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', '', null, null, null);
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
call add_entity_property(@last_id, 'DETAILS', 'Capstone is a member of the U.S. Environmental Protection Agency''s Combined Heat and Power Partnership which is committed to improving the efficiency of the nation''s energy infrastructure and reducing emissions of pollutants and greenhouse gases.', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', '21211 Nordhoff Street Chatsworth, CA 91311 United States', null, null, null);
call add_entity_property(@last_id, 'PHONE', '1 818 734 5300', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'CASE');
call add_entity_property(@last_id, 'PICTURE', 'http://www.caseih.com/PublishingImages/landing/images/logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.caseih.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Бренд Case IH представляет собой традицию лидерства. Это комбинация больших сельскохозяйственных машиностроительных предприятий и брендов, в том числе CASE, International Harvester и David Brown и другие.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', 'Каждый из брендов играет важную роль в истории и эволюции Case IH. За эти годы многое изменилось, но легендарный красный бренд всегда будет представлять собой стремление сделать сельхозпроизводителей успешными.', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', 'Case IH Max Service c/o CNH America LLC 621 State Street Racine, WI 53404', null, null, null);
call add_entity_property(@last_id, 'PHONE', '(813) 631-0000', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'CINK Hydro - Energy k. s.');
call add_entity_property(@last_id, 'PICTURE', 'http://www.cink-hydro-energy.com/gfx/headers/foot_cz.jpg', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.cink-hydro-energy.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Наша компания принадлежит к лидерам в области поставок технологического оборудования для малых и средних гидроэлектростанций. Команда разработчиков компании CINK Hydro-Energy поставила перед собой задачу совместно со своими заказчиками превратить водный потенциал во всем мире в рентабельный и экологически щадящий по отношению к окружающей природной среде источник энергии.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', 'Мы являемся одной из нескольких компаний в мире, которые располагают ноу-хау, необходимым для проведения технически хорошо обеспеченных поставок всех известных типов турбин, таких как турбина «Crossflow» (проточная), поворотнолопастная турбина (турбина Каплана), ковшовая турбина (турбина Пелтона) и радиально-осевая турбина (турбина Френсиса), до 3 МВт единичной мощности. Кроме того, компания «CINK Hydro-Energy» специализируется на установке гидроэлектростанций в системах питьевой воды, и для этой цели имеет ряд лицензий.', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', 'Lesov 125 360 01 Sadov Česká Republika', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+420 353 579 154', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Riello S.p.A.');
call add_entity_property(@last_id, 'PICTURE', 'http://www.riellogroup.com/engines/images/logo.png', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.riellogroup.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', '', null, null, null);
call add_entity_property(@last_id, 'DETAILS', '<p>Сегодня концерн RIELLO - это:</p><ul><li>Оборот 500 - 600 млн. евро год;</li><li>8 заводов - 6 заводов расположены в Италии, по одному заводу - в Польше и Канаде;</li><li>7 торговых марок;</li><li>27 филиалов и подразделений по всему миру;</li><li>Самый большой в Европе Центр прикладных исследований горения;</li><li>Мировой лидер в производстве горелок - более 400000 шт. в год;</li><li>2500 человек персонала;</li><li>Сертификат качества ISO 9001.</li></ul>', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', 'Via Ing. Pilade Riello, 7, 37045 Legnago (VR) Italy', null, null, null);
call add_entity_property(@last_id, 'PHONE', '', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'De Dietrich Thermique');
call add_entity_property(@last_id, 'PICTURE', 'http://www.dedietrich-heating.com/design/ddth/images/logo_dedietrich.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.dedietrich-heating.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'De Dietrich Thermique - один из ведущих мировых производителей отопительной техники и номер один во Франции. Экономия энергии и защита окружающей среды многие годы являются приоритетными направлениями  развития компании. Во Франции и за ее пределами De Dietrich Thermique насчитывает более 2 000 сотрудников.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', '<p>Годовой  оборот компании составляет более 400 миллионов евро. В 2004 году была образована промышленная группа  с целью занять место среди пяти крупнейших производителей отопительного оборудования.</p><p>С 2009 года De Dietrich-Remeha входит в состав холдинга BDR Thermea - ведущего мирового производителя и поставщика инновационных систем отопления и горячего водоснабжения. Компания представлена более чем в 60-ти странах.</p><p>Объем продаж De Dietrich-Remeha 300 000 котлов в год: твердотопливных, низкотемпературных на жидком топливе и газе, в том числе 2/3  конденсационных.</p>', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', '57, rue de la Gare – B.P. 30, 67580 MERTZWILLER, France', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+33-388-802-791', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'COSMOGAS S.r.l.');
call add_entity_property(@last_id, 'PICTURE', '', null, null, null);
call add_entity_property(@last_id, 'URL', 'www.cosmogas.com', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Фирма «COSMOGAS» занимается изготовлением отопительной техники в течении сорока лет. В научно-исследовательском центре работают высококвалифицированные специалисты, которые обоснованно и выверено воплощают новые технические идеи в конструкции котлов. В ассортименте имеются газовые котлы мощностью от 15 до 40 кВт и термические модули конденсационного типа мощностью до 720 кВт.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', '', null, null, null);
call add_entity_property(@last_id, 'ADDRESS', 'Via L. Da Vinci 16, 47014 Meldola (FC)', null, null, null);
call add_entity_property(@last_id, 'PHONE', '+39 0543 49.83.83', null, null, null);

set @last_id = eetdb.add_entity('VENDOR', 'Viessmann');
call add_entity_property(@last_id, 'PICTURE', 'http://www.viessmann.de/content/dam/internet-global/images/general/7590.gif', null, null, null);
call add_entity_property(@last_id, 'URL', 'http://www.viessmann.de', null, null, null);
call add_entity_property(@last_id, 'DESCRIPTION', 'Промышленная группа Viessmann - крупнейший производитель оборудования для систем теплоснабжения мирового уровня. Компания была основана в 1917 году. Сегодня её успешно возглавляет доктор Мартин Виссманн, который представляет собой уже третье поколение владельцев предприятия.', null, null, null);
call add_entity_property(@last_id, 'DETAILS', 'Годовой оборот компании Viessmann составляет 1,7 млрд. евро, а количество сотрудников насчитывает около 9400 человек. Компания Viessmann владеет 22 заводами в 10 странах. Ею создана разветвленная сеть крупных центров сбыта, не только в Германии, но и в 74 других странах. Во всем мире открыты 120 торговых филиалов компании. Таким образом, компания Viessmann является крупным игроком на мировом рынке отопительной техники, где 56% всего оборота предприятия приходится на экспорт.', null, null, null);
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
-- call add_entity_property(@last_id, 'DETAILS', '', null, null, null);
-- call add_entity_property(@last_id, 'ADDRESS', '', null, null, null);
-- call add_entity_property(@last_id, 'PHONE', '', null, null, null);

commit;
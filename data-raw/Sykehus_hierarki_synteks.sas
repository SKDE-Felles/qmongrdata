

# definere Sykehusnavn, HF og RHF i sykehusoppholdsfilene, basert p� OrgNrShus.

  
 
# Helse Finnmark HF

if OrgNrShus = 983974880 then Sykehusnavn=10;

if OrgNrShus = 974795930 /*'Finnmarkssykehuset HF, Kirkenes'*/then Sykehusnavn=11;
if OrgNrShus in (974795833 /*'Finnmarkssykehuset HF, Hammerfest'*/,
                        978296296 /*Alta helsesenter*/,
                        974285959 /*Finnmarkssykehuset, Karasjok*/,
                        979873190 /*'Finnmarkssykehuset, Alta*/
) then Sykehusnavn=12;
                        
                        
                        
                        /*************
                        *** UNN HF ***
                        *************/
                        
                        if OrgNrShus in (983974899 /* UNN HF */) then Sykehusnavn=20;
                        if OrgNrShus in (974795787 /*UNN Troms�*/,
                        821847052 /*UNN HF AVD STORSLETT- SOMATIKK*/,
                        921837755 /*UNN HF AVD BARDU- SOMATIKK*/,
                        921837798 /*UNN HF AVD FINNSNES- SOMATIKK*/
                        ) /*'UNN Troms�'*/ then Sykehusnavn=21;
                        if OrgNrShus=974795396 /*'UNN Narvik'*/ then Sykehusnavn=23;
                        if OrgNrShus=974795639 /*'UNN Harstad'*/ then Sykehusnavn=22;
                        
                        
                        /**************
                        *** NLSH HF ***
                        ***************/
                        
                        if OrgNrShus in (983974910 /*Nordlandssykehuset HF */) then Sykehusnavn=30;
                        if OrgNrShus in (974795361 /*Nordlandssykehuset Bod�*/,
                        993562718 /*Nordlandssykehuset HF, Habilitering/rehabilitering, Bod�*/,
                        974049767  /*'Steigen f�destue'*/
                        ) then Sykehusnavn=33;
                        if OrgNrShus in (974795574 /*Nordlandssykehuset Vester�len*/,
                        996722201 /*Nordlandssykehuset HF, Habilitering/rehabilitering, Stokmarknes*/
                        ) then Sykehusnavn=31;
                        if OrgNrShus in (974795558 /*Nordlandssykehuset Lofoten*/,
                        993573159 /*Nordlandssykehuset HF, Habilitering/rehabilitering, Gravdal*/
                        ) then Sykehusnavn=32;
                        
                        
                        /*****************************
                        *** Helgelandssykehuset HF ***
                        *****************************/
                        
                        if OrgNrShus in (983974929 /*'Helgelandssykehuset HF*/) then Sykehusnavn=40;

if OrgNrShus=974795515 /*Helgelandssykehuset HF Mo i Rana */ then Sykehusnavn=41;
if OrgNrShus=974795485 /*Helgelandssykehuset HF Mosj�en*/ then Sykehusnavn=42;
if OrgNrShus in (974795477 /*Helgelandssykehuset HF Sandnessj�en*/,
                        874044342 /*Helgelandssykehuset HF Br�nn�ysund f�destue*/
) then Sykehusnavn=43;


/******************************
  *** Helse Nord-Tr�ndelag HF ***
  ******************************/
  
  if OrgNrShus in (974753898 /*Helse Nord-Tr�ndelag HF -  Namsos*/,
                          994974270 /*Helse Nord-Tr�ndelag, Namsos rehabilitering*/
  ) then Sykehusnavn=51;
if OrgNrShus in (974754118 /*Helse Nord-Tr�ndelag HF -  Levanger*/,
                        994958682/*Helse Nord-Tr�ndelag, Levanger rehabilitering*/
) then Sykehusnavn=52;


/****************************
  *** St. Olavs hospital HF ***
  ****************************/
  
  if OrgNrShus in (913461223 /*St Olavs hospital, Fysikalsk medisin �ya*/,
                          973254782 /*St Olavs hospital, Trondsletten habiliteringssenter */,
                          974749025 /*St Olavs Hospital, Trondheim*/,
                          974749815 /*St Olavs hospital, Fysikalsk medisin Lian*/
  ) then Sykehusnavn=61;
if OrgNrShus in (974329506 /*St Olavs hospital, Orkdal*/) then Sykehusnavn=62;
if OrgNrShus in (974749505 /*St Olavs hospital, R�ros*/) then Sykehusnavn=63;
if OrgNrShus in (995413388 /*St Olavs hospital, Hysnes helsefort*/) then Sykehusnavn=64;

if OrgNrShus in (915621457 /*St Olavs hospital, �rland*/,
                        920196357 /*ST OLAVS HOSPITAL HF REHABILITERING �RLANDET*/
) then Sykehusnavn=65;

/*******************************
  *** Helse M�re og Romsdal HF ***
  *******************************/
  
  if OrgNrShus in (974745569 /*Helse M�re og Romsdal HF Molde sjukehus*/, 
                          984038135 /*Helse M�re og Romsdal HF, Voksenhabilitering Molde*/
  ) then Sykehusnavn=71;
if OrgNrShus in (974746948 /*Helse M�re og Romsdal HF Kristiansund sjukehus*/) then Sykehusnavn=72;
if OrgNrShus in (974747138 /*Helse M�re og Romsdal HF �lesund sjukehus*/,
                        912777294 /*HELSE M�RE OG ROMSDAL HF SEKSJON VAKSENHABILITERING �LESUND*/,
                        916126611 /*HELSE M�RE OG ROMSDAL HF SEKSJON FOR HABILITERING BARN OG UNGE �LESUND*/
) then Sykehusnavn=73;
if OrgNrShus in (974747545 /*Helse M�re og Romsdal HF Volda sjukehus*/) then Sykehusnavn=74;
if OrgNrShus in (974577216 /*Helse M�re og Romsdal HF, Klinikk for Rehabilitering (Mork)*/) then Sykehusnavn=75;
if OrgNrShus in (974576929 /*Helse M�re og Romsdal HF, Nevrohjemmet*/) then Sykehusnavn=76;
if OrgNrShus in (974577054 /*Helse M�re og Romsdal HF, Aure rehabiliteringssenter*/) then Sykehusnavn=77;

/*********************
  *** Helse F�rde HF ***
  *********************/
  if OrgNrShus in (983974732 /*Helse F�rde HF*/) then Sykehusnavn=90;
if OrgNrShus in (974744570 /*Helse F�rde, F�rde*/) then Sykehusnavn=91;
if OrgNrShus in (974745364 /*Helse F�rde, Nordfjord*/) then Sykehusnavn=92;
if OrgNrShus in (974745089 /*Helse F�rde, L�rdal*/) then Sykehusnavn=93;
if OrgNrShus in (974743914 /*Helse F�rde, Flor�*/) then Sykehusnavn=94;



/**********************
  *** Helse Bergen HF ***
  **********************/
  
  if OrgNrShus in (973923811 /*Helse Bergen, Habilitering Voksne*/,
                          974557169 /*Helse Bergen, Rehabilitering*/,
                          974557746 /*Helse Bergen, Haukeland*/,
                          996663191 /*Helse Bergen, Laboratorie og r�ntgen Haukeland*/,
                          997512189 /*HELSE BERGEN HF SEKSJON FOR BEHANDLINGSHJELPEMIDLER MEDISINSK-TEKNISK AVD HAUKELAND*/
  ) then Sykehusnavn=101;
if OrgNrShus in (874743372 /*Helse Bergen, Kysthospitalet i Hagevik*/) then Sykehusnavn=102;
if OrgNrShus in (974743272 /*Helse Bergen, Voss*/) then Sykehusnavn=103;
if OrgNrShus in (973925032 /*Bergen legevakt*/) then Sykehusnavn=104;


/*********************
  *** Helse Fonna HF ***
  *********************/
  if OrgNrShus in (983974694 /* Helse Fonna HF */) then Sykehusnavn=110;
if OrgNrShus in (974743086 /*Helse Fonna, Odda*/) then Sykehusnavn=111;
if OrgNrShus in (974742985 /*Helse Fonna, Stord*/,
                        996328112 /*Helse Fonna, Stord Rehabilitering*/
) then Sykehusnavn=112;
if OrgNrShus in (974724774 /*Helse Fonna, Haugesund*/,
                        976248570 /*Helse Fonna, Haugesund Rehabilitering*/
) then Sykehusnavn=113;
if OrgNrShus in (974829029 /*Helse Fonna, Sauda*/) then Sykehusnavn=114;

/*************************
  *** Helse Stavanger HF ***
  *************************/
  
  if OrgNrShus in (873862122 /*Helse Stavanger, Rehabilitering*/,
                          974624680 /*Helse Stavanger, HABU*/,
                          974703300 /*Helse Stavanger, Stavanger universitetssjukehus*/
  ) then Sykehusnavn=121;
if OrgNrShus in (974703327 /*Helse Stavanger, Egersund*/) then Sykehusnavn=122;


/*************************************
  *** Haraldsplass diakonale sykehus ***
  *************************************/
  
  if OrgNrShus = 974316285 /*Haraldsplass diakonale sykehus */ then Sykehusnavn=260;

/********************************
  *** Resterende Helse Vest RHF ***
  ********************************/
  
  if OrgNrShus in (974737779 /*Betanien spesialistpoliklinikk*/) then Sykehusnavn=131;
if OrgNrShus in (986106839,
                        973156829 /*Haugesund sanitetsforenings revmatismesykehus*/
) then Sykehusnavn=132;

/**********************
  *** Vestre Viken HF ***
  **********************/
  
  if OrgNrShus in (974631326 /*Vestre Viken, Drammen*/,
                          974606305 /*Vestre Viken, Habiliteringssenteret Drammen*/
  ) then Sykehusnavn=141;
if OrgNrShus in (974631385 /*Vestre Viken, Kongsberg*/) then Sykehusnavn=144;
if OrgNrShus in (974631407 /*Vestre Viken, Ringerike*/,
                        874606162 /*Vestre Viken, Hallingdal sjukestugu*/) then Sykehusnavn=143;
if OrgNrShus in (974705788 /*Vestre Viken, B�rum*/) then Sykehusnavn=142;


/****************************
  *** Sykehuset Telemark HF ***
  ****************************/
  
  if OrgNrShus in (983975267 /*Sykehuset Telemark HF */) then Sykehusnavn=150;
if OrgNrShus in (974633159 /*Sykehuset Telemark, Notodden*/) then Sykehusnavn=153;
if OrgNrShus in (974633191 /*Sykehuset Telemark, Skien/Porsgrunn*/,
                        974568209 /*Sykehuset Telemark, Habilitering barn og unge*/,
                        974633221 /*SYKEHUSET TELEMARK HF PORSGRUNN - SOMATIKK*/
) then Sykehusnavn=151;
if OrgNrShus in (974798379 /*Sykehuset Telemark, Rjukan*/) then Sykehusnavn=154;
if OrgNrShus in (983974155 /*Sykehuset Telemark, Krager�*/) then Sykehusnavn=152;
if OrgNrShus in (974568225 /*Sykehuset Telemark, Nordagutu*/) then Sykehusnavn=155;


/**************************************
  *** Akershus universitetssykehus HF ***
  **************************************/
  
  if OrgNrShus in (974706490 /*Akershus universitetssykehus*/,
                          974705192 /*Akershus universitetssykehus, Ski*/,
                          983971636 /*Akershus universitetssykehus HF*/) then Sykehusnavn=160;


/*******************
  *** Innlandet HF ***
  *******************/
  
  if OrgNrShus in (974631768 /*Sykehuset Innlandet, Elverum*/) then Sykehusnavn=171;
if OrgNrShus in (974632535 /*Sykehuset Innlandet, Gj�vik*/) then Sykehusnavn=172;
if OrgNrShus in (874632562 /*Sykehuset Innlandet, Lillehammer*/,
                        975326136 /*Sykehuset Innlandet, Habiliteringstjenesten i Oppland, Lillehammer*/
) then Sykehusnavn=173;
if OrgNrShus in (974631776 /*Sykehuset Innlandet, Kongsvinger*/) then Sykehusnavn=174;
if OrgNrShus in (974725215 /*Sykehuset Innlandet, Tynset*/) then Sykehusnavn=175;
if OrgNrShus in (974632543 /*Sykehuset Innlandet, Granheim lungesykehus*/) then Sykehusnavn=176;
if OrgNrShus in (874631752 /*Sykehuset Innlandet, Ottestad*/	) then Sykehusnavn=177;
if OrgNrShus in (974724960 /*Sykehuset Innlandet, Hamar*/) then Sykehusnavn=178;
if OrgNrShus in (974116650 /*Sykehuset Innlandet, Habiliteringstjenesten i Hedmark, Furnes*/) then Sykehusnavn=179;


/**********************************
  *** Oslo universitetssykehus HF ***
  **********************************/
  if OrgNrShus in (993467049 /*OUS HF*/) then Sykehusnavn=180/*Oslo universitetssykehus HF*/;
if OrgNrShus in (874716782 /*OUS, Rikshospitalet*/) then Sykehusnavn=181;
if OrgNrShus in (974588951 /*OUS, Aker*/) then Sykehusnavn=182;
if OrgNrShus in (974589087 /*OUS, Oslo legevakt*/) then Sykehusnavn=183;
if OrgNrShus in (974589095 /*OUS, Ullev�l*/) then Sykehusnavn=184;
if OrgNrShus in (974705761 /*OUS, Spesialsykehuset for epilepsi*/) then Sykehusnavn=185;
if OrgNrShus in (974707152 /*OUS, Radiumhospitalet*/) then Sykehusnavn=186;
if OrgNrShus in (974728230 /*OUS, Geilomo barnesykehus*/) then Sykehusnavn=187;
if OrgNrShus in (974798263 /*OUS, Voksentoppen*/) then Sykehusnavn=188;
if OrgNrShus in (975298744 /*OUS, Olafiaklinikken*/) then Sykehusnavn=189;


/*************************
  *** Sunnaas sykehus HF ***
  *************************/
  
  if OrgNrShus in (974589214) /*Sunnaas sykehus*/ then Sykehusnavn=190/*Sunnaas sykehus*/;
if OrgNrShus in (914356199) /*Sunnaas sykehus, Nesodden poliklinikk*/ then Sykehusnavn=191/*Sunnaas sykehus, Nesodden poliklinikk*/;
if OrgNrShus in (994869736) /*Sunnaas sykehus, Aker poliklinikk*/ then Sykehusnavn=192/*Sunnaas sykehus, Aker poliklinikk*/;


/***************************
  *** Sykehuset �stfold HF ***
  ***************************/
  /* Lokalisasjoner: Kalnes, Fredrikstad, Moss, Sarpsborg, Halden, Askim og Eidsberg. */
  
  if OrgNrShus in (983971768 /*Sykehuset �stfold HF*/,
                          974633752 /*Sykehuset �stfold*/
  ) then Sykehusnavn=200/*Sykehuset �stfold HF*/;

if OrgNrShus in (974633698 /*Sykehuset �stfold, Moss*/,
                        974634052 /*Sykehuset �stfold, Fysioterapi*/
) then Sykehusnavn=201;
if OrgNrShus in (974703734 /*Sykehuset �stfold, Sarpsborg*/,
                        974703769 /*Sykehuset �stfold, Habiliteringstjenesten*/
) then Sykehusnavn=202;
if OrgNrShus=974633655 /*Sykehuset �stfold, Askim*/then Sykehusnavn=203;

/***************************
  *** S�rlandet sykehus HF ***
  ***************************/
  
  if OrgNrShus in (983975240 /*S�rlandet sykehus HF*/) then Sykehusnavn=210;
if OrgNrShus in (974733013 /*S�rlandet sykehus, Kristiansand*/,
                        974595230 /*S�rlandet sykehus, Rehabilitering Kongsg�rd*/
) then Sykehusnavn=211;
if OrgNrShus in (974631091 /*S�rlandet sykehus, Arendal*/,
                        996891216 /*S�rlandet sykehus HF rehabilitering Arendal*/
) then Sykehusnavn=212;
if OrgNrShus in (974595214 /*S�rlandet sykehus, Flekkefjord*/) then Sykehusnavn=213;


/******************************
  *** Sykehuset i Vestfold HF ***
  ******************************/
  
  if OrgNrShus in (974633574 /*Sykehuset i Vestfold, T�nsberg*/) then Sykehusnavn=221 ;
if OrgNrShus in (974575396 /*Sykehuset i Vestfold, Rehabilitering Kysthospitalet Stavern*/) then Sykehusnavn=222 ;
if OrgNrShus in (899643992 /*Sykehuset i Vestfold, Somatikk Solvang*/) then Sykehusnavn=223;
if OrgNrShus in (974117002 /*Sykehuset i Vestfold, Habilitering Solvang*/) then Sykehusnavn=224;

/***********************************
  *** Diakonhjemmet sykehus ***
  ***********************************/
  if OrgNrShus in (974116804 /*Diakonhjemmet sykehus*/) then Sykehusnavn=230;

/***********************************
  *** Lovisenberg diakonale sykehus **
  ***********************************/
  if OrgNrShus in (974207532 /*Lovisenberg diakonale sykehus*/) then Sykehusnavn=240;

/***********************************
  *** Resterende Helse S�r-�st RHF ***
  ***********************************/
  
  if OrgNrShus in (985962170 /*Martina Hansens Hospital*/) then Sykehusnavn=251;
if OrgNrShus in (981275721 /*Betanien hospital*/) then Sykehusnavn=252;
if OrgNrShus in (985773238 /*Revmatismesykehuset AS, Lillehammer*/) then Sykehusnavn=253;
if OrgNrShus in (984630492 /*Oslo kommunale legevakt*/,
                        997506499 /*Oslo kommunale legevakt, Observasjonsposten*/
) then Sykehusnavn=254 ;

/* Oslo legevakt ligger under OUS HF siden den delen av Oslo legevakt som rapporterer data til NPR
er spesialisthelsetjeneste. Dette er Oslo skadelegevakt som er en avdeling ved OUS som mottar pasienter med akutte skader.
Se https://oslo-universitetssykehus.no/avdelinger/ortopedisk-klinikk/ortopedisk-avdeling-skadelegevakten */
  
  
  /**********************
  *** Private sykehus ***
  **********************/
  
  if OrgNrShus in (813381192 /*Aleris Helse AS Stavanger*/,
                          879595762 /*Teres Drammen*/,
                          879790522 /*Aleris Helse AS Bergen*/,
                          897351102 /*Akademikliniken Oslo AS*/,
                          914751934 /*Privathospitalet AS*/,
                          941455077 /*Medi 3 AS*/,
                          971049456 /*Mj�skirurgene*/,
                          971937548 /*EEG Labora*/,
                          972140295 /*NIMI AS Avd. Mini Ullev�l*/,
                          972149519 /*Teres Rosenborg*/,
                          973129856 /*Volvat medisinske senter AS Oslo*/,
                          973144383 /*LHL-klinikkene Feiring*/,
                          974116561 /*LHL-klinikkene Glittre*/,
                          974504863 /*Aleris Helse AS Trondheim*/,
                          974518821 /*Teres Bergen*/,
                          974917459 /*Norsk diabetikersenter*/,
                          975787419 /*Aleris Helse AS Oslo*/,
                          975933210 /*FysMed-klinkken AS*/,
                          975984168 /*Friskvernklinikken AS*/,
                          977208734 /*Privatsykehuset Haugesund AS*/,
                          980693732 /*Ringvoll klinikken AS*/,
                          980859754 /*Privathospitalet AS*/,
                          981096363 /*Teres S�rlandsparken*/,
                          981541499 /*Teres Colosseum*/,
                          982755999 /*Volvat Stokkan*/,
                          983084478 /*Volvat Troms�*/,
                          983896383 /*Teres Colosseum Stavanger*/,
                          985766924 /*Bergen Spine Center*/,
                          987954167 /*IbsenSykehuset AS*/,
                          991811869 /*Kolibri Medical AS*/,
                          993240184 /*Aleris Helse AS Troms�*/,
                          995590794 /*SVC Norge AS*/,
                          995818728 /*Teres Klinikken Bod�*/,
                          996860884 /*Somni S�vnsenter og Spesialisthelsetjenester AS*/,
                          912817318 /*Somni AS*/,
                          914480752 /*Moloklinikken AS*/,
                          915411223 /*Kalbakkenklinikken AS*/,
                          916269331 /*A-Medi AS*/,
                          916588224 /*Preventia AS*/,
                          998558271 /*Oslo medisinske senter*/,
                          999230008 /*Ifocus �yeklinikk AS*/,
                          812794922 /*Colosseum Mann AS*/,
                          817178782 /*Medi 3 Ringvoll Klinikken AS, avd Kirurgi Hob�l*/,
                          912011135 /*Medi 3 Ringvoll Klinikken AS, avd Oslo*/,
                          914491908 /*Colosseumklinikken medisinske senter AS*/,
                          916603290 /*Sandvika Nevrosenter*/,
                          924291370 /*EEG Laboratoriet AS*/,
                          953164701 /*Volvat medisinske senter AS Oslo - Majorstuen*/,
                          993198846 /*Stiftelsen Barnas fysioterapisenter*/,
                          919729333 /*ALERIS HELSE AS AVD �LESUND*/ ,
                          912419223 /*VOLVAT MEDISINSKE SENTER AS OSLO - SENTRUM*/,
                          918289593	/*VOLVAT MEDISINSKE SENTER AS MOSS*/,
                          919749547	/*VOLVAT MEDISINSKE SENTER AS BERGEN-�SANE*/,
                          974183749	/*VOLVAT MEDISINSKE SENTER AS FREDRIKSTAD*/,
                          976343506	/*VOLVAT MEDISINSKE SENTER AS BERGEN - LAGUNEN*/,
                          995111209 /*LHL-KLINIKKENE BERGEN*/,
                          919028513	/*LHL-SYKEHUSET VESTFOLD*/,
                          920248829	/*LHL SYKEHUSET GARDERMOEN*/,
                          914607493	/*COLOSSEUMKLINIKKEN MEDISINSKE SENTER AS*/,
                          920970893	/*KOLBOTN HJERTESENTER AS*/,
                          921008104	/*EVJEKLINIKKEN AS*/,
                          964249075	/*VIKERSUND BAD REHABILITERINGSSENTER AS*/,
                          987621249	/*IBSENSYKEHUSET GJ�VIK AS*/,
                          988192996	/*N.K.S. HELSEHUS AKERSHUS AS*/,
                          991133720	/*OSLO HJERTEKLINIKK AS*/
  ) then Sykehusnavn=300;


# Definere HF
  
  if 10<=Sykehusnavn<=19 then HF=1/*Finnmarkssykehuset HF*/;
if 20<=Sykehusnavn<=29 then HF=2/*UNN HF*/;
if 30<=Sykehusnavn<=39 then HF=3/*NLSH HF*/;
if 40<=Sykehusnavn<49 then HF=4/*Helgelandssykehuset HF*/;
if 50<=Sykehusnavn<=59 then HF=5/*Helse Nord-Tr�ndelag HF*/;
if 60<= Sykehusnavn<=69 then HF=6/*St. Olavs Hospital HF*/;
if 70<= Sykehusnavn<=79 then HF=7; /*Helse M�re og Romsdal HF*/
  if 90<= Sykehusnavn<=99 then HF=9/*Helse F�rde HF*/;
if 100<= Sykehusnavn<=109 then HF=10/*Helse Bergen HF*/;
if 110<= Sykehusnavn<=119 then HF=11/*Helse Fonna HF*/;
if 120<= Sykehusnavn<=129 then HF=12/*Helse Stavanger HF*/;
if 130<= Sykehusnavn<=139 then HF=13/*Resterende Helse Vest RHF*/;
if 140<=Sykehusnavn<=149 then HF=14/*Vestre Viken HF*/;
if 150<=Sykehusnavn<=159 then HF=15/*Sykehuset Telemark HF*/;
if 160<=Sykehusnavn<=169 then HF=16 /*Akershus univ.sh HF*/;
if 170<=Sykehusnavn<=179 then HF=17/*Sykehuset Innlandet HF*/;
if 180<=Sykehusnavn<=189 then HF=18/*Oslo universitetssykehus HF*/;
if 190<=Sykehusnavn<=199 then HF=19/*Sunnaas sykehus HF*/;
if 200<=Sykehusnavn<=209 then HF=20/*Sykehuset �stfold HF*/;
if 210<=Sykehusnavn<=219 then HF=21/*S�rlandet sykehus HF*/;
if 220<=Sykehusnavn<=229 then HF=22/*Sykehuset i Vestfold HF*/;
if Sykehusnavn=230 then HF=23;/*Diakonhjemmet sykehus*/
  if Sykehusnavn=240 then HF=24;/*Lovisenberg diakonale sykehus*/;
if 251<=Sykehusnavn<=254 then HF=25/*Resterende Helse S�r-�st RHF*/;
if Sykehusnavn=260 then HF=26;/*Haraldsplass diakonale sykehus*/
  if Sykehusnavn=300 then HF=27/*Private sykehus*/;


# Definere RHF
  
  if HF in (1,2,3,4) then RHF=1;/* Helse Nord RHF */
  if HF in (5,6,7) then RHF=2;/* Helse Midt-Norge RHF */
  if HF in (9,10,11,12,13,26)then RHF=3;/* Helse Vest RHF */
  if HF in (14:25) then RHF=4;/* Helse S�r-�st RHF */
  if HF=27 then RHF=5;/* Private sykehus */




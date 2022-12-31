-- Adminer 4.8.1 PostgreSQL 15.1 (Debian 15.1-1.pgdg110+1) dump

DROP TABLE IF EXISTS "abonnement_clients";
DROP SEQUENCE IF EXISTS abonnement_clients_id_seq;
CREATE SEQUENCE abonnement_clients_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."abonnement_clients" (
    "id" integer DEFAULT nextval('abonnement_clients_id_seq') NOT NULL,
    "duree" timestamp NOT NULL,
    "type_contrat" character varying NOT NULL,
    "somme_contrat" character varying NOT NULL,
    "receptionniste" character varying NOT NULL,
    "date_signature_contrat" character varying NOT NULL,
    "signataire_contrat_entreprise" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "abonnement_clients_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "achats";
DROP SEQUENCE IF EXISTS achats_id_seq;
CREATE SEQUENCE achats_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."achats" (
    "id" integer DEFAULT nextval('achats_id_seq') NOT NULL,
    "id_product" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "quantity_achat" character varying NOT NULL,
    "price_achat_unit" character varying NOT NULL,
    "prix_vente_unit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qty_remise" character varying NOT NULL,
    "qty_livre" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "actionnaire_cotisations";
DROP SEQUENCE IF EXISTS actionnaire_cotisations_id_seq;
CREATE SEQUENCE actionnaire_cotisations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."actionnaire_cotisations" (
    "id" integer DEFAULT nextval('actionnaire_cotisations_id_seq') NOT NULL,
    "reference" integer NOT NULL,
    "nom" character varying NOT NULL,
    "post_nom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "matricule" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "note" character varying NOT NULL,
    "moyen_paiement" character varying NOT NULL,
    "numero_transaction" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "actionnaire_cotisations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "actionnaire_transferts";
DROP SEQUENCE IF EXISTS actionnaire_transferts_id_seq;
CREATE SEQUENCE actionnaire_transferts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."actionnaire_transferts" (
    "id" integer DEFAULT nextval('actionnaire_transferts_id_seq') NOT NULL,
    "matricule_envoi" character varying NOT NULL,
    "matricule_recu" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "actionnaire_transferts_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "actionnaires";
DROP SEQUENCE IF EXISTS actionnaires_id_seq;
CREATE SEQUENCE actionnaires_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."actionnaires" (
    "id" integer DEFAULT nextval('actionnaires_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "post_nom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "email" character varying NOT NULL,
    "telephone" character varying NOT NULL,
    "adresse" character varying NOT NULL,
    "sexe" character varying NOT NULL,
    "matricule" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "cotisations" double precision NOT NULL,
    CONSTRAINT "actionnaires_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "agendas";
DROP SEQUENCE IF EXISTS agendas_id_seq;
CREATE SEQUENCE agendas_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."agendas" (
    "id" integer DEFAULT nextval('agendas_id_seq') NOT NULL,
    "title" character varying NOT NULL,
    "description" character varying NOT NULL,
    "date_rappel" timestamp NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "agents";
DROP SEQUENCE IF EXISTS agents_id_seq;
CREATE SEQUENCE agents_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."agents" (
    "id" integer DEFAULT nextval('agents_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "postnom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "email" character varying NOT NULL,
    "telephone" character varying NOT NULL,
    "adresse" character varying NOT NULL,
    "sexe" character varying NOT NULL,
    "role" character varying NOT NULL,
    "matricule" character varying NOT NULL,
    "numero_securite_sociale" character varying NOT NULL,
    "date_naissance" timestamp NOT NULL,
    "lieu_naissance" character varying NOT NULL,
    "nationalite" character varying NOT NULL,
    "type_contrat" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "services_affectation" character varying NOT NULL,
    "date_debut_contrat" timestamp NOT NULL,
    "date_fin_contrat" timestamp NOT NULL,
    "fonction_occupe" character varying NOT NULL,
    "competance" text NOT NULL,
    "experience" text NOT NULL,
    "statut_agent" character varying NOT NULL,
    "created_at" timestamp NOT NULL,
    "photo" character varying,
    "salaire" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "agents_matricule_key" UNIQUE ("matricule")
) WITH (oids = false);

INSERT INTO "agents" ("id", "nom", "postnom", "prenom", "email", "telephone", "adresse", "sexe", "role", "matricule", "numero_securite_sociale", "date_naissance", "lieu_naissance", "nationalite", "type_contrat", "departement", "services_affectation", "date_debut_contrat", "date_fin_contrat", "fonction_occupe", "competance", "experience", "statut_agent", "created_at", "photo", "salaire", "signature", "created") VALUES
(1,	'Kataku',	'Muanza',	'Germain',	'katakugermain@gmail.com',	'+243813530838',	'31 bis tangu, basoko, ngaliema, kinshasa, RDC',	'Homme',	'0',	'WMADM22-001',	'-',	'1991-08-04 00:00:00',	'Mbuji-mayi',	'République démocratique du Congo',	'CDI',	'["Administration","Exploitations","Logistique"]',	'Administration',	'2022-12-22 00:00:00',	'2099-12-31 00:00:00',	'Directeur générale',	'A Completer ',	'A Completer ',	'Actif',	'2022-12-22 13:14:00.878771',	'http://192.168.100.200:3000/uploadfile/uploads/f444dc0d5013ca219a0002a10d1c3a8d.png',	'2500',	'Support',	'2022-12-22 13:14:00.878771'),
(2,	'mbuyi',	'ntumba',	'gedeon ',	'trydonntumba@gmail.com',	'0819753232',	'05 bulambeba, kalamu',	'Homme',	'1',	'WMRH22-002',	'12324',	'1991-12-27 00:00:00',	'mbujimayi',	'République démocratique du Congo',	'CDI',	'["Ressources Humaines","Finances"]',	'Supervision',	'2022-01-01 00:00:00',	'2099-12-31 00:00:00',	'Directeur administratif',	'sciences economique et de gestion',	'5 ans chez cobil RDC',	'Actif',	'2022-12-22 14:20:30.616404',	'http://192.168.100.200:3000/uploadfile/uploads/cf4034b2ffe2446409e6c84e25e2e47e.jpg',	'1500',	'WMRH22-002',	'2022-12-23 12:31:23.105983'),
(3,	'KABANGE',	'MOTA',	'LOUIS',	'kabange@gmail.com',	'0850007580',	'CENTRAL 07',	'Femme',	'2',	'WMRH22-003',	'4582',	'2000-12-22 00:00:00',	'KWANGO',	'République démocratique du Congo',	'CDI',	'["Ressources Humaines"]',	'Recrutement',	'2022-12-22 00:00:00',	'2099-12-31 00:00:00',	'Directeur de departement',	'en comptabilite et mathematique appliquée',	'5 ans a la sogakor',	'Actif',	'2022-12-22 14:26:23.869822',	'https://www.jea.com/cdn/images/avatar.png',	'1000',	'WMRH22-002',	'2022-12-22 14:26:23.869822'),
(6,	'MAMBENI',	'LUKASA',	'MOABITE',	'lukasa@hotmail.com',	'099606607',	'79 MALUKU',	'Homme',	'5',	'WMRH22-006',	'8794/54',	'2000-01-27 00:00:00',	'MOANDA',	'République démocratique du Congo',	'CDD',	'["Ressources Humaines"]',	'Autre',	'2022-12-22 00:00:00',	'2023-01-22 00:00:00',	'Stagiaire professionnel',	'sciences economiques et de gestion',	'etudes academiques',	'Actif',	'2022-12-22 14:41:31.170876',	'https://www.jea.com/cdn/images/avatar.png',	'250',	'WMRH22-002',	'2022-12-22 14:41:31.170876'),
(4,	'BAKAJI ',	'FAYULU',	'CLOE',	'bakajikafayulu@gmail.com',	'0896107800',	'LUSAMBO 16',	'Femme',	'3',	'WMRH22-004',	'452',	'1989-12-08 00:00:00',	'LODJA',	'République démocratique du Congo',	'CDI',	'["Ressources Humaines"]',	'Rémunération du personnel',	'2020-06-22 00:00:00',	'2099-12-31 00:00:00',	'Chef de service',	'gestion ressources humaines isc',	'stage professionnel a l''ONATRA',	'Actif',	'2022-12-22 14:30:59.411463',	'https://www.jea.com/cdn/images/avatar.png',	'750',	'WMRH22-002',	'2022-12-22 14:30:59.411463'),
(5,	'AMISI',	'DELTA',	'MAKINI',	'amisidela@gmail.com',	'89700254',	'rue poto poto 785',	'Femme',	'5',	'WMRH22-005',	'45897',	'1960-01-12 00:00:00',	'abidjan',	'Côte d’Ivoire',	'CDI',	'["Ressources Humaines"]',	'Restoration et Transport',	'2017-05-25 00:00:00',	'2099-12-31 00:00:00',	'Agent',	'gestion de ressources humaines a londres',	'5 au restaurant MC DOWEL USA',	'Actif',	'2022-12-22 14:36:18.75665',	'https://www.jea.com/cdn/images/avatar.png',	'500',	'WMRH22-002',	'2022-12-22 14:36:18.75665'),
(8,	'MUADI',	'KADI',	'SYLVIE',	'muadikadima@gmail.com',	'0819754811',	'UNIVERSITE',	'Femme',	'1',	'WMBUD22-007',	'1542',	'2001-12-06 00:00:00',	'MBUIMAYI',	'République démocratique du Congo',	'CDI',	'["Budgets","Exploitations"]',	'Supervision',	'2022-12-22 00:00:00',	'2099-12-31 00:00:00',	'Directeur de budget',	'finances publiques',	'5 ministere de finaces rdc',	'Actif',	'2022-12-22 15:24:28.274789',	'https://www.jea.com/cdn/images/avatar.png',	'1200',	'WMRH22-002',	'2022-12-22 15:24:28.274789'),
(9,	'KAZADI',	'MPAMBU',	'ARCEL',	'kazaimpambu@gmail.COM',	'090900606',	'NGANAS 1350',	'Homme',	'1',	'WMADM22-008',	'1245',	'1998-06-23 00:00:00',	'MBUJIMAYI',	'République démocratique du Congo',	'CDI',	'["Administration"]',	'Administration',	'2020-12-20 00:00:00',	'2099-12-31 00:00:00',	'Directeur générale',	'LEADERSHIP',	'GESTIONNAIRE MINO CONGO',	'Actif',	'2022-12-22 15:43:15.330282',	'https://www.jea.com/cdn/images/avatar.png',	'3000',	'WMRH22-002',	'2022-12-22 15:43:15.330282'),
(10,	'KAZADI',	'MBUYI',	'JEAN PAUL',	'kazadijeanpaul@gmail.com',	'08160660790',	'ISOKE 30',	'Homme',	'1',	'WMLOG22-009',	'45841',	'1991-04-23 00:00:00',	'KOLWEZI',	'République démocratique du Congo',	'CDI',	'["Logistique"]',	'Supervision',	'2022-12-23 00:00:00',	'2099-12-31 00:00:00',	'Directeur de departement',	'technicien en informatique ',	'2 ans chez masavco congo',	'Actif',	'2022-12-23 11:00:55.190032',	'https://www.jea.com/cdn/images/avatar.png',	'1200',	'WMRH22-002',	'2022-12-23 11:00:55.190032'),
(11,	'LANDU',	'NYOTA',	'PISTHOU',	'landu@gmail.com',	'+243819721540',	'05 AVENU DU FLEUVE',	'Homme',	'2',	'WMLOG22-010',	'1542/2',	'2000-12-23 00:00:00',	'LUANDA',	'République démocratique du Congo',	'CDI',	'["Logistique"]',	'Construction & architecture',	'2022-12-23 00:00:00',	'2099-12-31 00:00:00',	'Chef de service',	'architecture immeuble',	'stage au camp tshatshi',	'Actif',	'2022-12-23 11:12:48.936543',	'https://www.jea.com/cdn/images/avatar.png',	'1000',	'WMRH22-002',	'2022-12-23 11:12:48.936543'),
(12,	'MAJABU',	'BEYA',	'MARINA',	'majabubeya@gmail.com',	'0813004050',	'MANGENGE 16',	'Femme',	'3',	'WMLOG22-011',	'124/0',	'2004-01-09 00:00:00',	'MBUJIMAYI',	'République démocratique du Congo',	'CDI',	'["Logistique"]',	'Planification & wherehouse',	'2022-12-13 00:00:00',	'2099-12-31 00:00:00',	'Agent',	'gestion des avoirs',	'2 ans a l''ecole saint raphael',	'Actif',	'2022-12-23 11:16:24.535398',	'https://www.jea.com/cdn/images/avatar.png',	'700',	'WMRH22-002',	'2022-12-23 11:16:24.535398'),
(14,	'MALAKO',	'KIZUNZI',	'LOUIS FRANCE',	'malako@yahoo.fr',	'0840008477',	'MAIKAO 630',	'Homme',	'5',	'WMLOG22-013',	'14578/2',	'1978-12-13 00:00:00',	'BANDUNDU',	'République démocratique du Congo',	'CDD',	'["Logistique"]',	'Maintenance curative',	'2022-12-23 00:00:00',	'2023-02-10 00:00:00',	'Stagiaire professionnel',	'comptabilite ',	'stage a bracongo',	'Actif',	'2022-12-23 11:23:40.834124',	'https://www.jea.com/cdn/images/avatar.png',	'200',	'WMRH22-002',	'2022-12-23 11:24:40.308043'),
(13,	'MASIKI',	'LUAMBO',	'LOIK',	'masikiluao@gmail.com',	'0810382858',	'05 MABANGA NGULA',	'Homme',	'4',	'WMLOG22-012',	'-',	'1988-09-16 00:00:00',	'MATADI',	'République démocratique du Congo',	'CDD',	'["Logistique"]',	'Maintenance preventive',	'2022-12-23 00:00:00',	'2023-02-23 00:00:00',	'Expert',	'EPERTISE EN LOGISTIQUE',	'3 MAINTENANCE CHEZ VODACOM CONGO',	'Actif',	'2022-12-23 11:19:44.670375',	'https://www.jea.com/cdn/images/avatar.png',	'500',	'WMRH22-002',	'2022-12-23 11:19:44.670375'),
(15,	'MULANGA',	'KADIMA',	'CHRISTIANA',	'mulangakadima@gmail.com',	'0856103035',	'UNIVERSITE 30',	'Femme',	'1',	'WMCOM22-014',	'1002/12',	'2004-10-30 00:00:00',	'KINSHASA',	'République démocratique du Congo',	'CDI',	'["Commercial"]',	'Supervision',	'2022-12-03 00:00:00',	'2099-12-31 00:00:00',	'Directeur de departement',	'sciences commerciales',	'5 agents des ventes UAC',	'Actif',	'2022-12-23 12:10:53.227261',	'https://www.jea.com/cdn/images/avatar.png',	'1200',	'WMRH22-002',	'2022-12-23 12:10:53.227261'),
(16,	'MATSHIKO',	'MWANTA',	'DIVINE',	'matshikomwanta@gmail.com',	'0999000010',	'LOWOZI',	'Femme',	'2',	'WMCOM22-015',	'01245/2',	'2000-01-23 00:00:00',	'LUKALA',	'République démocratique du Congo',	'CDI',	'["Commercial"]',	'Organisation et management',	'2022-11-01 00:00:00',	'2099-12-31 00:00:00',	'Gerant succursale',	'sciences commerciales et administratives',	'pas d''experiences acquises',	'Actif',	'2022-12-23 12:14:39.532943',	'https://www.jea.com/cdn/images/avatar.png',	'1000',	'WMRH22-002',	'2022-12-23 12:14:39.532943'),
(19,	'MIADAMBU',	'BEYA',	'DEBORAH',	'miadambu@gmail.com',	'0905051310',	'IMMOCONGO 152',	'Femme',	'5',	'WMCOM22-018',	'254/02',	'1999-11-27 00:00:00',	'MBUJIMAYI',	'République démocratique du Congo',	'CDI',	'["Commercial"]',	'Agent commercial',	'2021-12-23 00:00:00',	'2099-12-31 00:00:00',	'Agent',	'commercial et administrative',	'5 ans zigida',	'Actif',	'2022-12-23 13:04:21.315092',	'https://www.jea.com/cdn/images/avatar.png',	'350',	'WMRH22-002',	'2022-12-23 13:04:21.315092'),
(18,	'TAWABA',	'KENGE',	'JEAN LOUIS',	'tawabakenge@gmail.com',	'0891205051',	'089 luanzo',	'Homme',	'5',	'WMCOM22-017',	'01245',	'1970-02-03 00:00:00',	'MAINDOMBE',	'République démocratique du Congo',	'CDI',	'["Commercial"]',	'Gestion operationnelle',	'2022-12-23 00:00:00',	'2099-12-31 00:00:00',	'Directeur de departement',	'commercial et administrative',	'2 ans au marché zigida',	'Actif',	'2022-12-23 12:30:13.981254',	'https://www.jea.com/cdn/images/avatar.png',	'500',	'WMRH22-002',	'2022-12-23 12:30:13.981254'),
(17,	'LOSAMBA',	'MAKUTANO',	'Cloé Nickel',	'losambamakutano@gmail.com',	'09901292790',	'golf 330',	'Femme',	'2',	'WMCOM22-016',	'-',	'2003-06-23 00:00:00',	'lubumbashi',	'République démocratique du Congo',	'CDI',	'["Commercial"]',	'Supervision',	'2020-04-01 00:00:00',	'2099-12-31 00:00:00',	'Chef de service',	'sciences economiques et de gestion/unikin',	'10 chez mino congo comme agent commercial',	'Actif',	'2022-12-23 12:18:45.814009',	'https://www.jea.com/cdn/images/avatar.png',	'800',	'Support',	'2022-12-24 18:55:54.603343'),
(23,	'BUBANJI',	'NTUMBA',	'NELLY',	'bubanji@gmail.com',	'0816012230',	'LUSAMBO',	'Femme',	'4',	'WMCPT22-022',	'1242',	'1995-12-03 00:00:00',	'MBUJIMAI',	'République démocratique du Congo',	'CDI',	'["Comptabilites"]',	'Verification',	'2022-12-20 00:00:00',	'2099-12-31 00:00:00',	'Stagiaire professionnel',	'sciences economique et de gestion',	'3 mois de stage',	'Inactif',	'2022-12-23 11:54:48.077481',	'https://www.jea.com/cdn/images/avatar.png',	'500',	'WMRH22-002',	'2022-12-23 11:54:48.077481'),
(26,	'shabani',	'ndonda',	'merveil',	'nondashabani@gmail.com',	'0840008561',	'nelson manela 1235',	'Homme',	'3',	'WMEXP22-025',	'4512',	'1984-01-23 00:00:00',	'kinshasa',	'Afrique du Sud',	'CDI',	'["Exploitations"]',	'Supervision',	'2022-12-23 00:00:00',	'2099-12-31 00:00:00',	'Agent',	'enquetes et statistique',	'3 ans chez airtel congo',	'Inactif',	'2022-12-23 12:07:30.512209',	'https://www.jea.com/cdn/images/avatar.png',	'500',	'WMRH22-002',	'2022-12-23 12:07:30.512209'),
(21,	'BADU',	'BADU',	'JACQUES',	'babu01@gmail.com',	'0900012011',	'MATADI 15',	'Homme',	'1',	'WMCPT22-020',	'-',	'1960-12-03 00:00:00',	'CONGO CENTRAL',	'République démocratique du Congo',	'CDI',	'["Comptabilites"]',	'Supervision',	'2022-12-23 00:00:00',	'2099-12-31 00:00:00',	'Chef de service',	'leadership',	'3 ans marketing uba',	'Actif',	'2022-12-23 11:37:24.398854',	'https://www.jea.com/cdn/images/avatar.png',	'1200',	'WMRH22-002',	'2022-12-23 11:37:24.398854'),
(27,	'MUSAS',	'KANGEZ',	'ODON',	'musaskangez@gmail.com',	'08987254',	'KASAI 502',	'Homme',	'4',	'WMFIN22-026',	'-',	'1962-12-23 00:00:00',	'KIKWIT',	'République démocratique du Congo',	'CDI',	'["Finances"]',	'Supervision',	'2022-12-23 00:00:00',	'2099-12-31 00:00:00',	'Agent',	'commercial et marketing',	'pas d''eperiences',	'Actif',	'2022-12-23 12:12:27.196605',	'https://www.jea.com/cdn/images/avatar.png',	'350',	'WMRH22-002',	'2022-12-23 12:12:27.196605'),
(25,	'NGULU',	'MATONJI',	'gregoire',	'ngulumatonji@gmail.com',	'080192222',	'ngaliema 1742',	'Homme',	'2',	'WMEXP22-024',	'52132',	'1942-09-09 00:00:00',	'kabongo',	'République démocratique du Congo',	'CDI',	'["Exploitations"]',	'Gestion des projets',	'2022-12-23 00:00:00',	'2099-12-31 00:00:00',	'Chef de service',	'gestion des projet',	'5 ans chez ong tosungana',	'Actif',	'2022-12-23 12:03:29.407542',	'https://www.jea.com/cdn/images/avatar.png',	'1000',	'WMRH22-002',	'2022-12-23 12:03:29.407542'),
(24,	'LOSAMBO',	'MAYOMBI',	'PATRICK',	'losambo@gmail.com',	'819753200',	' DE LA PARC 20',	'Homme',	'1',	'WMEXP22-023',	'010054',	'2000-02-13 00:00:00',	'KOLWEZI',	'République démocratique du Congo',	'CDI',	'["Exploitations"]',	'Supervision',	'2022-02-23 00:00:00',	'2099-12-31 00:00:00',	'Directeur de departement',	'gestion de projet',	'10 ans d''eperience a l''unesco',	'Actif',	'2022-12-23 11:57:59.45752',	'https://www.jea.com/cdn/images/avatar.png',	'1700',	'WMRH22-002',	'2022-12-23 11:57:59.45752'),
(20,	'NTUMBA',	'KAZADI',	'FABIEN',	'ntumbafabien@gmail.com',	'0819750000',	'51 NGALA MULUME',	'Homme',	'1',	'WMCPT22-019',	'05542',	'1988-12-23 00:00:00',	'MIABI',	'République démocratique du Congo',	'CDI',	'["Comptabilites","Marketing"]',	'Supervision',	'2022-12-23 00:00:00',	'2099-12-31 00:00:00',	'Directeur de departement',	'commercial et administrive',	'5ans comptabilite',	'Actif',	'2022-12-23 11:34:06.045161',	'https://www.jea.com/cdn/images/avatar.png',	'1500',	'WMRH22-002',	'2022-12-23 11:34:06.045161'),
(22,	'luambo',	'kwanza',	'jean',	'luambokwanza@gmail.com',	'0800015020',	' malaika 50',	'Homme',	'3',	'WMCPT22-021',	'-',	'1977-03-13 00:00:00',	'kinshasa',	'République démocratique du Congo',	'CDI',	'["Comptabilites"]',	'Ecriture des comptes bilan',	'2022-12-23 00:00:00',	'2099-12-31 00:00:00',	'Agent',	'sciences economiqus et de gestion',	'3 equity banque',	'Actif',	'2022-12-23 11:41:24.746975',	'https://www.jea.com/cdn/images/avatar.png',	'700',	'WMRH22-002',	'2022-12-23 11:41:24.746975'),
(28,	'LANDU',	'MOYO',	'MAURICE',	'landumoyo@gmail.com',	'0859012000',	'MBUJIMAYI 02',	'Homme',	'3',	'WMFIN22-027',	'210/2',	'1983-12-23 00:00:00',	'KINSHASA',	'République démocratique du Congo',	'CDI',	'["Finances"]',	'Supervision',	'2022-12-23 00:00:00',	'2099-12-31 00:00:00',	'Chef de service',	'finance publique ',	'2 a la banque centrale de l''afrique du sud',	'Actif',	'2022-12-23 13:18:07.067237',	'https://www.jea.com/cdn/images/avatar.png',	'1200',	'WMRH22-002',	'2022-12-23 13:18:07.067237');

DROP TABLE IF EXISTS "agents_roles";
DROP SEQUENCE IF EXISTS agents_roles_id_seq;
CREATE SEQUENCE agents_roles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."agents_roles" (
    "id" integer DEFAULT nextval('agents_roles_id_seq') NOT NULL,
    "reference" integer NOT NULL,
    "departement" character varying NOT NULL,
    "agent" character varying NOT NULL,
    "role" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "agents_roles_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "annuaires";
DROP SEQUENCE IF EXISTS annuaires_id_seq;
CREATE SEQUENCE annuaires_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."annuaires" (
    "id" integer DEFAULT nextval('annuaires_id_seq') NOT NULL,
    "categorie" character varying NOT NULL,
    "nom_postnom_prenom" character varying NOT NULL,
    "email" character varying NOT NULL,
    "mobile_1" character varying NOT NULL,
    "mobile_2" character varying NOT NULL,
    "secteur_activite" character varying NOT NULL,
    "nom_entreprise" character varying NOT NULL,
    "grade" character varying NOT NULL,
    "adresse_entreprise" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "approvision_receptions";
DROP SEQUENCE IF EXISTS approvision_receptions_id_seq;
CREATE SEQUENCE approvision_receptions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."approvision_receptions" (
    "id" integer DEFAULT nextval('approvision_receptions_id_seq') NOT NULL,
    "provision" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "signature_livraison" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "accuse_reception" character varying NOT NULL,
    "signature_reception" character varying NOT NULL,
    "created_reception" timestamp NOT NULL,
    "livraison_annuler" character varying NOT NULL,
    "reference" integer NOT NULL,
    CONSTRAINT "approvision_receptions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "approvisionnements";
DROP SEQUENCE IF EXISTS approvisionnements_id_seq;
CREATE SEQUENCE approvisionnements_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."approvisionnements" (
    "id" integer DEFAULT nextval('approvisionnements_id_seq') NOT NULL,
    "provision" character varying NOT NULL,
    "quantity_total" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "fournisseur" character varying NOT NULL,
    CONSTRAINT "approvisionnements_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "archives";
DROP SEQUENCE IF EXISTS archives_id_seq;
CREATE SEQUENCE archives_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."archives" (
    "id" integer DEFAULT nextval('archives_id_seq') NOT NULL,
    "departement" character varying NOT NULL,
    "folder_name" character varying NOT NULL,
    "nom_document" character varying NOT NULL,
    "description" character varying NOT NULL,
    "fichier" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "reference" integer NOT NULL,
    "level" character varying NOT NULL,
    CONSTRAINT "archives_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "archives_folders";
DROP SEQUENCE IF EXISTS archives_folders_id_seq;
CREATE SEQUENCE archives_folders_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."archives_folders" (
    "id" integer DEFAULT nextval('archives_folders_id_seq') NOT NULL,
    "departement" character varying NOT NULL,
    "folder_name" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "archives_folders_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "archives_folders" ("id", "departement", "folder_name", "signature", "created") VALUES
(1,	'["Ressources Humaines"]',	'CORRESPONACES DU JOUR 02/12/2022',	'WMRH22-006',	'2022-12-22 14:48:22.661395'),
(2,	'["Administration","Exploitations","Logistique"]',	'test',	'WMADM22-001',	'2022-12-22 14:49:58.760863'),
(3,	'["Support"]',	'facture',	'Support',	'2022-12-29 15:48:52.422476');

DROP TABLE IF EXISTS "balances";
DROP SEQUENCE IF EXISTS balances_id_seq;
CREATE SEQUENCE balances_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."balances" (
    "id" integer DEFAULT nextval('balances_id_seq') NOT NULL,
    "numero_operation" character varying NOT NULL,
    "libele" character varying NOT NULL,
    "comptes" character varying NOT NULL,
    "debit" character varying NOT NULL,
    "credit" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "balances_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "balances" ("id", "numero_operation", "libele", "comptes", "debit", "credit", "signature", "created") VALUES
(1,	'001',	'JOURNAL EXERCICES 2022',	'601_Achats_de_marchandises',	'2000',	'0',	'WMCPT22-021',	'2022-12-23 13:45:57.721697'),
(2,	'001',	'JOURNAL EXERCICES 2022',	'31_Marchandises',	'0',	'2000',	'WMCPT22-021',	'2022-12-23 13:45:57.797694'),
(3,	'002',	'DOTATION AUX AMORTESEMENTS DE LA CLASSE 2',	'68_Dotations_aux_amortissements',	'500',	'0',	'WMCPT22-021',	'2022-12-23 13:48:00.973215'),
(4,	'002',	'DOTATION AUX AMORTESEMENTS DE LA CLASSE 2',	'28_Amortissements',	'0',	'500',	'WMCPT22-021',	'2022-12-23 13:48:01.00653'),
(5,	'003',	'VENTE AU COMPTANT',	'701_Ventes_de_marchandises',	'2500',	'0',	'WMCPT22-021',	'2022-12-23 13:48:47.142254'),
(6,	'003',	'VENTE AU COMPTANT',	'4011_Fournisseurs',	'0',	'2500',	'WMCPT22-021',	'2022-12-23 13:48:47.174255'),
(7,	'004',	'ACHAT TERRAIN',	'57_Caisse',	'50000',	'0',	'WMCPT22-021',	'2022-12-23 13:50:47.289944'),
(8,	'004',	'ACHAT TERRAIN',	'2323_Bâtiments_administratifs_et_commerciaux',	'0',	'50000',	'WMCPT22-021',	'2022-12-23 13:50:47.326164'),
(9,	'005',	'EMPRUNT',	'17_Dettes_de_credit	bail_et_contrats_assimiles',	'15000',	'0',	'WMCPT22-021',	'2022-12-23 13:52:36.454692'),
(10,	'005',	'EMPRUNT',	'56_Banques,_credits_de_tresorerie_et_d_escompte',	'0',	'15000',	'WMCPT22-021',	'2022-12-23 13:52:36.487443'),
(11,	'006',	'ACHAT MARCHANDISE',	'57_Caisse',	'5000',	'0',	'WMCPT22-021',	'2022-12-23 13:54:08.414142'),
(12,	'006',	'ACHAT MARCHANDISE',	'31_Marchandises',	'0',	'5000',	'WMCPT22-021',	'2022-12-23 13:54:08.448148'),
(13,	'007',	'CREDITE MA CAISSE',	'57_Caisse',	'3000',	'0',	'WMCPT22-021',	'2022-12-23 13:55:57.21312'),
(14,	'007',	'CREDITE MA CAISSE',	'17_Dettes_de_credit	bail_et_contrats_assimiles',	'0',	'3000',	'WMCPT22-021',	'2022-12-23 13:55:57.243245'),
(15,	'008',	'VENTE MARCHANDISES',	'31_Marchandises',	'1500',	'0',	'WMCPT22-021',	'2022-12-23 13:58:49.876144'),
(16,	'008',	'VENTE MARCHANDISES',	'4011_Fournisseurs',	'0',	'1500',	'WMCPT22-021',	'2022-12-23 13:58:49.908872'),
(17,	'009',	'EMPRUNT',	'17_Dettes_de_credit	bail_et_contrats_assimiles',	'2700',	'0',	'WMCPT22-021',	'2022-12-23 14:01:21.218896'),
(18,	'009',	'EMPRUNT',	'57_Caisse',	'0',	'2700',	'WMCPT22-021',	'2022-12-23 14:01:21.252045');

DROP TABLE IF EXISTS "banque_names";
DROP SEQUENCE IF EXISTS banque_names_id_seq;
CREATE SEQUENCE banque_names_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."banque_names" (
    "id" integer DEFAULT nextval('banque_names_id_seq') NOT NULL,
    "nom_complet" character varying NOT NULL,
    "rccm" character varying NOT NULL,
    "id_nat" character varying NOT NULL,
    "addresse" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "banque_names_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "banque_names" ("id", "nom_complet", "rccm", "id_nat", "addresse", "created") VALUES
(1,	'TRUST MAST BANK',	'TMB',	'12/0045',	'AVENUE VICTOIRE 40,  KALAMU',	'2022-12-23 13:09:01.041661'),
(2,	'RAW BANK',	'RAW B',	'145-254/KN',	'GOMBE/ DE LA JUSTE 501',	'2022-12-23 13:09:59.646695');

DROP TABLE IF EXISTS "banques";
DROP SEQUENCE IF EXISTS banques_id_seq;
CREATE SEQUENCE banques_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."banques" (
    "id" integer DEFAULT nextval('banques_id_seq') NOT NULL,
    "nom_complet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant_depot" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "type_operation" character varying NOT NULL,
    "numero_operation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "reference" integer NOT NULL,
    "banque_name" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "montant_retrait" character varying NOT NULL
) WITH (oids = false);

INSERT INTO "banques" ("id", "nom_complet", "piece_justificative", "libelle", "montant_depot", "departement", "type_operation", "numero_operation", "signature", "reference", "banque_name", "created", "montant_retrait") VALUES
(1,	'VERSEMENT',	'00001',	'VERSEMENT DE LA SUCCURCAL',	'100000',	'-',	'Depot',	'Transaction-Banque-1',	'WMRH22-002',	2,	'RAW BANK',	'2022-12-25 11:20:51.30851',	'0'),
(2,	'VERSEMENT DE LA VENTE AU COMPTANT',	'00002',	'VENTE EN SOLDES DES 4 ANCIENS VEHICULES DE LA LOGISTIQUE ',	'30000',	'-',	'Depot',	'Transaction-Banque-2',	'WMRH22-002',	2,	'RAW BANK',	'2022-12-25 11:23:56.499411',	'0'),
(3,	'RETRAIT',	'00003',	'AVANCE SUR LA FORMATION',	'0',	'-',	'Retrait',	'Transaction-Banque-3',	'WMRH22-002',	2,	'RAW BANK',	'2022-12-25 11:25:49.385783',	'500'),
(4,	'RETRAIT ',	'00004',	'RETRAIT POUR PAIMENT DE LA MANUTAION',	'0',	'-',	'Retrait',	'Transaction-Banque-4',	'WMRH22-002',	2,	'RAW BANK',	'2022-12-25 11:27:05.998668',	'600'),
(5,	'VERSEMENT ',	'00005',	'SUR LE SERVICE DE NETOYAGE DE LA PRESIDENCE',	'5500',	'-',	'Depot',	'Transaction-Banque-5',	'WMRH22-002',	2,	'RAW BANK',	'2022-12-25 11:28:15.585638',	'0');

DROP TABLE IF EXISTS "bilans";
DROP SEQUENCE IF EXISTS bilans_id_seq;
CREATE SEQUENCE bilans_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."bilans" (
    "id" integer DEFAULT nextval('bilans_id_seq') NOT NULL,
    "title_bilan" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "is_submit" character varying NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL,
    CONSTRAINT "bilans_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "bilans" ("id", "title_bilan", "signature", "created", "is_submit", "approbation_dd", "motif_dd", "signature_dd") VALUES
(1,	'BILAN D''OUVERTURE 2022',	'WMCPT22-021',	'2022-12-23 14:13:17.906879',	'false',	'-',	'-',	'-'),
(2,	'BILAN  D''OUVERTURE',	'WMCPT22-021',	'2022-12-23 14:19:13.585711',	'false',	'-',	'-',	'-');

DROP TABLE IF EXISTS "bon_livraisons";
DROP SEQUENCE IF EXISTS bon_livraisons_id_seq;
CREATE SEQUENCE bon_livraisons_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."bon_livraisons" (
    "id" integer DEFAULT nextval('bon_livraisons_id_seq') NOT NULL,
    "id_product" character varying NOT NULL,
    "quantity_achat" character varying NOT NULL,
    "price_achat_unit" character varying NOT NULL,
    "prix_vente_unit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "first_name" character varying NOT NULL,
    "last_name" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qty_remise" character varying NOT NULL,
    "accuse_reception" character varying NOT NULL,
    "accuse_reception_first_name" character varying NOT NULL,
    "accuse_reception_last_name" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);

INSERT INTO "bon_livraisons" ("id", "id_product", "quantity_achat", "price_achat_unit", "prix_vente_unit", "unite", "first_name", "last_name", "tva", "remise", "qty_remise", "accuse_reception", "accuse_reception_first_name", "accuse_reception_last_name", "succursale", "signature", "created") VALUES
(1,	'SUCRE-KWILUNGOGO-SAC-JAUNE-SACS',	'2000',	'55',	'58.0',	'SACS',	'DIVINE',	'MATSHIKO',	'16.0',	'57.42',	'10.0',	'false',	'-',	'-',	'VTC BUSNESS',	'WMCOM22-015',	'2022-12-25 12:14:48.745996'),
(2,	'SEMOULE-CARAMOURA-25KG-BLANC-SACS',	'1000',	'18',	'21.0',	'SACS',	'DIVINE',	'MATSHIKO',	'1.0',	'20.79',	'10.0',	'false',	'-',	'-',	'VTC BUSNESS',	'WMCOM22-015',	'2022-12-25 12:15:38.313008'),
(3,	'LAIT-COWBELL-SACHET-20G-SACHETS',	'500',	'3500',	'4100.0',	'SACHETS',	'DIVINE',	'MATSHIKO',	'16.0',	'4059.0',	'5.0',	'false',	'-',	'-',	'VTC BUSNESS',	'WMCOM22-015',	'2022-12-25 12:16:24.547456'),
(4,	'TELEPHONE-IPHONE14-500GO-COULEUR-PIÈCES',	'25',	'650',	'690.0',	'PIÈCES',	'DIVINE',	'MATSHIKO',	'16.0',	'683.1',	'3.0',	'false',	'-',	'-',	'GD BUSNESS',	'WMCOM22-015',	'2022-12-25 12:17:06.424416'),
(5,	'CLIMATISEUR-SAMSUNG-25VLT---PIÈCES',	'5',	'250',	'270.0',	'',	'DIVINE',	'MATSHIKO',	'16.0',	'267.3',	'0.0',	'false',	'-',	'-',	'GD BUSNESS',	'WMCOM22-015',	'2022-12-25 12:17:43.51117');

DROP TABLE IF EXISTS "caisse_names";
DROP SEQUENCE IF EXISTS caisse_names_id_seq;
CREATE SEQUENCE caisse_names_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."caisse_names" (
    "id" integer DEFAULT nextval('caisse_names_id_seq') NOT NULL,
    "nom_complet" character varying NOT NULL,
    "rccm" character varying NOT NULL,
    "id_nat" character varying NOT NULL,
    "addresse" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "caisse_names_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "caisse_names" ("id", "nom_complet", "rccm", "id_nat", "addresse", "created") VALUES
(1,	'CAISSE SALAIRE',	'-',	'-',	'INTERNE ',	'2022-12-23 13:10:40.247391'),
(2,	'CAISSE RESERVE',	'-',	'-',	'INTERNE',	'2022-12-23 13:11:07.561323'),
(3,	'CAISSE IMPREVUS',	'-',	'-',	'INTERNE',	'2022-12-23 13:11:46.604287'),
(4,	'CAISSE OPERATIONS',	'-',	'-',	'-',	'2022-12-23 13:12:05.920387');

DROP TABLE IF EXISTS "caisses";
DROP SEQUENCE IF EXISTS caisses_id_seq;
CREATE SEQUENCE caisses_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."caisses" (
    "id" integer DEFAULT nextval('caisses_id_seq') NOT NULL,
    "nom_complet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant_encaissement" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "type_operation" character varying NOT NULL,
    "numero_operation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "reference" integer NOT NULL,
    "caisse_name" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "montant_decaissement" character varying NOT NULL
) WITH (oids = false);

INSERT INTO "caisses" ("id", "nom_complet", "piece_justificative", "libelle", "montant_encaissement", "departement", "type_operation", "numero_operation", "signature", "reference", "caisse_name", "created", "montant_decaissement") VALUES
(1,	'test caisse',	'45682',	'test caisse',	'500',	'-',	'Encaissement',	'Transaction-Caisse-1',	'Support',	4,	'CAISSE OPERATIONS',	'2022-12-29 12:51:32.177726',	'0'),
(2,	'text',	'4568',	'test decaissement',	'0',	'-',	'Decaissement',	'Transaction-Caisse-2',	'Support',	4,	'CAISSE OPERATIONS',	'2022-12-29 12:52:10.277595',	'200');

DROP TABLE IF EXISTS "campaigns";
DROP SEQUENCE IF EXISTS campaigns_id_seq;
CREATE SEQUENCE campaigns_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."campaigns" (
    "id" integer DEFAULT nextval('campaigns_id_seq') NOT NULL,
    "type_produit" character varying NOT NULL,
    "date_debut_et_fin" character varying NOT NULL,
    "cout_campaign" character varying NOT NULL,
    "lieu_cible" character varying NOT NULL,
    "promotion" character varying NOT NULL,
    "objectifs" character varying NOT NULL,
    "observation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created_ref" timestamp NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dg" character varying NOT NULL,
    "motif_dg" character varying NOT NULL,
    "signature_dg" character varying NOT NULL,
    "approbation_budget" character varying NOT NULL,
    "motif_budget" character varying NOT NULL,
    "signature_budget" character varying NOT NULL,
    "approbation_fin" character varying NOT NULL,
    "motif_fin" character varying NOT NULL,
    "signature_fin" character varying NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL,
    "ligne_budgetaire" character varying NOT NULL,
    "ressource" character varying NOT NULL,
    CONSTRAINT "campaigns_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "carts";
DROP SEQUENCE IF EXISTS carts_id_seq;
CREATE SEQUENCE carts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."carts" (
    "id" integer DEFAULT nextval('carts_id_seq') NOT NULL,
    "id_product_cart" character varying NOT NULL,
    "quantity_cart" character varying NOT NULL,
    "price_cart" character varying NOT NULL,
    "price_achat_unit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qty_remise" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "created_at" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "compte_actifs";
DROP SEQUENCE IF EXISTS compte_actifs_id_seq;
CREATE SEQUENCE compte_actifs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."compte_actifs" (
    "id" integer DEFAULT nextval('compte_actifs_id_seq') NOT NULL,
    "reference" timestamp NOT NULL,
    "comptes" character varying NOT NULL,
    "montant" character varying NOT NULL,
    CONSTRAINT "compte_actifs_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "compte_bilan_ref";
DROP SEQUENCE IF EXISTS compte_bilan_ref_id_seq;
CREATE SEQUENCE compte_bilan_ref_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."compte_bilan_ref" (
    "id" integer DEFAULT nextval('compte_bilan_ref_id_seq') NOT NULL,
    "reference" integer NOT NULL,
    "comptes" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "type" character varying NOT NULL,
    CONSTRAINT "compte_bilan_ref_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "compte_passifs";
DROP SEQUENCE IF EXISTS compte_passifs_id_seq;
CREATE SEQUENCE compte_passifs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."compte_passifs" (
    "id" integer DEFAULT nextval('compte_passifs_id_seq') NOT NULL,
    "reference" timestamp NOT NULL,
    "comptes" character varying NOT NULL,
    "montant" character varying NOT NULL,
    CONSTRAINT "compte_passifs_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "comptes_resultat";
DROP SEQUENCE IF EXISTS comptes_resultat_id_seq;
CREATE SEQUENCE comptes_resultat_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."comptes_resultat" (
    "id" integer DEFAULT nextval('comptes_resultat_id_seq') NOT NULL,
    "intitule" character varying NOT NULL,
    "achat_marchandises" character varying NOT NULL,
    "variation_stock_marchandises" character varying NOT NULL,
    "achat_approvionnements" character varying NOT NULL,
    "variation_approvionnements" character varying NOT NULL,
    "autres_charges_externe" character varying NOT NULL,
    "impots_taxes_versements_assimiles" character varying NOT NULL,
    "renumeration_personnel" character varying NOT NULL,
    "charges_socialas" character varying NOT NULL,
    "dotatiopns_provisions" character varying NOT NULL,
    "autres_charges" character varying NOT NULL,
    "charges_financieres" character varying NOT NULL,
    "charges_exptionnelles" character varying NOT NULL,
    "impot_surbenefices" character varying NOT NULL,
    "solde_crediteur" character varying NOT NULL,
    "ventes_marchandises" character varying NOT NULL,
    "production_vendue_bien_et_serices" character varying NOT NULL,
    "production_stockee" character varying NOT NULL,
    "production_immobilisee" character varying NOT NULL,
    "subvention_exploitation" character varying NOT NULL,
    "autre_produits" character varying NOT NULL,
    "montant_exportation" character varying NOT NULL,
    "produit_financieres" character varying NOT NULL,
    "produit_exceptionnels" character varying NOT NULL,
    "solde_debiteur" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created_ref" timestamp NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "coupure_billets";
DROP SEQUENCE IF EXISTS coupure_billets_id_seq;
CREATE SEQUENCE coupure_billets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."coupure_billets" (
    "id" integer DEFAULT nextval('coupure_billets_id_seq') NOT NULL,
    "reference" integer NOT NULL,
    "nombre_billet" character varying NOT NULL,
    "coupure_billet" character varying NOT NULL,
    CONSTRAINT "coupure_billets_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "creance_dettes";
DROP SEQUENCE IF EXISTS creance_dettes_id_seq;
CREATE SEQUENCE creance_dettes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."creance_dettes" (
    "id" integer DEFAULT nextval('creance_dettes_id_seq') NOT NULL,
    "reference" integer NOT NULL,
    "nom_complet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "creance_dette" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "creance_dettes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "creance_factures";
DROP SEQUENCE IF EXISTS creance_factures_id_seq;
CREATE SEQUENCE creance_factures_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."creance_factures" (
    "id" integer DEFAULT nextval('creance_factures_id_seq') NOT NULL,
    "cart" text,
    "client" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "creances";
DROP SEQUENCE IF EXISTS creances_id_seq;
CREATE SEQUENCE creances_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."creances" (
    "id" integer DEFAULT nextval('creances_id_seq') NOT NULL,
    "nom_complet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "numero_operation" character varying NOT NULL,
    "statut_paie" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dg" character varying NOT NULL,
    "motif_dg" character varying NOT NULL,
    "signature_dg" character varying NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL,
    CONSTRAINT "creances_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "creances" ("id", "nom_complet", "piece_justificative", "libelle", "montant", "numero_operation", "statut_paie", "signature", "created", "approbation_dg", "motif_dg", "signature_dg", "approbation_dd", "motif_dd", "signature_dd") VALUES
(1,	'POUR MATIERE PREMIERE POUR BISCUIT',	'54808',	'SUCRE ET FARINE MINOCONGO',	'3000',	'Transaction-Creance-1',	'false',	'WMFIN22-026',	'2022-12-23 12:43:35.19175',	'-',	'-',	'-',	'-',	'-',	'-'),
(2,	'Materiels de netoyages',	'5452',	'pour l''entreprise masavco',	'1500',	'Transaction-Creance-2',	'false',	'WMFIN22-026',	'2022-12-23 12:54:15.199638',	'-',	'-',	'-',	'-',	'-',	'-'),
(3,	'frais de livraison',	'001547',	'frais de livraison de la matiere premiers pour la fabrication du buscuit pour le mois de janvier 2023',	'500',	'Transaction-Creance-3',	'false',	'WMFIN22-026',	'2022-12-23 12:55:29.530256',	'-',	'-',	'-',	'-',	'-',	'-'),
(4,	'ENTREtIEN',	'01254',	'entreprot entretiens  pour le mois de janvier 2023',	'200',	'Transaction-Creance-4',	'false',	'WMFIN22-026',	'2022-12-23 12:57:20.526386',	'-',	'-',	'-',	'-',	'-',	'-'),
(5,	'Formtion',	'1542',	'actualsation et remise a niveau sur les leadership des agents commercial par intelligent expertise',	'1050',	'Transaction-Creance-5',	'false',	'WMFIN22-026',	'2022-12-23 12:58:26.376436',	'-',	'-',	'-',	'-',	'-',	'-');

DROP TABLE IF EXISTS "departement_budgets";
DROP SEQUENCE IF EXISTS departement_budgets_id_seq;
CREATE SEQUENCE departement_budgets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."departement_budgets" (
    "id" integer DEFAULT nextval('departement_budgets_id_seq') NOT NULL,
    "title" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "periode_debut" timestamp NOT NULL,
    "periode_fin" timestamp NOT NULL,
    "signature" character varying NOT NULL,
    "created_ref" timestamp NOT NULL,
    "created" timestamp NOT NULL,
    "is_submit" character varying NOT NULL,
    "approbation_dg" character varying NOT NULL,
    "motif_dg" character varying NOT NULL,
    "signature_dg" character varying NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL,
    CONSTRAINT "departement_budgets_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "departement_budgets" ("id", "title", "departement", "periode_debut", "periode_fin", "signature", "created_ref", "created", "is_submit", "approbation_dg", "motif_dg", "signature_dg", "approbation_dd", "motif_dd", "signature_dd") VALUES
(1,	'BUDGET 2022',	'-',	'2021-12-22 00:00:00',	'2022-12-25 00:00:00',	'WMBUD22-007',	'2022-12-22 15:27:18.84846',	'2022-12-22 15:27:18.84846',	'true',	'Approved',	'-',	'WMADM22-008',	'Approved',	'-',	'WMBUD22-007');

DROP TABLE IF EXISTS "dettes";
DROP SEQUENCE IF EXISTS dettes_id_seq;
CREATE SEQUENCE dettes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."dettes" (
    "id" integer DEFAULT nextval('dettes_id_seq') NOT NULL,
    "nom_complet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "numero_operation" character varying NOT NULL,
    "statut_paie" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dg" character varying NOT NULL,
    "motif_dg" character varying NOT NULL,
    "signature_dg" character varying NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL,
    CONSTRAINT "dettes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "dettes" ("id", "nom_complet", "piece_justificative", "libelle", "montant", "numero_operation", "statut_paie", "signature", "created", "approbation_dg", "motif_dg", "signature_dg", "approbation_dd", "motif_dd", "signature_dd") VALUES
(1,	'VENTE A CREDIT',	'2154/001',	'VEHICULES MARQUES TOYOTA FERME',	'25000',	'Transaction-Dette-1',	'false',	'WMFIN22-026',	'2022-12-23 12:41:45.206543',	'-',	'-',	'-',	'-',	'-',	'-'),
(2,	'RAVITAILLEMENT ETAT CONGOLAIS',	'25423',	'REMIS 10000 SACS DES RIZ POUR FONCTIONNAIRES DECEMBRE 2023',	'200000',	'Transaction-Dette-2',	'false',	'WMFIN22-026',	'2022-12-23 12:46:08.751832',	'-',	'-',	'-',	'-',	'-',	'-'),
(3,	'LOCATION MATERIEL DE CONSTRUCTION',	'000012',	'LOCATION TRUCK OVD',	'5000',	'Transaction-Dette-3',	'false',	'WMFIN22-026',	'2022-12-23 12:47:48.305071',	'-',	'-',	'-',	'-',	'-',	'-'),
(4,	'FORMATION ',	'010002',	'FORMATION EQUIPE D''UTILISATION DE DU LOGICIEL WORK MANAGEMENT DANS L''ENTREPRISE MOTEMA',	'3000',	'Transaction-Dette-4',	'false',	'WMFIN22-026',	'2022-12-23 12:50:43.297354',	'-',	'-',	'-',	'-',	'-',	'-'),
(5,	'MAINS D''OEUVRES',	'01245',	'cleaning bureau de la presidence du canada',	'7200',	'Transaction-Dette-5',	'false',	'WMFIN22-026',	'2022-12-23 12:52:18.712803',	'-',	'-',	'-',	'-',	'-',	'-');

DROP TABLE IF EXISTS "devis";
DROP SEQUENCE IF EXISTS devis_id_seq;
CREATE SEQUENCE devis_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."devis" (
    "id" integer DEFAULT nextval('devis_id_seq') NOT NULL,
    "title" character varying NOT NULL,
    "priority" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "observation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created_ref" timestamp NOT NULL,
    "created" timestamp NOT NULL,
    "is_submit" character varying NOT NULL,
    "approbation_dg" character varying NOT NULL,
    "motif_dg" character varying NOT NULL,
    "signature_dg" character varying NOT NULL,
    "approbation_budget" character varying NOT NULL,
    "motif_budget" character varying NOT NULL,
    "signature_budget" character varying NOT NULL,
    "approbation_fin" character varying NOT NULL,
    "motif_fin" character varying NOT NULL,
    "signature_fin" character varying NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL,
    "ligne_budgetaire" character varying NOT NULL,
    "ressource" character varying NOT NULL,
    CONSTRAINT "devis_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "devis_list_objets";
DROP SEQUENCE IF EXISTS devis_list_objets_id_seq;
CREATE SEQUENCE devis_list_objets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."devis_list_objets" (
    "id" integer DEFAULT nextval('devis_list_objets_id_seq') NOT NULL,
    "reference" integer NOT NULL,
    "title" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "designation" character varying NOT NULL,
    "montant_unitaire" character varying NOT NULL,
    "montant_global" character varying NOT NULL,
    CONSTRAINT "devis_list_objets_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "devis_list_objets" ("id", "reference", "title", "quantity", "designation", "montant_unitaire", "montant_global") VALUES
(1,	1,	'devis',	'1.0',	'marketing',	'450.0',	'450.0');

DROP TABLE IF EXISTS "entreprise_infos";
DROP SEQUENCE IF EXISTS entreprise_infos_id_seq;
CREATE SEQUENCE entreprise_infos_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."entreprise_infos" (
    "id" integer DEFAULT nextval('entreprise_infos_id_seq') NOT NULL,
    "nom_social" character varying NOT NULL,
    "nom_gerant" character varying NOT NULL,
    "email_entreprise" character varying NOT NULL,
    "email_gerant" character varying NOT NULL,
    "telephone1" character varying NOT NULL,
    "telephone2" character varying NOT NULL,
    "rccm" character varying NOT NULL,
    "identification_nationale" character varying NOT NULL,
    "numeros_impot" character varying NOT NULL,
    "secteur_activite" character varying NOT NULL,
    "adresse_physique_entreprise" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "entreprise_infos_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "entretiens";
DROP SEQUENCE IF EXISTS entretiens_id_seq;
CREATE SEQUENCE entretiens_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."entretiens" (
    "id" integer DEFAULT nextval('entretiens_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "type_objet" character varying NOT NULL,
    "type_maintenance" character varying NOT NULL,
    "duree_travaux" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL,
    "is_submit" character varying NOT NULL
) WITH (oids = false);

INSERT INTO "entretiens" ("id", "nom", "type_objet", "type_maintenance", "duree_travaux", "signature", "created", "approbation_dd", "motif_dd", "signature_dd", "is_submit") VALUES
(1,	'002',	'Materiel roulant',	'Maintenance corrective',	'2',	'WMLOG22-012',	'2022-12-27 15:08:04.19925',	'-',	'-',	'-',	'false'),
(2,	'003',	'Materiel roulant',	'Maintenance corrective',	'2 jour',	'WMLOG22-012',	'2022-12-27 15:10:25.039835',	'-',	'-',	'-',	'false'),
(3,	'004',	'Materiel',	'Maintenance préventive',	'3 mois',	'Support',	'2022-12-27 15:12:15.268004',	'-',	'-',	'-',	'false'),
(4,	'004',	'Materiel',	'Maintenance curative',	'3 jour',	'WMLOG22-012',	'2022-12-27 15:13:26.109487',	'-',	'-',	'-',	'true');

DROP TABLE IF EXISTS "etat_materiels";
DROP SEQUENCE IF EXISTS etat_materiels_id_seq;
CREATE SEQUENCE etat_materiels_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."etat_materiels" (
    "id" integer DEFAULT nextval('etat_materiels_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "modele" character varying NOT NULL,
    "marque" character varying NOT NULL,
    "type_objet" character varying NOT NULL,
    "statut" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL
) WITH (oids = false);

INSERT INTO "etat_materiels" ("id", "nom", "modele", "marque", "type_objet", "statut", "signature", "created", "approbation_dd", "motif_dd", "signature_dd") VALUES
(1,	'005',	'-',	'-',	'Materiel',	'Actif',	'WMLOG22-012',	'2022-12-27 15:04:54.133671',	'-',	'-',	'-'),
(2,	'001',	'-',	'-',	'Materiel roulant',	'Inactif',	'WMLOG22-012',	'2022-12-27 15:06:34.205248',	'-',	'-',	'-');

DROP TABLE IF EXISTS "factures";
DROP SEQUENCE IF EXISTS factures_id_seq;
CREATE SEQUENCE factures_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."factures" (
    "id" integer DEFAULT nextval('factures_id_seq') NOT NULL,
    "cart" text,
    "client" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "fin_exterieur_names";
DROP SEQUENCE IF EXISTS fin_exterieur_names_id_seq;
CREATE SEQUENCE fin_exterieur_names_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."fin_exterieur_names" (
    "id" integer DEFAULT nextval('fin_exterieur_names_id_seq') NOT NULL,
    "nom_complet" character varying NOT NULL,
    "rccm" character varying NOT NULL,
    "id_nat" character varying NOT NULL,
    "addresse" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "fin_exterieur_names_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "fin_exterieur_names" ("id", "nom_complet", "rccm", "id_nat", "addresse", "created") VALUES
(1,	'fmi',	'-',	'-',	'--',	'2022-12-23 13:12:50.242801'),
(2,	'bad',	'-',	'-',	'-',	'2022-12-23 13:13:53.273702');

DROP TABLE IF EXISTS "fin_exterieurs";
DROP SEQUENCE IF EXISTS fin_exterieurs_id_seq;
CREATE SEQUENCE fin_exterieurs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."fin_exterieurs" (
    "id" integer DEFAULT nextval('fin_exterieurs_id_seq') NOT NULL,
    "nom_complet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant_depot" character varying NOT NULL,
    "type_operation" character varying NOT NULL,
    "numero_operation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "reference" integer NOT NULL,
    "finance_exterieur_name" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "montant_retrait" character varying NOT NULL,
    CONSTRAINT "fin_exterieurs_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "fin_exterieurs" ("id", "nom_complet", "piece_justificative", "libelle", "montant_depot", "type_operation", "numero_operation", "signature", "reference", "finance_exterieur_name", "created", "montant_retrait") VALUES
(1,	'test',	'45682',	'test',	'500',	'Depot',	'Transaction-fin-exterieur-1',	'Support',	2,	'bad',	'2022-12-29 15:26:29.087009',	'0');

DROP TABLE IF EXISTS "fournisseurs";
DROP SEQUENCE IF EXISTS fournisseurs_id_seq;
CREATE SEQUENCE fournisseurs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."fournisseurs" (
    "id" integer DEFAULT nextval('fournisseurs_id_seq') NOT NULL,
    "reference" integer NOT NULL,
    "quantity" character varying NOT NULL,
    "designation" character varying NOT NULL,
    "prix_unitaire" character varying NOT NULL,
    "fournisseur" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "unite" character varying NOT NULL,
    CONSTRAINT "fournisseurs_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "gains";
DROP SEQUENCE IF EXISTS gains_id_seq;
CREATE SEQUENCE gains_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."gains" (
    "id" integer DEFAULT nextval('gains_id_seq') NOT NULL,
    "sum" double precision NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "history_livraisons";
DROP SEQUENCE IF EXISTS history_livraisons_id_seq;
CREATE SEQUENCE history_livraisons_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."history_livraisons" (
    "id" integer DEFAULT nextval('history_livraisons_id_seq') NOT NULL,
    "id_product" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "quantity_achat" character varying NOT NULL,
    "price_achat_unit" character varying NOT NULL,
    "prix_vente_unit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "marge_ben" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qty_remise" character varying NOT NULL,
    "marge_ben_remise" character varying NOT NULL,
    "qty_livre" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "history_ravitaillements";
DROP SEQUENCE IF EXISTS history_ravitaillements_id_seq;
CREATE SEQUENCE history_ravitaillements_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."history_ravitaillements" (
    "id" integer DEFAULT nextval('history_ravitaillements_id_seq') NOT NULL,
    "id_product" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "quantity_achat" character varying NOT NULL,
    "price_achat_unit" character varying NOT NULL,
    "prix_vente_unit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "marge_ben" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "qty_ravitailler" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "immobiliers";
DROP SEQUENCE IF EXISTS immobiliers_id_seq;
CREATE SEQUENCE immobiliers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."immobiliers" (
    "id" integer DEFAULT nextval('immobiliers_id_seq') NOT NULL,
    "type_allocation" character varying NOT NULL,
    "adresse" character varying NOT NULL,
    "numero_certificat" character varying NOT NULL,
    "superficie" character varying NOT NULL,
    "date_acquisition" timestamp NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dg" character varying NOT NULL,
    "motif_dg" character varying NOT NULL,
    "signature_dg" character varying NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL
) WITH (oids = false);

INSERT INTO "immobiliers" ("id", "type_allocation", "adresse", "numero_certificat", "superficie", "date_acquisition", "signature", "created", "approbation_dg", "motif_dg", "signature_dg", "approbation_dd", "motif_dd", "signature_dd") VALUES
(1,	'Entrepot',	'kinshasa, ngaliema',	'46589879FG',	'15/25',	'2022-12-22 00:00:00',	'WMADM22-001',	'2022-12-22 14:03:37.491277',	'-',	'-',	'-',	'Approved',	'-',	'WMLOG22-009'),
(4,	'depot',	'av matadi n 1210',	'08759/12',	'25/13',	'2018-08-20 00:00:00',	'WMLOG22-012',	'2022-12-29 11:02:38.520665',	'Approved',	'-',	'WMADM22-008',	'Approved',	'-',	'WMLOG22-009'),
(3,	'Parecelle ',	'ngamba',	'12354',	'60\45',	'2020-09-23 00:00:00',	'WMLOG22-009',	'2022-12-23 12:23:43.15721',	'Approved',	'-',	'WMADM22-008',	'Approved',	'-',	'WMLOG22-009'),
(2,	'Bureau',	'mgobe - kinshasa',	'0324587',	'18\12',	'2021-12-06 00:00:00',	'WMLOG22-009',	'2022-12-23 12:17:45.536661',	'Approved',	'-',	'WMADM22-008',	'Approved',	'-',	'WMLOG22-009'),
(5,	'Entrepot',	'mitendi',	'01287',	'45/25',	'2018-01-05 00:00:00',	'WMLOG22-009',	'2022-12-29 12:32:50.927423',	'-',	'-',	'-',	'-',	'-',	'-');

DROP TABLE IF EXISTS "journals";
DROP SEQUENCE IF EXISTS journals_id_seq;
CREATE SEQUENCE journals_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."journals" (
    "id" integer DEFAULT nextval('journals_id_seq') NOT NULL,
    "numero_operation" character varying NOT NULL,
    "libele" character varying NOT NULL,
    "compte_debit" character varying NOT NULL,
    "montant_debit" character varying NOT NULL,
    "compte_credit" character varying NOT NULL,
    "montant_credit" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "locker" character varying NOT NULL
) WITH (oids = false);

INSERT INTO "journals" ("id", "numero_operation", "libele", "compte_debit", "montant_debit", "compte_credit", "montant_credit", "signature", "created", "locker") VALUES
(1,	'001',	'JOURNAL EXERCICES 2022',	'601_Achats_de_marchandises',	'2000',	'31_Marchandises',	'2000',	'WMCPT22-021',	'2022-12-23 13:45:57.632254',	'false'),
(2,	'002',	'DOTATION AUX AMORTESEMENTS DE LA CLASSE 2',	'68_Dotations_aux_amortissements',	'500',	'28_Amortissements',	'500',	'WMCPT22-021',	'2022-12-23 13:48:00.554313',	'false'),
(3,	'003',	'VENTE AU COMPTANT',	'701_Ventes_de_marchandises',	'2500',	'4011_Fournisseurs',	'2500',	'WMCPT22-021',	'2022-12-23 13:48:46.720422',	'false'),
(4,	'004',	'ACHAT TERRAIN',	'57_Caisse',	'50000',	'2323_Bâtiments_administratifs_et_commerciaux',	'50000',	'WMCPT22-021',	'2022-12-23 13:50:46.853184',	'false'),
(5,	'005',	'EMPRUNT',	'17_Dettes_de_credit	bail_et_contrats_assimiles',	'15000',	'56_Banques,_credits_de_tresorerie_et_d_escompte',	'15000',	'WMCPT22-021',	'2022-12-23 13:52:36.042087',	'false'),
(6,	'006',	'ACHAT MARCHANDISE',	'57_Caisse',	'5000',	'31_Marchandises',	'5000',	'WMCPT22-021',	'2022-12-23 13:54:08.374153',	'false'),
(7,	'007',	'CREDITE MA CAISSE',	'57_Caisse',	'3000',	'17_Dettes_de_credit	bail_et_contrats_assimiles',	'3000',	'WMCPT22-021',	'2022-12-23 13:55:56.788598',	'false'),
(8,	'008',	'VENTE MARCHANDISES',	'31_Marchandises',	'1500',	'4011_Fournisseurs',	'1500',	'WMCPT22-021',	'2022-12-23 13:58:49.426218',	'false'),
(9,	'009',	'EMPRUNT',	'17_Dettes_de_credit	bail_et_contrats_assimiles',	'2700',	'57_Caisse',	'2700',	'WMCPT22-021',	'2022-12-23 14:01:20.779103',	'false');

DROP TABLE IF EXISTS "ligne_budgetaires";
DROP SEQUENCE IF EXISTS ligne_budgetaires_id_seq;
CREATE SEQUENCE ligne_budgetaires_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."ligne_budgetaires" (
    "id" integer DEFAULT nextval('ligne_budgetaires_id_seq') NOT NULL,
    "nom_ligne_budgetaire" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "periode_budget_debut" timestamp NOT NULL,
    "periode_budget_fin" timestamp NOT NULL,
    "unite_choisie" character varying NOT NULL,
    "nombre_unite" character varying NOT NULL,
    "cout_unitaire" character varying NOT NULL,
    "cout_total" character varying NOT NULL,
    "caisse" character varying NOT NULL,
    "banque" character varying NOT NULL,
    "fin_exterieur" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "reference" integer NOT NULL,
    "caisse_sortie" double precision NOT NULL,
    "banque_sortie" double precision NOT NULL,
    "fin_exterieur_sortie" double precision NOT NULL
) WITH (oids = false);

INSERT INTO "ligne_budgetaires" ("id", "nom_ligne_budgetaire", "departement", "periode_budget_debut", "periode_budget_fin", "unite_choisie", "nombre_unite", "cout_unitaire", "cout_total", "caisse", "banque", "fin_exterieur", "signature", "created", "reference", "caisse_sortie", "banque_sortie", "fin_exterieur_sortie") VALUES
(1,	'SALAIRE AGENTS',	'-',	'2021-12-22 00:00:00',	'2022-12-25 00:00:00',	'AGENTS',	'10.0',	'2000.0',	'20000.0',	'10000.0',	'10000.0',	'0.0',	'WMBUD22-007',	'2022-12-22 15:33:11.320827',	1,	0,	500,	0);

DROP TABLE IF EXISTS "mails";
DROP SEQUENCE IF EXISTS mails_id_seq;
CREATE SEQUENCE mails_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."mails" (
    "id" integer DEFAULT nextval('mails_id_seq') NOT NULL,
    "full_name" character varying NOT NULL,
    "email" character varying NOT NULL,
    "cc" text,
    "objet" character varying NOT NULL,
    "message" character varying NOT NULL,
    "piece_jointe" character varying NOT NULL,
    "read" character varying NOT NULL,
    "full_name_dest" character varying NOT NULL,
    "email_dest" character varying NOT NULL,
    "date_send" timestamp NOT NULL,
    "date_read" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "materiels";
DROP SEQUENCE IF EXISTS materiels_id_seq;
CREATE SEQUENCE materiels_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."materiels" (
    "id" integer DEFAULT nextval('materiels_id_seq') NOT NULL,
    "type_materiel" character varying NOT NULL,
    "marque" character varying NOT NULL,
    "modele" character varying NOT NULL,
    "numero_ref" character varying NOT NULL,
    "couleur" character varying NOT NULL,
    "genre" character varying NOT NULL,
    "qty_max_reservoir" character varying NOT NULL,
    "date_fabrication" timestamp NOT NULL,
    "numero_plaque" character varying NOT NULL,
    "identifiant" character varying NOT NULL,
    "kilometrage_initiale" character varying NOT NULL,
    "fournisseur" character varying NOT NULL,
    "alimentation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dg" character varying NOT NULL,
    "motif_dg" character varying NOT NULL,
    "signature_dg" character varying NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL,
    CONSTRAINT "materiels_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "materiels" ("id", "type_materiel", "marque", "modele", "numero_ref", "couleur", "genre", "qty_max_reservoir", "date_fabrication", "numero_plaque", "identifiant", "kilometrage_initiale", "fournisseur", "alimentation", "signature", "created", "approbation_dg", "motif_dg", "signature_dg", "approbation_dd", "motif_dd", "signature_dd") VALUES
(1,	'Materiel roulant',	'mersedes',	'toyota',	'125874',	'grise',	'voiture',	'250',	'2020-05-27 00:00:00',	'AA0685/y01',	'001',	'1570',	'doubai',	'Essence',	'WMLOG22-012',	'2022-12-27 11:50:23.867256',	'-',	'-',	'-',	'Approved',	'-',	'WMLOG22-009'),
(6,	'Materiel',	'micro',	'sans fill',	'05',	'bronse',	'micro',	'0',	'2019-02-19 00:00:00',	'-',	'006',	'0',	'dubai',	'DC',	'WMLOG22-012',	'2022-12-29 10:56:22.225302',	'Approved',	'-',	'WMADM22-008',	'Approved',	'-',	'WMLOG22-009'),
(5,	'Materiel',	'Xprinter',	'mini printer',	'012',	'blanc',	'imprimante',	'0',	'2020-12-27 00:00:00',	'-',	'005',	'0',	'dubai',	'DC',	'WMLOG22-012',	'2022-12-27 15:02:07.955936',	'Approved',	'-',	'WMADM22-008',	'Approved',	'-',	'WMLOG22-009'),
(4,	'Materiel',	'acer',	'lenovo',	'12',	'noir',	'0',	'0',	'2021-02-27 00:00:00',	'-',	'004',	'0',	'chine',	'DC',	'WMLOG22-012',	'2022-12-27 12:44:47.080024',	'Approved',	'-',	'WMADM22-008',	'Approved',	'-',	'WMLOG22-009'),
(3,	'Materiel roulant',	'Peugeot',	'ford',	'24587',	'rouge',	'voiture',	'150',	'2020-12-27 00:00:00',	'AA6578/t02',	'003',	'6254',	'chine',	'Essence',	'WMLOG22-012',	'2022-12-27 12:19:45.337583',	'Approved',	'-',	'WMADM22-008',	'Approved',	'-',	'WMLOG22-009'),
(2,	'Materiel roulant',	'toyota',	'citoen',	'045725',	'maron',	'voiture',	'150',	'2021-12-01 00:00:00',	'1247857',	'002',	'0124',	'afrique du sud',	'Essence',	'WMLOG22-012',	'2022-12-27 12:13:52.981544',	'Approved',	'-',	'WMADM22-008',	'Approved',	'-',	'WMLOG22-009'),
(7,	'Materiel',	'HP',	'printer mini',	'08',	'grise',	'0',	'0',	'2021-12-29 00:00:00',	'-',	'007',	'0',	'afrique du sud',	'DC',	'WMLOG22-013',	'2022-12-29 12:28:30.678973',	'-',	'-',	'-',	'Approved',	'-',	'WMLOG22-009');

DROP TABLE IF EXISTS "mobiliers";
DROP SEQUENCE IF EXISTS mobiliers_id_seq;
CREATE SEQUENCE mobiliers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."mobiliers" (
    "id" integer DEFAULT nextval('mobiliers_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "modele" character varying NOT NULL,
    "marque" character varying NOT NULL,
    "description_mobilier" character varying NOT NULL,
    "nombre" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL
) WITH (oids = false);

INSERT INTO "mobiliers" ("id", "nom", "modele", "marque", "description_mobilier", "nombre", "signature", "created", "approbation_dd", "motif_dd", "signature_dd") VALUES
(2,	'Ordinateur',	'portable',	'toshiba',	'pour le directeur de logistique et la reception',	'2',	'WMLOG22-012',	'2022-12-27 11:31:22.495158',	'Approved',	'-',	'WMLOG22-009'),
(3,	'Telephone',	'orizon',	'sans fill',	'pour service client, le directeur de finance, et marketing',	'5',	'WMLOG22-012',	'2022-12-27 11:40:25.330148',	'Approved',	'-',	'WMLOG22-009'),
(1,	'imprimate',	'Hp',	'laiser',	'la reseption',	'2',	'WMLOG22-012',	'2022-12-23 12:30:23.165666',	'Approved',	'-',	'WMLOG22-009');

DROP TABLE IF EXISTS "monnaies";
DROP SEQUENCE IF EXISTS monnaies_id_seq;
CREATE SEQUENCE monnaies_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."monnaies" (
    "id" integer DEFAULT nextval('monnaies_id_seq') NOT NULL,
    "monnaie" character varying NOT NULL,
    "monnaie_en_lettre" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "monnaies_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "number_factures";
DROP SEQUENCE IF EXISTS number_factures_id_seq;
CREATE SEQUENCE number_factures_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."number_factures" (
    "id" integer DEFAULT nextval('number_factures_id_seq') NOT NULL,
    "number" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "objets_remplace";
DROP SEQUENCE IF EXISTS objets_remplace_id_seq;
CREATE SEQUENCE objets_remplace_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."objets_remplace" (
    "id" integer DEFAULT nextval('objets_remplace_id_seq') NOT NULL,
    "reference" integer NOT NULL,
    "nom" character varying NOT NULL,
    "cout" character varying NOT NULL,
    "caracteristique" character varying NOT NULL,
    "observation" character varying NOT NULL,
    CONSTRAINT "objets_remplace_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "objets_remplace" ("id", "reference", "nom", "cout", "caracteristique", "observation") VALUES
(2,	5,	'Xprinter',	'35',	'imprimanter',	'le probleme de cartoucher');

DROP TABLE IF EXISTS "performences";
DROP SEQUENCE IF EXISTS performences_id_seq;
CREATE SEQUENCE performences_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."performences" (
    "id" integer DEFAULT nextval('performences_id_seq') NOT NULL,
    "agent" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "nom" character varying NOT NULL,
    "postnom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);

INSERT INTO "performences" ("id", "agent", "departement", "nom", "postnom", "prenom", "signature", "created") VALUES
(2,	'WMADM22-001',	'["Administration","Exploitations","Logistique"]',	'Kataku',	'Muanza',	'Germain',	'Support',	'2022-12-22 13:14:01.58007'),
(3,	'WMRH22-002',	'["Ressources Humaines","Finances"]',	'mbuyi',	'ntumba',	'gedeon ',	'Support',	'2022-12-22 14:20:31.061401'),
(4,	'WMRH22-003',	'["Ressources Humaines"]',	'KABANGE',	'MOTA',	'LOUIS',	'WMRH22-002',	'2022-12-22 14:26:24.339672'),
(5,	'WMRH22-004',	'["Ressources Humaines"]',	'BAKAJI ',	'FAYULU',	'CLOE',	'WMRH22-002',	'2022-12-22 14:30:59.962803'),
(6,	'WMRH22-005',	'["Ressources Humaines"]',	'AMISI',	'DELTA',	'MAKINI',	'WMRH22-002',	'2022-12-22 14:36:19.218378'),
(7,	'WMRH22-006',	'["Ressources Humaines"]',	'MAMBENI',	'LUKASA',	'MOABITE',	'WMRH22-002',	'2022-12-22 14:41:31.590881'),
(8,	'WMBUD22-007',	'["Budgets","Exploitations"]',	'MUADI',	'KADI',	'SYLVIE',	'WMRH22-002',	'2022-12-22 15:24:28.776876'),
(9,	'WMADM22-008',	'["Administration"]',	'KAZADI',	'MPAMBU',	'ARCEL',	'WMRH22-002',	'2022-12-22 15:43:15.75328'),
(10,	'WMLOG22-009',	'["Logistique"]',	'KAZADI',	'MBUYI',	'JEAN PAUL',	'WMRH22-002',	'2022-12-23 11:00:55.653291'),
(11,	'WMLOG22-010',	'["Logistique"]',	'LANDU',	'NYOTA',	'PISTHOU',	'WMRH22-002',	'2022-12-23 11:12:49.381551'),
(12,	'WMLOG22-011',	'["Logistique"]',	'MAJABU',	'BEYA',	'MARINA',	'WMRH22-002',	'2022-12-23 11:16:25.287513'),
(13,	'WMLOG22-012',	'["Logistique"]',	'MASIKI',	'LUAMBO',	'LOIK',	'WMRH22-002',	'2022-12-23 11:19:45.225506'),
(14,	'WMLOG22-013',	'["Logistique"]',	'MALAKO',	'KIZUNZI',	'LOUIS FRANCE',	'WMRH22-002',	'2022-12-23 11:23:41.283096'),
(15,	'WMCOM22-014',	'["Commercial"]',	'MULANGA',	'KADIMA',	'CHRISTIANA',	'WMRH22-002',	'2022-12-23 12:10:53.755135'),
(16,	'WMCOM22-015',	'["Commercial"]',	'MATSHIKO',	'MWANTA',	'DIVINE',	'WMRH22-002',	'2022-12-23 12:14:40.453945'),
(17,	'WMCOM22-016',	'["Commercial"]',	'LOSAMBA',	'MAKUTANO',	'Cloé Nickel',	'WMRH22-002',	'2022-12-23 12:18:46.307984'),
(18,	'WMCOM22-017',	'["Commercial"]',	'TAWABA',	'KENGE',	'JEAN LOUIS',	'WMRH22-002',	'2022-12-23 12:30:14.701252'),
(19,	'WMCOM22-018',	'["Commercial"]',	'MIADAMBU',	'BEYA',	'DEBORAH',	'WMRH22-002',	'2022-12-23 13:04:21.994017'),
(20,	'WMCPT22-019',	'["Comptabilites","Marketing"]',	'NTUMBA',	'KAZADI',	'FABIEN',	'WMRH22-002',	'2022-12-23 11:34:06.214132'),
(21,	'WMCPT22-020',	'["Comptabilites"]',	'BADU',	'BADU',	'JACQUES',	'WMRH22-002',	'2022-12-23 11:37:24.874533'),
(22,	'WMCPT22-021',	'["Comptabilites"]',	'luambo',	'kwanza',	'jean',	'WMRH22-002',	'2022-12-23 11:41:25.197965'),
(23,	'WMCPT22-022',	'["Comptabilites"]',	'BUBANJI',	'NTUMBA',	'NELLY',	'WMRH22-002',	'2022-12-23 11:54:48.582017'),
(24,	'WMEXP22-023',	'["Exploitations"]',	'LOSAMBO',	'MAYOMBI',	'PATRICK',	'WMRH22-002',	'2022-12-23 11:57:59.947579'),
(25,	'WMEXP22-024',	'["Exploitations"]',	'NGULU',	'MATONJI',	'gregoire',	'WMRH22-002',	'2022-12-23 12:03:29.864706'),
(26,	'WMEXP22-025',	'["Exploitations"]',	'shabani',	'ndonda',	'merveil',	'WMRH22-002',	'2022-12-23 12:07:30.978098'),
(27,	'WMFIN22-026',	'["Finances"]',	'MUSAS',	'KANGEZ',	'ODON',	'WMRH22-002',	'2022-12-23 12:12:27.950284'),
(28,	'WMFIN22-027',	'["Finances"]',	'LANDU',	'MOYO',	'MAURICE',	'WMRH22-002',	'2022-12-23 13:18:07.528813');

DROP TABLE IF EXISTS "performences_note";
DROP SEQUENCE IF EXISTS performences_note_id_seq;
CREATE SEQUENCE performences_note_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."performences_note" (
    "id" integer DEFAULT nextval('performences_note_id_seq') NOT NULL,
    "agent" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "hospitalite" character varying NOT NULL,
    "ponctualite" character varying NOT NULL,
    "travaille" character varying NOT NULL,
    "note" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);

INSERT INTO "performences_note" ("id", "agent", "departement", "hospitalite", "ponctualite", "travaille", "note", "signature", "created") VALUES
(1,	'WMLOG22-009',	'["Logistique"]',	'8',	'3',	'6',	'Ace bien il va ameliore',	'WMLOG22-010',	'2022-12-29 11:53:04.689347'),
(2,	'WMLOG22-010',	'["Logistique"]',	'7',	'5',	'6',	'IL va ameliore a la prochaine',	'WMLOG22-009',	'2022-12-29 11:57:39.399452'),
(3,	'WMADM22-001',	'["Administration","Exploitations","Logistique"]',	'4',	'8',	'7',	'bon travailleur',	'WMLOG22-009',	'2022-12-29 12:00:57.592709'),
(4,	'WMLOG22-011',	'["Logistique"]',	'6',	'7',	'9',	'Bon travailleur',	'WMLOG22-011',	'2022-12-29 12:06:50.266367'),
(5,	'WMLOG22-013',	'["Logistique"]',	'10',	'2',	'4',	'GFGF',	'WMLOG22-009',	'2022-12-29 16:34:36.491862');

DROP TABLE IF EXISTS "presence_personnels";
DROP SEQUENCE IF EXISTS presence_personnels_id_seq;
CREATE SEQUENCE presence_personnels_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."presence_personnels" (
    "id" integer DEFAULT nextval('presence_personnels_id_seq') NOT NULL,
    "reference" integer NOT NULL,
    "identifiant" character varying NOT NULL,
    "motif" character varying NOT NULL,
    "sortie" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "signature_fermeture" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "created_sortie" timestamp NOT NULL,
    CONSTRAINT "presence_personnels_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "presences";
DROP SEQUENCE IF EXISTS presences_id_seq;
CREATE SEQUENCE presences_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."presences" (
    "id" integer DEFAULT nextval('presences_id_seq') NOT NULL,
    "title" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "presences_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "presences" ("id", "title", "signature", "created") VALUES
(1,	'Présence du 22-12-2022',	'WMRH22-006',	'2022-12-22 14:46:18.08379');

DROP TABLE IF EXISTS "productions";
DROP SEQUENCE IF EXISTS productions_id_seq;
CREATE SEQUENCE productions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."productions" (
    "id" integer DEFAULT nextval('productions_id_seq') NOT NULL,
    "num_production" integer NOT NULL,
    "id_product" character varying NOT NULL,
    "quantity_a_produire" character varying NOT NULL,
    "quantity_bonne" character varying NOT NULL,
    "quantity_mauvaise" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dg" character varying NOT NULL,
    "motif_dg" character varying NOT NULL,
    "signature_dg" character varying NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL,
    "status" character varying NOT NULL,
    CONSTRAINT "productions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "produits_model";
DROP SEQUENCE IF EXISTS produits_model_id_seq;
CREATE SEQUENCE produits_model_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."produits_model" (
    "id" integer DEFAULT nextval('produits_model_id_seq') NOT NULL,
    "categorie" character varying NOT NULL,
    "sous_categorie_1" character varying NOT NULL,
    "sous_categorie_2" character varying NOT NULL,
    "sous_categorie_3" character varying NOT NULL,
    "sous_categorie_4" character varying NOT NULL,
    "id_product" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL
) WITH (oids = false);

INSERT INTO "produits_model" ("id", "categorie", "sous_categorie_1", "sous_categorie_2", "sous_categorie_3", "sous_categorie_4", "id_product", "signature", "created", "approbation_dd", "motif_dd", "signature_dd") VALUES
(5,	'Lait',	'NIDO',	'2.5 KG',	'-',	'Boites',	'LAIT-NIDO-2.5KG---BOITES',	'WMCOM22-015',	'2022-12-23 13:34:03.863338',	'-',	'-',	'-'),
(6,	'MATERIELS',	'ORDINATEUR',	'HP',	'PORTABLE 500 GO/5 RAM',	'Pièces',	'MATERIELS-ORDINATEUR-HP-PORTABLE500GO/5RAM-PIÈCES',	'WMCOM22-015',	'2022-12-23 13:34:59.004381',	'-',	'-',	'-'),
(8,	'TV',	'LG',	'LAID',	'55 POUCES',	'Pièces',	'TV-LG-LAID-55POUCES-PIÈCES',	'WMCOM22-015',	'2022-12-23 13:36:15.584924',	'-',	'-',	'-'),
(2,	'boisson',	'jus',	'swissta',	'tangawisi',	'Bouteilles',	'BOISSON-JUS-SWISSTA-TANGAWISI-BOUTEILLES',	'WMCOM22-016',	'2022-12-25 05:32:50.710794',	'Approved',	'-',	'WMCOM22-014'),
(1,	'Lait',	'cowbell',	'sachet',	'20g',	'Sachets',	'LAIT-COWBELL-SACHET-20G-SACHETS',	'WMCOM22-016',	'2022-12-25 05:07:58.004835',	'Approved',	'-',	'WMCOM22-014'),
(11,	'TELEPHONE',	'IPHONE 14',	'500 GO',	'COULEUR',	'Pièces',	'TELEPHONE-IPHONE14-500GO-COULEUR-PIÈCES',	'WMCOM22-015',	'2022-12-23 13:38:26.651792',	'Approved',	'-',	'WMCOM22-014'),
(10,	'CLIMATISEUR',	'SAMSUNG',	'25 VLT',	'-',	'Pièces',	'CLIMATISEUR-SAMSUNG-25VLT---PIÈCES',	'WMCOM22-015',	'2022-12-23 13:37:46.145428',	'Approved',	'-',	'WMCOM22-014'),
(9,	'BISCUITS',	'PETIT BERRES',	'500G',	'-',	'Cartons',	'BISCUITS-PETITBERRES-500G---CARTONS',	'WMCOM22-015',	'2022-12-23 13:36:49.842472',	'Approved',	'-',	'WMCOM22-014'),
(7,	'SUCRE',	'KWILUNGOGO',	'SAC',	'JAUNE',	'Sacs',	'SUCRE-KWILUNGOGO-SAC-JAUNE-SACS',	'WMCOM22-015',	'2022-12-23 13:35:43.526695',	'Approved',	'-',	'WMCOM22-014'),
(4,	'SEMOULE',	'CARAMOURA',	'25 KG',	'BLANC',	'Sacs',	'SEMOULE-CARAMOURA-25KG-BLANC-SACS',	'WMCOM22-015',	'2022-12-23 13:33:20.24965',	'Approved',	'-',	'WMCOM22-014'),
(3,	'CIMENT',	'25 KG',	'SAC',	'GRISE',	'Sacs',	'CIMENT-25KG-SAC-GRISE-SACS',	'WMCOM22-015',	'2022-12-23 13:32:52.417514',	'Approved',	'-',	'WMCOM22-014');

DROP TABLE IF EXISTS "projets";
DROP SEQUENCE IF EXISTS projets_id_seq;
CREATE SEQUENCE projets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."projets" (
    "id" integer DEFAULT nextval('projets_id_seq') NOT NULL,
    "nom_projet" character varying NOT NULL,
    "cout_projet" character varying NOT NULL,
    "responsable" character varying NOT NULL,
    "observation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "is_submit" character varying NOT NULL,
    "type_financement" character varying NOT NULL,
    "date_debut_et_fin" character varying NOT NULL,
    "statut" character varying NOT NULL,
    "expire" timestamp NOT NULL,
    "recette_attendus" character varying NOT NULL,
    "approbation_dg" character varying NOT NULL,
    "motif_dg" character varying NOT NULL,
    "signature_dg" character varying NOT NULL,
    "approbation_budget" character varying NOT NULL,
    "motif_budget" character varying NOT NULL,
    "signature_budget" character varying NOT NULL,
    "approbation_fin" character varying NOT NULL,
    "motif_fin" character varying NOT NULL,
    "signature_fin" character varying NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL,
    "ligne_budgetaire" character varying NOT NULL,
    "ressource" character varying NOT NULL,
    CONSTRAINT "projets_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "projets" ("id", "nom_projet", "cout_projet", "responsable", "observation", "signature", "created", "is_submit", "type_financement", "date_debut_et_fin", "statut", "expire", "recette_attendus", "approbation_dg", "motif_dg", "signature_dg", "approbation_budget", "motif_budget", "signature_budget", "approbation_fin", "motif_fin", "signature_fin", "approbation_dd", "motif_dd", "signature_dd", "ligne_budgetaire", "ressource") VALUES
(1,	'ELEVAGE DE PONDEUSES',	'7000',	'ODON MUSUS',	'false',	'WMEXP22-023',	'2022-12-25 11:42:53.87442',	'false',	'Interne',	'Du 25/12/2022 - Au 28/12/2023',	'En constitution',	'2023-12-28 00:00:00',	'12000',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-');

DROP TABLE IF EXISTS "rapports";
DROP SEQUENCE IF EXISTS rapports_id_seq;
CREATE SEQUENCE rapports_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."rapports" (
    "id" integer DEFAULT nextval('rapports_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "numero_tache" character varying NOT NULL,
    "rapport" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "reference" integer NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "refresh_tokens";
DROP SEQUENCE IF EXISTS refresh_tokens_id_seq;
CREATE SEQUENCE refresh_tokens_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."refresh_tokens" (
    "id" integer DEFAULT nextval('refresh_tokens_id_seq') NOT NULL,
    "owner" character varying NOT NULL,
    "token" character varying NOT NULL
) WITH (oids = false);

INSERT INTO "refresh_tokens" ("id", "owner", "token") VALUES
(1,	'1',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZXhwIjoxNjcyODczODgzLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTU3Nzg4M30.mTdMLqdxj_M3kI6edv2aqKF29Ynl0iSTMQxDYHxTCFM'),
(2,	'1',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZXhwIjoxNjcyOTAwNTIwLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTYwNDUyMH0.4EcxFsWy3nUd9ZXd2Yb996d7X3eC97raffnaXxOPJxA'),
(3,	'1',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZXhwIjoxNjcyOTAwNTM0LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTYwNDUzNH0.neRyc4xovqk73aBo5T59LkEORZpcVTdeYndQO5Nt52I'),
(4,	'1',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZXhwIjoxNjcyOTAwODQ1LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTYwNDg0NX0.xASu4FAPNnx8wNG3nwifk_2OU07y8G_TKwj17ly8wis'),
(5,	'1',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZXhwIjoxNjcyOTM4ODMzLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTY0MjgzM30.PQGNS58aLRQpcE7Yqr5H25juQwPVe9bV1edptwG64OQ'),
(6,	'1',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZXhwIjoxNjcyOTQzMTg4LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTY0NzE4OH0.j8BGMycX1pxinVsy6U256b2ymw17Yqj1JpbWawAQd9k'),
(7,	'1',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZXhwIjoxNjcyOTQzMTk3LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTY0NzE5N30.ovbzbuRAHXF0CXpv3WbBwo7hZiZWMSGE1PLlh0egMTQ'),
(8,	'1',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZXhwIjoxNjcyOTgzNTUzLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTY4NzU1M30.EuJ9BhfuKwo274ZqX5YuaCF3uglfdtu0seOoh0x54Dc'),
(9,	'1',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZXhwIjoxNjcyOTgzODk3LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTY4Nzg5N30.ga-YIpveBzjCKVDj-9krCx2t5bWXEtgQQ7BxXBQiVlA'),
(10,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjcyOTg2MzU1LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTY5MDM1NX0.zXj5u8nOxxa2aH3J9tRKE1QlrGpWAQaom3MygcTCq0Y'),
(11,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjcyOTg3MDcyLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTY5MTA3Mn0.EYLRUy9ZZcHaL1Du6auKKhJkT0Rv1vqBvvwTcmP8r2U'),
(12,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjcyOTg3MjM5LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTY5MTIzOX0.2zCnRVhEJ8B2GszQ1e-3ZrFuDVVR17ZICYPIGHsIUc0'),
(13,	'3',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiZXhwIjoxNjczMDEwMDAyLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcxNDAwMn0.yzv8d9oxIZGhaMwDloXaKZGZi5ud_N8MvW3XeFBsvoo'),
(14,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczMDEwNTc5LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcxNDU3OX0.s40oXitQSHb30HNNvz7VATccOMmkgQmEycnNJtkxC3M'),
(15,	'4',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZXhwIjoxNjczMDExMjgwLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcxNTI4MH0.kz_0VOnovS7zLoCEId8fApQ517ba7aN0AZ5y2IoS6q0'),
(16,	'6',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZXhwIjoxNjczMDEyNzE4LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcxNjcxOH0.HsEXFdAJ_NfHj00EHb3mFspkyVEOn1euIb6kkyU4L6I'),
(17,	'8',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiZXhwIjoxNjczMDEzMTc3LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcxNzE3N30.ljENAdAQq-9bhLgdXw_lDcVnadCVQY_ov9BikA2GaQ4'),
(18,	'7',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiZXhwIjoxNjczMDEzNTgyLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcxNzU4Mn0.1jxRVRTJXai2gax1Px1S0YKJeQHWS403YZjPIWEAEs8'),
(19,	'5',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiZXhwIjoxNjczMDE0MzY5LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcxODM2OX0.LIMVsSuLxIpkhLyw7NqCQV2bdarI9iS2zDPrOloXraY'),
(20,	'4',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZXhwIjoxNjczMDE0NzI0LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcxODcyNH0.JRppPFftGtzGSpUOQ6vEEcyafjCTQUas-iutlpF2vPQ'),
(21,	'9',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiZXhwIjoxNjczMDE1MTEyLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcxOTExMn0.yb7DoX4iFySkGSlXxTOunxpFlmJ_5fsucxstE0wJNbs'),
(22,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczMDE1NjY1LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcxOTY2NX0.s1V7gdT5rqsgUEDXUmMD4jrAL4MjhtYuivurPIY73v0'),
(23,	'9',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiZXhwIjoxNjczMDE1NzIwLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcxOTcyMH0.DoCuUyW2yPG2qihTV3E3lit4adbDh_MnKqqZSWXAP6c'),
(24,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczMDE1NzkxLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcxOTc5MX0.zyUTdEgKvZTiLLoP6Sm0YcIu-SnOF-OTWD_uRhsHYQc'),
(25,	'4',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZXhwIjoxNjczMDE1OTUzLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcxOTk1M30.-lrpA9P4oE7mh0NKd9QVustwVTIXu5QAsSdIlckVI5U'),
(26,	'10',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsImV4cCI6MTY3MzAxNjI2OSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE3MjAyNjl9.zseRYQg_S_UgrqTUkpStcbYdVJVB_kTba98Z7Z6GVtA'),
(27,	'9',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiZXhwIjoxNjczMDE3MjkyLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcyMTI5Mn0.dMP0wLQg61gMOqOqJsKkXrlk1P9b_Ms2X3_FZUBeX5Q'),
(28,	'4',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZXhwIjoxNjczMDE3NDc2LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTcyMTQ3Nn0.9Jp0NedDkhIKrii5Z6dGeOZZU7Hgm4H5Fd1quLcEvDg'),
(29,	'4',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZXhwIjoxNjczMDg1Mjc3LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTc4OTI3N30.3YP4pfOdGB3H1XWpzKJ8le-Q6dJfl2FYtUvzXQmN4M4'),
(30,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczMDg1NTA0LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTc4OTUwNH0.1ttdsREJLF_WhFXbY0ksbbDh_pogQE1_OngbtM47n90'),
(31,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczMDg2ODY5LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTc5MDg2OX0.S7_3vlt77YrXkmtDcATN51N_RDi1vbHqgai1tOjtvSE'),
(32,	'14',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTQsImV4cCI6MTY3MzA4NzM5NSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE3OTEzOTV9.8SQgQ0IfzkJgDQWjWHR-jRDlL0ylUt2vQ9U-Ap9F0IM'),
(33,	'14',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTQsImV4cCI6MTY3MzA4NzQ3OCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE3OTE0Nzh9.wLfjLkFJkBYzEfjJDk2HnFeVOYMEhq8ikV1EDGlwOew'),
(34,	'15',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsImV4cCI6MTY3MzA4ODQwOCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE3OTI0MDh9.LlhQtLr9Kp85q8X7Pe4MVPC6gcOC4Phd9SriEBRTJpo'),
(35,	'13',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImV4cCI6MTY3MzA4ODU5MywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE3OTI1OTN9._RFFPiSS9doDJZURwXBSfl37A0C-bkVEhXbdTWxD0dA'),
(36,	'12',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsImV4cCI6MTY3MzA4ODg1MywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE3OTI4NTN9.HAkTwJWXLVBgOXp1I5CVncNN3ZRld-RiXERbCSN-vh8'),
(37,	'11',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImV4cCI6MTY3MzA4OTgzMSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE3OTM4MzF9.zKKXBlzHuz3xKM4kQX3iomJirnk_9MKKsCxCkGk33iM'),
(38,	'15',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsImV4cCI6MTY3MzA5MDc1NiwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE3OTQ3NTZ9.EhaFdVx7Rxf07hMig3e4mvo9RGnzJnMmAwNUs3b1n7w'),
(39,	'20',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImV4cCI6MTY3MzE2MTU0MCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE4NjU1NDB9.E14Eo0av0KagdRv-h_26bUJzu1qGW2ZMf_5dxVFkHrg'),
(40,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczMTYxNjg0LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTg2NTY4NH0.iUrVsfhX0_DWt0ZBvk-1v4te0yHU_okYbqR_flUyAwg'),
(41,	'20',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImV4cCI6MTY3MzE2MTg1NCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE4NjU4NTR9.uwKtw_BN1UAamp1Jmrnx92kakiOcAgqZ_cc-Ki1KYpw'),
(42,	'20',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImV4cCI6MTY3MzE2MjE5MCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE4NjYxOTB9.6NxVHoSBV0VMml_vn7p7e5UybiZidXVpGfPoeLwiSK0'),
(43,	'20',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImV4cCI6MTY3MzE2MjQxNiwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE4NjY0MTZ9.HBVH2syH8fVA-AvOJRuFOYeOA-GTujD0F4p--MAcT24'),
(44,	'20',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImV4cCI6MTY3MzE2MzQzOCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE4Njc0Mzh9.R3Byar9ezm-wJ675KADyETqI9W8nuuNBk1oAiIwyA40'),
(45,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczMTY0MTY0LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTg2ODE2NH0.tWghUHdf0tHXrr9vor4qENK02gy4wCBkxo9jJ0Mbcbw'),
(46,	'20',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImV4cCI6MTY3MzE2NDQyMSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE4Njg0MjF9.dnyiTw3Z3Pp90SVxfYDe5mNhuCz4cdeu3qVs8g5J2sM'),
(47,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczMTk4NjM5LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTkwMjYzOX0.lveq_pzyqRDE_6gHZ2RKT6pnImVk1K0VhXtFfc5sm68'),
(48,	'22',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjIsImV4cCI6MTY3MzIwMDgzMCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzE5MDQ4MzB9.q9i-GXeLgpOBSOs_cLUQQSGkwMfZ9OKlzeWxzH226Yk'),
(49,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczMjU3NDc5LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MTk2MTQ3OX0.jfrwId-oqcW8wOujmZQQXM2ij9esXXpoBPGzfqPqPps'),
(50,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczNDMzNjA5LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MjEzNzYwOX0.4AV_tFFW4nEtP1EymuhLERVxYxvDpnJds6KaCtGHDqU'),
(51,	'17',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsImV4cCI6MTY3MzQzNTY4OSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxMzk2ODl9.hFO5bJPCS_U-bdRCw1KZfhlrIB_PO0PeJsC0QgCQCZM'),
(52,	'4',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZXhwIjoxNjczNDM1NzI5LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MjEzOTcyOX0.t8bMEJQD78Iwq2FeIhB-dtLcYkRuGu43siPv0lLlfEs'),
(53,	'4',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZXhwIjoxNjczNDM1Nzg2LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MjEzOTc4Nn0.Lbkl2PSAmkgiE9u6xn8sB2a-CTv81kTgodIYskuldy4'),
(54,	'24',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImV4cCI6MTY3MzQzNjY4MiwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDA2ODJ9.yiDE54jG_d8nsZR8Hx7YCYHCMNWT93RBWn1FuRGHN_0'),
(55,	'24',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImV4cCI6MTY3MzQzNzA3NCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDEwNzR9.ByBIueO1s1p4rSDMRVGDQ9nuuMVk95Q_0SVWxuz3wgo'),
(56,	'24',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImV4cCI6MTY3MzQzNzU2OSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDE1Njl9.M2xToU432AUPdCoqEqYTjwwqH9Amt7EoHCKmu-P_uWQ'),
(57,	'15',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsImV4cCI6MTY3MzQzNzg1MSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDE4NTF9.D-rRYsVMXRzfS8jBI875gOtjGQvXssovlPkbyWQurBQ'),
(58,	'4',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZXhwIjoxNjczNDM4MDc0LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MjE0MjA3NH0.gogH97euIfZgTevxFYv8rFqr5dnMPAyCbIGvm-l0mvg'),
(59,	'29',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjksImV4cCI6MTY3MzQzOTE4OSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDMxODl9.pMgdzRCY5o5-88SEJ_R78Bozh102mz2U8grjjy-KDC4'),
(60,	'4',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZXhwIjoxNjczNDM5MjY0LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MjE0MzI2NH0.xCTfdgiUhLlhdiu_fl56Rz8ggIkHDyzkq5xWwn91DH8'),
(61,	'24',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImV4cCI6MTY3MzQzOTM3NCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDMzNzR9.OhAMaj_DjeTVYyQH8FdLy3lNpMYkIf5AkWljQbDqEcE'),
(62,	'17',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsImV4cCI6MTY3MzQzOTc4OSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDM3ODl9.o3LbkyI5FUv81rzOZ3ZiUjsz9PmUbZqV4IclfSEFGSE'),
(63,	'18',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTgsImV4cCI6MTY3MzQzOTkyNSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDM5MjV9.ew2KlED4twhuhrVs_JPvt1sjJJdr0O48Yyb3HDj72N0'),
(64,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczNDQwMDg1LCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MjE0NDA4NX0.d98dDwMjpUD7wgEzI8Z26EG0kxCve8z_WV4bouGkSJA'),
(65,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczNDQwMTczLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MjE0NDE3M30.C-l8m2kae8AI9DsQdOoiySpiBJOJaD4rLkYl5ThoOi0'),
(66,	'17',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsImV4cCI6MTY3MzQ0MDM5OSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDQzOTl9.N_ZLiUEurpLF6PfNN_dhMc-xDMDuy_hY8_B7ROphUMU'),
(67,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczNDQwNTEzLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MjE0NDUxM30.uwsVmujT88Pc7D7f1vqFENcwVvWvXeJJglp58wCUfbE'),
(68,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczNDQwNTMwLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MjE0NDUzMH0.CQYrU_0EvcrWmwZzJhILfe5Q7j-l8UWGeL5Dic4qYCE'),
(69,	'28',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsImV4cCI6MTY3MzQ0MDY2NywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDQ2Njd9.8swKyoLCmeoDsVNMxljwTACWX89ou_17Ufvs1K6nVRA'),
(70,	'25',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjUsImV4cCI6MTY3MzQ0MzMwMSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDczMDF9.2ifNFO-c7-N6RBaKrqQrFHRQ04HCjdXnE9abdW1wcDw'),
(71,	'25',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjUsImV4cCI6MTY3MzQ0MzMyNiwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDczMjZ9.EFUJS4XD4WLer7VSp0bNXOx37M6gNuzx_7D_GanLF1g'),
(72,	'25',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjUsImV4cCI6MTY3MzQ0MzM1NywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDczNTd9.iaa_VX3D4jZy5jYBmYKOPK3p6zgG-atvTKvAXTNPib4'),
(73,	'26',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsImV4cCI6MTY3MzQ0MzQwMSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIxNDc0MDF9.wvnkvfm0ocGIqLZoC5DqtVHnY1aPyTBOTvbN5ciqTDg'),
(74,	'4',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZXhwIjoxNjczNDQ0NDUyLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MjE0ODQ1Mn0.Vla3nW_8abA1uHJU1fnMuIRGKDCWGxc5uOEb7DHXJjU'),
(75,	'27',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImV4cCI6MTY3MzYwMzEyMywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMDcxMjN9._b2OitkseGFCtq_5839a45BQiIO2AsfwAXcyDS6_0eQ'),
(76,	'2',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZXhwIjoxNjczNjAzMjUxLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MjMwNzI1MX0.7nyet28F1r7QudotTxnAUPaMk_Hjn57iKC7oEfX3z8g'),
(77,	'30',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzAsImV4cCI6MTY3MzYwMzM2MywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMDczNjN9.4B4g22clfSEmitbON-X3exfEkQb3_cBWrmUjg1EdAQ4'),
(78,	'24',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImV4cCI6MTY3MzYwNDgyNiwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMDg4MjZ9.obdzuMU-Be2DTavsg57Yd8RxPURYQJdD-TL5eYfkV3g'),
(79,	'11',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImV4cCI6MTY3MzYwNTM0NCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMDkzNDR9.gREBu5gGdiybwmjFsIlKOD8pY4O6brmL1ZW_oEGe8xU'),
(80,	'30',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzAsImV4cCI6MTY3MzYwNTU5NywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMDk1OTd9.EA_agcH5zdZoO4UJdGEQowwqsodzW-cW5Xw58wLx8dY'),
(81,	'24',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImV4cCI6MTY3MzYwNTc5NywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMDk3OTd9.Jnz0me9TDp9RJpKngVSlCQWKOyH896mt7uDQimyHvjc'),
(82,	'26',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsImV4cCI6MTY3MzYwNjA4OCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTAwODh9.YRZEf4WZx9iK2_Cq-mW8-lT95Ie5w-ztdQebSeDqWcs'),
(83,	'25',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjUsImV4cCI6MTY3MzYwNjEzOCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTAxMzh9.vtO-_eXYH7-n5ub4cjeRHdE7HyAm8AWxtxSoAUbHX20'),
(84,	'12',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsImV4cCI6MTY3MzYwNjI5MCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTAyOTB9.CYTyOFQcILF8xVfg3CnSM_qOROB1dJRFtun1Qvr--B4'),
(85,	'17',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsImV4cCI6MTY3MzYwNjU1NiwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTA1NTZ9.hnaR-ScrGTkzciQ27SvlKsXjGudQzRfYTSViFWZjuKo'),
(86,	'18',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTgsImV4cCI6MTY3MzYwNjg3NywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTA4Nzd9.xuAPVBtK-72lT6Y5DhR-OYtMzNixKgI8_Uhjs87bjEI'),
(87,	'11',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImV4cCI6MTY3MzYwNzI1MCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTEyNTB9.1xVujF-_dPgUsx3dLwiBZnHc9H7X6mzF5-Oi93vZa_s'),
(88,	'10',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsImV4cCI6MTY3MzYwNzQxOCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTE0MTh9.7bthEquM3Qr2msrAbsT5OVI91yzqt5FVVlHcRMnLH70'),
(89,	'13',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImV4cCI6MTY3MzYwNzczMCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTE3MzB9.iuqztwiHebh7jLOMGXFyLy-fVbOY5tLhEjyWuID2trY'),
(90,	'18',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTgsImV4cCI6MTY3MzYwODAzNiwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTIwMzZ9.k5x1fT1oHIiASJYs1Y0F_7KoJe0dVqEovSSbOKFhw6A'),
(91,	'17',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsImV4cCI6MTY3MzYwODQ2OCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTI0Njh9._P5QBCG0QRZUkcJrTFGMw3z_NG4AM23eSJXbK7qsaXA'),
(92,	'30',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzAsImV4cCI6MTY3MzYwODU1MiwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTI1NTJ9.NIfkfzZqnCmG3-x1bNHUelCyNWrbXX04qc3VbybiKkA'),
(93,	'18',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTgsImV4cCI6MTY3MzYwODY1OCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTI2NTh9.KRsZibGSIaA7MKXBq2aBFM4DnCIVzJ7Q8blcFuGuagE'),
(94,	'30',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzAsImV4cCI6MTY3MzYwODcxMiwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTI3MTJ9.lUMi0FVGgChR7xU-Tnk_j0MgFqlMeNLkiV-55FjpQrQ'),
(95,	'22',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjIsImV4cCI6MTY3MzYwODgyNywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTI4Mjd9.ubmjS06Obn1YUCJqwY1kz7gvnbgeeCvE14UWCO3w9Jk'),
(96,	'18',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTgsImV4cCI6MTY3MzYwODk0NywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTI5NDd9.SpJM9iOjSURjtVBWkEFnQzjxd6rIIONI_IWjcvu5UNM'),
(97,	'21',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsImV4cCI6MTY3MzYwOTAyMiwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTMwMjJ9.ciPL5sSiZ7-DWeFczGNoE0IyLRyLsp24h-hHE00gCyI'),
(98,	'17',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsImV4cCI6MTY3MzYwOTA5MCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTMwOTB9.AvnB67hWCvUw3fdyeaAoeytLhfJysS0GLKm0pk_msKI'),
(99,	'14',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTQsImV4cCI6MTY3MzYwOTEwOSwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTMxMDl9._Bhn-81h_tt0ubtuZbgqI6rNkZ6z8t8RRc0AZTuqjeM'),
(100,	'14',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTQsImV4cCI6MTY3MzYxMDY2MiwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTQ2NjJ9.QLtF-T22Rk0zvBhuJ6M8KiCV1PGlKPdqQQ-3LQCHbXY'),
(101,	'15',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsImV4cCI6MTY3MzYxMDc3MywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTQ3NzN9.KD_4Sh1fAORx9EkXWtMMn1yH3_ocWCjvIdm8mAeO3N4'),
(102,	'15',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsImV4cCI6MTY3MzYxMDc4NCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTQ3ODR9._8tD8DP4ikT5F6-HdxSIBElw7mcKbv1NSAUfwx0JKyE'),
(103,	'10',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsImV4cCI6MTY3MzYxMDk1NywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMTQ5NTd9.oKXQhWrNHTOHwoR01qXiojwXcJU8Tcq1T6NCDbUHfPU'),
(104,	'30',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzAsImV4cCI6MTY3MzYxODU1MCwidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMjI1NTB9.iQowHckvqxnbKuLVokSaTZuFZ6N9rumJa5gTNK4-l8Y'),
(105,	'11',	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImV4cCI6MTY3MzYyMTI3MywidHlwZSI6InJlZnJlc2giLCJpYXQiOjE2NzIzMjUyNzN9.p-L--qhMCQ4ssBbl8l74C97t3YrQZ9UFWg_HJ2_CiNY');

DROP TABLE IF EXISTS "restitutions";
DROP SEQUENCE IF EXISTS restitutions_id_seq;
CREATE SEQUENCE restitutions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."restitutions" (
    "id" integer DEFAULT nextval('restitutions_id_seq') NOT NULL,
    "id_product" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "first_name" character varying NOT NULL,
    "last_name" character varying NOT NULL,
    "accuse_reception" character varying NOT NULL,
    "accuse_reception_first_name" character varying NOT NULL,
    "accuse_reception_last_name" character varying NOT NULL,
    "role" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "salaires";
DROP SEQUENCE IF EXISTS salaires_id_seq;
CREATE SEQUENCE salaires_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."salaires" (
    "id" integer DEFAULT nextval('salaires_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "postnom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "email" character varying NOT NULL,
    "telephone" character varying NOT NULL,
    "adresse" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "numero_securite_sociale" character varying NOT NULL,
    "matricule" character varying NOT NULL,
    "services_affectation" character varying NOT NULL,
    "salaire" character varying NOT NULL,
    "observation" character varying NOT NULL,
    "mode_paiement" character varying NOT NULL,
    "created_at" timestamp NOT NULL,
    "taux_jour_heure_mois_salaire" character varying NOT NULL,
    "jours_heures_paye_a_100_pourecent_salaire" character varying NOT NULL,
    "total_du_salaire" character varying NOT NULL,
    "nombre_heure_supplementaires" character varying NOT NULL,
    "taux_heure_supplementaires" character varying NOT NULL,
    "total_du_heure_supplementaires" character varying NOT NULL,
    "supplement_travail_samedi_dimanche_jours_ferie" character varying NOT NULL,
    "prime" character varying NOT NULL,
    "divers" character varying NOT NULL,
    "jours_conges_paye" character varying NOT NULL,
    "taux_conges_paye" character varying NOT NULL,
    "total_du_conge_paye" character varying NOT NULL,
    "jour_paye_maladie_accident" character varying NOT NULL,
    "taux_journalier_maladie_accident" character varying NOT NULL,
    "total_du_maladie_accident" character varying NOT NULL,
    "pension_deduction" character varying NOT NULL,
    "indemnite_compensatrices_deduction" character varying NOT NULL,
    "avances_deduction" character varying NOT NULL,
    "divers_deduction" character varying NOT NULL,
    "retenues_fiscalesdeduction" character varying NOT NULL,
    "nombre_enfant_beneficaire_allocations_familiales" character varying NOT NULL,
    "nombre_de_jours_allocations_familiales" character varying NOT NULL,
    "taux_jours_allocations_familiales" character varying NOT NULL,
    "total_a_payer_allocations_familiales" character varying NOT NULL,
    "net_a_payer" character varying NOT NULL,
    "montant_pris_consideration_calcul_cotisationsinss" character varying NOT NULL,
    "total_du_brut" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "approbation_budget" character varying NOT NULL,
    "motif_budget" character varying NOT NULL,
    "signature_budget" character varying NOT NULL,
    "approbation_fin" character varying NOT NULL,
    "motif_fin" character varying NOT NULL,
    "signature_fin" character varying NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL,
    "ligne_budgetaire" character varying NOT NULL,
    "ressource" character varying NOT NULL
) WITH (oids = false);

INSERT INTO "salaires" ("id", "nom", "postnom", "prenom", "email", "telephone", "adresse", "departement", "numero_securite_sociale", "matricule", "services_affectation", "salaire", "observation", "mode_paiement", "created_at", "taux_jour_heure_mois_salaire", "jours_heures_paye_a_100_pourecent_salaire", "total_du_salaire", "nombre_heure_supplementaires", "taux_heure_supplementaires", "total_du_heure_supplementaires", "supplement_travail_samedi_dimanche_jours_ferie", "prime", "divers", "jours_conges_paye", "taux_conges_paye", "total_du_conge_paye", "jour_paye_maladie_accident", "taux_journalier_maladie_accident", "total_du_maladie_accident", "pension_deduction", "indemnite_compensatrices_deduction", "avances_deduction", "divers_deduction", "retenues_fiscalesdeduction", "nombre_enfant_beneficaire_allocations_familiales", "nombre_de_jours_allocations_familiales", "taux_jours_allocations_familiales", "total_a_payer_allocations_familiales", "net_a_payer", "montant_pris_consideration_calcul_cotisationsinss", "total_du_brut", "signature", "approbation_budget", "motif_budget", "signature_budget", "approbation_fin", "motif_fin", "signature_fin", "approbation_dd", "motif_dd", "signature_dd", "ligne_budgetaire", "ressource") VALUES
(1,	'MAMBENI',	'LUKASA',	'MOABITE',	'lukasa@hotmail.com',	'099606607',	'79 MALUKU',	'["Ressources Humaines"]',	'8794/54',	'WMRH22-006',	'Autre',	'250',	'false',	'-',	'2022-12-22 15:08:58.679215',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'WMRH22-005',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-'),
(3,	'KABANGE',	'MOTA',	'LOUIS',	'kabange@gmail.com',	'0850007580',	'CENTRAL 07',	'["Ressources Humaines"]',	'4582',	'WMRH22-003',	'Recrutement',	'1000',	'false',	'-',	'2022-12-22 15:10:15.669374',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'WMRH22-005',	'-',	'-',	'-',	'-',	'-',	'-',	'Approved',	'-',	'WMRH22-002',	'-',	'-'),
(2,	'AMISI',	'DELTA',	'MAKINI',	'amisidela@gmail.com',	'89700254',	'rue poto poto 785',	'["Ressources Humaines"]',	'45897',	'WMRH22-005',	'Restoration et Transport',	'500',	'false',	'-',	'2022-12-22 15:09:34.961602',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'WMRH22-005',	'-',	'-',	'-',	'-',	'-',	'-',	'Approved',	'-',	'WMRH22-002',	'-',	'-');

DROP TABLE IF EXISTS "section_projets";
DROP SEQUENCE IF EXISTS section_projets_id_seq;
CREATE SEQUENCE section_projets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."section_projets" (
    "id" integer DEFAULT nextval('section_projets_id_seq') NOT NULL,
    "nom_projet" character varying NOT NULL,
    "reference" integer NOT NULL,
    "section" character varying NOT NULL,
    "detail" text NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "section_projets_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "stocks_global";
DROP SEQUENCE IF EXISTS stocks_global_id_seq;
CREATE SEQUENCE stocks_global_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."stocks_global" (
    "id" integer DEFAULT nextval('stocks_global_id_seq') NOT NULL,
    "id_product" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "quantity_achat" character varying NOT NULL,
    "price_achat_unit" character varying NOT NULL,
    "prix_vente_unit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "mode_achat" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "qty_ravitailler" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);

INSERT INTO "stocks_global" ("id", "id_product", "quantity", "quantity_achat", "price_achat_unit", "prix_vente_unit", "unite", "mode_achat", "tva", "qty_ravitailler", "signature", "created") VALUES
(1,	'BOISSON-JUS-SWISSTA-TANGAWISI-BOUTEILLES',	'5000',	'5000',	'2.5',	'2.7',	'BOUTEILLES',	'False',	'16.0',	'5000',	'WMCOM22-015',	'2022-12-25 11:57:33.121435'),
(6,	'SUCRE-KWILUNGOGO-SAC-JAUNE-SACS',	'3500.0',	'5500',	'55',	'57.0',	'SACS',	'true',	'16.0',	'5500',	'WMCOM22-015',	'2022-12-25 12:00:53.914057'),
(5,	'SEMOULE-CARAMOURA-25KG-BLANC-SACS',	'7000.0',	'8000',	'18',	'20.0',	'SACS',	'true',	'1.0',	'8000',	'WMCOM22-015',	'2022-12-25 12:00:11.413247'),
(2,	'LAIT-COWBELL-SACHET-20G-SACHETS',	'7000.0',	'7500',	'3500',	'4000.0',	'SACHETS',	'False',	'16.0',	'7500',	'WMCOM22-015',	'2022-12-25 11:58:17.919937'),
(4,	'TELEPHONE-IPHONE14-500GO-COULEUR-PIÈCES',	'15.0',	'40',	'650',	'680.0',	'PIÈCES',	'true',	'16.0',	'40',	'WMCOM22-015',	'2022-12-25 11:59:35.950722'),
(3,	'CLIMATISEUR-SAMSUNG-25VLT---PIÈCES',	'5.0',	'10',	'250',	'260.0',	'',	'false',	'16.0',	'10',	'WMCOM22-015',	'2022-12-25 11:58:50.931823');

DROP TABLE IF EXISTS "succursales";
DROP SEQUENCE IF EXISTS succursales_id_seq;
CREATE SEQUENCE succursales_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."succursales" (
    "id" integer DEFAULT nextval('succursales_id_seq') NOT NULL,
    "name" character varying NOT NULL,
    "adresse" character varying,
    "province" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dg" character varying NOT NULL,
    "motif_dg" character varying NOT NULL,
    "signature_dg" character varying NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL
) WITH (oids = false);

INSERT INTO "succursales" ("id", "name", "adresse", "province", "signature", "created", "approbation_dg", "motif_dg", "signature_dg", "approbation_dd", "motif_dd", "signature_dd") VALUES
(3,	'CHADO PAWO',	'MANIEMA,  BAZAIBA 1627',	'Kwango',	'WMCOM22-014',	'2022-12-23 13:42:52.675217',	'-',	'-',	'-',	'-',	'-',	'-'),
(2,	'VTC BUSNESS',	'GOLF, AVENUE DE LA RIVE 170',	'Haut-Katanga',	'WMCOM22-014',	'2022-12-23 13:42:04.889886',	'Approved',	'-',	'WMADM22-008',	'Approved',	'-',	'WMCOM22-014'),
(1,	'GD BUSNESS',	'tangu 31 bis',	'Kinshasa',	'WMRH22-002',	'2022-12-23 13:30:15.037415',	'Approved',	'-',	'WMADM22-008',	'Approved',	'-',	'WMCOM22-014');

DROP TABLE IF EXISTS "suivis";
DROP SEQUENCE IF EXISTS suivis_id_seq;
CREATE SEQUENCE suivis_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."suivis" (
    "id" integer DEFAULT nextval('suivis_id_seq') NOT NULL,
    "reference" integer NOT NULL,
    "travail_effectue" character varying NOT NULL,
    "accusee_reception" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "suivis_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "taches";
DROP SEQUENCE IF EXISTS taches_id_seq;
CREATE SEQUENCE taches_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."taches" (
    "id" integer DEFAULT nextval('taches_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "numero_tache" character varying NOT NULL,
    "agent" character varying NOT NULL,
    "jalon" character varying NOT NULL,
    "tache" character varying NOT NULL,
    "signature_resp" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "read" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "reference" integer NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "trajets";
DROP SEQUENCE IF EXISTS trajets_id_seq;
CREATE SEQUENCE trajets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."trajets" (
    "id" integer DEFAULT nextval('trajets_id_seq') NOT NULL,
    "nomero_entreprise" character varying NOT NULL,
    "conducteur" character varying NOT NULL,
    "trajet_de" character varying NOT NULL,
    "trajet_a" character varying NOT NULL,
    "mission" character varying NOT NULL,
    "kilometrage_sorite" character varying NOT NULL,
    "kilometrage_retour" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "reference" integer NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL
) WITH (oids = false);

INSERT INTO "trajets" ("id", "nomero_entreprise", "conducteur", "trajet_de", "trajet_a", "mission", "kilometrage_sorite", "kilometrage_retour", "signature", "reference", "created", "approbation_dd", "motif_dd", "signature_dd") VALUES
(1,	'001',	'JP KALONZO',	'PASCALE',	'KINSESO',	'depose le vivre',	'515',	'-',	'WMLOG22-012',	1,	'2022-12-29 13:06:13.148285',	'-',	'-',	'-');

DROP TABLE IF EXISTS "trans_rest_agents";
DROP SEQUENCE IF EXISTS trans_rest_agents_id_seq;
CREATE SEQUENCE trans_rest_agents_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."trans_rest_agents" (
    "id" integer DEFAULT nextval('trans_rest_agents_id_seq') NOT NULL,
    "reference" integer NOT NULL,
    "nom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "matricule" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "observation" character varying NOT NULL,
    CONSTRAINT "trans_rest_agents_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "trans_rest_agents" ("id", "reference", "nom", "prenom", "matricule", "montant", "observation") VALUES
(1,	1,	'kataku',	'Germain',	'WMADM22-001',	'120',	'false');

DROP TABLE IF EXISTS "transport_restaurations";
DROP SEQUENCE IF EXISTS transport_restaurations_id_seq;
CREATE SEQUENCE transport_restaurations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."transport_restaurations" (
    "id" integer DEFAULT nextval('transport_restaurations_id_seq') NOT NULL,
    "title" character varying NOT NULL,
    "observation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created_ref" timestamp NOT NULL,
    "created" timestamp NOT NULL,
    "approbation_dg" character varying NOT NULL,
    "motif_dg" character varying NOT NULL,
    "signature_dg" character varying NOT NULL,
    "approbation_budget" character varying NOT NULL,
    "motif_budget" character varying NOT NULL,
    "signature_budget" character varying NOT NULL,
    "approbation_fin" character varying NOT NULL,
    "motif_fin" character varying NOT NULL,
    "signature_fin" character varying NOT NULL,
    "approbation_dd" character varying NOT NULL,
    "motif_dd" character varying NOT NULL,
    "signature_dd" character varying NOT NULL,
    "ligne_budgetaire" character varying NOT NULL,
    "ressource" character varying NOT NULL,
    "is_submit" character varying NOT NULL,
    CONSTRAINT "transport_restaurations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "transport_restaurations" ("id", "title", "observation", "signature", "created_ref", "created", "approbation_dg", "motif_dg", "signature_dg", "approbation_budget", "motif_budget", "signature_budget", "approbation_fin", "motif_fin", "signature_fin", "approbation_dd", "motif_dd", "signature_dd", "ligne_budgetaire", "ressource", "is_submit") VALUES
(1,	'LISTE DE TRANSPORT',	'false',	'WMRH22-005',	'2022-12-22 15:00:53.959066',	'2022-12-23 07:16:02.835293',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'-',	'true');

DROP TABLE IF EXISTS "update_versions";
DROP SEQUENCE IF EXISTS update_versions_id_seq;
CREATE SEQUENCE update_versions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."update_versions" (
    "id" integer DEFAULT nextval('update_versions_id_seq') NOT NULL,
    "version" character varying NOT NULL,
    "url_update" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "is_active" character varying NOT NULL,
    "motif" character varying NOT NULL,
    CONSTRAINT "update_versions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "update_versions" ("id", "version", "url_update", "created", "is_active", "motif") VALUES
(1,	'3.0.0.17',	'http://192.168.100.200:3000/uploadfile/uploads/bf2bc39e5673cdfe3df652e7df0cf984.msix',	'2022-12-22 13:46:38.859631',	'true',	'Fixing notifications'),
(2,	'3.0.0.18',	'http://192.168.100.200:3000/uploadfile/uploads/332ce26e5c910d77f1846eef4fd2b7476.msix',	'2022-12-23 11:22:17.750582',	'true',	'fix controller'),
(3,	'3.0.0.19',	'http://192.168.100.200:3000/uploadfile/uploads/a810976c4f557b93b75c34c1bd9c7b5bb.msix',	'2022-12-25 10:46:46.089655',	'true',	'Update commercial & notifcation'),
(4,	'3.0.0.20',	'http://192.168.100.200:3000/uploadfile/uploads/1f7955dd5e5e1072213bffdcc1882a705.msix',	'2022-12-27 14:57:22.179042',	'true',	'Fixing table finance & bindings');

DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."users" (
    "id" integer DEFAULT nextval('users_id_seq') NOT NULL,
    "photo" character varying NOT NULL,
    "nom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "email" character varying NOT NULL,
    "telephone" character varying NOT NULL,
    "matricule" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "services_affectation" character varying NOT NULL,
    "fonction_occupe" character varying NOT NULL,
    "role" character varying NOT NULL,
    "is_online" character varying NOT NULL,
    "created_at" timestamp NOT NULL,
    "password_hash" character varying NOT NULL,
    "succursale" character varying NOT NULL
) WITH (oids = false);

INSERT INTO "users" ("id", "photo", "nom", "prenom", "email", "telephone", "matricule", "departement", "services_affectation", "fonction_occupe", "role", "is_online", "created_at", "password_hash", "succursale") VALUES
(2,	'',	'Support',	'Support',	'support@eventdrc.com',	'0000000000',	'Support',	'["Support"]',	'Support',	'Support',	'0',	'true',	'2022-12-22 07:25:06.571153',	'81dc9bdb52d04dc20036dbd8313ed055',	'-'),
(3,	'-',	'Kataku',	'Germain',	'katakugermain@gmail.com',	'+243813530838',	'WMADM22-001',	'["Administration","Exploitations","Logistique"]',	'Administration',	'Directeur générale',	'0',	'false',	'2022-12-22 13:59:02.300188',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(5,	'-',	'KABANGE',	'LOUIS',	'kabange@gmail.com',	'0850007580',	'WMRH22-003',	'["Ressources Humaines"]',	'Recrutement',	'Directeur de departement',	'2',	'false',	'2022-12-22 14:42:23.368202',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(6,	'-',	'MAMBENI',	'MOABITE',	'lukasa@hotmail.com',	'099606607',	'WMRH22-006',	'["Ressources Humaines"]',	'Autre',	'Stagiaire professionnel',	'5',	'false',	'2022-12-22 14:42:37.797686',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(7,	'-',	'BAKAJI ',	'CLOE',	'bakajikafayulu@gmail.com',	'0896107800',	'WMRH22-004',	'["Ressources Humaines"]',	'Rémunération du personnel',	'Chef de service',	'3',	'false',	'2022-12-22 14:43:01.230368',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(8,	'-',	'AMISI',	'MAKINI',	'amisidela@gmail.com',	'89700254',	'WMRH22-005',	'["Ressources Humaines"]',	'Restoration et Transport',	'Agent',	'5',	'false',	'2022-12-22 14:43:28.538311',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(9,	'-',	'MUADI',	'SYLVIE',	'muadikadima@gmail.com',	'0819754811',	'WMBUD22-007',	'["Budgets","Exploitations"]',	'Supervision',	'Directeur de budget',	'1',	'false',	'2022-12-22 15:24:42.777533',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(10,	'-',	'KAZADI',	'ARCEL',	'kazaimpambu@gmail.COM',	'090900606',	'WMADM22-008',	'["Administration"]',	'Administration',	'Directeur générale',	'1',	'false',	'2022-12-22 15:43:51.712222',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(11,	'-',	'KAZADI',	'JEAN PAUL',	'kazadijeanpaul@gmail.com',	'08160660790',	'WMLOG22-009',	'["Logistique"]',	'Supervision',	'Directeur de departement',	'1',	'false',	'2022-12-23 11:01:13.023128',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(12,	'-',	'LANDU',	'PISTHOU',	'landu@gmail.com',	'+243819721540',	'WMLOG22-010',	'["Logistique"]',	'Construction & architecture',	'Chef de service',	'2',	'false',	'2022-12-23 11:13:09.760473',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(13,	'-',	'MAJABU',	'MARINA',	'majabubeya@gmail.com',	'0813004050',	'WMLOG22-011',	'["Logistique"]',	'Planification & wherehouse',	'Agent',	'3',	'false',	'2022-12-23 11:16:38.39699',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(14,	'-',	'MALAKO',	'LOUIS FRANCE',	'malako@yahoo.fr',	'0840008477',	'WMLOG22-013',	'["Logistique"]',	'Maintenance curative',	'Stagiaire professionnel',	'4',	'false',	'2022-12-23 11:24:02.821392',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(15,	'-',	'MASIKI',	'LOIK',	'masikiluao@gmail.com',	'0810382858',	'WMLOG22-012',	'["Logistique"]',	'Maintenance preventive',	'Expert',	'4',	'false',	'2022-12-23 11:25:16.143245',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(16,	'-',	'MALAKO',	'LOUIS FRANCE',	'malako@yahoo.fr',	'0840008477',	'WMLOG22-013',	'["Logistique"]',	'Maintenance curative',	'Stagiaire professionnel',	'5',	'false',	'2022-12-23 11:25:36.770692',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(17,	'-',	'MULANGA',	'CHRISTIANA',	'mulangakadima@gmail.com',	'0856103035',	'WMCOM22-014',	'["Commercial"]',	'Supervision',	'Directeur de departement',	'1',	'false',	'2022-12-23 13:05:01.204303',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(18,	'-',	'MATSHIKO',	'DIVINE',	'matshikomwanta@gmail.com',	'0999000010',	'WMCOM22-015',	'["Commercial"]',	'Organisation et management',	'Gerant succursale',	'2',	'false',	'2022-12-23 13:05:32.443561',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(21,	'-',	'TAWABA',	'JEAN LOUIS',	'tawabakenge@gmail.com',	'0891205051',	'WMCOM22-017',	'["Commercial"]',	'Gestion operationnelle',	'Directeur de departement',	'5',	'false',	'2022-12-23 13:32:09.032374',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(22,	'-',	'LOSAMBA',	'Cloé Nickel',	'losambamakutano@gmail.com',	'09901292790',	'WMCOM22-016',	'["Commercial"]',	'Supervision',	'Chef de service',	'2',	'false',	'2022-12-24 18:56:06.331012',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(23,	'-',	'BADU',	'JACQUES',	'babu01@gmail.com',	'0900012011',	'WMCPT22-020',	'["Comptabilites"]',	'Supervision',	'Chef de service',	'1',	'false',	'2022-12-23 12:15:56.060616',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(24,	'-',	'MUSAS',	'ODON',	'musaskangez@gmail.com',	'08987254',	'WMFIN22-026',	'["Finances"]',	'Supervision',	'Agent',	'4',	'false',	'2022-12-23 12:16:19.389641',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(25,	'-',	'NGULU',	'gregoire',	'ngulumatonji@gmail.com',	'080192222',	'WMEXP22-024',	'["Exploitations"]',	'Gestion des projets',	'Chef de service',	'2',	'false',	'2022-12-23 12:17:05.292956',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(26,	'-',	'LOSAMBO',	'PATRICK',	'losambo@gmail.com',	'819753200',	'WMEXP22-023',	'["Exploitations"]',	'Supervision',	'Directeur de departement',	'1',	'false',	'2022-12-23 12:17:35.690232',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(27,	'-',	'NTUMBA',	'FABIEN',	'ntumbafabien@gmail.com',	'0819750000',	'WMCPT22-019',	'["Comptabilites","Marketing"]',	'Supervision',	'Directeur de departement',	'1',	'false',	'2022-12-23 12:18:26.363759',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(28,	'-',	'luambo',	'jean',	'luambokwanza@gmail.com',	'0800015020',	'WMCPT22-021',	'["Comptabilites"]',	'Ecriture des comptes bilan',	'Agent',	'3',	'false',	'2022-12-23 12:19:17.295234',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(29,	'-',	'LANDU',	'MAURICE',	'landumoyo@gmail.com',	'0859012000',	'WMFIN22-027',	'["Finances"]',	'Supervision',	'Chef de service',	'3',	'false',	'2022-12-23 13:18:58.122157',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(30,	'-',	'mbuyi',	'gedeon ',	'trydonntumba@gmail.com',	'0819753232',	'WMRH22-002',	'["Ressources Humaines","Finances"]',	'Supervision',	'Directeur administratif',	'1',	'false',	'2022-12-25 10:54:43.49758',	'25d55ad283aa400af464c76d713c07ad',	'-'),
(20,	'-',	'MIADAMBU',	'DEBORAH',	'miadambu@gmail.com',	'0905051310',	'WMCOM22-018',	'["Commercial"]',	'Agent commercial',	'Agent',	'5',	'false',	'2022-12-23 13:31:51.679404',	'25d55ad283aa400af464c76d713c07ad',	'VTC BUSNESS');

DROP TABLE IF EXISTS "ventes";
DROP SEQUENCE IF EXISTS ventes_id_seq;
CREATE SEQUENCE ventes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."ventes" (
    "id" integer DEFAULT nextval('ventes_id_seq') NOT NULL,
    "id_product_cart" character varying NOT NULL,
    "quantity_cart" character varying NOT NULL,
    "price_total_cart" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qty_remise" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "created_at" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "versement_projets";
DROP SEQUENCE IF EXISTS versement_projets_id_seq;
CREATE SEQUENCE versement_projets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."versement_projets" (
    "id" integer DEFAULT nextval('versement_projets_id_seq') NOT NULL,
    "nom_projet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "montant_verser" character varying NOT NULL,
    "montant_en_lettre" character varying NOT NULL,
    "type_versement" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "reference" integer NOT NULL
) WITH (oids = false);


-- 2022-12-31 07:43:42.359227+00

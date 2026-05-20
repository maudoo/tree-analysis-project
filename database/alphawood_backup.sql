--
-- PostgreSQL database dump
--

\restrict WdBKVihujhunyGa2IlavVElBxwSsShBel0qDPmoy6dKdJd36mUNnVUG1X3bZ78s

-- Dumped from database version 16.4
-- Dumped by pg_dump version 18.1

-- Started on 2026-05-20 15:06:35 CDT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 17798)
-- Name: mission_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mission_log (
    log_id integer NOT NULL,
    player_id integer,
    mission_id integer,
    tree_id text,
    completed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    points_earned integer NOT NULL
);


ALTER TABLE public.mission_log OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17797)
-- Name: mission_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mission_log_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mission_log_log_id_seq OWNER TO postgres;

--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 221
-- Name: mission_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mission_log_log_id_seq OWNED BY public.mission_log.log_id;


--
-- TOC entry 220 (class 1259 OID 17787)
-- Name: missions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.missions (
    mission_id integer NOT NULL,
    title text NOT NULL,
    points integer DEFAULT 10 NOT NULL,
    tree_id text,
    hint text,
    is_active boolean DEFAULT true NOT NULL,
    difficulty text DEFAULT 'easy'::text,
    category text DEFAULT 'exploration'::text
);


ALTER TABLE public.missions OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17786)
-- Name: missions_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.missions_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.missions_mission_id_seq OWNER TO postgres;

--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 219
-- Name: missions_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.missions_mission_id_seq OWNED BY public.missions.mission_id;


--
-- TOC entry 223 (class 1259 OID 17835)
-- Name: player_missions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_missions (
    player_id integer NOT NULL,
    mission_id integer NOT NULL,
    accepted_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.player_missions OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17720)
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    username text NOT NULL,
    total_points integer DEFAULT 0 NOT NULL,
    level integer DEFAULT 1
);


ALTER TABLE public.players OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17719)
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.players_player_id_seq OWNER TO postgres;

--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 217
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- TOC entry 225 (class 1259 OID 17855)
-- Name: tree_photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tree_photos (
    photo_id integer NOT NULL,
    player_id integer,
    tree_id text NOT NULL,
    file_path text NOT NULL,
    photo_lat double precision,
    photo_lon double precision,
    distance_meters double precision,
    is_verified boolean DEFAULT false,
    uploaded_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tree_photos OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17854)
-- Name: tree_photos_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tree_photos_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tree_photos_photo_id_seq OWNER TO postgres;

--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 224
-- Name: tree_photos_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tree_photos_photo_id_seq OWNED BY public.tree_photos.photo_id;


--
-- TOC entry 216 (class 1259 OID 17700)
-- Name: trees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trees (
    id integer NOT NULL,
    tree_id text,
    common_name text,
    scientific_name text,
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.trees OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17699)
-- Name: trees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trees_id_seq OWNER TO postgres;

--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 215
-- Name: trees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trees_id_seq OWNED BY public.trees.id;


--
-- TOC entry 3476 (class 2604 OID 17801)
-- Name: mission_log log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mission_log ALTER COLUMN log_id SET DEFAULT nextval('public.mission_log_log_id_seq'::regclass);


--
-- TOC entry 3471 (class 2604 OID 17790)
-- Name: missions mission_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.missions ALTER COLUMN mission_id SET DEFAULT nextval('public.missions_mission_id_seq'::regclass);


--
-- TOC entry 3468 (class 2604 OID 17723)
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- TOC entry 3479 (class 2604 OID 17858)
-- Name: tree_photos photo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tree_photos ALTER COLUMN photo_id SET DEFAULT nextval('public.tree_photos_photo_id_seq'::regclass);


--
-- TOC entry 3467 (class 2604 OID 17703)
-- Name: trees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trees ALTER COLUMN id SET DEFAULT nextval('public.trees_id_seq'::regclass);


--
-- TOC entry 3654 (class 0 OID 17798)
-- Dependencies: 222
-- Data for Name: mission_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mission_log (log_id, player_id, mission_id, tree_id, completed_at, points_earned) FROM stdin;
1	1	1	1001	2026-01-31 21:55:52.424883	20
5	1	2	358	2026-02-11 20:41:17.337955	30
7	1	3	358	2026-02-12 10:33:42.93299	30
\.


--
-- TOC entry 3652 (class 0 OID 17787)
-- Dependencies: 220
-- Data for Name: missions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.missions (mission_id, title, points, tree_id, hint, is_active, difficulty, category) FROM stdin;
1	Find a tree near the main entrance	20	\N	Start near the entrance and look for a large canopy.	t	easy	exploration
2	Locate the oldest-looking tree you can find	30	\N	Look for thick bark and wide trunk.	t	easy	exploration
3	Find tree_id = 1001	25	358	Search around the center area.	t	easy	exploration
\.


--
-- TOC entry 3655 (class 0 OID 17835)
-- Dependencies: 223
-- Data for Name: player_missions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_missions (player_id, mission_id, accepted_at) FROM stdin;
\.


--
-- TOC entry 3650 (class 0 OID 17720)
-- Dependencies: 218
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (player_id, username, total_points, level) FROM stdin;
1	yash	0	1
\.


--
-- TOC entry 3657 (class 0 OID 17855)
-- Dependencies: 225
-- Data for Name: tree_photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tree_photos (photo_id, player_id, tree_id, file_path, photo_lat, photo_lon, distance_meters, is_verified, uploaded_at) FROM stdin;
1	1	358	uploads/358_64a2fbcf37b14c7d9c82f328b95497f8.jpg	41.833962715	-87.629109251	0	t	2026-03-04 20:51:19.244335
\.


--
-- TOC entry 3648 (class 0 OID 17700)
-- Dependencies: 216
-- Data for Name: trees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trees (id, tree_id, common_name, scientific_name, latitude, longitude) FROM stdin;
1	1	Elm-American	Ulmus americana	41.831052875	-87.628747395
2	2	Elm-American	Ulmus americana	41.831057579	-87.628542281
3	3	Elm-American	Ulmus americana	41.831057959	-87.628452116
4	4	Elm-American	Ulmus americana	41.831052401	-87.628339326
5	5	Elm-American	Ulmus americana	41.831061894	-87.628223161
6	6	Elm-American	Ulmus americana	41.831066249	-87.628137029
7	7	Elm-American	Ulmus americana	41.831053946	-87.62802723
8	8	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831093308	-87.627861277
9	9	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83110159	-87.627951738
10	10	Common Baldcypress	Taxodium distichum	41.831101413	-87.628057077
11	11	Common Baldcypress	Taxodium distichum	41.831085197	-87.628155702
12	12	Common Baldcypress	Taxodium distichum	41.831100294	-87.628262375
13	13	Common Baldcypress	Taxodium distichum	41.831077209	-87.62860737
14	14	Common Baldcypress	Taxodium distichum	41.831082552	-87.628696957
15	15	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831128406	-87.628907005
16	16	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831193818	-87.628913776
17	17	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831290687	-87.628915177
18	18	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831351458	-87.628917562
19	19	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831608654	-87.628907842
20	20	Common Baldcypress	Taxodium distichum	41.831693714	-87.628904219
21	21	Common Baldcypress	Taxodium distichum	41.831763324	-87.628908282
22	22	Dawn Redwood	Metasequoia glyptostroboides	41.832096593	-87.628927493
23	23	Dawn Redwood	Metasequoia glyptostroboides	41.832138025	-87.628933472
24	24	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832224784	-87.628927076
25	25	Maple-Freeman's	Acer x freemanii	41.832327376	-87.628927245
26	27	Hackberry	Celtis occidentalis	41.832449058	-87.62894135
27	29	Maple-Freeman's	Acer x freemanii	41.83256969	-87.628933352
28	30	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832726174	-87.62884307
29	31	Redbud-Eastern	Cercis canadensis	41.832722558	-87.628714416
30	32	Serviceberry	Amelanchier sp.	41.832721928	-87.628629008
31	33	Serviceberry	Amelanchier sp.	41.832732624	-87.628598812
32	34	Catalpa-Northern	Catalpa speciosa	41.832738312	-87.628544736
33	35	Hawthorn	Crataegus sp.	41.832735182	-87.628329115
34	36	Hackberry	Celtis occidentalis	41.832727369	-87.628236538
35	37	Hackberry	Celtis occidentalis	41.832727223	-87.628178547
36	38	Hawthorn	Crataegus sp.	41.832734797	-87.628088309
37	39	Linden-Littleleaf	Tilia cordata	41.832737396	-87.628012089
38	40	Elm-American	Ulmus americana	41.832709394	-87.627966894
39	41	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832708356	-87.6278848
40	42	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832677666	-87.627867822
41	43	Oak-Swamp White	Quercus bicolor	41.832615926	-87.627855123
42	44	Oak-Swamp White	Quercus bicolor	41.832566706	-87.627861595
43	45	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83262563	-87.627944782
44	46	Hackberry	Celtis occidentalis	41.832535115	-87.627949427
45	47	Hackberry	Celtis occidentalis	41.832463807	-87.627900693
46	48	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832424885	-87.627840545
47	49	Elm-American	Ulmus americana	41.83234508	-87.627948921
48	50	Oak-Swamp White	Quercus bicolor	41.832312659	-87.627861526
49	51	Oak-Swamp White	Quercus bicolor	41.832291277	-87.627910724
50	52	Oak-Swamp White	Quercus bicolor	41.832255684	-87.62792184
51	53	Catalpa-Northern	Catalpa speciosa	41.832201274	-87.627919066
52	54	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832159004	-87.627908827
53	55	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832168397	-87.627865643
54	56	Redbud-Eastern	Cercis canadensis	41.832099912	-87.627863574
55	57	Redbud-Eastern	Cercis canadensis	41.832083543	-87.627865677
56	58	Redbud-Eastern	Cercis canadensis	41.832107337	-87.627900795
57	59	Hawthorn	Crataegus sp.	41.832094028	-87.627946335
58	60	Elm-American	Ulmus americana	41.832022448	-87.62793227
59	61	Hackberry	Celtis occidentalis	41.831986839	-87.627918176
60	62	Hackberry	Celtis occidentalis	41.831941431	-87.627956614
61	63	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83185781	-87.627932374
62	64	Oak-Swamp White	Quercus bicolor	41.831668018	-87.627959657
63	65	Redbud-Eastern	Cercis canadensis	41.831628692	-87.627959669
64	66	Redbud-Eastern	Cercis canadensis	41.831600006	-87.627968898
65	67	Serviceberry	Amelanchier sp.	41.831489178	-87.627970901
66	68	Serviceberry	Amelanchier sp.	41.831440995	-87.627974774
67	69	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831378123	-87.627866601
68	70	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831334739	-87.627952335
69	71	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831292082	-87.627958918
70	72	Kentucky Coffeetree	Gymnocladus dioicus	41.831222862	-87.627950468
71	73	Viburnum	Viburnum sp.	41.83117417	-87.62796157
72	74	Fringetree-White	Chionanthus virginicus	41.832228466	-87.627856354
73	75	Redbud-Eastern	Cercis canadensis	41.832804266	-87.627981813
74	76	Redbud-Eastern	Cercis canadensis	41.832851169	-87.627945287
75	77	Redbud-Eastern	Cercis canadensis	41.832854706	-87.62791798
76	78	Tuliptree	Liriodendron tulipifera	41.833055579	-87.628250419
77	79	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833239917	-87.628057641
78	80	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833146823	-87.627885204
79	81	Witchhazel	Hamamelis virginiana	41.83365762	-87.627974525
80	82	Maple-Norway	Acer platanoides	41.833729396	-87.627989497
81	83	Maple-Norway	Acer platanoides	41.833900304	-87.628005662
82	84	Linden-Littleleaf	Tilia cordata	41.83401016	-87.627960255
83	85	Elm-American	Ulmus americana	41.834172278	-87.628010962
84	86	Elm-American	Ulmus americana	41.834161099	-87.628710698
85	87	Walnut-Black	Juglans nigra	41.834026987	-87.628769517
86	88	Serviceberry	Amelanchier sp.	41.83391414	-87.628730388
87	89	Horsechestnut- Common	Aesculus hippocastanum	41.833883297	-87.62873276
88	90	Serviceberry	Amelanchier sp.	41.833895673	-87.628712904
89	91	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833850748	-87.628763557
90	92	Serviceberry	Amelanchier sp.	41.833807219	-87.628772972
91	93	Serviceberry	Amelanchier sp.	41.83379499	-87.628731602
92	94	Horsechestnut- Common	Aesculus hippocastanum	41.833683005	-87.628705632
93	95	Redbud-Eastern	Cercis canadensis	41.833528003	-87.628686208
94	96	Redbud-Eastern	Cercis canadensis	41.833503793	-87.628669126
95	97	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833425193	-87.628690878
96	98	Serviceberry	Amelanchier sp.	41.833381018	-87.628684586
97	99	Serviceberry	Amelanchier sp.	41.833362652	-87.628695019
98	100	Crabapple	Malus sp.	41.833289224	-87.628678918
99	101	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831100031	-87.627623777
100	102	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83110533	-87.627535223
101	103	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831101572	-87.6274497
102	104	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831096803	-87.627346493
103	105	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831116326	-87.627275894
104	106	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831108147	-87.62717825
105	107	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831102683	-87.627097946
106	108	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831102221	-87.626991946
107	109	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831105084	-87.626912954
108	110	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831242746	-87.626711219
109	111	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831299883	-87.626708915
110	112	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831360951	-87.626731218
111	113	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83140716	-87.626716201
112	114	Oak-Bur	Quercus macrocarpa	41.831768932	-87.626703696
113	115	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831811335	-87.626726245
114	116	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831868591	-87.626724463
115	117	Honeylocust-Common	Gleditsia triacanthos	41.831762476	-87.626821079
116	118	Honeylocust-Common	Gleditsia triacanthos	41.831782509	-87.626839443
117	119	Kentucky Coffeetree	Gymnocladus dioicus	41.831921262	-87.626811509
118	120	Euonymus	Euonymus sp.	41.831885513	-87.627165146
119	121	Euonymus	Euonymus sp.	41.832009867	-87.62716165
120	122	Kentucky Coffeetree	Gymnocladus dioicus	41.831988741	-87.62683508
121	123	Maple-Freeman's	Acer x freemanii	41.832053547	-87.626822051
122	124	Ash-White	Fraxinus americana	41.83209602	-87.626714419
123	125	Ash-White	Fraxinus americana	41.832143763	-87.626708926
124	126	Oak-Bur	Quercus macrocarpa	41.83219396	-87.62671897
125	127	Kentucky Coffeetree	Gymnocladus dioicus	41.832234291	-87.626723182
126	128	Oak-Bur	Quercus macrocarpa	41.832450552	-87.626728863
127	129	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832526809	-87.626707831
128	130	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832580542	-87.626697121
129	131	Kentucky Coffeetree	Gymnocladus dioicus	41.832622778	-87.626733694
130	132	Kentucky Coffeetree	Gymnocladus dioicus	41.832658245	-87.626705143
131	133	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832708858	-87.626750664
132	134	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832740578	-87.626700898
133	135	Elm	Ulmus sp.	41.832487843	-87.626860568
134	136	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832549893	-87.62684082
135	137	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832575125	-87.626917838
136	138	Kentucky Coffeetree	Gymnocladus dioicus	41.832652718	-87.626827152
137	139	Serviceberry	Amelanchier sp.	41.832687342	-87.626876886
138	140	Serviceberry	Amelanchier canadensis	41.832713366	-87.626903827
139	141	Honeylocust-Common	Gleditsia triacanthos	41.832694181	-87.626986595
140	142	Hawthorn	Crataegus sp.	41.832712889	-87.627100624
141	143	Hawthorn	Crataegus sp.	41.832742264	-87.627167379
142	144	Hawthorn	Crataegus sp.	41.832735919	-87.627439457
143	145	Hawthorn	Crataegus sp.	41.832722194	-87.627497969
144	146	Hackberry	Celtis occidentalis	41.832712963	-87.627640982
145	147	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832708337	-87.627567312
146	148	Hackberry	Celtis occidentalis	41.832721821	-87.627598357
147	149	Oak-Bur	Quercus macrocarpa	41.832719443	-87.627677956
148	150	Hawthorn	Crataegus sp.	41.83268003	-87.62774194
149	151	Oak-Northern Red	Quercus rubra	41.832631962	-87.627719735
150	152	Hackberry	Celtis occidentalis	41.832598445	-87.627636551
151	153	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832550938	-87.62769165
152	154	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83253298	-87.627649553
153	155	Catalpa	Catalpa sp.	41.832481978	-87.627723294
154	156	Maple-Freeman's	Acer x freemanii	41.832409423	-87.627667403
155	157	Elm-American	Ulmus americana	41.83239509	-87.627586738
156	158	Oak-Swamp White	Quercus bicolor	41.832305441	-87.627605795
157	159	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832265066	-87.627695856
158	160	Oak-Northern Red	Quercus rubra	41.832157577	-87.627718569
159	161	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832111261	-87.627695906
160	162	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832029971	-87.627713136
161	163	Serviceberry	Amelanchier sp.	41.832031511	-87.627641374
162	164	Linden-Littleleaf	Tilia cordata	41.831993341	-87.627555657
163	165	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831907562	-87.627361862
164	167	Serviceberry	Amelanchier sp.	41.831902888	-87.627602184
165	168	Hawthorn	Crataegus sp.	41.831914306	-87.627699409
166	169	Hawthorn	Crataegus sp.	41.831854364	-87.627713984
167	170	Redbud-Eastern	Cercis canadensis	41.831804534	-87.6278235
168	171	Hackberry	Celtis occidentalis	41.831741471	-87.627669097
169	172	Hackberry	Celtis occidentalis	41.831659612	-87.627705495
170	173	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831706236	-87.627804311
171	174	Oak-Northern Red	Quercus rubra	41.831655833	-87.627807371
172	175	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831464029	-87.627727841
173	176	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831380727	-87.627724229
174	177	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831257086	-87.627723053
175	178	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831179489	-87.627719894
176	179	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832799112	-87.626731363
177	180	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832839937	-87.62672142
178	181	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832882041	-87.626736581
179	182	Hawthorn	Crataegus sp.	41.832880684	-87.626840215
180	183	Honeylocust-Common	Gleditsia triacanthos	41.832869951	-87.626850707
181	185	Honeylocust-Common	Gleditsia triacanthos	41.832872702	-87.62706186
182	186	Hawthorn	Crataegus sp.	41.832855047	-87.627326174
183	187	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832863412	-87.627404157
184	188	Kentucky Coffeetree	Gymnocladus dioicus	41.832865885	-87.627506829
185	189	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832871904	-87.627743654
186	190	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832802791	-87.627747772
187	191	Hawthorn	Crataegus sp.	41.832960207	-87.627719915
188	192	Kentucky Coffeetree	Gymnocladus dioicus	41.833002957	-87.627734778
189	193	Elm	Ulmus sp.	41.833167969	-87.627724368
190	194	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833282144	-87.627750775
191	195	Hawthorn	Crataegus sp.	41.833373526	-87.62772807
192	196	Ash-White	Fraxinus americana	41.832969989	-87.626730857
193	197	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833016798	-87.62669747
194	198	Ash-White	Fraxinus americana	41.833050224	-87.626727597
195	199	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83311297	-87.62672872
196	200	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833155603	-87.626697485
197	201	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832814633	-87.62684025
198	202	Downy Hawthorn	Crataegus mollis	41.832790467	-87.626883467
199	203	Serviceberry	Amelanchier sp.	41.832795667	-87.626919483
200	204	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8328093	-87.6270193
201	205	Elm	Ulmus sp.	41.832824517	-87.627089217
202	206	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832790283	-87.62713825
203	207	Hawthorn	Crataegus sp.	41.832819752	-87.627184416
204	208	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832787017	-87.627470117
205	209	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832806717	-87.627532017
206	210	Downy Hawthorn	Crataegus mollis	41.832826202	-87.627660739
207	211	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833096667	-87.627737217
208	212	Elm	Ulmus sp.	41.833002033	-87.627574783
209	214	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832977328	-87.62749193
210	215	Hawthorn	Crataegus sp.	41.832985901	-87.627397092
211	216	Hawthorn	Crataegus sp.	41.83300555	-87.62713535
212	217	Kentucky Coffeetree	Gymnocladus dioicus	41.832934017	-87.627055567
213	218	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833001867	-87.6270094
214	219	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832991117	-87.6269282
215	220	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832926417	-87.626898067
216	221	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832970133	-87.626866517
217	222	Kentucky Coffeetree	Gymnocladus dioicus	41.8329384	-87.626796167
218	223	Hawthorn	Crataegus sp.	41.833066033	-87.62679345
219	224	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8331371	-87.626814283
220	225	Kentucky Coffeetree	Gymnocladus dioicus	41.8332096	-87.626774667
221	226	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83330475	-87.626801283
222	227	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833373617	-87.626799383
223	228	Hawthorn	Crataegus sp.	41.833396092	-87.626897389
224	229	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833529217	-87.626864433
225	230	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8335315	-87.626891267
226	231	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833594717	-87.6269754
227	232	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8335997	-87.626858367
228	233	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833636467	-87.626869783
229	234	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83371085	-87.626831433
230	235	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833731517	-87.626863
231	236	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8337847	-87.626838767
232	237	Catalpa-Northern	Catalpa speciosa	41.833814017	-87.62683365
233	238	Hackberry	Celtis occidentalis	41.8338598	-87.626871033
234	239	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833888067	-87.626845933
235	240	Hackberry	Celtis occidentalis	41.833921367	-87.62689835
236	241	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833957233	-87.62692665
237	242	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834021633	-87.62691725
238	243	Hawthorn	Crataegus sp.	41.83411125	-87.62685652
239	244	Hawthorn	Crataegus sp.	41.83412863	-87.62687837
240	245	Hawthorn	Crataegus sp.	41.83414388	-87.62685372
241	246	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83417325	-87.62686685
242	247	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83419617	-87.62680935
243	248	Serviceberry	Amelanchier sp.	41.83421805	-87.62682647
244	249	Serviceberry	Amelanchier sp.	41.8342456	-87.62685425
245	250	Poplar-Eastern	Populus deltoides	41.83433977	-87.62685062
246	251	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833190593	-87.626729102
247	252	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833319287	-87.626744152
248	253	Honeylocust-Common	Gleditsia triacanthos	41.833376861	-87.626756432
249	254	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833511098	-87.62673964
250	255	Honeylocust-Common	Gleditsia triacanthos	41.83359645	-87.626757145
251	256	Honeylocust-Common	Gleditsia triacanthos	41.833662044	-87.626754846
252	257	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833788008	-87.626746648
253	258	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833836074	-87.626713841
254	259	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833857575	-87.626759302
255	260	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833890471	-87.626723344
256	261	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833915403	-87.626764606
257	262	Ash-White	Fraxinus americana	41.833978465	-87.626763991
258	263	Redbud-Eastern	Cercis canadensis	41.83432843	-87.62691908
259	264	Redbud-Eastern	Cercis canadensis	41.83433102	-87.62699258
260	265	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83432592	-87.62704902
261	266	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8343667	-87.62693072
262	267	Redbud-Eastern	Cercis canadensis	41.83440312	-87.62687685
263	268	Redbud-Eastern	Cercis canadensis	41.83442663	-87.62689192
264	269	Hawthorn	Crataegus sp.	41.8344619	-87.62690147
265	270	Hawthorn	Crataegus sp.	41.83446665	-87.62687367
266	271	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83453925	-87.6268941
267	272	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8345604	-87.6269642
268	273	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83455835	-87.62709347
269	274	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83440018	-87.6272663
270	275	Redbud-Eastern	Cercis canadensis	41.83430885	-87.6272916
271	276	Redbud-Eastern	Cercis canadensis	41.834315398	-87.627352849
272	277	Redbud-Eastern	Cercis canadensis	41.83424212	-87.62733347
273	278	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834256	-87.62735968
274	279	Redbud-Eastern	Cercis canadensis	41.83422802	-87.62731143
275	280	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83415255	-87.62733798
276	281	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8340807	-87.6272973
277	282	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83401237	-87.6273011
278	283	Hackberry	Celtis occidentalis	41.83394735	-87.62729205
279	284	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83392304	-87.62738158
280	285	Catalpa-Northern	Catalpa speciosa	41.83371708	-87.62730518
281	286	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83365123	-87.6272629
282	287	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83362798	-87.6273251
283	288	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83359985	-87.62726285
284	289	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83357568	-87.62731727
285	290	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83351463	-87.62732163
286	291	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83347838	-87.62748452
287	292	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83352965	-87.62764255
288	293	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83356543	-87.62744178
289	294	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83380253	-87.62743762
290	295	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83384943	-87.62775145
291	296	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834532911	-87.627784359
292	297	Kentucky Coffeetree	Gymnocladus dioicus	41.83460773	-87.627703089
293	298	Ash-Green	Fraxinus pennsylvanica	41.834613587	-87.627608466
294	299	Ash-Green	Fraxinus pennsylvanica	41.83474385	-87.62766338
295	300	Ash-Green	Fraxinus pennsylvanica	41.83474527	-87.62775732
296	301	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833204147	-87.628689623
297	302	Oak-Bur	Quercus macrocarpa	41.833257447	-87.628582528
298	303	Hawthorn	Crataegus sp.	41.83318735	-87.628603653
299	304	Hawthorn	Crataegus sp.	41.833152363	-87.628627509
300	305	Hawthorn	Crataegus sp.	41.833108996	-87.628649033
301	306	Hawthorn	Crataegus sp.	41.833127144	-87.628677964
302	307	Catalpa-Northern	Catalpa speciosa	41.833053121	-87.628696494
303	308	Catalpa-Northern	Catalpa speciosa	41.833016642	-87.62863358
304	309	Catalpa-Northern	Catalpa speciosa	41.832936461	-87.628665844
305	310	Elm-American	Ulmus americana	41.832669147	-87.629132921
306	311	Elm-American	Ulmus americana	41.832668222	-87.629224738
307	312	Elm-American	Ulmus americana	41.832728063	-87.629268928
308	313	Elm-American	Ulmus americana	41.832737744	-87.629185243
309	314	Elm-American	Ulmus americana	41.832760431	-87.629139765
310	315	Oak-Bur	Quercus macrocarpa	41.833098815	-87.628904234
311	316	Hawthorn	Crataegus sp.	41.833114388	-87.629036884
312	317	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833203403	-87.628997137
313	318	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833211108	-87.629084875
314	319	Oak-Swamp White	Quercus bicolor	41.833317351	-87.629010314
315	320	Oak-Swamp White	Quercus bicolor	41.833336089	-87.629011955
316	321	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833411461	-87.6289177
317	322	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83342442	-87.629060339
318	323	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83348491	-87.629048654
319	324	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833511116	-87.629037116
320	325	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833527024	-87.628953356
321	326	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833632115	-87.62903299
322	327	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83370288	-87.629093168
323	328	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833727584	-87.629025457
324	329	Serviceberry	Amelanchier sp.	41.833721795	-87.629098402
325	331	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833678634	-87.628929704
326	332	Walnut-Black	Juglans nigra	41.833803065	-87.628935411
327	334	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833886267	-87.628936126
328	335	Redbud-Eastern	Cercis canadensis	41.833953347	-87.62896316
329	336	Ginkgo	Ginkgo biloba	41.834126888	-87.629060988
330	337	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834236665	-87.628977252
331	338	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83437531	-87.62897493
332	339	Redbud-Eastern	Cercis canadensis	41.834465199	-87.62895099
333	340	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834510265	-87.628946784
334	341	Serviceberry	Amelanchier sp.	41.834536914	-87.629059794
335	342	Ginkgo	Ginkgo biloba	41.834550942	-87.629141077
336	343	Serviceberry	Amelanchier sp.	41.834463573	-87.629118188
337	344	Hornbeam-American	Carpinus caroliniana	41.834426668	-87.629098381
338	345	Serviceberry	Amelanchier sp.	41.834434432	-87.629131068
339	346	Ginkgo	Ginkgo biloba	41.834422115	-87.629086446
340	347	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834395257	-87.629091891
341	348	Ginkgo	Ginkgo biloba	41.834350614	-87.629013942
342	349	Ginkgo	Ginkgo biloba	41.834363393	-87.629034408
343	350	Ginkgo	Ginkgo biloba	41.834256491	-87.629021744
344	351	Ginkgo	Ginkgo biloba	41.834278064	-87.629019804
345	352	Hornbeam-American	Carpinus caroliniana	41.83422343	-87.629121323
346	353	Serviceberry	Amelanchier sp.	41.834195519	-87.629030921
347	354	Redbud-Eastern	Cercis canadensis	41.834156633	-87.629036282
348	355	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834160681	-87.629146482
349	356	Hornbeam-American	Carpinus caroliniana	41.83405513	-87.629058899
350	357	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834010583	-87.62912896
351	358	Hornbeam-American	Carpinus caroliniana	41.833962715	-87.629109251
352	359	Hornbeam-American	Carpinus caroliniana	41.83396578	-87.629054578
353	360	Hawthorn	Crataegus sp.	41.833989479	-87.629029246
354	361	Hawthorn	Crataegus sp.	41.834039232	-87.629046697
355	362	Linden-American	Tilia americana	41.834244224	-87.628786753
356	363	Linden-American	Tilia americana	41.834253525	-87.628703317
357	364	Linden-American	Tilia americana	41.834322049	-87.628682384
358	365	Linden-American	Tilia americana	41.834324679	-87.628779644
359	366	Linden-American	Tilia americana	41.834411114	-87.628782892
360	367	Linden-American	Tilia americana	41.834470714	-87.628803062
361	368	Linden-American	Tilia americana	41.834493191	-87.628685681
362	369	Linden-American	Tilia americana	41.834540308	-87.628724328
363	370	Maple-Norway	Acer platanoides	41.834598621	-87.62862906
364	371	Maple-Norway	Acer platanoides	41.834600386	-87.62853679
365	372	Maple-Norway	Acer platanoides	41.83461269	-87.62844742
366	373	Maple-Norway	Acer platanoides	41.834616886	-87.628365477
367	374	Maple-Norway	Acer platanoides	41.834612611	-87.628255986
368	376	Chokecherry-Common	Prunus virginiana	41.834610086	-87.628075716
369	377	Linden-American	Tilia americana	41.834280479	-87.627886487
370	379	Linden-American	Tilia americana	41.834370059	-87.628021918
371	380	Linden-American	Tilia americana	41.834417446	-87.628004669
372	381	Linden-American	Tilia americana	41.834348696	-87.62793605
373	382	Linden-American	Tilia americana	41.834393534	-87.627909119
374	383	Linden-American	Tilia americana	41.834474311	-87.62792368
375	384	Linden-American	Tilia americana	41.834579048	-87.627933302
376	385	Linden-American	Tilia americana	41.83455877	-87.62806724
377	386	Linden-American	Tilia americana	41.834835845	-87.627950591
378	387	Linden-American	Tilia americana	41.834948497	-87.627936677
379	388	Linden-American	Tilia americana	41.835012682	-87.627906958
380	389	Linden-American	Tilia americana	41.835094575	-87.627946079
381	390	Linden-American	Tilia americana	41.83509629	-87.628043034
382	391	Linden-American	Tilia americana	41.835009175	-87.628030481
383	392	Linden-American	Tilia americana	41.834930502	-87.628041951
384	393	Linden-American	Tilia americana	41.834824906	-87.628027624
385	394	Linden-American	Tilia americana	41.835178627	-87.627923196
386	395	Linden-American	Tilia americana	41.83521217	-87.628051492
387	396	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835164574	-87.628290331
388	397	Linden-American	Tilia americana	41.83529818	-87.628035494
389	399	Serviceberry	Amelanchier sp.	41.835331483	-87.628027615
390	400	Linden-American	Tilia americana	41.835401037	-87.627941815
391	401	Ash-White	Fraxinus americana	41.834079318	-87.626760223
392	402	Kentucky Coffeetree	Gymnocladus dioicus	41.834184545	-87.626768736
393	403	Catalpa	Catalpa sp.	41.834219816	-87.626742054
394	404	Ash-White	Fraxinus americana	41.834306608	-87.626760709
395	405	Oak-Bur	Quercus macrocarpa	41.834358525	-87.626778599
396	406	Hackberry	Celtis occidentalis	41.834438117	-87.626769093
397	407	Ash-White	Fraxinus americana	41.834527558	-87.626771086
398	408	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834624702	-87.626960196
399	409	Planetree-London	Platanus x acerifolia	41.834634611	-87.627151155
400	410	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834639046	-87.627258656
401	411	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834618098	-87.627325285
402	412	Hackberry	Celtis occidentalis	41.83456289	-87.627292437
403	413	Hackberry	Celtis occidentalis	41.834495987	-87.627299121
404	414	Redbud-Eastern	Cercis canadensis	41.834543509	-87.627321808
405	415	Honeylocust-Common	Gleditsia triacanthos	41.834539845	-87.627379086
406	416	Honeylocust-Common	Gleditsia triacanthos	41.83451647	-87.627452432
407	417	Crabapple	Malus sp.	41.834298021	-87.62744957
408	418	Crabapple	Malus sp.	41.83418151	-87.627444405
409	419	Hawthorn	Crataegus sp.	41.834148823	-87.627404141
410	420	Redbud-Eastern	Cercis canadensis	41.834109773	-87.627342192
411	421	Redbud-Eastern	Cercis canadensis	41.834076412	-87.627354688
412	422	Hawthorn	Crataegus sp.	41.83405036	-87.627358267
413	423	Hawthorn	Crataegus sp.	41.834037826	-87.62730041
414	424	Hawthorn	Crataegus sp.	41.834002735	-87.627323872
415	425	Redbud-Eastern	Cercis canadensis	41.833920399	-87.627343971
416	426	Hawthorn	Crataegus sp.	41.833802074	-87.627311215
417	427	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833550871	-87.627567507
418	428	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833673659	-87.627451788
419	429	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83372672	-87.627731562
420	430	Hawthorn	Crataegus sp.	41.833776493	-87.627671892
421	431	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833880262	-87.627642713
422	432	Hawthorn	Crataegus sp.	41.833871592	-87.627523912
423	433	Hawthorn	Crataegus sp.	41.833874937	-87.627453482
424	434	Linden-American	Tilia americana	41.833973968	-87.627767491
425	435	Viburnum	Viburnum sp.	41.834057559	-87.62776866
426	436	Hawthorn	Crataegus sp.	41.834115747	-87.627768275
427	437	Hawthorn	Crataegus sp.	41.834330637	-87.627868811
428	438	Viburnum	Viburnum sp.	41.834389666	-87.627771879
429	439	Hawthorn	Crataegus sp.	41.834856383	-87.627452098
430	440	Hawthorn	Crataegus sp.	41.835054636	-87.627440234
431	441	Hawthorn	Crataegus sp.	41.835129038	-87.627448202
432	442	Hawthorn	Crataegus sp.	41.835215805	-87.627455796
433	443	Hawthorn	Crataegus sp.	41.835283506	-87.62746282
434	444	Hawthorn	Crataegus sp.	41.835368735	-87.627387251
435	445	Hawthorn	Crataegus sp.	41.835320173	-87.627386724
436	446	Hawthorn	Crataegus sp.	41.835248363	-87.627394069
437	447	Hawthorn	Crataegus sp.	41.835162705	-87.62738535
438	448	Hawthorn	Crataegus sp.	41.835102974	-87.627394285
439	449	Euonymus-BurningBush	Euonymus alatus	41.835041865	-87.627364715
440	450	Maple-Freeman's	Acer x freemanii	41.83478574	-87.627368635
441	451	Hawthorn	Crataegus sp.	41.834870586	-87.627345069
442	453	Hawthorn	Crataegus sp.	41.834971097	-87.627261121
443	454	Hawthorn	Crataegus sp.	41.83496908	-87.627064321
444	455	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834875116	-87.626779583
445	456	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834955769	-87.626793804
446	457	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8349928	-87.62676222
447	458	Hackberry	Celtis occidentalis	41.835020842	-87.626797167
448	459	Oak-Bur	Quercus macrocarpa	41.835091353	-87.626809471
449	460	Kentucky Coffeetree	Gymnocladus dioicus	41.835170941	-87.626753961
450	461	Hackberry	Celtis occidentalis	41.835215543	-87.626797267
451	462	Hackberry	Celtis occidentalis	41.835247735	-87.626823616
452	463	Ash-Green	Fraxinus pennsylvanica	41.835261945	-87.626810971
453	464	Linden-American	Tilia americana	41.835320743	-87.626796233
454	465	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836173056	-87.626802608
455	466	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836242648	-87.626820513
456	467	Ash-White	Fraxinus americana	41.836346841	-87.626814314
457	468	Catalpa	Catalpa sp.	41.836528773	-87.626798118
458	469	Catalpa	Catalpa sp.	41.836539541	-87.626810529
459	470	Oak-Bur	Quercus macrocarpa	41.83658261	-87.626785183
460	471	Serviceberry	Amelanchier sp.	41.836083646	-87.627687468
461	472	Redbud-Eastern	Cercis canadensis	41.836082282	-87.627424136
462	473	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836069803	-87.627330912
463	474	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836083049	-87.627241567
464	475	Hackberry	Celtis occidentalis	41.835951203	-87.627285964
465	476	Yellowwood	Cladrastis kentukea	41.835931737	-87.627622603
466	477	Hawthorn	Crataegus sp.	41.836477415	-87.627245665
467	478	Hawthorn	Crataegus sp.	41.836503674	-87.627196848
468	479	Hawthorn	Crataegus sp.	41.836502651	-87.627120991
469	480	Hawthorn	Crataegus sp.	41.836497394	-87.6270291
470	481	Hawthorn	Crataegus sp.	41.83657334	-87.627078022
471	482	Hawthorn	Crataegus sp.	41.836578226	-87.627218033
472	483	Crabapple	Malus sp.	41.836599588	-87.627287785
473	484	Redbud-Eastern	Cercis canadensis	41.836710887	-87.62740483
474	485	Hawthorn	Crataegus sp.	41.836508986	-87.627739745
475	486	Hawthorn	Crataegus sp.	41.83659218	-87.627735579
476	487	Redbud-Eastern	Cercis canadensis	41.836713149	-87.627738382
477	488	Redbud-Eastern	Cercis canadensis	41.836743813	-87.627689805
478	489	Tuliptree	Liriodendron tulipifera	41.836752668	-87.627491069
479	490	Tuliptree	Liriodendron tulipifera	41.836816813	-87.62743818
480	491	Tuliptree	Liriodendron tulipifera	41.836839921	-87.627570389
481	492	Plum-Purple Leaf	Prunus cerasifera	41.836911262	-87.627547104
482	493	Crabapple	Malus sp.	41.836957013	-87.627526492
483	494	Crabapple	Malus sp.	41.836988192	-87.627533385
484	495	Hawthorn	Crataegus sp.	41.837372874	-87.627591136
485	496	Hornbeam-European	Carpinus betulus	41.837047052	-87.627807878
486	497	Hornbeam-European	Carpinus betulus	41.837074068	-87.627842106
487	498	Hornbeam-European	Carpinus betulus	41.837139611	-87.627843484
488	499	Hornbeam-European	Carpinus betulus	41.837141232	-87.627808879
489	500	Catalpa	Catalpa sp.	41.837340919	-87.627831896
490	601	Serviceberry	Amelanchier sp.	41.8355474	-87.628042773
491	602	Maple-Norway	Acer platanoides	41.835607014	-87.627956955
492	603	Maple-Norway	Acer platanoides	41.835771466	-87.627972288
493	604	Maple-Red	Acer rubrum	41.835924589	-87.627981817
494	605	Serviceberry	Amelanchier sp.	41.835922334	-87.628055408
495	606	Serviceberry	Amelanchier sp.	41.835952041	-87.628053872
496	607	Maple-Red	Acer rubrum	41.836162714	-87.627996655
497	608	Hawthorn	Crataegus sp.	41.836337022	-87.62824008
498	609	Hawthorn	Crataegus sp.	41.836344333	-87.628309687
499	610	Hawthorn	Crataegus sp.	41.836344234	-87.628374295
500	611	Hawthorn	Crataegus sp.	41.836337703	-87.628485805
501	612	Hawthorn	Crataegus sp.	41.836338562	-87.628536742
502	615	Maple-Norway	Acer platanoides	41.835653426	-87.628803253
503	616	Linden-American	Tilia americana	41.835365441	-87.628777752
504	617	Linden-American	Tilia americana	41.835329977	-87.628705221
505	618	Linden-American	Tilia americana	41.835252629	-87.628720443
506	619	Linden-American	Tilia americana	41.835160844	-87.628695788
507	620	Linden-American	Tilia americana	41.83517392	-87.628808006
508	621	Linden-American	Tilia americana	41.83509094	-87.628806252
509	622	Linden-American	Tilia americana	41.835096881	-87.628704663
510	623	Linden-American	Tilia americana	41.834999072	-87.628777142
511	624	Linden-American	Tilia americana	41.834919535	-87.628781597
512	625	Linden-American	Tilia americana	41.834833734	-87.628784606
513	626	Linden-American	Tilia americana	41.834756037	-87.628799524
514	627	Linden-American	Tilia americana	41.834926932	-87.628698997
515	628	Linden-American	Tilia americana	41.834829987	-87.628689294
516	629	Linden-American	Tilia americana	41.834741259	-87.628702068
517	631	Redbud-Eastern	Cercis canadensis	41.834718104	-87.628114549
518	632	Linden-Littleleaf	Tilia cordata	41.834720807	-87.628177903
519	633	Linden-Littleleaf	Tilia cordata	41.834720393	-87.628266295
520	634	Linden-Littleleaf	Tilia cordata	41.834707445	-87.628440499
521	635	Maple-Sugar	Acer saccharum	41.83470526	-87.628533304
522	636	Linden-Littleleaf	Tilia cordata	41.834703358	-87.628633928
523	637	Ginkgo	Ginkgo biloba	41.834579954	-87.629117249
524	638	Ginkgo	Ginkgo biloba	41.834591668	-87.62906064
525	639	Ginkgo	Ginkgo biloba	41.834692638	-87.629337952
526	640	Ginkgo	Ginkgo biloba	41.834683724	-87.629273212
527	641	Ginkgo	Ginkgo biloba	41.834685866	-87.629092729
528	643	Walnut-Black	Juglans nigra	41.835470809	-87.629050327
529	644	Walnut-Black	Juglans nigra	41.835578123	-87.629054888
530	645	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836436826	-87.629197912
531	646	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836453056	-87.629063331
532	647	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836539709	-87.629051959
533	648	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836638755	-87.629021873
534	650	Cherry-Flowering	Prunus serrulata	41.836898213	-87.62903727
535	651	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836972993	-87.629026198
536	652	Hawthorn	Crataegus sp.	41.837071874	-87.629051916
537	653	Hawthorn	Crataegus sp.	41.837209135	-87.629052786
538	654	Hawthorn	Crataegus sp.	41.83724133	-87.62904858
539	655	Hawthorn	Crataegus sp.	41.837321783	-87.629054573
540	656	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837545029	-87.629067408
541	657	Tuliptree	Liriodendron tulipifera	41.837199154	-87.628766786
542	658	Serviceberry	Amelanchier sp.	41.837193339	-87.628663446
543	659	Tuliptree	Liriodendron tulipifera	41.837078693	-87.628715915
544	660	Serviceberry	Amelanchier sp.	41.837003545	-87.62867
545	661	Hornbeam-American	Carpinus caroliniana	41.837008861	-87.628736093
546	662	Oak-Swamp White	Quercus bicolor	41.836929766	-87.628694928
547	663	Serviceberry	Amelanchier sp.	41.836926922	-87.628737365
548	664	Serviceberry	Amelanchier sp.	41.836896634	-87.628756277
549	665	Serviceberry	Amelanchier sp.	41.836784446	-87.628766648
550	666	Hornbeam-American	Carpinus caroliniana	41.836747069	-87.628760683
551	667	Serviceberry	Amelanchier sp.	41.836711623	-87.628771285
552	668	Serviceberry	Amelanchier sp.	41.83668506	-87.628762931
553	669	Oak-Swamp White	Quercus bicolor	41.836604073	-87.628750491
554	670	Tuliptree	Liriodendron tulipifera	41.836523421	-87.628695058
555	671	Hornbeam-American	Carpinus caroliniana	41.836461685	-87.628665632
556	672	Tuliptree	Liriodendron tulipifera	41.836433732	-87.628730542
557	674	Elm-Siberian	Ulmus pumila	41.837714377	-87.627987136
558	675	Elm-Siberian	Ulmus pumila	41.837647968	-87.628030572
559	676	Elm-Siberian	Ulmus pumila	41.837529681	-87.627975735
560	677	Serviceberry	Amelanchier sp.	41.837490218	-87.627985368
561	678	Serviceberry	Amelanchier sp.	41.83745565	-87.628020464
562	679	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837420063	-87.62800529
563	680	Tree of Heaven	Ailanthus altissima	41.8373726	-87.627990019
564	681	Sweetgum-Common	Liquidambar styraciflua	41.837352698	-87.628106214
565	682	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837413521	-87.628159308
566	683	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837460766	-87.628090677
567	684	Maple-Silver	Acer saccharinum	41.837450093	-87.628251623
568	685	Maple-Silver	Acer saccharinum	41.837476133	-87.628338974
569	686	Hawthorn	Crataegus sp.	41.837326642	-87.628278322
570	687	Sweetgum-Common	Liquidambar styraciflua	41.83737715	-87.628364285
571	688	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837410696	-87.628573464
572	690	Oak-Swamp White	Quercus bicolor	41.837289034	-87.628704463
573	691	Maple-Sugar	Acer saccharum	41.837372494	-87.628759625
574	692	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837497323	-87.628794828
575	693	Tree of Heaven	Ailanthus altissima	41.838001607	-87.628631847
576	694	Mulberry-Red	Morus rubra	41.838032464	-87.628639342
577	695	Mulberry-Red	Morus rubra	41.838026266	-87.628621251
578	696	Mulberry-Red	Morus rubra	41.838080784	-87.628613605
579	697	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838160269	-87.628614374
580	698	Mulberry-Red	Morus rubra	41.838155827	-87.628524939
581	699	Hawthorn	Crataegus sp.	41.838110132	-87.628561911
582	700	Hawthorn	Crataegus sp.	41.838010631	-87.628513399
583	701	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83473428	-87.62754492
584	702	Kentucky Coffeetree	Gymnocladus dioicus	41.83471147	-87.62749798
585	703	Kentucky Coffeetree	Gymnocladus dioicus	41.834726832	-87.627355231
586	704	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834725338	-87.627145722
587	705	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834725597	-87.62697735
588	706	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834729659	-87.62689178
589	707	Hawthorn	Crataegus sp.	41.83486323	-87.62690678
590	710	Hackberry	Celtis occidentalis	41.834982873	-87.626986095
591	712	Maple-Red	Acer rubrum	41.8355465	-87.62686267
592	713	Ash-Green	Fraxinus pennsylvanica	41.83546522	-87.62678827
593	714	Kentucky Coffeetree	Gymnocladus dioicus	41.83551372	-87.62674702
594	715	Ash-Green	Fraxinus pennsylvanica	41.83562855	-87.6268242
595	716	Catalpa-Northern	Catalpa speciosa	41.83572862	-87.62681875
596	717	Ash-Green	Fraxinus pennsylvanica	41.83581852	-87.62682275
597	718	Oak-Shingle	Quercus imbricaria	41.83585107	-87.6267743
598	719	Ash-Green	Fraxinus pennsylvanica	41.835952	-87.62657871
599	720	Hawthorn	Crataegus sp.	41.83593217	-87.62688433
600	721	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83593727	-87.62698827
601	722	Serviceberry	Amelanchier sp.	41.83607638	-87.62696627
602	723	Ginkgo	Ginkgo biloba	41.83609218	-87.62693715
603	724	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83636073	-87.62696597
604	726	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836348949	-87.627491102
605	727	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836347774	-87.627722675
606	728	Maple-Silver	Acer saccharinum	41.836260042	-87.627806603
607	729	Catalpa-Northern	Catalpa speciosa	41.836089125	-87.627785464
608	730	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835952115	-87.627414798
609	731	Walnut-Black	Juglans nigra	41.8358628	-87.62750718
610	732	Hawthorn	Crataegus sp.	41.835580223	-87.627508932
611	734	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835817991	-87.62779327
612	735	Hawthorn	Crataegus sp.	41.83590812	-87.62772625
613	736	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83651019	-87.62727943
614	737	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83655255	-87.62698647
615	738	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83663204	-87.62696825
616	739	Hackberry	Celtis occidentalis	41.83646365	-87.62780712
617	740	Kentucky Coffeetree	Gymnocladus dioicus	41.83656581	-87.62782342
618	741	Kentucky Coffeetree	Gymnocladus dioicus	41.836659848	-87.627762312
619	742	Kentucky Coffeetree	Gymnocladus dioicus	41.836760168	-87.627799249
620	743	Maple-Silver	Acer saccharinum	41.83666884	-87.62755047
621	744	Elm-Siberian	Ulmus pumila	41.836971256	-87.62780548
622	745	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837112304	-87.62775586
623	746	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83714853	-87.62767287
624	747	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83717019	-87.62757295
625	748	Maple-Freeman's	Acer x freemanii	41.83722495	-87.627776666
626	749	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83732255	-87.62753946
627	750	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83761348	-87.62759758
628	751	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83758119	-87.62774056
629	752	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83770666	-87.62776195
630	753	Catalpa-Northern	Catalpa speciosa	41.837731188	-87.627056893
631	754	Kentucky Coffeetree	Gymnocladus dioicus	41.83741439	-87.62688747
632	755	Tuliptree	Liriodendron tulipifera	41.8372607	-87.62690501
633	756	Kentucky Coffeetree	Gymnocladus dioicus	41.837069178	-87.626916029
634	757	Tuliptree	Liriodendron tulipifera	41.83697124	-87.62694432
635	758	Maple-Red	Acer rubrum	41.83677013	-87.62688508
636	759	Hackberry	Celtis occidentalis	41.83670084	-87.62682916
637	760	Hackberry	Celtis occidentalis	41.83671094	-87.62681977
638	761	Ash-Green	Fraxinus pennsylvanica	41.83675587	-87.6268543
639	762	Kentucky Coffeetree	Gymnocladus dioicus	41.83700041	-87.62692639
640	763	Catalpa-Northern	Catalpa speciosa	41.83684648	-87.62684902
641	764	Ginkgo	Ginkgo biloba	41.83693746	-87.62692848
642	765	Plum-Purple Leaf	Prunus cerasifera	41.83704548	-87.62685355
643	766	Elm-American	Ulmus americana	41.83740526	-87.62679756
644	767	Ash-Green	Fraxinus pennsylvanica	41.83747433	-87.62688346
645	768	Ash-Green	Fraxinus pennsylvanica	41.83760697	-87.62686366
646	769	Ash-Green	Fraxinus pennsylvanica	41.83775398	-87.62688515
647	770	Ash-Green	Fraxinus pennsylvanica	41.83780203	-87.62685647
648	771	Catalpa-Northern	Catalpa speciosa	41.83783283	-87.62688616
649	772	Catalpa-Northern	Catalpa speciosa	41.83791101	-87.62690171
650	773	Oak-Shingle	Quercus imbricaria	41.837979086	-87.626824551
651	774	Ash-Green	Fraxinus pennsylvanica	41.838024993	-87.626849539
652	775	Ash-Green	Fraxinus pennsylvanica	41.83814018	-87.626854809
653	776	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838176132	-87.626977836
654	777	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83818117	-87.62725548
655	778	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8381921	-87.62740475
656	779	Hornbeam-American	Carpinus caroliniana	41.838122797	-87.62778436
657	780	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83849242	-87.62802643
658	781	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83862068	-87.62805705
659	782	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83871163	-87.62804963
660	783	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83876942	-87.62805603
661	784	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83879715	-87.6280553
662	785	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83885898	-87.62806703
663	786	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83886993	-87.62799217
664	787	Maple-Silver	Acer saccharinum	41.838926	-87.62787213
665	788	Hawthorn	Crataegus sp.	41.83894802	-87.62781155
666	789	Hawthorn	Crataegus sp.	41.83894727	-87.62779613
667	790	Maple-Silver	Acer saccharinum	41.83911912	-87.627915
668	791	Maple-Silver	Acer saccharinum	41.839137	-87.62797322
669	792	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83908742	-87.62798733
670	793	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83904268	-87.62799833
671	794	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8390272	-87.62797415
672	795	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8390187	-87.62800238
673	796	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83898337	-87.6280072
674	797	Sycamore-American	Platanus occidentalis	41.83932922	-87.62756625
675	798	Walnut-Black	Juglans nigra	41.83926697	-87.6275403
676	799	Walnut-Black	Juglans nigra	41.83918333	-87.62754322
677	800	Walnut-Black	Juglans nigra	41.83918658	-87.62748042
678	801	Kentucky Coffeetree	Gymnocladus dioicus	41.837445844	-87.627844958
679	802	Hawthorn	Crataegus sp.	41.837510045	-87.627733807
680	804	Hackberry	Celtis occidentalis	41.837418109	-87.62758007
681	805	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83710833	-87.626797478
682	806	Catalpa	Catalpa sp.	41.837221367	-87.626834146
683	807	Catalpa	Catalpa sp.	41.837241086	-87.626801922
684	808	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837346082	-87.626827321
685	809	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837415134	-87.626823657
686	810	Oak-Bur	Quercus macrocarpa	41.837530205	-87.626820415
687	811	Ash-White	Fraxinus americana	41.838219945	-87.627119259
688	813	Ash-White	Fraxinus americana	41.838217787	-87.627570613
689	814	Ash-White	Fraxinus americana	41.838221189	-87.627765829
690	815	Tuliptree	Liriodendron tulipifera	41.838379478	-87.629371704
691	816	Tuliptree	Liriodendron tulipifera	41.838362224	-87.629267281
692	817	Tuliptree	Liriodendron tulipifera	41.838366926	-87.62917075
693	818	Tuliptree	Liriodendron tulipifera	41.838369262	-87.629059977
694	819	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838518946	-87.627856361
695	820	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838413205	-87.627787603
696	821	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838457578	-87.627680125
697	822	Ash-White	Fraxinus americana	41.838406829	-87.627523712
698	823	Hawthorn	Crataegus sp.	41.838508518	-87.627592366
699	824	Euonymus-BurningBush	Euonymus alatus	41.838557824	-87.627523241
700	825	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838540876	-87.627460861
701	826	Hawthorn	Crataegus sp.	41.838545109	-87.627332601
702	827	Hawthorn	Crataegus sp.	41.838537472	-87.627277514
703	828	Hackberry	Celtis occidentalis	41.838513623	-87.627232682
704	830	Ash-White	Fraxinus americana	41.838429468	-87.627168076
705	831	Hackberry	Celtis occidentalis	41.838401327	-87.62709156
706	832	Ash-White	Fraxinus americana	41.838442019	-87.626938621
707	833	Hawthorn	Crataegus sp.	41.838565554	-87.627097964
708	834	Hawthorn	Crataegus sp.	41.838571831	-87.627066544
709	835	Walnut-Black	Juglans nigra	41.83917103	-87.62739883
710	836	Hackberry	Celtis occidentalis	41.83936472	-87.6272729
711	837	Redbud-Eastern	Cercis canadensis	41.83936702	-87.62723202
712	838	Walnut-Black	Juglans nigra	41.83920928	-87.62723188
713	839	Walnut-Black	Juglans nigra	41.83918633	-87.62719588
714	840	Walnut-Black	Juglans nigra	41.83916688	-87.62710723
715	841	Hawthorn	Crataegus sp.	41.838549139	-87.626985685
716	842	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838677056	-87.626879044
717	843	Catalpa-Northern	Catalpa speciosa	41.838707743	-87.626874864
718	844	Oak-Shingle	Quercus imbricaria	41.838737215	-87.6268451
719	845	Oak-Shingle	Quercus imbricaria	41.839241307	-87.626847841
720	846	Kentucky Coffeetree	Gymnocladus dioicus	41.839261177	-87.626911486
721	847	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839317434	-87.626851587
722	848	Ash-White	Fraxinus americana	41.839473155	-87.626974763
723	849	Ash-White	Fraxinus americana	41.83944897	-87.627023315
724	850	Mulberry-White	Morus alba	41.839486894	-87.627544031
725	851	Mulberry-White	Morus alba	41.83947413	-87.627557926
726	852	Maple-Silver	Acer saccharinum	41.839488346	-87.627669559
727	853	Mulberry-White	Morus alba	41.839468851	-87.627693658
728	854	Maple-Silver	Acer saccharinum	41.839490787	-87.627790476
729	855	Mulberry-White	Morus alba	41.839477136	-87.627756311
730	856	Elm	Ulmus sp.	41.839433649	-87.62776851
731	857	Elm	Ulmus sp.	41.839431322	-87.627834291
732	858	Honeylocust-Common	Gleditsia triacanthos	41.839467383	-87.627860452
733	859	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839488958	-87.627888349
734	860	Maple-Silver	Acer saccharinum	41.839473119	-87.628005134
735	861	Mulberry-White	Morus alba	41.839452817	-87.628239593
736	862	Ash-White	Fraxinus americana	41.838032193	-87.626493517
737	863	Oak-Bur	Quercus macrocarpa	41.83795742	-87.626532754
738	864	Ash-White	Fraxinus americana	41.837926888	-87.626485744
739	865	Ash-White	Fraxinus americana	41.83783821	-87.626484609
740	866	Elm	Ulmus sp.	41.837775568	-87.626480818
741	867	Ash-White	Fraxinus americana	41.837718581	-87.626483167
742	868	Oak-Shingle	Quercus imbricaria	41.837489371	-87.626522735
743	869	Oak-Bur	Quercus macrocarpa	41.837449953	-87.626471575
744	870	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837417557	-87.626511228
745	871	Oak-Shingle	Quercus imbricaria	41.83730904	-87.626472453
746	872	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837255612	-87.626467388
747	873	Catalpa-Northern	Catalpa speciosa	41.837207534	-87.626454637
748	874	Catalpa-Northern	Catalpa speciosa	41.837076689	-87.626513091
749	875	Catalpa-Northern	Catalpa speciosa	41.836889082	-87.626503837
750	876	Oak-Shingle	Quercus imbricaria	41.83669882	-87.626448376
751	877	Oak-Shingle	Quercus imbricaria	41.836357895	-87.626335995
752	878	Locust-Black	Robinia pseudoacacia	41.835895271	-87.626292382
753	880	Locust-Black	Robinia pseudoacacia	41.835900078	-87.626351246
754	881	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835658101	-87.626338294
755	882	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835603715	-87.626331613
756	883	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835548283	-87.626329295
757	884	Tuliptree	Liriodendron tulipifera	41.835006227	-87.626328597
758	885	Tuliptree	Liriodendron tulipifera	41.835013179	-87.626208487
759	886	Kentucky Coffeetree	Gymnocladus dioicus	41.834941639	-87.626193882
760	887	Kentucky Coffeetree	Gymnocladus dioicus	41.834975205	-87.626274583
761	888	Ash-White	Fraxinus americana	41.834901382	-87.626324852
762	889	Ash-White	Fraxinus americana	41.834858002	-87.626311621
763	890	Tuliptree	Liriodendron tulipifera	41.834887892	-87.626196003
764	891	Catalpa-Northern	Catalpa speciosa	41.834824327	-87.626202627
765	892	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834828194	-87.62615093
766	893	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834785401	-87.626085202
767	894	Hawthorn	Crataegus sp.	41.834545072	-87.626131866
768	895	Hawthorn	Crataegus sp.	41.834551375	-87.626172713
769	896	Hawthorn	Crataegus sp.	41.834547417	-87.626211722
770	897	Hawthorn	Crataegus sp.	41.834542595	-87.626249299
771	898	Hawthorn	Crataegus sp.	41.834537298	-87.626301477
772	899	Common Baldcypress	Taxodium distichum	41.834501887	-87.626163042
773	900	Common Baldcypress	Taxodium distichum	41.834496761	-87.626207195
774	901	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837842041	-87.628311915
775	902	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837954392	-87.628221849
776	903	Crabapple	Malus sp.	41.837907375	-87.628069629
777	904	Elm-American	Ulmus americana	41.838045566	-87.628175479
778	905	Crabapple	Malus sp.	41.838122025	-87.628161713
779	906	Crabapple	Malus sp.	41.838162397	-87.628227929
780	907	Redbud-Eastern	Cercis canadensis	41.838170133	-87.628136684
781	908	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838180237	-87.628017258
782	909	Ash-Green	Fraxinus pennsylvanica	41.838567651	-87.626500021
783	910	Ash-Green	Fraxinus pennsylvanica	41.838662392	-87.626502845
784	911	Ash-Green	Fraxinus pennsylvanica	41.83876625	-87.626505084
785	912	Oak-Shingle	Quercus imbricaria	41.838779321	-87.626551709
786	913	Ash-Green	Fraxinus pennsylvanica	41.838848099	-87.626518655
787	914	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838882082	-87.626545922
788	915	Hackberry	Celtis occidentalis	41.838946348	-87.626558861
789	916	Ash-Green	Fraxinus pennsylvanica	41.838945711	-87.626511068
790	917	Ash-Green	Fraxinus pennsylvanica	41.839053781	-87.626524567
791	918	Oak-Bur	Quercus macrocarpa	41.839091483	-87.626565735
792	919	Ash-Green	Fraxinus pennsylvanica	41.839129297	-87.626556475
793	920	Ash-Green	Fraxinus pennsylvanica	41.83923318	-87.626512207
794	921	Ash-Green	Fraxinus pennsylvanica	41.839312362	-87.626523214
795	922	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839359103	-87.626518864
796	923	Ash-Green	Fraxinus pennsylvanica	41.839726075	-87.626526882
797	924	Ash-Green	Fraxinus pennsylvanica	41.839940897	-87.626530527
798	925	Linden-American	Tilia americana	41.840016263	-87.626535913
799	926	Ash-Green	Fraxinus pennsylvanica	41.840168791	-87.626537289
800	927	Ash-Green	Fraxinus pennsylvanica	41.840269375	-87.626543162
801	928	Ash-Green	Fraxinus pennsylvanica	41.840386909	-87.626514265
802	929	Ash-Green	Fraxinus pennsylvanica	41.840489746	-87.626550169
803	930	Ash-Green	Fraxinus pennsylvanica	41.840599751	-87.626547891
804	931	Ash-Green	Fraxinus pennsylvanica	41.840699145	-87.62655672
805	932	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83963271	-87.626387789
806	933	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839617521	-87.626214579
807	934	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839491262	-87.626398478
808	935	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839490345	-87.62614463
809	936	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839511862	-87.625876625
810	938	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839513363	-87.625600101
811	939	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839496816	-87.625420147
812	940	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839492405	-87.625261997
813	941	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839626507	-87.625120142
814	942	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839702086	-87.625096125
815	943	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839813249	-87.625068715
816	944	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839907621	-87.625094395
817	945	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840041443	-87.62509666
818	946	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840148255	-87.625115379
819	947	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840256434	-87.625090749
820	948	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840363316	-87.625101097
821	949	Hackberry	Celtis occidentalis	41.840457226	-87.625112525
822	950	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840595631	-87.625113687
823	951	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840696414	-87.625082067
824	952	Hawthorn	Crataegus sp.	41.839164	-87.625832459
825	953	Hawthorn	Crataegus sp.	41.838865567	-87.625840142
826	954	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83855962	-87.625838145
827	955	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838494272	-87.625830688
828	956	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838443404	-87.62584349
829	957	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838414365	-87.625786718
830	958	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838450239	-87.625681199
831	959	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838548826	-87.625727928
832	960	Hornbeam-American	Carpinus caroliniana	41.838495778	-87.625572927
833	961	Hornbeam-American	Carpinus caroliniana	41.838473339	-87.625454383
834	962	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838435135	-87.625321124
835	963	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838460173	-87.625248081
836	964	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838564001	-87.625266473
837	965	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838565519	-87.625230881
838	966	Crabapple	Malus sp.	41.83887567	-87.625331331
839	967	Crabapple	Malus sp.	41.839154485	-87.62532643
840	968	Crabapple	Malus sp.	41.839142994	-87.625340764
841	969	Tuliptree	Liriodendron tulipifera	41.839217786	-87.625277312
842	970	Tuliptree	Liriodendron tulipifera	41.839337005	-87.625295478
843	971	Maple-Silver	Acer saccharinum	41.839457485	-87.625586614
844	972	Maple-Silver	Acer saccharinum	41.839441543	-87.625510142
845	973	Maple-Silver	Acer saccharinum	41.839465355	-87.6253926
846	974	Hackberry	Celtis occidentalis	41.839638627	-87.62494794
847	975	Hackberry	Celtis occidentalis	41.839716307	-87.624852926
848	976	Hackberry	Celtis occidentalis	41.839616522	-87.623700425
849	977	Hackberry	Celtis occidentalis	41.839667511	-87.62380191
850	978	Tuliptree	Liriodendron tulipifera	41.8384832	-87.624983997
851	979	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838454508	-87.624865513
852	980	Redbud-Eastern	Cercis canadensis	41.838476404	-87.624757551
853	981	Hornbeam-American	Carpinus caroliniana	41.838499751	-87.624593674
854	982	Hawthorn	Crataegus sp.	41.838457192	-87.624532016
855	983	Hornbeam-American	Carpinus caroliniana	41.838469997	-87.624391923
856	984	Redbud-Eastern	Cercis canadensis	41.838459095	-87.624175639
857	986	Hawthorn	Crataegus sp.	41.838472072	-87.624026388
858	987	Redbud-Eastern	Cercis canadensis	41.838472685	-87.623931493
859	988	Hawthorn	Crataegus sp.	41.838499277	-87.623870894
860	989	Catalpa-Northern	Catalpa speciosa	41.838458519	-87.623810153
861	990	Catalpa-Northern	Catalpa speciosa	41.838498225	-87.623757849
862	991	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838474647	-87.623655977
863	992	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840078604	-87.623592597
864	993	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839985869	-87.623607871
865	994	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83987074	-87.623585529
866	995	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839775286	-87.623589488
867	996	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839366842	-87.623572931
868	997	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839251602	-87.623581416
869	998	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839153952	-87.623575159
870	999	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839017222	-87.623575704
871	1000	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838838292	-87.623557815
872	1001	Ash-Green	Fraxinus pennsylvanica	41.83858648	-87.62690338
873	1002	Ash-Green	Fraxinus pennsylvanica	41.83897983	-87.62690392
874	1003	Ash-Green	Fraxinus pennsylvanica	41.8390727	-87.62691277
875	1004	Ash-Green	Fraxinus pennsylvanica	41.83919797	-87.6269041
876	1005	Ash-Green	Fraxinus pennsylvanica	41.83938532	-87.62688035
877	1006	Ash-Green	Fraxinus pennsylvanica	41.83945285	-87.62698118
878	1007	Elm-Siberian	Ulmus pumila	41.83944478	-87.62704922
879	1008	Elm-Siberian	Ulmus pumila	41.83945822	-87.62717017
880	1009	Elm-Siberian	Ulmus pumila	41.83945592	-87.6272413
881	1010	Elm-Siberian	Ulmus pumila	41.83946075	-87.62729325
882	1011	Elm-Siberian	Ulmus pumila	41.83941828	-87.62744215
883	1012	Mulberry-White	Morus alba	41.83947955	-87.62756823
884	1013	Maple-Silver	Acer saccharinum	41.8394292	-87.6280113
885	1014	Elm-Siberian	Ulmus pumila	41.8394531	-87.6280549
886	1015	Elm-Siberian	Ulmus pumila	41.83945072	-87.62825188
887	1016	Elm-Siberian	Ulmus pumila	41.8394514	-87.62880082
888	1017	Elm-Siberian	Ulmus pumila	41.83943447	-87.62867107
889	1018	Elm-Siberian	Ulmus pumila	41.83944388	-87.62856288
890	1019	Hackberry	Celtis occidentalis	41.83948757	-87.62853112
891	1020	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83948332	-87.62852332
892	1021	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83950067	-87.62841942
893	1022	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83948492	-87.6283977
894	1023	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83945282	-87.62836697
895	1024	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83946857	-87.62832867
896	1025	Elm-Siberian	Ulmus pumila	41.83756892	-87.62649245
897	1026	Elm-Siberian	Ulmus pumila	41.83751385	-87.6264955
898	1027	Ash-Green	Fraxinus pennsylvanica	41.83740102	-87.62648567
899	1028	Ash-Green	Fraxinus pennsylvanica	41.83718478	-87.62648988
900	1029	Ash-Green	Fraxinus pennsylvanica	41.83708442	-87.62645668
901	1030	Ash-Green	Fraxinus pennsylvanica	41.83696402	-87.62647417
902	1031	Ash-Green	Fraxinus pennsylvanica	41.8368582	-87.62646327
903	1032	Ash-Green	Fraxinus pennsylvanica	41.83674542	-87.6264608
904	1033	Ash-Green	Fraxinus pennsylvanica	41.83665578	-87.62645777
905	1034	Ash-Green	Fraxinus pennsylvanica	41.83654448	-87.62646655
906	1035	Oak-Swamp White	Quercus bicolor	41.83655938	-87.6265146
907	1036	Hackberry	Celtis occidentalis	41.83657482	-87.6264636
908	1037	Hackberry	Celtis occidentalis	41.83665322	-87.6265185
909	1038	Ash-Green	Fraxinus pennsylvanica	41.83633157	-87.62644255
910	1039	Ash-Green	Fraxinus pennsylvanica	41.83625715	-87.62642592
911	1040	Ash-Green	Fraxinus pennsylvanica	41.8362058	-87.62643593
912	1041	Ash-Green	Fraxinus pennsylvanica	41.836124	-87.6264704
913	1042	Ash-Green	Fraxinus pennsylvanica	41.83611618	-87.62644217
914	1043	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83585325	-87.62644198
915	1044	Ash-Green	Fraxinus pennsylvanica	41.835706877	-87.626401634
916	1045	Ash-Green	Fraxinus pennsylvanica	41.83560495	-87.62642735
917	1046	Locust-Black	Robinia pseudoacacia	41.83556175	-87.626449
918	1047	Ash-Green	Fraxinus pennsylvanica	41.8354286	-87.62645268
919	1048	Ash-Green	Fraxinus pennsylvanica	41.83531963	-87.62643405
920	1050	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8351067	-87.6264225
921	1053	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83490463	-87.62642213
922	1055	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834600738	-87.626087731
923	1056	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83452232	-87.62640605
924	1057	Hackberry	Celtis occidentalis	41.834474825	-87.626403124
925	1058	Oak-Northern Red	Quercus rubra	41.834427772	-87.626395656
926	1059	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834330992	-87.626436864
927	1060	Ash-Green	Fraxinus pennsylvanica	41.83428395	-87.62641172
928	1061	Ash-Green	Fraxinus pennsylvanica	41.834176659	-87.62639099
929	1062	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83411533	-87.6264154
930	1063	Ash-Green	Fraxinus pennsylvanica	41.834063467	-87.626389975
931	1064	Catalpa-Northern	Catalpa speciosa	41.83397467	-87.6263939
932	1065	Oak-Bur	Quercus macrocarpa	41.83393673	-87.62639442
933	1066	Catalpa-Northern	Catalpa speciosa	41.83385488	-87.62638072
934	1067	Catalpa-Northern	Catalpa speciosa	41.83379033	-87.62636788
935	1068	Elm-Slippery	Ulmus rubra	41.8337511	-87.62639872
936	1069	Elm-American	Ulmus americana	41.83364068	-87.6264243
937	1070	Ash-Green	Fraxinus pennsylvanica	41.83357457	-87.62638243
938	1071	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8334626	-87.62637817
939	1072	Oak-Bur	Quercus macrocarpa	41.833409047	-87.626418782
940	1073	Ash-Green	Fraxinus pennsylvanica	41.833354295	-87.626382574
941	1074	Hackberry	Celtis occidentalis	41.83329958	-87.626388
942	1075	Kentucky Coffeetree	Gymnocladus dioicus	41.83322056	-87.626398564
943	1076	Elm-American	Ulmus americana	41.833153794	-87.626383106
944	1077	Ash-Green	Fraxinus pennsylvanica	41.833242475	-87.626413782
945	1078	Ash-Green	Fraxinus pennsylvanica	41.832961105	-87.626363651
946	1079	Oak-Bur	Quercus macrocarpa	41.832887559	-87.626383131
947	1080	Ash-Green	Fraxinus pennsylvanica	41.832740813	-87.626359731
948	1081	Ash-Green	Fraxinus pennsylvanica	41.83265188	-87.62637863
949	1082	Ash-Green	Fraxinus pennsylvanica	41.8325661	-87.62638555
950	1083	Ash-Green	Fraxinus pennsylvanica	41.83251003	-87.62641462
951	1084	Ash-Green	Fraxinus pennsylvanica	41.83246405	-87.6263732
952	1085	Oak-Bur	Quercus macrocarpa	41.832407776	-87.626379793
953	1086	Ash-Green	Fraxinus pennsylvanica	41.83234443	-87.62635935
954	1087	Ash-Green	Fraxinus pennsylvanica	41.832248421	-87.626349699
955	1088	Oak-Bur	Quercus macrocarpa	41.83221325	-87.62641132
956	1089	Catalpa-Northern	Catalpa speciosa	41.83214005	-87.62638022
957	1090	Ash-Green	Fraxinus pennsylvanica	41.832187671	-87.6263388
958	1091	Ash-Green	Fraxinus pennsylvanica	41.8320809	-87.62634533
959	1092	Ash-Green	Fraxinus pennsylvanica	41.832048464	-87.626400094
960	1093	Ash-Green	Fraxinus pennsylvanica	41.832046412	-87.626346891
961	1094	Ash-Green	Fraxinus pennsylvanica	41.8319628	-87.62636508
962	1095	Kentucky Coffeetree	Gymnocladus dioicus	41.83193678	-87.62640612
963	1096	Ash-Green	Fraxinus pennsylvanica	41.831838274	-87.626346074
964	1097	Ash-Green	Fraxinus pennsylvanica	41.831748162	-87.6263492
965	1098	Catalpa-Northern	Catalpa speciosa	41.83169272	-87.62632992
966	1099	Ash-Green	Fraxinus pennsylvanica	41.83163515	-87.62632957
967	1100	Ash-Green	Fraxinus pennsylvanica	41.831556468	-87.626358943
968	1101	Common Baldcypress	Taxodium distichum	41.834501275	-87.626257186
969	1102	Common Baldcypress	Taxodium distichum	41.834487217	-87.626302773
970	1103	Birch-Gray	Betula populifolia	41.834216843	-87.626282344
971	1104	Birch-Gray	Betula populifolia	41.83421659	-87.626160839
972	1105	Birch-Gray	Betula populifolia	41.834291429	-87.626156301
973	1106	Birch-Gray	Betula populifolia	41.834293144	-87.626268605
974	1107	Elm	Ulmus sp.	41.833965231	-87.626321922
975	1108	Redbud-Eastern	Cercis canadensis	41.833963042	-87.626255809
976	1109	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833960758	-87.626132065
977	1110	Redbud-Eastern	Cercis canadensis	41.833964896	-87.626085328
978	1111	Elm	Ulmus sp.	41.834003625	-87.626071136
979	1112	Ash-White	Fraxinus americana	41.834022335	-87.626087623
980	1113	Redbud-Eastern	Cercis canadensis	41.834028011	-87.626118311
981	1114	Redbud-Eastern	Cercis canadensis	41.834028957	-87.626258153
982	1115	Elm	Ulmus sp.	41.834031166	-87.626165762
983	1116	Birch-Gray	Betula populifolia	41.833696521	-87.626268934
984	1117	Birch-Gray	Betula populifolia	41.833701003	-87.626152951
985	1118	Birch-Gray	Betula populifolia	41.833759682	-87.626145673
986	1119	Birch-Gray	Betula populifolia	41.833759679	-87.626270587
987	1120	Redbud-Eastern	Cercis canadensis	41.833435244	-87.626280089
988	1121	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833430026	-87.626209476
989	1122	Elm	Ulmus sp.	41.833423406	-87.626106146
990	1123	Redbud-Eastern	Cercis canadensis	41.8334405	-87.626063318
991	1124	Ash-White	Fraxinus americana	41.833480297	-87.626062224
992	1125	Elm	Ulmus sp.	41.833512478	-87.626075542
993	1126	Redbud-Eastern	Cercis canadensis	41.833514061	-87.626111946
994	1127	Oak-Bur	Quercus macrocarpa	41.833533835	-87.626140359
995	1128	Redbud-Eastern	Cercis canadensis	41.833508179	-87.626236304
996	1129	Elm	Ulmus sp.	41.833476982	-87.626299234
997	1130	Birch-Gray	Betula populifolia	41.833168349	-87.626184504
998	1131	Birch-Gray	Betula populifolia	41.833169298	-87.626119606
999	1132	Birch-Gray	Betula populifolia	41.833238892	-87.626192063
1000	1133	Birch-Gray	Betula populifolia	41.833240434	-87.626113069
1001	1134	Red Horsechestnut	Aesculus x carnea	41.832966926	-87.626240714
1002	1135	Dogwood-Flowering	Cornus florida	41.832957792	-87.626182024
1003	1136	Dogwood-Flowering	Cornus florida	41.83295401	-87.626130895
1004	1137	Kentucky Coffeetree	Gymnocladus dioicus	41.832964297	-87.626086758
1005	1138	Elm-American	Ulmus americana	41.833361473	-87.625819636
1006	1139	Elm-American	Ulmus americana	41.833394384	-87.625852479
1007	1140	Elm-American	Ulmus americana	41.833556924	-87.625854413
1008	1141	Hornbeam-European	Carpinus betulus	41.833555124	-87.625842506
1009	1142	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833750618	-87.625782699
1010	1143	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833743999	-87.62563042
1011	1144	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833780617	-87.625576551
1012	1145	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833793799	-87.625813311
1013	1146	Elm-American	Ulmus americana	41.83382244	-87.625827577
1014	1147	Elm-American	Ulmus americana	41.833910424	-87.625826287
1015	1148	Redbud-Eastern	Cercis canadensis	41.833922885	-87.625854324
1016	1149	Elm-American	Ulmus americana	41.8339486	-87.625842716
1017	1150	Elm-American	Ulmus americana	41.833983214	-87.625845676
1018	1151	Ash-Green	Fraxinus pennsylvanica	41.83150235	-87.62641958
1019	1152	Oak-Bur	Quercus macrocarpa	41.83148302	-87.62635948
1020	1153	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83144922	-87.626319717
1021	1154	Ash-Green	Fraxinus pennsylvanica	41.83141765	-87.62637878
1022	1155	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8313883	-87.62632967
1023	1156	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831347993	-87.626321957
1024	1157	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83136614	-87.62638902
1025	1158	Ash-Green	Fraxinus pennsylvanica	41.83133541	-87.6263696
1026	1159	Hackberry	Celtis occidentalis	41.83129606	-87.62634956
1027	1160	Oak-Swamp White	Quercus bicolor	41.83128092	-87.6264178
1028	1161	Oak-Swamp White	Quercus bicolor	41.8312555	-87.62634398
1029	1162	Oak-Swamp White	Quercus bicolor	41.83123295	-87.62641308
1030	1163	Hackberry	Celtis occidentalis	41.83119499	-87.62639685
1031	1164	Ginkgo	Ginkgo biloba	41.831167557	-87.626209226
1032	1165	Ginkgo	Ginkgo biloba	41.83115479	-87.626128699
1033	1166	Ginkgo	Ginkgo biloba	41.83112594	-87.62601937
1034	1167	Elm-American	Ulmus americana	41.833998658	-87.625806925
1035	1168	Catalpa-Northern	Catalpa speciosa	41.834547945	-87.625480782
1036	1169	Ash-White	Fraxinus americana	41.834783965	-87.625733049
1037	1170	Kentucky Coffeetree	Gymnocladus dioicus	41.834838637	-87.625720884
1038	1171	Oak-Northern Red	Quercus rubra	41.834955775	-87.625737565
1039	1172	Kentucky Coffeetree	Gymnocladus dioicus	41.834877338	-87.625671097
1040	1173	Elm-American	Ulmus americana	41.834837228	-87.625609236
1041	1174	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834738967	-87.625378977
1042	1175	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834743139	-87.625293007
1043	1176	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834856277	-87.625138089
1044	1177	Kentucky Coffeetree	Gymnocladus dioicus	41.834910011	-87.625131592
1045	1178	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834975324	-87.625149702
1046	1179	Oak-Northern Red	Quercus rubra	41.835046455	-87.625139405
1047	1180	Kentucky Coffeetree	Gymnocladus dioicus	41.835109718	-87.625166415
1048	1181	Oak-Northern Red	Quercus rubra	41.835168502	-87.625152931
1049	1182	Spruce-Colorado Blue	Picea pungens	41.833128864	-87.624656218
1050	1183	Maple-Freeman's	Acer x freemanii	41.833159216	-87.624127093
1051	1184	Hawthorn	Crataegus sp.	41.833141004	-87.623968193
1052	1185	Hawthorn	Crataegus sp.	41.833170289	-87.623939173
1053	1186	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833178596	-87.623744822
1054	1187	Hawthorn	Crataegus sp.	41.833239856	-87.624017843
1055	1188	Hawthorn	Crataegus sp.	41.833239396	-87.624091679
1056	1189	Hawthorn	Crataegus sp.	41.833255193	-87.624122036
1057	1190	Walnut-Black	Juglans nigra	41.833250719	-87.624305572
1058	1191	Hawthorn	Crataegus sp.	41.83324411	-87.624384328
1059	1192	Hawthorn	Crataegus sp.	41.833286323	-87.624355813
1060	1193	Oak-Swamp White	Quercus bicolor	41.833286832	-87.624265882
1061	1194	Redbud-Eastern	Cercis canadensis	41.833285255	-87.62417367
1062	1195	Hawthorn	Crataegus sp.	41.833281777	-87.624106809
1063	1196	Hawthorn	Crataegus sp.	41.833257825	-87.624032194
1064	1197	Hawthorn	Crataegus sp.	41.833293939	-87.62400015
1065	1198	Hawthorn	Crataegus sp.	41.833349615	-87.623987879
1066	1200	Hawthorn	Crataegus sp.	41.83331465	-87.624056465
1067	1201	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83872656	-87.623562919
1068	1202	Elm-Siberian	Ulmus pumila	41.838204991	-87.625235889
1069	1204	Hawthorn	Crataegus sp.	41.838189742	-87.624986041
1070	1209	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83813878	-87.624823058
1071	1210	Hophornbeam- American	Ostrya virginiana	41.838157662	-87.624735052
1072	1211	Hophornbeam- American	Ostrya virginiana	41.838184766	-87.624709719
1073	1212	Hophornbeam- American	Ostrya virginiana	41.838190758	-87.62463696
1074	1213	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838215743	-87.624663192
1075	1214	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838124674	-87.624595484
1076	1215	Hawthorn	Crataegus sp.	41.838206807	-87.624541397
1077	1216	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838211511	-87.624486659
1078	1217	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835449102	-87.62714562
1079	1218	Redbud-Eastern	Cercis canadensis	41.836702987	-87.628217826
1080	1219	Serviceberry	Amelanchier sp.	41.83670243	-87.628190807
1081	1220	Serviceberry	Amelanchier sp.	41.836756965	-87.628214556
1082	1221	Hornbeam-American	Carpinus caroliniana	41.836764476	-87.628198304
1083	1222	Hornbeam-American	Carpinus caroliniana	41.837047127	-87.628382728
1084	1223	Redbud-Eastern	Cercis canadensis	41.837004866	-87.628364353
1085	1224	Serviceberry	Amelanchier sp.	41.837018588	-87.628415905
1086	1225	Maple-Amur	Acer ginnala	41.835910186	-87.625775671
1087	1226	Pine-Eastern White	Pinus strobus	41.835504582	-87.625515382
1088	1227	Maple-Freeman's	Acer x freemanii	41.835502743	-87.624097438
1089	1228	Elm-Siberian	Ulmus pumila	41.83560106	-87.624046093
1090	1229	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835604942	-87.623923978
1091	1230	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835640008	-87.623790806
1092	1231	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835525175	-87.623670478
1093	1232	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835529337	-87.623652935
1094	1233	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835446156	-87.623802824
1095	1234	Arborvitae-Eastern	Thuja occidentalis	41.83528827	-87.623576326
1096	1235	Arborvitae-Eastern	Thuja occidentalis	41.83528235	-87.623562013
1097	1236	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83510011	-87.623926035
1098	1237	Maple-Silver	Acer saccharinum	41.834847539	-87.623622173
1099	1238	Maple-Silver	Acer saccharinum	41.834820277	-87.623702714
1100	1239	Hawthorn	Crataegus sp.	41.834857121	-87.623831696
1101	1240	Hawthorn	Crataegus sp.	41.834872993	-87.623844143
1102	1241	Hawthorn	Crataegus sp.	41.834902213	-87.623897849
1103	1242	Hawthorn	Crataegus sp.	41.834826958	-87.623915357
1104	1243	Maple-Silver	Acer saccharinum	41.834802227	-87.624075649
1105	1244	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835917975	-87.623696713
1106	1245	Elm-American	Ulmus americana	41.838189986	-87.624371772
1107	1246	Serviceberry	Amelanchier sp.	41.83814121	-87.624275244
1108	1247	Kentucky Coffeetree	Gymnocladus dioicus	41.838209713	-87.624237331
1109	1248	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838204734	-87.624154688
1110	1249	Hawthorn	Crataegus sp.	41.838208279	-87.624062075
1111	1250	Elm-American	Ulmus americana	41.838140297	-87.624084862
1112	1251	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838185266	-87.623956793
1113	1252	Kentucky Coffeetree	Gymnocladus dioicus	41.838219248	-87.623902598
1114	1253	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838140617	-87.623858031
1115	1254	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838101895	-87.623871321
1116	1255	Hackberry	Celtis occidentalis	41.838029152	-87.623835684
1117	1256	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838066918	-87.623695359
1118	1257	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838043868	-87.623628339
1119	1258	Hackberry	Celtis occidentalis	41.837973748	-87.623772709
1120	1260	Elm-American	Ulmus americana	41.837867146	-87.623827412
1121	1261	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837911062	-87.623750115
1122	1262	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837953939	-87.623711487
1123	1263	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8379486	-87.623628651
1124	1264	Hawthorn	Crataegus sp.	41.837905477	-87.62363933
1125	1265	Hawthorn	Crataegus sp.	41.837841876	-87.623663521
1126	1266	Hawthorn	Crataegus sp.	41.837783065	-87.623772803
1127	1267	Elm-American	Ulmus americana	41.837751794	-87.623687896
1128	1268	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83773618	-87.623824415
1129	1269	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837721981	-87.623612524
1130	1271	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837655876	-87.623721449
1131	1272	Serviceberry	Amelanchier sp.	41.837689763	-87.623823643
1132	1273	Redbud-Eastern	Cercis canadensis	41.837713749	-87.624150363
1133	1274	Walnut-Black	Juglans nigra	41.837800377	-87.624193252
1134	1275	Hawthorn	Crataegus sp.	41.837838471	-87.624194313
1135	1276	Hawthorn	Crataegus sp.	41.837865761	-87.624181223
1136	1277	Hawthorn	Crataegus sp.	41.837937087	-87.624166015
1137	1278	Hackberry	Celtis occidentalis	41.837999045	-87.624083912
1138	1279	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838027408	-87.624167759
1139	1281	Redbud-Eastern	Cercis canadensis	41.837984887	-87.624210174
1140	1282	Redbud-Eastern	Cercis canadensis	41.838016692	-87.624249742
1141	1283	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838030453	-87.624311662
1142	1284	Redbud-Eastern	Cercis canadensis	41.837977362	-87.624330397
1143	1285	Redbud-Eastern	Cercis canadensis	41.838008296	-87.624360004
1144	1286	Redbud-Eastern	Cercis canadensis	41.837988499	-87.624403194
1145	1287	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838039181	-87.624439308
1146	1288	Kentucky Coffeetree	Gymnocladus dioicus	41.83802922	-87.624545487
1147	1289	Hawthorn	Crataegus sp.	41.83795254	-87.624445368
1148	1290	Dogwood-Pagoda	Cornus alternifolia	41.837825304	-87.624394942
1149	1291	Redbud-Eastern	Cercis canadensis	41.837765846	-87.624383873
1150	1292	Redbud-Eastern	Cercis canadensis	41.837723188	-87.624223281
1151	1293	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837705196	-87.62428044
1152	1294	Redbud-Eastern	Cercis canadensis	41.837703752	-87.624370762
1153	1295	Hawthorn	Crataegus sp.	41.837782293	-87.624509662
1154	1296	Redbud-Eastern	Cercis canadensis	41.837705177	-87.624512812
1155	1297	Redbud-Eastern	Cercis canadensis	41.837709347	-87.624579746
1156	1298	Redbud-Eastern	Cercis canadensis	41.837744457	-87.624583726
1157	1299	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837764724	-87.624768921
1158	1300	Redbud-Eastern	Cercis canadensis	41.83770912	-87.624780248
1159	1301	Catalpa-Northern	Catalpa speciosa	41.832904447	-87.625171973
1160	1302	Cherry-Black	Prunus serotina	41.83305586	-87.62513126
1161	1303	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83320333	-87.62512082
1162	1304	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83322666	-87.62512111
1163	1305	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83349504	-87.62512633
1164	1306	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83355605	-87.62511736
1165	1307	Cherry-Black	Prunus serotina	41.83360754	-87.62516116
1166	1308	Hawthorn	Crataegus sp.	41.83370292	-87.62515176
1167	1309	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83370511	-87.62516569
1168	1310	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83372554	-87.62539577
1169	1311	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83374964	-87.62535167
1170	1312	Cherry-Black	Prunus serotina	41.833947397	-87.62513299
1171	1313	Hawthorn	Crataegus sp.	41.83413733	-87.62511195
1172	1314	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834212	-87.625138
1173	1315	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83443344	-87.62514457
1174	1316	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83444387	-87.62519651
1175	1317	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83452507	-87.62519965
1176	1318	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83459753	-87.62521329
1177	1320	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834602944	-87.625786099
1178	1321	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83477697	-87.62552277
1179	1322	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83295635	-87.6244591
1180	1323	Hawthorn	Crataegus sp.	41.8329869	-87.62487317
1181	1324	Hawthorn	Crataegus sp.	41.83302657	-87.62496142
1182	1325	Elm-Siberian	Ulmus pumila	41.83307703	-87.62491862
1183	1326	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83312712	-87.6249807
1184	1327	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83318127	-87.62489723
1185	1328	Hawthorn	Crataegus sp.	41.83310658	-87.62480875
1186	1329	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83327398	-87.6248764
1187	1330	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83328823	-87.62498788
1188	1331	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83335257	-87.62494563
1189	1332	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83338122	-87.62498888
1190	1333	Elm-Siberian	Ulmus pumila	41.83341878	-87.62489265
1191	1334	Maple-Silver	Acer saccharinum	41.83356885	-87.62485175
1192	1335	Elm-Siberian	Ulmus pumila	41.8335781	-87.62491082
1193	1336	Maple-Silver	Acer saccharinum	41.83365067	-87.6248971
1194	1337	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83368967	-87.62493295
1195	1338	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83373232	-87.62492313
1196	1339	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83389257	-87.62498388
1197	1340	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83395872	-87.62495478
1198	1341	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83402425	-87.6249979
1199	1342	Hawthorn	Crataegus sp.	41.83399905	-87.62485757
1200	1343	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83412963	-87.62470747
1201	1344	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8341344	-87.6247585
1202	1345	Hawthorn	Crataegus sp.	41.83415653	-87.62472392
1203	1346	Hawthorn	Crataegus sp.	41.83414567	-87.6248523
1204	1347	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8341358	-87.62496245
1205	1348	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83416953	-87.62497165
1206	1349	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834304	-87.62492087
1207	1350	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83433857	-87.62498383
1208	1351	Hawthorn	Crataegus sp.	41.837766788	-87.624904484
1209	1352	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838028361	-87.624847181
1210	1353	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838028195	-87.625008874
1211	1354	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83800318	-87.625037235
1212	1355	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83796002	-87.624998125
1213	1356	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837810994	-87.62501626
1214	1357	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837723862	-87.625070868
1215	1358	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837707806	-87.62496104
1216	1359	Elm-Siberian	Ulmus pumila	41.837897018	-87.625263159
1217	1360	Elm-Siberian	Ulmus pumila	41.837851514	-87.625239122
1218	1361	Walnut-Black	Juglans nigra	41.837755547	-87.625243459
1219	1362	Elm-American	Ulmus americana	41.8376212	-87.625229238
1220	1364	Elm-Siberian	Ulmus pumila	41.837341317	-87.625243371
1221	1365	Walnut-Black	Juglans nigra	41.837215424	-87.62521903
1222	1366	Walnut-Black	Juglans nigra	41.837131589	-87.625224456
1223	1367	Walnut-Black	Juglans nigra	41.837031717	-87.625213693
1224	1368	Walnut-Black	Juglans nigra	41.836927828	-87.625210779
1225	1369	Hawthorn	Crataegus sp.	41.836890703	-87.62506535
1226	1370	Maple-Red	Acer rubrum	41.836957241	-87.625109861
1227	1371	Maple-Red	Acer rubrum	41.836997104	-87.625068594
1228	1372	Maple-Sugar	Acer saccharum	41.837091911	-87.625108241
1229	1374	Crabapple	Malus sp.	41.837202485	-87.625099068
1230	1375	Crabapple	Malus sp.	41.837256767	-87.625108706
1231	1376	Oak-Northern Red	Quercus rubra	41.837315127	-87.625098799
1232	1377	Oak-Northern Red	Quercus rubra	41.837406836	-87.625096019
1233	1378	Oak-Northern Red	Quercus rubra	41.83749129	-87.625107737
1234	1379	Hawthorn	Crataegus sp.	41.837586661	-87.625110863
1235	1380	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837618788	-87.624983407
1236	1381	Redbud-Eastern	Cercis canadensis	41.837630283	-87.624836698
1237	1382	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837606975	-87.624803828
1238	1383	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837622023	-87.624644964
1239	1384	Walnut-Black	Juglans nigra	41.837617526	-87.624543123
1240	1385	Redbud-Eastern	Cercis canadensis	41.837638824	-87.624447954
1241	1386	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837590185	-87.624354535
1242	1387	Hawthorn	Crataegus sp.	41.837495313	-87.624371761
1243	1388	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837424002	-87.62444774
1244	1389	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83740863	-87.624523468
1245	1390	Hawthorn	Crataegus sp.	41.837314628	-87.624469834
1246	1391	Hawthorn	Crataegus sp.	41.837274021	-87.624478939
1247	1392	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837215009	-87.624494315
1248	1393	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837080347	-87.624500165
1249	1394	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836970386	-87.624337899
1250	1395	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836971098	-87.624428362
1251	1396	Walnut-Black	Juglans nigra	41.836962664	-87.624532511
1252	1397	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83692931	-87.624880691
1253	1398	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836953544	-87.624934259
1254	1400	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837565845	-87.624201083
1255	1401	Redbud-Eastern	Cercis canadensis	41.833336837	-87.624281007
1256	1402	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833365537	-87.62437298
1257	1403	Tuliptree	Liriodendron tulipifera	41.833441598	-87.624327517
1258	1405	Maple-Silver	Acer saccharinum	41.833523266	-87.624520382
1259	1406	Tuliptree	Liriodendron tulipifera	41.833523384	-87.624368806
1260	1407	Walnut-Black	Juglans nigra	41.833532512	-87.62408408
1261	1408	Hawthorn	Crataegus sp.	41.833572272	-87.624053224
1262	1409	Hawthorn	Crataegus sp.	41.833578793	-87.624009428
1263	1410	Magnolia	Magnolia sp.	41.8336352	-87.624023533
1264	1411	Redbud-Eastern	Cercis canadensis	41.833613425	-87.62438332
1265	1412	Hawthorn	Crataegus sp.	41.833671341	-87.624395288
1266	1413	Hawthorn	Crataegus sp.	41.833758693	-87.624385101
1267	1414	Catalpa-Northern	Catalpa speciosa	41.833707137	-87.624345213
1268	1415	Oak-Swamp White	Quercus bicolor	41.833754221	-87.624077594
1269	1416	Hawthorn	Crataegus sp.	41.833814516	-87.624051192
1270	1417	Hawthorn	Crataegus sp.	41.833826021	-87.624017253
1271	1418	Hawthorn	Crataegus sp.	41.833819475	-87.62388748
1272	1419	Redbud-Eastern	Cercis canadensis	41.833808271	-87.623796141
1273	1420	Hawthorn	Crataegus sp.	41.834027219	-87.623576732
1274	1421	Hawthorn	Crataegus sp.	41.834037941	-87.623629857
1275	1422	Hawthorn	Crataegus sp.	41.834128524	-87.623642671
1276	1423	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834065492	-87.6238177
1277	1424	Hawthorn	Crataegus sp.	41.834022601	-87.623926924
1278	1425	Linden-Littleleaf	Tilia cordata	41.833955585	-87.624012318
1279	1426	Magnolia	Magnolia sp.	41.833919016	-87.624076307
1280	1427	Linden-Littleleaf	Tilia cordata	41.834010788	-87.624374203
1281	1428	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834043397	-87.624504087
1282	1429	Hawthorn	Crataegus sp.	41.833998954	-87.624578144
1283	1430	Hawthorn	Crataegus sp.	41.834028511	-87.624624461
1284	1431	Hawthorn	Crataegus sp.	41.834032739	-87.624662284
1285	1432	Hawthorn	Crataegus sp.	41.834120902	-87.623865291
1286	1433	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834135156	-87.62395224
1287	1434	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834175509	-87.624020581
1288	1435	Hawthorn	Crataegus sp.	41.834174334	-87.624093604
1289	1436	Hawthorn	Crataegus sp.	41.834145204	-87.624073178
1290	1437	Hawthorn	Crataegus sp.	41.834124546	-87.624094792
1291	1438	Pine-Austrian	Pinus nigra	41.834205749	-87.624301459
1292	1439	Pine-Austrian	Pinus nigra	41.834177932	-87.624402549
1293	1440	Maple-Sugar	Acer saccharum	41.834175201	-87.624490408
1294	1441	Maple-Sugar	Acer saccharum	41.834130162	-87.624524304
1295	1442	Pine-Austrian	Pinus nigra	41.834207368	-87.624516997
1296	1443	Hawthorn	Crataegus sp.	41.834170791	-87.624547509
1297	1444	Hawthorn	Crataegus sp.	41.83422736	-87.624583047
1298	1445	Hawthorn	Crataegus sp.	41.834196123	-87.624605514
1299	1446	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83446577	-87.62496475
1300	1447	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83452497	-87.62499957
1301	1448	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83462903	-87.62494532
1302	1449	Ash-Green	Fraxinus pennsylvanica	41.83462318	-87.62482758
1303	1450	Ash-Green	Fraxinus pennsylvanica	41.83461805	-87.62466492
1304	1451	Ash-Green	Fraxinus pennsylvanica	41.83464547	-87.624592
1305	1452	Locust-Black	Robinia pseudoacacia	41.83464543	-87.62452503
1306	1453	Ash-Green	Fraxinus pennsylvanica	41.8346266	-87.62438708
1307	1454	Ash-Green	Fraxinus pennsylvanica	41.83461333	-87.62422033
1308	1455	Ash-Green	Fraxinus pennsylvanica	41.83460932	-87.62415602
1309	1456	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834631867	-87.623698349
1310	1459	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83438028	-87.62346498
1311	1460	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83428332	-87.62346955
1312	1461	Zelkova-Japanese	Zelkova serrata	41.83420476	-87.623446798
1313	1462	Zelkova-Japanese	Zelkova serrata	41.833934923	-87.623448802
1314	1463	Ash-Green	Fraxinus pennsylvanica	41.83384403	-87.62347742
1315	1464	Ash-Green	Fraxinus pennsylvanica	41.833778525	-87.623445103
1316	1465	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83365822	-87.62347113
1317	1466	Ash-Green	Fraxinus pennsylvanica	41.833554172	-87.623436598
1318	1467	Hackberry	Celtis occidentalis	41.83347268	-87.62344492
1319	1468	Hackberry	Celtis occidentalis	41.833417314	-87.623434957
1320	1469	Hackberry	Celtis occidentalis	41.833364832	-87.623428542
1321	1474	Elm-American	Ulmus americana	41.832988017	-87.623421847
1322	1475	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832884868	-87.623432775
1323	1476	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83296418	-87.6236174
1324	1477	Mulberry-White	Morus alba	41.8329199	-87.62352323
1325	1478	Pine-Austrian	Pinus nigra	41.834212415	-87.624653328
1326	1479	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834177096	-87.624689088
1327	1480	Hawthorn	Crataegus sp.	41.834229257	-87.624761866
1328	1481	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834401991	-87.624888615
1329	1482	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83456954	-87.624827658
1330	1483	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834563993	-87.624706897
1331	1484	Maple-Sugar	Acer saccharum	41.834584717	-87.624652819
1332	1485	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834499568	-87.624654768
1333	1486	Maple-Sugar	Acer saccharum	41.834541476	-87.624592179
1334	1487	Maple-Sugar	Acer saccharum	41.834516344	-87.624525567
1335	1488	Maple-Sugar	Acer saccharum	41.834591722	-87.624516915
1336	1489	Hawthorn	Crataegus sp.	41.834562197	-87.624463382
1337	1490	Hawthorn	Crataegus sp.	41.834582983	-87.624314976
1338	1491	Pine-Austrian	Pinus nigra	41.83446778	-87.624299775
1339	1492	Pine-Austrian	Pinus nigra	41.834446658	-87.624192647
1340	1493	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834587588	-87.624249302
1341	1494	Hawthorn	Crataegus sp.	41.834575182	-87.624270781
1342	1495	Hawthorn	Crataegus sp.	41.834576389	-87.624134927
1343	1496	Hawthorn	Crataegus sp.	41.834545549	-87.624115994
1344	1497	Pine-Austrian	Pinus nigra	41.834325399	-87.624112128
1345	1498	Redbud-Eastern	Cercis canadensis	41.835079858	-87.624656468
1346	1499	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835418201	-87.625180769
1347	1500	Maple-Freeman's	Acer x freemanii	41.835736546	-87.62514408
1348	1501	Buckeye-Ohio	Aesculus glabra	41.83433167	-87.6236042
1349	1502	Locust-Black	Robinia pseudoacacia	41.83455073	-87.6235869
1350	1503	Locust-Black	Robinia pseudoacacia	41.834546196	-87.623651197
1351	1504	Locust-Black	Robinia pseudoacacia	41.83459327	-87.62359055
1352	1505	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8342459	-87.62394688
1353	1506	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8342807	-87.62397928
1354	1507	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83433145	-87.62395062
1355	1508	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83442528	-87.62397163
1356	1509	Hawthorn	Crataegus sp.	41.83446468	-87.62396657
1357	1510	Hawthorn	Crataegus sp.	41.83448617	-87.6240306
1358	1511	Hawthorn	Crataegus sp.	41.83446835	-87.62406132
1359	1512	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83453078	-87.62400128
1360	1513	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83456223	-87.62406007
1361	1514	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83427047	-87.62405215
1362	1515	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835707079	-87.625245107
1363	1516	Maple-Norway	Acer platanoides	41.835786602	-87.625255066
1364	1517	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835863102	-87.625265652
1365	1518	Maple-Freeman's	Acer x freemanii	41.835928268	-87.625262112
1366	1519	Serviceberry	Amelanchier sp.	41.836151637	-87.625243269
1367	1520	Maple-Freeman's	Acer x freemanii	41.836194762	-87.625318132
1368	1521	Oak-Northern Red	Quercus rubra	41.8362221	-87.62523316
1369	1522	Hackberry	Celtis occidentalis	41.836260097	-87.625270147
1370	1523	Maple-Freeman's	Acer x freemanii	41.836381321	-87.625451412
1371	1524	Oak-Swamp White	Quercus bicolor	41.836429819	-87.625494044
1372	1525	Hawthorn	Crataegus sp.	41.836380061	-87.625145793
1373	1526	Maple-Norway	Acer platanoides	41.836281509	-87.625455625
1374	1527	Oak-Northern Red	Quercus rubra	41.83634639	-87.625553078
1375	1528	Serviceberry	Amelanchier sp.	41.836296019	-87.625671266
1376	1529	Oak-Swamp White	Quercus bicolor	41.836354264	-87.625829668
1377	1530	Oak-Northern Red	Quercus rubra	41.836415561	-87.625829766
1378	1531	Hackberry	Celtis occidentalis	41.836504063	-87.625485503
1379	1532	Hawthorn	Crataegus sp.	41.836544247	-87.625347524
1380	1533	Hackberry	Celtis occidentalis	41.836478547	-87.625217845
1381	1534	Elm-American	Ulmus americana	41.836579729	-87.625202986
1382	1535	Oak-Swamp White	Quercus bicolor	41.836581331	-87.625396077
1383	1536	Oak-Swamp White	Quercus bicolor	41.836569335	-87.625467338
1384	1537	Pine-Eastern White	Pinus strobus	41.836596842	-87.625562049
1385	1538	Redbud-Eastern	Cercis canadensis	41.836616772	-87.625473861
1386	1539	Redbud-Eastern	Cercis canadensis	41.836624401	-87.625391346
1387	1540	Pine-Eastern White	Pinus strobus	41.836626368	-87.625366635
1388	1541	Pine-Eastern White	Pinus strobus	41.836709224	-87.625332129
1389	1542	Redbud-Eastern	Cercis canadensis	41.836670096	-87.625283078
1390	1543	Hackberry	Celtis occidentalis	41.836670668	-87.625209994
1391	1544	Hawthorn	Crataegus sp.	41.836807517	-87.625451069
1392	1545	Maple-Norway	Acer platanoides	41.836782732	-87.62567067
1393	1547	Hawthorn	Crataegus sp.	41.836922682	-87.625876597
1394	1548	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83476893	-87.62365943
1395	1549	Ash-Green	Fraxinus pennsylvanica	41.83476058	-87.62379018
1396	1550	Ash-Green	Fraxinus pennsylvanica	41.83476612	-87.62402857
1397	1551	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83475118	-87.62416555
1398	1552	Linden-American	Tilia americana	41.83484092	-87.6242168
1399	1553	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83478027	-87.62446513
1400	1554	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83474985	-87.62489857
1401	1555	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83480047	-87.62484277
1402	1556	Hawthorn	Crataegus sp.	41.83481248	-87.62488355
1403	1557	Hawthorn	Crataegus sp.	41.83477908	-87.62475113
1404	1558	Hawthorn	Crataegus sp.	41.83478543	-87.62473492
1405	1559	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8347756	-87.62462417
1406	1560	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8347744	-87.62456673
1407	1561	Hawthorn	Crataegus sp.	41.837513412	-87.624178583
1408	1562	Dogwood-Pagoda	Cornus alternifolia	41.83752378	-87.624094075
1409	1563	Hackberry	Celtis occidentalis	41.837527164	-87.624079773
1410	1564	Dogwood-Pagoda	Cornus alternifolia	41.837575553	-87.624063585
1411	1565	Hawthorn	Crataegus sp.	41.83756095	-87.623937065
1412	1566	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8375304	-87.623808666
1413	1567	Redbud-Eastern	Cercis canadensis	41.837588461	-87.623730803
1414	1569	Hawthorn	Crataegus sp.	41.837531332	-87.623689181
1415	1570	Hawthorn	Crataegus sp.	41.837526034	-87.623621139
1416	1571	Hawthorn	Crataegus sp.	41.837481732	-87.623615749
1417	1572	Redbud-Eastern	Cercis canadensis	41.837357887	-87.623611574
1418	1573	Elm-American	Ulmus americana	41.837311982	-87.623752276
1419	1574	Elm-American	Ulmus americana	41.83734458	-87.623845582
1420	1575	Hawthorn	Crataegus sp.	41.837155805	-87.623759645
1421	1576	Hawthorn	Crataegus sp.	41.837032469	-87.623764691
1422	1578	Walnut-Black	Juglans nigra	41.836895544	-87.623789556
1423	1579	Walnut-Black	Juglans nigra	41.836802291	-87.623735863
1424	1580	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836871299	-87.624087544
1425	1581	Honeylocust-Common	Gleditsia triacanthos	41.836966567	-87.624137449
1426	1582	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837029555	-87.624080411
1427	1583	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837227095	-87.624129405
1428	1584	Walnut-Black	Juglans nigra	41.837338959	-87.62412038
1429	1585	Walnut-Black	Juglans nigra	41.836664941	-87.623616495
1430	1586	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836587044	-87.62366715
1431	1587	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836490521	-87.623581412
1432	1588	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836443619	-87.623586958
1433	1589	Hawthorn	Crataegus sp.	41.836350213	-87.623757222
1434	1590	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836356638	-87.623930044
1435	1591	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836367861	-87.623982488
1436	1592	Walnut-Black	Juglans nigra	41.836299927	-87.624127435
1437	1593	Hawthorn	Crataegus sp.	41.836813127	-87.624489693
1438	1594	Serviceberry	Amelanchier sp.	41.83683423	-87.624381022
1439	1595	Serviceberry	Amelanchier sp.	41.836780321	-87.624388617
1440	1596	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836793452	-87.624365749
1441	1597	Walnut-Black	Juglans nigra	41.836686863	-87.624133011
1442	1598	Locust-Black	Robinia pseudoacacia	41.83613498	-87.62351055
1443	1599	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83604403	-87.62352458
1444	1600	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83597813	-87.62352253
1445	1601	Hawthorn	Crataegus sp.	41.83481305	-87.62448227
1446	1602	Hawthorn	Crataegus sp.	41.83478733	-87.6244382
1447	1603	Hawthorn	Crataegus sp.	41.83481557	-87.62445655
1448	1604	Hawthorn	Crataegus sp.	41.83488423	-87.62441673
1449	1605	Hawthorn	Crataegus sp.	41.8349151	-87.62447048
1450	1606	Maple-Norway	Acer platanoides	41.83496438	-87.62445577
1451	1607	Hawthorn	Crataegus sp.	41.835033902	-87.624456879
1452	1608	Hawthorn	Crataegus sp.	41.83504755	-87.62443602
1453	1609	Hawthorn	Crataegus sp.	41.83508542	-87.62448122
1454	1610	Hawthorn	Crataegus sp.	41.835055124	-87.624529965
1455	1611	Hawthorn	Crataegus sp.	41.83515025	-87.6245851
1456	1612	Hawthorn	Crataegus sp.	41.83514243	-87.6245095
1457	1613	Hawthorn	Crataegus sp.	41.83515808	-87.62446002
1458	1614	Birch-European White	Betula pendula	41.835110234	-87.624391386
1459	1615	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835115224	-87.624717904
1460	1616	Hawthorn	Crataegus sp.	41.8350835	-87.62476135
1461	1617	Hawthorn	Crataegus sp.	41.83495305	-87.6249403
1462	1618	Hawthorn	Crataegus sp.	41.83512002	-87.62490127
1463	1619	Hawthorn	Crataegus sp.	41.83513973	-87.62490149999999
1464	1620	Hawthorn	Crataegus sp.	41.83512347	-87.62485452
1465	1621	Crabapple	Malus sp.	41.83512033	-87.62478723
1466	1622	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83504528	-87.624901
1467	1623	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8351242	-87.62493992
1468	1624	Hawthorn	Crataegus sp.	41.83524432	-87.6248885
1469	1625	Hawthorn	Crataegus sp.	41.83525243	-87.6248473
1470	1626	Hawthorn	Crataegus sp.	41.8352769	-87.62489735
1471	1627	Hawthorn	Crataegus sp.	41.83526312	-87.62460245
1472	1628	Hawthorn	Crataegus sp.	41.83526138	-87.6246714
1473	1629	Hawthorn	Crataegus sp.	41.83538547	-87.62471527
1474	1630	Mulberry-White	Morus alba	41.835392952	-87.624653728
1475	1631	Arborvitae-Eastern	Thuja occidentalis	41.83534328	-87.62462927
1476	1632	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83538457	-87.62489607
1477	1633	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835565869	-87.624776011
1478	1634	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835555058	-87.624718704
1479	1635	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83561601	-87.624614314
1480	1636	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835664967	-87.62466717
1481	1637	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83563252	-87.62488943
1482	1638	Hawthorn	Crataegus sp.	41.83559032	-87.62490303
1483	1639	Hawthorn	Crataegus sp.	41.83560392	-87.62492512
1484	1640	Hawthorn	Crataegus sp.	41.83562548	-87.62497008
1485	1641	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83577712	-87.62494812
1486	1642	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835824742	-87.624772861
1487	1643	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835829923	-87.624602416
1488	1644	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835832268	-87.624506167
1489	1645	Hawthorn	Crataegus sp.	41.835842026	-87.624505895
1490	1646	Hawthorn	Crataegus sp.	41.83590572	-87.6244901
1491	1647	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83588583	-87.62450862
1492	1648	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835929049	-87.624734223
1493	1649	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835911519	-87.624809597
1494	1650	Hawthorn	Crataegus sp.	41.835922692	-87.624942065
1495	1651	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83673377	-87.62525695
1496	1652	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836807311	-87.625314607
1497	1653	Elm-American	Ulmus americana	41.836776318	-87.625096768
1498	1654	Tuliptree	Liriodendron tulipifera	41.836697327	-87.625058796
1499	1655	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836829459	-87.624908446
1500	1656	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836720922	-87.624953981
1501	1657	Hawthorn	Crataegus sp.	41.836587068	-87.624865595
1502	1658	Hawthorn	Crataegus sp.	41.836555058	-87.624875579
1503	1659	Hawthorn	Crataegus sp.	41.836591404	-87.624738001
1504	1660	Hawthorn	Crataegus sp.	41.836216415	-87.624903639
1505	1661	Elm-American	Ulmus americana	41.836287583	-87.624951162
1506	1662	Elm-American	Ulmus americana	41.836328958	-87.624939473
1507	1663	Elm-American	Ulmus americana	41.8362946	-87.624883037
1508	1664	Hawthorn	Crataegus sp.	41.83630475	-87.624825535
1509	1665	Hawthorn	Crataegus sp.	41.836332653	-87.624768213
1510	1666	Hawthorn	Crataegus sp.	41.836344845	-87.624731426
1511	1667	Elm-American	Ulmus americana	41.83609759	-87.624923351
1512	1668	Hawthorn	Crataegus sp.	41.83611667	-87.6247654
1513	1669	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8361585	-87.62451618
1514	1670	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83611878	-87.62445972
1515	1671	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83618193	-87.62444527
1516	1672	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83603108	-87.62437678
1517	1673	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83611648	-87.62413772
1518	1674	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83613298	-87.62407552
1519	1675	Hawthorn	Crataegus sp.	41.836326382	-87.62463308
1520	1676	Hawthorn	Crataegus sp.	41.836334153	-87.62457706
1521	1677	Hawthorn	Crataegus sp.	41.836154614	-87.624615851
1522	1678	Hawthorn	Crataegus sp.	41.836129117	-87.624581433
1523	1679	Hawthorn	Crataegus sp.	41.836113949	-87.624507889
1524	1680	Hawthorn	Crataegus sp.	41.836123725	-87.624297947
1525	1681	Oak-Northern Red	Quercus rubra	41.836452584	-87.624195463
1526	1682	Tuliptree	Liriodendron tulipifera	41.836430167	-87.624314732
1527	1683	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836481246	-87.624470257
1528	1684	Hackberry	Celtis occidentalis	41.836481668	-87.6242787
1529	1685	Oak-Northern Red	Quercus rubra	41.836549112	-87.624201607
1530	1686	Catalpa-Northern	Catalpa speciosa	41.836587229	-87.62430171
1531	1687	Hackberry	Celtis occidentalis	41.836683497	-87.624314178
1532	1688	Elm	Ulmus sp.	41.836732554	-87.624276159
1533	1689	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8359235	-87.62351673
1534	1690	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83585507	-87.62352303
1535	1691	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83577405	-87.6234962
1536	1692	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8357076	-87.62349612
1537	1693	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83558528	-87.62342557
1538	1694	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8356564	-87.62349202
1539	1695	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8355117	-87.62351032
1540	1696	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835288651	-87.623480948
1541	1697	Ash-Green	Fraxinus pennsylvanica	41.835146409	-87.623468671
1542	1698	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834996916	-87.623504298
1543	1699	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834935692	-87.623490902
1544	1700	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834852268	-87.623494551
1545	1701	Zelkova-Japanese	Zelkova serrata	41.83540038	-87.62349448
1546	1702	Tupelo-Black	Nyssa sylvatica	41.837635	-87.624176
1547	1703	Tupelo-Black	Nyssa sylvatica	41.8375473	-87.6243057
1548	1704	Tupelo-Black	Nyssa sylvatica	41.8374786	-87.624176
1549	1705	Tupelo-Black	Nyssa sylvatica	41.8374825	-87.6242981
1550	1706	Tupelo-Black	Nyssa sylvatica	41.8374481	-87.6242294
1551	1707	Tupelo-Black	Nyssa sylvatica	41.8373909	-87.6243286
1552	1708	Tupelo-Black	Nyssa sylvatica	41.8373947	-87.6242065
1553	1709	Tupelo-Black	Nyssa sylvatica	41.8373489	-87.6242981
1554	1711	Tupelo-Black	Nyssa sylvatica	41.837307	-87.6242905
1555	1712	Tupelo-Black	Nyssa sylvatica	41.8372498	-87.6243057
1556	1713	Tupelo-Black	Nyssa sylvatica	41.8372154	-87.6242905
1557	1714	Oak-Bur	Quercus macrocarpa	41.8363342	-87.6236115
1558	1715	Oak-Bur	Quercus macrocarpa	41.8362541	-87.6236038
1559	1716	Catalpa	Catalpa sp	41.8358688	-87.6278076
1560	1717	Hackberry	Celtis occidentalis	41.8357239	-87.6274719
1561	1718	Hackberry	Celtis occidentalis	41.8355713	-87.6276016
1562	1719	Hackberry	Celtis occidentalis	41.8355293	-87.6275558
1563	1720	Buckeye-Ohio	Aesculus glabra	41.8354492	-87.6275406
1564	1721	Hophornbeam-American	Ostrya virginiana	41.8354607	-87.6276245
1565	1722	Hophornbeam-American	Ostrya virginiana	41.8354454	-87.6276703
1566	1723	Hophornbeam-American	Ostrya virginiana	41.835453	-87.6277313
1567	1724	Kentucky Coffeetree	Gymnocladus dioicus	41.8355904	-87.6277924
1568	1725	Kentucky Coffeetree	Gymnocladus dioicus	41.8355446	-87.6277847
1569	1726	Kentucky Coffeetree	Gymnocladus dioicus	41.8355179	-87.6278076
1570	1727	Tuliptree	Liriodendron tulipifera	41.8354721	-87.6277542
1571	1728	Tuliptree	Liriodendron tulipifera	41.8354492	-87.6278152
1572	1729	Kentucky Coffeetree	Gymnocladus dioicus	41.8353043	-87.6277847
1573	1730	Kentucky Coffeetree	Gymnocladus dioicus	41.8352356	-87.6277847
1574	1731	Redbud-Eastern	Cercis canadensis	41.8345566	-87.6273422
1575	1732	Redbud-Eastern	Cercis canadensis	41.8345566	-87.6272812
1576	1733	Redbud-Eastern	Cercis canadensis	41.8345337	-87.6272736
1577	1734	Redbud-Eastern	Cercis canadensis	41.8344917	-87.627121
1578	1735	Redbud-Eastern	Cercis canadensis	41.8344994	-87.6270523
1579	1736	Redbud-Eastern	Cercis canadensis	41.8345032	-87.6269913
1580	1737	Redbud-Eastern	Cercis canadensis	41.8344421	-87.6269989
1581	1738	Redbud-Eastern	Cercis canadensis	41.8344193	-87.6270142
1582	1739	Redbud-Eastern	Cercis canadensis	41.8343964	-87.6270065
1583	1740	Redbud-Eastern	Cercis canadensis	41.8344078	-87.6270447
1584	1741	Serviceberry	Amelanchier sp	41.8320351	-87.6268692
1585	1742	Serviceberry	Amelanchier sp	41.832016	-87.6268539
1586	1743	Serviceberry	Amelanchier sp	41.8320045	-87.6268997
1587	1744	Serviceberry	Amelanchier sp	41.8320122	-87.6268921
1588	1745	Hornbeam-American	Carpinus caroliniana	41.8319969	-87.6269836
1589	1746	Hornbeam-American	Carpinus caroliniana	41.832016	-87.6270218
1590	1747	Tuliptree	Liriodendron tulipifera	41.8319893	-87.627037
1591	1748	Tuliptree	Liriodendron tulipifera	41.8320084	-87.6270752
1592	1749	Tuliptree	Liriodendron tulipifera	41.8319054	-87.6270142
1593	1750	Tuliptree	Liriodendron tulipifera	41.8319321	-87.6269379
1594	1751	Hornbeam-American	Carpinus caroliniana	41.8319283	-87.6268692
1595	1752	Hornbeam-American	Carpinus caroliniana	41.831913	-87.6269073
1596	1753	Hornbeam-American	Carpinus caroliniana	41.8319016	-87.6268692
1597	1754	Hornbeam-American	Carpinus caroliniana	41.8319054	-87.6268311
1598	1755	Tupelo-Black	Nyssa sylvatica	41.837332026	-87.624221733
1599	1756	Ash-Black	Fraxinus nigra	41.8376961	-87.6276474
1600	1757	Sycamore-American	Platanus occidentalis	41.8379784	-87.6280365
1601	1758	Fringetree-White	Chionanthus virginicus	41.8374634	-87.6275558
1602	1759	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8315659	-87.6280594
1603	1760	Juniper	Juniperus horizontalis	41.8381615	-87.6276016
1604	1761	Sycamore-American	Platanus occidentalis	41.8381729	-87.6277161
1605	1762	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8364182	-87.6248322
1606	1763	Sycamore-American	Platanus occidentalis	41.83321	-87.6283951
1607	1764	Honeylocust-Thornless Common	Gleditsia triacanthos	41.834248132	-87.628133077
1608	1765	Honeylocust-Thornless Common	Gleditsia triacanthos	41.8342438	-87.6280289
1609	1766	Honeylocust-Thornless Common	Gleditsia triacanthos	41.8344612	-87.6280365
1610	1767	Honeylocust-Thornless Common	Gleditsia triacanthos	41.8344383	-87.6280899
1611	1768	Rhododendron	Rhododendron sp	41.8353424	-87.628006
1612	1769	Rhododendron	Rhododendron sp	41.835610908	-87.628037292
1613	1770	Viburnum	Viburnum sp	41.8356628	-87.628067
1614	1771	Hackberry	Celtis occidentalis	41.8349762	-87.6273727
1615	1772	Hackberry	Celtis occidentalis	41.8349152	-87.626915
1616	1773	Hackberry	Celtis occidentalis	41.83498	-87.6268616
1617	1774	Lilac	Syringa sp	41.8350525	-87.6268768
1618	1775	Lilac	Syringa sp	41.8350449	-87.6273117
1619	1776	Blue Muffin Viburnum	Viburnum dentatum	41.8347511	-87.6289825
1620	1777	Blue Muffin Viburnum	Viburnum dentatum	41.8347702	-87.6289825
1621	1778	Black Lace Elderberry	Sambucus nigra	41.833404394	-87.623922288
1622	1779	Black Lace Elderberry	Sambucus nigra	41.8333778	-87.6239243
1623	1780	Black Lace Elderberry	Sambucus nigra	41.8333359	-87.6239243
1624	1781	Viburnum sp	Viburnum sp	41.8333168	-87.6236038
1625	1782	Viburnum sp	Viburnum sp	41.8333549	-87.6236038
1626	1783	Black Lace Elderberry	Sambucus nigra	41.8333092	-87.6239243
1627	1785	Poplar-Aspen	Populus tremuloides	41.833252	-87.6283951
1628	1786	Poplar-Aspen	Populus tremuloides	41.8332443	-87.6284409
1629	1787	Poplar-Aspen	Populus tremuloides	41.8332405	-87.6284866
1630	1788	Poplar-Aspen	Populus tremuloides	41.8332596	-87.6285095
1631	1789	Poplar-Aspen	Populus tremuloides	41.8332405	-87.6285172
1632	1790	Crabapple	Malus sp	41.8336372	-87.6279755
1633	1791	Crabapple	Malus sp	41.833592687	-87.627937971
1634	1792	Crabapple	Malus sp	41.83356766	-87.627982876
1635	1793	Crabapple	Malus sp	41.8335228	-87.6279678
1636	1794	Honeylocust-Thornless Common	Gleditsia triacanthos	41.8334274	-87.6279297
1637	1795	Honeylocust-Thornless Common	Gleditsia triacanthos	41.8333549	-87.6278915
1638	1796	Honeylocust-Thornless Common	Gleditsia triacanthos	41.8332825	-87.6279297
1639	1797	Shagbark Hickory	Carya ovata	41.836216	-87.6242065
1640	1798	Shagbark Hickory	Carya ovata	41.8361893	-87.6242828
1641	1800	Crabapple	Malus sp.	41.8365631	-87.6250839
1642	1801	Redbud-Eastern	Cercis canadensis	41.8347664	-87.6280594
1643	1802	Redbud-Eastern	Cercis canadensis	41.8347816	-87.6280975
1644	1803	Honeylocust-Thornless Common	Gleditisia tricanthos var. inermis	41.8348274	-87.6282349
1645	1804	Honeylocust-Thornless Common	Gleditisia tricanthos var. inermis	41.8349533	-87.6282883
1646	1805	Vernal Witchhazel	Hamamelis vernalis	41.8342285	-87.6235886
1647	1806	Vernal Witchhazel	Hamamelis vernalis	41.8340492	-87.6235428
1648	1	Elm-American	Ulmus americana	41.831052875	-87.628747395
1649	2	Elm-American	Ulmus americana	41.831057579	-87.628542281
1650	3	Elm-American	Ulmus americana	41.831057959	-87.628452116
1651	4	Elm-American	Ulmus americana	41.831052401	-87.628339326
1652	5	Elm-American	Ulmus americana	41.831061894	-87.628223161
1653	6	Elm-American	Ulmus americana	41.831066249	-87.628137029
1654	7	Elm-American	Ulmus americana	41.831053946	-87.62802723
1655	8	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831093308	-87.627861277
1656	9	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83110159	-87.627951738
1657	10	Common Baldcypress	Taxodium distichum	41.831101413	-87.628057077
1658	11	Common Baldcypress	Taxodium distichum	41.831085197	-87.628155702
1659	12	Common Baldcypress	Taxodium distichum	41.831100294	-87.628262375
1660	13	Common Baldcypress	Taxodium distichum	41.831077209	-87.62860737
1661	14	Common Baldcypress	Taxodium distichum	41.831082552	-87.628696957
1662	15	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831128406	-87.628907005
1663	16	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831193818	-87.628913776
1664	17	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831290687	-87.628915177
1665	18	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831351458	-87.628917562
1666	19	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831608654	-87.628907842
1667	20	Common Baldcypress	Taxodium distichum	41.831693714	-87.628904219
1668	21	Common Baldcypress	Taxodium distichum	41.831763324	-87.628908282
1669	22	Dawn Redwood	Metasequoia glyptostroboides	41.832096593	-87.628927493
1670	23	Dawn Redwood	Metasequoia glyptostroboides	41.832138025	-87.628933472
1671	24	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832224784	-87.628927076
1672	25	Maple-Freeman's	Acer x freemanii	41.832327376	-87.628927245
1673	27	Hackberry	Celtis occidentalis	41.832449058	-87.62894135
1674	29	Maple-Freeman's	Acer x freemanii	41.83256969	-87.628933352
1675	30	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832726174	-87.62884307
1676	31	Redbud-Eastern	Cercis canadensis	41.832722558	-87.628714416
1677	32	Serviceberry	Amelanchier sp.	41.832721928	-87.628629008
1678	33	Serviceberry	Amelanchier sp.	41.832732624	-87.628598812
1679	34	Catalpa-Northern	Catalpa speciosa	41.832738312	-87.628544736
1680	35	Hawthorn	Crataegus sp.	41.832735182	-87.628329115
1681	36	Hackberry	Celtis occidentalis	41.832727369	-87.628236538
1682	37	Hackberry	Celtis occidentalis	41.832727223	-87.628178547
1683	38	Hawthorn	Crataegus sp.	41.832734797	-87.628088309
1684	39	Linden-Littleleaf	Tilia cordata	41.832737396	-87.628012089
1685	40	Elm-American	Ulmus americana	41.832709394	-87.627966894
1686	41	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832708356	-87.6278848
1687	42	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832677666	-87.627867822
1688	43	Oak-Swamp White	Quercus bicolor	41.832615926	-87.627855123
1689	44	Oak-Swamp White	Quercus bicolor	41.832566706	-87.627861595
1690	45	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83262563	-87.627944782
1691	46	Hackberry	Celtis occidentalis	41.832535115	-87.627949427
1692	47	Hackberry	Celtis occidentalis	41.832463807	-87.627900693
1693	48	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832424885	-87.627840545
1694	49	Elm-American	Ulmus americana	41.83234508	-87.627948921
1695	50	Oak-Swamp White	Quercus bicolor	41.832312659	-87.627861526
1696	51	Oak-Swamp White	Quercus bicolor	41.832291277	-87.627910724
1697	52	Oak-Swamp White	Quercus bicolor	41.832255684	-87.62792184
1698	53	Catalpa-Northern	Catalpa speciosa	41.832201274	-87.627919066
1699	54	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832159004	-87.627908827
1700	55	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832168397	-87.627865643
1701	56	Redbud-Eastern	Cercis canadensis	41.832099912	-87.627863574
1702	57	Redbud-Eastern	Cercis canadensis	41.832083543	-87.627865677
1703	58	Redbud-Eastern	Cercis canadensis	41.832107337	-87.627900795
1704	59	Hawthorn	Crataegus sp.	41.832094028	-87.627946335
1705	60	Elm-American	Ulmus americana	41.832022448	-87.62793227
1706	61	Hackberry	Celtis occidentalis	41.831986839	-87.627918176
1707	62	Hackberry	Celtis occidentalis	41.831941431	-87.627956614
1708	63	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83185781	-87.627932374
1709	64	Oak-Swamp White	Quercus bicolor	41.831668018	-87.627959657
1710	65	Redbud-Eastern	Cercis canadensis	41.831628692	-87.627959669
1711	66	Redbud-Eastern	Cercis canadensis	41.831600006	-87.627968898
1712	67	Serviceberry	Amelanchier sp.	41.831489178	-87.627970901
1713	68	Serviceberry	Amelanchier sp.	41.831440995	-87.627974774
1714	69	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831378123	-87.627866601
1715	70	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831334739	-87.627952335
1716	71	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831292082	-87.627958918
1717	72	Kentucky Coffeetree	Gymnocladus dioicus	41.831222862	-87.627950468
1718	73	Viburnum	Viburnum sp.	41.83117417	-87.62796157
1719	74	Fringetree-White	Chionanthus virginicus	41.832228466	-87.627856354
1720	75	Redbud-Eastern	Cercis canadensis	41.832804266	-87.627981813
1721	76	Redbud-Eastern	Cercis canadensis	41.832851169	-87.627945287
1722	77	Redbud-Eastern	Cercis canadensis	41.832854706	-87.62791798
1723	78	Tuliptree	Liriodendron tulipifera	41.833055579	-87.628250419
1724	79	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833239917	-87.628057641
1725	80	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833146823	-87.627885204
1726	81	Witchhazel	Hamamelis virginiana	41.83365762	-87.627974525
1727	82	Maple-Norway	Acer platanoides	41.833729396	-87.627989497
1728	83	Maple-Norway	Acer platanoides	41.833900304	-87.628005662
1729	84	Linden-Littleleaf	Tilia cordata	41.83401016	-87.627960255
1730	85	Elm-American	Ulmus americana	41.834172278	-87.628010962
1731	86	Elm-American	Ulmus americana	41.834161099	-87.628710698
1732	87	Walnut-Black	Juglans nigra	41.834026987	-87.628769517
1733	88	Serviceberry	Amelanchier sp.	41.83391414	-87.628730388
1734	89	Horsechestnut- Common	Aesculus hippocastanum	41.833883297	-87.62873276
1735	90	Serviceberry	Amelanchier sp.	41.833895673	-87.628712904
1736	91	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833850748	-87.628763557
1737	92	Serviceberry	Amelanchier sp.	41.833807219	-87.628772972
1738	93	Serviceberry	Amelanchier sp.	41.83379499	-87.628731602
1739	94	Horsechestnut- Common	Aesculus hippocastanum	41.833683005	-87.628705632
1740	95	Redbud-Eastern	Cercis canadensis	41.833528003	-87.628686208
1741	96	Redbud-Eastern	Cercis canadensis	41.833503793	-87.628669126
1742	97	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833425193	-87.628690878
1743	98	Serviceberry	Amelanchier sp.	41.833381018	-87.628684586
1744	99	Serviceberry	Amelanchier sp.	41.833362652	-87.628695019
1745	100	Crabapple	Malus sp.	41.833289224	-87.628678918
1746	101	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831100031	-87.627623777
1747	102	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83110533	-87.627535223
1748	103	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831101572	-87.6274497
1749	104	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831096803	-87.627346493
1750	105	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831116326	-87.627275894
1751	106	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831108147	-87.62717825
1752	107	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831102683	-87.627097946
1753	108	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831102221	-87.626991946
1754	109	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831105084	-87.626912954
1755	110	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831242746	-87.626711219
1756	111	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831299883	-87.626708915
1757	112	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831360951	-87.626731218
1758	113	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83140716	-87.626716201
1759	114	Oak-Bur	Quercus macrocarpa	41.831768932	-87.626703696
1760	115	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831811335	-87.626726245
1761	116	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831868591	-87.626724463
1762	117	Honeylocust-Common	Gleditsia triacanthos	41.831762476	-87.626821079
1763	118	Honeylocust-Common	Gleditsia triacanthos	41.831782509	-87.626839443
1764	119	Kentucky Coffeetree	Gymnocladus dioicus	41.831921262	-87.626811509
1765	120	Euonymus	Euonymus sp.	41.831885513	-87.627165146
1766	121	Euonymus	Euonymus sp.	41.832009867	-87.62716165
1767	122	Kentucky Coffeetree	Gymnocladus dioicus	41.831988741	-87.62683508
1768	123	Maple-Freeman's	Acer x freemanii	41.832053547	-87.626822051
1769	124	Ash-White	Fraxinus americana	41.83209602	-87.626714419
1770	125	Ash-White	Fraxinus americana	41.832143763	-87.626708926
1771	126	Oak-Bur	Quercus macrocarpa	41.83219396	-87.62671897
1772	127	Kentucky Coffeetree	Gymnocladus dioicus	41.832234291	-87.626723182
1773	128	Oak-Bur	Quercus macrocarpa	41.832450552	-87.626728863
1774	129	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832526809	-87.626707831
1775	130	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832580542	-87.626697121
1776	131	Kentucky Coffeetree	Gymnocladus dioicus	41.832622778	-87.626733694
1777	132	Kentucky Coffeetree	Gymnocladus dioicus	41.832658245	-87.626705143
1778	133	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832708858	-87.626750664
1779	134	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832740578	-87.626700898
1780	135	Elm	Ulmus sp.	41.832487843	-87.626860568
1781	136	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832549893	-87.62684082
1782	137	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832575125	-87.626917838
1783	138	Kentucky Coffeetree	Gymnocladus dioicus	41.832652718	-87.626827152
1784	139	Serviceberry	Amelanchier sp.	41.832687342	-87.626876886
1785	140	Serviceberry	Amelanchier canadensis	41.832713366	-87.626903827
1786	141	Honeylocust-Common	Gleditsia triacanthos	41.832694181	-87.626986595
1787	142	Hawthorn	Crataegus sp.	41.832712889	-87.627100624
1788	143	Hawthorn	Crataegus sp.	41.832742264	-87.627167379
1789	144	Hawthorn	Crataegus sp.	41.832735919	-87.627439457
1790	145	Hawthorn	Crataegus sp.	41.832722194	-87.627497969
1791	146	Hackberry	Celtis occidentalis	41.832712963	-87.627640982
1792	147	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832708337	-87.627567312
1793	148	Hackberry	Celtis occidentalis	41.832721821	-87.627598357
1794	149	Oak-Bur	Quercus macrocarpa	41.832719443	-87.627677956
1795	150	Hawthorn	Crataegus sp.	41.83268003	-87.62774194
1796	151	Oak-Northern Red	Quercus rubra	41.832631962	-87.627719735
1797	152	Hackberry	Celtis occidentalis	41.832598445	-87.627636551
1798	153	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832550938	-87.62769165
1880	238	Hackberry	Celtis occidentalis	41.8338598	-87.626871033
1799	154	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83253298	-87.627649553
1800	155	Catalpa	Catalpa sp.	41.832481978	-87.627723294
1801	156	Maple-Freeman's	Acer x freemanii	41.832409423	-87.627667403
1802	157	Elm-American	Ulmus americana	41.83239509	-87.627586738
1803	158	Oak-Swamp White	Quercus bicolor	41.832305441	-87.627605795
1804	159	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832265066	-87.627695856
1805	160	Oak-Northern Red	Quercus rubra	41.832157577	-87.627718569
1806	161	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832111261	-87.627695906
1807	162	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832029971	-87.627713136
1808	163	Serviceberry	Amelanchier sp.	41.832031511	-87.627641374
1809	164	Linden-Littleleaf	Tilia cordata	41.831993341	-87.627555657
1810	165	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831907562	-87.627361862
1811	167	Serviceberry	Amelanchier sp.	41.831902888	-87.627602184
1812	168	Hawthorn	Crataegus sp.	41.831914306	-87.627699409
1813	169	Hawthorn	Crataegus sp.	41.831854364	-87.627713984
1814	170	Redbud-Eastern	Cercis canadensis	41.831804534	-87.6278235
1815	171	Hackberry	Celtis occidentalis	41.831741471	-87.627669097
1816	172	Hackberry	Celtis occidentalis	41.831659612	-87.627705495
1817	173	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831706236	-87.627804311
1818	174	Oak-Northern Red	Quercus rubra	41.831655833	-87.627807371
1819	175	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831464029	-87.627727841
1820	176	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831380727	-87.627724229
1821	177	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831257086	-87.627723053
1822	178	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831179489	-87.627719894
1823	179	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832799112	-87.626731363
1824	180	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832839937	-87.62672142
1825	181	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832882041	-87.626736581
1826	182	Hawthorn	Crataegus sp.	41.832880684	-87.626840215
1827	183	Honeylocust-Common	Gleditsia triacanthos	41.832869951	-87.626850707
1828	185	Honeylocust-Common	Gleditsia triacanthos	41.832872702	-87.62706186
1829	186	Hawthorn	Crataegus sp.	41.832855047	-87.627326174
1830	187	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832863412	-87.627404157
1831	188	Kentucky Coffeetree	Gymnocladus dioicus	41.832865885	-87.627506829
1832	189	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832871904	-87.627743654
1833	190	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832802791	-87.627747772
1834	191	Hawthorn	Crataegus sp.	41.832960207	-87.627719915
1835	192	Kentucky Coffeetree	Gymnocladus dioicus	41.833002957	-87.627734778
1836	193	Elm	Ulmus sp.	41.833167969	-87.627724368
1837	194	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833282144	-87.627750775
1838	195	Hawthorn	Crataegus sp.	41.833373526	-87.62772807
1839	196	Ash-White	Fraxinus americana	41.832969989	-87.626730857
1840	197	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833016798	-87.62669747
1841	198	Ash-White	Fraxinus americana	41.833050224	-87.626727597
1842	199	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83311297	-87.62672872
1843	200	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833155603	-87.626697485
1844	201	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832814633	-87.62684025
1845	202	Downy Hawthorn	Crataegus mollis	41.832790467	-87.626883467
1846	203	Serviceberry	Amelanchier sp.	41.832795667	-87.626919483
1847	204	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8328093	-87.6270193
1848	205	Elm	Ulmus sp.	41.832824517	-87.627089217
1849	206	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832790283	-87.62713825
1850	207	Hawthorn	Crataegus sp.	41.832819752	-87.627184416
1851	208	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832787017	-87.627470117
1852	209	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832806717	-87.627532017
1853	210	Downy Hawthorn	Crataegus mollis	41.832826202	-87.627660739
1854	211	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833096667	-87.627737217
1855	212	Elm	Ulmus sp.	41.833002033	-87.627574783
1856	214	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832977328	-87.62749193
1857	215	Hawthorn	Crataegus sp.	41.832985901	-87.627397092
1858	216	Hawthorn	Crataegus sp.	41.83300555	-87.62713535
1859	217	Kentucky Coffeetree	Gymnocladus dioicus	41.832934017	-87.627055567
1860	218	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833001867	-87.6270094
1861	219	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832991117	-87.6269282
1862	220	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832926417	-87.626898067
1863	221	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832970133	-87.626866517
1864	222	Kentucky Coffeetree	Gymnocladus dioicus	41.8329384	-87.626796167
1865	223	Hawthorn	Crataegus sp.	41.833066033	-87.62679345
1866	224	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8331371	-87.626814283
1867	225	Kentucky Coffeetree	Gymnocladus dioicus	41.8332096	-87.626774667
1868	226	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83330475	-87.626801283
1869	227	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833373617	-87.626799383
1870	228	Hawthorn	Crataegus sp.	41.833396092	-87.626897389
1871	229	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833529217	-87.626864433
1872	230	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8335315	-87.626891267
1873	231	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833594717	-87.6269754
1874	232	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8335997	-87.626858367
1875	233	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833636467	-87.626869783
1876	234	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83371085	-87.626831433
1877	235	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833731517	-87.626863
1878	236	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8337847	-87.626838767
1879	237	Catalpa-Northern	Catalpa speciosa	41.833814017	-87.62683365
1881	239	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833888067	-87.626845933
1882	240	Hackberry	Celtis occidentalis	41.833921367	-87.62689835
1883	241	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833957233	-87.62692665
1884	242	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834021633	-87.62691725
1885	243	Hawthorn	Crataegus sp.	41.83411125	-87.62685652
1886	244	Hawthorn	Crataegus sp.	41.83412863	-87.62687837
1887	245	Hawthorn	Crataegus sp.	41.83414388	-87.62685372
1888	246	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83417325	-87.62686685
1889	247	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83419617	-87.62680935
1890	248	Serviceberry	Amelanchier sp.	41.83421805	-87.62682647
1891	249	Serviceberry	Amelanchier sp.	41.8342456	-87.62685425
1892	250	Poplar-Eastern	Populus deltoides	41.83433977	-87.62685062
1893	251	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833190593	-87.626729102
1894	252	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833319287	-87.626744152
1895	253	Honeylocust-Common	Gleditsia triacanthos	41.833376861	-87.626756432
1896	254	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833511098	-87.62673964
1897	255	Honeylocust-Common	Gleditsia triacanthos	41.83359645	-87.626757145
1898	256	Honeylocust-Common	Gleditsia triacanthos	41.833662044	-87.626754846
1899	257	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833788008	-87.626746648
1900	258	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833836074	-87.626713841
1901	259	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833857575	-87.626759302
1902	260	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833890471	-87.626723344
1903	261	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833915403	-87.626764606
1904	262	Ash-White	Fraxinus americana	41.833978465	-87.626763991
1905	263	Redbud-Eastern	Cercis canadensis	41.83432843	-87.62691908
1906	264	Redbud-Eastern	Cercis canadensis	41.83433102	-87.62699258
1907	265	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83432592	-87.62704902
1908	266	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8343667	-87.62693072
1909	267	Redbud-Eastern	Cercis canadensis	41.83440312	-87.62687685
1910	268	Redbud-Eastern	Cercis canadensis	41.83442663	-87.62689192
1911	269	Hawthorn	Crataegus sp.	41.8344619	-87.62690147
1912	270	Hawthorn	Crataegus sp.	41.83446665	-87.62687367
1913	271	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83453925	-87.6268941
1914	272	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8345604	-87.6269642
1915	273	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83455835	-87.62709347
1916	274	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83440018	-87.6272663
1917	275	Redbud-Eastern	Cercis canadensis	41.83430885	-87.6272916
1918	276	Redbud-Eastern	Cercis canadensis	41.834315398	-87.627352849
1919	277	Redbud-Eastern	Cercis canadensis	41.83424212	-87.62733347
1920	278	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834256	-87.62735968
1921	279	Redbud-Eastern	Cercis canadensis	41.83422802	-87.62731143
1922	280	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83415255	-87.62733798
1923	281	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8340807	-87.6272973
1924	282	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83401237	-87.6273011
1925	283	Hackberry	Celtis occidentalis	41.83394735	-87.62729205
1926	284	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83392304	-87.62738158
1927	285	Catalpa-Northern	Catalpa speciosa	41.83371708	-87.62730518
1928	286	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83365123	-87.6272629
1929	287	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83362798	-87.6273251
1930	288	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83359985	-87.62726285
1931	289	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83357568	-87.62731727
1932	290	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83351463	-87.62732163
1933	291	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83347838	-87.62748452
1934	292	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83352965	-87.62764255
1935	293	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83356543	-87.62744178
1936	294	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83380253	-87.62743762
1937	295	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83384943	-87.62775145
1938	296	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834532911	-87.627784359
1939	297	Kentucky Coffeetree	Gymnocladus dioicus	41.83460773	-87.627703089
1940	298	Ash-Green	Fraxinus pennsylvanica	41.834613587	-87.627608466
1941	299	Ash-Green	Fraxinus pennsylvanica	41.83474385	-87.62766338
1942	300	Ash-Green	Fraxinus pennsylvanica	41.83474527	-87.62775732
1943	301	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833204147	-87.628689623
1944	302	Oak-Bur	Quercus macrocarpa	41.833257447	-87.628582528
1945	303	Hawthorn	Crataegus sp.	41.83318735	-87.628603653
1946	304	Hawthorn	Crataegus sp.	41.833152363	-87.628627509
1947	305	Hawthorn	Crataegus sp.	41.833108996	-87.628649033
1948	306	Hawthorn	Crataegus sp.	41.833127144	-87.628677964
1949	307	Catalpa-Northern	Catalpa speciosa	41.833053121	-87.628696494
1950	308	Catalpa-Northern	Catalpa speciosa	41.833016642	-87.62863358
1951	309	Catalpa-Northern	Catalpa speciosa	41.832936461	-87.628665844
1952	310	Elm-American	Ulmus americana	41.832669147	-87.629132921
1953	311	Elm-American	Ulmus americana	41.832668222	-87.629224738
1954	312	Elm-American	Ulmus americana	41.832728063	-87.629268928
1955	313	Elm-American	Ulmus americana	41.832737744	-87.629185243
1956	314	Elm-American	Ulmus americana	41.832760431	-87.629139765
1957	315	Oak-Bur	Quercus macrocarpa	41.833098815	-87.628904234
1958	316	Hawthorn	Crataegus sp.	41.833114388	-87.629036884
1959	317	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833203403	-87.628997137
1960	318	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833211108	-87.629084875
1961	319	Oak-Swamp White	Quercus bicolor	41.833317351	-87.629010314
1962	320	Oak-Swamp White	Quercus bicolor	41.833336089	-87.629011955
1963	321	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833411461	-87.6289177
1964	322	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83342442	-87.629060339
1965	323	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83348491	-87.629048654
1966	324	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833511116	-87.629037116
1967	325	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833527024	-87.628953356
1968	326	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833632115	-87.62903299
1969	327	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83370288	-87.629093168
1970	328	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833727584	-87.629025457
1971	329	Serviceberry	Amelanchier sp.	41.833721795	-87.629098402
1972	331	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833678634	-87.628929704
1973	332	Walnut-Black	Juglans nigra	41.833803065	-87.628935411
1974	334	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833886267	-87.628936126
1975	335	Redbud-Eastern	Cercis canadensis	41.833953347	-87.62896316
1976	336	Ginkgo	Ginkgo biloba	41.834126888	-87.629060988
1977	337	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834236665	-87.628977252
1978	338	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83437531	-87.62897493
1979	339	Redbud-Eastern	Cercis canadensis	41.834465199	-87.62895099
1980	340	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834510265	-87.628946784
1981	341	Serviceberry	Amelanchier sp.	41.834536914	-87.629059794
1982	342	Ginkgo	Ginkgo biloba	41.834550942	-87.629141077
1983	343	Serviceberry	Amelanchier sp.	41.834463573	-87.629118188
1984	344	Hornbeam-American	Carpinus caroliniana	41.834426668	-87.629098381
1985	345	Serviceberry	Amelanchier sp.	41.834434432	-87.629131068
1986	346	Ginkgo	Ginkgo biloba	41.834422115	-87.629086446
1987	347	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834395257	-87.629091891
1988	348	Ginkgo	Ginkgo biloba	41.834350614	-87.629013942
1989	349	Ginkgo	Ginkgo biloba	41.834363393	-87.629034408
1990	350	Ginkgo	Ginkgo biloba	41.834256491	-87.629021744
1991	351	Ginkgo	Ginkgo biloba	41.834278064	-87.629019804
1992	352	Hornbeam-American	Carpinus caroliniana	41.83422343	-87.629121323
1993	353	Serviceberry	Amelanchier sp.	41.834195519	-87.629030921
1994	354	Redbud-Eastern	Cercis canadensis	41.834156633	-87.629036282
1995	355	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834160681	-87.629146482
1996	356	Hornbeam-American	Carpinus caroliniana	41.83405513	-87.629058899
1997	357	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834010583	-87.62912896
1998	358	Hornbeam-American	Carpinus caroliniana	41.833962715	-87.629109251
1999	359	Hornbeam-American	Carpinus caroliniana	41.83396578	-87.629054578
2000	360	Hawthorn	Crataegus sp.	41.833989479	-87.629029246
2001	361	Hawthorn	Crataegus sp.	41.834039232	-87.629046697
2002	362	Linden-American	Tilia americana	41.834244224	-87.628786753
2003	363	Linden-American	Tilia americana	41.834253525	-87.628703317
2004	364	Linden-American	Tilia americana	41.834322049	-87.628682384
2005	365	Linden-American	Tilia americana	41.834324679	-87.628779644
2006	366	Linden-American	Tilia americana	41.834411114	-87.628782892
2007	367	Linden-American	Tilia americana	41.834470714	-87.628803062
2008	368	Linden-American	Tilia americana	41.834493191	-87.628685681
2009	369	Linden-American	Tilia americana	41.834540308	-87.628724328
2010	370	Maple-Norway	Acer platanoides	41.834598621	-87.62862906
2011	371	Maple-Norway	Acer platanoides	41.834600386	-87.62853679
2012	372	Maple-Norway	Acer platanoides	41.83461269	-87.62844742
2013	373	Maple-Norway	Acer platanoides	41.834616886	-87.628365477
2014	374	Maple-Norway	Acer platanoides	41.834612611	-87.628255986
2015	376	Chokecherry-Common	Prunus virginiana	41.834610086	-87.628075716
2016	377	Linden-American	Tilia americana	41.834280479	-87.627886487
2017	379	Linden-American	Tilia americana	41.834370059	-87.628021918
2018	380	Linden-American	Tilia americana	41.834417446	-87.628004669
2019	381	Linden-American	Tilia americana	41.834348696	-87.62793605
2020	382	Linden-American	Tilia americana	41.834393534	-87.627909119
2021	383	Linden-American	Tilia americana	41.834474311	-87.62792368
2022	384	Linden-American	Tilia americana	41.834579048	-87.627933302
2023	385	Linden-American	Tilia americana	41.83455877	-87.62806724
2024	386	Linden-American	Tilia americana	41.834835845	-87.627950591
2025	387	Linden-American	Tilia americana	41.834948497	-87.627936677
2026	388	Linden-American	Tilia americana	41.835012682	-87.627906958
2027	389	Linden-American	Tilia americana	41.835094575	-87.627946079
2028	390	Linden-American	Tilia americana	41.83509629	-87.628043034
2029	391	Linden-American	Tilia americana	41.835009175	-87.628030481
2030	392	Linden-American	Tilia americana	41.834930502	-87.628041951
2031	393	Linden-American	Tilia americana	41.834824906	-87.628027624
2032	394	Linden-American	Tilia americana	41.835178627	-87.627923196
2033	395	Linden-American	Tilia americana	41.83521217	-87.628051492
2034	396	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835164574	-87.628290331
2035	397	Linden-American	Tilia americana	41.83529818	-87.628035494
2036	399	Serviceberry	Amelanchier sp.	41.835331483	-87.628027615
2037	400	Linden-American	Tilia americana	41.835401037	-87.627941815
2038	401	Ash-White	Fraxinus americana	41.834079318	-87.626760223
2039	402	Kentucky Coffeetree	Gymnocladus dioicus	41.834184545	-87.626768736
2040	403	Catalpa	Catalpa sp.	41.834219816	-87.626742054
2041	404	Ash-White	Fraxinus americana	41.834306608	-87.626760709
2042	405	Oak-Bur	Quercus macrocarpa	41.834358525	-87.626778599
2043	406	Hackberry	Celtis occidentalis	41.834438117	-87.626769093
2044	407	Ash-White	Fraxinus americana	41.834527558	-87.626771086
2045	408	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834624702	-87.626960196
2046	409	Planetree-London	Platanus x acerifolia	41.834634611	-87.627151155
2047	410	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834639046	-87.627258656
2048	411	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834618098	-87.627325285
2049	412	Hackberry	Celtis occidentalis	41.83456289	-87.627292437
2050	413	Hackberry	Celtis occidentalis	41.834495987	-87.627299121
2051	414	Redbud-Eastern	Cercis canadensis	41.834543509	-87.627321808
2052	415	Honeylocust-Common	Gleditsia triacanthos	41.834539845	-87.627379086
2053	416	Honeylocust-Common	Gleditsia triacanthos	41.83451647	-87.627452432
2054	417	Crabapple	Malus sp.	41.834298021	-87.62744957
2055	418	Crabapple	Malus sp.	41.83418151	-87.627444405
2056	419	Hawthorn	Crataegus sp.	41.834148823	-87.627404141
2057	420	Redbud-Eastern	Cercis canadensis	41.834109773	-87.627342192
2058	421	Redbud-Eastern	Cercis canadensis	41.834076412	-87.627354688
2059	422	Hawthorn	Crataegus sp.	41.83405036	-87.627358267
2060	423	Hawthorn	Crataegus sp.	41.834037826	-87.62730041
2061	424	Hawthorn	Crataegus sp.	41.834002735	-87.627323872
2062	425	Redbud-Eastern	Cercis canadensis	41.833920399	-87.627343971
2063	426	Hawthorn	Crataegus sp.	41.833802074	-87.627311215
2064	427	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833550871	-87.627567507
2065	428	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833673659	-87.627451788
2066	429	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83372672	-87.627731562
2067	430	Hawthorn	Crataegus sp.	41.833776493	-87.627671892
2068	431	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833880262	-87.627642713
2069	432	Hawthorn	Crataegus sp.	41.833871592	-87.627523912
2070	433	Hawthorn	Crataegus sp.	41.833874937	-87.627453482
2071	434	Linden-American	Tilia americana	41.833973968	-87.627767491
2072	435	Viburnum	Viburnum sp.	41.834057559	-87.62776866
2073	436	Hawthorn	Crataegus sp.	41.834115747	-87.627768275
2074	437	Hawthorn	Crataegus sp.	41.834330637	-87.627868811
2075	438	Viburnum	Viburnum sp.	41.834389666	-87.627771879
2076	439	Hawthorn	Crataegus sp.	41.834856383	-87.627452098
2077	440	Hawthorn	Crataegus sp.	41.835054636	-87.627440234
2078	441	Hawthorn	Crataegus sp.	41.835129038	-87.627448202
2079	442	Hawthorn	Crataegus sp.	41.835215805	-87.627455796
2080	443	Hawthorn	Crataegus sp.	41.835283506	-87.62746282
2081	444	Hawthorn	Crataegus sp.	41.835368735	-87.627387251
2082	445	Hawthorn	Crataegus sp.	41.835320173	-87.627386724
2083	446	Hawthorn	Crataegus sp.	41.835248363	-87.627394069
2084	447	Hawthorn	Crataegus sp.	41.835162705	-87.62738535
2085	448	Hawthorn	Crataegus sp.	41.835102974	-87.627394285
2086	449	Euonymus-BurningBush	Euonymus alatus	41.835041865	-87.627364715
2087	450	Maple-Freeman's	Acer x freemanii	41.83478574	-87.627368635
2088	451	Hawthorn	Crataegus sp.	41.834870586	-87.627345069
2089	453	Hawthorn	Crataegus sp.	41.834971097	-87.627261121
2090	454	Hawthorn	Crataegus sp.	41.83496908	-87.627064321
2091	455	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834875116	-87.626779583
2092	456	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834955769	-87.626793804
2093	457	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8349928	-87.62676222
2094	458	Hackberry	Celtis occidentalis	41.835020842	-87.626797167
2095	459	Oak-Bur	Quercus macrocarpa	41.835091353	-87.626809471
2096	460	Kentucky Coffeetree	Gymnocladus dioicus	41.835170941	-87.626753961
2097	461	Hackberry	Celtis occidentalis	41.835215543	-87.626797267
2098	462	Hackberry	Celtis occidentalis	41.835247735	-87.626823616
2099	463	Ash-Green	Fraxinus pennsylvanica	41.835261945	-87.626810971
2100	464	Linden-American	Tilia americana	41.835320743	-87.626796233
2101	465	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836173056	-87.626802608
2102	466	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836242648	-87.626820513
2103	467	Ash-White	Fraxinus americana	41.836346841	-87.626814314
2104	468	Catalpa	Catalpa sp.	41.836528773	-87.626798118
2105	469	Catalpa	Catalpa sp.	41.836539541	-87.626810529
2106	470	Oak-Bur	Quercus macrocarpa	41.83658261	-87.626785183
2107	471	Serviceberry	Amelanchier sp.	41.836083646	-87.627687468
2108	472	Redbud-Eastern	Cercis canadensis	41.836082282	-87.627424136
2109	473	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836069803	-87.627330912
2110	474	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836083049	-87.627241567
2111	475	Hackberry	Celtis occidentalis	41.835951203	-87.627285964
2112	476	Yellowwood	Cladrastis kentukea	41.835931737	-87.627622603
2113	477	Hawthorn	Crataegus sp.	41.836477415	-87.627245665
2114	478	Hawthorn	Crataegus sp.	41.836503674	-87.627196848
2115	479	Hawthorn	Crataegus sp.	41.836502651	-87.627120991
2116	480	Hawthorn	Crataegus sp.	41.836497394	-87.6270291
2117	481	Hawthorn	Crataegus sp.	41.83657334	-87.627078022
2118	482	Hawthorn	Crataegus sp.	41.836578226	-87.627218033
2119	483	Crabapple	Malus sp.	41.836599588	-87.627287785
2120	484	Redbud-Eastern	Cercis canadensis	41.836710887	-87.62740483
2121	485	Hawthorn	Crataegus sp.	41.836508986	-87.627739745
2122	486	Hawthorn	Crataegus sp.	41.83659218	-87.627735579
2123	487	Redbud-Eastern	Cercis canadensis	41.836713149	-87.627738382
2124	488	Redbud-Eastern	Cercis canadensis	41.836743813	-87.627689805
2125	489	Tuliptree	Liriodendron tulipifera	41.836752668	-87.627491069
2126	490	Tuliptree	Liriodendron tulipifera	41.836816813	-87.62743818
2127	491	Tuliptree	Liriodendron tulipifera	41.836839921	-87.627570389
2128	492	Plum-Purple Leaf	Prunus cerasifera	41.836911262	-87.627547104
2129	493	Crabapple	Malus sp.	41.836957013	-87.627526492
2130	494	Crabapple	Malus sp.	41.836988192	-87.627533385
2131	495	Hawthorn	Crataegus sp.	41.837372874	-87.627591136
2132	496	Hornbeam-European	Carpinus betulus	41.837047052	-87.627807878
2133	497	Hornbeam-European	Carpinus betulus	41.837074068	-87.627842106
2134	498	Hornbeam-European	Carpinus betulus	41.837139611	-87.627843484
2135	499	Hornbeam-European	Carpinus betulus	41.837141232	-87.627808879
2136	500	Catalpa	Catalpa sp.	41.837340919	-87.627831896
2137	601	Serviceberry	Amelanchier sp.	41.8355474	-87.628042773
2138	602	Maple-Norway	Acer platanoides	41.835607014	-87.627956955
2139	603	Maple-Norway	Acer platanoides	41.835771466	-87.627972288
2140	604	Maple-Red	Acer rubrum	41.835924589	-87.627981817
2141	605	Serviceberry	Amelanchier sp.	41.835922334	-87.628055408
2142	606	Serviceberry	Amelanchier sp.	41.835952041	-87.628053872
2143	607	Maple-Red	Acer rubrum	41.836162714	-87.627996655
2144	608	Hawthorn	Crataegus sp.	41.836337022	-87.62824008
2145	609	Hawthorn	Crataegus sp.	41.836344333	-87.628309687
2146	610	Hawthorn	Crataegus sp.	41.836344234	-87.628374295
2147	611	Hawthorn	Crataegus sp.	41.836337703	-87.628485805
2148	612	Hawthorn	Crataegus sp.	41.836338562	-87.628536742
2149	615	Maple-Norway	Acer platanoides	41.835653426	-87.628803253
2150	616	Linden-American	Tilia americana	41.835365441	-87.628777752
2151	617	Linden-American	Tilia americana	41.835329977	-87.628705221
2152	618	Linden-American	Tilia americana	41.835252629	-87.628720443
2153	619	Linden-American	Tilia americana	41.835160844	-87.628695788
2154	620	Linden-American	Tilia americana	41.83517392	-87.628808006
2155	621	Linden-American	Tilia americana	41.83509094	-87.628806252
2156	622	Linden-American	Tilia americana	41.835096881	-87.628704663
2157	623	Linden-American	Tilia americana	41.834999072	-87.628777142
2158	624	Linden-American	Tilia americana	41.834919535	-87.628781597
2159	625	Linden-American	Tilia americana	41.834833734	-87.628784606
2160	626	Linden-American	Tilia americana	41.834756037	-87.628799524
2161	627	Linden-American	Tilia americana	41.834926932	-87.628698997
2162	628	Linden-American	Tilia americana	41.834829987	-87.628689294
2163	629	Linden-American	Tilia americana	41.834741259	-87.628702068
2164	631	Redbud-Eastern	Cercis canadensis	41.834718104	-87.628114549
2165	632	Linden-Littleleaf	Tilia cordata	41.834720807	-87.628177903
2166	633	Linden-Littleleaf	Tilia cordata	41.834720393	-87.628266295
2167	634	Linden-Littleleaf	Tilia cordata	41.834707445	-87.628440499
2168	635	Maple-Sugar	Acer saccharum	41.83470526	-87.628533304
2169	636	Linden-Littleleaf	Tilia cordata	41.834703358	-87.628633928
2170	637	Ginkgo	Ginkgo biloba	41.834579954	-87.629117249
2171	638	Ginkgo	Ginkgo biloba	41.834591668	-87.62906064
2172	639	Ginkgo	Ginkgo biloba	41.834692638	-87.629337952
2173	640	Ginkgo	Ginkgo biloba	41.834683724	-87.629273212
2174	641	Ginkgo	Ginkgo biloba	41.834685866	-87.629092729
2175	643	Walnut-Black	Juglans nigra	41.835470809	-87.629050327
2176	644	Walnut-Black	Juglans nigra	41.835578123	-87.629054888
2177	645	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836436826	-87.629197912
2178	646	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836453056	-87.629063331
2179	647	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836539709	-87.629051959
2180	648	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836638755	-87.629021873
2181	650	Cherry-Flowering	Prunus serrulata	41.836898213	-87.62903727
2182	651	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836972993	-87.629026198
2183	652	Hawthorn	Crataegus sp.	41.837071874	-87.629051916
2184	653	Hawthorn	Crataegus sp.	41.837209135	-87.629052786
2185	654	Hawthorn	Crataegus sp.	41.83724133	-87.62904858
2186	655	Hawthorn	Crataegus sp.	41.837321783	-87.629054573
2187	656	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837545029	-87.629067408
2188	657	Tuliptree	Liriodendron tulipifera	41.837199154	-87.628766786
2189	658	Serviceberry	Amelanchier sp.	41.837193339	-87.628663446
2190	659	Tuliptree	Liriodendron tulipifera	41.837078693	-87.628715915
2191	660	Serviceberry	Amelanchier sp.	41.837003545	-87.62867
2192	661	Hornbeam-American	Carpinus caroliniana	41.837008861	-87.628736093
2193	662	Oak-Swamp White	Quercus bicolor	41.836929766	-87.628694928
2194	663	Serviceberry	Amelanchier sp.	41.836926922	-87.628737365
2195	664	Serviceberry	Amelanchier sp.	41.836896634	-87.628756277
2196	665	Serviceberry	Amelanchier sp.	41.836784446	-87.628766648
2197	666	Hornbeam-American	Carpinus caroliniana	41.836747069	-87.628760683
2198	667	Serviceberry	Amelanchier sp.	41.836711623	-87.628771285
2199	668	Serviceberry	Amelanchier sp.	41.83668506	-87.628762931
2200	669	Oak-Swamp White	Quercus bicolor	41.836604073	-87.628750491
2201	670	Tuliptree	Liriodendron tulipifera	41.836523421	-87.628695058
2202	671	Hornbeam-American	Carpinus caroliniana	41.836461685	-87.628665632
2203	672	Tuliptree	Liriodendron tulipifera	41.836433732	-87.628730542
2204	674	Elm-Siberian	Ulmus pumila	41.837714377	-87.627987136
2205	675	Elm-Siberian	Ulmus pumila	41.837647968	-87.628030572
2206	676	Elm-Siberian	Ulmus pumila	41.837529681	-87.627975735
2207	677	Serviceberry	Amelanchier sp.	41.837490218	-87.627985368
2208	678	Serviceberry	Amelanchier sp.	41.83745565	-87.628020464
2209	679	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837420063	-87.62800529
2210	680	Tree of Heaven	Ailanthus altissima	41.8373726	-87.627990019
2211	681	Sweetgum-Common	Liquidambar styraciflua	41.837352698	-87.628106214
2212	682	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837413521	-87.628159308
2213	683	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837460766	-87.628090677
2214	684	Maple-Silver	Acer saccharinum	41.837450093	-87.628251623
2215	685	Maple-Silver	Acer saccharinum	41.837476133	-87.628338974
2216	686	Hawthorn	Crataegus sp.	41.837326642	-87.628278322
2217	687	Sweetgum-Common	Liquidambar styraciflua	41.83737715	-87.628364285
2218	688	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837410696	-87.628573464
2219	690	Oak-Swamp White	Quercus bicolor	41.837289034	-87.628704463
2220	691	Maple-Sugar	Acer saccharum	41.837372494	-87.628759625
2221	692	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837497323	-87.628794828
2222	693	Tree of Heaven	Ailanthus altissima	41.838001607	-87.628631847
2223	694	Mulberry-Red	Morus rubra	41.838032464	-87.628639342
2224	695	Mulberry-Red	Morus rubra	41.838026266	-87.628621251
2225	696	Mulberry-Red	Morus rubra	41.838080784	-87.628613605
2226	697	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838160269	-87.628614374
2227	698	Mulberry-Red	Morus rubra	41.838155827	-87.628524939
2228	699	Hawthorn	Crataegus sp.	41.838110132	-87.628561911
2229	700	Hawthorn	Crataegus sp.	41.838010631	-87.628513399
2230	701	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83473428	-87.62754492
2231	702	Kentucky Coffeetree	Gymnocladus dioicus	41.83471147	-87.62749798
2232	703	Kentucky Coffeetree	Gymnocladus dioicus	41.834726832	-87.627355231
2233	704	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834725338	-87.627145722
2234	705	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834725597	-87.62697735
2235	706	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834729659	-87.62689178
2236	707	Hawthorn	Crataegus sp.	41.83486323	-87.62690678
2237	710	Hackberry	Celtis occidentalis	41.834982873	-87.626986095
2238	712	Maple-Red	Acer rubrum	41.8355465	-87.62686267
2239	713	Ash-Green	Fraxinus pennsylvanica	41.83546522	-87.62678827
2240	714	Kentucky Coffeetree	Gymnocladus dioicus	41.83551372	-87.62674702
2241	715	Ash-Green	Fraxinus pennsylvanica	41.83562855	-87.6268242
2242	716	Catalpa-Northern	Catalpa speciosa	41.83572862	-87.62681875
2243	717	Ash-Green	Fraxinus pennsylvanica	41.83581852	-87.62682275
2244	718	Oak-Shingle	Quercus imbricaria	41.83585107	-87.6267743
2245	719	Ash-Green	Fraxinus pennsylvanica	41.835952	-87.62657871
2246	720	Hawthorn	Crataegus sp.	41.83593217	-87.62688433
2247	721	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83593727	-87.62698827
2248	722	Serviceberry	Amelanchier sp.	41.83607638	-87.62696627
2249	723	Ginkgo	Ginkgo biloba	41.83609218	-87.62693715
2250	724	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83636073	-87.62696597
2251	726	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836348949	-87.627491102
2252	727	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836347774	-87.627722675
2253	728	Maple-Silver	Acer saccharinum	41.836260042	-87.627806603
2254	729	Catalpa-Northern	Catalpa speciosa	41.836089125	-87.627785464
2255	730	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835952115	-87.627414798
2256	731	Walnut-Black	Juglans nigra	41.8358628	-87.62750718
2257	732	Hawthorn	Crataegus sp.	41.835580223	-87.627508932
2258	734	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835817991	-87.62779327
2259	735	Hawthorn	Crataegus sp.	41.83590812	-87.62772625
2260	736	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83651019	-87.62727943
2261	737	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83655255	-87.62698647
2262	738	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83663204	-87.62696825
2263	739	Hackberry	Celtis occidentalis	41.83646365	-87.62780712
2264	740	Kentucky Coffeetree	Gymnocladus dioicus	41.83656581	-87.62782342
2265	741	Kentucky Coffeetree	Gymnocladus dioicus	41.836659848	-87.627762312
2266	742	Kentucky Coffeetree	Gymnocladus dioicus	41.836760168	-87.627799249
2267	743	Maple-Silver	Acer saccharinum	41.83666884	-87.62755047
2268	744	Elm-Siberian	Ulmus pumila	41.836971256	-87.62780548
2269	745	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837112304	-87.62775586
2270	746	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83714853	-87.62767287
2271	747	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83717019	-87.62757295
2272	748	Maple-Freeman's	Acer x freemanii	41.83722495	-87.627776666
2273	749	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83732255	-87.62753946
2274	750	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83761348	-87.62759758
2275	751	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83758119	-87.62774056
2276	752	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83770666	-87.62776195
2277	753	Catalpa-Northern	Catalpa speciosa	41.837731188	-87.627056893
2278	754	Kentucky Coffeetree	Gymnocladus dioicus	41.83741439	-87.62688747
2279	755	Tuliptree	Liriodendron tulipifera	41.8372607	-87.62690501
2280	756	Kentucky Coffeetree	Gymnocladus dioicus	41.837069178	-87.626916029
2281	757	Tuliptree	Liriodendron tulipifera	41.83697124	-87.62694432
2282	758	Maple-Red	Acer rubrum	41.83677013	-87.62688508
2283	759	Hackberry	Celtis occidentalis	41.83670084	-87.62682916
2284	760	Hackberry	Celtis occidentalis	41.83671094	-87.62681977
2285	761	Ash-Green	Fraxinus pennsylvanica	41.83675587	-87.6268543
2286	762	Kentucky Coffeetree	Gymnocladus dioicus	41.83700041	-87.62692639
2287	763	Catalpa-Northern	Catalpa speciosa	41.83684648	-87.62684902
2288	764	Ginkgo	Ginkgo biloba	41.83693746	-87.62692848
2289	765	Plum-Purple Leaf	Prunus cerasifera	41.83704548	-87.62685355
2290	766	Elm-American	Ulmus americana	41.83740526	-87.62679756
2291	767	Ash-Green	Fraxinus pennsylvanica	41.83747433	-87.62688346
2292	768	Ash-Green	Fraxinus pennsylvanica	41.83760697	-87.62686366
2293	769	Ash-Green	Fraxinus pennsylvanica	41.83775398	-87.62688515
2294	770	Ash-Green	Fraxinus pennsylvanica	41.83780203	-87.62685647
2295	771	Catalpa-Northern	Catalpa speciosa	41.83783283	-87.62688616
2296	772	Catalpa-Northern	Catalpa speciosa	41.83791101	-87.62690171
2297	773	Oak-Shingle	Quercus imbricaria	41.837979086	-87.626824551
2298	774	Ash-Green	Fraxinus pennsylvanica	41.838024993	-87.626849539
2299	775	Ash-Green	Fraxinus pennsylvanica	41.83814018	-87.626854809
2300	776	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838176132	-87.626977836
2301	777	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83818117	-87.62725548
2302	778	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8381921	-87.62740475
2303	779	Hornbeam-American	Carpinus caroliniana	41.838122797	-87.62778436
2304	780	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83849242	-87.62802643
2305	781	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83862068	-87.62805705
2306	782	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83871163	-87.62804963
2307	783	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83876942	-87.62805603
2308	784	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83879715	-87.6280553
2309	785	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83885898	-87.62806703
2310	786	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83886993	-87.62799217
2311	787	Maple-Silver	Acer saccharinum	41.838926	-87.62787213
2312	788	Hawthorn	Crataegus sp.	41.83894802	-87.62781155
2313	789	Hawthorn	Crataegus sp.	41.83894727	-87.62779613
2314	790	Maple-Silver	Acer saccharinum	41.83911912	-87.627915
2315	791	Maple-Silver	Acer saccharinum	41.839137	-87.62797322
2316	792	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83908742	-87.62798733
2317	793	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83904268	-87.62799833
2318	794	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8390272	-87.62797415
2319	795	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8390187	-87.62800238
2320	796	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83898337	-87.6280072
2321	797	Sycamore-American	Platanus occidentalis	41.83932922	-87.62756625
2322	798	Walnut-Black	Juglans nigra	41.83926697	-87.6275403
2323	799	Walnut-Black	Juglans nigra	41.83918333	-87.62754322
2324	800	Walnut-Black	Juglans nigra	41.83918658	-87.62748042
2325	801	Kentucky Coffeetree	Gymnocladus dioicus	41.837445844	-87.627844958
2326	802	Hawthorn	Crataegus sp.	41.837510045	-87.627733807
2327	804	Hackberry	Celtis occidentalis	41.837418109	-87.62758007
2328	805	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83710833	-87.626797478
2329	806	Catalpa	Catalpa sp.	41.837221367	-87.626834146
2330	807	Catalpa	Catalpa sp.	41.837241086	-87.626801922
2331	808	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837346082	-87.626827321
2332	809	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837415134	-87.626823657
2333	810	Oak-Bur	Quercus macrocarpa	41.837530205	-87.626820415
2334	811	Ash-White	Fraxinus americana	41.838219945	-87.627119259
2335	813	Ash-White	Fraxinus americana	41.838217787	-87.627570613
2336	814	Ash-White	Fraxinus americana	41.838221189	-87.627765829
2337	815	Tuliptree	Liriodendron tulipifera	41.838379478	-87.629371704
2338	816	Tuliptree	Liriodendron tulipifera	41.838362224	-87.629267281
2339	817	Tuliptree	Liriodendron tulipifera	41.838366926	-87.62917075
2340	818	Tuliptree	Liriodendron tulipifera	41.838369262	-87.629059977
2341	819	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838518946	-87.627856361
2342	820	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838413205	-87.627787603
2343	821	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838457578	-87.627680125
2344	822	Ash-White	Fraxinus americana	41.838406829	-87.627523712
2345	823	Hawthorn	Crataegus sp.	41.838508518	-87.627592366
2346	824	Euonymus-BurningBush	Euonymus alatus	41.838557824	-87.627523241
2347	825	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838540876	-87.627460861
2348	826	Hawthorn	Crataegus sp.	41.838545109	-87.627332601
2349	827	Hawthorn	Crataegus sp.	41.838537472	-87.627277514
2350	828	Hackberry	Celtis occidentalis	41.838513623	-87.627232682
2351	830	Ash-White	Fraxinus americana	41.838429468	-87.627168076
2352	831	Hackberry	Celtis occidentalis	41.838401327	-87.62709156
2353	832	Ash-White	Fraxinus americana	41.838442019	-87.626938621
2354	833	Hawthorn	Crataegus sp.	41.838565554	-87.627097964
2355	834	Hawthorn	Crataegus sp.	41.838571831	-87.627066544
2356	835	Walnut-Black	Juglans nigra	41.83917103	-87.62739883
2357	836	Hackberry	Celtis occidentalis	41.83936472	-87.6272729
2358	837	Redbud-Eastern	Cercis canadensis	41.83936702	-87.62723202
2359	838	Walnut-Black	Juglans nigra	41.83920928	-87.62723188
2360	839	Walnut-Black	Juglans nigra	41.83918633	-87.62719588
2361	840	Walnut-Black	Juglans nigra	41.83916688	-87.62710723
2362	841	Hawthorn	Crataegus sp.	41.838549139	-87.626985685
2363	842	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838677056	-87.626879044
2364	843	Catalpa-Northern	Catalpa speciosa	41.838707743	-87.626874864
2365	844	Oak-Shingle	Quercus imbricaria	41.838737215	-87.6268451
2366	845	Oak-Shingle	Quercus imbricaria	41.839241307	-87.626847841
2367	846	Kentucky Coffeetree	Gymnocladus dioicus	41.839261177	-87.626911486
2368	847	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839317434	-87.626851587
2369	848	Ash-White	Fraxinus americana	41.839473155	-87.626974763
2370	849	Ash-White	Fraxinus americana	41.83944897	-87.627023315
2371	850	Mulberry-White	Morus alba	41.839486894	-87.627544031
2372	851	Mulberry-White	Morus alba	41.83947413	-87.627557926
2373	852	Maple-Silver	Acer saccharinum	41.839488346	-87.627669559
2374	853	Mulberry-White	Morus alba	41.839468851	-87.627693658
2375	854	Maple-Silver	Acer saccharinum	41.839490787	-87.627790476
2376	855	Mulberry-White	Morus alba	41.839477136	-87.627756311
2377	856	Elm	Ulmus sp.	41.839433649	-87.62776851
2378	857	Elm	Ulmus sp.	41.839431322	-87.627834291
2379	858	Honeylocust-Common	Gleditsia triacanthos	41.839467383	-87.627860452
2380	859	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839488958	-87.627888349
2381	860	Maple-Silver	Acer saccharinum	41.839473119	-87.628005134
2382	861	Mulberry-White	Morus alba	41.839452817	-87.628239593
2383	862	Ash-White	Fraxinus americana	41.838032193	-87.626493517
2384	863	Oak-Bur	Quercus macrocarpa	41.83795742	-87.626532754
2385	864	Ash-White	Fraxinus americana	41.837926888	-87.626485744
2386	865	Ash-White	Fraxinus americana	41.83783821	-87.626484609
2387	866	Elm	Ulmus sp.	41.837775568	-87.626480818
2388	867	Ash-White	Fraxinus americana	41.837718581	-87.626483167
2389	868	Oak-Shingle	Quercus imbricaria	41.837489371	-87.626522735
2390	869	Oak-Bur	Quercus macrocarpa	41.837449953	-87.626471575
2391	870	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837417557	-87.626511228
2392	871	Oak-Shingle	Quercus imbricaria	41.83730904	-87.626472453
2393	872	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837255612	-87.626467388
2394	873	Catalpa-Northern	Catalpa speciosa	41.837207534	-87.626454637
2395	874	Catalpa-Northern	Catalpa speciosa	41.837076689	-87.626513091
2396	875	Catalpa-Northern	Catalpa speciosa	41.836889082	-87.626503837
2397	876	Oak-Shingle	Quercus imbricaria	41.83669882	-87.626448376
2398	877	Oak-Shingle	Quercus imbricaria	41.836357895	-87.626335995
2399	878	Locust-Black	Robinia pseudoacacia	41.835895271	-87.626292382
2400	880	Locust-Black	Robinia pseudoacacia	41.835900078	-87.626351246
2401	881	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835658101	-87.626338294
2402	882	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835603715	-87.626331613
2403	883	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835548283	-87.626329295
2404	884	Tuliptree	Liriodendron tulipifera	41.835006227	-87.626328597
2405	885	Tuliptree	Liriodendron tulipifera	41.835013179	-87.626208487
2406	886	Kentucky Coffeetree	Gymnocladus dioicus	41.834941639	-87.626193882
2407	887	Kentucky Coffeetree	Gymnocladus dioicus	41.834975205	-87.626274583
2408	888	Ash-White	Fraxinus americana	41.834901382	-87.626324852
2409	889	Ash-White	Fraxinus americana	41.834858002	-87.626311621
2410	890	Tuliptree	Liriodendron tulipifera	41.834887892	-87.626196003
2411	891	Catalpa-Northern	Catalpa speciosa	41.834824327	-87.626202627
2412	892	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834828194	-87.62615093
2413	893	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834785401	-87.626085202
2414	894	Hawthorn	Crataegus sp.	41.834545072	-87.626131866
2415	895	Hawthorn	Crataegus sp.	41.834551375	-87.626172713
2416	896	Hawthorn	Crataegus sp.	41.834547417	-87.626211722
2417	897	Hawthorn	Crataegus sp.	41.834542595	-87.626249299
2418	898	Hawthorn	Crataegus sp.	41.834537298	-87.626301477
2419	899	Common Baldcypress	Taxodium distichum	41.834501887	-87.626163042
2420	900	Common Baldcypress	Taxodium distichum	41.834496761	-87.626207195
2421	901	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837842041	-87.628311915
2422	902	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837954392	-87.628221849
2423	903	Crabapple	Malus sp.	41.837907375	-87.628069629
2424	904	Elm-American	Ulmus americana	41.838045566	-87.628175479
2425	905	Crabapple	Malus sp.	41.838122025	-87.628161713
2426	906	Crabapple	Malus sp.	41.838162397	-87.628227929
2427	907	Redbud-Eastern	Cercis canadensis	41.838170133	-87.628136684
2428	908	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838180237	-87.628017258
2429	909	Ash-Green	Fraxinus pennsylvanica	41.838567651	-87.626500021
2430	910	Ash-Green	Fraxinus pennsylvanica	41.838662392	-87.626502845
2431	911	Ash-Green	Fraxinus pennsylvanica	41.83876625	-87.626505084
2432	912	Oak-Shingle	Quercus imbricaria	41.838779321	-87.626551709
2433	913	Ash-Green	Fraxinus pennsylvanica	41.838848099	-87.626518655
2434	914	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838882082	-87.626545922
2435	915	Hackberry	Celtis occidentalis	41.838946348	-87.626558861
2436	916	Ash-Green	Fraxinus pennsylvanica	41.838945711	-87.626511068
2437	917	Ash-Green	Fraxinus pennsylvanica	41.839053781	-87.626524567
2438	918	Oak-Bur	Quercus macrocarpa	41.839091483	-87.626565735
2439	919	Ash-Green	Fraxinus pennsylvanica	41.839129297	-87.626556475
2440	920	Ash-Green	Fraxinus pennsylvanica	41.83923318	-87.626512207
2441	921	Ash-Green	Fraxinus pennsylvanica	41.839312362	-87.626523214
2442	922	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839359103	-87.626518864
2443	923	Ash-Green	Fraxinus pennsylvanica	41.839726075	-87.626526882
2444	924	Ash-Green	Fraxinus pennsylvanica	41.839940897	-87.626530527
2445	925	Linden-American	Tilia americana	41.840016263	-87.626535913
2446	926	Ash-Green	Fraxinus pennsylvanica	41.840168791	-87.626537289
2447	927	Ash-Green	Fraxinus pennsylvanica	41.840269375	-87.626543162
2448	928	Ash-Green	Fraxinus pennsylvanica	41.840386909	-87.626514265
2449	929	Ash-Green	Fraxinus pennsylvanica	41.840489746	-87.626550169
2450	930	Ash-Green	Fraxinus pennsylvanica	41.840599751	-87.626547891
2451	931	Ash-Green	Fraxinus pennsylvanica	41.840699145	-87.62655672
2452	932	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83963271	-87.626387789
2453	933	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839617521	-87.626214579
2454	934	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839491262	-87.626398478
2455	935	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839490345	-87.62614463
2456	936	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839511862	-87.625876625
2457	938	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839513363	-87.625600101
2458	939	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839496816	-87.625420147
2459	940	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839492405	-87.625261997
2460	941	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839626507	-87.625120142
2461	942	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839702086	-87.625096125
2462	943	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839813249	-87.625068715
2463	944	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839907621	-87.625094395
2464	945	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840041443	-87.62509666
2465	946	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840148255	-87.625115379
2466	947	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840256434	-87.625090749
2467	948	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840363316	-87.625101097
2468	949	Hackberry	Celtis occidentalis	41.840457226	-87.625112525
2469	950	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840595631	-87.625113687
2470	951	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840696414	-87.625082067
2471	952	Hawthorn	Crataegus sp.	41.839164	-87.625832459
2472	953	Hawthorn	Crataegus sp.	41.838865567	-87.625840142
2473	954	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83855962	-87.625838145
2474	955	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838494272	-87.625830688
2475	956	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838443404	-87.62584349
2476	957	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838414365	-87.625786718
2477	958	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838450239	-87.625681199
2478	959	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838548826	-87.625727928
2479	960	Hornbeam-American	Carpinus caroliniana	41.838495778	-87.625572927
2480	961	Hornbeam-American	Carpinus caroliniana	41.838473339	-87.625454383
2481	962	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838435135	-87.625321124
2482	963	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838460173	-87.625248081
2483	964	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838564001	-87.625266473
2484	965	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838565519	-87.625230881
2485	966	Crabapple	Malus sp.	41.83887567	-87.625331331
2486	967	Crabapple	Malus sp.	41.839154485	-87.62532643
2487	968	Crabapple	Malus sp.	41.839142994	-87.625340764
2488	969	Tuliptree	Liriodendron tulipifera	41.839217786	-87.625277312
2489	970	Tuliptree	Liriodendron tulipifera	41.839337005	-87.625295478
2490	971	Maple-Silver	Acer saccharinum	41.839457485	-87.625586614
2491	972	Maple-Silver	Acer saccharinum	41.839441543	-87.625510142
2492	973	Maple-Silver	Acer saccharinum	41.839465355	-87.6253926
2493	974	Hackberry	Celtis occidentalis	41.839638627	-87.62494794
2494	975	Hackberry	Celtis occidentalis	41.839716307	-87.624852926
2495	976	Hackberry	Celtis occidentalis	41.839616522	-87.623700425
2496	977	Hackberry	Celtis occidentalis	41.839667511	-87.62380191
2497	978	Tuliptree	Liriodendron tulipifera	41.8384832	-87.624983997
2498	979	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838454508	-87.624865513
2499	980	Redbud-Eastern	Cercis canadensis	41.838476404	-87.624757551
2500	981	Hornbeam-American	Carpinus caroliniana	41.838499751	-87.624593674
2501	982	Hawthorn	Crataegus sp.	41.838457192	-87.624532016
2502	983	Hornbeam-American	Carpinus caroliniana	41.838469997	-87.624391923
2503	984	Redbud-Eastern	Cercis canadensis	41.838459095	-87.624175639
2504	986	Hawthorn	Crataegus sp.	41.838472072	-87.624026388
2505	987	Redbud-Eastern	Cercis canadensis	41.838472685	-87.623931493
2506	988	Hawthorn	Crataegus sp.	41.838499277	-87.623870894
2507	989	Catalpa-Northern	Catalpa speciosa	41.838458519	-87.623810153
2508	990	Catalpa-Northern	Catalpa speciosa	41.838498225	-87.623757849
2509	991	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838474647	-87.623655977
2510	992	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.840078604	-87.623592597
2511	993	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839985869	-87.623607871
2512	994	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83987074	-87.623585529
2513	995	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839775286	-87.623589488
2514	996	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839366842	-87.623572931
2515	997	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839251602	-87.623581416
2516	998	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839153952	-87.623575159
2517	999	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.839017222	-87.623575704
2518	1000	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838838292	-87.623557815
2519	1001	Ash-Green	Fraxinus pennsylvanica	41.83858648	-87.62690338
2520	1002	Ash-Green	Fraxinus pennsylvanica	41.83897983	-87.62690392
2521	1003	Ash-Green	Fraxinus pennsylvanica	41.8390727	-87.62691277
2522	1004	Ash-Green	Fraxinus pennsylvanica	41.83919797	-87.6269041
2523	1005	Ash-Green	Fraxinus pennsylvanica	41.83938532	-87.62688035
2524	1006	Ash-Green	Fraxinus pennsylvanica	41.83945285	-87.62698118
2525	1007	Elm-Siberian	Ulmus pumila	41.83944478	-87.62704922
2526	1008	Elm-Siberian	Ulmus pumila	41.83945822	-87.62717017
2527	1009	Elm-Siberian	Ulmus pumila	41.83945592	-87.6272413
2528	1010	Elm-Siberian	Ulmus pumila	41.83946075	-87.62729325
2529	1011	Elm-Siberian	Ulmus pumila	41.83941828	-87.62744215
2530	1012	Mulberry-White	Morus alba	41.83947955	-87.62756823
2531	1013	Maple-Silver	Acer saccharinum	41.8394292	-87.6280113
2532	1014	Elm-Siberian	Ulmus pumila	41.8394531	-87.6280549
2533	1015	Elm-Siberian	Ulmus pumila	41.83945072	-87.62825188
2534	1016	Elm-Siberian	Ulmus pumila	41.8394514	-87.62880082
2535	1017	Elm-Siberian	Ulmus pumila	41.83943447	-87.62867107
2536	1018	Elm-Siberian	Ulmus pumila	41.83944388	-87.62856288
2537	1019	Hackberry	Celtis occidentalis	41.83948757	-87.62853112
2538	1020	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83948332	-87.62852332
2539	1021	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83950067	-87.62841942
2540	1022	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83948492	-87.6283977
2541	1023	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83945282	-87.62836697
2542	1024	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83946857	-87.62832867
2543	1025	Elm-Siberian	Ulmus pumila	41.83756892	-87.62649245
2544	1026	Elm-Siberian	Ulmus pumila	41.83751385	-87.6264955
2545	1027	Ash-Green	Fraxinus pennsylvanica	41.83740102	-87.62648567
2546	1028	Ash-Green	Fraxinus pennsylvanica	41.83718478	-87.62648988
2547	1029	Ash-Green	Fraxinus pennsylvanica	41.83708442	-87.62645668
2548	1030	Ash-Green	Fraxinus pennsylvanica	41.83696402	-87.62647417
2549	1031	Ash-Green	Fraxinus pennsylvanica	41.8368582	-87.62646327
2550	1032	Ash-Green	Fraxinus pennsylvanica	41.83674542	-87.6264608
2551	1033	Ash-Green	Fraxinus pennsylvanica	41.83665578	-87.62645777
2552	1034	Ash-Green	Fraxinus pennsylvanica	41.83654448	-87.62646655
2553	1035	Oak-Swamp White	Quercus bicolor	41.83655938	-87.6265146
2554	1036	Hackberry	Celtis occidentalis	41.83657482	-87.6264636
2555	1037	Hackberry	Celtis occidentalis	41.83665322	-87.6265185
2556	1038	Ash-Green	Fraxinus pennsylvanica	41.83633157	-87.62644255
2557	1039	Ash-Green	Fraxinus pennsylvanica	41.83625715	-87.62642592
2558	1040	Ash-Green	Fraxinus pennsylvanica	41.8362058	-87.62643593
2559	1041	Ash-Green	Fraxinus pennsylvanica	41.836124	-87.6264704
2560	1042	Ash-Green	Fraxinus pennsylvanica	41.83611618	-87.62644217
2561	1043	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83585325	-87.62644198
2562	1044	Ash-Green	Fraxinus pennsylvanica	41.835706877	-87.626401634
2563	1045	Ash-Green	Fraxinus pennsylvanica	41.83560495	-87.62642735
2564	1046	Locust-Black	Robinia pseudoacacia	41.83556175	-87.626449
2565	1047	Ash-Green	Fraxinus pennsylvanica	41.8354286	-87.62645268
2566	1048	Ash-Green	Fraxinus pennsylvanica	41.83531963	-87.62643405
2567	1050	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8351067	-87.6264225
2568	1053	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83490463	-87.62642213
2569	1055	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834600738	-87.626087731
2570	1056	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83452232	-87.62640605
2571	1057	Hackberry	Celtis occidentalis	41.834474825	-87.626403124
2572	1058	Oak-Northern Red	Quercus rubra	41.834427772	-87.626395656
2573	1059	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834330992	-87.626436864
2574	1060	Ash-Green	Fraxinus pennsylvanica	41.83428395	-87.62641172
2575	1061	Ash-Green	Fraxinus pennsylvanica	41.834176659	-87.62639099
2576	1062	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83411533	-87.6264154
2577	1063	Ash-Green	Fraxinus pennsylvanica	41.834063467	-87.626389975
2578	1064	Catalpa-Northern	Catalpa speciosa	41.83397467	-87.6263939
2579	1065	Oak-Bur	Quercus macrocarpa	41.83393673	-87.62639442
2580	1066	Catalpa-Northern	Catalpa speciosa	41.83385488	-87.62638072
2581	1067	Catalpa-Northern	Catalpa speciosa	41.83379033	-87.62636788
2582	1068	Elm-Slippery	Ulmus rubra	41.8337511	-87.62639872
2583	1069	Elm-American	Ulmus americana	41.83364068	-87.6264243
2584	1070	Ash-Green	Fraxinus pennsylvanica	41.83357457	-87.62638243
2585	1071	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8334626	-87.62637817
2586	1072	Oak-Bur	Quercus macrocarpa	41.833409047	-87.626418782
2587	1073	Ash-Green	Fraxinus pennsylvanica	41.833354295	-87.626382574
2588	1074	Hackberry	Celtis occidentalis	41.83329958	-87.626388
2589	1075	Kentucky Coffeetree	Gymnocladus dioicus	41.83322056	-87.626398564
2590	1076	Elm-American	Ulmus americana	41.833153794	-87.626383106
2591	1077	Ash-Green	Fraxinus pennsylvanica	41.833242475	-87.626413782
2592	1078	Ash-Green	Fraxinus pennsylvanica	41.832961105	-87.626363651
2593	1079	Oak-Bur	Quercus macrocarpa	41.832887559	-87.626383131
2594	1080	Ash-Green	Fraxinus pennsylvanica	41.832740813	-87.626359731
2595	1081	Ash-Green	Fraxinus pennsylvanica	41.83265188	-87.62637863
2596	1082	Ash-Green	Fraxinus pennsylvanica	41.8325661	-87.62638555
2597	1083	Ash-Green	Fraxinus pennsylvanica	41.83251003	-87.62641462
2598	1084	Ash-Green	Fraxinus pennsylvanica	41.83246405	-87.6263732
2599	1085	Oak-Bur	Quercus macrocarpa	41.832407776	-87.626379793
2600	1086	Ash-Green	Fraxinus pennsylvanica	41.83234443	-87.62635935
2601	1087	Ash-Green	Fraxinus pennsylvanica	41.832248421	-87.626349699
2602	1088	Oak-Bur	Quercus macrocarpa	41.83221325	-87.62641132
2603	1089	Catalpa-Northern	Catalpa speciosa	41.83214005	-87.62638022
2604	1090	Ash-Green	Fraxinus pennsylvanica	41.832187671	-87.6263388
2605	1091	Ash-Green	Fraxinus pennsylvanica	41.8320809	-87.62634533
2606	1092	Ash-Green	Fraxinus pennsylvanica	41.832048464	-87.626400094
2607	1093	Ash-Green	Fraxinus pennsylvanica	41.832046412	-87.626346891
2608	1094	Ash-Green	Fraxinus pennsylvanica	41.8319628	-87.62636508
2609	1095	Kentucky Coffeetree	Gymnocladus dioicus	41.83193678	-87.62640612
2610	1096	Ash-Green	Fraxinus pennsylvanica	41.831838274	-87.626346074
2611	1097	Ash-Green	Fraxinus pennsylvanica	41.831748162	-87.6263492
2612	1098	Catalpa-Northern	Catalpa speciosa	41.83169272	-87.62632992
2613	1099	Ash-Green	Fraxinus pennsylvanica	41.83163515	-87.62632957
2614	1100	Ash-Green	Fraxinus pennsylvanica	41.831556468	-87.626358943
2615	1101	Common Baldcypress	Taxodium distichum	41.834501275	-87.626257186
2616	1102	Common Baldcypress	Taxodium distichum	41.834487217	-87.626302773
2617	1103	Birch-Gray	Betula populifolia	41.834216843	-87.626282344
2618	1104	Birch-Gray	Betula populifolia	41.83421659	-87.626160839
2619	1105	Birch-Gray	Betula populifolia	41.834291429	-87.626156301
2620	1106	Birch-Gray	Betula populifolia	41.834293144	-87.626268605
2621	1107	Elm	Ulmus sp.	41.833965231	-87.626321922
2622	1108	Redbud-Eastern	Cercis canadensis	41.833963042	-87.626255809
2623	1109	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833960758	-87.626132065
2624	1110	Redbud-Eastern	Cercis canadensis	41.833964896	-87.626085328
2625	1111	Elm	Ulmus sp.	41.834003625	-87.626071136
2626	1112	Ash-White	Fraxinus americana	41.834022335	-87.626087623
2627	1113	Redbud-Eastern	Cercis canadensis	41.834028011	-87.626118311
2628	1114	Redbud-Eastern	Cercis canadensis	41.834028957	-87.626258153
2629	1115	Elm	Ulmus sp.	41.834031166	-87.626165762
2630	1116	Birch-Gray	Betula populifolia	41.833696521	-87.626268934
2631	1117	Birch-Gray	Betula populifolia	41.833701003	-87.626152951
2632	1118	Birch-Gray	Betula populifolia	41.833759682	-87.626145673
2633	1119	Birch-Gray	Betula populifolia	41.833759679	-87.626270587
2634	1120	Redbud-Eastern	Cercis canadensis	41.833435244	-87.626280089
2635	1121	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833430026	-87.626209476
2636	1122	Elm	Ulmus sp.	41.833423406	-87.626106146
2637	1123	Redbud-Eastern	Cercis canadensis	41.8334405	-87.626063318
2638	1124	Ash-White	Fraxinus americana	41.833480297	-87.626062224
2639	1125	Elm	Ulmus sp.	41.833512478	-87.626075542
2640	1126	Redbud-Eastern	Cercis canadensis	41.833514061	-87.626111946
2641	1127	Oak-Bur	Quercus macrocarpa	41.833533835	-87.626140359
2642	1128	Redbud-Eastern	Cercis canadensis	41.833508179	-87.626236304
2643	1129	Elm	Ulmus sp.	41.833476982	-87.626299234
2644	1130	Birch-Gray	Betula populifolia	41.833168349	-87.626184504
2645	1131	Birch-Gray	Betula populifolia	41.833169298	-87.626119606
2646	1132	Birch-Gray	Betula populifolia	41.833238892	-87.626192063
2647	1133	Birch-Gray	Betula populifolia	41.833240434	-87.626113069
2648	1134	Red Horsechestnut	Aesculus x carnea	41.832966926	-87.626240714
2649	1135	Dogwood-Flowering	Cornus florida	41.832957792	-87.626182024
2650	1136	Dogwood-Flowering	Cornus florida	41.83295401	-87.626130895
2651	1137	Kentucky Coffeetree	Gymnocladus dioicus	41.832964297	-87.626086758
2652	1138	Elm-American	Ulmus americana	41.833361473	-87.625819636
2653	1139	Elm-American	Ulmus americana	41.833394384	-87.625852479
2654	1140	Elm-American	Ulmus americana	41.833556924	-87.625854413
2655	1141	Hornbeam-European	Carpinus betulus	41.833555124	-87.625842506
2656	1142	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833750618	-87.625782699
2657	1143	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833743999	-87.62563042
2658	1144	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833780617	-87.625576551
2659	1145	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833793799	-87.625813311
2660	1146	Elm-American	Ulmus americana	41.83382244	-87.625827577
2661	1147	Elm-American	Ulmus americana	41.833910424	-87.625826287
2662	1148	Redbud-Eastern	Cercis canadensis	41.833922885	-87.625854324
2663	1149	Elm-American	Ulmus americana	41.8339486	-87.625842716
2664	1150	Elm-American	Ulmus americana	41.833983214	-87.625845676
2665	1151	Ash-Green	Fraxinus pennsylvanica	41.83150235	-87.62641958
2666	1152	Oak-Bur	Quercus macrocarpa	41.83148302	-87.62635948
2667	1153	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83144922	-87.626319717
2668	1154	Ash-Green	Fraxinus pennsylvanica	41.83141765	-87.62637878
2669	1155	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8313883	-87.62632967
2670	1156	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.831347993	-87.626321957
2671	1157	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83136614	-87.62638902
2672	1158	Ash-Green	Fraxinus pennsylvanica	41.83133541	-87.6263696
2673	1159	Hackberry	Celtis occidentalis	41.83129606	-87.62634956
2674	1160	Oak-Swamp White	Quercus bicolor	41.83128092	-87.6264178
2675	1161	Oak-Swamp White	Quercus bicolor	41.8312555	-87.62634398
2676	1162	Oak-Swamp White	Quercus bicolor	41.83123295	-87.62641308
2677	1163	Hackberry	Celtis occidentalis	41.83119499	-87.62639685
2678	1164	Ginkgo	Ginkgo biloba	41.831167557	-87.626209226
2679	1165	Ginkgo	Ginkgo biloba	41.83115479	-87.626128699
2680	1166	Ginkgo	Ginkgo biloba	41.83112594	-87.62601937
2681	1167	Elm-American	Ulmus americana	41.833998658	-87.625806925
2682	1168	Catalpa-Northern	Catalpa speciosa	41.834547945	-87.625480782
2683	1169	Ash-White	Fraxinus americana	41.834783965	-87.625733049
2684	1170	Kentucky Coffeetree	Gymnocladus dioicus	41.834838637	-87.625720884
2685	1171	Oak-Northern Red	Quercus rubra	41.834955775	-87.625737565
2686	1172	Kentucky Coffeetree	Gymnocladus dioicus	41.834877338	-87.625671097
2687	1173	Elm-American	Ulmus americana	41.834837228	-87.625609236
2688	1174	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834738967	-87.625378977
2689	1175	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834743139	-87.625293007
2690	1176	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834856277	-87.625138089
2691	1177	Kentucky Coffeetree	Gymnocladus dioicus	41.834910011	-87.625131592
2692	1178	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834975324	-87.625149702
2693	1179	Oak-Northern Red	Quercus rubra	41.835046455	-87.625139405
2694	1180	Kentucky Coffeetree	Gymnocladus dioicus	41.835109718	-87.625166415
2695	1181	Oak-Northern Red	Quercus rubra	41.835168502	-87.625152931
2696	1182	Spruce-Colorado Blue	Picea pungens	41.833128864	-87.624656218
2697	1183	Maple-Freeman's	Acer x freemanii	41.833159216	-87.624127093
2698	1184	Hawthorn	Crataegus sp.	41.833141004	-87.623968193
2699	1185	Hawthorn	Crataegus sp.	41.833170289	-87.623939173
2700	1186	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833178596	-87.623744822
2701	1187	Hawthorn	Crataegus sp.	41.833239856	-87.624017843
2702	1188	Hawthorn	Crataegus sp.	41.833239396	-87.624091679
2703	1189	Hawthorn	Crataegus sp.	41.833255193	-87.624122036
2704	1190	Walnut-Black	Juglans nigra	41.833250719	-87.624305572
2705	1191	Hawthorn	Crataegus sp.	41.83324411	-87.624384328
2706	1192	Hawthorn	Crataegus sp.	41.833286323	-87.624355813
2707	1193	Oak-Swamp White	Quercus bicolor	41.833286832	-87.624265882
2708	1194	Redbud-Eastern	Cercis canadensis	41.833285255	-87.62417367
2709	1195	Hawthorn	Crataegus sp.	41.833281777	-87.624106809
2710	1196	Hawthorn	Crataegus sp.	41.833257825	-87.624032194
2711	1197	Hawthorn	Crataegus sp.	41.833293939	-87.62400015
2712	1198	Hawthorn	Crataegus sp.	41.833349615	-87.623987879
2713	1200	Hawthorn	Crataegus sp.	41.83331465	-87.624056465
2714	1201	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83872656	-87.623562919
2715	1202	Elm-Siberian	Ulmus pumila	41.838204991	-87.625235889
2716	1204	Hawthorn	Crataegus sp.	41.838189742	-87.624986041
2717	1209	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83813878	-87.624823058
2718	1210	Hophornbeam- American	Ostrya virginiana	41.838157662	-87.624735052
2719	1211	Hophornbeam- American	Ostrya virginiana	41.838184766	-87.624709719
2720	1212	Hophornbeam- American	Ostrya virginiana	41.838190758	-87.62463696
2721	1213	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838215743	-87.624663192
2722	1214	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838124674	-87.624595484
2723	1215	Hawthorn	Crataegus sp.	41.838206807	-87.624541397
2724	1216	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838211511	-87.624486659
2725	1217	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835449102	-87.62714562
2726	1218	Redbud-Eastern	Cercis canadensis	41.836702987	-87.628217826
2727	1219	Serviceberry	Amelanchier sp.	41.83670243	-87.628190807
2728	1220	Serviceberry	Amelanchier sp.	41.836756965	-87.628214556
2729	1221	Hornbeam-American	Carpinus caroliniana	41.836764476	-87.628198304
2730	1222	Hornbeam-American	Carpinus caroliniana	41.837047127	-87.628382728
2731	1223	Redbud-Eastern	Cercis canadensis	41.837004866	-87.628364353
2732	1224	Serviceberry	Amelanchier sp.	41.837018588	-87.628415905
2733	1225	Maple-Amur	Acer ginnala	41.835910186	-87.625775671
2734	1226	Pine-Eastern White	Pinus strobus	41.835504582	-87.625515382
2735	1227	Maple-Freeman's	Acer x freemanii	41.835502743	-87.624097438
2736	1228	Elm-Siberian	Ulmus pumila	41.83560106	-87.624046093
2737	1229	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835604942	-87.623923978
2738	1230	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835640008	-87.623790806
2739	1231	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835525175	-87.623670478
2740	1232	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835529337	-87.623652935
2741	1233	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835446156	-87.623802824
2742	1234	Arborvitae-Eastern	Thuja occidentalis	41.83528827	-87.623576326
2743	1235	Arborvitae-Eastern	Thuja occidentalis	41.83528235	-87.623562013
2744	1236	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83510011	-87.623926035
2745	1237	Maple-Silver	Acer saccharinum	41.834847539	-87.623622173
2746	1238	Maple-Silver	Acer saccharinum	41.834820277	-87.623702714
2747	1239	Hawthorn	Crataegus sp.	41.834857121	-87.623831696
2748	1240	Hawthorn	Crataegus sp.	41.834872993	-87.623844143
2749	1241	Hawthorn	Crataegus sp.	41.834902213	-87.623897849
2750	1242	Hawthorn	Crataegus sp.	41.834826958	-87.623915357
2751	1243	Maple-Silver	Acer saccharinum	41.834802227	-87.624075649
2752	1244	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835917975	-87.623696713
2753	1245	Elm-American	Ulmus americana	41.838189986	-87.624371772
2754	1246	Serviceberry	Amelanchier sp.	41.83814121	-87.624275244
2755	1247	Kentucky Coffeetree	Gymnocladus dioicus	41.838209713	-87.624237331
2756	1248	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838204734	-87.624154688
2757	1249	Hawthorn	Crataegus sp.	41.838208279	-87.624062075
2758	1250	Elm-American	Ulmus americana	41.838140297	-87.624084862
2759	1251	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838185266	-87.623956793
2760	1252	Kentucky Coffeetree	Gymnocladus dioicus	41.838219248	-87.623902598
2761	1253	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838140617	-87.623858031
2762	1254	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838101895	-87.623871321
2763	1255	Hackberry	Celtis occidentalis	41.838029152	-87.623835684
2764	1256	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838066918	-87.623695359
2765	1257	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838043868	-87.623628339
2766	1258	Hackberry	Celtis occidentalis	41.837973748	-87.623772709
2767	1260	Elm-American	Ulmus americana	41.837867146	-87.623827412
2768	1261	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837911062	-87.623750115
2769	1262	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837953939	-87.623711487
2770	1263	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8379486	-87.623628651
2771	1264	Hawthorn	Crataegus sp.	41.837905477	-87.62363933
2772	1265	Hawthorn	Crataegus sp.	41.837841876	-87.623663521
2773	1266	Hawthorn	Crataegus sp.	41.837783065	-87.623772803
2774	1267	Elm-American	Ulmus americana	41.837751794	-87.623687896
2775	1268	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83773618	-87.623824415
2776	1269	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837721981	-87.623612524
2777	1271	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837655876	-87.623721449
2778	1272	Serviceberry	Amelanchier sp.	41.837689763	-87.623823643
2779	1273	Redbud-Eastern	Cercis canadensis	41.837713749	-87.624150363
2780	1274	Walnut-Black	Juglans nigra	41.837800377	-87.624193252
2781	1275	Hawthorn	Crataegus sp.	41.837838471	-87.624194313
2782	1276	Hawthorn	Crataegus sp.	41.837865761	-87.624181223
2783	1277	Hawthorn	Crataegus sp.	41.837937087	-87.624166015
2784	1278	Hackberry	Celtis occidentalis	41.837999045	-87.624083912
2785	1279	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838027408	-87.624167759
2786	1281	Redbud-Eastern	Cercis canadensis	41.837984887	-87.624210174
2787	1282	Redbud-Eastern	Cercis canadensis	41.838016692	-87.624249742
2788	1283	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838030453	-87.624311662
2789	1284	Redbud-Eastern	Cercis canadensis	41.837977362	-87.624330397
2790	1285	Redbud-Eastern	Cercis canadensis	41.838008296	-87.624360004
2791	1286	Redbud-Eastern	Cercis canadensis	41.837988499	-87.624403194
2792	1287	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838039181	-87.624439308
2793	1288	Kentucky Coffeetree	Gymnocladus dioicus	41.83802922	-87.624545487
2794	1289	Hawthorn	Crataegus sp.	41.83795254	-87.624445368
2795	1290	Dogwood-Pagoda	Cornus alternifolia	41.837825304	-87.624394942
2796	1291	Redbud-Eastern	Cercis canadensis	41.837765846	-87.624383873
2797	1292	Redbud-Eastern	Cercis canadensis	41.837723188	-87.624223281
2798	1293	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837705196	-87.62428044
2799	1294	Redbud-Eastern	Cercis canadensis	41.837703752	-87.624370762
2800	1295	Hawthorn	Crataegus sp.	41.837782293	-87.624509662
2801	1296	Redbud-Eastern	Cercis canadensis	41.837705177	-87.624512812
2802	1297	Redbud-Eastern	Cercis canadensis	41.837709347	-87.624579746
2803	1298	Redbud-Eastern	Cercis canadensis	41.837744457	-87.624583726
2804	1299	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837764724	-87.624768921
2805	1300	Redbud-Eastern	Cercis canadensis	41.83770912	-87.624780248
2806	1301	Catalpa-Northern	Catalpa speciosa	41.832904447	-87.625171973
2807	1302	Cherry-Black	Prunus serotina	41.83305586	-87.62513126
2808	1303	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83320333	-87.62512082
2809	1304	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83322666	-87.62512111
2810	1305	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83349504	-87.62512633
2811	1306	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83355605	-87.62511736
2812	1307	Cherry-Black	Prunus serotina	41.83360754	-87.62516116
2813	1308	Hawthorn	Crataegus sp.	41.83370292	-87.62515176
2814	1309	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83370511	-87.62516569
2815	1310	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83372554	-87.62539577
2816	1311	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83374964	-87.62535167
2817	1312	Cherry-Black	Prunus serotina	41.833947397	-87.62513299
2818	1313	Hawthorn	Crataegus sp.	41.83413733	-87.62511195
2819	1314	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834212	-87.625138
2820	1315	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83443344	-87.62514457
2821	1316	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83444387	-87.62519651
2822	1317	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83452507	-87.62519965
2823	1318	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83459753	-87.62521329
2824	1320	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834602944	-87.625786099
2825	1321	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83477697	-87.62552277
2826	1322	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83295635	-87.6244591
2827	1323	Hawthorn	Crataegus sp.	41.8329869	-87.62487317
2828	1324	Hawthorn	Crataegus sp.	41.83302657	-87.62496142
2829	1325	Elm-Siberian	Ulmus pumila	41.83307703	-87.62491862
2830	1326	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83312712	-87.6249807
2911	1411	Redbud-Eastern	Cercis canadensis	41.833613425	-87.62438332
2831	1327	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83318127	-87.62489723
2832	1328	Hawthorn	Crataegus sp.	41.83310658	-87.62480875
2833	1329	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83327398	-87.6248764
2834	1330	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83328823	-87.62498788
2835	1331	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83335257	-87.62494563
2836	1332	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83338122	-87.62498888
2837	1333	Elm-Siberian	Ulmus pumila	41.83341878	-87.62489265
2838	1334	Maple-Silver	Acer saccharinum	41.83356885	-87.62485175
2839	1335	Elm-Siberian	Ulmus pumila	41.8335781	-87.62491082
2840	1336	Maple-Silver	Acer saccharinum	41.83365067	-87.6248971
2841	1337	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83368967	-87.62493295
2842	1338	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83373232	-87.62492313
2843	1339	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83389257	-87.62498388
2844	1340	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83395872	-87.62495478
2845	1341	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83402425	-87.6249979
2846	1342	Hawthorn	Crataegus sp.	41.83399905	-87.62485757
2847	1343	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83412963	-87.62470747
2848	1344	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8341344	-87.6247585
2849	1345	Hawthorn	Crataegus sp.	41.83415653	-87.62472392
2850	1346	Hawthorn	Crataegus sp.	41.83414567	-87.6248523
2851	1347	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8341358	-87.62496245
2852	1348	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83416953	-87.62497165
2853	1349	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834304	-87.62492087
2854	1350	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83433857	-87.62498383
2855	1351	Hawthorn	Crataegus sp.	41.837766788	-87.624904484
2856	1352	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838028361	-87.624847181
2857	1353	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.838028195	-87.625008874
2858	1354	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83800318	-87.625037235
2859	1355	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83796002	-87.624998125
2860	1356	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837810994	-87.62501626
2861	1357	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837723862	-87.625070868
2862	1358	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837707806	-87.62496104
2863	1359	Elm-Siberian	Ulmus pumila	41.837897018	-87.625263159
2864	1360	Elm-Siberian	Ulmus pumila	41.837851514	-87.625239122
2865	1361	Walnut-Black	Juglans nigra	41.837755547	-87.625243459
2866	1362	Elm-American	Ulmus americana	41.8376212	-87.625229238
2867	1364	Elm-Siberian	Ulmus pumila	41.837341317	-87.625243371
2868	1365	Walnut-Black	Juglans nigra	41.837215424	-87.62521903
2869	1366	Walnut-Black	Juglans nigra	41.837131589	-87.625224456
2870	1367	Walnut-Black	Juglans nigra	41.837031717	-87.625213693
2871	1368	Walnut-Black	Juglans nigra	41.836927828	-87.625210779
2872	1369	Hawthorn	Crataegus sp.	41.836890703	-87.62506535
2873	1370	Maple-Red	Acer rubrum	41.836957241	-87.625109861
2874	1371	Maple-Red	Acer rubrum	41.836997104	-87.625068594
2875	1372	Maple-Sugar	Acer saccharum	41.837091911	-87.625108241
2876	1374	Crabapple	Malus sp.	41.837202485	-87.625099068
2877	1375	Crabapple	Malus sp.	41.837256767	-87.625108706
2878	1376	Oak-Northern Red	Quercus rubra	41.837315127	-87.625098799
2879	1377	Oak-Northern Red	Quercus rubra	41.837406836	-87.625096019
2880	1378	Oak-Northern Red	Quercus rubra	41.83749129	-87.625107737
2881	1379	Hawthorn	Crataegus sp.	41.837586661	-87.625110863
2882	1380	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837618788	-87.624983407
2883	1381	Redbud-Eastern	Cercis canadensis	41.837630283	-87.624836698
2884	1382	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837606975	-87.624803828
2885	1383	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837622023	-87.624644964
2886	1384	Walnut-Black	Juglans nigra	41.837617526	-87.624543123
2887	1385	Redbud-Eastern	Cercis canadensis	41.837638824	-87.624447954
2888	1386	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837590185	-87.624354535
2889	1387	Hawthorn	Crataegus sp.	41.837495313	-87.624371761
2890	1388	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837424002	-87.62444774
2891	1389	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83740863	-87.624523468
2892	1390	Hawthorn	Crataegus sp.	41.837314628	-87.624469834
2893	1391	Hawthorn	Crataegus sp.	41.837274021	-87.624478939
2894	1392	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837215009	-87.624494315
2895	1393	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837080347	-87.624500165
2896	1394	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836970386	-87.624337899
2897	1395	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836971098	-87.624428362
2898	1396	Walnut-Black	Juglans nigra	41.836962664	-87.624532511
2899	1397	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83692931	-87.624880691
2900	1398	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836953544	-87.624934259
2901	1400	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837565845	-87.624201083
2902	1401	Redbud-Eastern	Cercis canadensis	41.833336837	-87.624281007
2903	1402	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.833365537	-87.62437298
2904	1403	Tuliptree	Liriodendron tulipifera	41.833441598	-87.624327517
2905	1405	Maple-Silver	Acer saccharinum	41.833523266	-87.624520382
2906	1406	Tuliptree	Liriodendron tulipifera	41.833523384	-87.624368806
2907	1407	Walnut-Black	Juglans nigra	41.833532512	-87.62408408
2908	1408	Hawthorn	Crataegus sp.	41.833572272	-87.624053224
2909	1409	Hawthorn	Crataegus sp.	41.833578793	-87.624009428
2910	1410	Magnolia	Magnolia sp.	41.8336352	-87.624023533
2912	1412	Hawthorn	Crataegus sp.	41.833671341	-87.624395288
2913	1413	Hawthorn	Crataegus sp.	41.833758693	-87.624385101
2914	1414	Catalpa-Northern	Catalpa speciosa	41.833707137	-87.624345213
2915	1415	Oak-Swamp White	Quercus bicolor	41.833754221	-87.624077594
2916	1416	Hawthorn	Crataegus sp.	41.833814516	-87.624051192
2917	1417	Hawthorn	Crataegus sp.	41.833826021	-87.624017253
2918	1418	Hawthorn	Crataegus sp.	41.833819475	-87.62388748
2919	1419	Redbud-Eastern	Cercis canadensis	41.833808271	-87.623796141
2920	1420	Hawthorn	Crataegus sp.	41.834027219	-87.623576732
2921	1421	Hawthorn	Crataegus sp.	41.834037941	-87.623629857
2922	1422	Hawthorn	Crataegus sp.	41.834128524	-87.623642671
2923	1423	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834065492	-87.6238177
2924	1424	Hawthorn	Crataegus sp.	41.834022601	-87.623926924
2925	1425	Linden-Littleleaf	Tilia cordata	41.833955585	-87.624012318
2926	1426	Magnolia	Magnolia sp.	41.833919016	-87.624076307
2927	1427	Linden-Littleleaf	Tilia cordata	41.834010788	-87.624374203
2928	1428	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834043397	-87.624504087
2929	1429	Hawthorn	Crataegus sp.	41.833998954	-87.624578144
2930	1430	Hawthorn	Crataegus sp.	41.834028511	-87.624624461
2931	1431	Hawthorn	Crataegus sp.	41.834032739	-87.624662284
2932	1432	Hawthorn	Crataegus sp.	41.834120902	-87.623865291
2933	1433	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834135156	-87.62395224
2934	1434	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834175509	-87.624020581
2935	1435	Hawthorn	Crataegus sp.	41.834174334	-87.624093604
2936	1436	Hawthorn	Crataegus sp.	41.834145204	-87.624073178
2937	1437	Hawthorn	Crataegus sp.	41.834124546	-87.624094792
2938	1438	Pine-Austrian	Pinus nigra	41.834205749	-87.624301459
2939	1439	Pine-Austrian	Pinus nigra	41.834177932	-87.624402549
2940	1440	Maple-Sugar	Acer saccharum	41.834175201	-87.624490408
2941	1441	Maple-Sugar	Acer saccharum	41.834130162	-87.624524304
2942	1442	Pine-Austrian	Pinus nigra	41.834207368	-87.624516997
2943	1443	Hawthorn	Crataegus sp.	41.834170791	-87.624547509
2944	1444	Hawthorn	Crataegus sp.	41.83422736	-87.624583047
2945	1445	Hawthorn	Crataegus sp.	41.834196123	-87.624605514
2946	1446	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83446577	-87.62496475
2947	1447	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83452497	-87.62499957
2948	1448	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83462903	-87.62494532
2949	1449	Ash-Green	Fraxinus pennsylvanica	41.83462318	-87.62482758
2950	1450	Ash-Green	Fraxinus pennsylvanica	41.83461805	-87.62466492
2951	1451	Ash-Green	Fraxinus pennsylvanica	41.83464547	-87.624592
2952	1452	Locust-Black	Robinia pseudoacacia	41.83464543	-87.62452503
2953	1453	Ash-Green	Fraxinus pennsylvanica	41.8346266	-87.62438708
2954	1454	Ash-Green	Fraxinus pennsylvanica	41.83461333	-87.62422033
2955	1455	Ash-Green	Fraxinus pennsylvanica	41.83460932	-87.62415602
2956	1456	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834631867	-87.623698349
2957	1459	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83438028	-87.62346498
2958	1460	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83428332	-87.62346955
2959	1461	Zelkova-Japanese	Zelkova serrata	41.83420476	-87.623446798
2960	1462	Zelkova-Japanese	Zelkova serrata	41.833934923	-87.623448802
2961	1463	Ash-Green	Fraxinus pennsylvanica	41.83384403	-87.62347742
2962	1464	Ash-Green	Fraxinus pennsylvanica	41.833778525	-87.623445103
2963	1465	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83365822	-87.62347113
2964	1466	Ash-Green	Fraxinus pennsylvanica	41.833554172	-87.623436598
2965	1467	Hackberry	Celtis occidentalis	41.83347268	-87.62344492
2966	1468	Hackberry	Celtis occidentalis	41.833417314	-87.623434957
2967	1469	Hackberry	Celtis occidentalis	41.833364832	-87.623428542
2968	1474	Elm-American	Ulmus americana	41.832988017	-87.623421847
2969	1475	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.832884868	-87.623432775
2970	1476	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83296418	-87.6236174
2971	1477	Mulberry-White	Morus alba	41.8329199	-87.62352323
2972	1478	Pine-Austrian	Pinus nigra	41.834212415	-87.624653328
2973	1479	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834177096	-87.624689088
2974	1480	Hawthorn	Crataegus sp.	41.834229257	-87.624761866
2975	1481	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834401991	-87.624888615
2976	1482	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83456954	-87.624827658
2977	1483	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834563993	-87.624706897
2978	1484	Maple-Sugar	Acer saccharum	41.834584717	-87.624652819
2979	1485	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834499568	-87.624654768
2980	1486	Maple-Sugar	Acer saccharum	41.834541476	-87.624592179
2981	1487	Maple-Sugar	Acer saccharum	41.834516344	-87.624525567
2982	1488	Maple-Sugar	Acer saccharum	41.834591722	-87.624516915
2983	1489	Hawthorn	Crataegus sp.	41.834562197	-87.624463382
2984	1490	Hawthorn	Crataegus sp.	41.834582983	-87.624314976
2985	1491	Pine-Austrian	Pinus nigra	41.83446778	-87.624299775
2986	1492	Pine-Austrian	Pinus nigra	41.834446658	-87.624192647
2987	1493	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834587588	-87.624249302
2988	1494	Hawthorn	Crataegus sp.	41.834575182	-87.624270781
2989	1495	Hawthorn	Crataegus sp.	41.834576389	-87.624134927
2990	1496	Hawthorn	Crataegus sp.	41.834545549	-87.624115994
2991	1497	Pine-Austrian	Pinus nigra	41.834325399	-87.624112128
2992	1498	Redbud-Eastern	Cercis canadensis	41.835079858	-87.624656468
2993	1499	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835418201	-87.625180769
2994	1500	Maple-Freeman's	Acer x freemanii	41.835736546	-87.62514408
2995	1501	Buckeye-Ohio	Aesculus glabra	41.83433167	-87.6236042
2996	1502	Locust-Black	Robinia pseudoacacia	41.83455073	-87.6235869
2997	1503	Locust-Black	Robinia pseudoacacia	41.834546196	-87.623651197
2998	1504	Locust-Black	Robinia pseudoacacia	41.83459327	-87.62359055
2999	1505	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8342459	-87.62394688
3000	1506	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8342807	-87.62397928
3001	1507	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83433145	-87.62395062
3002	1508	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83442528	-87.62397163
3003	1509	Hawthorn	Crataegus sp.	41.83446468	-87.62396657
3004	1510	Hawthorn	Crataegus sp.	41.83448617	-87.6240306
3005	1511	Hawthorn	Crataegus sp.	41.83446835	-87.62406132
3006	1512	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83453078	-87.62400128
3007	1513	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83456223	-87.62406007
3008	1514	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83427047	-87.62405215
3009	1515	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835707079	-87.625245107
3010	1516	Maple-Norway	Acer platanoides	41.835786602	-87.625255066
3011	1517	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835863102	-87.625265652
3012	1518	Maple-Freeman's	Acer x freemanii	41.835928268	-87.625262112
3013	1519	Serviceberry	Amelanchier sp.	41.836151637	-87.625243269
3014	1520	Maple-Freeman's	Acer x freemanii	41.836194762	-87.625318132
3015	1521	Oak-Northern Red	Quercus rubra	41.8362221	-87.62523316
3016	1522	Hackberry	Celtis occidentalis	41.836260097	-87.625270147
3017	1523	Maple-Freeman's	Acer x freemanii	41.836381321	-87.625451412
3018	1524	Oak-Swamp White	Quercus bicolor	41.836429819	-87.625494044
3019	1525	Hawthorn	Crataegus sp.	41.836380061	-87.625145793
3020	1526	Maple-Norway	Acer platanoides	41.836281509	-87.625455625
3021	1527	Oak-Northern Red	Quercus rubra	41.83634639	-87.625553078
3022	1528	Serviceberry	Amelanchier sp.	41.836296019	-87.625671266
3023	1529	Oak-Swamp White	Quercus bicolor	41.836354264	-87.625829668
3024	1530	Oak-Northern Red	Quercus rubra	41.836415561	-87.625829766
3025	1531	Hackberry	Celtis occidentalis	41.836504063	-87.625485503
3026	1532	Hawthorn	Crataegus sp.	41.836544247	-87.625347524
3027	1533	Hackberry	Celtis occidentalis	41.836478547	-87.625217845
3028	1534	Elm-American	Ulmus americana	41.836579729	-87.625202986
3029	1535	Oak-Swamp White	Quercus bicolor	41.836581331	-87.625396077
3030	1536	Oak-Swamp White	Quercus bicolor	41.836569335	-87.625467338
3031	1537	Pine-Eastern White	Pinus strobus	41.836596842	-87.625562049
3032	1538	Redbud-Eastern	Cercis canadensis	41.836616772	-87.625473861
3033	1539	Redbud-Eastern	Cercis canadensis	41.836624401	-87.625391346
3034	1540	Pine-Eastern White	Pinus strobus	41.836626368	-87.625366635
3035	1541	Pine-Eastern White	Pinus strobus	41.836709224	-87.625332129
3036	1542	Redbud-Eastern	Cercis canadensis	41.836670096	-87.625283078
3037	1543	Hackberry	Celtis occidentalis	41.836670668	-87.625209994
3038	1544	Hawthorn	Crataegus sp.	41.836807517	-87.625451069
3039	1545	Maple-Norway	Acer platanoides	41.836782732	-87.62567067
3040	1547	Hawthorn	Crataegus sp.	41.836922682	-87.625876597
3041	1548	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83476893	-87.62365943
3042	1549	Ash-Green	Fraxinus pennsylvanica	41.83476058	-87.62379018
3043	1550	Ash-Green	Fraxinus pennsylvanica	41.83476612	-87.62402857
3044	1551	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83475118	-87.62416555
3045	1552	Linden-American	Tilia americana	41.83484092	-87.6242168
3046	1553	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83478027	-87.62446513
3047	1554	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83474985	-87.62489857
3048	1555	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83480047	-87.62484277
3049	1556	Hawthorn	Crataegus sp.	41.83481248	-87.62488355
3050	1557	Hawthorn	Crataegus sp.	41.83477908	-87.62475113
3051	1558	Hawthorn	Crataegus sp.	41.83478543	-87.62473492
3052	1559	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8347756	-87.62462417
3053	1560	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8347744	-87.62456673
3054	1561	Hawthorn	Crataegus sp.	41.837513412	-87.624178583
3055	1562	Dogwood-Pagoda	Cornus alternifolia	41.83752378	-87.624094075
3056	1563	Hackberry	Celtis occidentalis	41.837527164	-87.624079773
3057	1564	Dogwood-Pagoda	Cornus alternifolia	41.837575553	-87.624063585
3058	1565	Hawthorn	Crataegus sp.	41.83756095	-87.623937065
3059	1566	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8375304	-87.623808666
3060	1567	Redbud-Eastern	Cercis canadensis	41.837588461	-87.623730803
3061	1569	Hawthorn	Crataegus sp.	41.837531332	-87.623689181
3062	1570	Hawthorn	Crataegus sp.	41.837526034	-87.623621139
3063	1571	Hawthorn	Crataegus sp.	41.837481732	-87.623615749
3064	1572	Redbud-Eastern	Cercis canadensis	41.837357887	-87.623611574
3065	1573	Elm-American	Ulmus americana	41.837311982	-87.623752276
3066	1574	Elm-American	Ulmus americana	41.83734458	-87.623845582
3067	1575	Hawthorn	Crataegus sp.	41.837155805	-87.623759645
3068	1576	Hawthorn	Crataegus sp.	41.837032469	-87.623764691
3069	1578	Walnut-Black	Juglans nigra	41.836895544	-87.623789556
3070	1579	Walnut-Black	Juglans nigra	41.836802291	-87.623735863
3071	1580	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836871299	-87.624087544
3072	1581	Honeylocust-Common	Gleditsia triacanthos	41.836966567	-87.624137449
3073	1582	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837029555	-87.624080411
3074	1583	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.837227095	-87.624129405
3075	1584	Walnut-Black	Juglans nigra	41.837338959	-87.62412038
3076	1585	Walnut-Black	Juglans nigra	41.836664941	-87.623616495
3077	1586	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836587044	-87.62366715
3078	1587	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836490521	-87.623581412
3079	1588	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836443619	-87.623586958
3080	1589	Hawthorn	Crataegus sp.	41.836350213	-87.623757222
3081	1590	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836356638	-87.623930044
3082	1591	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836367861	-87.623982488
3083	1592	Walnut-Black	Juglans nigra	41.836299927	-87.624127435
3084	1593	Hawthorn	Crataegus sp.	41.836813127	-87.624489693
3085	1594	Serviceberry	Amelanchier sp.	41.83683423	-87.624381022
3086	1595	Serviceberry	Amelanchier sp.	41.836780321	-87.624388617
3087	1596	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836793452	-87.624365749
3088	1597	Walnut-Black	Juglans nigra	41.836686863	-87.624133011
3089	1598	Locust-Black	Robinia pseudoacacia	41.83613498	-87.62351055
3090	1599	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83604403	-87.62352458
3091	1600	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83597813	-87.62352253
3092	1601	Hawthorn	Crataegus sp.	41.83481305	-87.62448227
3093	1602	Hawthorn	Crataegus sp.	41.83478733	-87.6244382
3094	1603	Hawthorn	Crataegus sp.	41.83481557	-87.62445655
3095	1604	Hawthorn	Crataegus sp.	41.83488423	-87.62441673
3096	1605	Hawthorn	Crataegus sp.	41.8349151	-87.62447048
3097	1606	Maple-Norway	Acer platanoides	41.83496438	-87.62445577
3098	1607	Hawthorn	Crataegus sp.	41.835033902	-87.624456879
3099	1608	Hawthorn	Crataegus sp.	41.83504755	-87.62443602
3100	1609	Hawthorn	Crataegus sp.	41.83508542	-87.62448122
3101	1610	Hawthorn	Crataegus sp.	41.835055124	-87.624529965
3102	1611	Hawthorn	Crataegus sp.	41.83515025	-87.6245851
3103	1612	Hawthorn	Crataegus sp.	41.83514243	-87.6245095
3104	1613	Hawthorn	Crataegus sp.	41.83515808	-87.62446002
3105	1614	Birch-European White	Betula pendula	41.835110234	-87.624391386
3106	1615	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835115224	-87.624717904
3107	1616	Hawthorn	Crataegus sp.	41.8350835	-87.62476135
3108	1617	Hawthorn	Crataegus sp.	41.83495305	-87.6249403
3109	1618	Hawthorn	Crataegus sp.	41.83512002	-87.62490127
3110	1619	Hawthorn	Crataegus sp.	41.83513973	-87.62490149999999
3111	1620	Hawthorn	Crataegus sp.	41.83512347	-87.62485452
3112	1621	Crabapple	Malus sp.	41.83512033	-87.62478723
3113	1622	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83504528	-87.624901
3114	1623	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8351242	-87.62493992
3115	1624	Hawthorn	Crataegus sp.	41.83524432	-87.6248885
3116	1625	Hawthorn	Crataegus sp.	41.83525243	-87.6248473
3117	1626	Hawthorn	Crataegus sp.	41.8352769	-87.62489735
3118	1627	Hawthorn	Crataegus sp.	41.83526312	-87.62460245
3119	1628	Hawthorn	Crataegus sp.	41.83526138	-87.6246714
3120	1629	Hawthorn	Crataegus sp.	41.83538547	-87.62471527
3121	1630	Mulberry-White	Morus alba	41.835392952	-87.624653728
3122	1631	Arborvitae-Eastern	Thuja occidentalis	41.83534328	-87.62462927
3123	1632	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83538457	-87.62489607
3124	1633	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835565869	-87.624776011
3125	1634	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835555058	-87.624718704
3126	1635	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83561601	-87.624614314
3127	1636	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835664967	-87.62466717
3128	1637	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83563252	-87.62488943
3129	1638	Hawthorn	Crataegus sp.	41.83559032	-87.62490303
3130	1639	Hawthorn	Crataegus sp.	41.83560392	-87.62492512
3131	1640	Hawthorn	Crataegus sp.	41.83562548	-87.62497008
3132	1641	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83577712	-87.62494812
3133	1642	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835824742	-87.624772861
3134	1643	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835829923	-87.624602416
3135	1644	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835832268	-87.624506167
3136	1645	Hawthorn	Crataegus sp.	41.835842026	-87.624505895
3137	1646	Hawthorn	Crataegus sp.	41.83590572	-87.6244901
3138	1647	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83588583	-87.62450862
3139	1648	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835929049	-87.624734223
3140	1649	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835911519	-87.624809597
3141	1650	Hawthorn	Crataegus sp.	41.835922692	-87.624942065
3142	1651	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83673377	-87.62525695
3143	1652	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836807311	-87.625314607
3144	1653	Elm-American	Ulmus americana	41.836776318	-87.625096768
3145	1654	Tuliptree	Liriodendron tulipifera	41.836697327	-87.625058796
3146	1655	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836829459	-87.624908446
3147	1656	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836720922	-87.624953981
3148	1657	Hawthorn	Crataegus sp.	41.836587068	-87.624865595
3149	1658	Hawthorn	Crataegus sp.	41.836555058	-87.624875579
3150	1659	Hawthorn	Crataegus sp.	41.836591404	-87.624738001
3151	1660	Hawthorn	Crataegus sp.	41.836216415	-87.624903639
3152	1661	Elm-American	Ulmus americana	41.836287583	-87.624951162
3153	1662	Elm-American	Ulmus americana	41.836328958	-87.624939473
3154	1663	Elm-American	Ulmus americana	41.8362946	-87.624883037
3155	1664	Hawthorn	Crataegus sp.	41.83630475	-87.624825535
3156	1665	Hawthorn	Crataegus sp.	41.836332653	-87.624768213
3157	1666	Hawthorn	Crataegus sp.	41.836344845	-87.624731426
3158	1667	Elm-American	Ulmus americana	41.83609759	-87.624923351
3159	1668	Hawthorn	Crataegus sp.	41.83611667	-87.6247654
3160	1669	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8361585	-87.62451618
3161	1670	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83611878	-87.62445972
3162	1671	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83618193	-87.62444527
3163	1672	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83603108	-87.62437678
3164	1673	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83611648	-87.62413772
3165	1674	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83613298	-87.62407552
3166	1675	Hawthorn	Crataegus sp.	41.836326382	-87.62463308
3167	1676	Hawthorn	Crataegus sp.	41.836334153	-87.62457706
3168	1677	Hawthorn	Crataegus sp.	41.836154614	-87.624615851
3169	1678	Hawthorn	Crataegus sp.	41.836129117	-87.624581433
3170	1679	Hawthorn	Crataegus sp.	41.836113949	-87.624507889
3171	1680	Hawthorn	Crataegus sp.	41.836123725	-87.624297947
3172	1681	Oak-Northern Red	Quercus rubra	41.836452584	-87.624195463
3173	1682	Tuliptree	Liriodendron tulipifera	41.836430167	-87.624314732
3174	1683	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.836481246	-87.624470257
3175	1684	Hackberry	Celtis occidentalis	41.836481668	-87.6242787
3176	1685	Oak-Northern Red	Quercus rubra	41.836549112	-87.624201607
3177	1686	Catalpa-Northern	Catalpa speciosa	41.836587229	-87.62430171
3178	1687	Hackberry	Celtis occidentalis	41.836683497	-87.624314178
3179	1688	Elm	Ulmus sp.	41.836732554	-87.624276159
3180	1689	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8359235	-87.62351673
3181	1690	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83585507	-87.62352303
3182	1691	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83577405	-87.6234962
3183	1692	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8357076	-87.62349612
3184	1693	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.83558528	-87.62342557
3185	1694	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8356564	-87.62349202
3186	1695	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8355117	-87.62351032
3187	1696	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.835288651	-87.623480948
3188	1697	Ash-Green	Fraxinus pennsylvanica	41.835146409	-87.623468671
3189	1698	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834996916	-87.623504298
3190	1699	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834935692	-87.623490902
3191	1700	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.834852268	-87.623494551
3192	1701	Zelkova-Japanese	Zelkova serrata	41.83540038	-87.62349448
3193	1702	Tupelo-Black	Nyssa sylvatica	41.837635	-87.624176
3194	1703	Tupelo-Black	Nyssa sylvatica	41.8375473	-87.6243057
3195	1704	Tupelo-Black	Nyssa sylvatica	41.8374786	-87.624176
3196	1705	Tupelo-Black	Nyssa sylvatica	41.8374825	-87.6242981
3197	1706	Tupelo-Black	Nyssa sylvatica	41.8374481	-87.6242294
3198	1707	Tupelo-Black	Nyssa sylvatica	41.8373909	-87.6243286
3199	1708	Tupelo-Black	Nyssa sylvatica	41.8373947	-87.6242065
3200	1709	Tupelo-Black	Nyssa sylvatica	41.8373489	-87.6242981
3201	1711	Tupelo-Black	Nyssa sylvatica	41.837307	-87.6242905
3202	1712	Tupelo-Black	Nyssa sylvatica	41.8372498	-87.6243057
3203	1713	Tupelo-Black	Nyssa sylvatica	41.8372154	-87.6242905
3204	1714	Oak-Bur	Quercus macrocarpa	41.8363342	-87.6236115
3205	1715	Oak-Bur	Quercus macrocarpa	41.8362541	-87.6236038
3206	1716	Catalpa	Catalpa sp	41.8358688	-87.6278076
3207	1717	Hackberry	Celtis occidentalis	41.8357239	-87.6274719
3208	1718	Hackberry	Celtis occidentalis	41.8355713	-87.6276016
3209	1719	Hackberry	Celtis occidentalis	41.8355293	-87.6275558
3210	1720	Buckeye-Ohio	Aesculus glabra	41.8354492	-87.6275406
3211	1721	Hophornbeam-American	Ostrya virginiana	41.8354607	-87.6276245
3212	1722	Hophornbeam-American	Ostrya virginiana	41.8354454	-87.6276703
3213	1723	Hophornbeam-American	Ostrya virginiana	41.835453	-87.6277313
3214	1724	Kentucky Coffeetree	Gymnocladus dioicus	41.8355904	-87.6277924
3215	1725	Kentucky Coffeetree	Gymnocladus dioicus	41.8355446	-87.6277847
3216	1726	Kentucky Coffeetree	Gymnocladus dioicus	41.8355179	-87.6278076
3217	1727	Tuliptree	Liriodendron tulipifera	41.8354721	-87.6277542
3218	1728	Tuliptree	Liriodendron tulipifera	41.8354492	-87.6278152
3219	1729	Kentucky Coffeetree	Gymnocladus dioicus	41.8353043	-87.6277847
3220	1730	Kentucky Coffeetree	Gymnocladus dioicus	41.8352356	-87.6277847
3221	1731	Redbud-Eastern	Cercis canadensis	41.8345566	-87.6273422
3222	1732	Redbud-Eastern	Cercis canadensis	41.8345566	-87.6272812
3223	1733	Redbud-Eastern	Cercis canadensis	41.8345337	-87.6272736
3224	1734	Redbud-Eastern	Cercis canadensis	41.8344917	-87.627121
3225	1735	Redbud-Eastern	Cercis canadensis	41.8344994	-87.6270523
3226	1736	Redbud-Eastern	Cercis canadensis	41.8345032	-87.6269913
3227	1737	Redbud-Eastern	Cercis canadensis	41.8344421	-87.6269989
3228	1738	Redbud-Eastern	Cercis canadensis	41.8344193	-87.6270142
3229	1739	Redbud-Eastern	Cercis canadensis	41.8343964	-87.6270065
3230	1740	Redbud-Eastern	Cercis canadensis	41.8344078	-87.6270447
3231	1741	Serviceberry	Amelanchier sp	41.8320351	-87.6268692
3232	1742	Serviceberry	Amelanchier sp	41.832016	-87.6268539
3233	1743	Serviceberry	Amelanchier sp	41.8320045	-87.6268997
3234	1744	Serviceberry	Amelanchier sp	41.8320122	-87.6268921
3235	1745	Hornbeam-American	Carpinus caroliniana	41.8319969	-87.6269836
3236	1746	Hornbeam-American	Carpinus caroliniana	41.832016	-87.6270218
3237	1747	Tuliptree	Liriodendron tulipifera	41.8319893	-87.627037
3238	1748	Tuliptree	Liriodendron tulipifera	41.8320084	-87.6270752
3239	1749	Tuliptree	Liriodendron tulipifera	41.8319054	-87.6270142
3240	1750	Tuliptree	Liriodendron tulipifera	41.8319321	-87.6269379
3241	1751	Hornbeam-American	Carpinus caroliniana	41.8319283	-87.6268692
3242	1752	Hornbeam-American	Carpinus caroliniana	41.831913	-87.6269073
3243	1753	Hornbeam-American	Carpinus caroliniana	41.8319016	-87.6268692
3244	1754	Hornbeam-American	Carpinus caroliniana	41.8319054	-87.6268311
3245	1755	Tupelo-Black	Nyssa sylvatica	41.837332026	-87.624221733
3246	1756	Ash-Black	Fraxinus nigra	41.8376961	-87.6276474
3247	1757	Sycamore-American	Platanus occidentalis	41.8379784	-87.6280365
3248	1758	Fringetree-White	Chionanthus virginicus	41.8374634	-87.6275558
3249	1759	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8315659	-87.6280594
3250	1760	Juniper	Juniperus horizontalis	41.8381615	-87.6276016
3251	1761	Sycamore-American	Platanus occidentalis	41.8381729	-87.6277161
3252	1762	Honeylocust-Thornless Common	Gleditsia triacanthos var. inermis	41.8364182	-87.6248322
3253	1763	Sycamore-American	Platanus occidentalis	41.83321	-87.6283951
3254	1764	Honeylocust-Thornless Common	Gleditsia triacanthos	41.834248132	-87.628133077
3255	1765	Honeylocust-Thornless Common	Gleditsia triacanthos	41.8342438	-87.6280289
3256	1766	Honeylocust-Thornless Common	Gleditsia triacanthos	41.8344612	-87.6280365
3257	1767	Honeylocust-Thornless Common	Gleditsia triacanthos	41.8344383	-87.6280899
3258	1768	Rhododendron	Rhododendron sp	41.8353424	-87.628006
3259	1769	Rhododendron	Rhododendron sp	41.835610908	-87.628037292
3260	1770	Viburnum	Viburnum sp	41.8356628	-87.628067
3261	1771	Hackberry	Celtis occidentalis	41.8349762	-87.6273727
3262	1772	Hackberry	Celtis occidentalis	41.8349152	-87.626915
3263	1773	Hackberry	Celtis occidentalis	41.83498	-87.6268616
3264	1774	Lilac	Syringa sp	41.8350525	-87.6268768
3265	1775	Lilac	Syringa sp	41.8350449	-87.6273117
3266	1776	Blue Muffin Viburnum	Viburnum dentatum	41.8347511	-87.6289825
3267	1777	Blue Muffin Viburnum	Viburnum dentatum	41.8347702	-87.6289825
3268	1778	Black Lace Elderberry	Sambucus nigra	41.833404394	-87.623922288
3269	1779	Black Lace Elderberry	Sambucus nigra	41.8333778	-87.6239243
3270	1780	Black Lace Elderberry	Sambucus nigra	41.8333359	-87.6239243
3271	1781	Viburnum sp	Viburnum sp	41.8333168	-87.6236038
3272	1782	Viburnum sp	Viburnum sp	41.8333549	-87.6236038
3273	1783	Black Lace Elderberry	Sambucus nigra	41.8333092	-87.6239243
3274	1785	Poplar-Aspen	Populus tremuloides	41.833252	-87.6283951
3275	1786	Poplar-Aspen	Populus tremuloides	41.8332443	-87.6284409
3276	1787	Poplar-Aspen	Populus tremuloides	41.8332405	-87.6284866
3277	1788	Poplar-Aspen	Populus tremuloides	41.8332596	-87.6285095
3278	1789	Poplar-Aspen	Populus tremuloides	41.8332405	-87.6285172
3279	1790	Crabapple	Malus sp	41.8336372	-87.6279755
3280	1791	Crabapple	Malus sp	41.833592687	-87.627937971
3281	1792	Crabapple	Malus sp	41.83356766	-87.627982876
3282	1793	Crabapple	Malus sp	41.8335228	-87.6279678
3283	1794	Honeylocust-Thornless Common	Gleditsia triacanthos	41.8334274	-87.6279297
3284	1795	Honeylocust-Thornless Common	Gleditsia triacanthos	41.8333549	-87.6278915
3285	1796	Honeylocust-Thornless Common	Gleditsia triacanthos	41.8332825	-87.6279297
3286	1797	Shagbark Hickory	Carya ovata	41.836216	-87.6242065
3287	1798	Shagbark Hickory	Carya ovata	41.8361893	-87.6242828
3288	1800	Crabapple	Malus sp.	41.8365631	-87.6250839
3289	1801	Redbud-Eastern	Cercis canadensis	41.8347664	-87.6280594
3290	1802	Redbud-Eastern	Cercis canadensis	41.8347816	-87.6280975
3291	1803	Honeylocust-Thornless Common	Gleditisia tricanthos var. inermis	41.8348274	-87.6282349
3292	1804	Honeylocust-Thornless Common	Gleditisia tricanthos var. inermis	41.8349533	-87.6282883
3293	1805	Vernal Witchhazel	Hamamelis vernalis	41.8342285	-87.6235886
3294	1806	Vernal Witchhazel	Hamamelis vernalis	41.8340492	-87.6235428
\.


--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 221
-- Name: mission_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mission_log_log_id_seq', 11, true);


--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 219
-- Name: missions_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.missions_mission_id_seq', 3, true);


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 217
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_player_id_seq', 1, true);


--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 224
-- Name: tree_photos_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tree_photos_photo_id_seq', 1, true);


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 215
-- Name: trees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trees_id_seq', 3294, true);


--
-- TOC entry 3491 (class 2606 OID 17806)
-- Name: mission_log mission_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mission_log
    ADD CONSTRAINT mission_log_pkey PRIMARY KEY (log_id);


--
-- TOC entry 3489 (class 2606 OID 17796)
-- Name: missions missions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT missions_pkey PRIMARY KEY (mission_id);


--
-- TOC entry 3495 (class 2606 OID 17840)
-- Name: player_missions player_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_missions
    ADD CONSTRAINT player_missions_pkey PRIMARY KEY (player_id, mission_id);


--
-- TOC entry 3485 (class 2606 OID 17728)
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- TOC entry 3487 (class 2606 OID 17730)
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- TOC entry 3498 (class 2606 OID 17864)
-- Name: tree_photos tree_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tree_photos
    ADD CONSTRAINT tree_photos_pkey PRIMARY KEY (photo_id);


--
-- TOC entry 3483 (class 2606 OID 17707)
-- Name: trees trees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trees
    ADD CONSTRAINT trees_pkey PRIMARY KEY (id);


--
-- TOC entry 3493 (class 2606 OID 17818)
-- Name: mission_log unique_player_mission; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mission_log
    ADD CONSTRAINT unique_player_mission UNIQUE (player_id, mission_id);


--
-- TOC entry 3496 (class 1259 OID 17870)
-- Name: ix_tree_photos_tree_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_tree_photos_tree_id ON public.tree_photos USING btree (tree_id);


--
-- TOC entry 3499 (class 2606 OID 17812)
-- Name: mission_log mission_log_mission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mission_log
    ADD CONSTRAINT mission_log_mission_id_fkey FOREIGN KEY (mission_id) REFERENCES public.missions(mission_id);


--
-- TOC entry 3500 (class 2606 OID 17807)
-- Name: mission_log mission_log_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mission_log
    ADD CONSTRAINT mission_log_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- TOC entry 3501 (class 2606 OID 17846)
-- Name: player_missions player_missions_mission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_missions
    ADD CONSTRAINT player_missions_mission_id_fkey FOREIGN KEY (mission_id) REFERENCES public.missions(mission_id);


--
-- TOC entry 3502 (class 2606 OID 17841)
-- Name: player_missions player_missions_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_missions
    ADD CONSTRAINT player_missions_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- TOC entry 3503 (class 2606 OID 17865)
-- Name: tree_photos tree_photos_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tree_photos
    ADD CONSTRAINT tree_photos_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


-- Completed on 2026-05-20 15:06:36 CDT

--
-- PostgreSQL database dump complete
--

\unrestrict WdBKVihujhunyGa2IlavVElBxwSsShBel0qDPmoy6dKdJd36mUNnVUG1X3bZ78s


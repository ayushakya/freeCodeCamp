--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    no_of_guesses integer,
    secret_number integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_user_id_seq OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_user_id_seq OWNED BY public.players.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.players_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 7, 755);
INSERT INTO public.games VALUES (2, 1, 9, 751);
INSERT INTO public.games VALUES (3, 2, 942, 941);
INSERT INTO public.games VALUES (4, 3, 150, 149);
INSERT INTO public.games VALUES (5, 3, 780, 779);
INSERT INTO public.games VALUES (6, 2, 809, 806);
INSERT INTO public.games VALUES (7, 2, 303, 301);
INSERT INTO public.games VALUES (8, 2, 862, 861);
INSERT INTO public.games VALUES (9, 4, 821, 820);
INSERT INTO public.games VALUES (10, 4, 780, 779);
INSERT INTO public.games VALUES (11, 5, 326, 325);
INSERT INTO public.games VALUES (12, 5, 245, 244);
INSERT INTO public.games VALUES (13, 4, 602, 599);
INSERT INTO public.games VALUES (14, 4, 460, 458);
INSERT INTO public.games VALUES (15, 4, 187, 186);
INSERT INTO public.games VALUES (16, 6, 772, 771);
INSERT INTO public.games VALUES (17, 6, 950, 949);
INSERT INTO public.games VALUES (18, 7, 375, 374);
INSERT INTO public.games VALUES (19, 7, 143, 142);
INSERT INTO public.games VALUES (20, 6, 199, 196);
INSERT INTO public.games VALUES (21, 6, 534, 532);
INSERT INTO public.games VALUES (22, 6, 197, 196);
INSERT INTO public.games VALUES (23, 8, 464, 463);
INSERT INTO public.games VALUES (24, 8, 935, 934);
INSERT INTO public.games VALUES (25, 9, 976, 975);
INSERT INTO public.games VALUES (26, 9, 215, 214);
INSERT INTO public.games VALUES (27, 8, 304, 301);
INSERT INTO public.games VALUES (28, 8, 214, 212);
INSERT INTO public.games VALUES (29, 8, 87, 86);
INSERT INTO public.games VALUES (30, 10, 614, 613);
INSERT INTO public.games VALUES (31, 11, 129, 128);
INSERT INTO public.games VALUES (32, 11, 564, 563);
INSERT INTO public.games VALUES (33, 10, 190, 187);
INSERT INTO public.games VALUES (34, 10, 13, 11);
INSERT INTO public.games VALUES (35, 10, 315, 314);
INSERT INTO public.games VALUES (36, 12, 759, 758);
INSERT INTO public.games VALUES (37, 13, 859, 858);
INSERT INTO public.games VALUES (38, 13, 417, 416);
INSERT INTO public.games VALUES (39, 12, 322, 319);
INSERT INTO public.games VALUES (40, 12, 361, 359);
INSERT INTO public.games VALUES (41, 12, 221, 220);
INSERT INTO public.games VALUES (42, 14, 747, 746);
INSERT INTO public.games VALUES (43, 14, 872, 871);
INSERT INTO public.games VALUES (44, 15, 444, 443);
INSERT INTO public.games VALUES (45, 15, 742, 741);
INSERT INTO public.games VALUES (46, 14, 214, 211);
INSERT INTO public.games VALUES (47, 14, 69, 67);
INSERT INTO public.games VALUES (48, 14, 752, 751);
INSERT INTO public.games VALUES (49, 16, 83, 82);
INSERT INTO public.games VALUES (50, 17, 74, 73);
INSERT INTO public.games VALUES (51, 17, 331, 330);
INSERT INTO public.games VALUES (52, 16, 194, 191);
INSERT INTO public.games VALUES (53, 16, 90, 88);
INSERT INTO public.games VALUES (54, 16, 311, 310);
INSERT INTO public.games VALUES (55, 18, 941, 940);
INSERT INTO public.games VALUES (56, 18, 116, 115);
INSERT INTO public.games VALUES (57, 19, 983, 982);
INSERT INTO public.games VALUES (58, 19, 493, 492);
INSERT INTO public.games VALUES (59, 18, 937, 934);
INSERT INTO public.games VALUES (60, 18, 156, 154);
INSERT INTO public.games VALUES (61, 18, 17, 16);
INSERT INTO public.games VALUES (62, 20, 695, 694);
INSERT INTO public.games VALUES (63, 20, 43, 42);
INSERT INTO public.games VALUES (64, 21, 336, 335);
INSERT INTO public.games VALUES (65, 21, 308, 307);
INSERT INTO public.games VALUES (66, 20, 973, 970);
INSERT INTO public.games VALUES (67, 20, 941, 939);
INSERT INTO public.games VALUES (68, 20, 496, 495);
INSERT INTO public.games VALUES (69, 1, 13, 203);
INSERT INTO public.games VALUES (70, 22, 494, 493);
INSERT INTO public.games VALUES (71, 22, 815, 814);
INSERT INTO public.games VALUES (72, 23, 485, 484);
INSERT INTO public.games VALUES (73, 23, 800, 799);
INSERT INTO public.games VALUES (74, 22, 80, 77);
INSERT INTO public.games VALUES (75, 22, 641, 639);
INSERT INTO public.games VALUES (76, 22, 814, 813);
INSERT INTO public.games VALUES (77, 24, 693, 692);
INSERT INTO public.games VALUES (78, 24, 547, 546);
INSERT INTO public.games VALUES (79, 25, 725, 724);
INSERT INTO public.games VALUES (80, 25, 960, 959);
INSERT INTO public.games VALUES (81, 24, 218, 215);
INSERT INTO public.games VALUES (82, 24, 58, 56);
INSERT INTO public.games VALUES (83, 24, 15, 14);
INSERT INTO public.games VALUES (84, 26, 237, 236);
INSERT INTO public.games VALUES (85, 26, 715, 714);
INSERT INTO public.games VALUES (86, 27, 821, 820);
INSERT INTO public.games VALUES (87, 27, 64, 63);
INSERT INTO public.games VALUES (88, 26, 303, 300);
INSERT INTO public.games VALUES (89, 26, 381, 379);
INSERT INTO public.games VALUES (90, 26, 936, 935);
INSERT INTO public.games VALUES (91, 28, 893, 892);
INSERT INTO public.games VALUES (92, 28, 310, 309);
INSERT INTO public.games VALUES (93, 29, 635, 634);
INSERT INTO public.games VALUES (94, 29, 331, 330);
INSERT INTO public.games VALUES (95, 28, 610, 607);
INSERT INTO public.games VALUES (96, 28, 610, 608);
INSERT INTO public.games VALUES (97, 28, 868, 867);
INSERT INTO public.games VALUES (98, 30, 485, 484);
INSERT INTO public.games VALUES (99, 30, 361, 360);
INSERT INTO public.games VALUES (100, 31, 242, 241);
INSERT INTO public.games VALUES (101, 31, 382, 381);
INSERT INTO public.games VALUES (102, 30, 219, 216);
INSERT INTO public.games VALUES (103, 30, 392, 390);
INSERT INTO public.games VALUES (104, 30, 718, 717);
INSERT INTO public.games VALUES (105, 32, 614, 613);
INSERT INTO public.games VALUES (106, 32, 353, 352);
INSERT INTO public.games VALUES (107, 33, 221, 220);
INSERT INTO public.games VALUES (108, 33, 841, 840);
INSERT INTO public.games VALUES (109, 32, 384, 381);
INSERT INTO public.games VALUES (110, 32, 140, 138);
INSERT INTO public.games VALUES (111, 32, 812, 811);
INSERT INTO public.games VALUES (112, 34, 383, 382);
INSERT INTO public.games VALUES (113, 35, 538, 537);
INSERT INTO public.games VALUES (114, 35, 330, 329);
INSERT INTO public.games VALUES (115, 34, 984, 981);
INSERT INTO public.games VALUES (116, 34, 48, 46);
INSERT INTO public.games VALUES (117, 34, 545, 544);
INSERT INTO public.games VALUES (118, 36, 901, 900);
INSERT INTO public.games VALUES (119, 36, 438, 437);
INSERT INTO public.games VALUES (120, 37, 217, 216);
INSERT INTO public.games VALUES (121, 37, 76, 75);
INSERT INTO public.games VALUES (122, 36, 860, 857);
INSERT INTO public.games VALUES (123, 36, 741, 739);
INSERT INTO public.games VALUES (124, 36, 783, 782);
INSERT INTO public.games VALUES (125, 38, 827, 826);
INSERT INTO public.games VALUES (126, 39, 67, 66);
INSERT INTO public.games VALUES (127, 39, 482, 481);
INSERT INTO public.games VALUES (128, 38, 544, 541);
INSERT INTO public.games VALUES (129, 38, 127, 125);
INSERT INTO public.games VALUES (130, 38, 722, 721);
INSERT INTO public.games VALUES (131, 40, 731, 730);
INSERT INTO public.games VALUES (132, 40, 966, 965);
INSERT INTO public.games VALUES (133, 41, 759, 758);
INSERT INTO public.games VALUES (134, 41, 481, 480);
INSERT INTO public.games VALUES (135, 40, 480, 477);
INSERT INTO public.games VALUES (136, 40, 266, 264);
INSERT INTO public.games VALUES (137, 40, 922, 921);
INSERT INTO public.games VALUES (138, 42, 394, 393);
INSERT INTO public.games VALUES (139, 42, 573, 572);
INSERT INTO public.games VALUES (140, 43, 287, 286);
INSERT INTO public.games VALUES (141, 43, 601, 600);
INSERT INTO public.games VALUES (142, 42, 139, 136);
INSERT INTO public.games VALUES (143, 42, 206, 204);
INSERT INTO public.games VALUES (144, 42, 370, 369);
INSERT INTO public.games VALUES (145, 44, 203, 202);
INSERT INTO public.games VALUES (146, 44, 34, 33);
INSERT INTO public.games VALUES (147, 45, 372, 371);
INSERT INTO public.games VALUES (148, 45, 775, 774);
INSERT INTO public.games VALUES (149, 44, 98, 95);
INSERT INTO public.games VALUES (150, 44, 49, 47);
INSERT INTO public.games VALUES (151, 44, 923, 922);
INSERT INTO public.games VALUES (152, 46, 588, 587);
INSERT INTO public.games VALUES (153, 46, 682, 681);
INSERT INTO public.games VALUES (154, 47, 179, 178);
INSERT INTO public.games VALUES (155, 47, 899, 898);
INSERT INTO public.games VALUES (156, 46, 96, 93);
INSERT INTO public.games VALUES (157, 46, 215, 213);
INSERT INTO public.games VALUES (158, 46, 679, 678);
INSERT INTO public.games VALUES (159, 48, 924, 923);
INSERT INTO public.games VALUES (160, 48, 804, 803);
INSERT INTO public.games VALUES (161, 49, 67, 66);
INSERT INTO public.games VALUES (162, 48, 99, 96);
INSERT INTO public.games VALUES (163, 48, 225, 223);
INSERT INTO public.games VALUES (164, 48, 800, 799);
INSERT INTO public.games VALUES (165, 50, 337, 336);
INSERT INTO public.games VALUES (166, 51, 172, 171);
INSERT INTO public.games VALUES (167, 51, 613, 612);
INSERT INTO public.games VALUES (168, 50, 490, 487);
INSERT INTO public.games VALUES (169, 50, 77, 75);
INSERT INTO public.games VALUES (170, 50, 926, 925);
INSERT INTO public.games VALUES (171, 52, 342, 341);
INSERT INTO public.games VALUES (172, 52, 589, 588);
INSERT INTO public.games VALUES (173, 53, 239, 238);
INSERT INTO public.games VALUES (174, 53, 327, 326);
INSERT INTO public.games VALUES (175, 52, 224, 221);
INSERT INTO public.games VALUES (176, 52, 750, 748);
INSERT INTO public.games VALUES (177, 52, 391, 390);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (3, 'user_1686140003634', 2, 150);
INSERT INTO public.players VALUES (13, 'user_1686140202239', 2, 417);
INSERT INTO public.players VALUES (23, 'user_1686140466808', 2, 485);
INSERT INTO public.players VALUES (2, 'user_1686140003635', 4, 303);
INSERT INTO public.players VALUES (12, 'user_1686140202240', 4, 221);
INSERT INTO public.players VALUES (35, 'user_1686140674945', 2, 330);
INSERT INTO public.players VALUES (22, 'user_1686140466809', 5, 80);
INSERT INTO public.players VALUES (5, 'user_1686140072781', 2, 245);
INSERT INTO public.players VALUES (15, 'user_1686140213647', 2, 444);
INSERT INTO public.players VALUES (4, 'user_1686140072782', 5, 187);
INSERT INTO public.players VALUES (34, 'user_1686140674946', 4, 48);
INSERT INTO public.players VALUES (14, 'user_1686140213648', 5, 69);
INSERT INTO public.players VALUES (7, 'user_1686140081641', 2, 143);
INSERT INTO public.players VALUES (25, 'user_1686140477246', 2, 725);
INSERT INTO public.players VALUES (6, 'user_1686140081642', 5, 197);
INSERT INTO public.players VALUES (17, 'user_1686140221073', 2, 74);
INSERT INTO public.players VALUES (16, 'user_1686140221074', 4, 83);
INSERT INTO public.players VALUES (9, 'user_1686140153424', 2, 215);
INSERT INTO public.players VALUES (24, 'user_1686140477247', 5, 15);
INSERT INTO public.players VALUES (8, 'user_1686140153425', 5, 87);
INSERT INTO public.players VALUES (37, 'user_1686140685759', 2, 76);
INSERT INTO public.players VALUES (19, 'user_1686140242869', 2, 493);
INSERT INTO public.players VALUES (11, 'user_1686140164945', 2, 129);
INSERT INTO public.players VALUES (36, 'user_1686140685760', 5, 438);
INSERT INTO public.players VALUES (18, 'user_1686140242870', 5, 17);
INSERT INTO public.players VALUES (10, 'user_1686140164946', 4, 13);
INSERT INTO public.players VALUES (27, 'user_1686140641197', 2, 64);
INSERT INTO public.players VALUES (26, 'user_1686140641198', 5, 237);
INSERT INTO public.players VALUES (21, 'user_1686140264746', 2, 308);
INSERT INTO public.players VALUES (20, 'user_1686140264747', 5, 43);
INSERT INTO public.players VALUES (1, 'Ayush', 3, 7);
INSERT INTO public.players VALUES (39, 'user_1686140699660', 2, 67);
INSERT INTO public.players VALUES (29, 'user_1686140649217', 2, 331);
INSERT INTO public.players VALUES (28, 'user_1686140649218', 5, 310);
INSERT INTO public.players VALUES (38, 'user_1686140699661', 4, 127);
INSERT INTO public.players VALUES (31, 'user_1686140658099', 2, 242);
INSERT INTO public.players VALUES (30, 'user_1686140658100', 5, 219);
INSERT INTO public.players VALUES (33, 'user_1686140664647', 2, 221);
INSERT INTO public.players VALUES (32, 'user_1686140664648', 5, 140);
INSERT INTO public.players VALUES (41, 'user_1686140784291', 2, 481);
INSERT INTO public.players VALUES (47, 'user_1686140852567', 2, 179);
INSERT INTO public.players VALUES (40, 'user_1686140784292', 5, 266);
INSERT INTO public.players VALUES (46, 'user_1686140852568', 5, 96);
INSERT INTO public.players VALUES (43, 'user_1686140791543', 2, 287);
INSERT INTO public.players VALUES (42, 'user_1686140791544', 5, 139);
INSERT INTO public.players VALUES (49, 'user_1686140877492', 1, 67);
INSERT INTO public.players VALUES (48, 'user_1686140877493', 5, 99);
INSERT INTO public.players VALUES (45, 'user_1686140825126', 2, 372);
INSERT INTO public.players VALUES (44, 'user_1686140825127', 5, 34);
INSERT INTO public.players VALUES (51, 'user_1686140910838', 2, 172);
INSERT INTO public.players VALUES (50, 'user_1686140910839', 4, 77);
INSERT INTO public.players VALUES (53, 'user_1686140927816', 2, 239);
INSERT INTO public.players VALUES (52, 'user_1686140927817', 5, 224);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 177, true);


--
-- Name: players_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_user_id_seq', 53, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (user_id);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--


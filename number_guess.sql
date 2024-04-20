--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    username_id integer NOT NULL,
    guesses integer
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_username_id_seq OWNER TO freecodecamp;

--
-- Name: users_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_username_id_seq OWNED BY public.users.username_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN username_id SET DEFAULT nextval('public.users_username_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 6, 3);
INSERT INTO public.games VALUES (2, 6, 9);
INSERT INTO public.games VALUES (3, 9, 544);
INSERT INTO public.games VALUES (4, 10, 144);
INSERT INTO public.games VALUES (5, 9, 276);
INSERT INTO public.games VALUES (6, 9, 734);
INSERT INTO public.games VALUES (7, 9, 496);
INSERT INTO public.games VALUES (8, 11, 844);
INSERT INTO public.games VALUES (9, 12, 536);
INSERT INTO public.games VALUES (10, 11, 952);
INSERT INTO public.games VALUES (11, 11, 235);
INSERT INTO public.games VALUES (12, 11, 88);
INSERT INTO public.games VALUES (13, 13, 13);
INSERT INTO public.games VALUES (14, 14, 66);
INSERT INTO public.games VALUES (15, 13, 852);
INSERT INTO public.games VALUES (16, 13, 242);
INSERT INTO public.games VALUES (17, 13, 17);
INSERT INTO public.games VALUES (18, 15, 412);
INSERT INTO public.games VALUES (19, 16, 111);
INSERT INTO public.games VALUES (20, 15, 940);
INSERT INTO public.games VALUES (21, 15, 923);
INSERT INTO public.games VALUES (22, 15, 299);
INSERT INTO public.games VALUES (23, 17, 705);
INSERT INTO public.games VALUES (24, 18, 898);
INSERT INTO public.games VALUES (25, 17, 287);
INSERT INTO public.games VALUES (26, 17, 574);
INSERT INTO public.games VALUES (27, 17, 44);
INSERT INTO public.games VALUES (28, 19, 42);
INSERT INTO public.games VALUES (29, 20, 710);
INSERT INTO public.games VALUES (30, 19, 887);
INSERT INTO public.games VALUES (31, 19, 307);
INSERT INTO public.games VALUES (32, 19, 163);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (6, 'Imran');
INSERT INTO public.users VALUES (7, 'user_1713643191361');
INSERT INTO public.users VALUES (8, 'user_1713643191360');
INSERT INTO public.users VALUES (9, 'user_1713644618701');
INSERT INTO public.users VALUES (10, 'user_1713644618700');
INSERT INTO public.users VALUES (11, 'user_1713644750634');
INSERT INTO public.users VALUES (12, 'user_1713644750633');
INSERT INTO public.users VALUES (13, 'user_1713644766221');
INSERT INTO public.users VALUES (14, 'user_1713644766220');
INSERT INTO public.users VALUES (15, 'user_1713644768381');
INSERT INTO public.users VALUES (16, 'user_1713644768380');
INSERT INTO public.users VALUES (17, 'user_1713644996504');
INSERT INTO public.users VALUES (18, 'user_1713644996503');
INSERT INTO public.users VALUES (19, 'user_1713645005914');
INSERT INTO public.users VALUES (20, 'user_1713645005913');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: users_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_username_id_seq', 20, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username_id);


--
-- Name: games games_username_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_id_fkey FOREIGN KEY (username_id) REFERENCES public.users(username_id);


--
-- PostgreSQL database dump complete
--


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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    num_sun integer,
    estimated_life numeric,
    description text,
    is_active boolean,
    have_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_galaxy_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: log; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.log (
    log_id integer NOT NULL,
    name character varying(10) NOT NULL,
    code character varying(10) NOT NULL
);


ALTER TABLE public.log OWNER TO freecodecamp;

--
-- Name: log_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_id_seq OWNER TO freecodecamp;

--
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.log_id_seq OWNED BY public.log.log_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    radio integer,
    estimated_life numeric,
    description text,
    is_active boolean,
    have_life boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    radio integer,
    estimated_life numeric,
    description text,
    is_active boolean,
    have_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    radio integer,
    estimated_life numeric,
    description text,
    is_active boolean,
    have_life boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_star_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_star_seq OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_star_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_galaxy_seq'::regclass);


--
-- Name: log log_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.log ALTER COLUMN log_id SET DEFAULT nextval('public.log_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_moon_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_planet_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_star_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 1000, 1, 5000, 'Via Lactea', true, true);
INSERT INTO public.galaxy VALUES (2, 'Galaxia 1', 600, 14, 200, 'Galaxia1', false, false);
INSERT INTO public.galaxy VALUES (3, 'Galaxia 2', 100, 0, 0, 'Galaxia 2', false, false);
INSERT INTO public.galaxy VALUES (4, 'Galaxia 3', 6000, 2, 6000, 'Galaxia 3', true, true);
INSERT INTO public.galaxy VALUES (5, 'Galaxia 4', 1, 1, 10, 'Galaxia 4', true, true);
INSERT INTO public.galaxy VALUES (6, 'Galaxia 5', 50, 2, 100, 'Galaxia 5', true, false);


--
-- Data for Name: log; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.log VALUES (1, 'error', 'error');
INSERT INTO public.log VALUES (2, 'success', 'success');
INSERT INTO public.log VALUES (3, 'abort', 'abort');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 6000, 6000, 6000, 'Earth_Moon', true, true, 1);
INSERT INTO public.moon VALUES (2, 'Mars_Moon', 100, 400, 100, 'Mars_Moon', true, true, 2);
INSERT INTO public.moon VALUES (3, 'Venus_Moon', 100, 100, 100, 'Venus_Moon', true, false, 3);
INSERT INTO public.moon VALUES (4, 'Jupiter_Moon', 5000, 5000, 5000, 'Jupiter_Moon', true, false, 4);
INSERT INTO public.moon VALUES (5, 'Namek_Moon', 50, 100, 50, 'Namek_Moon', false, false, 5);
INSERT INTO public.moon VALUES (6, 'New Namek_moon', 400, 200, 400, 'New Namek_moon', true, true, 6);
INSERT INTO public.moon VALUES (7, 'Vegeta_Moon', 400, 100, 200, 'Vegeta_Moon', false, true, 7);
INSERT INTO public.moon VALUES (8, 'Asereje_moon', 100, 200, 100, 'Asereje_moon', false, false, 8);
INSERT INTO public.moon VALUES (9, 'Bowie_Moon', 20, 10, 30, 'Bowie_Moon', false, false, 9);
INSERT INTO public.moon VALUES (10, 'Ferek_Moon', 100, 200, 1000, 'Ferek_Moon', true, false, 10);
INSERT INTO public.moon VALUES (11, 'Memememe_Moon', 1, 1, 1, 'Memememe_Moon', true, false, 11);
INSERT INTO public.moon VALUES (12, 'Peperoni_Moon', 100, 200, 300, 'Peperoni_Moon', true, true, 12);
INSERT INTO public.moon VALUES (13, 'Mozzarella_MOon', 2, 2, 2, 'Mozzarella_Moon', true, true, 12);
INSERT INTO public.moon VALUES (14, 'Jija', 2, 3, 4, 'Jija', true, false, 7);
INSERT INTO public.moon VALUES (15, 'Pope', 2, 2, 2, 'Pope', false, true, 6);
INSERT INTO public.moon VALUES (16, 'Oo', 1, 1, 1, 'Oo', true, true, 6);
INSERT INTO public.moon VALUES (17, 'Quer', 40, 50, 40, 'Quer', false, false, 7);
INSERT INTO public.moon VALUES (18, 'Lopo', 10, 10, 10, 'Lopo', false, false, 6);
INSERT INTO public.moon VALUES (19, 'Ama', 1, 2, 3, 'Ama', false, true, 7);
INSERT INTO public.moon VALUES (20, 'Mamqa', 80, 8, 88, 'Mamqa', true, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6000, 6000, 6000, 'Earth', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 100, 400, 100, 'Mars', true, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 100, 100, 100, 'Venus', true, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 5000, 5000, 5000, 'Jupiter', true, false, 1);
INSERT INTO public.planet VALUES (5, 'Namek', 50, 100, 50, 'Namek', false, false, 2);
INSERT INTO public.planet VALUES (6, 'New Namek', 400, 200, 400, 'New Namek', true, true, 3);
INSERT INTO public.planet VALUES (7, 'Vegeta', 400, 100, 200, 'Vegeta', false, true, 5);
INSERT INTO public.planet VALUES (8, 'Asereje', 100, 200, 100, 'Asereje', false, false, 4);
INSERT INTO public.planet VALUES (9, 'Bowie', 20, 10, 30, 'Bowie', false, false, 6);
INSERT INTO public.planet VALUES (10, 'Ferek', 100, 200, 1000, 'Ferek', true, false, 6);
INSERT INTO public.planet VALUES (11, 'Memememe', 1, 1, 1, 'Memememe', true, false, 2);
INSERT INTO public.planet VALUES (12, 'Peperoni', 100, 200, 300, 'Peperoni', true, true, 4);
INSERT INTO public.planet VALUES (13, 'Mozzarella', 2, 2, 2, 'Mozzarella', true, true, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1000, 6000, 3000, 'Sun', true, false, 1);
INSERT INTO public.star VALUES (2, 'star1', 100, 333, 1212, 'star1', false, false, 2);
INSERT INTO public.star VALUES (3, 'star2', 300, 200, 50, 'star2', true, false, 2);
INSERT INTO public.star VALUES (4, 'star3', 100, 200, 300, 'star3', true, false, 3);
INSERT INTO public.star VALUES (5, 'star4', 100, 100, 100, 'star4', false, false, 4);
INSERT INTO public.star VALUES (6, 'star5', 400, 30, 100, 'star5', true, false, 5);


--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_galaxy_seq', 6, true);


--
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.log_id_seq', 3, true);


--
-- Name: moon_id_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_moon_seq', 20, true);


--
-- Name: planet_id_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_planet_seq', 13, true);


--
-- Name: star_id_star_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_star_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (name);


--
-- Name: log log_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY (log_id);


--
-- Name: log log_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_unique UNIQUE (code);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fkplanet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fkplanet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


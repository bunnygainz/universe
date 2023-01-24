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
    name character varying(50) NOT NULL,
    designation character varying(100),
    constellation character varying(50),
    name_meaning text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    name_meaning text,
    discovered_by character varying(100),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean DEFAULT false,
    surface_area numeric,
    radius integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(50) NOT NULL,
    successful_mission boolean DEFAULT true,
    launch_date date
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    designation character varying(100),
    distance integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'M31, NGC 224, UGC 454, PGC 2557', 'Andromeda', 'In mythology, Andromeda is the daughter of the kings of Ethiopia and is said to be more beautiful than the Nereids. She becomes queen of Greece when she marries Perseus.');
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxy', 'NGC 4038 & 4039, PGC 37967 & 37969', 'Corvus', 'This is a dual galaxy. It gets its name because it is said to look like a pair of insect antennae.');
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'Null', 'Null', 'Our own galaxy. It is said to look like a band of light');
INSERT INTO public.galaxy VALUES (4, 'Mice Galaxies', 'NGC 4676, UGC 7938 / 7939, PGC 43062 / 43065', 'Coma Berenices', 'Two galaxies with long tails that look like a mouse');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'M104, NGC 4594, UGC 293, PGC 42407', 'Virgo', 'Looks like a sombrero');
INSERT INTO public.galaxy VALUES (6, 'Wolf-Lundmark-Melotte', 'UGCA 444, PGC 143', 'Cetus', 'Named after the astronomers that co-discovered it');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'month', 'Galileo Galilei', 1);
INSERT INTO public.moon VALUES (2, 'Nereid', 'Named after the Nereids, the sea-nymphs of Greek mythology', 'Gerard P. Kuiper', 6);
INSERT INTO public.moon VALUES (3, 'Naiad', 'Named after the Naiads, spirts or nymphs of rivers, seas, fountains, etc.', 'Voyager 2 spacecraft', 6);
INSERT INTO public.moon VALUES (4, 'Thalassa', 'Pre-Greek word for “sea” and its representation in mythology', 'Voyager 2 spacecraft', 6);
INSERT INTO public.moon VALUES (5, 'Despina', 'Also known as Despoina. One of Poseidon’s daughter', 'Voyager 2 spacecraft', 6);
INSERT INTO public.moon VALUES (6, 'Galatea', 'One of the Nereids in Greek mythology', 'Voyager 2 spacecraft', 6);
INSERT INTO public.moon VALUES (7, 'Larissa', 'Nymph from Thelassy in Greek mythology', 'Karl Reinmuth', 6);
INSERT INTO public.moon VALUES (8, 'Proteus', 'Shape-changing sea god in Greek mythology', 'Gustav Hauser', 6);
INSERT INTO public.moon VALUES (9, 'Halimede', 'One of the Nereids in Greek mythology', 'Matthew J. Holman', 6);
INSERT INTO public.moon VALUES (10, 'Psamathe', 'One of the Nereids in Greek mythology', 'Scott S. Sheppard and David C. Jewitt', 6);
INSERT INTO public.moon VALUES (11, 'Sao', 'One of the Nereids. Associated with “safety” and “rescue” at sea.', 'Matthew J. Holman', 6);
INSERT INTO public.moon VALUES (12, 'Laomedeia', 'One of the Nereids in Greek mythology', 'Matthew J. Holman', 6);
INSERT INTO public.moon VALUES (13, 'Neso', 'One of the Nereids in Greek mythology', 'Brett J. Gladman', 6);
INSERT INTO public.moon VALUES (14, 'Hippocamp', 'Named after the mythological sea-horse creature', ' Mark Showalter', 6);
INSERT INTO public.moon VALUES (15, 'S/2015 (136472) 1', 'nicknamed MK 2', 'Michael E. Brown', 5);
INSERT INTO public.moon VALUES (16, 'Vanth', 'Vanth is a chthonic figure in Etruscan mythology shown in a variety of forms of funerary art, such as in tomb paintings', 'Michael E. Brown', 7);
INSERT INTO public.moon VALUES (17, 'Namaka', 'inner moon', 'Mike Brown', 8);
INSERT INTO public.moon VALUES (18, 'Hiiaka', 'outer moon', 'Mike Brown', 8);
INSERT INTO public.moon VALUES (19, 'Xiangliu', 'nine-headed poisonous snake monster and minister of the water god Gonggong in Chinese mythology', 'Csaba Kiss', 9);
INSERT INTO public.moon VALUES (20, 'Dysnomia', 'Dysnomia is Eriss daughter in Greek mythology, and the word means lawlessness in Greek', 'Mike Brown', 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 510064472, 6378, NULL);
INSERT INTO public.planet VALUES (2, '14 Andromedae b', false, 355708613055, 80397, 1);
INSERT INTO public.planet VALUES (3, 'Mercury', false, 74797000, 2439, NULL);
INSERT INTO public.planet VALUES (4, 'Venus', false, 460200000, 6051, NULL);
INSERT INTO public.planet VALUES (5, 'Makemake', false, 64200000, 715, NULL);
INSERT INTO public.planet VALUES (6, 'Neptune', false, 7618000000, 24622, NULL);
INSERT INTO public.planet VALUES (7, 'Orcus', false, NULL, 910, NULL);
INSERT INTO public.planet VALUES (8, 'Haumea', false, NULL, 620, NULL);
INSERT INTO public.planet VALUES (9, 'Gonggong', false, NULL, 1290, NULL);
INSERT INTO public.planet VALUES (10, 'Eris', false, 233000000, 897, NULL);
INSERT INTO public.planet VALUES (11, 'Sedna', false, 76000000, 432, 4);
INSERT INTO public.planet VALUES (12, 'Quaoar', false, 3223000000, 980, 6);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'GEO-Kompsat 2B', true, '2020-02-18');
INSERT INTO public.spacecraft VALUES (2, '1962 Phi 1', true, '1962-05-30');
INSERT INTO public.spacecraft VALUES (3, '1KUNS-PF', true, '2018-04-02');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Mirach', 'β And', 199, 1);
INSERT INTO public.star VALUES (2, 'Nembus', '51 And', 174, 1);
INSERT INTO public.star VALUES (3, 'Kraz', 'β Crv', 140, 2);
INSERT INTO public.star VALUES (4, 'Thalath al Naamat', 'τ Cet', 12, 6);
INSERT INTO public.star VALUES (5, 'Mira Ceti', 'Mira', 418, 6);
INSERT INTO public.star VALUES (6, 'Diadem', 'α Com A', 47, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


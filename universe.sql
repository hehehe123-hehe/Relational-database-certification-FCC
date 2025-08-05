--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    asteroid_type character varying(30) NOT NULL,
    is_hazardous boolean NOT NULL,
    diameter_km numeric(6,3)
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    galaxy_type character varying(30),
    age_in_millions_of_years integer NOT NULL,
    is_spiral boolean NOT NULL
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
    name character varying(30) NOT NULL,
    planet_id integer,
    is_spherical boolean NOT NULL,
    orbital_period numeric(6,2),
    has_atmosphere boolean NOT NULL
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
    name character varying(30) NOT NULL,
    star_id integer,
    planet_type text NOT NULL,
    has_life boolean NOT NULL,
    distance_from_star numeric(8,2),
    is_habitable boolean NOT NULL,
    number_of_moons integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass numeric(4,1) NOT NULL,
    is_supergiant boolean NOT NULL,
    luminosity numeric,
    star_type text,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'ceres', 'c-type', false, 940.000);
INSERT INTO public.asteroid VALUES (2, 'vesta', 'v-type', false, 525.000);
INSERT INTO public.asteroid VALUES (3, 'pallas', 'b-type', false, 512.000);
INSERT INTO public.asteroid VALUES (4, 'eros', 's-type', false, 16.800);
INSERT INTO public.asteroid VALUES (5, 'bennu', 'b-type', true, 0.560);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 'our home galaxy', true, 'spiral', 13600, true);
INSERT INTO public.galaxy VALUES (2, 'andromeda', 'nearest major galaxy to the milky way', false, 'spiral', 10000, true);
INSERT INTO public.galaxy VALUES (3, 'triangulum', 'third largest galaxy in the local group', false, 'spiral', 12000, true);
INSERT INTO public.galaxy VALUES (4, 'centaurus a', 'a large, powerful radio galaxy', false, 'elliptical', 13000, false);
INSERT INTO public.galaxy VALUES (5, 'bode galaxy', 'a grand design spiral galaxy', false, 'spiral', 13300, true);
INSERT INTO public.galaxy VALUES (6, 'pinwheel galaxy', 'a face on spiral galaxy', false, 'spiral', 13000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 1, true, 27.32, false);
INSERT INTO public.moon VALUES (2, 'phobos', 2, false, 0.32, false);
INSERT INTO public.moon VALUES (3, 'deimos', 2, false, 1.26, false);
INSERT INTO public.moon VALUES (4, 'io', 3, true, 1.77, true);
INSERT INTO public.moon VALUES (5, 'europa', 3, true, 3.55, true);
INSERT INTO public.moon VALUES (6, 'ganymede', 3, true, 7.15, true);
INSERT INTO public.moon VALUES (7, 'callisto', 3, true, 16.69, true);
INSERT INTO public.moon VALUES (8, 'titan', 4, true, 15.95, true);
INSERT INTO public.moon VALUES (9, 'enceladus', 4, true, 1.37, false);
INSERT INTO public.moon VALUES (10, 'mimas', 4, true, 0.94, false);
INSERT INTO public.moon VALUES (11, 'tethys', 4, true, 1.89, false);
INSERT INTO public.moon VALUES (12, 'dione', 4, true, 2.74, false);
INSERT INTO public.moon VALUES (13, 'rhea', 4, true, 4.52, false);
INSERT INTO public.moon VALUES (14, 'iapetus', 4, true, 79.32, false);
INSERT INTO public.moon VALUES (15, 'phoebe', 4, false, 550.48, false);
INSERT INTO public.moon VALUES (16, 'hyperion', 4, false, 21.28, false);
INSERT INTO public.moon VALUES (17, 'triton', 4, true, 5.88, true);
INSERT INTO public.moon VALUES (18, 'charon', 4, true, 6.39, false);
INSERT INTO public.moon VALUES (19, 'ariel', 4, true, 2.52, false);
INSERT INTO public.moon VALUES (20, 'umbriel', 4, true, 4.14, false);
INSERT INTO public.moon VALUES (21, 'titania', 4, true, 8.71, false);
INSERT INTO public.moon VALUES (22, 'oberon', 4, true, 13.46, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 1, 'terrestrial', true, 1.00, true, 1);
INSERT INTO public.planet VALUES (2, 'mars', 1, 'terrestrial', false, 1.52, false, 2);
INSERT INTO public.planet VALUES (3, 'jupiter', 1, 'gas giant', false, 5.20, false, 95);
INSERT INTO public.planet VALUES (4, 'saturn', 1, 'gas giant', false, 9.58, false, 146);
INSERT INTO public.planet VALUES (5, 'venus', 1, 'terrestrial', false, 0.72, false, 0);
INSERT INTO public.planet VALUES (6, 'kepler-186f', 6, 'terrestrial', false, 0.36, true, 0);
INSERT INTO public.planet VALUES (7, 'proxima centauri b', 2, 'terrestrial', false, 0.05, true, 0);
INSERT INTO public.planet VALUES (8, 'hd 209458 b', 5, 'gas giant', false, 0.04, false, 0);
INSERT INTO public.planet VALUES (9, 'wasp-17b', 6, 'gas giant', false, 0.05, false, 0);
INSERT INTO public.planet VALUES (10, 'kepler-22b', 3, 'terrestrial', false, 0.85, true, 0);
INSERT INTO public.planet VALUES (11, 'trappist-1e', 4, 'terrestrial', false, 0.02, true, 0);
INSERT INTO public.planet VALUES (12, 'trappist-1f', 4, 'terrestrial', false, 0.03, true, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 1.0, false, 382800000000000000000000000, 'g-type main-sequence', 1);
INSERT INTO public.star VALUES (2, 'alpha centauri a', 1.1, false, 151900000000000000000000000, 'g-type main-sequence', 1);
INSERT INTO public.star VALUES (3, 'sirius', 2.0, false, 254000000000000000000000000, 'a-type main-sequence', 1);
INSERT INTO public.star VALUES (4, 'betelgeuse', 15.0, true, 126000000000000000000000000000, 'm-type supergiant', 1);
INSERT INTO public.star VALUES (5, 'vega', 2.1, false, 370000000000000000000000000, 'a-type supergiant', 1);
INSERT INTO public.star VALUES (6, 'rigel', 21.0, true, 120000000000000000000000000000, 'b-type supergiant', 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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


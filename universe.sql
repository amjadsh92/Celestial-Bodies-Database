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
    name character varying(30),
    type character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_billion_years integer NOT NULL,
    size_in_light_years integer,
    mass_in_trillion_solar_masses numeric NOT NULL
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
    name character varying(30),
    type character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_million_years integer NOT NULL,
    distance_from_sun_in_light_years integer NOT NULL,
    mass_in_solar_masses numeric,
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
-- Name: phenomenon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.phenomenon (
    phenomenon_id integer NOT NULL,
    name text,
    description text
);


ALTER TABLE public.phenomenon OWNER TO freecodecamp;

--
-- Name: phenomenon_phenomenon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.phenomenon_phenomenon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phenomenon_phenomenon_id_seq OWNER TO freecodecamp;

--
-- Name: phenomenon_phenomenon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.phenomenon_phenomenon_id_seq OWNED BY public.phenomenon.phenomenon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    type character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_million_years integer NOT NULL,
    distance_from_sun_in_light_years integer NOT NULL,
    mass_in_solar_masses numeric,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    type character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_million_years integer NOT NULL,
    distance_from_sun_in_light_years integer NOT NULL,
    mass_in_solar_masses numeric,
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
-- Name: phenomenon phenomenon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.phenomenon ALTER COLUMN phenomenon_id SET DEFAULT nextval('public.phenomenon_phenomenon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy, rich in stars and planets', true, false, 14, 100000, 1.5);
INSERT INTO public.galaxy VALUES (2, 'Andromida', 'Spiral', 'Our home galaxy, Nearest major galaxy, on a collision course with the Milky Way', false, false, 10, 220000, 1.2);
INSERT INTO public.galaxy VALUES (3, 'Messier 87 (M87)', 'Elliptical', 'Massive elliptical galaxy with a supermassive black hole at its center', false, true, 14, 120000, 2.7);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 'Satellite galaxy of the Milky Way, rich in young stars', false, false, 13, 14000, 0.01);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy (M104)', 'Spiral', 'Distinct for its bright nucleus and large central bulge.', false, false, 13, 50000, 0.8);
INSERT INTO public.galaxy VALUES (6, 'IC 1101', 'Elliptical', 'One of the largest known galaxies in the universe', false, true, 12, 2000000, 100);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Natural Satellite', 'Earth’s only natural satellite.', false, true, 4500, 0, 0.0123, 1);
INSERT INTO public.moon VALUES (2, 'Selene', 'Natural Satellite', 'Mythologically inspired companion to Luna.', false, true, 4490, 0, 0.011, 1);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Captured Asteroid', 'One of the two moons of Mars.', false, false, 4500, 0, 0.00000001, 2);
INSERT INTO public.moon VALUES (4, 'Deimos', 'Captured Asteroid', 'The smaller and outer moon of Mars.', false, false, 4500, 0, 0.000000002, 2);
INSERT INTO public.moon VALUES (5, 'Sirius-Ia', 'Icy Moon', 'A frozen moon with a reflective surface.', false, true, 80, 9, 0.0003, 3);
INSERT INTO public.moon VALUES (6, 'Sirius-Ib', 'Rocky Moon', 'Likely to have been formed from planetary debris.', false, true, 75, 9, 0.0002, 3);
INSERT INTO public.moon VALUES (7, 'Sirius-IIa', 'Gas Moon', 'Gas-rich satellite with unusual density.', false, true, 90, 9, 0.0005, 4);
INSERT INTO public.moon VALUES (8, 'Sirius-IIb', 'Volcanic Moon', 'Hot moon with signs of active volcanism.', false, true, 95, 9, 0.0006, 4);
INSERT INTO public.moon VALUES (9, 'Proxima-b1', 'Rocky Moon', 'Closest moon to the Proxima b.', false, true, 4700, 4, 0.001, 5);
INSERT INTO public.moon VALUES (10, 'Proxima-b2', 'Icy Moon', 'Frozen satellite far from its host planet.', false, true, 4690, 4, 0.0012, 5);
INSERT INTO public.moon VALUES (11, 'Centauri-Ac1', 'Desert Moon', 'Dry, dusty, and cratered surface.', false, true, 4750, 4, 0.0008, 6);
INSERT INTO public.moon VALUES (12, 'Centauri-Ac2', 'Stormy Moon', 'Unstable atmosphere with lightning storms.', false, true, 4755, 4, 0.0009, 6);
INSERT INTO public.moon VALUES (13, 'Proxima-c1', 'Cracked Ice Moon', 'Surface split with icy canyons.', false, true, 4800, 4, 0.0015, 7);
INSERT INTO public.moon VALUES (14, 'Proxima-c2', 'Molten Core Moon', 'Likely contains molten inner layers.', false, true, 4805, 4, 0.0013, 7);
INSERT INTO public.moon VALUES (15, 'R136a1-m1', 'Lava Moon', 'Extreme surface temperatures.', false, true, 10, 163000, 0.002, 8);
INSERT INTO public.moon VALUES (16, 'R136a1-m2', 'Vapor Moon', 'Mostly gaseous with unstable orbit.', false, false, 10, 163001, 0.0022, 8);
INSERT INTO public.moon VALUES (17, 'R136a1-r1', 'Radiated Moon', 'Highly radioactive environment.', false, true, 11, 163002, 0.0017, 9);
INSERT INTO public.moon VALUES (18, 'R136a1-r2', 'Cratered Moon', 'Pockmarked surface from meteor impacts.', false, true, 9, 163003, 0.0018, 9);
INSERT INTO public.moon VALUES (19, 'VFTS-m1', 'Oblong Moon', 'Rapid spin affects its shape.', false, false, 2, 160000, 0.0014, 10);
INSERT INTO public.moon VALUES (20, 'VFTS-m2', 'Faint Moon', 'Difficult to detect due to low reflectivity.', false, true, 2, 160001, 0.0011, 10);


--
-- Data for Name: phenomenon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.phenomenon VALUES (1, 'Black Hole', 'A region of spacetime with gravity so strong nothing can escape.');
INSERT INTO public.phenomenon VALUES (2, 'Supernova', 'A powerful and luminous stellar explosion marking the end of a star’s life.');
INSERT INTO public.phenomenon VALUES (3, 'Nebula', 'A vast cloud of dust and gas in space, often a stellar nursery.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 'The only known planet with life.', true, true, 4500, 0, 1.0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 'Cold, red planet with signs of past water.', false, true, 4500, 0, 0.107, 1);
INSERT INTO public.planet VALUES (3, 'Sirius b-I', 'Gas Giant', 'Hypothetical gas planet around Sirius A.', false, true, 100, 9, 1.2, 2);
INSERT INTO public.planet VALUES (4, 'Sirius b-II', 'Ice Giant', 'Possible icy planet orbiting the Sirius system.', false, true, 100, 9, 0.3, 2);
INSERT INTO public.planet VALUES (5, 'Proxima b', 'Terrestrial', 'An exoplanet in the habitable zone.', true, true, 4800, 4, 1.17, 3);
INSERT INTO public.planet VALUES (6, 'Alpha Centauri Ac', 'Gas Giant', 'A gas planet orbiting Alpha Centauri A.', false, true, 4800, 4, 0.9, 3);
INSERT INTO public.planet VALUES (7, 'Proxima c', 'Super-Earth', 'A cold, massive exoplanet.', false, true, 4850, 4, 7.0, 4);
INSERT INTO public.planet VALUES (8, 'Proxima d', 'Rocky', 'Very close orbiting terrestrial planet.', false, true, 4850, 4, 0.26, 4);
INSERT INTO public.planet VALUES (9, 'R136a1-b1', 'Gas Giant', 'Massive planet under harsh radiation.', false, true, 10, 163000, 2.3, 5);
INSERT INTO public.planet VALUES (10, 'R136a1-b2', 'Rocky', 'A scorched rocky world near R136a1.', false, true, 10, 163001, 0.6, 5);
INSERT INTO public.planet VALUES (11, 'VFTS-X1', 'Gas Giant', 'Orbiting a rapidly spinning star.', false, true, 2, 160000, 1.9, 6);
INSERT INTO public.planet VALUES (12, 'VFTS-X2', 'Terrestrial', 'Likely unstable orbit due to star spin.', false, true, 2, 160001, 0.5, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sirius A', 'A-type main sequence', 'The brightest star in Earth''s night sky.', false, true, 250, 9, 2.1, 1);
INSERT INTO public.star VALUES (5, 'R136a1', 'Wolf-Rayet', 'One of the most massive stars ever discovered', false, true, 1000, 163000, 215, 3);
INSERT INTO public.star VALUES (6, 'VFTS 102', 'O-type main sequence', 'Fastest spinning star ever observed.', false, true, 200, 160000, 25, 3);
INSERT INTO public.star VALUES (1, 'sun', 'G-type main sequence', 'Our home star and the center of the Solar System', true, true, 4600, 0, 1, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'G-type main sequence', 'Closest Sun-like star system to Earth.', false, true, 5000, 4, 1.1, 2);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Red dwarf', 'Closest known star to the Sun with known exoplanets.', true, true, 4860, 4, 0.12, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: phenomenon_phenomenon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.phenomenon_phenomenon_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


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
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


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
-- Name: phenomenon phenomenon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.phenomenon
    ADD CONSTRAINT phenomenon_pkey PRIMARY KEY (phenomenon_id);


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
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


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
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


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

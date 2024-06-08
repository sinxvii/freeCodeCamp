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
-- Name: userdata; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.userdata (
    user_id integer NOT NULL,
    uname character varying(22) NOT NULL,
    gplayed integer,
    gstat integer
);


ALTER TABLE public.userdata OWNER TO freecodecamp;

--
-- Name: userdata_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.userdata_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userdata_user_id_seq OWNER TO freecodecamp;

--
-- Name: userdata_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.userdata_user_id_seq OWNED BY public.userdata.user_id;


--
-- Name: userdata user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.userdata ALTER COLUMN user_id SET DEFAULT nextval('public.userdata_user_id_seq'::regclass);


--
-- Data for Name: userdata; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.userdata VALUES (29, 'user_1717853689853', 2, 414);
INSERT INTO public.userdata VALUES (28, 'user_1717853689854', 5, 407);
INSERT INTO public.userdata VALUES (31, 'user_1717853716874', 2, 820);
INSERT INTO public.userdata VALUES (25, 'user_1717853546049', 2, 318);
INSERT INTO public.userdata VALUES (24, 'user_1717853546050', 5, 204);
INSERT INTO public.userdata VALUES (30, 'user_1717853716875', 5, 487);
INSERT INTO public.userdata VALUES (23, 'Carl', 2, 7);
INSERT INTO public.userdata VALUES (27, 'user_1717853635445', 2, 282);
INSERT INTO public.userdata VALUES (26, 'user_1717853635446', 5, 221);


--
-- Name: userdata_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.userdata_user_id_seq', 31, true);


--
-- Name: userdata userdata_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.userdata
    ADD CONSTRAINT userdata_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: patients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.patients (
    id bigint NOT NULL,
    date_of_birth date NOT NULL,
    given_name character varying NOT NULL,
    family_name character varying NOT NULL,
    phone_number character varying,
    name_suffix character varying,
    sex integer,
    external_id character varying NOT NULL,
    provider_external_id character varying
);


--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.patients_id_seq OWNED BY public.patients.id;


--
-- Name: providers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.providers (
    id bigint NOT NULL,
    given_name character varying NOT NULL,
    family_name character varying NOT NULL,
    credential character varying,
    primary_specialty character varying,
    provider_type integer,
    external_id character varying NOT NULL,
    primary_care_provider boolean
);


--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.providers_id_seq OWNED BY public.providers.id;


--
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patients ALTER COLUMN id SET DEFAULT nextval('public.patients_id_seq'::regclass);


--
-- Name: providers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.providers ALTER COLUMN id SET DEFAULT nextval('public.providers_id_seq'::regclass);


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.patients (id, date_of_birth, given_name, family_name, phone_number, name_suffix, sex, external_id, provider_external_id) FROM stdin;
1642	1948-01-05	Simone	Bella	(555) 555-5555	\N	1	Simone-Bella	333-333
1641	1950-03-22	Rose	Odingo	(555) 555-5555	\N	1	Rose-Odingo	333-333
1643	1956-10-18	Joel	Charleston	(555) 555-5555	\N	0	Joel-Charleston	333-333
1644	1952-06-12	Bradley	Moore	(555) 555-5555	\N	0	Bradley-Moore	333-333
1645	1983-02-04	Jose	Valdez	(555) 555-5555	\N	0	Jose-Valdez	333-333
1646	1989-10-24	Manuel	Rice	(555) 555-5555	\N	0	Manuel-Rice	333-333
1647	1976-09-13	Benjamin	Jones	(555) 555-5555	\N	0	Benjamin-Jones	333-333
1648	1944-04-30	Erica	Ackerman	(555) 555-5555	\N	1	Erica-Ackerman	333-333
1649	1951-09-02	Theresa	Reiner	(555) 555-5555	\N	1	Theresa-Reiner	333-333
1650	1950-09-02	Yvette	Li	(555) 555-5555	\N	1	Yvette-Li	333-333
1651	1950-03-22	Betsy	Lewis	(555) 555-5555	\N	1	Betsy-Lewis	333-333
1652	1948-01-05	Angela	Yu	(555) 555-5555	\N	1	Angela-Yu	333-333
1653	1956-10-18	Brady	Anderson	(555) 555-5555	\N	0	Brady-Anderson	333-333
1654	1952-06-12	Michael	Davis	(555) 555-5555	\N	0	Michael-Davis	333-333
1655	1983-02-04	Vincent	Tutti	(555) 555-5555	\N	0	Vincent-Tutti	333-333
1656	1989-10-24	Luis	Marquez	(555) 555-5555	\N	0	Luis-Marquez	333-333
1657	1976-09-13	Bennett	Katz	(555) 555-5555	\N	0	Bennett-Katz	333-333
1658	1944-04-30	Grendel	Minerva	(555) 555-5555	\N	1	Grendel-Minerva	333-333
1659	1956-09-02	Minny	Coover	(555) 555-5555	\N	1	Minny-Coover	333-333
1660	1956-09-02	Stephanie	Kim	(555) 555-5555	\N	1	Stephanie-Kim	333-333
1661	1950-03-22	Ramona	Mullins	(555) 555-5555	\N	1	Ramona-Mullins	333-333
1662	1948-01-05	Nicole	Boyd	(555) 555-5555	\N	1	Nicole-Boyd	333-333
1663	1956-10-18	Jermaine	Schneider	(555) 555-5555	\N	0	Jermaine-Schneider	333-333
1664	1952-06-12	Myron	Wilkerson	(555) 555-5555	\N	0	Myron-Wilkerson	333-333
1665	1983-02-04	Shawn	Ferngulch	(555) 555-5555	\N	0	Shawn-Ferngulch	333-333
1666	1989-10-24	Julian	Hodges	(555) 555-5555	\N	0	Julian-Hodges	333-333
1667	1976-09-13	Gordon	Daniel	(555) 555-5555	\N	0	Gordon-Daniel	333-333
1668	1944-04-30	Leslie	Greene	(555) 555-5555	\N	1	Leslie-Greene	333-333
1669	1956-09-02	Jacqueline	Evans	(555) 555-5555	\N	1	Jacqueline-Evans	333-333
1670	1956-09-02	Yolanda	Gray	(555) 555-5555	\N	1	Yolanda-Gray	333-333
1671	1950-03-22	Holly	Schwartz	(555) 555-5555	\N	1	Holly-Schwartz	333-333
1672	1948-01-05	Mandy	Wheeler	(555) 555-5555	\N	1	Mandy-Wheeler	333-333
1673	1956-10-18	Cesar	Parker	(555) 555-5555	\N	0	Cesar-Parker	333-333
1674	1952-06-12	Emmett	Sanchez	(555) 555-5555	\N	0	Emmett-Sanchez	333-333
1675	1983-02-04	Jack	Cole	(555) 555-5555	\N	0	Jack-Cole	333-333
1676	1989-10-24	Elmer	Ford	(555) 555-5555	\N	0	Elmer-Ford	333-333
1677	1976-09-13	Otis	Scott	(555) 555-5555	\N	0	Otis-Scott	333-333
1678	1944-04-30	Camille	Schultz	(555) 555-5555	\N	1	Camille-Schultz	333-333
1679	1956-09-02	Linda	Briggs	(555) 555-5555	\N	1	Linda-Briggs	333-333
1680	1956-09-02	Jeanne	Pope	(555) 555-5555	\N	1	Jeanne-Pope	333-333
1681	1950-03-22	Minnie	Ball	(555) 555-5555	\N	1	Minnie-Ball	333-333
1682	1948-01-05	Audrey	Porter	(555) 555-5555	\N	1	Audrey-Porter	333-333
1683	1956-10-18	Franklin	Shaw	(555) 555-5555	\N	0	Franklin-Shaw	333-333
1684	1950-06-12	Dallas	Reyes	(555) 555-5555	\N	0	Dallas-Reyes	333-333
1685	1983-02-04	Theodore	Gray	(555) 555-5555	\N	0	Theodore-Gray	333-333
1686	1989-10-24	Rodolfo	Waters	(555) 555-5555	\N	0	Rodolfo-Waters	333-333
1687	1976-09-13	Nicholas	Cobb	(555) 555-5555	\N	0	Nicholas-Cobb	333-333
1688	1944-04-30	Julia	Dawson	(555) 555-5555	\N	1	Julia-Dawson	333-333
1689	1956-09-02	Cecil	Valdez	(555) 555-5555	\N	1	Cecil-Valdez	333-333
1690	1956-09-02	Mary	Richardson	(555) 555-5555	\N	1	Mary-Richardson	333-333
1691	1950-03-22	Nichole	Morris	(555) 555-5555	\N	1	Nichole-Morris	333-333
1692	1948-01-05	Marlene	Castro	(555) 555-5555	\N	1	Marlene-Castro	333-333
1693	1956-10-18	Taylor	Gonzales	(555) 555-5555	\N	0	Taylor-Gonzales	333-333
1694	1951-06-12	Gordon	Bronco	(555) 555-5555	\N	0	Gordon-Bronco	333-333
1695	1983-02-04	Terrell	Gill	(555) 555-5555	\N	0	Terrell-Gill	333-333
1696	1989-10-24	Carlos	Hansen	(555) 555-5555	\N	0	Carlos-Hansen	333-333
1697	1976-09-13	Corey	Fowler	(555) 555-5555	\N	0	Corey-Fowler	333-333
1698	1944-04-30	Patricia	Goodwin	(555) 555-5555	\N	1	Patricia-Goodwin	333-333
1699	1956-09-02	Lynne	Farmer	(555) 555-5555	\N	1	Lynne-Farmer	333-333
1700	1956-09-02	Guadalupe	Perry	(555) 555-5555	\N	1	Guadalupe-Perry	333-333
1701	1950-03-22	Shari	Shelton	(555) 555-5555	\N	1	Shari-Shelton	222-222
1702	1948-04-19	Jasmine	Buchannan	(555) 555-5555	\N	1	Jasmine-Buchannan	222-222
1703	1944-08-14	Guillermo	West	(555) 555-5555	\N	0	Guillermo-West	333-333
1704	1951-01-28	Abel	Steele	(555) 555-5555	\N	0	Abel-Steele	333-333
1705	1974-03-14	Hugo	Harrington	(555) 555-5555	\N	0	Hugo-Harrington	222-222
1706	1948-05-27	Craig	Ruiz	(555) 555-5555	\N	0	Craig-Ruiz	333-333
1707	1980-02-01	Santos	Henarejos	(555) 555-5555	\N	0	Santos-Henarejos	333-333
1708	1950-03-22	Diane	Tucker	(555) 555-5555	\N	1	Diane-Tucker	222-222
1709	1948-04-19	Verna	Jennings	(555) 555-5555	\N	1	Verna-Jennings	222-222
1710	1944-08-14	Jane	Bridges	(555) 555-5555	\N	1	Jane-Bridges	333-333
1711	1951-01-28	Amy	Filbert	(555) 555-5555	\N	1	Amy-Filbert	333-333
1712	1974-03-14	Coretta	Smith	(555) 555-5555	\N	1	Coretta-Smith	222-222
1713	1948-05-27	Richard	Brown	(555) 555-5555	\N	0	Richard-Brown	333-333
1714	1980-02-01	Duke	Bradford	(555) 555-5555	\N	0	Duke-Bradford	333-333
1715	1950-03-22	Miguel	Alvarez	(555) 555-5555	\N	0	Miguel-Alvarez	222-222
1716	1948-04-19	Lucas	Wong	(555) 555-5555	\N	0	Lucas-Wong	222-222
1717	1944-08-14	Robert	Wu	(555) 555-5555	\N	0	Robert-Wu	333-333
1718	1951-01-28	Lisa	Ellis	(555) 555-5555	\N	1	Lisa-Ellis	333-333
1719	1974-03-14	Maureen	Sanders	(555) 555-5555	\N	1	Maureen-Sanders	222-222
1720	1948-05-27	Mika	Nichols	(555) 555-5555	\N	0	Mika-Nichols	333-333
1721	1980-02-01	Minerva	Ewing	(555) 555-5555	\N	0	Minerva-Ewing	333-333
1722	1950-03-22	Patricia	Ender	(555) 555-5555	\N	1	Patricia-Ender	222-222
1723	1948-04-19	Alexander	Pentall	(555) 555-5555	\N	0	Alexander-Pentall	222-222
1724	1944-08-14	Brent	Chang	(555) 555-5555	\N	0	Brent-Chang	333-333
1725	1951-01-28	Israel	Rhodes	(555) 555-5555	\N	0	Israel-Rhodes	333-333
1726	1974-03-14	Jan	Rogers	(555) 555-5555	\N	1	Jan-Rogers	222-222
1727	1948-05-27	Fernando	Greer	(555) 555-5555	\N	0	Fernando-Greer	333-333
1728	1980-02-01	Edgar	Holt	(555) 555-5555	\N	0	Edgar-Holt	333-333
\.


--
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.providers (id, given_name, family_name, credential, primary_specialty, provider_type, external_id, primary_care_provider) FROM stdin;
306	Ronald	Chu	MD	Orthopedics	\N	555-555	\N
303	Rachel	Kohler	MD	Ophthalmology	\N	111-111	\N
304	Angela	Jimenez	MD	General Practice	\N	222-222	\N
305	Duke	Carlton	MD	Surgery	\N	444-444	\N
307	Hildegard	Jones	MD	Urology	\N	666-666	\N
308	Brenda	Higgins	MD	Radiology	\N	777-777	\N
309	Andrew	Vogel	MD	General Practice	\N	333-333	\N
\.


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.patients_id_seq', 1728, true);


--
-- Name: providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.providers_id_seq', 309, true);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: providers providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- Name: index_patients_on_external_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_patients_on_external_id ON public.patients USING btree (external_id);


--
-- Name: index_patients_on_provider_external_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_patients_on_provider_external_id ON public.patients USING btree (provider_external_id);


--
-- Name: index_providers_on_external_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_providers_on_external_id ON public.providers USING btree (external_id);


--
-- PostgreSQL database dump complete
--


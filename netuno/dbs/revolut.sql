--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: netuno_client; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE netuno_client (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    name character varying(250) DEFAULT ''::character varying,
    token character varying(250) DEFAULT ''::character varying,
    secret character varying(250) DEFAULT ''::character varying,
    active boolean DEFAULT true
);


ALTER TABLE netuno_client OWNER TO netuno_revolut;

--
-- Name: netuno_client_hit; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE netuno_client_hit (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    client_id integer DEFAULT 0,
    user_id integer DEFAULT 0,
    moment timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE netuno_client_hit OWNER TO netuno_revolut;

--
-- Name: netuno_client_hit_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE netuno_client_hit_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE netuno_client_hit_id OWNER TO netuno_revolut;

--
-- Name: netuno_client_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE netuno_client_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE netuno_client_id OWNER TO netuno_revolut;

--
-- Name: netuno_design; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE netuno_design (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    table_id integer DEFAULT 0,
    name character varying(250) DEFAULT ''::character varying,
    displayname character varying(250) DEFAULT ''::character varying,
    x integer DEFAULT 0,
    y integer DEFAULT 0,
    type character varying(50) DEFAULT ''::character varying,
    width integer DEFAULT 0,
    height integer DEFAULT 0,
    max integer DEFAULT 0,
    min integer DEFAULT 0,
    colspan integer DEFAULT 0,
    rowspan integer DEFAULT 0,
    tdwidth character varying(10) DEFAULT '0'::character varying,
    tdheight character varying(10) DEFAULT '0'::character varying,
    "notnull" boolean DEFAULT false,
    primarykey boolean DEFAULT false,
    whenresult boolean DEFAULT true,
    whenfilter boolean DEFAULT true,
    whenedit boolean DEFAULT true,
    whenview boolean DEFAULT true,
    whennew boolean DEFAULT true,
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    view_user_id integer DEFAULT 0,
    view_group_id integer DEFAULT 0,
    edit_user_id integer DEFAULT 0,
    edit_group_id integer DEFAULT 0,
    properties text DEFAULT ''::text,
    firebase character varying(250) DEFAULT ''::character varying
);


ALTER TABLE netuno_design OWNER TO netuno_revolut;

--
-- Name: netuno_design_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE netuno_design_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE netuno_design_id OWNER TO netuno_revolut;

--
-- Name: netuno_group; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE netuno_group (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    name character varying(250) DEFAULT ''::character varying,
    netuno_group integer DEFAULT 0,
    active boolean DEFAULT true,
    report text DEFAULT ''::text,
    code character varying(250) DEFAULT ''::character varying,
    mail character varying(250) DEFAULT ''::character varying,
    config text DEFAULT ''::text,
    extra text DEFAULT ''::text
);


ALTER TABLE netuno_group OWNER TO netuno_revolut;

--
-- Name: netuno_group_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE netuno_group_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE netuno_group_id OWNER TO netuno_revolut;

--
-- Name: netuno_group_rule; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE netuno_group_rule (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    group_id integer DEFAULT 0,
    table_id integer DEFAULT 0,
    active boolean DEFAULT true,
    rule_read integer DEFAULT 0,
    rule_write integer DEFAULT 0,
    rule_delete integer DEFAULT 0
);


ALTER TABLE netuno_group_rule OWNER TO netuno_revolut;

--
-- Name: netuno_group_rule_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE netuno_group_rule_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE netuno_group_rule_id OWNER TO netuno_revolut;

--
-- Name: netuno_log; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE netuno_log (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    moment timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    action integer DEFAULT 0,
    table_id integer DEFAULT 0,
    item_id integer DEFAULT 0,
    data text DEFAULT ''::text
);


ALTER TABLE netuno_log OWNER TO netuno_revolut;

--
-- Name: netuno_log_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE netuno_log_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE netuno_log_id OWNER TO netuno_revolut;

--
-- Name: netuno_statistic_average; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE netuno_statistic_average (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    type_id integer DEFAULT 0,
    average_type_id integer DEFAULT 0,
    moment timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    average integer DEFAULT 0
);


ALTER TABLE netuno_statistic_average OWNER TO netuno_revolut;

--
-- Name: netuno_statistic_average_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE netuno_statistic_average_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE netuno_statistic_average_id OWNER TO netuno_revolut;

--
-- Name: netuno_statistic_average_type; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE netuno_statistic_average_type (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    code character varying(250) DEFAULT ''::character varying
);


ALTER TABLE netuno_statistic_average_type OWNER TO netuno_revolut;

--
-- Name: netuno_statistic_average_type_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE netuno_statistic_average_type_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE netuno_statistic_average_type_id OWNER TO netuno_revolut;

--
-- Name: netuno_statistic_moment; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE netuno_statistic_moment (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    type_id integer DEFAULT 0,
    moment timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    count integer DEFAULT 0
);


ALTER TABLE netuno_statistic_moment OWNER TO netuno_revolut;

--
-- Name: netuno_statistic_moment_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE netuno_statistic_moment_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE netuno_statistic_moment_id OWNER TO netuno_revolut;

--
-- Name: netuno_statistic_type; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE netuno_statistic_type (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    code character varying(250) DEFAULT ''::character varying
);


ALTER TABLE netuno_statistic_type OWNER TO netuno_revolut;

--
-- Name: netuno_statistic_type_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE netuno_statistic_type_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE netuno_statistic_type_id OWNER TO netuno_revolut;

--
-- Name: netuno_table; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE netuno_table (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    name character varying(250) DEFAULT ''::character varying,
    displayname character varying(250) DEFAULT ''::character varying,
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    js text,
    report boolean DEFAULT false,
    show_id boolean DEFAULT true,
    control_active boolean DEFAULT true,
    control_user boolean DEFAULT false,
    control_group boolean DEFAULT false,
    big boolean DEFAULT false,
    parent_id integer DEFAULT 0,
    firebase character varying(250) DEFAULT ''::character varying
);


ALTER TABLE netuno_table OWNER TO netuno_revolut;

--
-- Name: netuno_table_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE netuno_table_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE netuno_table_id OWNER TO netuno_revolut;

--
-- Name: netuno_user; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE netuno_user (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    name character varying(250) DEFAULT ''::character varying,
    group_id integer DEFAULT 0,
    "user" character varying(250) DEFAULT ''::character varying,
    pass character varying(250) DEFAULT ''::character varying,
    active boolean DEFAULT true,
    report text DEFAULT ''::text,
    code character varying(250) DEFAULT ''::character varying,
    mail character varying(250) DEFAULT ''::character varying,
    config text DEFAULT ''::text,
    extra text DEFAULT ''::text
);


ALTER TABLE netuno_user OWNER TO netuno_revolut;

--
-- Name: netuno_user_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE netuno_user_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE netuno_user_id OWNER TO netuno_revolut;

--
-- Name: netuno_user_rule; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE netuno_user_rule (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    user_id integer DEFAULT 0,
    table_id integer DEFAULT 0,
    active boolean DEFAULT true,
    rule_read integer DEFAULT 0,
    rule_write integer DEFAULT 0,
    rule_delete integer DEFAULT 0
);


ALTER TABLE netuno_user_rule OWNER TO netuno_revolut;

--
-- Name: netuno_user_rule_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE netuno_user_rule_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE netuno_user_rule_id OWNER TO netuno_revolut;

--
-- Name: option; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE option (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    voting_id integer DEFAULT 0,
    description character varying(250) DEFAULT ''::character varying
);


ALTER TABLE option OWNER TO netuno_revolut;

--
-- Name: option_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE option_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE option_id OWNER TO netuno_revolut;

--
-- Name: participant; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE participant (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    voting_id integer DEFAULT 0,
    mail character varying(250) DEFAULT ''::character varying,
    phone character varying(250) DEFAULT ''::character varying,
    code character varying(250) DEFAULT ''::character varying,
    owner boolean DEFAULT false,
    sent boolean DEFAULT false
);


ALTER TABLE participant OWNER TO netuno_revolut;

--
-- Name: participant_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE participant_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE participant_id OWNER TO netuno_revolut;

--
-- Name: vote; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE vote (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    voting_id integer DEFAULT 0,
    option_id integer DEFAULT 0,
    participant_id integer DEFAULT 0
);


ALTER TABLE vote OWNER TO netuno_revolut;

--
-- Name: vote_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE vote_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vote_id OWNER TO netuno_revolut;

--
-- Name: voting; Type: TABLE; Schema: public; Owner: netuno_revolut
--

CREATE TABLE voting (
    id integer NOT NULL,
    uid uuid DEFAULT uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    title character varying(250) DEFAULT ''::character varying,
    description text DEFAULT ''::text,
    code character varying(250) DEFAULT ''::character varying,
    valid boolean DEFAULT false,
    sent boolean DEFAULT false
);


ALTER TABLE voting OWNER TO netuno_revolut;

--
-- Name: voting_id; Type: SEQUENCE; Schema: public; Owner: netuno_revolut
--

CREATE SEQUENCE voting_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE voting_id OWNER TO netuno_revolut;

--
-- Data for Name: netuno_client; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY netuno_client (id, uid, name, token, secret, active) FROM stdin;
\.


--
-- Data for Name: netuno_client_hit; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY netuno_client_hit (id, uid, client_id, user_id, moment) FROM stdin;
\.


--
-- Data for Name: netuno_design; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY netuno_design (id, uid, table_id, name, displayname, x, y, type, width, height, max, min, colspan, rowspan, tdwidth, tdheight, "notnull", primarykey, whenresult, whenfilter, whenedit, whenview, whennew, user_id, group_id, view_user_id, view_group_id, edit_user_id, edit_group_id, properties, firebase) FROM stdin;
1	96268c6b-ba2e-4b7d-b521-b348a0a61b6b	1	title	Title	1	1	text	0	0	0	0	0	0	0	0	t	f	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
2	f0b9dc5a-5752-4818-9fae-26f2fa88746e	1	description	Description	1	2	textarea	0	5	0	0	0	0	0	0	t	f	t	t	t	t	t	0	0	0	0	0	0	{}	
3	f51ad2e2-ac9c-44de-a220-0f6ee712068f	1	code	Code	1	3	text	0	0	0	0	0	0	0	0	t	f	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
4	e884a896-8e26-4e1c-bbf5-ced2232f689f	1	valid	Valid	1	4	checkbox	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	0	0	0	0	0	0	{"DEFAULT":{"default":"true","type":"BOOLEAN","value":"true"}}	
5	51b70ff1-32ed-4d32-836a-4a6a802ac425	1	sent	Sent	2	4	checkbox	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	0	0	0	0	0	0	{"DEFAULT":{"default":"true","type":"BOOLEAN","value":"true"}}	
6	11cfe8aa-78c7-4d19-b92a-55b03d951ff2	2	voting_id	Voting	1	1	select	0	0	0	0	0	0	0	0	t	f	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"voting:title,code"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
7	6508821d-caa1-490a-8748-5fc14da77fbf	2	description	Description	1	2	text	0	0	0	0	0	0	0	0	t	f	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
8	33620b8e-9ae3-4f34-9395-7fecb6b58894	3	voting_id	Voting	1	1	select	0	0	0	0	0	0	0	0	t	f	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"voting:title,code"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
10	fbde6836-a188-4e10-ac7a-14b8aec7600c	3	phone	Phone	1	3	text	0	0	0	0	0	0	0	0	t	f	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
9	68ed0580-03a9-41ee-b33a-81a7275a9802	3	mail	Mail	1	2	text	0	0	0	0	0	0	0	0	t	f	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
11	9f06a7a9-d446-458b-96eb-91753e5f17f4	3	code	Code	1	4	text	0	0	0	0	0	0	0	0	t	f	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
13	9715f2a4-837f-44c0-9071-2b4a714f4f76	3	sent	Sent	2	5	checkbox	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	0	0	0	0	0	0	{"DEFAULT":{"default":"true","type":"BOOLEAN","value":"true"}}	
12	39b5f2b5-7076-4724-97c1-4a591edd1e69	3	owner	Owner	1	5	checkbox	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	0	0	0	0	0	0	{"DEFAULT":{"default":"true","type":"BOOLEAN","value":"true"}}	
14	ad658469-1fe7-413a-8ca2-e214d160afa9	4	voting_id	Voting	1	1	select	0	0	0	0	0	0	0	0	t	f	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"voting:title,code"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
16	b1fc54fd-107d-4420-8341-3685cccaff61	4	participant_id	Participant	1	3	select	0	0	0	0	0	0	0	0	t	f	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"participant:mail,phone"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
15	db5129d8-79b0-4e16-9b0e-ae952dbc296d	4	option_id	Option	1	2	select	0	0	0	0	0	0	0	0	t	f	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"option:description"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
\.


--
-- Data for Name: netuno_group; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY netuno_group (id, uid, name, netuno_group, active, report, code, mail, config, extra) FROM stdin;
1	a168abe2-b804-4e85-b9e1-1ede73744225	Developer	-2	t					
2	3e62f70a-9d40-4221-92f1-ac4388e69a99	Administrator	-1	t					
\.


--
-- Data for Name: netuno_group_rule; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY netuno_group_rule (id, uid, group_id, table_id, active, rule_read, rule_write, rule_delete) FROM stdin;
\.


--
-- Data for Name: netuno_log; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY netuno_log (id, uid, user_id, group_id, moment, action, table_id, item_id, data) FROM stdin;
1	3eea500f-b079-41fb-946d-a6e208f8ada0	0	0	2019-05-28 13:31:50.580708	1	1	1	{"valid":"false","code":"8ktwxuTZgm","description":"Teste description...","title":"Test","sent":"false"}
2	7ffcbddf-4dd8-492f-8768-3a2d578ba600	0	0	2019-05-28 13:31:50.594877	1	3	1	{"owner":"true","code":"oY777bp8cc","mail":"eduveks@gmail.com","phone":"+351929143737","voting_id":"1","sent":"false"}
3	e2436656-aeb8-4d1d-8219-c3d973d857a5	0	0	2019-05-28 13:31:50.603945	1	3	2	{"owner":"false","code":"lk03RhTS9C","mail":"eduveks@protonmail.com","phone":"+351929143737","voting_id":"1","sent":"false"}
4	0e4c7ac6-b51f-4920-8084-0e6d991ef497	0	0	2019-05-28 13:31:50.617091	1	2	1	{"voting_id":"1","description":"Yes"}
5	f29a30cf-3e65-4a66-8675-aa67c67ba2b3	0	0	2019-05-28 13:31:50.624273	1	2	2	{"voting_id":"1","description":"No"}
6	0238c6d5-2e3b-4d56-9935-1408d05d3752	0	0	2019-05-28 13:39:36.716697	2	1	1	{"valid":"true","code":"8ktwxuTZgm","description":"Teste description...","title":"Test","sent":"false"}
7	c1f96eae-c02b-4d74-971c-599b4cce0e4c	0	0	2019-05-28 13:42:07.242606	2	3	2	{"owner":"false","code":"lk03RhTS9C","mail":"eduveks@protonmail.com","phone":"+351929143737","voting_id":"1","sent":"true"}
8	d4fcbbf6-e1a9-43fb-8244-292261ef6ade	0	0	2019-05-28 13:42:10.414821	2	3	1	{"owner":"true","code":"oY777bp8cc","mail":"eduveks@gmail.com","phone":"+351929143737","voting_id":"1","sent":"true"}
9	384861e4-9df9-4f49-9abd-53169b9cff60	0	0	2019-05-28 13:42:10.422568	2	1	1	{"valid":"true","code":"8ktwxuTZgm","description":"Teste description...","title":"Test","sent":"true"}
\.


--
-- Data for Name: netuno_statistic_average; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY netuno_statistic_average (id, uid, type_id, average_type_id, moment, average) FROM stdin;
\.


--
-- Data for Name: netuno_statistic_average_type; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY netuno_statistic_average_type (id, uid, code) FROM stdin;
\.


--
-- Data for Name: netuno_statistic_moment; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY netuno_statistic_moment (id, uid, type_id, moment, count) FROM stdin;
\.


--
-- Data for Name: netuno_statistic_type; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY netuno_statistic_type (id, uid, code) FROM stdin;
\.


--
-- Data for Name: netuno_table; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY netuno_table (id, uid, name, displayname, user_id, group_id, js, report, show_id, control_active, control_user, control_group, big, parent_id, firebase) FROM stdin;
1	84c8a692-ff47-4fde-928b-fa5faa1dac37	voting	Voting	0	0	\N	f	t	t	f	f	f	0	
2	e098dfa0-59ab-4c2b-b3ee-8ac92da29836	option	Option	0	0	\N	f	t	t	f	f	f	0	
3	0449da49-b1ec-4723-a322-d2f9380c120c	participant	Participant	0	0	\N	f	t	t	f	f	f	0	
4	5f782454-b022-424e-bb0e-259f15f1d618	vote	Vote	0	0	\N	f	t	t	f	f	f	0	
\.


--
-- Data for Name: netuno_user; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY netuno_user (id, uid, name, group_id, "user", pass, active, report, code, mail, config, extra) FROM stdin;
1	a3908a4e-1fb3-43ef-8ebf-d6bbefef96b9	Developer	1	dev	ef260e9aa3c673af240d17a2660480361a8e081d1ffeca2a5ed0e3219fc18567	t					
2	dc9b6a08-2f93-495c-b5f6-09cba8e1d70c	Administrator	2	admin	8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918	t					
\.


--
-- Data for Name: netuno_user_rule; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY netuno_user_rule (id, uid, user_id, table_id, active, rule_read, rule_write, rule_delete) FROM stdin;
\.


--
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY option (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, voting_id, description) FROM stdin;
1	1f8f5edf-02b3-41cb-9483-f95ac824df5a	0	0	2019-05-28 13:31:50.615286	0	t	f	1	Yes
2	bcf85ab2-cd96-4553-aba8-7648a24c9501	0	0	2019-05-28 13:31:50.623463	0	t	f	1	No
\.


--
-- Data for Name: participant; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY participant (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, voting_id, mail, phone, code, owner, sent) FROM stdin;
2	b5f3d51e-3438-4f11-a2b2-a2787fa652ec	0	0	2019-05-28 13:42:07.238115	0	t	f	1	eduveks@protonmail.com	+351929143737	lk03RhTS9C	f	t
1	147d59c1-d2b9-46ff-ba92-c2b02e1447f3	0	0	2019-05-28 13:42:10.413489	0	t	f	1	eduveks@gmail.com	+351929143737	oY777bp8cc	t	t
\.


--
-- Data for Name: vote; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY vote (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, voting_id, option_id, participant_id) FROM stdin;
\.


--
-- Data for Name: voting; Type: TABLE DATA; Schema: public; Owner: netuno_revolut
--

COPY voting (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, title, description, code, valid, sent) FROM stdin;
1	dc6104b5-34bc-41bd-8237-f27b3cf76318	0	0	2019-05-28 13:42:10.421483	0	t	f	Test	Teste description...	8ktwxuTZgm	t	t
\.


--
-- Name: netuno_client_hit_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('netuno_client_hit_id', 1, false);


--
-- Name: netuno_client_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('netuno_client_id', 1, false);


--
-- Name: netuno_design_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('netuno_design_id', 16, true);


--
-- Name: netuno_group_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('netuno_group_id', 2, true);


--
-- Name: netuno_group_rule_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('netuno_group_rule_id', 1, false);


--
-- Name: netuno_log_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('netuno_log_id', 9, true);


--
-- Name: netuno_statistic_average_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('netuno_statistic_average_id', 1, false);


--
-- Name: netuno_statistic_average_type_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('netuno_statistic_average_type_id', 1, false);


--
-- Name: netuno_statistic_moment_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('netuno_statistic_moment_id', 1, false);


--
-- Name: netuno_statistic_type_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('netuno_statistic_type_id', 1, false);


--
-- Name: netuno_table_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('netuno_table_id', 4, true);


--
-- Name: netuno_user_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('netuno_user_id', 2, true);


--
-- Name: netuno_user_rule_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('netuno_user_rule_id', 1, false);


--
-- Name: option_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('option_id', 2, true);


--
-- Name: participant_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('participant_id', 2, true);


--
-- Name: vote_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('vote_id', 1, false);


--
-- Name: voting_id; Type: SEQUENCE SET; Schema: public; Owner: netuno_revolut
--

SELECT pg_catalog.setval('voting_id', 1, true);


--
-- Name: netuno_client_hit netuno_client_hit_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY netuno_client_hit
    ADD CONSTRAINT netuno_client_hit_pkey PRIMARY KEY (id);


--
-- Name: netuno_client netuno_client_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY netuno_client
    ADD CONSTRAINT netuno_client_pkey PRIMARY KEY (id);


--
-- Name: netuno_design netuno_design_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY netuno_design
    ADD CONSTRAINT netuno_design_pkey PRIMARY KEY (id);


--
-- Name: netuno_group netuno_group_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY netuno_group
    ADD CONSTRAINT netuno_group_pkey PRIMARY KEY (id);


--
-- Name: netuno_group_rule netuno_group_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY netuno_group_rule
    ADD CONSTRAINT netuno_group_rule_pkey PRIMARY KEY (id);


--
-- Name: netuno_log netuno_log_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY netuno_log
    ADD CONSTRAINT netuno_log_pkey PRIMARY KEY (id);


--
-- Name: netuno_statistic_average netuno_statistic_average_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY netuno_statistic_average
    ADD CONSTRAINT netuno_statistic_average_pkey PRIMARY KEY (id);


--
-- Name: netuno_statistic_average_type netuno_statistic_average_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY netuno_statistic_average_type
    ADD CONSTRAINT netuno_statistic_average_type_pkey PRIMARY KEY (id);


--
-- Name: netuno_statistic_moment netuno_statistic_moment_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY netuno_statistic_moment
    ADD CONSTRAINT netuno_statistic_moment_pkey PRIMARY KEY (id);


--
-- Name: netuno_statistic_type netuno_statistic_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY netuno_statistic_type
    ADD CONSTRAINT netuno_statistic_type_pkey PRIMARY KEY (id);


--
-- Name: netuno_table netuno_table_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY netuno_table
    ADD CONSTRAINT netuno_table_pkey PRIMARY KEY (id);


--
-- Name: netuno_user netuno_user_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY netuno_user
    ADD CONSTRAINT netuno_user_pkey PRIMARY KEY (id);


--
-- Name: netuno_user_rule netuno_user_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY netuno_user_rule
    ADD CONSTRAINT netuno_user_rule_pkey PRIMARY KEY (id);


--
-- Name: option option_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- Name: participant participant_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY participant
    ADD CONSTRAINT participant_pkey PRIMARY KEY (id);


--
-- Name: vote vote_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY vote
    ADD CONSTRAINT vote_pkey PRIMARY KEY (id);


--
-- Name: voting voting_pkey; Type: CONSTRAINT; Schema: public; Owner: netuno_revolut
--

ALTER TABLE ONLY voting
    ADD CONSTRAINT voting_pkey PRIMARY KEY (id);


--
-- Name: netuno_client_hit_client_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_client_hit_client_id_idx ON netuno_client_hit USING btree (client_id);


--
-- Name: netuno_client_hit_user_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_client_hit_user_id_idx ON netuno_client_hit USING btree (user_id);


--
-- Name: netuno_design_table_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_design_table_id_idx ON netuno_design USING btree (table_id);


--
-- Name: netuno_group_rule_group_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_group_rule_group_id_idx ON netuno_group_rule USING btree (group_id);


--
-- Name: netuno_group_rule_table_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_group_rule_table_id_idx ON netuno_group_rule USING btree (table_id);


--
-- Name: netuno_log_group_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_log_group_id_idx ON netuno_log USING btree (group_id);


--
-- Name: netuno_log_item_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_log_item_id_idx ON netuno_log USING btree (item_id);


--
-- Name: netuno_log_table_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_log_table_id_idx ON netuno_log USING btree (table_id);


--
-- Name: netuno_log_user_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_log_user_id_idx ON netuno_log USING btree (user_id);


--
-- Name: netuno_statistic_average_type_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_statistic_average_type_id_idx ON netuno_statistic_average USING btree (type_id);


--
-- Name: netuno_statistic_moment_type_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_statistic_moment_type_id_idx ON netuno_statistic_moment USING btree (type_id);


--
-- Name: netuno_table_group_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_table_group_id_idx ON netuno_table USING btree (group_id);


--
-- Name: netuno_table_parent_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_table_parent_id_idx ON netuno_table USING btree (parent_id);


--
-- Name: netuno_user_group_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_user_group_id_idx ON netuno_user USING btree (group_id);


--
-- Name: netuno_user_rule_table_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_user_rule_table_id_idx ON netuno_user_rule USING btree (table_id);


--
-- Name: netuno_user_rule_user_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX netuno_user_rule_user_id_idx ON netuno_user_rule USING btree (user_id);


--
-- Name: option_group_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX option_group_id_idx ON option USING btree (group_id);


--
-- Name: option_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX option_lastchange_user_id_idx ON option USING btree (lastchange_user_id);


--
-- Name: option_user_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX option_user_id_idx ON option USING btree (user_id);


--
-- Name: option_voting_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX option_voting_id_idx ON option USING btree (voting_id);


--
-- Name: participant_group_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX participant_group_id_idx ON participant USING btree (group_id);


--
-- Name: participant_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX participant_lastchange_user_id_idx ON participant USING btree (lastchange_user_id);


--
-- Name: participant_user_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX participant_user_id_idx ON participant USING btree (user_id);


--
-- Name: participant_voting_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX participant_voting_id_idx ON participant USING btree (voting_id);


--
-- Name: vote_group_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX vote_group_id_idx ON vote USING btree (group_id);


--
-- Name: vote_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX vote_lastchange_user_id_idx ON vote USING btree (lastchange_user_id);


--
-- Name: vote_option_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX vote_option_id_idx ON vote USING btree (option_id);


--
-- Name: vote_participant_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX vote_participant_id_idx ON vote USING btree (participant_id);


--
-- Name: vote_user_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX vote_user_id_idx ON vote USING btree (user_id);


--
-- Name: vote_voting_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX vote_voting_id_idx ON vote USING btree (voting_id);


--
-- Name: voting_group_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX voting_group_id_idx ON voting USING btree (group_id);


--
-- Name: voting_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX voting_lastchange_user_id_idx ON voting USING btree (lastchange_user_id);


--
-- Name: voting_user_id_idx; Type: INDEX; Schema: public; Owner: netuno_revolut
--

CREATE INDEX voting_user_id_idx ON voting USING btree (user_id);


--
-- PostgreSQL database dump complete
--


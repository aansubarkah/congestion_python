--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: c0ng3st10n; Type: COMMENT; Schema: -; Owner: user
--

COMMENT ON DATABASE c0ng3st10n IS 'dimanamacet database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: breeds; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE breeds (
    id bigint NOT NULL,
    kind_id bigint,
    user_id bigint,
    classification_id integer,
    trained boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true
);


ALTER TABLE breeds OWNER TO "user";

--
-- Name: TABLE breeds; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE breeds IS 'user manually input kind of tweet, HAM, SPAM or other';


--
-- Name: breeds_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE breeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE breeds_id_seq OWNER TO "user";

--
-- Name: breeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE breeds_id_seq OWNED BY breeds.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(255),
    active boolean DEFAULT true
);


ALTER TABLE categories OWNER TO "user";

--
-- Name: TABLE categories; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE categories IS 'Traffic condition like Macet, Padat';


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO "user";

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: chunks; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE chunks (
    id bigint NOT NULL,
    t_id bigint,
    place character varying(255),
    condition character varying(255),
    processed boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true,
    weather character varying(255),
    verified boolean DEFAULT false,
    kind_id bigint
);


ALTER TABLE chunks OWNER TO "user";

--
-- Name: TABLE chunks; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE chunks IS 'result from chunking text';


--
-- Name: chunks_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE chunks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chunks_id_seq OWNER TO "user";

--
-- Name: chunks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE chunks_id_seq OWNED BY chunks.id;


--
-- Name: claps; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE claps (
    id bigint NOT NULL,
    raw_id bigint,
    "userScreenName" character varying(255),
    "userID" bigint,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true
);


ALTER TABLE claps OWNER TO "user";

--
-- Name: TABLE claps; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE claps IS 'user who mentioned on tweet';


--
-- Name: claps_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE claps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE claps_id_seq OWNER TO "user";

--
-- Name: claps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE claps_id_seq OWNED BY claps.id;


--
-- Name: classifications; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE classifications (
    id integer NOT NULL,
    name character varying(255),
    active boolean DEFAULT true
);


ALTER TABLE classifications OWNER TO "user";

--
-- Name: TABLE classifications; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE classifications IS 'relevancy classification';


--
-- Name: classifications_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE classifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE classifications_id_seq OWNER TO "user";

--
-- Name: classifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE classifications_id_seq OWNED BY classifications.id;


--
-- Name: denominations; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE denominations (
    id bigint NOT NULL,
    raw_id bigint,
    classification_id integer,
    user_id bigint,
    "isTrained" boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true
);


ALTER TABLE denominations OWNER TO "user";

--
-- Name: TABLE denominations; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE denominations IS 'relevancy classify by human';


--
-- Name: denominations_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE denominations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE denominations_id_seq OWNER TO "user";

--
-- Name: denominations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE denominations_id_seq OWNED BY denominations.id;


--
-- Name: districts; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE districts (
    id integer NOT NULL,
    regency_id integer,
    name character varying(255),
    lat numeric(10,6),
    lng numeric(10,6),
    active boolean DEFAULT true
);


ALTER TABLE districts OWNER TO "user";

--
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE districts_id_seq OWNER TO "user";

--
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE districts_id_seq OWNED BY districts.id;


--
-- Name: elements; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE elements (
    id bigint NOT NULL,
    raw_id bigint,
    user_id bigint,
    weather_id integer,
    active boolean DEFAULT true
);


ALTER TABLE elements OWNER TO "user";

--
-- Name: TABLE elements; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE elements IS 'weather found on text, human input';


--
-- Name: elements_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE elements_id_seq OWNER TO "user";

--
-- Name: elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE elements_id_seq OWNED BY elements.id;


--
-- Name: errors; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE errors (
    id integer NOT NULL,
    name character varying(255),
    active boolean DEFAULT true
);


ALTER TABLE errors OWNER TO "user";

--
-- Name: TABLE errors; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE errors IS 'error list';


--
-- Name: errors_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE errors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE errors_id_seq OWNER TO "user";

--
-- Name: errors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE errors_id_seq OWNED BY errors.id;


--
-- Name: fails; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE fails (
    id bigint NOT NULL,
    raw_id bigint,
    error_id integer,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true
);


ALTER TABLE fails OWNER TO "user";

--
-- Name: TABLE fails; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE fails IS 'error found by system';


--
-- Name: fails_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE fails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fails_id_seq OWNER TO "user";

--
-- Name: fails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE fails_id_seq OWNED BY fails.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(255),
    active boolean DEFAULT true
);


ALTER TABLE groups OWNER TO "user";

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_id_seq OWNER TO "user";

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: hierarchies; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE hierarchies (
    id integer NOT NULL,
    name character varying(255),
    active boolean DEFAULT true
);


ALTER TABLE hierarchies OWNER TO "user";

--
-- Name: hierarchies_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE hierarchies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hierarchies_id_seq OWNER TO "user";

--
-- Name: hierarchies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE hierarchies_id_seq OWNED BY hierarchies.id;


--
-- Name: humans; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE humans (
    id bigint NOT NULL,
    t_id bigint,
    classification_id integer,
    place_id bigint,
    category_id integer,
    weather_id integer,
    info character varying(255),
    image character varying(255),
    processed boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true
);


ALTER TABLE humans OWNER TO "user";

--
-- Name: TABLE humans; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE humans IS 'result from user manually input';


--
-- Name: humans_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE humans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humans_id_seq OWNER TO "user";

--
-- Name: humans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE humans_id_seq OWNED BY humans.id;


--
-- Name: kinds; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE kinds (
    id bigint NOT NULL,
    raw_id bigint,
    classification_id integer,
    processed boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true,
    t_id bigint,
    verified boolean DEFAULT false,
    trained boolean DEFAULT false
);


ALTER TABLE kinds OWNER TO "user";

--
-- Name: TABLE kinds; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE kinds IS 'result from classifying text';


--
-- Name: kinds_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE kinds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kinds_id_seq OWNER TO "user";

--
-- Name: kinds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE kinds_id_seq OWNED BY kinds.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE locations (
    id bigint NOT NULL,
    raw_id bigint,
    user_id bigint,
    region_id integer,
    name character varying(255),
    lat numeric(10,6),
    lng numeric(10,6),
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true
);


ALTER TABLE locations OWNER TO "user";

--
-- Name: TABLE locations; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE locations IS 'place found on text, input by human';


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_id_seq OWNER TO "user";

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE logs (
    id bigint NOT NULL,
    user_id bigint DEFAULT 1,
    controller character varying(255),
    "controllerID" integer DEFAULT 1,
    action character varying(255),
    name character varying(255),
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true
);


ALTER TABLE logs OWNER TO "user";

--
-- Name: TABLE logs; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE logs IS 'for error log';


--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE logs_id_seq OWNER TO "user";

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE logs_id_seq OWNED BY logs.id;


--
-- Name: machines; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE machines (
    id bigint NOT NULL,
    t_id bigint,
    classification_id integer,
    place_id bigint,
    category_id integer,
    weather_id integer,
    info character varying(255),
    image character varying(255),
    processed boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true,
    spot_id bigint
);


ALTER TABLE machines OWNER TO "user";

--
-- Name: TABLE machines; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE machines IS 'result from processing text';


--
-- Name: machines_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE machines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE machines_id_seq OWNER TO "user";

--
-- Name: machines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE machines_id_seq OWNED BY machines.id;


--
-- Name: markers; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE markers (
    id bigint NOT NULL,
    category_id integer,
    user_id bigint,
    respondent_id bigint,
    weather_id integer,
    raw_id bigint,
    lat numeric(10,6),
    lng numeric(10,6),
    info text,
    "isPinned" boolean DEFAULT false,
    "isCleared" boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true,
    "isExported" boolean DEFAULT false
);


ALTER TABLE markers OWNER TO "user";

--
-- Name: markers_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE markers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE markers_id_seq OWNER TO "user";

--
-- Name: markers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE markers_id_seq OWNED BY markers.id;


--
-- Name: pieces; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE pieces (
    id bigint NOT NULL,
    chunk_id bigint,
    user_id bigint,
    place character varying(255),
    condition character varying(255),
    weather character varying(255),
    trained boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true
);


ALTER TABLE pieces OWNER TO "user";

--
-- Name: TABLE pieces; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE pieces IS 'user manually input chunk of twitter';


--
-- Name: pieces_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE pieces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pieces_id_seq OWNER TO "user";

--
-- Name: pieces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE pieces_id_seq OWNED BY pieces.id;


--
-- Name: places; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE places (
    id bigint NOT NULL,
    regency_id integer,
    name character varying(255),
    lat numeric(10,6),
    lng numeric(10,6),
    active boolean DEFAULT true
);


ALTER TABLE places OWNER TO "user";

--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE places_id_seq OWNER TO "user";

--
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE places_id_seq OWNED BY places.id;


--
-- Name: raws; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE raws (
    id bigint NOT NULL,
    respondent_id bigint,
    t_id bigint,
    t_time timestamp without time zone,
    info character varying(255),
    url character varying(255),
    media character varying(255),
    width integer DEFAULT 0,
    height integer DEFAULT 0,
    processed boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true
);


ALTER TABLE raws OWNER TO "user";

--
-- Name: raws_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE raws_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE raws_id_seq OWNER TO "user";

--
-- Name: raws_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE raws_id_seq OWNED BY raws.id;


--
-- Name: regencies; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE regencies (
    id integer NOT NULL,
    state_id integer,
    hierarchy_id integer,
    name character varying(255),
    lat numeric(10,6),
    lng numeric(10,6),
    active boolean DEFAULT true,
    alias character varying(255)
);


ALTER TABLE regencies OWNER TO "user";

--
-- Name: regencies_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE regencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE regencies_id_seq OWNER TO "user";

--
-- Name: regencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE regencies_id_seq OWNED BY regencies.id;


--
-- Name: regencies_regions; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE regencies_regions (
    id integer NOT NULL,
    regency_id integer,
    region_id integer,
    active boolean DEFAULT true
);


ALTER TABLE regencies_regions OWNER TO "user";

--
-- Name: regencies_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE regencies_regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE regencies_regions_id_seq OWNER TO "user";

--
-- Name: regencies_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE regencies_regions_id_seq OWNED BY regencies_regions.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE regions (
    id integer NOT NULL,
    lat numeric(10,6),
    lng numeric(10,6),
    name character varying(255),
    active boolean DEFAULT true,
    description character varying(255)
);


ALTER TABLE regions OWNER TO "user";

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE regions_id_seq OWNER TO "user";

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE regions_id_seq OWNED BY regions.id;


--
-- Name: respondents; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE respondents (
    id bigint NOT NULL,
    region_id integer,
    t_user_id bigint DEFAULT 0,
    name character varying(255),
    t_user_screen_name character varying(255),
    official boolean DEFAULT false,
    active boolean DEFAULT true,
    tmc boolean DEFAULT false
);


ALTER TABLE respondents OWNER TO "user";

--
-- Name: respondents_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE respondents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE respondents_id_seq OWNER TO "user";

--
-- Name: respondents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE respondents_id_seq OWNED BY respondents.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE reviews (
    id bigint NOT NULL,
    raw_id bigint,
    error_id integer,
    user_id bigint,
    explanation text,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true
);


ALTER TABLE reviews OWNER TO "user";

--
-- Name: TABLE reviews; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE reviews IS 'review machine process, input by human';


--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_id_seq OWNER TO "user";

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: spaces; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE spaces (
    id bigint NOT NULL,
    spot_id bigint,
    user_id bigint,
    place_id bigint,
    active boolean DEFAULT true
);


ALTER TABLE spaces OWNER TO "user";

--
-- Name: TABLE spaces; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE spaces IS 'user manually input place of twitter';


--
-- Name: spaces_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE spaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spaces_id_seq OWNER TO "user";

--
-- Name: spaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE spaces_id_seq OWNED BY spaces.id;


--
-- Name: spots; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE spots (
    id bigint NOT NULL,
    chunk_id bigint,
    t_id bigint,
    place_id bigint,
    category_id integer,
    processed boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true,
    score numeric(10,9)
);


ALTER TABLE spots OWNER TO "user";

--
-- Name: TABLE spots; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE spots IS 'place and category extracted from text';


--
-- Name: spots_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE spots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spots_id_seq OWNER TO "user";

--
-- Name: spots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE spots_id_seq OWNED BY spots.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE states (
    id integer NOT NULL,
    name character varying(255),
    active boolean DEFAULT true
);


ALTER TABLE states OWNER TO "user";

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE states_id_seq OWNER TO "user";

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- Name: syllables; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE syllables (
    id bigint NOT NULL,
    user_id bigint,
    word_id bigint,
    trained boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true,
    word character varying(255)
);


ALTER TABLE syllables OWNER TO "user";

--
-- Name: TABLE syllables; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE syllables IS 'user manually input words of tweet';


--
-- Name: syllables_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE syllables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE syllables_id_seq OWNER TO "user";

--
-- Name: syllables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE syllables_id_seq OWNED BY syllables.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    example character varying(255),
    active boolean DEFAULT true
);


ALTER TABLE tags OWNER TO "user";

--
-- Name: TABLE tags; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE tags IS 'POS TAG';


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO "user";

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    group_id integer,
    region_id integer,
    username character varying(255),
    email character varying(255),
    password character varying(255),
    active boolean DEFAULT true,
    t_user_id bigint
);


ALTER TABLE users OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: weather; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE weather (
    id integer NOT NULL,
    name character varying(255),
    active boolean DEFAULT true
);


ALTER TABLE weather OWNER TO "user";

--
-- Name: weathers_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE weathers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE weathers_id_seq OWNER TO "user";

--
-- Name: weathers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE weathers_id_seq OWNED BY weather.id;


--
-- Name: words; Type: TABLE; Schema: public; Owner: user; Tablespace: 
--

CREATE TABLE words (
    id bigint NOT NULL,
    t_id bigint,
    tag_id integer,
    user_id bigint,
    sequence integer,
    word character varying(255),
    verified boolean DEFAULT false,
    trained boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    active boolean DEFAULT true
);


ALTER TABLE words OWNER TO "user";

--
-- Name: TABLE words; Type: COMMENT; Schema: public; Owner: user
--

COMMENT ON TABLE words IS 'word pos tagger';


--
-- Name: words_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE words_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE words_id_seq OWNER TO "user";

--
-- Name: words_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE words_id_seq OWNED BY words.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY breeds ALTER COLUMN id SET DEFAULT nextval('breeds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY chunks ALTER COLUMN id SET DEFAULT nextval('chunks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY claps ALTER COLUMN id SET DEFAULT nextval('claps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY classifications ALTER COLUMN id SET DEFAULT nextval('classifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY denominations ALTER COLUMN id SET DEFAULT nextval('denominations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY districts ALTER COLUMN id SET DEFAULT nextval('districts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY elements ALTER COLUMN id SET DEFAULT nextval('elements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY errors ALTER COLUMN id SET DEFAULT nextval('errors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY fails ALTER COLUMN id SET DEFAULT nextval('fails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY hierarchies ALTER COLUMN id SET DEFAULT nextval('hierarchies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY humans ALTER COLUMN id SET DEFAULT nextval('humans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY kinds ALTER COLUMN id SET DEFAULT nextval('kinds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY logs ALTER COLUMN id SET DEFAULT nextval('logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY machines ALTER COLUMN id SET DEFAULT nextval('machines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY markers ALTER COLUMN id SET DEFAULT nextval('markers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY pieces ALTER COLUMN id SET DEFAULT nextval('pieces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY places ALTER COLUMN id SET DEFAULT nextval('places_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY raws ALTER COLUMN id SET DEFAULT nextval('raws_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY regencies ALTER COLUMN id SET DEFAULT nextval('regencies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY regencies_regions ALTER COLUMN id SET DEFAULT nextval('regencies_regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY regions ALTER COLUMN id SET DEFAULT nextval('regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY respondents ALTER COLUMN id SET DEFAULT nextval('respondents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY spaces ALTER COLUMN id SET DEFAULT nextval('spaces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY spots ALTER COLUMN id SET DEFAULT nextval('spots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY syllables ALTER COLUMN id SET DEFAULT nextval('syllables_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY weather ALTER COLUMN id SET DEFAULT nextval('weathers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY words ALTER COLUMN id SET DEFAULT nextval('words_id_seq'::regclass);


--
-- Data for Name: breeds; Type: TABLE DATA; Schema: public; Owner: user
--

COPY breeds (id, kind_id, user_id, classification_id, trained, created, modified, active) FROM stdin;
\.


--
-- Name: breeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('breeds_id_seq', 1, false);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: user
--

COPY categories (id, name, active) FROM stdin;
1	Macet	t
2	Padat	t
3	Lancar	t
4	Kecelakaan	t
5	Waspada	t
6	Ramai Lancar	t
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('categories_id_seq', 6, true);


--
-- Data for Name: chunks; Type: TABLE DATA; Schema: public; Owner: user
--

COPY chunks (id, t_id, place, condition, processed, created, modified, active, weather, verified, kind_id) FROM stdin;
\.


--
-- Name: chunks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('chunks_id_seq', 1, true);


--
-- Data for Name: claps; Type: TABLE DATA; Schema: public; Owner: user
--

COPY claps (id, raw_id, "userScreenName", "userID", created, modified, active) FROM stdin;
\.


--
-- Name: claps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('claps_id_seq', 1, false);


--
-- Data for Name: classifications; Type: TABLE DATA; Schema: public; Owner: user
--

COPY classifications (id, name, active) FROM stdin;
1	HAM	t
2	SPAM	t
3	Some section relevant	t
4	Info in the picture	t
\.


--
-- Name: classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('classifications_id_seq', 1, false);


--
-- Data for Name: denominations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY denominations (id, raw_id, classification_id, user_id, "isTrained", created, modified, active) FROM stdin;
\.


--
-- Name: denominations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('denominations_id_seq', 1, false);


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: user
--

COPY districts (id, regency_id, name, lat, lng, active) FROM stdin;
1	1	Arongan Lambalek	\N	\N	t
2	1	Bubon	\N	\N	t
3	1	Johan Pahwalan	\N	\N	t
4	1	Kaway XVI	\N	\N	t
5	1	Meureubo	\N	\N	t
6	1	Pante Ceureumen	\N	\N	t
7	1	Panton Reu	\N	\N	t
8	1	Samatiga	\N	\N	t
9	1	Sungai Mas	\N	\N	t
10	1	Woyla	\N	\N	t
11	1	Woyla Barat	\N	\N	t
12	1	Woyla Timur	\N	\N	t
13	2	Babah Rot	\N	\N	t
14	2	Blang Pidie	\N	\N	t
15	2	Jeumpa	\N	\N	t
16	2	Kuala Batee	\N	\N	t
17	2	Lembah Sabil	\N	\N	t
18	2	Manggeng	\N	\N	t
19	2	Setia	\N	\N	t
20	2	Susoh	\N	\N	t
21	2	Tangan-Tangan	\N	\N	t
22	3	Baitussalam	\N	\N	t
23	3	Blang Bintang	\N	\N	t
24	3	Darul Imarah	\N	\N	t
25	3	Darul Kamal	\N	\N	t
26	3	Darussalam	\N	\N	t
27	3	Indrapuri	\N	\N	t
28	3	Ingin Jaya	\N	\N	t
29	3	Kota Cot Glie	\N	\N	t
30	3	Kota Jantho	\N	\N	t
31	3	Krueng Barona Jaya	\N	\N	t
32	3	Kuta Baro	\N	\N	t
33	3	Kuta Malaka	\N	\N	t
34	3	Lembah Seulawah	\N	\N	t
35	3	Leupung	\N	\N	t
36	3	Lhoknga	\N	\N	t
37	3	Lhoong	\N	\N	t
38	3	Mesjid Raya	\N	\N	t
39	3	Montasik	\N	\N	t
40	3	Peukan Bada	\N	\N	t
41	3	Pulo Aceh	\N	\N	t
42	3	Seulimeum	\N	\N	t
43	3	Simpang Tiga	\N	\N	t
44	3	Sukamakmur	\N	\N	t
45	4	Darul Hikmah	\N	\N	t
46	4	Indra Jaya	\N	\N	t
47	4	Jaya	\N	\N	t
48	4	Krueng Sabee	\N	\N	t
49	4	Panga	\N	\N	t
50	4	Pasie Raya	\N	\N	t
51	4	Sampoiniet	\N	\N	t
52	4	Setia Bhakti	\N	\N	t
53	4	Teunom	\N	\N	t
54	5	Bakongan	\N	\N	t
55	5	Bakongan Timur	\N	\N	t
56	5	Kluet Selatan	\N	\N	t
57	5	Kluet Tengah	\N	\N	t
58	5	Kluet Timur	\N	\N	t
59	5	Kluet Utara	\N	\N	t
60	5	Kota Bahagia	\N	\N	t
61	5	Labuhan Haji	\N	\N	t
62	5	Labuhan Haji Barat	\N	\N	t
63	5	Labuhan Haji Timur	\N	\N	t
64	5	Meukek	\N	\N	t
65	5	Pasi Raja	\N	\N	t
66	5	Samadua	\N	\N	t
67	5	Sawang	\N	\N	t
68	5	Tapaktuan	\N	\N	t
69	5	Trumon	\N	\N	t
70	5	Trumon Tengah	\N	\N	t
71	5	Trumon Timur	\N	\N	t
72	6	Danau Paris	\N	\N	t
73	6	Gunung Meriah	\N	\N	t
74	6	Kota Baharu	\N	\N	t
75	6	Kuala Baru	\N	\N	t
76	6	Pulau Banyak	\N	\N	t
77	6	Pulau Banyak Barat	\N	\N	t
78	6	Simpang Kanan	\N	\N	t
79	6	Singkil	\N	\N	t
80	6	Singkil Utara	\N	\N	t
81	6	Singkohor	\N	\N	t
82	6	Suro Makmur	\N	\N	t
83	7	Banda Mulia	\N	\N	t
84	7	Bandar Pusaka	\N	\N	t
85	7	Bendahara	\N	\N	t
86	7	Karang Baru	\N	\N	t
87	7	Kejuruan Muda	\N	\N	t
88	7	Kota Kualasinpang	\N	\N	t
89	7	Manyak Payed	\N	\N	t
90	7	Rantau	\N	\N	t
91	7	Sekerak	\N	\N	t
92	7	Seruway	\N	\N	t
93	7	Tamiang Hulu	\N	\N	t
94	7	Tenggulun	\N	\N	t
95	8	Atu Lintang	\N	\N	t
96	8	Bebesen	\N	\N	t
97	8	Bies	\N	\N	t
98	8	Bintang	\N	\N	t
99	8	Celala	\N	\N	t
100	8	Jagong Jeget	\N	\N	t
101	8	Kebayakan	\N	\N	t
102	8	Ketol	\N	\N	t
103	8	Kute Panang	\N	\N	t
104	8	Laut Tawar	\N	\N	t
105	8	Linge	\N	\N	t
106	8	Pegasing	\N	\N	t
107	8	Rusip Antara	\N	\N	t
108	8	Silih Nara	\N	\N	t
109	9	Babul Makmur	\N	\N	t
110	9	Babul Rahmah	\N	\N	t
111	9	Babussalam	\N	\N	t
112	9	Badar	\N	\N	t
113	9	Bambel	\N	\N	t
114	9	Bukit Tusam	\N	\N	t
115	9	Darul Hasanah	\N	\N	t
116	9	Deleng Pokhkisen	\N	\N	t
117	9	Ketambe	\N	\N	t
118	9	Lawe Alas	\N	\N	t
119	9	Lawe Bulan	\N	\N	t
120	9	Lawe Sigala-Gala	\N	\N	t
121	9	Lawe Sumur	\N	\N	t
122	9	Leuser	\N	\N	t
123	9	Semadam	\N	\N	t
124	9	Tanoh Alas	\N	\N	t
125	10	Banda Alam	\N	\N	t
126	10	Birem Bayeun	\N	\N	t
127	10	Darul Aman	\N	\N	t
128	10	Darul Falah	\N	\N	t
129	10	Darul Ihsan	\N	\N	t
130	10	Idi Rayeuk	\N	\N	t
131	10	Idi Timur	\N	\N	t
132	10	Idi Tunong	\N	\N	t
133	10	Indra Makmu	\N	\N	t
134	10	Julok	\N	\N	t
135	10	Madat	\N	\N	t
136	10	Nurussalam	\N	\N	t
137	10	Pante Bidari	\N	\N	t
138	10	Peudawa	\N	\N	t
139	10	Peunaron	\N	\N	t
140	10	Peureulak	\N	\N	t
141	10	Peureulak Barat	\N	\N	t
142	10	Peureulak Timur	\N	\N	t
143	10	Rantau Peureulak	\N	\N	t
144	10	Rantau Selamat	\N	\N	t
145	10	Serbajadi	\N	\N	t
146	10	Simpang Jernih	\N	\N	t
147	10	Simpang Ulim	\N	\N	t
148	10	Sungai Raya	\N	\N	t
149	11	Baktiya	\N	\N	t
150	11	Baktiya Barat	\N	\N	t
151	11	Banda Baro	\N	\N	t
152	11	Cot Girek	\N	\N	t
153	11	Dewantara	\N	\N	t
154	11	Geuredong Pase	\N	\N	t
155	11	Kuta Makmur	\N	\N	t
156	11	Langkahan	\N	\N	t
157	11	Lapang	\N	\N	t
158	11	Lhoksukon	\N	\N	t
159	11	Matangkuli	\N	\N	t
160	11	Meurah Mulia	\N	\N	t
161	11	Muara Batu	\N	\N	t
162	11	Nibong	\N	\N	t
163	11	Nisam	\N	\N	t
164	11	Nisam Antara	\N	\N	t
165	11	Paya Bakong	\N	\N	t
166	11	Pirak Timur	\N	\N	t
167	11	Samudera	\N	\N	t
168	11	Sawang	\N	\N	t
169	11	Seunuddon	\N	\N	t
170	11	Simpang Kramat	\N	\N	t
171	11	Syamtalira Aron	\N	\N	t
172	11	Syamtalira Bayu	\N	\N	t
173	11	T. Jambo Aye	\N	\N	t
174	11	Tanah Luas	\N	\N	t
175	11	Tanah Pasir	\N	\N	t
176	12	Bandar	\N	\N	t
177	12	Bener Kelipah	\N	\N	t
178	12	Bukit	\N	\N	t
179	12	Gajah Putih	\N	\N	t
180	12	Mesidah	\N	\N	t
181	12	Permata	\N	\N	t
182	12	Pintu Rime Gayo	\N	\N	t
183	12	Syiah Utama	\N	\N	t
184	12	Timang gajah	\N	\N	t
185	12	Wih Pesam	\N	\N	t
186	13	Gandapura	\N	\N	t
187	13	Jangka	\N	\N	t
188	13	Jeumpa	\N	\N	t
189	13	Jeunieb	\N	\N	t
190	13	Juli	\N	\N	t
191	13	Kota Juang	\N	\N	t
192	13	Kuala	\N	\N	t
193	13	Kuta Blang	\N	\N	t
194	13	Makmur	\N	\N	t
195	13	Pandrah	\N	\N	t
196	13	Peudada	\N	\N	t
197	13	Peulimbang	\N	\N	t
198	13	Peusangan	\N	\N	t
199	13	Peusangan Selatan	\N	\N	t
200	13	Peusangan Siblah Krueng	\N	\N	t
201	13	Samalanga	\N	\N	t
202	13	Simpang Mamplam	\N	\N	t
203	14	Blangjerango	\N	\N	t
204	14	Blangkejeren	\N	\N	t
205	14	Blangpegayon	\N	\N	t
206	14	Dabun Gelang	\N	\N	t
207	14	Kutapanjang	\N	\N	t
208	14	Pantan Cuaca	\N	\N	t
209	14	Pining	\N	\N	t
210	14	Puteri Betung	\N	\N	t
211	14	Rikit Gaib	\N	\N	t
212	14	Terangun	\N	\N	t
213	14	Teripe Jaya	\N	\N	t
214	15	Beutong	\N	\N	t
215	15	Beutong Ateuh Banggalang	\N	\N	t
216	15	Darul Makmur	\N	\N	t
217	15	Kuala	\N	\N	t
218	15	Kuala Pesisir	\N	\N	t
219	15	Seunagan	\N	\N	t
220	15	Seunagan Timur	\N	\N	t
221	15	Suka Makmue	\N	\N	t
222	15	Tadu Raya	\N	\N	t
223	15	Tripa Makmur	\N	\N	t
224	16	Batee	\N	\N	t
225	16	Delima	\N	\N	t
226	16	Geulumpang Tiga	\N	\N	t
227	16	Geumpang	\N	\N	t
228	16	Glumpang Baro	\N	\N	t
229	16	Grong-grong	\N	\N	t
230	16	Indra Jaya	\N	\N	t
231	16	Kembang Tanjong	\N	\N	t
232	16	Keumala	\N	\N	t
233	16	Kota Sigli	\N	\N	t
234	16	Mane	\N	\N	t
235	16	Mila	\N	\N	t
236	16	Muara Tiga	\N	\N	t
237	16	Mutiara	\N	\N	t
238	16	Mutiara Timur	\N	\N	t
239	16	Padang Tiji	\N	\N	t
240	16	Peukan Baro	\N	\N	t
241	16	Pidie	\N	\N	t
242	16	Sakti	\N	\N	t
243	16	Simpang Tiga	\N	\N	t
244	16	Tangse	\N	\N	t
245	16	Tiro/Truseb	\N	\N	t
246	16	Titeue	\N	\N	t
247	17	Bandar Baru	\N	\N	t
248	17	Bandar Dua	\N	\N	t
249	17	Jangka Buaya	\N	\N	t
250	17	Meurah Dua	\N	\N	t
251	17	Meureudu	\N	\N	t
252	17	Panteraja	\N	\N	t
253	17	Trienggadeng	\N	\N	t
254	17	Ulim	\N	\N	t
255	18	Alapan	\N	\N	t
256	18	Salang	\N	\N	t
257	18	Simeulue Barat	\N	\N	t
258	18	Simeulue Cut	\N	\N	t
259	18	Simeulue Tengah	\N	\N	t
260	18	Simeulue Timur	\N	\N	t
261	18	Teluk Dalam	\N	\N	t
262	18	Teupah Barat	\N	\N	t
263	18	Teupah Selatan	\N	\N	t
264	18	Teupah Tengah	\N	\N	t
265	19	Baiturrahman	\N	\N	t
266	19	Banda Raya	\N	\N	t
267	19	Jaya Baru	\N	\N	t
268	19	Kuta Alam	\N	\N	t
269	19	Kuta Raja	\N	\N	t
270	19	Lueng Bata	\N	\N	t
271	19	Meuraxa	\N	\N	t
272	19	Syiah Kuala	\N	\N	t
273	19	Ulee Kareng	\N	\N	t
274	20	Langsa Barat	\N	\N	t
275	20	Langsa Baro	\N	\N	t
276	20	Langsa Kota	\N	\N	t
277	20	Langsa Lama	\N	\N	t
278	20	Langsa Timur	\N	\N	t
279	21	Banda Sakti	\N	\N	t
280	21	Blang Mangat	\N	\N	t
281	21	Muara Dua	\N	\N	t
282	21	Muara Satu	\N	\N	t
283	22	Sukajaya	\N	\N	t
284	22	Sukakarya	\N	\N	t
285	23	Longkib	\N	\N	t
286	23	Penanggalan	\N	\N	t
287	23	Rundeng	\N	\N	t
288	23	Simpang Kiri	\N	\N	t
289	23	Sultan Daulat	\N	\N	t
290	24	Abiansemal	\N	\N	t
291	24	Kuta	\N	\N	t
292	24	Kuta Selatan	\N	\N	t
293	24	Kuta Utara	\N	\N	t
294	24	Mengwi	\N	\N	t
295	24	Petang	\N	\N	t
296	25	Bangli	\N	\N	t
297	25	Kintamani	\N	\N	t
298	25	Susut	\N	\N	t
299	25	Tembuku	\N	\N	t
300	26	Banjar	\N	\N	t
301	26	Buleleng	\N	\N	t
302	26	Busung biu	\N	\N	t
303	26	Gerokgak	\N	\N	t
304	26	Kubutambahan	\N	\N	t
305	26	Sawan	\N	\N	t
306	26	Seririt	\N	\N	t
307	26	Sukasada	\N	\N	t
308	26	Tejakula	\N	\N	t
309	27	Blahbatuh	\N	\N	t
310	27	Gianyar	\N	\N	t
311	27	Payangan	\N	\N	t
312	27	Sukawati	\N	\N	t
313	27	Tampaksiring	\N	\N	t
314	27	Tegalallang	\N	\N	t
315	27	Ubud	\N	\N	t
316	28	Jembrana	\N	\N	t
317	28	Melaya	\N	\N	t
318	28	Mendoyo	\N	\N	t
319	28	Negara	\N	\N	t
320	28	Pekutatan	\N	\N	t
321	29	Abang	\N	\N	t
322	29	Bebandem	\N	\N	t
323	29	Karangasem	\N	\N	t
324	29	Kubu	\N	\N	t
325	29	Manggis	\N	\N	t
326	29	Rendang	\N	\N	t
327	29	Selat	\N	\N	t
328	29	Sidemen	\N	\N	t
329	30	Banjarangkan	\N	\N	t
330	30	Dawan	\N	\N	t
331	30	Klungkung	\N	\N	t
332	30	Nusa Penida	\N	\N	t
333	31	Baturiti	\N	\N	t
334	31	Kediri	\N	\N	t
335	31	Kerambitan	\N	\N	t
336	31	Marga	\N	\N	t
337	31	Penebel	\N	\N	t
338	31	Pupuan	\N	\N	t
339	31	Salamadeg Timur	\N	\N	t
340	31	Salemadeg Barat	\N	\N	t
341	31	Selemadeg	\N	\N	t
342	31	Tabanan	\N	\N	t
343	32	Denpasar Barat	\N	\N	t
344	32	Denpasar Selatan	\N	\N	t
345	32	Denpasar Timur	\N	\N	t
346	32	Denpasar Utara	\N	\N	t
347	33	Banjarsari	-6.604235	105.981735	t
348	33	Bayah	-6.923987	106.311066	t
349	33	Bojongmanik	-6.577423	106.169853	t
350	33	Cibadak	-6.333964	106.222794	t
351	33	Cibeber	-6.787429	106.369926	t
352	33	Cigemlong	-6.742582	106.169853	t
353	33	Cihara	-6.826934	106.122810	t
354	33	Cijaku	-6.715918	106.040504	t
355	33	Cikulur	-6.392903	106.146332	t
356	33	Cileles	-6.507986	106.087532	t
357	33	Cilograng	-6.921508	106.381699	t
358	33	Cimarga	-6.462222	106.228683	t
359	33	Cipanas	-6.550581	106.358154	t
360	33	Cirinten	-6.640089	106.146332	t
361	33	Curug bitung	-6.425619	106.405251	t
362	33	Gunungkencana	-6.562761	106.066956	t
363	33	Kalanganyar	-6.384932	106.234566	t
364	33	Lebakgedong	-6.631412	106.405251	t
365	33	Leuwidamar	-6.544570	106.228683	t
366	33	Maja	-6.365542	106.358154	t
367	33	Malingping	-6.768812	106.005241	t
368	33	Muncang	-6.552925	106.287521	t
369	33	Panggarangan	-6.833658	106.228683	t
370	33	Rangkasbitung	-6.365650	106.246399	t
371	33	Sajira	-6.469045	106.334602	t
372	33	Sobang	-6.655211	106.311066	t
373	33	Wanasalam	-6.771959	105.911240	t
374	33	Warunggunung	-6.330516	106.169853	t
375	34	Angsana	-6.583333	105.849998	t
376	34	Banjar	-6.378801	106.105171	t
377	34	Bojong	-6.459902	105.981735	t
378	34	Cadasari	-6.265849	106.105171	t
379	34	Carita	-6.257936	105.864258	t
380	34	Cibaliung	-6.725251	105.758591	t
381	34	Cibitung	-6.809677	105.711647	t
382	34	Cigeulis	-6.604171	105.664711	t
383	34	Cikedal	-6.385872	105.881874	t
384	34	Cikeusik	-6.722159	105.852516	t
385	34	Cimanggu	-6.739063	105.652985	t
386	34	Cimanuk	-6.350208	106.034630	t
387	34	Cipeucang	-6.371137	106.022873	t
388	34	Cisata	-6.415632	105.917114	t
389	34	Jiput	-6.318846	105.887749	t
390	34	Kaduhejo	-6.318648	106.058144	t
391	34	Karang Tanjung	-6.283362	106.118149	t
392	34	Koroncong	-6.316050	106.140450	t
393	34	Labuan	-6.366767	105.834900	t
394	34	Majasari	-6.307639	106.081657	t
395	34	Mandalawangi	-6.312513	105.982300	t
396	34	Mekarjaya	-6.395159	106.075775	t
397	34	Menes	-6.384392	105.928864	t
398	34	Munjul	-6.637904	105.899498	t
399	34	Pagelaran	-6.422451	105.864258	t
400	34	Pandeglang	-6.327061	106.116928	t
401	34	Panimbang	-6.532236	105.652985	t
402	34	Patia	-6.483510	105.887749	t
403	34	Picung	-6.501862	105.958237	t
404	34	Pulosari	-6.337935	105.934738	t
405	34	Saketi	-6.398150	105.981735	t
406	34	Sindangresmi	-6.544617	105.911240	t
407	34	Sobang	-6.611107	105.770332	t
408	34	Sukaresmi	-6.490349	105.834900	t
409	34	Sumur	-6.661655	105.577797	t
410	35	Anyar	-6.092461	105.911240	t
411	35	Bandung	-6.218566	106.305176	t
412	35	Baros	-6.229405	106.122810	t
413	35	Binuang	-6.135224	106.352264	t
414	35	Bojonegara	-5.964862	106.075775	t
415	35	Carenang	-6.080285	106.311066	t
416	35	Cikande	-6.180835	106.358345	t
417	35	Cikeusal	-6.170100	106.052261	t
418	35	Cinangka	-6.175133	105.887749	t
419	35	Ciomas	-6.252846	106.028748	t
420	35	Ciruas	-6.097609	106.246330	t
421	35	Gunung Sari	-6.162868	106.037567	t
422	35	Jawilan	-6.279662	106.352119	t
423	35	Kibin	-6.156781	106.316948	t
424	35	Kopo	-6.277795	106.375816	t
425	35	Kragilan	-6.138068	106.294197	t
426	35	Kramatwatu	-6.045161	106.122810	t
427	35	Lebak Wangi	-6.078727	106.278694	t
428	35	Mancak	-6.110807	105.981735	t
429	35	Pabuaran	-6.194445	106.093414	t
430	35	Padarincang	-6.213995	105.958237	t
431	35	Pamarayan	-6.284986	106.311066	t
432	35	Petir	-6.247699	106.193382	t
433	35	Pontang	-6.040869	106.263985	t
434	35	Pulo Ampel	-5.916134	106.084595	t
435	35	Tanara	-6.016852	106.381699	t
436	35	Tirtayasa	-5.998603	106.311066	t
437	35	Tunjung Teja	-6.282288	106.234566	t
438	35	Waringinkurung	-6.087486	106.075775	t
439	36	Balaraja	-6.203863	106.446480	t
440	36	Cikupa	-6.216774	106.523056	t
441	36	Cisauk	-6.341140	106.635025	t
442	36	Cisoka	-6.261486	106.405251	t
443	36	Curug	-6.235727	106.570190	t
444	36	Gunung Kaler	-6.093608	106.375816	t
445	36	Jambe	-6.325254	106.493599	t
446	36	Jayanti	-6.205355	106.399368	t
447	36	Kelapa Dua	-6.239516	106.611450	t
448	36	Kemiri	-6.091045	106.458260	t
449	36	Kosambi	-6.073447	106.693977	t
450	36	Kresek	-6.143977	106.399368	t
451	36	Kronjo	-6.076643	106.428810	t
452	36	Legok	-6.297153	106.570190	t
453	36	Mauk	-6.053300	106.523056	t
454	36	Mekar Baru	-6.070170	106.390533	t
455	36	Pagedangan	-6.295621	106.617340	t
456	36	Pakuhaji	-6.050359	106.617340	t
457	36	Panongan	-6.257713	106.523056	t
458	36	Pasar Kemis	-6.181926	106.533363	t
459	36	Rajeg	-6.115290	106.499489	t
460	36	Sepatan	-6.117987	106.576088	t
461	36	Sepatan Timur	-6.116870	106.611450	t
462	36	Sindang Jaya	-6.176610	106.499489	t
463	36	Solear	-6.307035	106.422920	t
464	36	Sukadiri	-6.077523	106.564301	t
465	36	Sukamulya	-6.158390	106.428810	t
466	36	Teluknaga	-6.048882	106.664497	t
467	36	Tigaraksa	-6.261888	106.483742	t
468	37	Cibeber	-6.035438	106.067383	t
469	37	Cilegon	-6.002534	106.011124	t
470	37	Citangkil	-6.012753	106.011124	t
471	37	Ciwandan	-6.034603	105.964111	t
472	37	Gerogol	-5.973832	106.031693	t
473	37	Jombang	-6.010992	106.069893	t
474	37	Pulomerak	-5.920506	106.022873	t
475	37	Purwakarta	-5.991266	106.046387	t
476	38	Cipocok Jaya	-6.151660	106.152214	t
477	38	Curug	-6.186953	106.169853	t
478	38	Kasemen	-6.053595	106.181618	t
479	38	Serang	-6.110366	106.163979	t
480	38	Taktakan	-6.127697	106.099289	t
481	38	Walantaka	-6.149478	106.222794	t
482	39	Batuceper	-6.165682	106.682190	t
483	39	Benda	-6.130503	106.664497	t
484	39	Cibodas	-6.198983	106.599663	t
485	39	Ciledug	-6.236467	106.705772	t
486	39	Cipondoh	-6.186116	106.682190	t
487	39	Jatiuwung	-6.199737	106.576088	t
488	39	Karang Tengah	-6.205796	106.705772	t
489	39	Karawaci	-6.180585	106.620201	t
490	39	Larangan	-6.235702	106.729362	t
491	39	Neglasari	-6.147133	106.623238	t
492	39	Periuk	-6.158099	106.599663	t
493	39	Pinang	-6.212238	106.664497	t
494	39	Tangerang	-6.202394	106.652710	t
495	40	Ciputat	-6.307706	106.717567	t
496	40	Ciputat Timur	-6.308507	106.756523	t
497	40	Pamulang	-6.347892	106.741158	t
498	40	Pondok Aren	-6.284575	106.697495	t
499	40	Serpong	-6.308865	106.682190	t
500	40	Serpong Utara	-6.258454	106.658607	t
501	40	Setu	-6.350226	106.670395	t
502	41	Air Nipis	\N	\N	t
503	41	Bunga Mas	\N	\N	t
504	41	Kedurang	\N	\N	t
505	41	Kedurang Ilir	\N	\N	t
506	41	Kota Manna	\N	\N	t
507	41	Manna	\N	\N	t
508	41	Pasar Manna	\N	\N	t
509	41	Pino	\N	\N	t
510	41	Pino Raya	\N	\N	t
511	41	Seginim	\N	\N	t
512	41	Ulu Manna	\N	\N	t
513	42	Bang Haji	\N	\N	t
514	42	Karang Tinggi	\N	\N	t
515	42	Merigi Kelindang	\N	\N	t
516	42	Merigi Sakti	\N	\N	t
517	42	Pagar Jati	\N	\N	t
518	42	Pematang Tiga	\N	\N	t
519	42	Pondok Kelapa	\N	\N	t
520	42	Pondok Kubang	\N	\N	t
521	42	Taba Penanjung	\N	\N	t
522	42	Talang Empat	\N	\N	t
523	43	Air Besi	\N	\N	t
524	43	Air Napal	\N	\N	t
525	43	Air Padang	\N	\N	t
526	43	Arma Jaya	\N	\N	t
527	43	Batik Nau	\N	\N	t
528	43	Enggano	\N	\N	t
529	43	Giri Mulya	\N	\N	t
530	43	Hulu Palik	\N	\N	t
531	43	Kerkap	\N	\N	t
532	43	Ketahun	\N	\N	t
533	43	Kota Arga Makmur	\N	\N	t
534	43	Lais	\N	\N	t
535	43	Napal Putih	\N	\N	t
536	43	Padang Jaya	\N	\N	t
537	43	Putri Hijau	\N	\N	t
538	43	Tanjung Agung Palik	\N	\N	t
539	43	Ulok Kupai	\N	\N	t
540	44	Kaur Selatan	\N	\N	t
541	44	Kaur Tengah	\N	\N	t
542	44	Kaur Utara	\N	\N	t
543	44	Kelam Tengah	\N	\N	t
544	44	Kinal	\N	\N	t
545	44	Luas	\N	\N	t
546	44	Lungkang Kule	\N	\N	t
547	44	Maje	\N	\N	t
548	44	Muara Sahung	\N	\N	t
549	44	Nasal	\N	\N	t
550	44	Padang Guci Hilir	\N	\N	t
551	44	Padang Guci Hulu	\N	\N	t
552	44	Semidang Gumay	\N	\N	t
553	44	Tanjung Kemuning	\N	\N	t
554	44	Tetap	\N	\N	t
555	45	Bermani Ilir	\N	\N	t
556	45	Kebawetan	\N	\N	t
557	45	Kepahiang	\N	\N	t
558	45	Merigi	\N	\N	t
559	45	Muara Kemumu	\N	\N	t
560	45	Seberang Musi	\N	\N	t
561	45	Tebat Karai	\N	\N	t
562	45	Ujan Mas	\N	\N	t
563	46	Amen	\N	\N	t
564	46	Bingin Kuning	\N	\N	t
565	46	Lebong Atas	\N	\N	t
566	46	Lebong Sakti	\N	\N	t
567	46	Lebong Selatan	\N	\N	t
568	46	Lebong Tengah	\N	\N	t
569	46	Lebong Utara	\N	\N	t
570	46	Pelabai	\N	\N	t
571	46	Pinang Belapis	\N	\N	t
572	46	Rimbo Pengadang	\N	\N	t
573	46	Topos	\N	\N	t
574	46	Uram Jaya	\N	\N	t
575	47	Air Dikit	\N	\N	t
576	47	Air Majunto	\N	\N	t
577	47	Air Rami	\N	\N	t
578	47	Ipuh	\N	\N	t
579	47	Kota Mukomuko	\N	\N	t
580	47	Lubuk Pinang	\N	\N	t
581	47	Malin Deman	\N	\N	t
582	47	Penarik	\N	\N	t
583	47	Pondok Suguh	\N	\N	t
584	47	Selagan Raya	\N	\N	t
585	47	Sungai Rumbai	\N	\N	t
586	47	Teramang Jaya	\N	\N	t
587	47	Teras Terunjam	\N	\N	t
588	47	V Koto	\N	\N	t
589	47	XIV Koto	\N	\N	t
590	48	Bermani Ulu	\N	\N	t
591	48	Bermani Ulu Raya	\N	\N	t
592	48	Binduriang	\N	\N	t
593	48	Curup	\N	\N	t
594	48	Curup Selatan	\N	\N	t
595	48	Curup Tengah	\N	\N	t
596	48	Curup Timur	\N	\N	t
597	48	Curup Utara	\N	\N	t
598	48	Kota Padang	\N	\N	t
599	48	Padang Ulak Tanding	\N	\N	t
600	48	Selupu Rejang	\N	\N	t
601	48	Sindang Beliti Ilir	\N	\N	t
602	48	Sindang Beliti Ulu	\N	\N	t
603	48	Sindang Dataran	\N	\N	t
604	48	Sindang Kelingi	\N	\N	t
605	49	Air Periukan	\N	\N	t
606	49	Ilir Talo	\N	\N	t
607	49	Lubuk Sandi	\N	\N	t
608	49	Seluma	\N	\N	t
609	49	Seluma Barat	\N	\N	t
610	49	Seluma Selatan	\N	\N	t
611	49	Seluma Timur	\N	\N	t
612	49	Seluma Utara	\N	\N	t
613	49	Semidang Alas	\N	\N	t
614	49	Semidang Alas Maras	\N	\N	t
615	49	Sukaraja	\N	\N	t
616	49	Talo	\N	\N	t
617	49	Talo Kecil	\N	\N	t
618	49	Ulu Talo	\N	\N	t
619	50	Gading Cempaka	\N	\N	t
620	50	Kampung Melayu	\N	\N	t
621	50	Muara Bangka Hulu	\N	\N	t
622	50	Ratu Agung	\N	\N	t
623	50	Ratu Samban	\N	\N	t
624	50	Selebar	\N	\N	t
625	50	Singaran Pati	\N	\N	t
626	50	Sungai Serut	\N	\N	t
627	50	Teluk Segara	\N	\N	t
628	51	Bambang Lipuro	-7.942102	110.313690	t
629	51	Banguntapan	-7.832618	110.410126	t
630	51	Bantul	-7.874818	110.325539	t
631	51	Dlingo	-7.925085	110.461960	t
632	51	Imogiri	-7.920104	110.385101	t
633	51	Jetis	-7.914767	110.360672	t
634	51	Kasihan	-7.834129	110.324921	t
635	51	Kretek	-7.989228	110.305351	t
636	51	Pajangan	-7.871682	110.295135	t
637	51	Pandak	-7.928695	110.289177	t
638	51	Piyungan	-7.842690	110.461960	t
639	51	Pleret	-7.880837	110.420250	t
640	51	Pundong	-7.967550	110.336838	t
641	51	Sanden	-7.970420	110.264694	t
642	51	Sedayu	-7.832843	110.247482	t
643	51	Sewon	-7.852937	110.360672	t
644	51	Srandakan	-7.938721	110.253601	t
645	52	Gedangsari	-7.813094	110.615570	t
646	52	Girisubo	-8.168714	110.736084	t
647	52	Karangmojo	-7.934685	110.676491	t
648	52	Ngawen	-7.836043	110.694366	t
649	52	Nglipar	-7.875383	110.628815	t
650	52	Paliyan	-8.003894	110.533463	t
651	52	Panggang	-8.015005	110.424400	t
652	52	Patuk	-7.859657	110.533463	t
653	52	Playen	-7.931127	110.545380	t
654	52	Ponjong	-7.973402	110.724167	t
655	52	Purwosari	-8.033129	110.366631	t
656	52	Rongkop	-8.095834	110.748009	t
657	52	Saptosari	-8.067044	110.509628	t
658	52	Semanu	-8.025090	110.654816	t
659	52	Semin	-7.880170	110.736084	t
660	52	Tanjungsari	-8.083964	110.581139	t
661	52	Tepus	-8.121505	110.652649	t
662	52	Wonosari	-7.955774	110.597466	t
663	53	Galur	-7.940351	110.228203	t
664	53	Girimulyo	-7.753982	110.175995	t
665	53	Kalibawang	-7.689913	110.223648	t
666	53	Kokap	-7.839938	110.104523	t
667	53	Lendah	-7.917718	110.199821	t
668	53	Nanggulan	-7.788555	110.205780	t
669	53	Panjatan	-7.920107	110.152168	t
670	53	Pengasih	-7.832129	110.158127	t
671	53	Samigaluh	-7.671669	110.175995	t
672	53	Sentolo	-7.875262	110.223648	t
673	53	Temon	-7.887842	110.074745	t
674	53	Wates	-7.870649	110.161102	t
675	54	Berbah	-7.802726	110.438126	t
676	54	Cangkringan	-7.632309	110.456001	t
677	54	Depok	-7.758690	110.394699	t
678	54	Gamping	-7.792943	110.324921	t
679	54	Godean	-7.773542	110.301094	t
680	54	Kalasan	-7.757892	110.469498	t
681	54	Minggir	-7.729886	110.247482	t
682	54	Mlati	-7.716165	110.335403	t
683	54	Moyudan	-7.771050	110.247482	t
684	54	Ngaglik	-7.717399	110.396416	t
685	54	Ngemplak	-7.704174	110.456001	t
686	54	Pakem	-7.639487	110.414291	t
687	54	Prambanan	-7.799136	110.509628	t
688	54	Seyegan	-7.722105	110.301094	t
689	54	Sleman	-7.716165	110.335403	t
690	54	Tempel	-7.664695	110.318970	t
691	54	Turi	-7.625549	110.384499	t
692	55	Danurejan	-7.793290	110.369606	t
693	55	Gedongtengen	-7.818823	110.362053	t
694	55	Gondokusuman	-7.787551	110.381523	t
695	55	Gondomanan	-7.799796	110.368118	t
696	55	Jetis	-7.783297	110.363647	t
697	55	Kotagede	-7.818891	110.397903	t
698	55	Kraton	-7.809026	110.363647	t
699	55	Mantrijeron	-7.819618	110.357689	t
700	55	Mergangsan	-7.812364	110.374077	t
701	55	Ngampilan	-7.800243	110.359184	t
702	55	Pakualaman	-7.799499	110.374077	t
703	55	Tegalrejo	-7.779809	110.356201	t
704	55	Umbulharjo	-7.812980	110.387482	t
705	55	Wirobrajan	-7.803262	110.350243	t
706	56	Kepulauan Seribu Selatan.	-6.208763	106.845596	t
707	56	Kepulauan Seribu Utara	-6.208763	106.845596	t
708	57	Cengkareng	-6.148665	106.735260	t
709	57	Grogol Petamburan	-6.162275	106.788345	t
710	57	Kalideres	-6.134294	106.705772	t
711	57	Kebon Jeruk	-6.195942	106.773598	t
712	57	Kembangan	-6.191233	106.742317	t
713	57	Pal Merah	-6.190071	106.797188	t
714	57	Taman Sari	-6.152156	106.825211	t
715	57	Tambora	-6.149040	106.803085	t
716	58	Cempaka Putih	-6.182671	106.867989	t
717	58	Gambir	-6.171343	106.823738	t
718	58	Johar Baru	-6.183054	106.856186	t
719	58	Kemayoran	-6.160372	106.847336	t
720	58	Menteng	-6.194031	106.832588	t
721	58	Sawah Besar	-6.153194	106.832588	t
722	58	Senen	-6.193456	106.850288	t
723	58	Tanah Abang	-6.202362	106.811935	t
724	59	Cilandak	-6.284528	106.800140	t
725	59	Jagakarsa	-6.334917	106.823738	t
726	59	Kebayoran Baru	-6.243622	106.800140	t
727	59	Kebayoran Lama	-6.244392	106.776543	t
728	59	Mampang Prapatan	-6.250614	106.820786	t
729	59	Pancoran	-6.252300	106.847336	t
730	59	Pasar Minggu	-6.293981	106.823738	t
731	59	Pesanggrahan	-6.247428	106.761795	t
732	59	Setiabudi	-6.219569	106.832588	t
733	59	Tebet	-6.231860	106.847336	t
734	60	Cakung	-6.182629	106.947662	t
735	60	Cipayung	-6.327251	106.900444	t
736	60	Ciracas	-6.323116	106.870941	t
737	60	Duren Sawit	-6.229541	106.918152	t
738	60	Jatinegara	-6.230702	106.882744	t
739	60	Kramatjati	-6.273298	106.869469	t
740	60	Makasar	-6.271194	106.894547	t
741	60	Matraman	-6.203285	106.862091	t
742	60	Pasar Rebo	-6.326164	106.856186	t
743	60	Pulogadung	-6.189464	106.894547	t
744	61	Cilincing	-6.121428	106.947662	t
745	61	Kelapa Gading	-6.160455	106.905464	t
746	61	Koja	-6.117663	106.906349	t
747	61	Pademangan	-6.132596	106.838486	t
748	61	Penjaringan	-6.126741	106.782440	t
749	61	Tanjung Priok	-6.132055	106.871483	t
750	62	Botumoita	\N	\N	t
751	62	Dulupi	\N	\N	t
752	62	Mananggu	\N	\N	t
753	62	Paguyaman	\N	\N	t
754	62	Paguyaman Pantai	\N	\N	t
755	62	Tilamuta	\N	\N	t
756	62	Wonosari	\N	\N	t
757	63	Bone	\N	\N	t
758	63	Bone Raya	\N	\N	t
759	63	Bonepantai	\N	\N	t
760	63	Botupingge	\N	\N	t
761	63	Bulango Selatan	\N	\N	t
762	63	Bulango Timur	\N	\N	t
763	63	Bulango Ulu	\N	\N	t
764	63	Bulango Utara	\N	\N	t
765	63	Bulawa	\N	\N	t
766	63	Kabila	\N	\N	t
767	63	Kabila Bone	\N	\N	t
768	63	Pinogu	\N	\N	t
769	63	Suwawa	\N	\N	t
770	63	Suwawa Selatan	\N	\N	t
771	63	Suwawa Tengah	\N	\N	t
772	63	Suwawa Timur	\N	\N	t
773	63	Tapa	\N	\N	t
774	63	Tilongkabila	\N	\N	t
775	64	Asparaga	\N	\N	t
776	64	Batudaa	\N	\N	t
777	64	Batudaa Pantai	\N	\N	t
778	64	Bilato	\N	\N	t
779	64	Biluhu	\N	\N	t
780	64	Boliyohuto	\N	\N	t
781	64	Bongomeme	\N	\N	t
782	64	Dungaliyo	\N	\N	t
783	64	Limboto	\N	\N	t
784	64	Limboto Barat	\N	\N	t
785	64	Mootilango	\N	\N	t
786	64	Pulubala	\N	\N	t
787	64	Tabongo	\N	\N	t
788	64	Talaga Jaya	\N	\N	t
789	64	Telaga	\N	\N	t
790	64	Telaga Biru	\N	\N	t
791	64	Tibawa	\N	\N	t
792	64	Tilango	\N	\N	t
793	64	Tolangohula	\N	\N	t
794	65	Anggrek	\N	\N	t
795	65	Atinggola	\N	\N	t
796	65	Biau	\N	\N	t
797	65	Gentuma Raya	\N	\N	t
798	65	Kwandang	\N	\N	t
799	65	Monano	\N	\N	t
800	65	Ponelo Kepulauan	\N	\N	t
801	65	Sumalata	\N	\N	t
802	65	Sumalata Timur	\N	\N	t
803	65	Tolinggula	\N	\N	t
804	65	Tomolito	\N	\N	t
805	66	Buntulia	\N	\N	t
806	66	Dengilo	\N	\N	t
807	66	Duhiadaa	\N	\N	t
808	66	Lemito	\N	\N	t
809	66	Marisa	\N	\N	t
810	66	Paguat	\N	\N	t
811	66	Patilanggio	\N	\N	t
812	66	Popayato	\N	\N	t
813	66	Popayato Barat	\N	\N	t
814	66	Popayato Timur	\N	\N	t
815	66	Randangan	\N	\N	t
816	66	Taluditi	\N	\N	t
817	66	Wanggarasi	\N	\N	t
818	67	Dumbo Raya	\N	\N	t
819	67	Dungingi	\N	\N	t
820	67	Hulonthalangi	\N	\N	t
821	67	Kota Barat	\N	\N	t
822	67	Kota Selatan	\N	\N	t
823	67	Kota Tengah	\N	\N	t
824	67	Kota Timur	\N	\N	t
825	67	Kota Utara	\N	\N	t
826	67	Sipatana	\N	\N	t
827	68	Bajubang	\N	\N	t
828	68	Batin XXIV	\N	\N	t
829	68	Maro Sebo Ilir	\N	\N	t
830	68	Maro Sebo Ulu	\N	\N	t
831	68	Mersam	\N	\N	t
832	68	Muara Bulian	\N	\N	t
833	68	Muara Tembesi	\N	\N	t
834	68	Pemayung	\N	\N	t
835	69	Bathin II Pelayang	\N	\N	t
836	69	Bathin III	\N	\N	t
837	69	Bathin III Ulu	\N	\N	t
838	69	Batin II Babeko	\N	\N	t
839	69	Bungo Dani	\N	\N	t
840	69	Jujuhan	\N	\N	t
841	69	Jujuhan Ilir	\N	\N	t
842	69	Limbur Lubuk Mengkuang	\N	\N	t
843	69	Muko-muko Bathin VII	\N	\N	t
844	69	Pasar Muaro Bungo	\N	\N	t
845	69	Pelepat	\N	\N	t
846	69	Pelepat Ilir	\N	\N	t
847	69	Rantau Pandan	\N	\N	t
848	69	Rimbo Tengah	\N	\N	t
849	69	Tanah Sepenggal	\N	\N	t
850	69	Tanah Sepenggal Lintas	\N	\N	t
851	69	Tanah Tumbuh	\N	\N	t
852	70	Air Hangat	\N	\N	t
853	70	Air Hangat Barat	\N	\N	t
854	70	Air Hangat Timur	\N	\N	t
855	70	Batang Merangin	\N	\N	t
856	70	Bukitkerman	\N	\N	t
857	70	Danau Kerinci	\N	\N	t
858	70	Depati Tujuh	\N	\N	t
859	70	Gunung Kerinci	\N	\N	t
860	70	Gunung Raya	\N	\N	t
861	70	Gunung Tujuh	\N	\N	t
862	70	Kayu Aro	\N	\N	t
863	70	Kayu Aro Barat	\N	\N	t
864	70	Keliling Danau	\N	\N	t
865	70	Sitinjau Laut	\N	\N	t
866	70	Siulak	\N	\N	t
867	70	Siulak Mukai	\N	\N	t
868	71	Bangko	\N	\N	t
869	71	Bangko Barat	\N	\N	t
870	71	Batang Masumai	\N	\N	t
871	71	Jangkat	\N	\N	t
872	71	Lembah Masurai	\N	\N	t
873	71	Margo Tabir	\N	\N	t
874	71	Muara Siau	\N	\N	t
875	71	Nalo Tatan	\N	\N	t
876	71	Pamenang	\N	\N	t
877	71	Pamenang Barat	\N	\N	t
878	71	Pamenang Selatan	\N	\N	t
879	71	Pangkalan Jambu	\N	\N	t
880	71	Renah Pamenang	\N	\N	t
881	71	Renah Pembarap	\N	\N	t
882	71	Sungai Manau	\N	\N	t
883	71	Sungai Tenang	\N	\N	t
884	71	Tabir	\N	\N	t
885	71	Tabir Barat	\N	\N	t
886	71	Tabir Ilir	\N	\N	t
887	71	Tabir Lintas	\N	\N	t
888	71	Tabir Selatan	\N	\N	t
889	71	Tabir Timur	\N	\N	t
890	71	Tabir Ulu	\N	\N	t
891	71	Tiang Pumpung	\N	\N	t
892	72	Bahar Selatan	\N	\N	t
893	72	Bahar Utara	\N	\N	t
894	72	Jambi Luar Kota	\N	\N	t
895	72	Kumpeh	\N	\N	t
896	72	Kumpeh Ulu	\N	\N	t
897	72	Maro Sebo	\N	\N	t
898	72	Mestong	\N	\N	t
899	72	Sekernan	\N	\N	t
900	72	Sungai Bahar	\N	\N	t
901	72	Sungai Gelam	\N	\N	t
902	72	Taman Rajo	\N	\N	t
903	73	Air Hitam	\N	\N	t
904	73	Batang Asai	\N	\N	t
905	73	Bathin VIII	\N	\N	t
906	73	Cermin Nan Gedang	\N	\N	t
907	73	Limun	\N	\N	t
908	73	Mandiangin	\N	\N	t
909	73	Pauh	\N	\N	t
910	73	Pelawan	\N	\N	t
911	73	Sarolangun	\N	\N	t
912	73	Singkut	\N	\N	t
913	74	Batang Asam	\N	\N	t
914	74	Betara	\N	\N	t
915	74	Bram Itam	\N	\N	t
916	74	Kuala Betara	\N	\N	t
917	74	Merlung	\N	\N	t
918	74	Muara Papalik	\N	\N	t
919	74	Pengabuan	\N	\N	t
920	74	Renah Mendaluh	\N	\N	t
921	74	Seberang Kota	\N	\N	t
922	74	Senyerang	\N	\N	t
923	74	Tebing Tinggi	\N	\N	t
924	74	Tungkal Ilir	\N	\N	t
925	74	Tungkal Ulu	\N	\N	t
926	75	Berbak	\N	\N	t
927	75	Dendang	\N	\N	t
928	75	Geragai	\N	\N	t
929	75	Kuala Jambi	\N	\N	t
930	75	Mendahara	\N	\N	t
931	75	Mendahara Ulu	\N	\N	t
932	75	Muara Sabak Barat	\N	\N	t
933	75	Muara Sabak Timur	\N	\N	t
934	75	Nipah Panjang	\N	\N	t
935	75	Rantau Rasau	\N	\N	t
936	75	S a d u	\N	\N	t
937	76	Muara Tabir	\N	\N	t
938	76	Rimbo Bujang	\N	\N	t
939	76	Rimbo Ilir	\N	\N	t
940	76	Rimbo Ulu	\N	\N	t
941	76	Serai Serumpun	\N	\N	t
942	76	Sumay	\N	\N	t
943	76	Tebo Ilir	\N	\N	t
944	76	Tebo Tengah	\N	\N	t
945	76	Tebo Ulu	\N	\N	t
946	76	Tengah Ilir	\N	\N	t
947	76	VII Koto	\N	\N	t
948	76	VII Koto Ilir	\N	\N	t
949	77	Danau Teluk	\N	\N	t
950	77	Jambi Selatan	\N	\N	t
951	77	Jambi Timur	\N	\N	t
952	77	Jelutung	\N	\N	t
953	77	Kota Baru	\N	\N	t
954	77	Pasar Jambi	\N	\N	t
955	77	Pelayangan	\N	\N	t
956	77	Telanaipura	\N	\N	t
957	78	Hamparan Rawang	\N	\N	t
958	78	Koto Baru	\N	\N	t
959	78	Kumun Debai	\N	\N	t
960	78	Pesisir Bukit	\N	\N	t
961	78	Pondok Tinggi	\N	\N	t
962	78	Sungai Bungkal	\N	\N	t
963	78	Sungai Penuh	\N	\N	t
964	78	Tanah Kampung	\N	\N	t
965	79	Arjasari	-7.054939	107.645149	t
966	79	Baleendah	-7.014681	107.639290	t
967	79	Banjaran	-7.055539	107.576706	t
968	79	Bojongsoang	-7.003758	107.647820	t
969	79	Cangkuang	-7.047883	107.543877	t
970	79	Cicalengka	-6.985941	107.840126	t
971	79	Cikancung	-7.033329	107.822845	t
972	79	Cilengkrang	-6.872265	107.728088	t
973	79	Cileunyi	-6.931659	107.741974	t
974	79	Cimaung	-7.092422	107.559441	t
975	79	Cimenyan	-6.873958	107.658989	t
976	79	Ciparay	-7.040175	107.713287	t
977	79	Ciwidey	-7.084923	107.446144	t
978	79	Dayeuhkolot	-6.971892	107.612656	t
979	79	Ibun	-7.117697	107.775467	t
980	79	Katapang	-6.998052	107.555878	t
981	79	Kertasari	-7.276037	107.692566	t
982	79	Kutawaringin	-6.999047	107.509094	t
983	79	Majalaya	-7.051798	107.745857	t
984	79	Margaasih	-6.954021	107.557358	t
985	79	Margahayu	-6.975713	107.580101	t
986	79	Nagreg	-7.015792	107.876160	t
987	79	Pacet	-7.120493	107.704407	t
988	79	Pameungpeuk	-7.019196	107.588982	t
989	79	Pangalengan	-7.198889	107.550514	t
990	79	Paseh	-7.075495	107.799156	t
991	79	Pasirjambu	-7.097404	107.482895	t
992	79	Rancabali	-7.124550	107.424095	t
993	79	Rancaekek	-6.967274	107.764908	t
994	79	Solokanjeruk	-7.008100	107.742897	t
995	79	Soreang	-7.025202	107.525909	t
996	80	Batujajar	-6.915315	107.497772	t
997	80	Cihampelas	-6.947939	107.497269	t
998	80	Cikalongwetan	-6.738366	107.438286	t
999	80	Cililin	-6.983450	107.453362	t
1000	80	Cipatat	-6.829225	107.353271	t
1001	80	Cipeundeuy	-6.729987	107.359398	t
1002	80	Cipongkor	-6.943420	107.343491	t
1003	80	Cisarua	-6.811854	107.548218	t
1004	80	Gununghalu	-7.042605	107.313927	t
1005	80	Lembang	-6.816207	107.622795	t
1006	80	Ngamprah	-6.861246	107.514748	t
1007	80	Padalarang	-6.843646	107.478378	t
1008	80	Parongpong	-6.821282	107.580101	t
1009	80	Rongga	-6.961774	107.266640	t
1010	80	Saguling	-6.890989	107.367142	t
1011	80	Sindangkerta	-6.990714	107.400299	t
1012	81	Babelan	-6.123655	107.036224	t
1013	81	Bojongmangu	-6.440474	107.183899	t
1014	81	Cabangbungin	-6.079462	107.142548	t
1015	81	Cibarusah	-6.442913	107.113007	t
1016	81	Cibitung	-6.233513	107.107101	t
1017	81	Cikarang Barat	-6.300488	107.089378	t
1018	81	Cikarang Pusat	-6.363938	107.177994	t
1019	81	Cikarang Selatan	-6.319337	107.136635	t
1020	81	Cikarang Timur	-6.296512	107.207542	t
1021	81	Cikarang Utara	-6.277679	107.160271	t
1022	81	Karang Bahagia	-6.214867	107.207542	t
1023	81	Kedung Waringin	-6.268888	107.270882	t
1024	81	Muaragembong	-5.996217	107.042130	t
1025	81	Pebayuran	-6.152145	107.254822	t
1026	81	Serang Baru	-6.401152	107.136635	t
1027	81	Setu	-6.363430	107.042130	t
1028	81	Sukakarya	-6.134112	107.183899	t
1029	81	Sukatani	-6.196042	107.160271	t
1030	81	Sukawangi	-6.116831	107.089378	t
1031	81	Tambelang	-6.161333	107.130730	t
1032	81	Tambun Selatan	-6.261198	107.042130	t
1033	81	Tambun Utara	-6.178763	107.065758	t
1034	81	Tarumajaya	-6.119900	106.994896	t
1035	82	Babakan Madang	-6.593884	106.900444	t
1036	82	Bojong Gede	-6.479211	106.800140	t
1037	82	Caringin	-6.712881	106.838158	t
1038	82	Cariu	-6.501650	107.130486	t
1039	82	Ciampea	-6.575312	106.693962	t
1040	82	Ciawi	-6.712398	106.894547	t
1041	82	Cibinong	-6.490107	106.830696	t
1042	82	Cibungbulang	-6.560859	106.664497	t
1043	82	Cigombong	-6.731199	106.797356	t
1044	82	Cigudeg	-6.492475	106.558411	t
1045	82	Cijeruk	-6.681491	106.797058	t
1046	82	Cileungsi	-6.402272	106.970497	t
1047	82	Ciomas	-6.606384	106.761795	t
1048	82	Cisarua	-6.679303	106.939835	t
1049	82	Ciseeng	-6.452448	106.679695	t
1050	82	Citeureup	-6.493332	106.880936	t
1051	82	Dramaga	-6.584259	106.731049	t
1052	82	Gunung Putri	-6.428865	106.924057	t
1053	82	Gunung Sindur	-6.395769	106.688087	t
1054	82	Jasinga	-6.466074	106.453697	t
1055	82	Jonggol	-6.468177	107.055687	t
1056	82	Kemang	-6.497298	106.741661	t
1057	82	Klapanunggal	-6.473591	106.965378	t
1058	82	Leuwiliang	-6.573920	106.632622	t
1059	82	Leuwisadeng	-6.566536	106.592422	t
1060	82	Megamendung	-6.680747	106.900597	t
1061	82	Nanggung	-6.667830	106.546623	t
1062	82	Pamijahan	-6.695094	106.652710	t
1063	82	Parung	-6.437684	106.717049	t
1064	82	Parung Panjang	-6.368107	106.553391	t
1065	82	Ranca Bungur	-6.523083	106.717567	t
1066	82	Rumpin	-6.443403	106.630997	t
1067	82	Sukajaya	-6.619116	106.464149	t
1068	82	Sukamakmur	-6.610324	107.018509	t
1069	82	Sukaraja	-6.537007	106.827660	t
1070	82	Tajurhalang	-6.477941	106.761795	t
1071	82	Tamansari	-6.639925	106.758850	t
1072	82	Tanjungsari	-6.596323	107.124825	t
1073	82	Tenjo	-6.362486	106.452370	t
1074	82	Tenjolaya	-6.657202	106.705772	t
1075	83	Banjarsari	-7.496514	108.605690	t
1076	83	Baregbeg	-7.300041	108.368263	t
1077	83	Ciamis	-7.329868	108.332253	t
1078	83	Cidolog	-7.420976	108.439476	t
1079	83	Cihaurbeuti	-7.223396	108.225891	t
1080	83	Cijeungjing	-7.328466	108.392830	t
1081	83	Cikoneng	-7.277946	108.279274	t
1082	83	Cimaragas	-7.374226	108.445412	t
1083	83	Cipaku	-7.238145	108.368263	t
1084	83	Cisaga	-7.314686	108.510696	t
1085	83	Jatinagara	-7.179746	108.409798	t
1086	83	Kawali	-7.188828	108.367897	t
1087	83	Lakbok	-7.406380	108.659126	t
1088	83	Lumbung	-7.152262	108.326729	t
1089	83	Pamarican	-7.459271	108.510696	t
1090	83	Panawangan	-7.113562	108.391998	t
1091	83	Panjalu	-7.138992	108.273338	t
1092	83	Panumbangan	-7.161530	108.225891	t
1093	83	Purwadadi	-7.433477	108.629440	t
1094	83	Rajadesa	-7.193969	108.439476	t
1095	83	Rancah	-7.201804	108.498825	t
1096	83	Sadananya	-7.241094	108.297066	t
1097	83	Sindangkasih	-7.279422	108.243683	t
1098	83	Sukadana	-7.275430	108.463211	t
1099	83	Sukamantri	-7.076263	108.297066	t
1100	83	Tambaksari	-7.230223	108.558189	t
1101	84	Agrabinta	-7.390756	106.888641	t
1102	84	Bojongpicung	-6.890005	107.254822	t
1103	84	Campaka	-7.010146	107.077568	t
1104	84	Campakamulya	-7.081465	107.175041	t
1105	84	Cianjur	-6.816824	107.142548	t
1106	84	Cibeber	-6.935641	107.136635	t
1107	84	Cibinong	-7.339977	107.124825	t
1108	84	Cidaun	-7.401940	107.396713	t
1109	84	Cijati	-7.271393	107.018509	t
1110	84	Cikadu	-7.292907	107.266640	t
1111	84	Cikalongkulon	-6.675144	107.219360	t
1112	84	Cilaku	-6.872867	107.160271	t
1113	84	Cipanas	-6.713157	107.018509	t
1114	84	Ciranjang	-6.812513	107.260727	t
1115	84	Cugenang	-6.803723	107.077568	t
1116	84	Gekbrong	-6.896962	107.065758	t
1117	84	Haurwangi	-6.826441	107.302109	t
1118	84	Kadupandak	-7.219048	107.030319	t
1119	84	Karangtengah	-6.820413	107.173264	t
1120	84	Leles	-7.333722	107.018509	t
1121	84	Mande	-6.749250	107.160271	t
1122	84	Naringgul	-7.374083	107.313927	t
1123	84	Pacet	-6.758854	107.036224	t
1124	84	Pagelaran	-7.128933	107.219360	t
1125	84	Pasirkuda	-7.201883	107.207542	t
1126	84	Sindangbarang	-7.455945	107.134201	t
1127	84	Sukaluyu	-6.803080	107.237083	t
1128	84	Sukanagara	-7.092904	107.077568	t
1129	84	Sukaresmi	-6.710634	107.089378	t
1130	84	Takokak	-7.096451	106.983086	t
1131	84	Tanggeung	-7.247000	107.113007	t
1132	84	Warungkondang	-6.860207	107.083473	t
1133	85	Arjawinangun	-6.640337	108.402382	t
1134	85	Astanajapura	-6.801624	108.623497	t
1135	85	Babakan	-6.878502	108.719704	t
1136	85	Beber	-6.816667	108.516670	t
1137	85	Ciledug	-6.899184	108.742279	t
1138	85	Ciwaringin	-6.677991	108.386063	t
1139	85	Depok	-6.733098	108.447556	t
1140	85	Dukupuntang	-6.769102	108.409798	t
1141	85	Gebang	-6.828045	108.730400	t
1142	85	Gegesik	-6.574094	108.433540	t
1143	85	Gempol	-6.705351	108.417442	t
1144	85	Greged	-6.814204	108.564125	t
1145	85	Gunung Jati	-6.698076	108.553917	t
1146	85	Jamblang	-6.653914	108.481018	t
1147	85	Kaliwedi	-6.580768	108.391998	t
1148	85	Kapetakan	-6.576261	108.510696	t
1149	85	Karangsembung	-6.849771	108.645531	t
1150	85	Karangwareng	-6.861638	108.644066	t
1151	85	Kedawung	-6.719106	108.532936	t
1152	85	Klangenan	-6.678676	108.451027	t
1153	85	Lemahabang	-6.832784	108.611626	t
1154	85	Losari	-6.804747	108.801682	t
1155	85	Mundu	-6.775028	108.584908	t
1156	85	Pabedilan	-6.857295	108.766037	t
1157	85	Pabuaran	-6.892347	108.721489	t
1158	85	Palimanan	-6.705190	108.432320	t
1159	85	Pangenan	-6.799739	108.671005	t
1160	85	Panguragan	-6.613997	108.457275	t
1161	85	Pasaleman	-6.950389	108.742279	t
1162	85	Plered	-6.696516	108.501793	t
1163	85	Plumbon	-6.719137	108.470314	t
1164	85	Sedong	-6.880035	108.581940	t
1165	85	Sumber	-6.753191	108.489922	t
1166	85	Suranenggala	-6.621928	108.516632	t
1167	85	Susukan	-6.642916	108.368263	t
1168	85	Susukan Lebak	-6.869948	108.610138	t
1169	85	Talun	-6.764928	108.516632	t
1170	85	Tengah Tani	-6.700702	108.525536	t
1171	85	Waled	-6.911825	108.682884	t
1172	85	Weru	-6.712071	108.495857	t
1173	86	Banjarwangi	-7.392608	107.882080	t
1174	86	Banyuresmi	-7.158262	107.923553	t
1175	86	Bayongbong	-7.280184	107.846542	t
1176	86	Bl. Limbangan	-7.035439	107.984802	t
1177	86	Bungbulang	-7.445736	107.597855	t
1178	86	Caringin	-7.481238	107.491348	t
1179	86	Cibalong	-7.643739	107.834694	t
1180	86	Cibatu	-7.083237	107.994667	t
1181	86	Cibiuk	-7.064038	107.959106	t
1182	86	Cigedug	-7.322537	107.822845	t
1183	86	Cihurip	-7.508154	107.846542	t
1184	86	Cikajang	-7.385650	107.799156	t
1185	86	Cikelet	-7.566514	107.692566	t
1186	86	Cilawu	-7.298950	107.893929	t
1187	86	Cisewu	-7.364633	107.550514	t
1188	86	Cisompet	-7.562559	107.787308	t
1189	86	Cisurupan	-7.303754	107.775467	t
1190	86	Garut Kota	-7.227906	107.908699	t
1191	86	Kadungora	-7.071766	107.893929	t
1192	86	Karangpawitan	-7.213196	107.948730	t
1193	86	Karangtengah	-7.147635	108.059868	t
1194	86	Kersamanah	-7.071520	108.030228	t
1195	86	Leles	-7.114890	107.846542	t
1196	86	Leuwigoong	-7.106209	107.935410	t
1197	86	Malangbong	-7.064247	108.083580	t
1198	86	Mekarmukti	-7.540711	107.562347	t
1199	86	Pakenjeng	-7.439923	107.739937	t
1200	86	Pameungpeuk	-7.637840	107.728088	t
1201	86	Pamulihan	-7.358899	107.692566	t
1202	86	Pangatikan	-7.182475	108.027267	t
1203	86	Pasirwangi	-7.201266	107.751778	t
1204	86	Peundeuy	-7.546701	107.917633	t
1205	86	Samarang	-7.178714	107.799156	t
1206	86	Selaawi	-7.005297	108.012444	t
1207	86	Singajaya	-7.484434	107.917633	t
1208	86	Sucinaraja	-7.216863	108.006523	t
1209	86	Sukaresmi	-7.242624	107.751778	t
1210	86	Sukawening	-7.128915	108.012444	t
1211	86	Talegong	-7.283587	107.503181	t
1212	86	Tarogong Kaler	-7.184190	107.886475	t
1213	86	Tarogong Kidul	-7.211793	107.876160	t
1214	86	Wanaraja	-7.196214	108.006523	t
1215	87	Anjatan	-6.373035	107.941330	t
1216	87	Arahan	-6.361932	108.249619	t
1217	87	Balongan	-6.397192	108.368248	t
1218	87	Bangodua	-6.518262	108.291138	t
1219	87	Bongas	-6.390865	108.012444	t
1220	87	Cantigi	-6.281461	108.225891	t
1221	87	Cikedung	-6.527553	108.178444	t
1222	87	Gabuswetan	-6.429917	108.059868	t
1223	87	Gantar	-6.567386	107.929482	t
1224	87	Haurgeulis	-6.454608	107.941330	t
1225	87	Indramayu	-6.337310	108.325821	t
1226	87	Jatibarang	-6.474982	108.306740	t
1227	87	Juntinyuat	-6.437230	108.415733	t
1228	87	Kandanghaur	-6.347575	108.083580	t
1229	87	Karangampel	-6.469600	108.452202	t
1230	87	Kedokan Bunder	-6.493448	108.409798	t
1231	87	Kertasemaya	-6.520477	108.368263	t
1232	87	Krangkeng	-6.516017	108.486954	t
1233	87	Kroya	-6.491976	108.036156	t
1234	87	Lelea	-6.464615	108.225891	t
1235	87	Lohbener	-6.399953	108.282913	t
1236	87	Losarang	-6.398602	108.146896	t
1237	87	Pasekan	-6.278907	108.297066	t
1238	87	Patrol	-6.313084	107.982597	t
1239	87	Sindang	-6.339871	108.297066	t
1240	87	Sliyeg	-6.460231	108.344528	t
1241	87	Sukagumiwang	-6.578132	108.326729	t
1242	87	Sukra	-6.296453	107.947258	t
1243	87	Trisi	-6.604776	108.024300	t
1244	87	Tukdana	-6.564832	108.273338	t
1245	87	Widasari	-6.462865	108.273338	t
1246	88	Banyusari	-6.305621	107.538681	t
1247	88	Batujaya	-6.052682	107.183899	t
1248	88	Ciampel	-6.435565	107.325752	t
1249	88	Cibuaya	-6.007422	107.325752	t
1250	88	Cikampek	-6.395874	107.438110	t
1251	88	Cilamaya Kulon	-6.209319	107.512413	t
1252	88	Cilamaya Wetan	-6.222477	107.586021	t
1253	88	Cilebar	-6.126291	107.420364	t
1254	88	Jatisari	-6.347248	107.515015	t
1255	88	Jayakerta	-6.104967	107.296196	t
1256	88	Karawang Barat	-6.301566	107.296654	t
1257	88	Karawang Timur	-6.305400	107.320236	t
1258	88	Klari	-6.352151	107.373055	t
1259	88	Kota Baru	-6.401870	107.472366	t
1260	88	Kutawaluya	-6.169370	107.349403	t
1261	88	Lemahabang	-6.292911	107.450600	t
1262	88	Majalaya	-6.306407	107.367142	t
1263	88	Pakisjaya	-6.013530	107.136635	t
1264	88	Pangkalan	-6.438843	107.231178	t
1265	88	Pedes	-6.087176	107.373055	t
1266	88	Purwasari	-6.366045	107.414452	t
1267	88	Rawamerta	-6.230505	107.349403	t
1268	88	Rengasdengklok	-6.180119	107.294678	t
1269	88	Tegalwaru	-6.520193	107.214401	t
1270	88	Telagasari	-6.282944	107.381927	t
1271	88	Telukjambe Barat	-6.356205	107.254822	t
1272	88	Telukjambe Timur	-6.334138	107.293205	t
1273	88	Tempuran	-6.186565	107.444023	t
1274	88	Tirtajaya	-6.030046	107.254822	t
1275	88	Tirtamulya	-6.348887	107.467690	t
1276	89	Ciawigebang	-6.941517	108.581940	t
1277	89	Cibeureum	-7.058791	108.724457	t
1278	89	Cibingbin	-7.098871	108.748215	t
1279	89	Cidahu	-6.964021	108.659126	t
1280	89	Cigandamekar	-6.896589	108.552254	t
1281	89	Cigugur	-6.972659	108.445412	t
1282	89	Cilebak	-7.133333	108.583336	t
1283	89	Cilimus	-6.879408	108.469147	t
1284	89	Cimahi	-6.998212	108.700699	t
1285	89	Ciniru	-7.052409	108.504761	t
1286	89	Cipicung	-6.937587	108.552254	t
1287	89	Ciwaru	-7.103800	108.629440	t
1288	89	Darma	-7.005373	108.397934	t
1289	89	Garawangi	-7.004989	108.534447	t
1290	89	Hantara	-7.069518	108.463211	t
1291	89	Jalaksana	-6.920886	108.457275	t
1292	89	Japara	-6.917084	108.552254	t
1293	89	Kadugede	-7.002979	108.457275	t
1294	89	Kalimanggis	-6.955215	108.623497	t
1295	89	Karang Kancana	-7.101832	108.676949	t
1296	89	Kramatmulya	-6.949752	108.504761	t
1297	89	Kuningan	-6.981010	108.492889	t
1298	89	Lebakwangi	-7.007948	108.587875	t
1299	89	Luragung	-7.017757	108.638412	t
1300	89	Maleber	-7.064661	108.581940	t
1301	89	Mandirancan	-6.849142	108.457275	t
1302	89	Nusaherang	-7.014208	108.433540	t
1303	89	Pancalang	-6.817017	108.492889	t
1304	89	Pasawahan	-6.803763	108.439476	t
1305	89	Selajambe	-7.105261	108.469147	t
1306	89	Sindang Agung	-6.969312	108.528503	t
1307	89	Subang	-7.128286	108.534447	t
1308	90	Argapura	-6.889469	108.344528	t
1309	90	Banjaran	-6.956402	108.338600	t
1310	90	Bantarujeg	-6.954804	108.249619	t
1311	90	Cigasong	-6.826315	108.255547	t
1312	90	Cikijing	-7.011703	108.368263	t
1313	90	Cingambul	-7.034168	108.320801	t
1314	90	Dawuan	-6.725720	108.208099	t
1315	90	Jatitujuh	-6.627888	108.225891	t
1316	90	Jatiwangi	-6.765454	108.168213	t
1317	90	Kadipaten	-6.767700	108.167664	t
1318	90	Kasokandel	-6.771111	108.225891	t
1319	90	Kertajati	-6.642131	108.119148	t
1320	90	Lemahsugih	-7.019301	108.178444	t
1321	90	Leuwimunding	-6.746056	108.344528	t
1322	90	Ligung	-6.666970	108.273338	t
1323	90	Maja	-6.891341	108.297066	t
1324	90	Majalengka	-6.836422	108.227425	t
1325	90	Malausma	-7.037027	108.249619	t
1326	90	Palasah	-6.747889	108.297066	t
1327	90	Panyingkiran	-6.813931	108.178444	t
1328	90	Rajagaluh	-6.822146	108.362328	t
1329	90	Sindang	-6.828894	108.320801	t
1330	90	Sindangwangi	-6.805623	108.391998	t
1331	90	Sukahaji	-6.804436	108.291138	t
1332	90	Sumberjaya	-6.690488	108.326729	t
1333	90	Talaga	-6.994008	108.297066	t
1334	91	Cigugur	-7.638877	108.424583	t
1335	91	Cijulang	-7.723057	108.470001	t
1336	91	Cimerak	-7.785344	108.403870	t
1337	91	Kalipucang	-7.636147	108.724457	t
1338	91	Langkaplancar	-7.536319	108.403870	t
1339	91	Mangunjaya	-7.477645	108.682884	t
1340	91	Padaherang	-7.554402	108.700699	t
1341	91	Pangandaran	-7.683333	108.650002	t
1342	91	Parigi	-7.645637	108.510696	t
1343	91	Sidamulih	-7.601042	108.581940	t
1344	92	Babakancikao	-6.493653	107.420364	t
1345	92	Bojong	-6.735467	107.538681	t
1346	92	Bungursari	-6.451063	107.467690	t
1347	92	Campaka	-6.469849	107.515015	t
1348	92	Cibatu	-6.530399	107.538681	t
1349	92	Darangdan	-6.677318	107.444023	t
1350	92	Jatiluhur	-6.560011	107.426285	t
1351	92	Kiarapedes	-6.631988	107.562347	t
1352	92	Maniis	-6.682448	107.302109	t
1353	92	Pasawahan	-6.578815	107.473602	t
1354	92	Plered	-6.643744	107.378967	t
1355	92	Pondoksalam	-6.614052	107.491348	t
1356	92	Purwakarta	-6.540667	107.446274	t
1357	92	Sukasari	-6.601997	107.254822	t
1358	92	Sukatani	-6.616607	107.420364	t
1359	92	Tegalwaru	-6.641222	107.342010	t
1360	92	Wanayasa	-6.678789	107.544601	t
1361	93	Binong	-6.398493	107.799156	t
1362	93	Blanakan	-6.260771	107.657051	t
1363	93	Ciasem	-6.330865	107.692566	t
1364	93	Ciater	-6.730217	107.680725	t
1365	93	Cibogo	-6.565531	107.840614	t
1366	93	Cijambe	-6.624205	107.775467	t
1367	93	Cikaum	-6.421428	107.728088	t
1368	93	Cipeunduey	-6.497591	107.597855	t
1369	93	Cipunagara	-6.498018	107.870232	t
1370	93	Cisalak	-6.768625	107.751778	t
1371	93	Compreng	-6.395961	107.870232	t
1372	93	Dawuan	-6.566234	107.680725	t
1373	93	Jalancagak	-6.667801	107.704407	t
1374	93	Kalijati	-6.548326	107.609695	t
1375	93	Kasomalang	-6.685677	107.775467	t
1376	93	Legonkulon	-6.235499	107.799156	t
1377	93	Pabuaran	-6.426456	107.586021	t
1378	93	Pagaden	-6.495267	107.805077	t
1379	93	Pagaden Barat	-6.481009	107.775467	t
1380	93	Pamanukan	-6.286477	107.820702	t
1381	93	Patokbeusi	-6.364362	107.609695	t
1382	93	Purwadadi	-6.443535	107.680725	t
1383	93	Pusakajaya	-6.313604	107.893929	t
1384	93	Pusakanagara	-6.253372	107.870232	t
1385	93	Sagalaherang	-6.711445	107.633369	t
1386	93	Serangpanjang	-6.630267	107.609695	t
1387	93	Subang	-6.562289	107.760796	t
1388	93	Sukasari	-6.297398	107.775467	t
1389	93	Tambakdahan	-6.337318	107.799156	t
1390	93	Tanjungsiang	-6.745437	107.822845	t
1391	94	Bantargadung	-7.090911	107.668884	t
1392	94	Bojonggenteng	-6.842413	106.717567	t
1393	94	Caringin	-7.090911	107.668884	t
1394	94	Ciambar	-6.802303	106.829636	t
1395	94	Cibadak	-6.893204	106.783859	t
1396	94	Cibitung	-7.090911	107.668884	t
1397	94	Cicantayan	-7.090911	107.668884	t
1398	94	Cicurug	-7.090911	107.668884	t
1399	94	Cidadap	-7.090911	107.668884	t
1400	94	Cidahu	-7.090911	107.668884	t
1401	94	Cidolog	-7.090911	107.668884	t
1402	94	Ciemas	-7.090911	107.668884	t
1403	94	Cikakak	-7.090911	107.668884	t
1404	94	Cikembar	-6.968430	106.806038	t
1405	94	Cikidang	-6.901559	106.652710	t
1406	94	Cimanggu	-6.956164	106.771400	t
1407	94	Ciracap	-7.090911	107.668884	t
1408	94	Cireunghas	-6.934611	107.024414	t
1409	94	Cisaat	-7.090911	107.668884	t
1410	94	Cisolok	-7.090911	107.668884	t
1411	94	Curugkembar	-7.201672	106.953934	t
1412	94	Gegerbitung	-7.090911	107.668884	t
1413	94	Gunungguruh	-6.952388	106.891594	t
1414	94	Jampang Kulon	-7.285747	106.640923	t
1415	94	Jampang Tengah	-7.062030	106.794243	t
1416	94	Kabandungan	-6.779249	106.605553	t
1417	94	Kadudampit	-7.090911	107.668884	t
1418	94	Kalapanunggal	-6.831488	106.661552	t
1419	94	Kalibunder	-7.090911	107.668884	t
1420	94	Kebonpedes	-7.090911	107.668884	t
1421	94	Lengkong	-7.090911	107.668884	t
1422	94	Nagrak	-7.090911	107.668884	t
1423	94	Nyalindung	-7.005488	106.924057	t
1424	94	Pabuaran	-7.090911	107.668884	t
1425	94	Parakansalak	-7.090911	107.668884	t
1426	94	Parungkuda	-6.844869	106.757378	t
1427	94	Pelabuhanratu	-6.985234	106.547539	t
1428	94	Purabaya	-7.099977	106.888641	t
1429	94	Sagaranten	-7.090911	107.668884	t
1430	94	Simpenan	-7.090911	107.668884	t
1431	94	Sukabumi	-6.927736	106.929955	t
1432	94	Sukalarang	-7.090911	107.668884	t
1433	94	Sukaraja	-7.090911	107.668884	t
1434	94	Surade	-7.090911	107.668884	t
1435	94	Tegalbuleud	-7.090911	107.668884	t
1436	94	Waluran	-7.090911	107.668884	t
1437	94	Warungkiara	-6.987593	106.705772	t
1438	95	Buahdua	-6.679501	107.941330	t
1439	95	Cibugel	-6.964145	108.012444	t
1440	95	Cimalaka	-6.802519	107.941330	t
1441	95	Cimanggung	-6.950024	107.846542	t
1442	95	Cisarua	-6.827045	107.970963	t
1443	95	Cisitu	-6.839024	108.059868	t
1444	95	Conggeang	-6.733333	108.000000	t
1445	95	Darmaraja	-6.921172	108.059868	t
1446	95	Ganeas	-6.863208	107.965034	t
1447	95	Jatigede	-6.877320	108.131004	t
1448	95	Jatinangor	-6.937099	107.781387	t
1449	95	Jatinunggal	-6.937072	108.178444	t
1450	95	Pamulihan	-6.888310	107.846542	t
1451	95	Paseh	-6.799805	108.012444	t
1452	95	Rancakalong	-6.826657	107.846542	t
1453	95	Situraja	-6.866745	108.006523	t
1454	95	Sukasari	-6.870463	107.775467	t
1455	95	Sumedang Selatan	-6.859079	107.920280	t
1456	95	Sumedang Utara	-6.829374	107.911644	t
1457	95	Surian	-6.641188	107.870232	t
1458	95	Tanjungkerta	-6.741873	107.917633	t
1459	95	Tanjungmedar	-6.723150	107.870232	t
1460	95	Tanjungsari	-6.844092	107.793236	t
1461	95	Tomo	-6.764191	108.132599	t
1462	95	Ujungjaya	-6.729792	108.101364	t
1463	95	Wado	-6.980986	108.107292	t
1464	96	Bantarkalong	-7.622724	108.083580	t
1465	96	Bojongasih	-7.558412	108.131004	t
1466	96	Bojonggambir	-7.565467	107.965034	t
1467	96	Ciawi	-7.166345	108.107292	t
1468	96	Cibalong	-7.516667	108.166664	t
1469	96	Cigalontang	-7.350000	108.016670	t
1470	96	Cikalong	-7.450000	108.033333	t
1471	96	Cikatomas	-7.614535	108.273338	t
1472	96	Cineam	-7.403333	108.368263	t
1473	96	Cipatujah	-7.718838	108.024300	t
1474	96	Cisayong	-7.246957	108.154724	t
1475	96	Culamega	-7.594102	108.024300	t
1476	96	Gunung Tanjung	-7.430000	108.323334	t
1477	96	Jamanis	-7.189962	108.160660	t
1478	96	Jatiwaras	-7.471454	108.225891	t
1479	96	Kadipaten	-7.125108	108.107292	t
1480	96	Karang Jaya	-7.427918	108.397934	t
1481	96	Karangnunggal	-7.629535	108.166588	t
1482	96	Leuwisari	-7.306452	108.089508	t
1483	96	Mangunreja	-7.379339	108.077652	t
1484	96	Manonjaya	-7.363997	108.320801	t
1485	96	Padakembang	-7.304985	108.125076	t
1486	96	Pagerageung	-7.101638	108.178444	t
1487	96	Pancatengah	-7.696551	108.297066	t
1488	96	Parungponteng	-7.495192	108.154724	t
1489	96	Puspahiang	-7.436032	108.083580	t
1490	96	Rajapolah	-7.219940	108.184380	t
1491	96	Salawu	-7.377850	107.988739	t
1492	96	Salopa	-7.498980	108.308937	t
1493	96	Sariwangi	-7.297579	108.053940	t
1494	96	Singaparna	-7.350303	108.125389	t
1495	96	Sodonghilir	-7.499205	108.059868	t
1496	96	Sukahening	-7.202691	108.101364	t
1497	96	Sukaraja	-7.433045	108.154724	t
1498	96	Sukarame	-7.376375	108.148796	t
1499	96	Sukaratu	-7.273990	108.125076	t
1500	96	Sukaresik	-7.158065	108.184380	t
1501	96	Tanjungjaya	-7.408905	108.113220	t
1502	96	Taraju	-7.439996	107.988739	t
1503	97	Andir	-6.911432	107.577141	t
1504	97	Antapani	-6.918583	107.660004	t
1505	97	Arcamanik	-6.917907	107.677765	t
1506	97	Astana Anyar	-6.927679	107.600166	t
1507	97	Babakan Ciparay	-6.942333	107.577141	t
1508	97	Bandung Kidul	-6.955757	107.630409	t
1509	97	Bandung Kulon	-6.937631	107.565308	t
1510	97	Bandung Wetan	-6.904715	107.618576	t
1511	97	Batununggal	-6.919484	107.636330	t
1512	97	Bojongloa Kaler	-6.931582	107.588982	t
1513	97	Bojongloa Kidul	-6.951961	107.594902	t
1514	97	Buahbatu	-6.952390	107.651131	t
1515	97	Cibeunying Kaler	-6.893749	107.636330	t
1516	97	Cibeunying Kidul	-6.898446	107.648170	t
1517	97	Cibiru	-6.916326	107.719208	t
1518	97	Cicendo	-6.900912	107.583061	t
1519	97	Cidadap	-6.863996	107.606735	t
1520	97	Cinambo	-6.932897	107.689606	t
1521	97	Coblong	-6.891960	107.615616	t
1522	97	Gedebage	-6.950577	107.698486	t
1523	97	Kiaracondong	-6.924182	107.648170	t
1524	97	Lengkong	-6.932694	107.627449	t
1525	97	Mandalajati	-6.897548	107.671844	t
1526	97	Panyileukan	-6.932218	107.707367	t
1527	97	Rancasari	-6.953946	107.677765	t
1528	97	Regol	-6.940982	107.612656	t
1529	97	Sukajadi	-6.890394	107.588982	t
1530	97	Sukasari	-6.864665	107.588982	t
1531	97	Sumur Bandung	-6.915235	107.612656	t
1532	97	Ujung Berung	-6.906487	107.707367	t
1533	98	Banjar	-7.370687	108.534248	t
1534	98	Langensari	-7.366630	108.623497	t
1535	98	Pataruman	-7.370687	108.534248	t
1536	98	Purwaharja	-7.349035	108.552254	t
1537	99	Bantar Gebang	-6.313014	106.987320	t
1538	99	Bekasi Barat	-6.238203	106.965378	t
1539	99	Bekasi Selatan	-6.258244	106.977180	t
1540	99	Bekasi Timur	-6.236254	107.024414	t
1541	99	Bekasi Utara	-6.206405	107.000801	t
1542	99	Jati Sempurna	-6.362087	106.929955	t
1543	99	Jatiasih	-6.310138	106.953568	t
1544	99	Medan Satria	-6.194132	106.986038	t
1545	99	Mustika Jaya	-6.294898	107.027367	t
1546	99	Pondok Gede	-6.285667	106.911591	t
1547	99	Pondok Melati	-6.307407	106.929321	t
1548	99	Rawa Lumbu	-6.277475	107.002686	t
1549	100	Bogor Barat	-6.572862	106.764748	t
1550	100	Bogor Selatan	-6.642821	106.823738	t
1551	100	Bogor Tengah	-6.592209	106.800140	t
1552	100	Bogor Timur	-6.611961	106.823738	t
1553	100	Bogor Utara	-6.570838	106.823738	t
1554	100	Tanah Sareal	-6.572883	106.801613	t
1555	101	Cimahi Selatan	-6.905385	107.532761	t
1556	101	Cimahi Tengah	-6.884082	107.541306	t
1557	101	Cimahi Utara	-6.863315	107.556435	t
1558	102	Harjamukti	-6.753309	108.552254	t
1559	102	Kejaksan	-6.704655	108.555222	t
1560	102	Kesambi	-6.735770	108.543350	t
1561	102	Lemah Wungkuk	-6.729500	108.573029	t
1562	102	Pekalipan	-6.723520	108.562645	t
1563	103	Beji	-6.375881	106.823738	t
1564	103	Bojongsari	-6.399131	106.741158	t
1565	103	Cilodong	-6.436981	106.835541	t
1566	103	Cimanggis	-6.364456	106.859138	t
1567	103	Cinere	-6.336089	106.788345	t
1568	103	Cipayung	-6.427918	106.800140	t
1569	103	Limo	-6.377453	106.776543	t
1570	103	Pancoran Mas	-6.397162	106.800140	t
1571	103	Sawangan	-6.408596	106.764748	t
1572	103	Sukmajaya	-6.385337	106.847336	t
1573	103	Tapos	-6.409962	106.876839	t
1574	104	Baros	-7.090911	107.668884	t
1575	104	Cibeureum	-7.090911	107.668884	t
1576	104	Cikole	-7.090911	107.668884	t
1577	104	Citamiang	-7.090911	107.668884	t
1578	104	Gunung Puyuh	-6.910195	106.915199	t
1579	104	Lembursitu	-6.969941	106.906349	t
1580	104	Warudoyong	-6.928166	106.918152	t
1581	105	Bungursari	-7.312865	108.184380	t
1582	105	Cibeureum	-7.350738	108.267410	t
1583	105	Cihideung	-7.334759	108.216995	t
1584	105	Cipedes	-7.313847	108.222923	t
1585	105	Indihiang	-7.294172	108.199203	t
1586	105	Kawalu	-7.410349	108.202164	t
1587	105	Mangkubumi	-7.343870	108.184380	t
1588	105	Purbaratu	-7.330072	108.267410	t
1589	105	Tamansari	-7.387666	108.249619	t
1590	105	Tawang	-7.334264	108.228851	t
1591	106	Banjarmangu	-7.325431	109.675835	t
1592	106	Banjarnegara	-7.447390	109.553856	t
1593	106	Batur	-7.210109	109.848465	t
1594	106	Bawang	-7.430251	109.628220	t
1595	106	Kalibening	-7.224017	109.652023	t
1596	106	Karangkobar	-7.282278	109.723450	t
1597	106	Madukara	-7.364300	109.723450	t
1598	106	Mandiraja	-7.476821	109.509209	t
1599	106	Pagedongan	-7.448619	109.675835	t
1600	106	Pagentan	-7.299539	109.794884	t
1601	106	Pandanarum	-7.247687	109.580612	t
1602	106	Pejawaran	-7.258571	109.794884	t
1603	106	Punggelan	-7.329727	109.580612	t
1604	106	Purwanegara	-7.473551	109.580612	t
1605	106	Purworeja Klampok	-7.458277	109.436325	t
1606	106	Rakit	-7.418365	109.550858	t
1607	106	Sigaluh	-7.423695	109.771072	t
1608	106	Susukan	-7.501755	109.414017	t
1609	106	Wanadadi	-7.367550	109.652023	t
1610	106	Wanayasa	-7.219764	109.747261	t
1611	107	Ajibarang	-7.416667	109.066666	t
1612	107	Banyumas	-7.528861	109.271255	t
1613	107	Baturraden	-7.304531	109.223686	t
1614	107	Cilongok	-7.369380	109.152328	t
1615	107	Gumelar	-7.375667	108.980179	t
1616	107	Jatilawang	-7.557034	109.104767	t
1617	107	Kalibagor	-7.486559	109.295052	t
1618	107	Karanglewas	-7.434449	109.193954	t
1619	107	Kebasen	-7.556535	109.229630	t
1620	107	Kedungbanteng	-7.346703	109.199898	t
1621	107	Kembaran	-7.404194	109.295052	t
1622	107	Kemranjen	-7.588569	109.318840	t
1623	107	Lumbir	-7.479795	108.985886	t
1624	107	Patikraja	-7.470239	109.199898	t
1625	107	Pekuncen	-7.351938	109.080986	t
1626	107	Purwojati	-7.474500	109.104767	t
1627	107	Purwokerto Barat	-7.423089	109.217735	t
1628	107	Purwokerto Selatan	-7.442619	109.241524	t
1629	107	Purwokerto Timur	-7.424467	109.244499	t
1630	107	Purwokerto Utara	-7.399000	109.238548	t
1631	107	Rawalo	-7.513615	109.152328	t
1632	107	Sokaraja	-7.450779	109.289101	t
1633	107	Somagede	-7.525613	109.342628	t
1634	107	Sumbang	-7.364110	109.271255	t
1635	107	Sumpiuh	-7.586382	109.366425	t
1636	107	Tambak	-7.604816	109.414017	t
1637	107	Wangon	-7.517887	109.057205	t
1638	108	Bandar	-7.054130	109.794884	t
1639	108	Banyuputih	-6.966320	109.937775	t
1640	108	Batang	-6.908045	109.732681	t
1641	108	Bawang	-7.100000	109.916664	t
1642	108	Blado	-7.103599	109.830605	t
1643	108	Gringsing	-6.963194	110.009232	t
1644	108	Kandeman	-6.932809	109.771072	t
1645	108	Limpung	-7.023139	109.919914	t
1646	108	Pecalungan	-7.030591	109.866325	t
1647	108	Reban	-7.070344	109.890144	t
1648	108	Subah	-6.949062	109.866325	t
1649	108	Tersono	-7.067181	109.961594	t
1650	108	Tulis	-6.946291	109.812744	t
1651	108	Warungasem	-6.950913	109.705597	t
1652	108	Wonotunggal	-7.000000	109.733330	t
1653	109	Banjarejo	-7.043144	111.367966	t
1654	109	Blora	-6.969128	111.418671	t
1655	109	Bogorejo	-6.934222	111.534904	t
1656	109	Cepu	-7.160121	111.564720	t
1657	109	Japah	-6.914586	111.308350	t
1658	109	Jati	-7.238514	111.308350	t
1659	109	Jepon	-7.059953	111.439514	t
1660	109	Jiken	-7.024493	111.546829	t
1661	109	Kedungtuban	-7.148136	111.499130	t
1662	109	Kradenan	-7.242242	111.439514	t
1663	109	Kunduran	-7.069053	111.248734	t
1664	109	Ngawen	-7.025181	111.320274	t
1665	109	Randublatung	-7.193296	111.403740	t
1666	109	Sambong	-7.094657	111.558754	t
1667	109	Todanan	-6.933966	111.177299	t
1668	109	Tunjungan	-6.942087	111.367966	t
1669	110	Ampel	-7.450416	110.509628	t
1670	110	Andong	-7.383333	110.766670	t
1671	110	Banyudono	-7.534632	110.687126	t
1672	110	Boyolali	-7.520530	110.595024	t
1673	110	Cepogo	-7.510663	110.533463	t
1674	110	Juwangi	-7.225321	110.736084	t
1675	110	Karanggede	-7.361807	110.652649	t
1676	110	Kemusu	-7.276810	110.724167	t
1677	110	Klego	-7.358376	110.724167	t
1678	110	Mojosongo	-7.542136	110.622849	t
1679	110	Musuk	-7.572116	110.533463	t
1680	110	Ngemplak	-7.504432	110.765884	t
1681	110	Nogosari	-7.459317	110.748009	t
1682	110	Sambi	-7.483245	110.676491	t
1683	110	Sawit	-7.569333	110.694366	t
1684	110	Selo	-7.515281	110.438126	t
1685	110	Simo	-7.420773	110.700325	t
1686	110	Teras	-7.540383	110.658607	t
1687	110	Wonosegoro	-7.280204	110.652649	t
1688	111	Banjarharjo	-7.013834	108.819504	t
1689	111	Bantarkawung	-7.235707	108.914566	t
1690	111	Brebes	-6.856421	109.039375	t
1691	111	Bulakamba	-6.868244	108.928001	t
1692	111	Bumiayu	-7.253208	108.985886	t
1693	111	Jatibarang	-6.942562	109.057205	t
1694	111	Kersana	-6.925059	108.861092	t
1695	111	Ketanggungan	-7.010884	108.890800	t
1696	111	Larangan	-7.060650	108.926453	t
1697	111	Losari	-6.828623	108.843269	t
1698	111	Paguyangan	-7.291250	109.057205	t
1699	111	Salem	-7.148741	108.783859	t
1700	111	Sirampog	-7.228552	109.080986	t
1701	111	Songgom	-7.041108	108.984497	t
1702	111	Tanjung	-6.868552	108.867027	t
1703	111	Tonjong	-7.169996	109.009659	t
1704	111	Wanasari	-6.883181	109.009659	t
1705	112	Adipala	-7.667959	109.164223	t
1706	112	Bantarsari	-7.524255	108.914566	t
1707	112	Binangun	-7.673358	109.271255	t
1708	112	Cilacap Selatan	-7.698299	109.023521	t
1709	112	Cilacap Tengah	-7.698299	109.023521	t
1710	112	Cilacap Utara	-7.669049	109.027489	t
1711	112	Cimanggu	-7.311312	108.831383	t
1712	112	Cipari	-7.406653	108.771980	t
1713	112	Dayeuhluhur	-7.228230	108.605690	t
1714	112	Gandrungmangu	-7.506760	108.843269	t
1715	112	Jeruklegi	-7.591776	109.021545	t
1716	112	Kampung Laut	-7.671160	108.867027	t
1717	112	Karangpucung	-7.379821	108.914566	t
1718	112	Kawunganten	-7.596059	108.926453	t
1719	112	Kedungreja	-7.509905	108.771980	t
1720	112	Kesugihan	-7.620084	109.080986	t
1721	112	Kroya	-7.633135	109.247467	t
1722	112	Majenang	-7.233011	108.736336	t
1723	112	Maos	-7.601071	109.158272	t
1724	112	Nusawungu	-7.668945	109.366425	t
1725	112	Patimuan	-7.602442	108.783859	t
1726	112	Sampang	-7.578256	109.205841	t
1727	112	Sidareja	-7.484682	108.783401	t
1728	112	Wanareja	-7.307627	108.676949	t
1729	113	Bonang	-6.856702	110.581139	t
1730	113	Demak	-6.892161	110.637749	t
1731	113	Dempet	-6.950512	110.748009	t
1732	113	Gajah	-6.889732	110.748009	t
1733	113	Guntur	-6.978371	110.581139	t
1734	113	Karanganyar	-6.848176	110.771851	t
1735	113	Karangawen	-7.102473	110.533463	t
1736	113	Karangtengah	-6.937788	110.581139	t
1737	113	Kebonagung	-6.993245	110.700325	t
1738	113	Mijen	-6.810910	110.700325	t
1739	113	Mranggen	-7.042556	110.509628	t
1740	113	Sayung	-6.920711	110.509628	t
1741	113	Wedung	-6.799520	110.607399	t
1742	113	Wonosalam	-6.913216	110.676491	t
1743	114	Brati	-7.025039	110.891052	t
1744	114	Gabus	-7.202547	111.212959	t
1745	114	Geyer	-7.227009	110.914902	t
1746	114	Godong	-7.051944	110.748009	t
1747	114	Grobogan	-7.021719	110.962585	t
1748	114	Gubug	-7.070201	110.682449	t
1749	114	Karangrayung	-7.152425	110.771851	t
1750	114	Kedungjati	-7.189083	110.640732	t
1751	114	Klambu	-7.003816	110.801651	t
1752	114	Kradenan	-7.176113	111.129501	t
1753	114	Ngaringan	-7.042624	111.165268	t
1754	114	Penawangan	-7.109548	110.819527	t
1755	114	Pulokulon	-7.159228	111.057961	t
1756	114	Purwodadi	-7.087212	110.913414	t
1757	114	Tanggungharjo	-7.099181	110.604973	t
1758	114	Tawangharjo	-7.039766	111.010277	t
1759	114	Tegowanu	-7.037116	110.628815	t
1760	114	Toroh	-7.166017	110.914902	t
1761	114	Wirosari	-7.075559	111.085602	t
1762	115	Bangsri	-6.525299	110.771851	t
1763	115	Batealit	-6.626012	110.771851	t
1764	115	Donorojo	-6.448310	110.926819	t
1765	115	Jepara	-6.580498	110.678986	t
1766	115	Kalinyamatan	-6.735359	110.694366	t
1767	115	Karimun Jawa	-5.833559	110.450607	t
1768	115	Kedung	-6.660531	110.675758	t
1769	115	Keling	-6.479030	110.863869	t
1770	115	Kembang	-6.487242	110.803642	t
1771	115	Mayong	-6.706705	110.771851	t
1772	115	Mlonggo	-6.527764	110.709579	t
1773	115	Nalumsari	-6.720532	110.801651	t
1774	115	Pakis Aji	-6.584676	110.795685	t
1775	115	Pecangaan	-6.689654	110.700325	t
1776	115	Tahunan	-6.622681	110.678764	t
1777	115	Welahan	-6.765147	110.706284	t
1778	116	Colomadu	-7.535108	110.765884	t
1779	116	Gondangrejo	-7.495512	110.843369	t
1780	116	Jaten	-7.559883	110.885094	t
1781	116	Jatipuro	-7.747733	111.016235	t
1782	116	Jatiyoso	-7.707303	111.105652	t
1783	116	Jenawi	-7.542548	111.129501	t
1784	116	Jumantono	-7.672443	110.986427	t
1785	116	Jumapolo	-7.714618	110.962585	t
1786	116	Karanganyar	-7.607073	110.986694	t
1787	116	Karangpandan	-7.612254	111.063927	t
1788	116	Kebakkramat	-7.512412	110.914902	t
1789	116	Kerjo	-7.540735	111.063927	t
1790	116	Matesih	-7.644139	111.040077	t
1791	116	Mojogedang	-7.549720	110.986427	t
1792	116	Ngargoyoso	-7.605032	111.105652	t
1793	116	Tasikmadu	-7.572544	110.938744	t
1794	116	Tawangmangu	-7.665158	111.129501	t
1795	117	Adimulyo	-7.680686	109.556808	t
1796	117	Alian	-7.632716	109.699646	t
1797	117	Ambal	-7.775972	109.723450	t
1798	117	Ayah	-7.708038	109.414017	t
1799	117	Bonorowo	-7.756196	109.812744	t
1800	117	Buayan	-7.643871	109.461609	t
1801	117	Buluspesantren	-7.757607	109.675835	t
1802	117	Gombong	-7.605282	109.515160	t
1803	117	Karanganyar	-7.613373	109.562759	t
1804	117	Karanggayam	-7.553669	109.628220	t
1805	117	Karangsambung	-7.570927	109.699646	t
1806	117	Kebumen	-7.676190	109.663696	t
1807	117	Klirong	-7.759882	109.628220	t
1808	117	Kutowinangun	-7.697170	109.753212	t
1809	117	Kuwarasan	-7.662284	109.509209	t
1810	117	Mirit	-7.793175	109.794884	t
1811	117	Padureso	-7.633648	109.788933	t
1812	117	Pejagoan	-7.629221	109.646294	t
1813	117	Petanahan	-7.762151	109.580612	t
1814	117	Poncowarno	-7.655942	109.753212	t
1815	117	Prembun	-7.705775	109.788933	t
1816	117	Puring	-7.743752	109.533005	t
1817	117	Rowokele	-7.587973	109.443756	t
1818	117	Sadang	-7.508091	109.723450	t
1819	117	Sempor	-7.559184	109.509209	t
1820	117	Sruweng	-7.642070	109.610367	t
1821	118	Boja	-7.114446	110.271309	t
1822	118	Brangsong	-6.938240	110.229607	t
1823	118	Cepiring	-6.910900	110.158127	t
1824	118	Gemuh	-7.024373	110.122391	t
1825	118	Kaliwungu	-6.962776	110.253952	t
1826	118	Kaliwungu Selatan	-7.013707	110.247482	t
1827	118	Kangkung	-6.918330	110.104523	t
1828	118	Kendal	-6.931801	110.202805	t
1829	118	Limbangan	-7.174517	110.295135	t
1830	118	Ngampel	-7.001896	110.170044	t
1831	118	Pageruyung	-7.023243	110.033058	t
1832	118	Patean	-7.081202	110.104523	t
1833	118	Patebon	-6.873522	110.199821	t
1834	118	Pegandon	-7.002954	110.146217	t
1835	118	Plantungan	-7.102089	109.979462	t
1836	118	Ringinarum	-6.994360	110.110481	t
1837	118	Rowosari	-6.925238	110.062836	t
1838	118	Singorojo	-7.096227	110.223648	t
1839	118	Sukorejo	-7.147752	109.985413	t
1840	118	Weleri	-6.970822	110.076233	t
1841	119	Bayat	-7.771373	110.652649	t
1842	119	Cawas	-7.747226	110.724167	t
1843	119	Ceper	-7.683232	110.670525	t
1844	119	Delanggu	-7.620539	110.694366	t
1845	119	Gantiwarno	-7.770740	110.563255	t
1846	119	Jatinom	-7.636695	110.575180	t
1847	119	Jogonalan	-7.735081	110.557297	t
1848	119	Juwiring	-7.659151	110.742043	t
1849	119	Kalikotes	-7.722205	110.627945	t
1850	119	Karanganom	-7.643996	110.634773	t
1851	119	Karangdowo	-7.715187	110.736816	t
1852	119	Karangnongko	-7.658978	110.539421	t
1853	119	Kebonarum	-7.698845	110.563255	t
1854	119	Kemalang	-7.615459	110.485794	t
1855	119	Klaten Selatan	-7.720605	110.590073	t
1856	119	Klaten Tengah	-7.716995	110.610931	t
1857	119	Klaten Utara	-7.688624	110.613914	t
1858	119	Manisrenggo	-7.691541	110.503670	t
1859	119	Ngawen	-7.665690	110.610931	t
1860	119	Pedan	-7.691698	110.706284	t
1861	119	Polanharjo	-7.612066	110.658607	t
1862	119	Prambanan	-7.742302	110.515587	t
1863	119	Trucuk	-7.729103	110.676491	t
1864	119	Tulung	-7.594516	110.599014	t
1865	119	Wedi	-7.773778	110.604973	t
1866	119	Wonosari	-7.628412	110.742043	t
1867	120	Bae	-6.783251	110.867210	t
1868	120	Dawe	-6.701446	110.891052	t
1869	120	Gebog	-6.718952	110.837410	t
1870	120	Jati	-6.830060	110.837410	t
1871	120	Jekulo	-6.800242	110.938744	t
1872	120	Kaliwungu	-6.791762	110.789726	t
1873	120	Kota Kudus	-6.807260	110.841370	t
1874	120	Mejobo	-6.842808	110.891052	t
1875	120	Undaan	-6.906744	110.819527	t
1876	121	Bandongan	-7.460930	110.181953	t
1877	121	Borobudur	-7.629398	110.199821	t
1878	121	Candimulyo	-7.502805	110.271309	t
1879	121	Dukun	-7.539229	110.366631	t
1880	121	Grabag	-7.373371	110.325218	t
1881	121	Kajoran	-7.491354	110.080704	t
1882	121	Kaliangkrik	-7.449208	110.104523	t
1883	121	Mertoyudan	-7.524177	110.208061	t
1884	121	Mungkid	-7.554098	110.254089	t
1885	121	Muntilan	-7.588115	110.275063	t
1886	121	Ngablak	-7.394740	110.390457	t
1887	121	Ngluwar	-7.661596	110.277267	t
1888	121	Pakis	-7.457271	110.366631	t
1889	121	Salam	-7.624773	110.295135	t
1890	121	Salaman	-7.571206	110.128349	t
1891	121	Sawangan	-7.498237	110.366631	t
1892	121	Secang	-7.401500	110.247482	t
1893	121	Srumbung	-7.581403	110.342796	t
1894	121	Tegalrejo	-7.462947	110.247482	t
1895	121	Tempuran	-7.529005	110.152168	t
1896	121	Windusari	-7.404863	110.175995	t
1897	122	Batangan	-6.707770	111.201035	t
1898	122	Cluwak	-6.538232	110.938744	t
1899	122	Dukuhseti	-6.458087	111.032188	t
1900	122	Gabus	-6.816131	111.034119	t
1901	122	Gembong	-6.659018	110.938744	t
1902	122	Gunungwungkal	-6.568714	110.989410	t
1903	122	Jaken	-6.787285	111.224884	t
1904	122	Jakenan	-6.770373	111.153343	t
1905	122	Juwana	-6.709913	111.153343	t
1906	122	Kayen	-6.899138	110.986427	t
1907	122	Margorejo	-6.757724	110.986427	t
1908	122	Margoyoso	-6.613492	111.057961	t
1909	122	Pati	-6.748673	111.037926	t
1910	122	Pucakwangi	-6.840440	111.165268	t
1911	122	Sukolilo	-6.934401	110.879135	t
1912	122	Tambakromo	-6.895861	111.057961	t
1913	122	Tayu	-6.534094	111.034119	t
1914	122	Tlogowungu	-6.676006	111.010277	t
1915	122	Trangkil	-6.657990	111.075844	t
1916	122	Wedarijaksa	-6.692971	111.081810	t
1917	122	Winong	-6.873463	111.105652	t
1918	123	Bojong	-6.982804	109.556808	t
1919	123	Buaran	-6.932570	109.657982	t
1920	123	Doro	-7.059337	109.675835	t
1921	123	Kajen	-7.035863	109.573967	t
1922	123	Kandangserang	-7.207759	109.556808	t
1923	123	Karanganyar	-7.040982	109.628220	t
1924	123	Karangdadap	-6.982016	109.693687	t
1925	123	Kedungwuni	-6.963157	109.657982	t
1926	123	Kesesi	-7.025695	109.509209	t
1927	123	Lebakbarang	-7.133333	109.650002	t
1928	123	Paninggaran	-7.154993	109.592514	t
1929	123	Petungkriyono	-6.889836	109.674591	t
1930	123	Siwalan	-6.884654	109.586563	t
1931	123	Sragi	-6.916667	109.566666	t
1932	123	Talun	-7.041685	109.729401	t
1933	123	Tirto	-6.913202	109.634171	t
1934	123	Wiradesa	-6.901350	109.613342	t
1935	123	Wonokerto	-6.862770	109.622269	t
1936	123	Wonopringgo	-6.994786	109.634171	t
1937	124	Ampelgading	-6.949877	109.491356	t
1938	124	Bantarbolang	-7.040512	109.402115	t
1939	124	Belik	-7.165400	109.354530	t
1940	124	Bodeh	-7.027740	109.461609	t
1941	124	Comal	-6.886668	109.538956	t
1942	124	Moga	-7.118792	109.247467	t
1943	124	Pemalang	-6.920132	109.370575	t
1944	124	Petarukan	-6.884831	109.461609	t
1945	124	Pulosari	-7.158502	109.263397	t
1946	124	Randudongkal	-7.054303	109.318840	t
1947	124	Taman	-6.907231	109.414017	t
1948	124	Ulujami	-6.820703	109.533005	t
1949	124	Warungpring	-7.076806	109.271255	t
1950	124	Watukumpul	-7.150493	109.461609	t
1951	125	Bobotsari	-7.300000	109.366669	t
1952	125	Bojongsari	-7.345250	109.348579	t
1953	125	Bukateja	-7.432967	109.455658	t
1954	125	Kaligondang	-7.378296	109.414017	t
1955	125	Kalimanah	-7.417227	109.348579	t
1956	125	Karanganyar	-7.301518	109.408066	t
1957	125	Karangjambu	-7.214051	109.414017	t
1958	125	Karangmoncol	-7.273484	109.461609	t
1959	125	Karangreja	-7.238739	109.318840	t
1960	125	Kejobong	-7.399969	109.503258	t
1961	125	Kemangkon	-7.462733	109.366425	t
1962	125	Kertanegara	-7.290196	109.431862	t
1963	125	Kutasari	-7.317060	109.289101	t
1964	125	Mrebet	-7.314427	109.348579	t
1965	125	Padamara	-7.377150	109.324783	t
1966	125	Pengadegan	-7.370217	109.479454	t
1967	125	Purbalingga	-7.385735	109.360428	t
1968	125	Rembang	-7.290822	109.533005	t
1969	126	Bagelen	-7.822836	110.033058	t
1970	126	Banyuurip	-7.761159	109.976479	t
1971	126	Bayan	-7.724388	109.937775	t
1972	126	Bener	-7.616667	110.050003	t
1973	126	Bruno	-7.560853	109.913956	t
1974	126	Butuh	-7.727834	109.866325	t
1975	126	Gebang	-7.639726	109.985413	t
1976	126	Grabag	-7.809195	109.890144	t
1977	126	Kaligesing	-7.736890	110.104523	t
1978	126	Kemiri	-7.683333	109.883331	t
1979	126	Kutoarjo	-7.720673	109.908005	t
1980	126	Loano	-7.672011	110.062836	t
1981	126	Ngombol	-7.827510	109.937775	t
1982	126	Pituruh	-7.647683	109.818695	t
1983	126	Purwodadi	-7.830042	109.991371	t
1984	126	Purworejo	-7.713582	110.007835	t
1985	127	Bulu	-6.861362	111.367966	t
1986	127	Gunem	-6.855813	111.487206	t
1987	127	Kaliori	-6.724676	111.272575	t
1988	127	Kragan	-6.672150	111.591011	t
1989	127	Lasem	-6.698617	111.444504	t
1990	127	Pamotan	-6.761747	111.486801	t
1991	127	Pancur	-6.720211	111.481247	t
1992	127	Rembang	-6.706555	111.337288	t
1993	127	Sale	-6.852470	111.558754	t
1994	127	Sarang	-6.768638	111.630302	t
1995	127	Sedan	-6.769375	111.569000	t
1996	127	Sluke	-6.653544	111.511055	t
1997	127	Sulang	-6.780742	111.367966	t
1998	127	Sumber	-6.796871	111.261497	t
1999	128	Ambarawa	-7.262294	110.403481	t
2000	128	Bancak	-7.262070	110.604973	t
2001	128	Bandungan	-7.212019	110.366631	t
2002	128	Banyubiru	-7.332285	110.414291	t
2003	128	Bawen	-7.226745	110.435753	t
2004	128	Bergas	-7.178734	110.422661	t
2005	128	Bringin	-7.224655	110.533463	t
2006	128	Getasan	-7.392476	110.438126	t
2007	128	Jambu	-7.294779	110.342796	t
2008	128	Kaliwungu	-7.470515	110.622849	t
2009	128	Pabelan	-7.306242	110.533463	t
2010	128	Pringapus	-7.164638	110.509628	t
2011	128	Sumowono	-7.215319	110.295135	t
2012	128	Suruh	-7.344807	110.581139	t
2013	128	Susukan	-7.404941	110.604973	t
2014	128	Tengaran	-7.403546	110.527504	t
2015	128	Tuntang	-7.267673	110.485794	t
2016	128	Ungaran Barat	-7.136148	110.395439	t
2017	128	Ungaran Timur	-7.141756	110.416603	t
2018	129	Gemolong	-7.393422	110.843369	t
2019	129	Gesi	-7.324171	111.010277	t
2020	129	Gondang	-7.441733	111.105652	t
2021	129	Jenar	-7.319529	111.105652	t
2022	129	Kalijambe	-7.435403	110.819527	t
2023	129	Karangmalang	-7.439153	111.025116	t
2024	129	Kedawung	-7.486078	111.034119	t
2025	129	Masaran	-7.470387	110.938744	t
2026	129	Miri	-7.348972	110.813568	t
2027	129	Mondokan	-7.307273	110.938744	t
2028	129	Ngrampal	-7.388331	111.052002	t
2029	129	Plupuh	-7.431907	110.891052	t
2030	129	Sambirejo	-7.502922	111.105652	t
2031	129	Sambungmacan	-7.362344	111.114594	t
2032	129	Sidoharjo	-7.428399	110.962585	t
2033	129	Sragen	-7.419408	111.022491	t
2034	129	Sukodono	-7.321104	110.968544	t
2035	129	Sumberlawang	-7.331096	110.867210	t
2036	129	Tangen	-7.281157	111.057961	t
2037	129	Tanon	-7.389941	110.914902	t
2038	130	Baki	-7.614422	110.774269	t
2039	130	Bendosari	-7.697762	110.891052	t
2040	130	Bulu	-7.767740	110.825493	t
2041	130	Gatak	-7.587450	110.742043	t
2042	130	Grogol	-7.602244	110.810204	t
2043	130	Kartasura	-7.556745	110.742043	t
2044	130	Mojolaban	-7.596573	110.867210	t
2045	130	Nguter	-7.737544	110.914902	t
2046	130	Polokarto	-7.636315	110.891052	t
2047	130	Sukoharjo	-7.683029	110.814735	t
2048	130	Tawangsari	-7.728521	110.789726	t
2049	130	Weru	-7.787080	110.748009	t
2050	131	Adiwerna	-6.939131	109.125916	t
2051	131	Balapulang	-7.052523	109.100098	t
2052	131	Bojong	-7.162864	109.176109	t
2053	131	Bumijawa	-7.185431	109.128548	t
2054	131	Dukuhturi	-6.904568	109.110710	t
2055	131	Dukuhwaru	-6.966898	109.086929	t
2056	131	Jatinegara	-7.037888	109.223686	t
2176	141	Modung	-7.164758	112.965454	t
2057	131	Kedungbanteng	-6.983333	109.183334	t
2058	131	Kramat	-6.875345	109.199898	t
2059	131	Lebaksiu	-7.041913	109.128548	t
2060	131	Margasari	-7.097667	109.021545	t
2061	131	Pagerbarang	-7.024433	109.057205	t
2062	131	Pangkah	-6.974146	109.158272	t
2063	131	Slawi	-6.985371	109.134491	t
2064	131	Suradadi	-6.914210	109.247467	t
2065	131	Talang	-6.902598	109.158272	t
2066	131	Tarub	-6.922043	109.182060	t
2067	131	Warureja	-6.890814	109.318840	t
2068	132	Bansari	-7.282738	110.050919	t
2069	132	Bejen	-7.121987	110.104523	t
2070	132	Bulu	-7.305842	110.104523	t
2071	132	Candiroto	-7.174688	110.065735	t
2072	132	Gemawang	-7.181047	110.152168	t
2073	132	Jumo	-7.219227	110.098564	t
2074	132	Kaloran	-7.250000	110.250000	t
2075	132	Kandangan	-7.240124	110.199821	t
2076	132	Kedu	-7.258461	110.134300	t
2077	132	Kledung	-7.328507	110.056877	t
2078	132	Kranggan	-7.320773	110.223648	t
2079	132	Ngadirejo	-7.246677	110.056877	t
2080	132	Parakan	-7.285720	110.105202	t
2081	132	Pringsurat	-7.337882	110.295135	t
2082	132	Selopampang	-7.381216	110.134300	t
2083	132	Temanggung	-7.317856	110.177917	t
2084	132	Tembarak	-7.359630	110.158127	t
2085	132	Tlogomulyo	-7.351059	110.122391	t
2086	132	Tretep	-7.182692	110.003281	t
2087	132	Wonoboyo	-7.229487	109.985413	t
2088	133	Baturetno	-7.962194	110.938744	t
2089	133	Batuwarno	-7.978995	111.010277	t
2090	133	Bulukerto	-7.783037	111.224884	t
2091	133	Eromoko	-7.968435	110.819527	t
2092	133	Girimarto	-7.769973	111.081810	t
2093	133	Giritontro	-8.060476	110.877296	t
2094	133	Giriwoyo	-8.044517	110.938744	t
2095	133	Jatipurno	-7.786759	111.153343	t
2096	133	Jatiroto	-7.882823	111.107903	t
2097	133	Jatisrono	-7.828994	111.129501	t
2098	133	Karangtengah	-8.017604	111.057961	t
2099	133	Kismantoro	-7.904766	111.248734	t
2100	133	Manyaran	-7.845046	110.819527	t
2101	133	Ngadirojo	-7.835195	111.010277	t
2102	133	Nguntoronadi	-7.899276	110.962585	t
2103	133	Paranggupito	-8.172030	110.867210	t
2104	133	Pracimantoro	-8.047049	110.813103	t
2105	133	Puhpelem	-7.760079	111.272575	t
2106	133	Purwantoro	-7.841997	111.272575	t
2107	133	Selogiri	-7.779781	110.891052	t
2108	133	Sidoharjo	-7.853237	111.057961	t
2109	133	Slogohimo	-7.845756	111.201035	t
2110	133	Tirtomoyo	-7.954660	111.081810	t
2111	133	Wonogiri	-7.797852	110.938744	t
2112	133	Wuryantoro	-7.884918	110.843369	t
2113	134	Garung	-7.293035	109.937775	t
2114	134	Kalibawang	-7.499202	109.913956	t
2115	134	Kalikajar	-7.392164	110.009232	t
2116	134	Kaliwiro	-7.472282	109.830605	t
2117	134	Kejajar	-7.231647	109.937775	t
2118	134	Kepil	-7.515257	110.009232	t
2119	134	Kertek	-7.352285	109.985413	t
2120	134	Leksono	-7.378270	109.866325	t
2121	134	Mojotengah	-7.319994	109.908005	t
2122	134	Sapuran	-7.454797	109.985413	t
2123	134	Selomerto	-7.417092	109.913956	t
2124	134	Sukoharjo	-7.380459	109.818695	t
2125	134	Wadaslintang	-7.556735	109.782982	t
2126	134	Watumalang	-7.317863	109.842514	t
2127	134	Wonosobo	-7.355577	109.913956	t
2128	135	Magelang Selatan	-7.492407	110.220673	t
2129	135	Magelang Tengah	-7.479734	110.217697	t
2130	135	Magelang Utara	-7.456534	110.220673	t
2131	136	Pekalongan Barat	-6.891810	109.657982	t
2132	136	Pekalongan Selatan	-6.921359	109.681786	t
2133	136	Pekalongan Timur	-6.900474	109.693687	t
2134	136	Pekalongan Utara	-6.870430	109.681786	t
2135	137	Argomulyo	-7.330523	110.508438	t
2136	137	Sidomukti	-7.334298	110.479836	t
2137	137	Sidorejo	-7.305518	110.494728	t
2138	137	Tingkir	-7.332606	110.515587	t
2139	138	Banyumanik	-7.072044	110.420250	t
2140	138	Candisari	-7.018252	110.429192	t
2141	138	Gajahmungkur	-7.011570	110.408333	t
2142	138	Gayamsari	-6.981884	110.447060	t
2143	138	Genuk	-6.967716	110.479836	t
2144	138	Gunungpati	-7.087609	110.357689	t
2145	138	Mijen	-7.051196	110.318970	t
2146	138	Ngaliyan	-6.990170	110.318970	t
2147	138	Pedurungan	-6.998721	110.467918	t
2148	138	Semarang Barat	-6.982154	110.384499	t
2149	138	Semarang Selatan	-6.997927	110.429192	t
2150	138	Semarang Tengah	-6.980550	110.420250	t
2151	138	Semarang Timur	-6.972263	110.435143	t
2152	138	Semarang Utara	-6.960769	110.408333	t
2153	138	Tembalang	-7.044723	110.461960	t
2154	138	Tugu	-6.964495	110.324921	t
2155	139	Banjarsari	-7.542981	110.813568	t
2156	139	Jebres	-7.551435	110.849335	t
2157	139	Laweyan	-7.554388	110.789726	t
2158	139	Pasar Kliwon	-7.580303	110.834427	t
2159	139	Serengan	-7.581193	110.816551	t
2160	140	Margadana	-6.874410	109.098824	t
2161	140	Tegal Barat	-6.855929	109.113686	t
2162	140	Tegal Selatan	-6.886321	109.119629	t
2163	140	Tegal Timur	-6.864916	109.143410	t
2164	141	Arosbaya	-6.970433	112.846298	t
2165	141	Bangkalan	-7.025282	112.751984	t
2166	141	Blega	-7.120895	113.036942	t
2167	141	Burneh	-7.032969	112.798637	t
2168	141	Galis	-7.084525	112.965454	t
2169	141	Geger	-7.005618	112.941628	t
2170	141	Kamal	-7.136996	112.727127	t
2171	141	Klampis	-6.926103	112.884399	t
2172	141	Kokop	-6.979496	113.060768	t
2173	141	Konang	-7.039522	113.060768	t
2174	141	Kwanyar	-7.149665	112.870132	t
2175	141	Labang	-7.123349	112.793190	t
2177	141	Sepulu	-6.924372	112.965454	t
2178	141	Socah	-7.076748	112.727127	t
2179	141	Tanah Merah	-7.069403	112.870132	t
2180	141	Tanjung Bumi	-6.896300	113.075661	t
2181	141	Tragah	-7.091919	112.822472	t
2182	142	Bangorejo	-8.508940	114.155823	t
2183	142	Banyuwangi	-8.219233	114.369225	t
2184	142	Cluring	-8.443318	114.227165	t
2185	142	Gambiran	-8.396026	114.144699	t
2186	142	Genteng	-8.366583	114.146301	t
2187	142	Giri	-8.187882	114.340088	t
2188	142	Glagah	-8.217807	114.309303	t
2189	142	Glenmore	-8.301116	114.072586	t
2190	142	Kabat	-8.274982	114.322258	t
2191	142	Kalibaru	-8.266599	113.977440	t
2192	142	Kalipuro	-8.152144	114.346031	t
2193	142	Licin	-8.192379	114.262604	t
2194	142	Muncar	-8.448017	114.310371	t
2195	142	Pesanggaran	-8.510429	113.977440	t
2196	142	Purwoharjo	-8.543332	114.250938	t
2197	142	Rogojampi	-8.335728	114.322258	t
2198	142	Sempu	-8.324217	114.147903	t
2199	142	Siliragung	-8.493277	114.084480	t
2200	142	Singojuruh	-8.320080	114.250938	t
2201	142	Songgon	-8.136084	114.120155	t
2202	142	Srono	-8.399762	114.261299	t
2203	142	Tegaldlimo	-8.644842	114.405449	t
2204	142	Tegalsari	-8.401854	114.118103	t
2205	142	Wongsorejo	-8.003042	114.310371	t
2206	143	Bakung	-8.259398	112.071480	t
2207	143	Binangun	-8.212778	112.345695	t
2208	143	Doko	-8.046452	112.393387	t
2209	143	Gandusari	-8.000151	112.309937	t
2210	143	Garum	-8.034161	112.250320	t
2211	143	Kademangan	-8.199555	112.106018	t
2212	143	Kanigoro	-8.118667	112.202637	t
2213	143	Kesamben	-8.150003	112.369537	t
2214	143	Nglegok	-7.994650	112.226479	t
2215	143	Panggungrejo	-8.248356	112.262245	t
2216	143	Ponggok	-8.010895	112.119179	t
2217	143	Sanankulon	-8.066124	112.137062	t
2218	143	Selopuro	-8.137754	112.315895	t
2219	143	Selorejo	-8.104992	112.441071	t
2220	143	Srengat	-8.085849	112.059563	t
2221	143	Sutojayan	-8.172456	112.212257	t
2222	143	Talun	-8.094127	112.274170	t
2223	143	Udanawu	-8.010788	112.029755	t
2224	143	Wates	-8.294728	112.345695	t
2225	143	Wlingi	-8.129380	112.320999	t
2226	143	Wonodadi	-8.047593	112.011864	t
2227	143	Wonotirto	-8.253889	112.166870	t
2228	144	Balen	-7.195965	111.964172	t
2229	144	Baureno	-7.129435	112.083405	t
2230	144	Bojonegoro	-7.152479	111.886932	t
2231	144	Bubulan	-7.324584	111.821091	t
2232	144	Dander	-7.253100	111.833008	t
2233	144	Gayam	-7.192974	111.719734	t
2234	144	Gondang	-7.415227	111.833008	t
2235	144	Kalitidu	-7.144821	111.773392	t
2236	144	Kanor	-7.111643	112.035713	t
2237	144	Kapas	-7.199545	111.892632	t
2238	144	Kasiman	-7.131624	111.630302	t
2239	144	Kedewan	-7.010391	111.630302	t
2240	144	Kedungadem	-7.313666	112.035713	t
2241	144	Kepoh Baru	-7.189974	112.083405	t
2242	144	Malo	-7.116667	111.716667	t
2243	144	Margomulyo	-7.321058	111.487206	t
2244	144	Ngambon	-7.329403	111.725693	t
2245	144	Ngasem	-7.247156	111.749542	t
2246	144	Ngraho	-7.236370	111.558754	t
2247	144	Padangan	-7.193504	111.606453	t
2248	144	Purwosari	-7.230467	111.677994	t
2249	144	Sekar	-7.410565	111.725693	t
2250	144	Sugihwaras	-7.323649	111.965591	t
2251	144	Sukosewu	-7.257816	111.940323	t
2252	144	Sumberejo	-7.203073	112.023788	t
2253	144	Tambakrejo	-7.303178	111.642227	t
2254	144	Temayang	-7.360259	111.916481	t
2255	144	Trucuk	-7.124937	111.818108	t
2256	145	Binakal	-7.911432	113.745430	t
2257	145	Bondowoso	-7.918759	113.820641	t
2258	145	Botolinggo	-7.908972	114.036903	t
2259	145	Cermee	-7.826923	114.060692	t
2260	145	Curahdami	-7.911993	113.778160	t
2261	145	Grujugan	-7.986887	113.751381	t
2262	145	Jambesari Darus Sholah	-7.981112	113.846573	t
2263	145	Klabang	-7.815340	113.917961	t
2264	145	Maesan	-8.027356	113.751381	t
2265	145	Pakem	-7.930516	113.679977	t
2266	145	Prajekan	-7.792351	113.965546	t
2267	145	Pujer	-7.998427	113.894165	t
2268	145	Sempol	-8.052276	114.167717	t
2269	145	Sukosari	-7.941958	113.950676	t
2270	145	Sumberwringin	-7.989535	113.998253	t
2271	145	Taman Krocok	-7.858514	113.870369	t
2272	145	Tamanan	-8.023005	113.822777	t
2273	145	Tapen	-7.894567	113.941750	t
2274	145	Tegalampel	-7.881548	113.822777	t
2275	145	Tenggarang	-7.940697	113.846573	t
2276	145	Tlogosari	-8.034480	113.965546	t
2277	145	Wonosari	-7.885317	113.897598	t
2278	145	Wringin	-7.823846	113.775185	t
2279	146	Balongpanggang	-7.272593	112.441071	t
2280	146	Benjeng	-7.262180	112.501007	t
2281	146	Bungah	-7.023801	112.584106	t
2282	146	Cerme	-7.226098	112.560272	t
2283	146	Driyorejo	-7.344552	112.607948	t
2284	146	Duduksampeyan	-7.146804	112.536430	t
2285	146	Dukun	-6.990826	112.441071	t
2286	146	Gresik	-7.165244	112.651985	t
2287	146	Kebomas	-7.178458	112.623390	t
2288	146	Kedamean	-7.328141	112.536430	t
2289	146	Manyar	-7.093490	112.596024	t
2290	146	Menganti	-7.285307	112.584106	t
2291	146	Panceng	-6.929434	112.464905	t
2292	146	Sangkapura	-5.842914	112.645401	t
2293	146	Sidayu	-6.986058	112.536430	t
2294	146	Tambak	-5.742111	112.645302	t
2295	146	Ujungpangkah	-6.935318	112.548347	t
2296	146	Wringinanom	-7.369767	112.512589	t
2297	147	Ajung	-8.235992	113.656174	t
2298	147	Ambulu	-8.381355	113.608559	t
2299	147	Arjasa	-8.104396	113.733536	t
2300	147	Balung	-8.263703	113.537140	t
2301	147	Bangsalsari	-8.171506	113.549042	t
2302	147	Gumukmas	-8.317988	113.400215	t
2303	147	Jelbuk	-8.069304	113.727585	t
2304	147	Jenggawah	-8.296967	113.656174	t
2305	147	Jombang	-8.212930	113.370445	t
2306	147	Kalisat	-8.125700	113.798981	t
2307	147	Kaliwates	-8.189193	113.674026	t
2308	147	Kencong	-8.306383	113.335403	t
2309	147	Ledokombo	-8.150936	113.882271	t
2310	147	Mayang	-8.206805	113.798981	t
2311	147	Mumbulsari	-8.250372	113.751381	t
2312	147	Pakusari	-8.167716	113.775185	t
2313	147	Panti	-8.003481	113.644272	t
2314	147	Patrang	-8.137000	113.697830	t
2315	147	Puger	-8.477942	113.370445	t
2316	147	Rambipuji	-8.218626	113.608559	t
2317	147	Semboro	-8.183508	113.435936	t
2318	147	Silo	-8.272610	113.882271	t
2319	147	Sukorambi	-8.118911	113.662125	t
2320	147	Sukowono	-8.063477	113.822777	t
2321	147	Sumberbaru	-8.098964	113.406174	t
2322	147	Sumberjambe	-8.076392	113.941750	t
2323	147	Sumbersari	-8.170662	113.727585	t
2324	147	Tanggul	-8.093203	113.501419	t
2325	147	Tempurejo	-8.400578	113.787079	t
2326	147	Umbulsari	-8.250708	113.418076	t
2327	147	Wuluhan	-8.365478	113.537140	t
2328	148	Bandarkedungmulyo	-7.536064	112.238403	t
2329	148	Bareng	-7.666667	112.300003	t
2330	148	Diwek	-7.583333	112.233330	t
2331	148	Gudo	-7.624555	112.196671	t
2332	148	Jogoroto	-7.597713	112.271187	t
2333	148	Jombang	-7.546839	112.226479	t
2334	148	Kabuh	-7.386003	112.202637	t
2335	148	Kesamben	-7.461977	112.298012	t
2336	148	Kudu	-7.421491	112.298012	t
2337	148	Megaluh	-7.503419	112.184753	t
2338	148	Mojoagung	-7.620317	112.369537	t
2339	148	Mojowarno	-7.622894	112.321854	t
2340	148	Ngoro	-7.687701	112.250320	t
2341	148	Ngusikan	-7.379783	112.321854	t
2342	148	Perak	-7.575062	112.172829	t
2343	148	Peterongan	-7.518639	112.280128	t
2344	148	Plandaan	-7.430227	112.131096	t
2345	148	Ploso	-7.440117	112.232445	t
2346	148	Sumobito	-7.521486	112.321854	t
2347	148	Tembelang	-7.484753	112.250320	t
2348	148	Wonosalam	-7.720543	112.393387	t
2349	149	Badas	-7.730963	112.202637	t
2350	149	Banyakan	-7.785931	111.940323	t
2351	149	Gampengrejo	-7.755613	112.029755	t
2352	149	Grogol	-7.772244	111.910515	t
2353	149	Gurah	-7.812207	112.113213	t
2354	149	Kandangan	-7.755871	112.286003	t
2355	149	Kandat	-7.923589	112.035713	t
2356	149	Kayen Kidul	-7.741555	112.101288	t
2357	149	Kepung	-7.788102	112.274170	t
2358	149	Kras	-7.967099	111.988022	t
2359	149	Kunjang	-7.665837	112.184753	t
2360	149	Mojo	-7.898852	111.928406	t
2361	149	Ngadiluwih	-7.905793	111.988022	t
2362	149	Ngancar	-7.936067	112.178787	t
2363	149	Ngasem	-7.805271	112.053596	t
2364	149	Pagu	-7.766397	112.084297	t
2365	149	Papar	-7.695436	112.107254	t
2366	149	Pare	-7.765512	112.197899	t
2367	149	Plemahan	-7.713206	112.154945	t
2368	149	Plosoklaten	-7.874859	112.178787	t
2369	149	Puncu	-7.850515	112.250320	t
2370	149	Purwoasri	-7.633149	112.131096	t
2371	149	Ringinrejo	-7.979452	112.041672	t
2372	149	Semen	-7.829323	111.892632	t
2373	149	Tarokan	-7.746436	111.916481	t
2374	149	Wates	-7.915843	112.130997	t
2375	150	Babat	-7.103313	112.202637	t
2376	150	Bluluk	-7.308781	112.131096	t
2377	150	Brondong	-6.882720	112.271004	t
2378	150	Deket	-7.110216	112.464905	t
2379	150	Glagah	-7.067586	112.512589	t
2380	150	Kalitengah	-7.018019	112.399345	t
2381	150	Karangbinangun	-7.029803	112.464905	t
2382	150	Karanggeneng	-6.990548	112.371033	t
2383	150	Kedungpring	-7.183951	112.202637	t
2384	150	Kembangbahu	-7.175469	112.369537	t
2385	150	Lamongan	-7.118111	112.414978	t
2386	150	Laren	-6.958929	112.274170	t
2387	150	Maduran	-7.003263	112.292053	t
2388	150	Mantup	-7.272920	112.354698	t
2389	150	Modo	-7.227947	112.131096	t
2390	150	Ngimbang	-7.280739	112.215797	t
2391	150	Paciran	-6.889297	112.363579	t
2392	150	Pucuk	-7.093793	112.292053	t
2393	150	Sambeng	-7.312134	112.262245	t
2394	150	Sarirejo	-7.190734	112.464905	t
2395	150	Sekaran	-7.059464	112.274170	t
2396	150	Solokuro	-6.934147	112.369537	t
2397	150	Sugio	-7.180323	112.274170	t
2398	150	Sukodadi	-7.136392	112.345695	t
2399	150	Sukorame	-7.344954	112.110199	t
2400	150	Tikung	-7.188448	112.411263	t
2401	150	Turi	-7.073604	112.393387	t
2402	151	Candipuro	-8.190961	113.060768	t
2403	151	Gucialit	-8.023911	113.132240	t
2404	151	Jatiroto	-8.134475	113.322815	t
2405	151	Kedungjajang	-8.038582	113.227531	t
2406	151	Klakah	-7.996564	113.249603	t
2407	151	Kunir	-8.234846	113.221001	t
2408	151	Lumajang	-8.132768	113.224556	t
2409	151	Padang	-8.102394	113.179893	t
2410	151	Pasirian	-8.182930	113.073402	t
2411	151	Pasrujambe	-8.083901	112.977371	t
2412	151	Pronojiwo	-8.206156	112.977371	t
2413	151	Randuagung	-8.053209	113.322815	t
2414	151	Ranuyoso	-7.954578	113.275177	t
2415	151	Rowokangkung	-8.195488	113.322815	t
2416	151	Senduro	-8.029527	113.036942	t
2417	151	Sukodono	-8.094106	113.233490	t
2418	151	Sumbersuko	-8.152960	113.183289	t
2419	151	Tekung	-8.197151	113.251297	t
2420	151	Tempeh	-8.177574	113.151802	t
2421	151	Tempursari	-8.287782	112.977371	t
2422	151	Yosowilangun	-8.236166	113.287468	t
2423	152	Balerejo	-7.538658	111.606453	t
2424	152	Dagangan	-7.743818	111.582603	t
2425	152	Dolopo	-7.787210	111.534904	t
2426	152	Geger	-7.710902	111.528946	t
2427	152	Gemarang	-7.633037	111.749542	t
2428	152	Jiwan	-7.610726	111.493172	t
2429	152	Kare	-7.718360	111.677994	t
2430	152	Kebon Sari	-7.748846	111.487206	t
2431	152	Madiun	-7.631059	111.530014	t
2432	152	Mejayan	-7.570819	111.675507	t
2433	152	Pilangkenceng	-7.475173	111.654144	t
2434	152	Saradan	-7.501379	111.737617	t
2435	152	Sawahan	-7.568724	111.517021	t
2436	152	Wonoasri	-7.598522	111.630302	t
2437	152	Wungu	-7.660922	111.606453	t
2438	153	Barat	-7.551406	111.457397	t
2439	153	Bendo	-7.649209	111.439514	t
2440	153	Karangrejo	-7.563429	111.421623	t
2441	153	Karas	-7.576066	111.373932	t
2442	153	Kartoharjo	-7.529810	111.481247	t
2443	153	Kawedanan	-7.696706	111.409706	t
2444	153	Lembeyan	-7.752602	111.415665	t
2445	153	Magetan	-7.649341	111.338158	t
2446	153	Maospati	-7.606282	111.453003	t
2447	153	Ngariboyo	-7.690203	111.338158	t
2448	153	Nguntoronadi	-7.715272	111.445473	t
2449	153	Panekan	-7.618187	111.248734	t
2450	153	Parang	-7.756347	111.344124	t
2451	153	Plaosan	-7.680719	111.224884	t
2452	153	Poncol	-7.719158	111.272575	t
2453	153	Sidorejo	-7.653022	111.266617	t
2454	153	Sukomoro	-7.627080	111.373932	t
2455	153	Takeran	-7.682767	111.481247	t
2456	154	Ampelgading	-8.211854	112.882050	t
2457	154	Bantur	-8.313498	112.548347	t
2458	154	Bululawang	-8.112970	112.655624	t
2459	154	Dampit	-8.208461	112.755600	t
2460	154	Dau	-7.956712	112.536430	t
2461	154	Donomulyo	-8.321969	112.405304	t
2462	154	Gedangan	-8.339242	112.631783	t
2463	154	Gondanglegi	-8.183743	112.641602	t
2464	154	Jabung	-7.941713	112.798637	t
2465	154	Kalipare	-8.207224	112.441071	t
2466	154	Karang Ploso	-7.852238	112.584106	t
2467	154	Kasembon	-7.804510	112.345695	t
2468	154	Kepanjen	-8.129085	112.572762	t
2469	154	Kromengan	-8.127430	112.494705	t
2470	154	Lawang	-7.830759	112.697098	t
2471	154	Ngajung	-7.966620	112.632629	t
2472	154	Ngantang	-7.897329	112.364128	t
2473	154	Pagak	-8.243959	112.512589	t
2474	154	Pagelaran	-8.197451	112.607948	t
2475	154	Pakis	-7.967539	112.703293	t
2476	154	Pakisaji	-8.074933	112.607948	t
2477	154	Poncokusumo	-8.055128	112.813301	t
2478	154	Pujon	-7.829074	112.452988	t
2479	154	Singosari	-7.884879	112.672264	t
2480	154	Sumbermanjing Wetan	-8.251113	112.694359	t
2481	154	Sumberpucung	-8.161852	112.473846	t
2482	154	Tajinan	-8.050397	112.679459	t
2483	154	Tirtoyudo	-8.251499	112.816505	t
2484	154	Tumpang	-8.005511	112.750969	t
2485	154	Turen	-8.168005	112.692772	t
2486	154	Wagir	-8.014754	112.595398	t
2487	154	Wajak	-8.127795	112.750969	t
2488	154	Wonosari	-8.061404	112.488747	t
2489	155	Bangsal	-7.507182	112.494705	t
2490	155	Dawarblandong	-7.347162	112.414246	t
2491	155	Dlanggu	-7.569218	112.470871	t
2492	155	Gedeg	-7.441037	112.395531	t
2493	155	Gondang	-7.674703	112.488747	t
2494	155	Jatirejo	-7.617735	112.417229	t
2495	155	Jetis	-7.408585	112.447029	t
2496	155	Kemlagi	-7.397504	112.369537	t
2497	155	Kutorejo	-7.572027	112.512589	t
2498	155	Mojoanyar	-7.477466	112.482788	t
2499	155	Mojosari	-7.504599	112.542328	t
2500	155	Ngoro	-7.557660	112.628174	t
2501	155	Pacet	-7.701867	112.548347	t
2502	155	Pungging	-7.541598	112.569572	t
2503	155	Puri	-7.535370	112.441071	t
2504	155	Sooko	-7.501525	112.411263	t
2505	155	Trawas	-7.647882	112.607948	t
2506	155	Trowulan	-7.553446	112.387421	t
2507	156	Bagor	-7.587314	111.844933	t
2508	156	Baron	-7.616667	112.033333	t
2509	156	Berbek	-7.650000	111.866669	t
2510	156	Gondang	-7.529616	111.976097	t
2511	156	Jatikalen	-7.491036	112.131096	t
2512	156	Kertosono	-7.609974	112.089371	t
2513	156	Lengkong	-7.474505	112.059563	t
2514	156	Loceret	-7.748996	111.868782	t
2515	156	Nganjuk	-7.604372	111.899345	t
2516	156	Ngetos	-7.751551	111.821091	t
2517	156	Ngluyu	-7.437665	111.988022	t
2518	156	Ngronggot	-7.677655	112.059563	t
2519	156	Pace	-7.685308	111.916481	t
2520	156	Patianrowo	-7.548406	112.101288	t
2521	156	Prambon	-7.700568	112.011864	t
2522	156	Rejoso	-7.493972	111.880707	t
2523	156	Sawahan	-7.754101	111.773392	t
2524	156	Sukomoro	-7.601373	111.964172	t
2525	156	Tanjunganom	-7.640786	111.988022	t
2526	156	Wilangan	-7.564288	111.799500	t
2527	157	Bringin	-7.397515	111.582603	t
2528	157	Geneng	-7.487322	111.415665	t
2529	157	Gerih	-7.516667	111.400002	t
2530	157	Jogorogo	-7.536536	111.248734	t
2531	157	Karanganyar	-7.313698	111.224884	t
2532	157	Karangjati	-7.458493	111.582603	t
2533	157	Kasreman	-7.401123	111.511055	t
2534	157	Kedunggalar	-7.431042	111.320274	t
2535	157	Kendal	-7.554519	111.296425	t
2536	157	Kwadungan	-7.508227	111.505096	t
2537	157	Mantingan	-7.383051	111.159309	t
2538	157	Ngawi	-7.419073	111.457397	t
2539	157	Ngrambe	-7.500000	111.199997	t
2540	157	Padas	-7.460918	111.534904	t
2541	157	Pangkur	-7.501615	111.534904	t
2542	157	Paron	-7.480153	111.356049	t
2543	157	Pitu	-7.348480	111.344124	t
2544	157	Sine	-7.560560	111.177193	t
2545	157	Widodaren	-7.415439	111.224884	t
2546	158	Arjosari	-8.104452	111.165268	t
2547	158	Bandar	-8.006135	111.272575	t
2548	158	Donorojo	-8.147560	110.938744	t
2549	158	Kebonagung	-8.217109	111.177193	t
2550	158	Nawangan	-7.990694	111.177193	t
2551	158	Ngadirojo	-8.231161	111.296425	t
2552	158	Pacitan	-8.179782	111.105652	t
2553	158	Pringkuku	-8.183664	111.034119	t
2554	158	Punung	-8.121820	111.034119	t
2555	158	Sudimoro	-8.227203	111.367966	t
2556	158	Tegalombo	-8.066500	111.296425	t
2557	158	Tulakan	-8.181624	111.260658	t
2558	159	Batumarmar	-6.966632	113.501419	t
2559	159	Galis	-7.148306	113.550400	t
2560	159	Kadur	-7.074489	113.537140	t
2561	159	Larangan	-7.119116	113.543091	t
2562	159	Pademawu	-7.195705	113.513329	t
2563	159	Pakong	-7.033304	113.560944	t
2564	159	Palenga"an	-7.079550	113.441895	t
2565	159	Pamekasan	-7.154249	113.473907	t
2566	159	Pasean	-6.912468	113.584755	t
2567	159	Pegantenan	-7.038342	113.465706	t
2568	159	Proppo	-7.140800	113.418076	t
2569	159	Tlanakan	-7.199562	113.441895	t
2570	159	Waru	-6.943189	113.547798	t
2571	160	Bangil	-7.604976	112.775101	t
2572	160	Beji	-7.594785	112.745010	t
2573	160	Gempol	-7.603442	112.679459	t
2574	160	Gondangwetan	-7.711705	112.917793	t
2575	160	Grati	-7.746822	113.013115	t
2576	160	Kejayan	-7.735982	112.846298	t
2577	160	Kraton	-7.675209	112.846298	t
2578	160	Lekok	-7.665874	113.013115	t
2579	160	Lumbang	-7.799505	112.977371	t
2580	160	Nguling	-7.703643	113.060768	t
2581	160	Pandaan	-7.642635	112.703293	t
2582	160	Pasrepan	-7.794111	112.893967	t
2583	160	Pohjentrek	-7.678608	112.876091	t
2584	160	Prigen	-7.697172	112.627899	t
2585	160	Purwodadi	-7.803544	112.727127	t
2586	160	Purwosari	-7.762950	112.727127	t
2587	160	Puspo	-7.836040	112.870132	t
2588	160	Rejoso	-7.674607	112.947586	t
2589	160	Rembang	-7.637366	112.798637	t
2590	160	Sukorejo	-7.716918	112.718758	t
2591	160	Tosari	-7.895585	112.893967	t
2592	160	Tutur	-7.899687	112.822472	t
2593	160	Winongan	-7.750871	112.941628	t
2594	160	Wonorejo	-7.719720	112.774803	t
2595	161	Babadan	-7.810188	111.487206	t
2596	161	Badegan	-7.900970	111.320274	t
2597	161	Balong	-7.955069	111.459099	t
2598	161	Bungkal	-8.009686	111.461197	t
2599	161	Jambon	-7.918934	111.367966	t
2600	161	Jenangan	-7.828111	111.534904	t
2601	161	Jetis	-7.938487	111.481247	t
2602	161	Kauman	-7.895890	111.415665	t
2603	161	Mlarak	-7.915430	111.528946	t
2604	161	Ngebel	-7.801307	111.654144	t
2605	161	Ngrayun	-8.088888	111.451439	t
2606	161	Ponorogo	-7.866688	111.466614	t
2607	161	Pudak	-7.858783	111.725693	t
2608	161	Pulung	-7.876488	111.611801	t
2609	161	Sambit	-7.993261	111.511055	t
2610	161	Sampung	-7.817747	111.344124	t
2611	161	Sawoo	-7.989372	111.582603	t
2612	161	Siman	-7.890788	111.511055	t
2613	161	Slahung	-8.035203	111.413803	t
2614	161	Sooko	-7.924026	111.654144	t
2615	161	Sukorejo	-7.834443	111.415665	t
2616	162	Bantaran	-7.873645	113.185844	t
2617	162	Banyuanyar	-7.856582	113.304947	t
2618	162	Besuk	-7.785494	113.483566	t
2619	162	Dringu	-7.788511	113.257309	t
2620	162	Gading	-7.845814	113.433601	t
2621	162	Gending	-7.793326	113.306801	t
2622	162	Kotaanyar	-7.755742	113.560944	t
2623	162	Kraksaan	-7.762488	113.417198	t
2624	162	Krejengan	-7.804468	113.418076	t
2625	162	Krucil	-7.931055	113.501419	t
2626	162	Kuripan	-7.900719	113.156067	t
2627	162	Leces	-7.851309	113.221581	t
2628	162	Lumbang	-7.834586	113.072678	t
2629	162	Maron	-7.828854	113.346626	t
2630	162	Paiton	-7.719529	113.489517	t
2631	162	Pakuniran	-7.816316	113.560944	t
2632	162	Pejarakan	-7.771516	113.376404	t
2633	162	Sukapura	-7.929321	113.013115	t
2634	162	Sumber	-7.926952	113.118797	t
2635	162	Sumberasih	-7.764320	113.150108	t
2636	162	Tegalsiwalan	-7.868791	113.269218	t
2637	162	Tiris	-7.947540	113.394264	t
2638	162	Tongas	-7.763003	113.084595	t
2639	162	Wonomerto	-7.839910	113.156067	t
2640	163	Banyuates	-6.944011	113.167976	t
2641	163	Camplong	-7.184656	113.346626	t
2642	163	Jrengik	-7.135937	113.132240	t
2643	163	Karangpenang	-7.023384	113.370445	t
2644	163	Kedungdung	-7.065545	113.233490	t
2645	163	Ketapang	-6.893421	113.285202	t
2646	163	Omben	-7.122769	113.330597	t
2647	163	Pangarengan	-7.195630	113.161987	t
2648	163	Robatal	-7.007145	113.298996	t
2649	163	Sampang	-7.193902	113.246704	t
2650	163	Sokobanah	-6.941070	113.418076	t
2651	163	Sreseh	-7.198616	113.084595	t
2652	163	Tambelangan	-7.034577	113.156067	t
2653	163	Torjun	-7.146878	113.209671	t
2654	164	Balongbendo	-7.409454	112.549835	t
2655	164	Buduran	-7.432460	112.756927	t
2656	164	Candi	-7.484229	112.733086	t
2657	164	Gedangan	-7.393381	112.733086	t
2658	164	Jabon	-7.559056	112.750969	t
2659	164	Krembung	-7.519709	112.637741	t
2660	164	Krian	-7.401006	112.590065	t
2661	164	Porong	-7.526590	112.697334	t
2662	164	Prambon	-7.466990	112.584106	t
2663	164	Sedati	-7.394913	112.798637	t
2664	164	Sidoarjo	-7.449772	112.701546	t
2665	164	Sukodono	-7.394667	112.673782	t
2666	164	Taman	-7.366297	112.673500	t
2667	164	Tanggulangin	-7.514540	112.733086	t
2668	164	Tarik	-7.450594	112.512589	t
2669	164	Tulangan	-7.478629	112.649658	t
2670	164	Waru	-7.351144	112.768845	t
2671	164	Wonoayu	-7.424027	112.631783	t
2672	165	Arjasa	-7.844189	114.108261	t
2673	165	Asembagus	-7.888023	114.215271	t
2674	165	Banyuglugur	-7.751572	113.632370	t
2675	165	Banyuputih	-7.857708	114.381683	t
2676	165	Besuki	-7.736798	113.689003	t
2677	165	Bungatan	-7.740394	113.822777	t
2678	165	Jangkar	-7.801060	114.155823	t
2679	165	Jatibanteng	-7.830900	113.656174	t
2680	165	Kapongan	-7.704793	114.084480	t
2681	165	Kendit	-7.736182	113.894165	t
2682	165	Mangaran	-7.627247	114.036903	t
2683	165	Mlandingan	-7.787493	113.793030	t
2684	165	Panarukan	-7.691727	113.965546	t
2685	165	Panji	-7.707615	114.036903	t
2686	165	Situbondo	-7.705053	113.995277	t
2687	165	Suboh	-7.760763	113.733536	t
2688	165	Sumbermalang	-7.890087	113.679977	t
2689	166	Ambunten	-6.893464	113.743217	t
2690	166	Arjasa	-6.907987	115.307465	t
2691	166	Batang Batang	-6.949498	114.013123	t
2692	166	Batu Putih	-7.009557	113.858299	t
2693	166	Batuan	-7.023377	113.840630	t
2694	166	Bluto	-7.113049	113.802597	t
2695	166	Dasuk	-6.919870	113.822777	t
2696	166	Dungkek	-6.965533	114.084480	t
2697	166	Ganding	-7.065588	113.703781	t
2698	166	Gapura	-6.991799	113.965546	t
2699	166	Gayam	-7.130044	114.346031	t
2700	166	Gili Ginting	-7.195000	113.916115	t
2701	166	Guluk-Guluk	-7.049458	113.632370	t
2702	166	Kalianget	-7.050687	113.888214	t
2703	166	Kangayan	-6.889440	115.461510	t
2704	166	Kota Sumenep	-7.009557	113.858299	t
2705	166	Lenteng	-7.041825	113.775185	t
2706	166	Manding	-6.957115	113.870369	t
2707	166	Masalembu	-5.557714	114.417336	t
2708	166	Nonggunong	-7.071746	114.322258	t
2709	166	Pasongsongan	-6.948548	113.656174	t
2710	166	Pragaan	-7.088091	113.656174	t
2711	166	Ra"as	-7.151140	114.589600	t
2712	166	Rubaru	-6.963431	113.751381	t
2713	166	Sapeken	-7.165183	115.793022	t
2714	166	Saronggi	-7.097771	113.846573	t
2715	166	Talango	-7.088715	114.013123	t
2716	167	Bendungan	-7.962381	111.701843	t
2717	167	Dongko	-8.206966	111.546829	t
2718	167	Durenan	-8.100568	111.797241	t
2719	167	Gandusari	-8.126404	111.701843	t
2720	167	Kampak	-8.211244	111.654144	t
2721	167	Karangan	-8.086682	111.677994	t
2722	167	Munjungan	-8.286608	111.594528	t
2723	167	Panggul	-8.212277	111.451439	t
2724	167	Pogalan	-8.082715	111.749542	t
2725	167	Pule	-8.135667	111.534904	t
2726	167	Suruh	-8.111168	111.606453	t
2727	167	Trenggalek	-8.086410	111.713127	t
2728	167	Tugu	-8.045471	111.655518	t
2729	167	Watulimo	-8.270249	111.701843	t
2730	168	Bancar	-6.813895	111.737617	t
2731	168	Bangilan	-6.966610	111.701843	t
2732	168	Grabagan	-7.013212	111.988022	t
2733	168	Jatirogo	-6.858623	111.642227	t
2734	168	Jenu	-6.793163	111.964172	t
2735	168	Kenduruan	-6.939214	111.642227	t
2736	168	Kerek	-6.889840	111.833008	t
2737	168	Merakurak	-6.873513	111.964172	t
2738	168	Montong	-6.968076	111.880707	t
2739	168	Palang	-6.944683	112.154945	t
2740	168	Parengan	-7.051026	111.833008	t
2741	168	Plumpang	-7.036972	112.119179	t
2742	168	Rengel	-7.073672	111.988022	t
2743	168	Semanding	-6.921715	112.054703	t
2744	168	Senori	-7.055672	111.737617	t
2745	168	Singgahan	-6.983333	111.773392	t
2746	168	Soko	-7.096196	111.940323	t
2747	168	Tambakboyo	-6.818891	111.844933	t
2748	168	Tuban	-6.894910	112.041672	t
2749	168	Widang	-7.023959	112.178787	t
2750	169	Bandung	-8.163461	111.773392	t
2751	169	Besuki	-8.221941	111.789124	t
2752	169	Boyolangu	-8.119536	111.894279	t
2753	169	Campurdarat	-8.166630	111.853874	t
2754	169	Gondang	-8.077406	111.844933	t
2755	169	Kalidawir	-8.195081	111.940323	t
2756	169	Karangrejo	-7.997623	111.898590	t
2757	169	Kauman	-8.040554	111.862823	t
2758	169	Kedungwaru	-8.047475	111.922440	t
2759	169	Ngantru	-8.015440	111.946289	t
2760	169	Ngunut	-8.110365	111.988022	t
2761	169	Pagerwojo	-7.988522	111.785316	t
2762	169	Pakel	-8.155314	111.827049	t
2763	169	Pucanglaban	-8.288156	112.017830	t
2764	169	Rejotangan	-8.147294	112.059563	t
2765	169	Sendang	-7.935395	111.821091	t
2766	169	Sumbergempol	-8.096678	111.958214	t
2767	169	Tanggunggunung	-8.231661	111.883690	t
2768	169	Tulungagung	-8.091221	111.964172	t
2769	170	Batu	-7.883065	112.533447	t
2770	170	Bumiaji	-7.793919	112.536430	t
2771	170	Junrejo	-7.910549	112.542389	t
2772	171	Kepanjenkidul	-8.076716	112.175812	t
2773	171	Sananwetan	-8.094108	112.184753	t
2774	171	Sukorejo	-8.105347	112.144508	t
2775	172	Kota	-7.848016	112.017830	t
2776	172	Mojoroto	-7.803741	111.988022	t
2777	172	Pesantren	-7.846057	112.053596	t
2778	173	Kartoharjo	-7.618453	111.540871	t
2779	173	Manguharjo	-7.631703	111.506584	t
2780	173	Taman	-7.649667	111.528946	t
2781	174	Blimbing	-7.955345	112.649658	t
2782	174	Kedungkandang	-8.011014	112.655624	t
2783	174	Klojen	-7.977074	112.625824	t
2784	174	Lowokwaru	-7.937027	112.613907	t
2785	174	Sukun	-7.998130	112.613907	t
2786	175	Magersari	-7.466569	112.450005	t
2787	175	Prajurit Kulon	-7.473214	112.420204	t
2788	176	Bugul Kidul	-7.652495	112.913330	t
2789	176	Gadingrejo	-7.637467	112.888008	t
2790	176	Panggungrejo	-7.638503	112.914818	t
2791	176	Purworejo	-7.664792	112.896942	t
2792	177	Kademangan	-7.772390	113.185844	t
2793	177	Kanigaran	-7.760907	113.209671	t
2794	177	Kedopak	-7.791943	113.197762	t
2795	177	Mayangan	-7.747412	113.224556	t
2796	177	Wonoasih	-7.797988	113.224556	t
2797	178	Asem Rowo	-7.246179	112.706276	t
2798	178	Benowo	-7.226488	112.649658	t
2799	178	Bubutan	-7.249962	112.730110	t
2800	178	Bulak	-7.236774	112.789696	t
2801	178	Dukuhpakis	-7.296838	112.700317	t
2802	178	Gayungan	-7.330843	112.724152	t
2803	178	Genteng	-7.259088	112.747986	t
2804	178	Gubeng	-7.278906	112.753944	t
2805	178	Gunung Anyar	-7.339163	112.804596	t
2806	178	Jambangan	-7.321082	112.718193	t
2807	178	Karangpilang	-7.337777	112.688400	t
2808	178	Kenjeran	-7.220266	112.768845	t
2809	178	Krembangan	-7.230149	112.724152	t
2810	178	Lakarsantri	-7.316514	112.661583	t
2811	178	Mulyorejo	-7.269315	112.792679	t
2812	178	Pabean Cantikan	-7.214747	112.730110	t
2813	178	Pakal	-7.228349	112.613907	t
2814	178	Rungkut	-7.319019	112.804596	t
2815	178	Sambikerep	-7.276835	112.649658	t
2816	178	Sawahan	-7.263013	112.721169	t
2817	178	Semampir	-7.211455	112.745010	t
2818	178	Simokerto	-7.238650	112.753944	t
2819	178	Sukolilo	-7.288184	112.816505	t
2820	178	Sukomanunggal	-7.262928	112.698822	t
2821	178	Tambaksari	-7.250445	112.768845	t
2822	178	Tandes	-7.255445	112.673500	t
2823	178	Tegalsari	-7.279848	112.736069	t
2824	178	Tenggilis Mejoyo	-7.324226	112.753944	t
2825	178	Wiyung	-7.315257	112.685417	t
2826	178	Wonocolo	-7.319820	112.742027	t
2827	178	Wonokromo	-7.302664	112.733086	t
2828	179	Bengkayang	\N	\N	t
2829	179	Capkala	\N	\N	t
2830	179	Jagoi Babang	\N	\N	t
2831	179	Ledo	\N	\N	t
2832	179	Lembah Bawang	\N	\N	t
2833	179	Lumar	\N	\N	t
2834	179	Monterado	\N	\N	t
2835	179	Samalantan	\N	\N	t
2836	179	Sanggau Ledo	\N	\N	t
2837	179	Seluas	\N	\N	t
2838	179	Siding	\N	\N	t
2839	179	Sungai Betung	\N	\N	t
2840	179	Sungai Raya	\N	\N	t
2841	179	Sungai Raya Kepulauan	\N	\N	t
2842	179	Suti Semarang	\N	\N	t
2843	179	Teriak	\N	\N	t
2844	179	Tujuh Belas	\N	\N	t
2845	180	Badau	\N	\N	t
2846	180	Batang Lupar	\N	\N	t
2847	180	Bika	\N	\N	t
2848	180	Boyan Tanjung	\N	\N	t
2849	180	Bunut Hilir	\N	\N	t
2850	180	Bunut Hulu	\N	\N	t
2851	180	Embaloh Hilir	\N	\N	t
2852	180	Embaloh Hulu	\N	\N	t
2853	180	Empanang	\N	\N	t
2854	180	Hulu Gurung	\N	\N	t
2855	180	Jongkong	\N	\N	t
2856	180	Kalis	\N	\N	t
2857	180	Mentebah	\N	\N	t
2858	180	Pengkadan	\N	\N	t
2859	180	Puring Kencana	\N	\N	t
2860	180	Putussibau Selatan	\N	\N	t
2861	180	Putussibau Utara	\N	\N	t
2862	180	Seberuang	\N	\N	t
2863	180	Selimbau	\N	\N	t
2864	180	Semitau	\N	\N	t
2865	180	Silat Hilir	\N	\N	t
2866	180	Silat Hulu	\N	\N	t
2867	180	Suhaid	\N	\N	t
2868	181	Kepulauan Karimata	\N	\N	t
2869	181	Pulau Maya	\N	\N	t
2870	181	Seponti	\N	\N	t
2871	181	Simpang Hilir	\N	\N	t
2872	181	Sukadana	\N	\N	t
2873	181	Teluk Batang	\N	\N	t
2874	182	Air Upas	\N	\N	t
2875	182	Benua Kayong	\N	\N	t
2876	182	Delta Pawan	\N	\N	t
2877	182	Hulu Sungai	\N	\N	t
2878	182	Jelai Hulu	\N	\N	t
2879	182	Kendawangan	\N	\N	t
2880	182	Manis Mata	\N	\N	t
2881	182	Marau	\N	\N	t
2882	182	Matan Hilir Selatan	\N	\N	t
2883	182	Matan Hilir Utara	\N	\N	t
2884	182	Muara Pawan	\N	\N	t
2885	182	Nanga Tayap	\N	\N	t
2886	182	Pemahan	\N	\N	t
2887	182	Sandai	\N	\N	t
2888	182	Simpang Dua	\N	\N	t
2889	182	Simpang Hulu	\N	\N	t
2890	182	Singkup	\N	\N	t
2891	182	Sungai Laur	\N	\N	t
2892	182	Sungai Melayu Rayak	\N	\N	t
2893	182	Tumbang Titi	\N	\N	t
2894	183	Batu Ampar	\N	\N	t
2895	183	Kuala Mandor B	\N	\N	t
2896	183	Kubu	\N	\N	t
2897	183	Rasau Jaya	\N	\N	t
2898	183	Sungai Ambawang	\N	\N	t
2899	183	Sungai Kakap	\N	\N	t
2900	183	Sungai Raya	\N	\N	t
2901	183	Teluk Pakedai	\N	\N	t
2902	183	Terentang	\N	\N	t
2903	184	Air Besar	\N	\N	t
2904	184	Banyuke Hulu	\N	\N	t
2905	184	Jelimpo	\N	\N	t
2906	184	Kuala Behe	\N	\N	t
2907	184	Mandor	\N	\N	t
2908	184	Mempawah Hulu	\N	\N	t
2909	184	Menjalin	\N	\N	t
2910	184	Menyuke	\N	\N	t
2911	184	Meranti	\N	\N	t
2912	184	Ngabang	\N	\N	t
2913	184	Sebangki	\N	\N	t
2914	184	Sengah Temila	\N	\N	t
2915	184	Sompak	\N	\N	t
2916	185	Belimbing	\N	\N	t
2917	185	Belimbing Hulu	\N	\N	t
2918	185	Ella Hilir	\N	\N	t
2919	185	Menukung	\N	\N	t
2920	185	Nanga Pinoh	\N	\N	t
2921	185	Pinoh Selatan	\N	\N	t
2922	185	Pinoh Utara	\N	\N	t
2923	185	Sayan	\N	\N	t
2924	185	Sokan	\N	\N	t
2925	185	Tanah Pinoh	\N	\N	t
2926	185	Tanah Pinoh Barat	\N	\N	t
2927	186	Anjongan	\N	\N	t
2928	186	Mempawah Hilir	\N	\N	t
2929	186	Mempawah Timur	\N	\N	t
2930	186	Sadaniang	\N	\N	t
2931	186	Segedong	\N	\N	t
2932	186	Siantan	\N	\N	t
2933	186	Sungai Kunyit	\N	\N	t
2934	186	Sungai Pinyuh	\N	\N	t
2935	186	Toho	\N	\N	t
2936	187	Galing	\N	\N	t
2937	187	Jawai	\N	\N	t
2938	187	Jawai Selatan	\N	\N	t
2939	187	Paloh	\N	\N	t
2940	187	Pemangkat	\N	\N	t
2941	187	Sajad	\N	\N	t
2942	187	Sajingan Besar	\N	\N	t
2943	187	Salatiga	\N	\N	t
2944	187	Sambas	\N	\N	t
2945	187	Sebawi	\N	\N	t
2946	187	Sejangkung	\N	\N	t
2947	187	Selakau	\N	\N	t
2948	187	Selakau Timur	\N	\N	t
2949	187	Semparuk	\N	\N	t
2950	187	Subah	\N	\N	t
2951	187	Tangaran	\N	\N	t
2952	187	Tebas	\N	\N	t
2953	187	Tekarang	\N	\N	t
2954	187	Teluk Keramat	\N	\N	t
2955	188	Balai	\N	\N	t
2956	188	Beduai	\N	\N	t
2957	188	Bonti	\N	\N	t
2958	188	Entikong	\N	\N	t
2959	188	Jangkang	\N	\N	t
2960	188	Kapuas	\N	\N	t
2961	188	Kembayan	\N	\N	t
2962	188	Meliau	\N	\N	t
2963	188	Mukok	\N	\N	t
2964	188	Noyan	\N	\N	t
2965	188	Parindu	\N	\N	t
2966	188	Sekayam	\N	\N	t
2967	188	Tayan Hilir	\N	\N	t
2968	188	Tayan Hulu	\N	\N	t
2969	188	Toba	\N	\N	t
2970	189	Belitang	\N	\N	t
2971	189	Belitang Hilir	\N	\N	t
2972	189	Belitang Hulu	\N	\N	t
2973	189	Nanga Mahap	\N	\N	t
2974	189	Nanga Taman	\N	\N	t
2975	189	Sekadau Hilir	\N	\N	t
2976	189	Sekadau Hulu	\N	\N	t
2977	190	Ambalau	\N	\N	t
2978	190	Binjai Hulu	\N	\N	t
2979	190	Dedai	\N	\N	t
2980	190	Kayan Hilir	\N	\N	t
2981	190	Kayan Hulu	\N	\N	t
2982	190	Kelam Permai	\N	\N	t
2983	190	Ketungau Hilir	\N	\N	t
2984	190	Ketungau Hulu	\N	\N	t
2985	190	Ketungau Tengah	\N	\N	t
2986	190	Sepauk	\N	\N	t
2987	190	Serawai	\N	\N	t
2988	190	Sintang	\N	\N	t
2989	190	Sungai Tebelian	\N	\N	t
2990	190	Tempunak	\N	\N	t
2991	191	Pontianak Barat	\N	\N	t
2992	191	Pontianak Kota	\N	\N	t
2993	191	Pontianak Selatan	\N	\N	t
2994	191	Pontianak Tenggara	\N	\N	t
2995	191	Pontianak Timur	\N	\N	t
2996	191	Pontianak Utara	\N	\N	t
2997	192	Singkawang Barat	\N	\N	t
2998	192	Singkawang Selatan	\N	\N	t
2999	192	Singkawang Tengah	\N	\N	t
3000	192	Singkawang Timur	\N	\N	t
3001	192	Singkawang Utara	\N	\N	t
3002	193	Awayan	\N	\N	t
3003	193	Batu Mandi	\N	\N	t
3004	193	Halong	\N	\N	t
3005	193	Juai	\N	\N	t
3006	193	Lampihong	\N	\N	t
3007	193	Paringin	\N	\N	t
3008	193	Paringin Selatan	\N	\N	t
3009	193	Tebing Tinggi	\N	\N	t
3010	194	Aluh Aluh	\N	\N	t
3011	194	Aranio	\N	\N	t
3012	194	Astambul	\N	\N	t
3013	194	Beruntung Baru	\N	\N	t
3014	194	Gambut	\N	\N	t
3015	194	Karang Intan	\N	\N	t
3016	194	Kertak Hanyar	\N	\N	t
3017	194	Martapura	\N	\N	t
3018	194	Martapura Barat	\N	\N	t
3019	194	Martapura Timur	\N	\N	t
3020	194	Mataraman	\N	\N	t
3021	194	Paramasan	\N	\N	t
3022	194	Pengarom	\N	\N	t
3023	194	Sambung Makmur	\N	\N	t
3024	194	Simpang Empat	\N	\N	t
3025	194	Sungai Pinang	\N	\N	t
3026	194	Sungai Tabuk	\N	\N	t
3027	194	Tatah Makmur	\N	\N	t
3028	194	Telaga Bauntung	\N	\N	t
3029	195	Alalak	\N	\N	t
3030	195	Anjir Muara	\N	\N	t
3031	195	Anjir Pasar	\N	\N	t
3032	195	Bakumpai	\N	\N	t
3033	195	Barambai	\N	\N	t
3034	195	Belawang	\N	\N	t
3035	195	Cerbon	\N	\N	t
3036	195	Jejangkit	\N	\N	t
3037	195	Kuripan	\N	\N	t
3038	195	Mandastana	\N	\N	t
3039	195	Marabahan	\N	\N	t
3040	195	Mekarsari	\N	\N	t
3041	195	Rantau Badauh	\N	\N	t
3042	195	Tabukan	\N	\N	t
3043	195	Tabunganen	\N	\N	t
3044	195	Tamban	\N	\N	t
3045	195	Wanaraya	\N	\N	t
3046	196	Angkinang	\N	\N	t
3047	196	Daha Barat	\N	\N	t
3048	196	Daha Selatan	\N	\N	t
3049	196	Daha Utara	\N	\N	t
3050	196	Kalumpang	\N	\N	t
3051	196	Kandangan	\N	\N	t
3052	196	Loksado	\N	\N	t
3053	196	Padang Batung	\N	\N	t
3054	196	Simpur	\N	\N	t
3055	196	Sungai Raya	\N	\N	t
3056	196	Telaga Langsat	\N	\N	t
3057	197	Barabai	\N	\N	t
3058	197	Batang Alai Selatan	\N	\N	t
3059	197	Batang Alai Timur	\N	\N	t
3060	197	Batang Alai Utara	\N	\N	t
3061	197	Batu Benawa	\N	\N	t
3062	197	Hantakan	\N	\N	t
3063	197	Haruyan	\N	\N	t
3064	197	Labuan Amas Selatan	\N	\N	t
3065	197	Labuan Amas Utara	\N	\N	t
3066	197	Limpasu	\N	\N	t
3067	197	Pandawan	\N	\N	t
3068	198	Amuntai Selatan	\N	\N	t
3069	198	Amuntai Tengah	\N	\N	t
3070	198	Amuntai Utara	\N	\N	t
3071	198	Babirik	\N	\N	t
3072	198	Banjang	\N	\N	t
3073	198	Danau Panggang	\N	\N	t
3074	198	Haur Gading	\N	\N	t
3075	198	Paminggir	\N	\N	t
3076	198	Sungai Pandan	\N	\N	t
3077	198	Sungai Tabukan	\N	\N	t
3078	199	Hampang	\N	\N	t
3079	199	Kelumpang Barat	\N	\N	t
3080	199	Kelumpang Hilir	\N	\N	t
3081	199	Kelumpang Hulu	\N	\N	t
3082	199	Kelumpang Selatan	\N	\N	t
3083	199	Kelumpang Tengah	\N	\N	t
3084	199	Kelumpang Utara	\N	\N	t
3085	199	Pamukan Barat	\N	\N	t
3086	199	Pamukan Selatan	\N	\N	t
3087	199	Pamukan Utara	\N	\N	t
3088	199	Pulaulaut Barat	\N	\N	t
3089	199	Pulaulaut Kepulauan	\N	\N	t
3090	199	Pulaulaut Selatan	\N	\N	t
3091	199	Pulaulaut Tanjung Selayar	\N	\N	t
3092	199	Pulaulaut Tengah	\N	\N	t
3093	199	Pulaulaut Timur	\N	\N	t
3094	199	Pulaulaut Utara	\N	\N	t
3095	199	Pulausebuku	\N	\N	t
3096	199	Pulausembilan	\N	\N	t
3097	199	Sampanahan	\N	\N	t
3098	199	Sungaidurian	\N	\N	t
3099	200	Banua Lawas	\N	\N	t
3100	200	Bintang Ara	\N	\N	t
3101	200	Haruai	\N	\N	t
3102	200	Jaro	\N	\N	t
3103	200	Kelua	\N	\N	t
3104	200	Muara Harus	\N	\N	t
3105	200	Muara Uya	\N	\N	t
3106	200	Murung Pudak	\N	\N	t
3107	200	Pugaan	\N	\N	t
3108	200	Tanjung	\N	\N	t
3109	200	Tanta	\N	\N	t
3110	200	Upau	\N	\N	t
3111	201	Angsana	\N	\N	t
3112	201	Batu Licin	\N	\N	t
3113	201	Karang Bintang	\N	\N	t
3114	201	Kuranji	\N	\N	t
3115	201	Kusan Hilir	\N	\N	t
3116	201	Kusan Hulu	\N	\N	t
3117	201	Mantewe	\N	\N	t
3118	201	Satui	\N	\N	t
3119	201	Simpang Empat	\N	\N	t
3120	201	Sungai Loban	\N	\N	t
3121	202	Bajuin	\N	\N	t
3122	202	Bati Bati	\N	\N	t
3123	202	Batu Ampar	\N	\N	t
3124	202	Bumi Makmur	\N	\N	t
3125	202	Jorong	\N	\N	t
3126	202	Kintap	\N	\N	t
3127	202	Kurau	\N	\N	t
3128	202	Panyipatan	\N	\N	t
3129	202	Pelaihari	\N	\N	t
3130	202	Takisung	\N	\N	t
3131	202	Tambang Ulang	\N	\N	t
3132	203	Bakarangan	\N	\N	t
3133	203	Binuang	\N	\N	t
3134	203	Bungur	\N	\N	t
3135	203	Candi Laras Selatan	\N	\N	t
3136	203	Candi Laras Utara	\N	\N	t
3137	203	Hatungun	\N	\N	t
3138	203	Lokpaikat	\N	\N	t
3139	203	Piani	\N	\N	t
3140	203	Salam Babaris	\N	\N	t
3141	203	Tapin Selatan	\N	\N	t
3142	203	Tapin Tengah	\N	\N	t
3143	203	Tapin Utara	\N	\N	t
3144	204	Banjarbaru Selatan	\N	\N	t
3145	204	Banjarbaru Utara	\N	\N	t
3146	204	Cempaka	\N	\N	t
3147	204	Landasan Ulin	\N	\N	t
3148	204	Liang Anggang	\N	\N	t
3149	205	Banjarmasin Barat	\N	\N	t
3150	205	Banjarmasin Selatan	\N	\N	t
3151	205	Banjarmasin Tengah	\N	\N	t
3152	205	Banjarmasin Timur	\N	\N	t
3153	205	Banjarmasin Utara	\N	\N	t
3154	206	Dusun Hilir	\N	\N	t
3155	206	Dusun Selatan	\N	\N	t
3156	206	Dusun Utara	\N	\N	t
3157	206	Gn. Bintang Awai	\N	\N	t
3158	206	Jenamas	\N	\N	t
3159	206	Karau Kuala	\N	\N	t
3160	207	Awang	\N	\N	t
3161	207	Banua Lima	\N	\N	t
3162	207	Dusun Tengah	\N	\N	t
3163	207	Dusun Timur	\N	\N	t
3164	207	Karusen Janang	\N	\N	t
3165	207	Paju Epat	\N	\N	t
3166	207	Paku	\N	\N	t
3167	207	Patangkep Tutui	\N	\N	t
3168	207	Pematang Karau	\N	\N	t
3169	207	Raren Batuah	\N	\N	t
3170	208	Gunung Purei	\N	\N	t
3171	208	Gunung Timang	\N	\N	t
3172	208	Lahei	\N	\N	t
3173	208	Lahei Barat	\N	\N	t
3174	208	Montallat	\N	\N	t
3175	208	Teweh Baru	\N	\N	t
3176	208	Teweh Selatan	\N	\N	t
3177	208	Teweh Tengah	\N	\N	t
3178	208	Teweh Timur	\N	\N	t
3179	209	Damang Batu	\N	\N	t
3180	209	Kahayan Hulu Utara	\N	\N	t
3181	209	Kurun	\N	\N	t
3182	209	Mahuning Raya	\N	\N	t
3183	209	Manuhing	\N	\N	t
3184	209	Mihing Raya	\N	\N	t
3185	209	Miri Manasa	\N	\N	t
3186	209	Rungan	\N	\N	t
3187	209	Rungan Barat	\N	\N	t
3188	209	Rungan Hulu	\N	\N	t
3189	209	Sepang Simin	\N	\N	t
3190	209	Tewah	\N	\N	t
3191	210	Basarang	\N	\N	t
3192	210	Bataguh	\N	\N	t
3193	210	Dadahup	\N	\N	t
3194	210	Kapuas Barat	\N	\N	t
3195	210	Kapuas Hilir	\N	\N	t
3196	210	Kapuas Hulu	\N	\N	t
3197	210	Kapuas Kuala	\N	\N	t
3198	210	Kapuas Murung	\N	\N	t
3199	210	Kapuas Tengah	\N	\N	t
3200	210	Kapuas Timur	\N	\N	t
3201	210	Mandau Talawang	\N	\N	t
3202	210	Mantangai	\N	\N	t
3203	210	Pasak Talawang	\N	\N	t
3204	210	Pulau Petak	\N	\N	t
3205	210	Selat	\N	\N	t
3206	210	Tamban Catur	\N	\N	t
3207	210	Timpah	\N	\N	t
3208	211	Bukit Raya	\N	\N	t
3209	211	Kampiang	\N	\N	t
3210	211	Katingan Hilir	\N	\N	t
3211	211	Katingan Hulu	\N	\N	t
3212	211	Katingan Kuala	\N	\N	t
3213	211	Katingan Tengah	\N	\N	t
3214	211	Marikit	\N	\N	t
3215	211	Mendawai	\N	\N	t
3216	211	Petak Malai	\N	\N	t
3217	211	Pulau Malan	\N	\N	t
3218	211	Sanaman Mantikei	\N	\N	t
3219	211	Tasik Payawan	\N	\N	t
3220	211	Tewang Sangalang Garing	\N	\N	t
3221	212	Arut Selatan	\N	\N	t
3222	212	Arut Utara	\N	\N	t
3223	212	Kotawaringin Lama	\N	\N	t
3224	212	Kumai	\N	\N	t
3225	212	Pangkalan Banteng	\N	\N	t
3226	212	Pangkalan Lada	\N	\N	t
3227	213	Antang Kalang	\N	\N	t
3228	213	Baamang	\N	\N	t
3229	213	Bukit Santuai	\N	\N	t
3230	213	Cempaga	\N	\N	t
3231	213	Cempaga Hulu	\N	\N	t
3232	213	Kota Besi	\N	\N	t
3233	213	Mentawa Baru Ketapang	\N	\N	t
3234	213	Mentaya Hilir Selatan	\N	\N	t
3235	213	Mentaya Hilir Utara	\N	\N	t
3236	213	Mentaya Hulu	\N	\N	t
3237	213	Parenggean	\N	\N	t
3238	213	Pulau Hanaut	\N	\N	t
3239	213	Seranau	\N	\N	t
3240	213	Telaga Antang	\N	\N	t
3241	213	Telawang	\N	\N	t
3242	213	Teluk Sampit	\N	\N	t
3243	213	Tualan Hulu	\N	\N	t
3244	214	Batang Kawa	\N	\N	t
3245	214	Belantikan Raya	\N	\N	t
3246	214	Bulik	\N	\N	t
3247	214	Bulik Timur	\N	\N	t
3248	214	Delang	\N	\N	t
3249	214	Lamandau	\N	\N	t
3250	214	Menthobi Raya	\N	\N	t
3251	214	Sematu Jaya	\N	\N	t
3252	215	Barito Tuhup Raya	\N	\N	t
3253	215	Laung Tuhup	\N	\N	t
3254	215	Murung	\N	\N	t
3255	215	Permata Intan	\N	\N	t
3256	215	Seribu Riam	\N	\N	t
3257	215	Sumber Barito	\N	\N	t
3258	215	Sungai Babuat	\N	\N	t
3259	215	Tanah Siang	\N	\N	t
3260	215	Tanah Siang Selatan	\N	\N	t
3261	215	Uut Murung	\N	\N	t
3262	216	Banama Tingang	\N	\N	t
3263	216	Jabiren	\N	\N	t
3264	216	Kahayan Hilir	\N	\N	t
3265	216	Kahayan Kuala	\N	\N	t
3266	216	Kahayan Tengah	\N	\N	t
3267	216	Maliku	\N	\N	t
3268	216	Pandih Batu	\N	\N	t
3269	216	Sebangau Kuala	\N	\N	t
3270	217	Batu Ampar	\N	\N	t
3271	217	Danau Seluluk	\N	\N	t
3272	217	Danau Sembuluh	\N	\N	t
3273	217	Hanau	\N	\N	t
3274	217	Seruyan Hilir	\N	\N	t
3275	217	Seruyan Hilir Timur	\N	\N	t
3276	217	Seruyan Hulu	\N	\N	t
3277	217	Seruyan Raya	\N	\N	t
3278	217	Seruyan Tengah	\N	\N	t
3279	217	Suling Tambun	\N	\N	t
3280	218	Balai Riam	\N	\N	t
3281	218	Jelai	\N	\N	t
3282	218	Pantai Lunci	\N	\N	t
3283	218	Permata Kecubung	\N	\N	t
3284	218	Sukamara	\N	\N	t
3285	219	Bukit Batu	\N	\N	t
3286	219	Jekan Raya	\N	\N	t
3287	219	Pahandut	\N	\N	t
3288	219	Rakumpit	\N	\N	t
3289	219	Sabangau	\N	\N	t
3290	220	Batu Putih	\N	\N	t
3291	220	Biatan	\N	\N	t
3292	220	Biduk-Biduk	\N	\N	t
3293	220	Gunung Tabur	\N	\N	t
3294	220	Kelay	\N	\N	t
3295	220	Maratua	\N	\N	t
3296	220	Pulau Derawan	\N	\N	t
3297	220	Sambaliung	\N	\N	t
3298	220	Segah	\N	\N	t
3299	220	Tabalar	\N	\N	t
3300	220	Talisayan	\N	\N	t
3301	220	Tanjung Redeb	\N	\N	t
3302	220	Teluk Bayur	\N	\N	t
3303	221	Barong Tongkok	\N	\N	t
3304	221	Bentian Besar	\N	\N	t
3305	221	Bongan	\N	\N	t
3306	221	Damai	\N	\N	t
3307	221	Jempang	\N	\N	t
3308	221	Linggang Bigung	\N	\N	t
3309	221	Long Iram	\N	\N	t
3310	221	Melak	\N	\N	t
3311	221	Mook Manaar Bulatn	\N	\N	t
3312	221	Muara Lawa	\N	\N	t
3313	221	Muara Pahu	\N	\N	t
3314	221	Nyuatan	\N	\N	t
3315	221	Penyinggahan	\N	\N	t
3316	221	Sekolaq Darat	\N	\N	t
3317	221	Siluq Ngurai	\N	\N	t
3318	221	Tering	\N	\N	t
3319	222	Anggana	\N	\N	t
3320	222	Kembang Janggut	\N	\N	t
3321	222	Kenohan	\N	\N	t
3322	222	Kota Bangun	\N	\N	t
3323	222	Loa Janan	\N	\N	t
3324	222	Loa Kulu	\N	\N	t
3325	222	Marang Kayu	\N	\N	t
3326	222	Muara Badak	\N	\N	t
3327	222	Muara Jawa	\N	\N	t
3328	222	Muara Kaman	\N	\N	t
3329	222	Muara Muntai	\N	\N	t
3330	222	Muara Wis	\N	\N	t
3331	222	Samboja	\N	\N	t
3332	222	Sanga Sanga	\N	\N	t
3333	222	Sebulu	\N	\N	t
3334	222	Tabang	\N	\N	t
3335	222	Tenggarong	\N	\N	t
3336	222	Tenggarong Seberang	\N	\N	t
3337	223	Batu Ampar	\N	\N	t
3338	223	Bengalon	\N	\N	t
3339	223	Busang	\N	\N	t
3340	223	Kaliorang	\N	\N	t
3341	223	Karangan	\N	\N	t
3342	223	Kaubun	\N	\N	t
3343	223	Kombeng	\N	\N	t
3344	223	Long Mesangat	\N	\N	t
3345	223	Muara Ancalong	\N	\N	t
3346	223	Muara Bengkal	\N	\N	t
3347	223	Muara Wahau	\N	\N	t
3348	223	Rantau Pulung	\N	\N	t
3349	223	Sandaran	\N	\N	t
3350	223	Sangatta Selatan	\N	\N	t
3351	223	Sangatta Utara	\N	\N	t
3352	223	Sangkulirang	\N	\N	t
3353	223	Telen	\N	\N	t
3354	223	Teluk Pandan	\N	\N	t
3355	224	Laham	\N	\N	t
3356	224	Long Apari	\N	\N	t
3357	224	Long Bagun	\N	\N	t
3358	224	Long Hubung	\N	\N	t
3359	224	Long Pahangai	\N	\N	t
3360	225	Batu Engau	\N	\N	t
3361	225	Batu Sopang	\N	\N	t
3362	225	Kuaro	\N	\N	t
3363	225	Long Ikis	\N	\N	t
3364	225	Long Kali	\N	\N	t
3365	225	Muara Komam	\N	\N	t
3366	225	Muara Samu	\N	\N	t
3367	225	Pasir Balengkong	\N	\N	t
3368	225	Tanah Grogot	\N	\N	t
3369	225	Tanjung Harapan	\N	\N	t
3370	226	Babulu	\N	\N	t
3371	226	Penajam	\N	\N	t
3372	226	Sepaku	\N	\N	t
3373	226	Waru	\N	\N	t
3374	227	Balikpapan Barat	\N	\N	t
3375	227	Balikpapan Kota	\N	\N	t
3376	227	Balikpapan Selatan	\N	\N	t
3377	227	Balikpapan Tengah	\N	\N	t
3378	227	Balikpapan Timur	\N	\N	t
3379	227	Balikpapan Utara	\N	\N	t
3380	228	Bontang Barat	\N	\N	t
3381	228	Bontang Selatan	\N	\N	t
3382	228	Bontang Utara	\N	\N	t
3383	229	Loa Janan Ilir	\N	\N	t
3384	229	Palaran	\N	\N	t
3385	229	Samarinda Ilir	\N	\N	t
3386	229	Samarinda Kota	\N	\N	t
3387	229	Samarinda Seberang	\N	\N	t
3388	229	Samarinda Ulu	\N	\N	t
3389	229	Samarinda Utara	\N	\N	t
3390	229	Sambutan	\N	\N	t
3391	229	Sungai Kunjang	\N	\N	t
3392	229	Sungai Pinang	\N	\N	t
3393	230	Bunyu	\N	\N	t
3394	230	Peso	\N	\N	t
3395	230	Peso Hilir	\N	\N	t
3396	230	Sekatak	\N	\N	t
3397	230	Tanjung Palas	\N	\N	t
3398	230	Tanjung Palas Barat	\N	\N	t
3399	230	Tanjung Palas Tengah	\N	\N	t
3400	230	Tanjung Palas Timur	\N	\N	t
3401	230	Tanjung Palas Utara	\N	\N	t
3402	230	Tanjung Selor	\N	\N	t
3403	231	Bahau Hulu	\N	\N	t
3404	231	Kayan Hilir	\N	\N	t
3405	231	Kayan Hulu	\N	\N	t
3406	231	Kayan Selatan	\N	\N	t
3407	231	Malinau Barat	\N	\N	t
3408	231	Malinau Kota	\N	\N	t
3409	231	Malinau Selatan	\N	\N	t
3410	231	Malinau Selatan Hilir	\N	\N	t
3411	231	Malinau Selatan Hulu	\N	\N	t
3412	231	Malinau Utara	\N	\N	t
3413	231	Mentarang	\N	\N	t
3414	231	Mentarang Hulu	\N	\N	t
3415	231	Pujungan	\N	\N	t
3416	231	Sungai Boh	\N	\N	t
3417	231	Sungai Tubu	\N	\N	t
3418	232	Krayan	\N	\N	t
3419	232	Krayan Selatan	\N	\N	t
3420	232	Lumbis	\N	\N	t
3421	232	Lumbis Ogong	\N	\N	t
3422	232	Nunukan	\N	\N	t
3423	232	Nunukan Selatan	\N	\N	t
3424	232	Sebatik	\N	\N	t
3425	232	Sebatik Barat	\N	\N	t
3426	232	Sebatik Tengah	\N	\N	t
3427	232	Sebatik Timur	\N	\N	t
3428	232	Sebatik Utara	\N	\N	t
3429	232	Sebuku	\N	\N	t
3430	232	Sei Menggaris	\N	\N	t
3431	232	Sembakung	\N	\N	t
3432	232	Sembakung Atulai	\N	\N	t
3433	232	Tulin Onsoi	\N	\N	t
3434	233	Betayau	\N	\N	t
3435	233	Muruk Rian	\N	\N	t
3436	233	Sesayap	\N	\N	t
3437	233	Sesayap Hilir	\N	\N	t
3438	233	Tana Lia	\N	\N	t
3439	234	Tarakan Barat	\N	\N	t
3440	234	Tarakan Tengah	\N	\N	t
3441	234	Tarakan Timur	\N	\N	t
3442	234	Tarakan Utara	\N	\N	t
3443	235	Bakam	\N	\N	t
3444	235	Belinyu	\N	\N	t
3445	235	Mendo Barat	\N	\N	t
3446	235	Merawang	\N	\N	t
3447	235	Pemali	\N	\N	t
3448	235	Puding Besar	\N	\N	t
3449	235	Riau Silip	\N	\N	t
3450	235	Sungailiat	\N	\N	t
3451	236	Jebus	\N	\N	t
3452	236	Kelapa	\N	\N	t
3453	236	Mentok	\N	\N	t
3454	236	Parittiga	\N	\N	t
3455	236	Simpang Teritip	\N	\N	t
3456	236	Tempilang	\N	\N	t
3457	237	Air Gegas	\N	\N	t
3458	237	Kepulauan Pongok	\N	\N	t
3459	237	Lepar Pongok	\N	\N	t
3460	237	Payung	\N	\N	t
3461	237	Pulaubesar	\N	\N	t
3462	237	Simpang Rimba	\N	\N	t
3463	237	Toboali	\N	\N	t
3464	237	Tukak Sadai	\N	\N	t
3465	238	Koba	\N	\N	t
3466	238	Lubuk Besar	\N	\N	t
3467	238	Namang	\N	\N	t
3468	238	Pangkalan Baru	\N	\N	t
3469	238	Simpang Katis	\N	\N	t
3470	238	Sungai Selan	\N	\N	t
3471	239	Badau	\N	\N	t
3472	239	Membalong	\N	\N	t
3473	239	Selat Nasik	\N	\N	t
3474	239	Sijuk	\N	\N	t
3475	239	Tanjung Pandan	\N	\N	t
3476	240	Damar	\N	\N	t
3477	240	Dendang	\N	\N	t
3478	240	Gantung	\N	\N	t
3479	240	Kelapa Kampit	\N	\N	t
3480	240	Manggar	\N	\N	t
3481	240	Simpang Pesak	\N	\N	t
3482	240	Simpang Renggiang	\N	\N	t
3483	241	Bukitintan	\N	\N	t
3484	241	Gabek	\N	\N	t
3485	241	Gerunggang	\N	\N	t
3486	241	Girimaya	\N	\N	t
3487	241	Pangkal Balam	\N	\N	t
3488	241	Rangkui	\N	\N	t
3489	241	Taman Sari	\N	\N	t
3490	242	Bintan Pesisir	\N	\N	t
3491	242	Bintan Timur	\N	\N	t
3492	242	Bintan Utara	\N	\N	t
3493	242	Gunung Kijang	\N	\N	t
3494	242	Mantang	\N	\N	t
3495	242	Seri Kuala Lobam	\N	\N	t
3496	242	Tambelan	\N	\N	t
3497	242	Telok Sebong	\N	\N	t
3498	242	Teluk Bintan	\N	\N	t
3499	242	Toapaya	\N	\N	t
3500	243	Belat	\N	\N	t
3501	243	Buru	\N	\N	t
3502	243	Durai	\N	\N	t
3503	243	Karimun	\N	\N	t
3504	243	Kundur	\N	\N	t
3505	243	Kundur Barat	\N	\N	t
3506	243	Kundur Utara	\N	\N	t
3507	243	Meral	\N	\N	t
3508	243	Meral Barat	\N	\N	t
3509	243	Moro	\N	\N	t
3510	243	Tebing	\N	\N	t
3511	243	Ungar	\N	\N	t
3512	244	Jemaja	\N	\N	t
3513	244	Jemaja Timur	\N	\N	t
3514	244	Palmatak	\N	\N	t
3515	244	Siantan	\N	\N	t
3516	244	Siantan Selatan	\N	\N	t
3517	244	Siantan Tengah	\N	\N	t
3518	244	Siantan Timur	\N	\N	t
3519	245	Lingga	\N	\N	t
3520	245	Lingga Timur	\N	\N	t
3521	245	Lingga Utara	\N	\N	t
3522	245	Selayar	\N	\N	t
3523	245	Senayang	\N	\N	t
3524	245	Singkep	\N	\N	t
3525	245	Singkep Barat	\N	\N	t
3526	245	Singkep Pesisir	\N	\N	t
3527	245	Singkep Selatan	\N	\N	t
3528	246	Bunguran Barat	\N	\N	t
3529	246	Bunguran Selatan	\N	\N	t
3530	246	Bunguran Tengah	\N	\N	t
3531	246	Bunguran Timur	\N	\N	t
3532	246	Bunguran Timur Laut	\N	\N	t
3533	246	Bunguran Utara	\N	\N	t
3534	246	Midai	\N	\N	t
3535	246	Pulau Laut	\N	\N	t
3536	246	Pulau Tiga	\N	\N	t
3537	246	Serasan	\N	\N	t
3538	246	Serasan Timur	\N	\N	t
3539	246	Subi	\N	\N	t
3540	247	Batam Kota	\N	\N	t
3541	247	Batu Aji	\N	\N	t
3542	247	Batu Ampar	\N	\N	t
3543	247	Belakang Padang	\N	\N	t
3544	247	Bengkong	\N	\N	t
3545	247	Bulang	\N	\N	t
3546	247	Galang	\N	\N	t
3547	247	Lubuk Baja	\N	\N	t
3548	247	Nongsa	\N	\N	t
3549	247	Sagulung	\N	\N	t
3550	247	Sei Beduk	\N	\N	t
3551	247	Sekupang	\N	\N	t
3552	248	Bukit Bestari	\N	\N	t
3553	248	Tanjung Pinang Barat	\N	\N	t
3554	248	Tanjung Pinang Kota	\N	\N	t
3555	248	Tanjung Pinang Timur	\N	\N	t
3556	249	Air Hitam	\N	\N	t
3557	249	Balik Bukit	\N	\N	t
3558	249	Bandar Negeri Suoh	\N	\N	t
3559	249	Batu Brak	\N	\N	t
3560	249	Batu Ketulis	\N	\N	t
3561	249	Belalau	\N	\N	t
3562	249	Gedung Surian	\N	\N	t
3563	249	Kebun Tebu	\N	\N	t
3564	249	Lumbok Seminung	\N	\N	t
3565	249	Pagar Dewa	\N	\N	t
3566	249	Sekincau	\N	\N	t
3567	249	Sukau	\N	\N	t
3568	249	Sumber Jaya	\N	\N	t
3569	249	Suoh	\N	\N	t
3570	249	Way Tenong	\N	\N	t
3571	250	Bakauheni	\N	\N	t
3572	250	Candipuro	\N	\N	t
3573	250	Jati Agung	\N	\N	t
3574	250	Kalianda	\N	\N	t
3575	250	Katibung	\N	\N	t
3576	250	Ketapang	\N	\N	t
3577	250	Merbau Mataram	\N	\N	t
3578	250	Natar	\N	\N	t
3579	250	Palas	\N	\N	t
3580	250	Penengahan	\N	\N	t
3581	250	Raja Basa	\N	\N	t
3582	250	Sidomulyo	\N	\N	t
3583	250	Sragi	\N	\N	t
3584	250	Tanjung Bintang	\N	\N	t
3585	250	Tanjung Sari	\N	\N	t
3586	250	Way Panji	\N	\N	t
3587	250	Way Sulan	\N	\N	t
3588	251	Anak Ratu Aji	\N	\N	t
3589	251	Anak Tuha	\N	\N	t
3590	251	Bandar Mataram	\N	\N	t
3591	251	Bandar Surabaya	\N	\N	t
3592	251	Bangun Rejo	\N	\N	t
3593	251	Bekri	\N	\N	t
3594	251	Bumi Nabung	\N	\N	t
3595	251	Bumi Ratu Nuban	\N	\N	t
3596	251	Gunung Sugih	\N	\N	t
3597	251	Kalirejo	\N	\N	t
3598	251	Kota Gajah	\N	\N	t
3599	251	Padang Ratu	\N	\N	t
3600	251	Pubian	\N	\N	t
3601	251	Punggur	\N	\N	t
3602	251	Putra Rumbia	\N	\N	t
3603	251	Rumbia	\N	\N	t
3604	251	Selagai Lingga	\N	\N	t
3605	251	Sendang Agung	\N	\N	t
3606	251	Seputih Agung	\N	\N	t
3607	251	Seputih Banyak	\N	\N	t
3608	251	Seputih Mataram	\N	\N	t
3609	251	Seputih Raman	\N	\N	t
3610	251	Seputih Surabaya	\N	\N	t
3611	251	Terbanggi Besar	\N	\N	t
3612	251	Terusan Nunyai	\N	\N	t
3613	251	Trimurjo	\N	\N	t
3614	251	Way Pangubuan	\N	\N	t
3615	251	Way Seputih	\N	\N	t
3616	252	Bandar Sribhawono	\N	\N	t
3617	252	Batanghari	\N	\N	t
3618	252	Batanghari Nuban	\N	\N	t
3619	252	Braja Selebah	\N	\N	t
3620	252	Bumi Agung	\N	\N	t
3621	252	Gunung Pelindung	\N	\N	t
3622	252	Jabung	\N	\N	t
3623	252	Labuhan Maringgai	\N	\N	t
3624	252	Labuhan Ratu	\N	\N	t
3625	252	Marga Sekampung	\N	\N	t
3626	252	Marga Tiga	\N	\N	t
3627	252	Mataram Baru	\N	\N	t
3628	252	Melinting	\N	\N	t
3629	252	Metro Kibang	\N	\N	t
3630	252	Pasir Sakti	\N	\N	t
3631	252	Pekalongan	\N	\N	t
3632	252	Purbolinggo	\N	\N	t
3633	252	Raman Utara	\N	\N	t
3634	252	Sekampung	\N	\N	t
3635	252	Sekampung Udik	\N	\N	t
3636	252	Sukadana	\N	\N	t
3637	252	Waway Karya	\N	\N	t
3638	252	Way Bungur	\N	\N	t
3639	252	Way Jepara	\N	\N	t
3640	253	Abung Barat	\N	\N	t
3641	253	Abung Kunang	\N	\N	t
3642	253	Abung Pekurun	\N	\N	t
3643	253	Abung Selatan	\N	\N	t
3644	253	Abung Semuli	\N	\N	t
3645	253	Abung Surakarta	\N	\N	t
3646	253	Abung Tengah	\N	\N	t
3647	253	Abung Timur	\N	\N	t
3648	253	Abung Tinggi	\N	\N	t
3649	253	Blambangan Pagar	\N	\N	t
3650	253	Bukit Kemuning	\N	\N	t
3651	253	Bunga Mayang	\N	\N	t
3652	253	Hulu Sungkai	\N	\N	t
3653	253	Kotabumi	\N	\N	t
3654	253	Kotabumi Selatan	\N	\N	t
3655	253	Kotabumi Utara	\N	\N	t
3656	253	Muara Sungkai	\N	\N	t
3657	253	Sungkai Barat	\N	\N	t
3658	253	Sungkai Jaya	\N	\N	t
3659	253	Sungkai Selatan	\N	\N	t
3660	253	Sungkai Tengah	\N	\N	t
3661	253	Sungkai Utara	\N	\N	t
3662	253	Tanjung Raja	\N	\N	t
3663	254	Mesuji	\N	\N	t
3664	254	Mesuji Timur	\N	\N	t
3665	254	Panca Jaya	\N	\N	t
3666	254	Rawa Jitu Utara	\N	\N	t
3667	254	Simpang Pematang	\N	\N	t
3668	254	Tanjung Raya	\N	\N	t
3669	254	Way Serdang	\N	\N	t
3670	255	Gedong Tataan	\N	\N	t
3671	255	Kedondong	\N	\N	t
3672	255	Marga Punduh	\N	\N	t
3673	255	Negeri Katon	\N	\N	t
3674	255	Padang Cermin	\N	\N	t
3675	255	Punduh Pidada	\N	\N	t
3676	255	Tegineneng	\N	\N	t
3677	255	Way Khilau	\N	\N	t
3678	255	Way Lima	\N	\N	t
3679	256	Bengkunat	\N	\N	t
3680	256	Bengkunat Belimbing	\N	\N	t
3681	256	Karya Penggawa	\N	\N	t
3682	256	Krui Selatan	\N	\N	t
3683	256	Lemong	\N	\N	t
3684	256	Ngambur	\N	\N	t
3685	256	Pesisir Selatan	\N	\N	t
3686	256	Pesisir Tengah	\N	\N	t
3687	256	Pesisir Utara	\N	\N	t
3688	256	Pulaupisang	\N	\N	t
3689	256	Way Krui	\N	\N	t
3690	257	Adiluwih	\N	\N	t
3691	257	Ambarawa	\N	\N	t
3692	257	Banyumas	\N	\N	t
3693	257	Gading Rejo	\N	\N	t
3694	257	Pagelaran	\N	\N	t
3695	257	Pagelaran Utara	\N	\N	t
3696	257	Pardasuka	\N	\N	t
3697	257	Pringsewu	\N	\N	t
3698	257	Sukoharjo	\N	\N	t
3699	258	Air Naningan	\N	\N	t
3700	258	Bandar Negeri Semuong	\N	\N	t
3701	258	Bulok	\N	\N	t
3702	258	Cukuh Balak	\N	\N	t
3703	258	Gisting	\N	\N	t
3704	258	Gunung Alip	\N	\N	t
3705	258	Klumbayan	\N	\N	t
3706	258	Klumbayan Barat	\N	\N	t
3707	258	Kota Agung	\N	\N	t
3708	258	Kota Agung Barat	\N	\N	t
3709	258	Kota Agung Timur	\N	\N	t
3710	258	Limau	\N	\N	t
3711	258	Pematang Sawa	\N	\N	t
3712	258	Pugung	\N	\N	t
3713	258	Pulau Panggung	\N	\N	t
3714	258	Semaka	\N	\N	t
3715	258	Sumber Rejo	\N	\N	t
3716	258	Talang Padang	\N	\N	t
3717	258	Ulu Belu	\N	\N	t
3718	258	Wonosobo	\N	\N	t
3719	259	Banjar Agung	\N	\N	t
3720	259	Banjar Baru	\N	\N	t
3721	259	Banjar Margo	\N	\N	t
3722	259	Dente Teladas	\N	\N	t
3723	259	Gedung Aji	\N	\N	t
3724	259	Gedung Aji Baru	\N	\N	t
3725	259	Gedung Meneng	\N	\N	t
3726	259	Menggala	\N	\N	t
3727	259	Menggala Timur	\N	\N	t
3728	259	Meraksa Aji	\N	\N	t
3729	259	Penawar Aji	\N	\N	t
3730	259	Penawar Tama	\N	\N	t
3731	259	Rawa Jitu Selatan	\N	\N	t
3732	259	Rawa Jitu Timur	\N	\N	t
3733	259	Rawa Pitu	\N	\N	t
3734	260	Gunung Agung	\N	\N	t
3735	260	Gunung Terang	\N	\N	t
3736	260	Lambu Kibang	\N	\N	t
3737	260	Pagar Dewa	\N	\N	t
3738	260	Tulang Bawang Tengah	\N	\N	t
3739	260	Tulang Bawang Udik	\N	\N	t
3740	260	Tumijajar	\N	\N	t
3741	260	Way Kenanga	\N	\N	t
3742	261	Bahuga	\N	\N	t
3743	261	Banjit	\N	\N	t
3744	261	Baradatu	\N	\N	t
3745	261	Blambangan Umpu	\N	\N	t
3746	261	Buay Bahuga	\N	\N	t
3747	261	Bumi Agung	\N	\N	t
3748	261	Gunung Labuhan	\N	\N	t
3749	261	Kasui	\N	\N	t
3750	261	Negara Batin	\N	\N	t
3751	261	Negeri Agung	\N	\N	t
3752	261	Negeri Besar	\N	\N	t
3753	261	Pakuan Ratu	\N	\N	t
3754	261	Rebang Tangkas	\N	\N	t
3755	261	Way Tuba	\N	\N	t
3756	262	Bumi Waras	\N	\N	t
3757	262	Enggal	\N	\N	t
3758	262	Kedamaian	\N	\N	t
3759	262	Kedaton	\N	\N	t
3760	262	Kemiling	\N	\N	t
3761	262	Labuhan Ratu	\N	\N	t
3762	262	Langkapura	\N	\N	t
3763	262	Panjang	\N	\N	t
3764	262	Rajabasa	\N	\N	t
3765	262	Sukabumi	\N	\N	t
3766	262	Sukarame	\N	\N	t
3767	262	Tanjung Senang	\N	\N	t
3768	262	Tanjungkarang Barat	\N	\N	t
3769	262	Tanjungkarang Pusat	\N	\N	t
3770	262	Tanjungkarang Timur	\N	\N	t
3771	262	Telukbetung Barat	\N	\N	t
3772	262	Telukbetung Selatan	\N	\N	t
3773	262	Telukbetung Timur	\N	\N	t
3774	262	Telukbetung Utara	\N	\N	t
3775	262	Way Halim	\N	\N	t
3776	263	Metro Barat	\N	\N	t
3777	263	Metro Pusat	\N	\N	t
3778	263	Metro Selatan	\N	\N	t
3779	263	Metro Timur	\N	\N	t
3780	263	Metro Utara	\N	\N	t
3781	264	Kormomolin	\N	\N	t
3782	264	Molu Maru	\N	\N	t
3783	264	Nirunmas	\N	\N	t
3784	264	Selaru	\N	\N	t
3785	264	Tanimbar Selatan	\N	\N	t
3786	264	Tanimbar Utara	\N	\N	t
3787	264	Wer Maktian	\N	\N	t
3788	264	Wer Tamrian	\N	\N	t
3789	264	Wuar Labobar	\N	\N	t
3790	264	Yaru	\N	\N	t
3791	265	Air Buaya	\N	\N	t
3792	265	Batabual	\N	\N	t
3793	265	Fena Leisela	\N	\N	t
3794	265	Lilialy	\N	\N	t
3795	265	Lolong Guba	\N	\N	t
3796	265	Namlea	\N	\N	t
3797	265	Teluk Kaiely	\N	\N	t
3798	265	Waeapo	\N	\N	t
3799	265	Waelata	\N	\N	t
3800	265	Waplau	\N	\N	t
3801	266	Ambalau	\N	\N	t
3802	266	Fena Fafan	\N	\N	t
3803	266	Kepala Madan	\N	\N	t
3804	266	Leksula	\N	\N	t
3805	266	Namrole	\N	\N	t
3806	266	Waesama	\N	\N	t
3807	267	Aru Selatan	\N	\N	t
3808	267	Aru Selatan Timur	\N	\N	t
3809	267	Aru Selatan Utara	\N	\N	t
3810	267	Aru Tengah	\N	\N	t
3811	267	Aru Tengah Selatan	\N	\N	t
3812	267	Aru Tengah Timur	\N	\N	t
3813	267	Aru Utara	\N	\N	t
3814	267	Aru Utara Timur Batuley	\N	\N	t
3815	267	Pulau-Pulau Aru	\N	\N	t
3816	267	Sir-Sir	\N	\N	t
3817	268	Damer	\N	\N	t
3818	268	Dawelor Dawera	\N	\N	t
3819	268	Kepulauan Romang	\N	\N	t
3820	268	Kisar Utara	\N	\N	t
3821	268	Mndona Hiera	\N	\N	t
3822	268	Moa Lakor	\N	\N	t
3823	268	Pulau Lakor	\N	\N	t
3824	268	Pulau Leti	\N	\N	t
3825	268	Pulau Masela	\N	\N	t
3826	268	Pulau Wetang	\N	\N	t
3827	268	Pulau-Pulau Babar	\N	\N	t
3828	268	Pulau-pulau Babar Timur	\N	\N	t
3829	268	Pulau-pulau Terselatan	\N	\N	t
3830	268	Wetar	\N	\N	t
3831	268	Wetar Barat	\N	\N	t
3832	268	Wetar Timur	\N	\N	t
3833	268	Wetar Utara	\N	\N	t
3834	269	Amahai	\N	\N	t
3835	269	Banda	\N	\N	t
3836	269	Kota Masohi	\N	\N	t
3837	269	Leihitu	\N	\N	t
3838	269	Leihitu Barat	\N	\N	t
3839	269	Nusa Laut	\N	\N	t
3840	269	Pulau Haruku	\N	\N	t
3841	269	Salahutu	\N	\N	t
3842	269	Saparua	\N	\N	t
3843	269	Saparua Timur	\N	\N	t
3844	269	Seram Utara	\N	\N	t
3845	269	Seram Utara Barat	\N	\N	t
3846	269	Seram Utara Timur Kobi	\N	\N	t
3847	269	Seram Utara Timur Seti	\N	\N	t
3848	269	Tehoru	\N	\N	t
3849	269	Teluk Elpaputih	\N	\N	t
3850	269	Telutih	\N	\N	t
3851	269	Teon Nila Serua	\N	\N	t
3852	270	Hoat Sorbay	\N	\N	t
3853	270	Kei Besar	\N	\N	t
3854	270	Kei Besar Selatan	\N	\N	t
3855	270	Kei Besar Selatan Barat	\N	\N	t
3856	270	Kei Besar Utara Barat	\N	\N	t
3857	270	Kei Besar Utara Timur	\N	\N	t
3858	270	Kei Kecil	\N	\N	t
3859	270	Kei Kecil Barat	\N	\N	t
3860	270	Kei Kecil Timur	\N	\N	t
3861	270	Kei Kecil Timur Selatan	\N	\N	t
3862	270	Manyeuw	\N	\N	t
3863	271	Amalatu	\N	\N	t
3864	271	Elpaputih	\N	\N	t
3865	271	Huamual	\N	\N	t
3866	271	Huamual Belakang	\N	\N	t
3867	271	Inamosol	\N	\N	t
3868	271	Kairatu	\N	\N	t
3869	271	Kairatu Barat	\N	\N	t
3870	271	Kepulauan Manipa	\N	\N	t
3871	271	Seram Barat	\N	\N	t
3872	271	Taniwel	\N	\N	t
3873	271	Taniwel Timur	\N	\N	t
3874	272	Bula	\N	\N	t
3875	272	Bula Barat	\N	\N	t
3876	272	Gorom Timur	\N	\N	t
3877	272	Kian Darat	\N	\N	t
3878	272	Kilmury	\N	\N	t
3879	272	Pulau Gorom	\N	\N	t
3880	272	Pulau Panjang	\N	\N	t
3881	272	Seram Timur	\N	\N	t
3882	272	Siritaun Wida Timur	\N	\N	t
3883	272	Siwalalat	\N	\N	t
3884	272	Teluk Waru	\N	\N	t
3885	272	Teor	\N	\N	t
3886	272	Tutuk Tolu	\N	\N	t
3887	272	Wakate	\N	\N	t
3888	272	Werinama	\N	\N	t
3889	273	Baguala	\N	\N	t
3890	273	Leitimur Selatan	\N	\N	t
3891	273	Nusaniwe	\N	\N	t
3892	273	Sirimau	\N	\N	t
3893	273	Teluk Ambon	\N	\N	t
3894	274	Kur Selatan	\N	\N	t
3895	274	Pulau Dullah Selatan	\N	\N	t
3896	274	Pulau Dullah Utara	\N	\N	t
3897	274	Pulau-Pulau Kur	\N	\N	t
3898	274	Tayando Tam	\N	\N	t
3899	275	Ibu	\N	\N	t
3900	275	Ibu Selatan	\N	\N	t
3901	275	Ibu Utara	\N	\N	t
3902	275	Jailolo	\N	\N	t
3903	275	Jailolo Selatan	\N	\N	t
3904	275	Loloda	\N	\N	t
3905	275	Sahu	\N	\N	t
3906	275	Sahu Timur	\N	\N	t
3907	276	Bacan	\N	\N	t
3908	276	Bacan Barat	\N	\N	t
3909	276	Bacan Barat Utara	\N	\N	t
3910	276	Bacan Selatan	\N	\N	t
3911	276	Bacan Timur	\N	\N	t
3912	276	Bacan Timur Selatan	\N	\N	t
3913	276	Bacan Timur Tengah	\N	\N	t
3914	276	Gane Barat	\N	\N	t
3915	276	Gane Barat Selatan	\N	\N	t
3916	276	Gane Barat Utara	\N	\N	t
3917	276	Gane Timur	\N	\N	t
3918	276	Gane Timur Selatan	\N	\N	t
3919	276	Gane Timur Tengah	\N	\N	t
3920	276	Kasiruta Barat	\N	\N	t
3921	276	Kasiruta Timur	\N	\N	t
3922	276	Kayoa	\N	\N	t
3923	276	Kayoa Barat	\N	\N	t
3924	276	Kayoa Selatan	\N	\N	t
3925	276	Kayoa Utara	\N	\N	t
3926	276	Kepulauan Botanglomang	\N	\N	t
3927	276	Kepulauan Joronga	\N	\N	t
3928	276	Makian Barat	\N	\N	t
3929	276	Mandioli Selatan	\N	\N	t
3930	276	Mandioli Utara	\N	\N	t
3931	276	Obi	\N	\N	t
3932	276	Obi Barat	\N	\N	t
3933	276	Obi Selatan	\N	\N	t
3934	276	Obi Timur	\N	\N	t
3935	276	Obi Utara	\N	\N	t
3936	276	Pulau Makian	\N	\N	t
3937	277	Patani	\N	\N	t
3938	277	Patani Barat	\N	\N	t
3939	277	Patani Utara	\N	\N	t
3940	277	Pulau Gebe	\N	\N	t
3941	277	Weda	\N	\N	t
3942	277	Weda Selatan	\N	\N	t
3943	277	Weda Tengah	\N	\N	t
3944	277	Weda Utara	\N	\N	t
3945	278	Kota Maba	\N	\N	t
3946	278	Maba	\N	\N	t
3947	278	Maba Selatan	\N	\N	t
3948	278	Maba Tengah	\N	\N	t
3949	278	Maba Utara	\N	\N	t
3950	278	Wasile	\N	\N	t
3951	278	Wasile Selatan	\N	\N	t
3952	278	Wasile Tengah	\N	\N	t
3953	278	Wasile Timur	\N	\N	t
3954	278	Wasile Utara	\N	\N	t
3955	279	Galela	\N	\N	t
3956	279	Galela Barat	\N	\N	t
3957	279	Galela Selatan	\N	\N	t
3958	279	Galela Utara	\N	\N	t
3959	279	Kao	\N	\N	t
3960	279	Kao Barat	\N	\N	t
3961	279	Kao Teluk	\N	\N	t
3962	279	Kao Utara	\N	\N	t
3963	279	Loloda Kepulauan	\N	\N	t
3964	279	Loloda Utara	\N	\N	t
3965	279	Malifut	\N	\N	t
3966	279	Tobelo	\N	\N	t
3967	279	Tobelo Barat	\N	\N	t
3968	279	Tobelo Selatan	\N	\N	t
3969	279	Tobelo Tengah	\N	\N	t
3970	279	Tobelo Timur	\N	\N	t
3971	279	Tobelo Utara	\N	\N	t
3972	280	Mangoli Barat	\N	\N	t
3973	280	Mangoli Selatan	\N	\N	t
3974	280	Mangoli Tengah	\N	\N	t
3975	280	Mangoli Timur	\N	\N	t
3976	280	Mangoli Utara	\N	\N	t
3977	280	Mangoli Utara Timur	\N	\N	t
3978	280	Sanana	\N	\N	t
3979	280	Sanana Utara	\N	\N	t
3980	280	Sulabesi Barat	\N	\N	t
3981	280	Sulabesi Selatan	\N	\N	t
3982	280	Sulabesi Tengah	\N	\N	t
3983	280	Sulabesi Timur	\N	\N	t
3984	281	Morotai Jaya	\N	\N	t
3985	281	Morotai Selatan	\N	\N	t
3986	281	Morotai Selatan Barat	\N	\N	t
3987	281	Morotai Timur	\N	\N	t
3988	281	Morotai Utara	\N	\N	t
3989	282	Lede	\N	\N	t
3990	282	Tabona	\N	\N	t
3991	282	Taliabu Barat	\N	\N	t
3992	282	Taliabu Barat Laut	\N	\N	t
3993	282	Taliabu Selatan	\N	\N	t
3994	282	Taliabu Timur	\N	\N	t
3995	282	Taliabu Timur Selatan	\N	\N	t
3996	282	Taliabu Utara	\N	\N	t
3997	283	Kota Ternate Selatan	\N	\N	t
3998	283	Kota Ternate Tengah	\N	\N	t
3999	283	Kota Ternate Utara	\N	\N	t
4000	283	Pulau Batang Dua	\N	\N	t
4001	283	Pulau Hiri	\N	\N	t
4002	283	Pulau Moti	\N	\N	t
4003	283	Pulau Ternate	\N	\N	t
4004	284	Oba	\N	\N	t
4005	284	Oba Selatan	\N	\N	t
4006	284	Oba Tengah	\N	\N	t
4007	284	Oba Utara	\N	\N	t
4008	284	Tidore	\N	\N	t
4009	284	Tidore Selatan	\N	\N	t
4010	284	Tidore Timur	\N	\N	t
4011	284	Tidore Utara	\N	\N	t
4012	285	Ambalawi	\N	\N	t
4013	285	Belo	\N	\N	t
4014	285	Bolo	\N	\N	t
4015	285	Donggo	\N	\N	t
4016	285	Lambitu	\N	\N	t
4017	285	Lambu	\N	\N	t
4018	285	Langgudu	\N	\N	t
4019	285	Madapangga	\N	\N	t
4020	285	Monta	\N	\N	t
4021	285	Palibelo	\N	\N	t
4022	285	Parado	\N	\N	t
4023	285	Sanggar	\N	\N	t
4024	285	Sape	\N	\N	t
4025	285	Soromandi	\N	\N	t
4026	285	Tambora	\N	\N	t
4027	285	Wawo	\N	\N	t
4028	285	Wera	\N	\N	t
4029	285	Woha	\N	\N	t
4030	286	Dompu	\N	\N	t
4031	286	Hu'u	\N	\N	t
4032	286	Kempo	\N	\N	t
4033	286	Kilo	\N	\N	t
4034	286	Manggalewa	\N	\N	t
4035	286	Pajo	\N	\N	t
4036	286	Pekat	\N	\N	t
4037	286	Woja	\N	\N	t
4038	287	Batu Layar	\N	\N	t
4039	287	Gerung	\N	\N	t
4040	287	Gunungsari	\N	\N	t
4041	287	Kediri	\N	\N	t
4042	287	Kuripan	\N	\N	t
4043	287	Labuapi	\N	\N	t
4044	287	Lembar	\N	\N	t
4045	287	Lingsar	\N	\N	t
4046	287	Narmada	\N	\N	t
4047	287	Sekotong	\N	\N	t
4048	288	Batukliang	\N	\N	t
4049	288	Batukliang Utara	\N	\N	t
4050	288	Janapria	\N	\N	t
4051	288	Jonggat	\N	\N	t
4052	288	Kopang	\N	\N	t
4053	288	Praya	\N	\N	t
4054	288	Praya Barat	\N	\N	t
4055	288	Praya Barat Daya	\N	\N	t
4056	288	Praya Tengah	\N	\N	t
4057	288	Praya Timur	\N	\N	t
4058	288	Pringgarata	\N	\N	t
4059	288	Pujut	\N	\N	t
4060	289	Aikmel	\N	\N	t
4061	289	Jerowaru	\N	\N	t
4062	289	Keruak	\N	\N	t
4063	289	Labuhan Haji	\N	\N	t
4064	289	Masbagik	\N	\N	t
4065	289	Montong Gading	\N	\N	t
4066	289	Pringgabaya	\N	\N	t
4067	289	Pringgasela	\N	\N	t
4068	289	Sakra	\N	\N	t
4069	289	Sakra Barat	\N	\N	t
4070	289	Sakra Timur	\N	\N	t
4071	289	Sambelia	\N	\N	t
4072	289	Selong	\N	\N	t
4073	289	Sembalun	\N	\N	t
4074	289	Sikur	\N	\N	t
4075	289	Sukamulia	\N	\N	t
4076	289	Suralaga	\N	\N	t
4077	289	Suwela	\N	\N	t
4078	289	Terara	\N	\N	t
4079	289	Wanasaba	\N	\N	t
4080	290	Bayan	\N	\N	t
4081	290	Gangga	\N	\N	t
4082	290	Kayangan	\N	\N	t
4083	290	Pemenang	\N	\N	t
4084	290	Tanjung	\N	\N	t
4085	291	Alas	\N	\N	t
4086	291	Alas Barat	\N	\N	t
4087	291	Batu Lanteh	\N	\N	t
4088	291	Buer	\N	\N	t
4089	291	Empang	\N	\N	t
4090	291	Labangka	\N	\N	t
4091	291	Labuhan Badas	\N	\N	t
4092	291	Lantung	\N	\N	t
4093	291	Lape	\N	\N	t
4094	291	Lenangguar	\N	\N	t
4095	291	Lopok	\N	\N	t
4096	291	Lunyuk	\N	\N	t
4097	291	Maronge	\N	\N	t
4098	291	Moyo Hilir	\N	\N	t
4099	291	Moyo Hulu	\N	\N	t
4100	291	Moyo Utara	\N	\N	t
4101	291	Orong Telu	\N	\N	t
4102	291	Plampang	\N	\N	t
4103	291	Rhee	\N	\N	t
4104	291	Ropang	\N	\N	t
4105	291	Sumbawa	\N	\N	t
4106	291	Tarano	\N	\N	t
4107	291	Unter Iwes	\N	\N	t
4108	291	Utan	\N	\N	t
4109	292	Brang Ene	\N	\N	t
4110	292	Brang Rea	\N	\N	t
4111	292	Jereweh	\N	\N	t
4112	292	Maluk	\N	\N	t
4113	292	Poto Tano	\N	\N	t
4114	292	Sekongkang	\N	\N	t
4115	292	Seteluk	\N	\N	t
4116	292	Taliwang	\N	\N	t
4117	293	Asakota	\N	\N	t
4118	293	Mpunda	\N	\N	t
4119	293	Raba	\N	\N	t
4120	293	RasanaE Barat	\N	\N	t
4121	293	RasanaE Timur	\N	\N	t
4122	294	Ampenan	\N	\N	t
4123	294	Cakranegara	\N	\N	t
4124	294	Mataram	\N	\N	t
4125	294	Sandubaya	\N	\N	t
4126	294	Sekarbela	\N	\N	t
4127	294	Selaprang	\N	\N	t
4128	295	Amanatun Selatan	\N	\N	t
4129	295	Amanatun Utara	\N	\N	t
4130	295	Amanuban Barat	\N	\N	t
4131	295	Amanuban Selatan	\N	\N	t
4132	295	Amanuban Tengah	\N	\N	t
4133	295	Amanuban Timur	\N	\N	t
4134	295	Batu Putih	\N	\N	t
4135	295	Boking	\N	\N	t
4136	295	Fatukopa	\N	\N	t
4137	295	Fatumnasi	\N	\N	t
4138	295	Fautmolo	\N	\N	t
4139	295	KI'E	\N	\N	t
4140	295	Kok Baun	\N	\N	t
4141	295	Kolbano	\N	\N	t
4142	295	Kot olin	\N	\N	t
4143	295	Kota Soe	\N	\N	t
4144	295	Kualin	\N	\N	t
4145	295	Kuanfatu	\N	\N	t
4146	295	Kuatnana	\N	\N	t
4147	295	Mollo Barat	\N	\N	t
4148	295	Mollo Selatan	\N	\N	t
4149	295	Mollo Tengah	\N	\N	t
4150	295	Mollo Utara	\N	\N	t
4151	295	Noebana	\N	\N	t
4152	295	Noebeba	\N	\N	t
4153	295	Nunbena	\N	\N	t
4154	295	Nunkolo	\N	\N	t
4155	295	Oenino	\N	\N	t
4156	295	Polen	\N	\N	t
4157	295	Santian	\N	\N	t
4158	295	Tobu	\N	\N	t
4159	295	Toianas	\N	\N	t
4160	296	Alor Barat Daya	\N	\N	t
4161	296	Alor Barat Laut	\N	\N	t
4162	296	Alor Selatan	\N	\N	t
4163	296	Alor Tengah Utara	\N	\N	t
4164	296	Alor Timur	\N	\N	t
4165	296	Alor Timur Laut	\N	\N	t
4166	296	Kabola	\N	\N	t
4167	296	Lembur	\N	\N	t
4168	296	Mataru	\N	\N	t
4169	296	Pantar	\N	\N	t
4170	296	Pantar Barat	\N	\N	t
4171	296	Pantar Baru Laut	\N	\N	t
4172	296	Pantar Tengah	\N	\N	t
4173	296	Pantar Timur	\N	\N	t
4174	296	Pulau Pura	\N	\N	t
4175	296	Pureman	\N	\N	t
4176	296	Teluk Mutiara	\N	\N	t
4177	297	Atambua Barat	\N	\N	t
4178	297	Atambua Selatan	\N	\N	t
4179	297	Kakuluk Mesak	\N	\N	t
4180	297	Kota Atambua	\N	\N	t
4181	297	Lamaknen	\N	\N	t
4182	297	Lamaknen Selatan	\N	\N	t
4183	297	Lasiolat	\N	\N	t
4184	297	Nanaet Duabesi	\N	\N	t
4185	297	Raihat	\N	\N	t
4186	297	Raimanuk	\N	\N	t
4187	297	Tasifeto Barat	\N	\N	t
4188	297	TasifetoTimur	\N	\N	t
4189	298	Detukeli	\N	\N	t
4190	298	Detusoko	\N	\N	t
4191	298	Ende	\N	\N	t
4192	298	Ende Selatan	\N	\N	t
4193	298	Ende Tengah	\N	\N	t
4194	298	Ende Timur	\N	\N	t
4195	298	Ende Utara	\N	\N	t
4196	298	Kelimutu	\N	\N	t
4197	298	Kota Baru	\N	\N	t
4198	298	Lepembusu Kelisoke	\N	\N	t
4199	298	Lio Timur	\N	\N	t
4200	298	Maukaro	\N	\N	t
4201	298	Maurole	\N	\N	t
4202	298	Nangapanda	\N	\N	t
4203	298	Ndona	\N	\N	t
4204	298	Ndona Timur	\N	\N	t
4205	298	Ndori	\N	\N	t
4206	298	Pulau Ende	\N	\N	t
4207	298	Wewaria	\N	\N	t
4208	298	Wolojita	\N	\N	t
4209	298	Wolowaru	\N	\N	t
4210	299	Adonara	\N	\N	t
4211	299	Adonara Barat	\N	\N	t
4212	299	Adonara Tengah	\N	\N	t
4213	299	Adonara Timur	\N	\N	t
4214	299	Demon Pagong	\N	\N	t
4215	299	Ile Boleng	\N	\N	t
4216	299	Ile Bura	\N	\N	t
4217	299	Ile Mandiri	\N	\N	t
4218	299	Kelubagolit	\N	\N	t
4219	299	Larantuka	\N	\N	t
4220	299	Lewolema	\N	\N	t
4221	299	Solor Barat	\N	\N	t
4222	299	Solor Selatan	\N	\N	t
4223	299	Solor Timur	\N	\N	t
4224	299	Tanjung Bunga	\N	\N	t
4225	299	Titehena	\N	\N	t
4226	299	Witihama	\N	\N	t
4227	299	Wotan Ulumando	\N	\N	t
4228	299	Wulanggitang	\N	\N	t
4229	300	Amabi Oefeto	\N	\N	t
4230	300	Amabi Oefeto Timur	\N	\N	t
4231	300	Amarasi	\N	\N	t
4232	300	Amarasi Barat	\N	\N	t
4233	300	Amarasi Selatan	\N	\N	t
4234	300	Amarasi Timur	\N	\N	t
4235	300	Amfoang Barat Daya	\N	\N	t
4236	300	Amfoang Barat Laut	\N	\N	t
4237	300	Amfoang Selatan	\N	\N	t
4238	300	Amfoang Tengah	\N	\N	t
4239	300	Amfoang Timur	\N	\N	t
4240	300	Amfoang Utara	\N	\N	t
4241	300	Fatuleu	\N	\N	t
4242	300	Fatuleu Barat	\N	\N	t
4243	300	Fatuleu Tengah	\N	\N	t
4244	300	Kupang Barat	\N	\N	t
4245	300	Kupang Tengah	\N	\N	t
4246	300	Kupang Timur	\N	\N	t
4247	300	Nekamese	\N	\N	t
4248	300	Semau	\N	\N	t
4249	300	Semau Selatan	\N	\N	t
4250	300	Sulamu	\N	\N	t
4251	300	Taebenu	\N	\N	t
4252	300	Takari	\N	\N	t
4253	301	Atadei	\N	\N	t
4254	301	Buyasuri	\N	\N	t
4255	301	Ile Ape	\N	\N	t
4256	301	Ile Ape Timur	\N	\N	t
4257	301	Lebatukan	\N	\N	t
4258	301	Naga Wutung	\N	\N	t
4259	301	Nubatukan	\N	\N	t
4260	301	Omesuri	\N	\N	t
4261	301	Wulandoni	\N	\N	t
4262	302	Botin Leobele	\N	\N	t
4263	302	Io Kufeu	\N	\N	t
4264	302	Kobalima	\N	\N	t
4265	302	Kobalima Timur	\N	\N	t
4266	302	Laenmanen	\N	\N	t
4267	302	Malaka Barat	\N	\N	t
4268	302	Malaka Tengah	\N	\N	t
4269	302	Malaka Timur	\N	\N	t
4270	302	Rinhat	\N	\N	t
4271	302	Sasitamean	\N	\N	t
4272	302	Weliman	\N	\N	t
4273	302	Wewiku	\N	\N	t
4274	303	Cibal	\N	\N	t
4275	303	Cibal barat	\N	\N	t
4276	303	Langke Rembong	\N	\N	t
4277	303	Lelak	\N	\N	t
4278	303	Rahong Utara	\N	\N	t
4279	303	Reok	\N	\N	t
4280	303	Reok Barat	\N	\N	t
4281	303	Ruteng	\N	\N	t
4282	303	Satar Mese	\N	\N	t
4283	303	Satar Mese Barat	\N	\N	t
4284	303	Wae Rii	\N	\N	t
4285	304	Boleng	\N	\N	t
4286	304	Komodo	\N	\N	t
4287	304	Kuwus	\N	\N	t
4288	304	Lembor	\N	\N	t
4289	304	Lembor Selatan	\N	\N	t
4290	304	Macang Pacar	\N	\N	t
4291	304	Mbeliling	\N	\N	t
4292	304	Ndoso	\N	\N	t
4293	304	Sano Nggoang	\N	\N	t
4294	304	Welak	\N	\N	t
4295	305	Borong	\N	\N	t
4296	305	Elar	\N	\N	t
4297	305	Elar Selatan	\N	\N	t
4298	305	Kota Komba	\N	\N	t
4299	305	Lamba Leda	\N	\N	t
4300	305	Poco Ranaka	\N	\N	t
4301	305	Poco Ranaka Timur	\N	\N	t
4302	305	Rana Mese	\N	\N	t
4303	305	Sambi Rampas	\N	\N	t
4304	306	Aesesa	\N	\N	t
4305	306	Aesesa Selatan	\N	\N	t
4306	306	Boawae	\N	\N	t
4307	306	Keo Tengah	\N	\N	t
4308	306	Mauponggo	\N	\N	t
4309	306	Nangaroro	\N	\N	t
4310	306	Wolowae	\N	\N	t
4311	307	Aimere	\N	\N	t
4312	307	Bajawa	\N	\N	t
4313	307	Bajawa Utara	\N	\N	t
4314	307	Golewa	\N	\N	t
4315	307	Golewa Barat	\N	\N	t
4316	307	Golewa Selatan	\N	\N	t
4317	307	Inerie	\N	\N	t
4318	307	Jerebuu	\N	\N	t
4319	307	Riung	\N	\N	t
4320	307	Riung Barat	\N	\N	t
4321	307	Soa	\N	\N	t
4322	307	Wolomeze	\N	\N	t
4323	308	Landu Leko	\N	\N	t
4324	308	Lobalain	\N	\N	t
4325	308	Ndao Nuse	\N	\N	t
4326	308	Pantai Baru	\N	\N	t
4327	308	Rote Barat	\N	\N	t
4328	308	Rote Barat Daya	\N	\N	t
4329	308	Rote Barat Laut	\N	\N	t
4330	308	Rote Selatan	\N	\N	t
4331	308	Rote Tengah	\N	\N	t
4332	308	Rote Timur	\N	\N	t
4333	309	Hawu Mehara	\N	\N	t
4334	309	Raijua	\N	\N	t
4335	309	Sabu Barat	\N	\N	t
4336	309	Sabu Liae	\N	\N	t
4337	309	Sabu Tengah	\N	\N	t
4338	309	Sabu Timur	\N	\N	t
4339	310	Alok	\N	\N	t
4340	310	Alok Barat	\N	\N	t
4341	310	Alok Timur	\N	\N	t
4342	310	Bola	\N	\N	t
4343	310	Doreng	\N	\N	t
4344	310	Hewokloang	\N	\N	t
4345	310	Kangae	\N	\N	t
4346	310	Kewapante	\N	\N	t
4347	310	Koting	\N	\N	t
4348	310	Lela	\N	\N	t
4349	310	Magepanda	\N	\N	t
4350	310	Mapitara	\N	\N	t
4351	310	Mego	\N	\N	t
4352	310	Nelle	\N	\N	t
4353	310	Nita	\N	\N	t
4354	310	Paga	\N	\N	t
4355	310	Palue	\N	\N	t
4356	310	Talibura	\N	\N	t
4357	310	Tana Wawo	\N	\N	t
4358	310	Waiblama	\N	\N	t
4359	310	Waigete	\N	\N	t
4360	311	Kota Waikabubak	\N	\N	t
4361	311	Laboya Barat	\N	\N	t
4362	311	Lamboya	\N	\N	t
4363	311	Loli	\N	\N	t
4364	311	Tana Righu	\N	\N	t
4365	311	Wanokaka	\N	\N	t
4366	312	Kodi	\N	\N	t
4367	312	Kodi Balaghar	\N	\N	t
4368	312	Kodi Bangedo	\N	\N	t
4369	312	Kodi Utara	\N	\N	t
4370	312	Kota Tambolaka	\N	\N	t
4371	312	Loura	\N	\N	t
4372	312	Wewewa Barat	\N	\N	t
4373	312	Wewewa Selatan	\N	\N	t
4374	312	Wewewa Tengah	\N	\N	t
4375	312	Wewewa Timur	\N	\N	t
4376	312	Wewewa Utara	\N	\N	t
4377	313	Katiku Tana	\N	\N	t
4378	313	Katiku Tana Selatan	\N	\N	t
4379	313	Mamboro	\N	\N	t
4380	313	Umbu Ratu Nggay	\N	\N	t
4381	313	Umbu Ratu Nggay Barat	\N	\N	t
4382	314	Haharu	\N	\N	t
4383	314	Kahaungu Eti	\N	\N	t
4384	314	Kambata Mapambuhang	\N	\N	t
4385	314	Kambera	\N	\N	t
4386	314	Kanatang	\N	\N	t
4387	314	Karera	\N	\N	t
4388	314	Katala Hamu Lingu	\N	\N	t
4389	314	Kota Waingapu	\N	\N	t
4390	314	Lewa	\N	\N	t
4391	314	Lewa Tidahu	\N	\N	t
4392	314	Mahu	\N	\N	t
4393	314	Matawai La Pawu	\N	\N	t
4394	314	Ngadu Ngala	\N	\N	t
4395	314	Nggaha Ori Angu	\N	\N	t
4396	314	Paberiwai	\N	\N	t
4397	314	Pahunga Lodu	\N	\N	t
4398	314	Pandawai	\N	\N	t
4399	314	Pinu Pahar	\N	\N	t
4400	314	Rindi	\N	\N	t
4401	314	Tabundung	\N	\N	t
4402	314	Umalulu	\N	\N	t
4403	314	Wulla Waijelu	\N	\N	t
4404	315	Biboki Anleu	\N	\N	t
4405	315	Biboki Feotleu	\N	\N	t
4406	315	Biboki Moenleu	\N	\N	t
4407	315	Biboki Selatan	\N	\N	t
4408	315	Biboki Tan Pah	\N	\N	t
4409	315	Biboki Utara	\N	\N	t
4410	315	Bikomi Nilulat	\N	\N	t
4411	315	Bikomi Selatan	\N	\N	t
4412	315	Bikomi Tengah	\N	\N	t
4413	315	Bikomi Utara	\N	\N	t
4414	315	Insana	\N	\N	t
4415	315	Insana Barat	\N	\N	t
4416	315	Insana Fafinesu	\N	\N	t
4417	315	Insana Tengah	\N	\N	t
4418	315	Insana Utara	\N	\N	t
4419	315	Kota Kefamenanu	\N	\N	t
4420	315	Miomaffo Tengah	\N	\N	t
4421	315	Miomafo Barat	\N	\N	t
4422	315	Miomafo Timur	\N	\N	t
4423	315	Musi	\N	\N	t
4424	315	Mutis	\N	\N	t
4425	315	Naibenu	\N	\N	t
4426	315	Noemuti	\N	\N	t
4427	315	Noemuti Timur	\N	\N	t
4428	316	Alak	\N	\N	t
4429	316	Kelapa Lima	\N	\N	t
4430	316	Kota Lama	\N	\N	t
4431	316	Kota Raja	\N	\N	t
4432	316	Maulafa	\N	\N	t
4433	316	Oebobo	\N	\N	t
4434	317	Arguni	\N	\N	t
4435	317	Bomberay	\N	\N	t
4436	317	Fak-Fak	\N	\N	t
4437	317	Fak-Fak Barat	\N	\N	t
4438	317	Fak-Fak Tengah	\N	\N	t
4439	317	Fak-Fak Timur	\N	\N	t
4440	317	Fakfak Timur Tengah	\N	\N	t
4441	317	Furwagi	\N	\N	t
4442	317	Karas	\N	\N	t
4443	317	Kayauni	\N	\N	t
4444	317	Kokas	\N	\N	t
4445	317	Kramongmongga	\N	\N	t
4446	317	Mbahamdandara	\N	\N	t
4447	317	Pariwari	\N	\N	t
4448	317	Teluk Patipi	\N	\N	t
4449	317	Tomage	\N	\N	t
4450	317	Wartutin	\N	\N	t
4451	318	Buruway	\N	\N	t
4452	318	Kaimana	\N	\N	t
4453	318	Kambrau	\N	\N	t
4454	318	Teluk Arguni Atas	\N	\N	t
4455	318	Teluk Arguni Bawah	\N	\N	t
4456	318	Teluk Etna	\N	\N	t
4457	318	Yamor	\N	\N	t
4458	319	Manokwari Barat	\N	\N	t
4459	319	Manokwari Selatan	\N	\N	t
4460	319	Manokwari Timur	\N	\N	t
4461	319	Manokwari Utara	\N	\N	t
4462	319	Masni	\N	\N	t
4463	319	Prafi	\N	\N	t
4464	319	Sidey	\N	\N	t
4465	319	Tanah Rubuh	\N	\N	t
4466	319	Warmare	\N	\N	t
4467	320	Dataran Isim	\N	\N	t
4468	320	Momi Waren	\N	\N	t
4469	320	Neney	\N	\N	t
4470	320	Oransbari	\N	\N	t
4471	320	Ransiki	\N	\N	t
4472	320	Tahota	\N	\N	t
4473	321	Aifat	\N	\N	t
4474	321	Aifat Selatan	\N	\N	t
4475	321	Aifat Timur	\N	\N	t
4476	321	Aifat Timur Jauh	\N	\N	t
4477	321	Aifat Timur Selatan	\N	\N	t
4478	321	Aifat Timur Tengah	\N	\N	t
4479	321	Aifat Utara	\N	\N	t
4480	321	Aitinyo	\N	\N	t
4481	321	Aitinyo Barat	\N	\N	t
4482	321	Aitinyo Raya	\N	\N	t
4483	321	Aitinyo Tengah	\N	\N	t
4484	321	Aitinyo Utara	\N	\N	t
4485	321	Ayamaru	\N	\N	t
4486	321	Ayamaru Barat	\N	\N	t
4487	321	Ayamaru Jaya	\N	\N	t
4488	321	Ayamaru Selatan	\N	\N	t
4489	321	Ayamaru Selatan Jaya	\N	\N	t
4490	321	Ayamaru Tengah	\N	\N	t
4491	321	Ayamaru Timur	\N	\N	t
4492	321	Ayamaru Timur Selatan	\N	\N	t
4493	321	Ayamaru Utara	\N	\N	t
4494	321	Ayamaru Utara Timur	\N	\N	t
4495	321	Mare	\N	\N	t
4496	321	Mare Selatan	\N	\N	t
4497	322	Anggi	\N	\N	t
4498	322	Anggi Gida	\N	\N	t
4499	322	Catubouw	\N	\N	t
4500	322	Didohu	\N	\N	t
4501	322	Hingk	\N	\N	t
4502	322	Membey	\N	\N	t
4503	322	Minyambaouw	\N	\N	t
4504	322	Sururey	\N	\N	t
4505	322	Taige	\N	\N	t
4506	322	Testega	\N	\N	t
4507	323	Ayau	\N	\N	t
4508	323	Batanta Selatan	\N	\N	t
4509	323	Batanta Utara	\N	\N	t
4510	323	Kepulauan Ayau	\N	\N	t
4511	323	Kepulauan Sembilan	\N	\N	t
4512	323	Kofiau	\N	\N	t
4513	323	Kota Waisai	\N	\N	t
4514	323	Meos Mansar	\N	\N	t
4515	323	Misool (Misool Utara)	\N	\N	t
4516	323	Misool Barat	\N	\N	t
4517	323	Misool Selatan	\N	\N	t
4518	323	Misool Timur	\N	\N	t
4519	323	Salawati Barat	\N	\N	t
4520	323	Salawati Tengah	\N	\N	t
4521	323	Salawati Utara	\N	\N	t
4522	323	Supnin	\N	\N	t
4523	323	Teluk Mayalibit	\N	\N	t
4524	323	Tiplol Mayalibit	\N	\N	t
4525	323	Waigeo Barat	\N	\N	t
4526	323	Waigeo Barat Kepulauan	\N	\N	t
4527	323	Waigeo Selatan	\N	\N	t
4528	323	Waigeo Timur	\N	\N	t
4529	323	Waigeo Utara	\N	\N	t
4530	323	Warwarbomi	\N	\N	t
4531	324	Aimas	\N	\N	t
4532	324	Beraur	\N	\N	t
4533	324	Klabot	\N	\N	t
4534	324	Klaili	\N	\N	t
4535	324	Klamono	\N	\N	t
4536	324	Klaso	\N	\N	t
4537	324	Klawak	\N	\N	t
4538	324	Makbon	\N	\N	t
4539	324	Mariat	\N	\N	t
4540	324	Maudus	\N	\N	t
4541	324	Mayamuk	\N	\N	t
4542	324	Moisegen	\N	\N	t
4543	324	Salawati	\N	\N	t
4544	324	Salawati Selatan	\N	\N	t
4545	324	Sayosa	\N	\N	t
4546	324	Seget	\N	\N	t
4547	324	Segun	\N	\N	t
4548	325	Fokour	\N	\N	t
4549	325	Inanwatan	\N	\N	t
4550	325	Kais	\N	\N	t
4551	325	Kokoda	\N	\N	t
4552	325	Kokoda Utara	\N	\N	t
4553	325	Konda	\N	\N	t
4554	325	Matemani	\N	\N	t
4555	325	Moswaren	\N	\N	t
4556	325	Saifi	\N	\N	t
4557	325	Sawiat	\N	\N	t
4558	325	Seremuk	\N	\N	t
4559	325	Teminabuan	\N	\N	t
4560	325	Wayer	\N	\N	t
4561	326	Abun	\N	\N	t
4562	326	Amberbaken	\N	\N	t
4563	326	Amberbaken Barat	\N	\N	t
4564	326	Ases	\N	\N	t
4565	326	Bamusbama	\N	\N	t
4566	326	Bikar	\N	\N	t
4567	326	Fef	\N	\N	t
4568	326	Ireres	\N	\N	t
4569	326	Kasi	\N	\N	t
4570	326	Kebar	\N	\N	t
4571	326	Kebar Selatan	\N	\N	t
4572	326	Kebar Timur	\N	\N	t
4573	326	Kwesefo	\N	\N	t
4574	326	Kwoor	\N	\N	t
4575	326	Manekar	\N	\N	t
4576	326	Mawabuan	\N	\N	t
4577	326	Miyah	\N	\N	t
4578	326	Miyah Selatan	\N	\N	t
4579	326	Moraid	\N	\N	t
4580	326	Mpur	\N	\N	t
4581	326	Mubrani	\N	\N	t
4582	326	Sausapor	\N	\N	t
4583	326	Selemkai	\N	\N	t
4584	326	Senopi	\N	\N	t
4585	326	Syujak	\N	\N	t
4586	326	Tinggouw	\N	\N	t
4587	326	Tobouw	\N	\N	t
4588	326	Wilhem Roumbouts	\N	\N	t
4589	326	Yembun	\N	\N	t
4590	327	Aranday	\N	\N	t
4591	327	Aroba	\N	\N	t
4592	327	Babo	\N	\N	t
4593	327	Bintuni	\N	\N	t
4594	327	Biscoop	\N	\N	t
4595	327	Dataran Beimes	\N	\N	t
4596	327	Fafurwar	\N	\N	t
4597	327	Kaitaro	\N	\N	t
4598	327	Kamundan	\N	\N	t
4599	327	Kuri	\N	\N	t
4600	327	Manimeri	\N	\N	t
4601	327	Masyeta	\N	\N	t
4602	327	Merdey	\N	\N	t
4603	327	Meyado	\N	\N	t
4604	327	Moskona Barat	\N	\N	t
4605	327	Moskona Selatan	\N	\N	t
4606	327	Moskona Timur	\N	\N	t
4607	327	Moskona Utara	\N	\N	t
4608	327	Sumuri	\N	\N	t
4609	327	Tembuni	\N	\N	t
4610	327	Tomu	\N	\N	t
4611	327	Tuhiba	\N	\N	t
4612	327	Wamesa	\N	\N	t
4613	327	Weriagar	\N	\N	t
4614	328	Kuri Wamesa	\N	\N	t
4615	328	Naikere	\N	\N	t
4616	328	Nikiwar	\N	\N	t
4617	328	Rasiei	\N	\N	t
4618	328	Roon	\N	\N	t
4619	328	Roswar	\N	\N	t
4620	328	Rumberpon	\N	\N	t
4621	328	Soug Jaya	\N	\N	t
4622	328	Teluk Duairi	\N	\N	t
4623	328	Wamesa	\N	\N	t
4624	328	Wasior	\N	\N	t
4625	328	Windesi	\N	\N	t
4626	328	Wondiboy	\N	\N	t
4627	329	Klaurung	\N	\N	t
4628	329	Maladum Mes	\N	\N	t
4629	329	Malaimsimsa	\N	\N	t
4630	329	Sorong	\N	\N	t
4631	329	Sorong Barat	\N	\N	t
4632	329	Sorong Kepulauan	\N	\N	t
4633	329	Sorong Kota	\N	\N	t
4634	329	Sorong Manoi	\N	\N	t
4635	329	Sorong Timur	\N	\N	t
4636	329	Sorong Utara	\N	\N	t
4637	330	Aboy	\N	\N	t
4638	330	Alemsom	\N	\N	t
4639	330	Awinbon	\N	\N	t
4640	330	Batani	\N	\N	t
4641	330	Batom	\N	\N	t
4642	330	Bime	\N	\N	t
4643	330	Borme	\N	\N	t
4644	330	Eipumek	\N	\N	t
4645	330	Iwur	\N	\N	t
4646	330	Jetfa	\N	\N	t
4647	330	Kalomdol	\N	\N	t
4648	330	Kawor	\N	\N	t
4649	330	Kiwirok	\N	\N	t
4650	330	Kiwirok Timur	\N	\N	t
4651	330	Mofinop	\N	\N	t
4652	330	Murkim	\N	\N	t
4653	330	Nongme	\N	\N	t
4654	330	Ok Aom	\N	\N	t
4655	330	Okbab	\N	\N	t
4656	330	Okbape	\N	\N	t
4657	330	Okbemtau	\N	\N	t
4658	330	Okbibab	\N	\N	t
4659	330	Okhika	\N	\N	t
4660	330	Oklip	\N	\N	t
4661	330	Oksamol	\N	\N	t
4662	330	Oksebang	\N	\N	t
4663	330	Oksibil	\N	\N	t
4664	330	Oksop	\N	\N	t
4665	330	Pamek	\N	\N	t
4666	330	Pepera	\N	\N	t
4667	330	Serambakon	\N	\N	t
4668	330	Tarup	\N	\N	t
4669	330	Teiraplu	\N	\N	t
4670	330	Weime	\N	\N	t
4671	331	Agats	\N	\N	t
4672	331	Akat	\N	\N	t
4673	331	Atsj	\N	\N	t
4674	331	Ayip	\N	\N	t
4675	331	Betcbamu	\N	\N	t
4676	331	Der Koumur	\N	\N	t
4677	331	Fayit	\N	\N	t
4678	331	Jetsy	\N	\N	t
4679	331	Joerat	\N	\N	t
4680	331	Kolf Braza	\N	\N	t
4681	331	Kopay	\N	\N	t
4682	331	Pantai Kasuari	\N	\N	t
4683	331	Pulau Tiga	\N	\N	t
4684	331	Safan	\N	\N	t
4685	331	Sawa Erma	\N	\N	t
4686	331	Sirets	\N	\N	t
4687	331	Suator	\N	\N	t
4688	331	Suru-suru	\N	\N	t
4689	331	Unir Sirau	\N	\N	t
4690	332	Aimando Padaido	\N	\N	t
4691	332	Andey	\N	\N	t
4692	332	Biak Barat	\N	\N	t
4693	332	Biak Kota	\N	\N	t
4694	332	Biak Timur	\N	\N	t
4695	332	Biak Utara	\N	\N	t
4696	332	Bondifuar	\N	\N	t
4697	332	Bruyadori	\N	\N	t
4698	332	Numfor Barat	\N	\N	t
4699	332	Numfor Timur	\N	\N	t
4700	332	Oridek	\N	\N	t
4701	332	Orkeri	\N	\N	t
4702	332	Padaido	\N	\N	t
4703	332	Poiru	\N	\N	t
4704	332	Samofa	\N	\N	t
4705	332	Swandiwe	\N	\N	t
4706	332	Warsa	\N	\N	t
4707	332	Yawosi	\N	\N	t
4708	332	Yendidori	\N	\N	t
4709	333	Ambatkwi	\N	\N	t
4710	333	Arimop	\N	\N	t
4711	333	Bomakia	\N	\N	t
4712	333	Firiwage	\N	\N	t
4713	333	Fofi	\N	\N	t
4714	333	Iniyandit	\N	\N	t
4715	333	Jair	\N	\N	t
4716	333	Kawagit	\N	\N	t
4717	333	Ki	\N	\N	t
4718	333	Kombay	\N	\N	t
4719	333	Kombut	\N	\N	t
4720	333	Kouh	\N	\N	t
4721	333	Mandobo	\N	\N	t
4722	333	Manggelum	\N	\N	t
4723	333	Mindiptana	\N	\N	t
4724	333	Ninati	\N	\N	t
4725	333	Sesnuk	\N	\N	t
4726	333	Subur	\N	\N	t
4727	333	Waropko	\N	\N	t
4728	333	Yaniruma	\N	\N	t
4729	334	Bowobado	\N	\N	t
4730	334	Kapiraya	\N	\N	t
4731	334	Tigi	\N	\N	t
4732	334	Tigi Barat	\N	\N	t
4733	334	Tigi Timur	\N	\N	t
4734	335	Dogiyai	\N	\N	t
4735	335	Kamu	\N	\N	t
4736	335	Kamu Selatan	\N	\N	t
4737	335	Kamu Timur	\N	\N	t
4738	335	Kamu Utara	\N	\N	t
4739	335	Mapia	\N	\N	t
4740	335	Mapia Barat	\N	\N	t
4741	335	Mapia Tengah	\N	\N	t
4742	335	Piyaiye	\N	\N	t
4743	335	Sukikai Selatan	\N	\N	t
4744	336	Agisiga	\N	\N	t
4745	336	Biandoga	\N	\N	t
4746	336	Hitadipa	\N	\N	t
4747	336	Homeyo	\N	\N	t
4748	336	Sugapa	\N	\N	t
4749	336	Tomosiga	\N	\N	t
4750	336	Ugimba	\N	\N	t
4751	336	Wandai	\N	\N	t
4752	337	Airu	\N	\N	t
4753	337	Demta	\N	\N	t
4754	337	Depapre	\N	\N	t
4755	337	Ebungfa	\N	\N	t
4756	337	Gresi Selatan	\N	\N	t
4757	337	Kaureh	\N	\N	t
4758	337	Kemtuk	\N	\N	t
4759	337	Kemtuk Gresi	\N	\N	t
4760	337	Nambluong	\N	\N	t
4761	337	Nimbokrang	\N	\N	t
4762	337	Nimboran	\N	\N	t
4763	337	Raveni Rara	\N	\N	t
4764	337	Sentani	\N	\N	t
4765	337	Sentani Barat	\N	\N	t
4766	337	Sentani Timur	\N	\N	t
4767	337	Unurum Guay	\N	\N	t
4768	337	Waibu	\N	\N	t
4769	337	Yapsi	\N	\N	t
4770	337	Yokari	\N	\N	t
4771	338	Asologaima	\N	\N	t
4772	338	Asolokobal	\N	\N	t
4773	338	Asotipo	\N	\N	t
4774	338	Bolakme	\N	\N	t
4775	338	Bpiri	\N	\N	t
4776	338	Bugi	\N	\N	t
4777	338	Hubikiak	\N	\N	t
4778	338	Hubikosi	\N	\N	t
4779	338	Ibele	\N	\N	t
4780	338	Itlay Hisage	\N	\N	t
4781	338	Koragi	\N	\N	t
4782	338	Kurulu	\N	\N	t
4783	338	Libarek	\N	\N	t
4784	338	Maima	\N	\N	t
4785	338	Molagalome	\N	\N	t
4786	338	Muliama	\N	\N	t
4787	338	Musatfak	\N	\N	t
4788	338	Napua	\N	\N	t
4789	338	Pelebaga	\N	\N	t
4790	338	Piramid	\N	\N	t
4791	338	Pisugi	\N	\N	t
4792	338	Popugoba	\N	\N	t
4793	338	Siepkosi	\N	\N	t
4794	338	Silo Karno Doga	\N	\N	t
4795	338	Taelarek	\N	\N	t
4796	338	Tagime	\N	\N	t
4797	338	Tagineri	\N	\N	t
4798	338	Trikora	\N	\N	t
4799	338	Usilimo	\N	\N	t
4800	338	Wadangku	\N	\N	t
4801	338	Walaik	\N	\N	t
4802	338	Walelagama	\N	\N	t
4803	338	Wame	\N	\N	t
4804	338	Wamena	\N	\N	t
4805	338	Welesi	\N	\N	t
4806	338	Wesaput	\N	\N	t
4807	338	Wita Waya	\N	\N	t
4808	338	Wolo	\N	\N	t
4809	338	Wouma	\N	\N	t
4810	338	Yalengga	\N	\N	t
4811	339	Arso	\N	\N	t
4812	339	Arso Timur	\N	\N	t
4813	339	Senggi	\N	\N	t
4814	339	Skanto	\N	\N	t
4815	339	Towe	\N	\N	t
4816	339	Waris	\N	\N	t
4817	339	Web	\N	\N	t
4818	340	Angkaisera	\N	\N	t
4819	340	Kepulauan Ambai	\N	\N	t
4820	340	Kosiwo	\N	\N	t
4821	340	Poom	\N	\N	t
4822	340	Pulau Kurudu	\N	\N	t
4823	340	Pulau Yerui	\N	\N	t
4824	340	Raimbawi	\N	\N	t
4825	340	Teluk Ampimoi	\N	\N	t
4826	340	Windesi	\N	\N	t
4827	340	Wonawa	\N	\N	t
4828	340	Yapen Barat	\N	\N	t
4829	340	Yapen Selatan	\N	\N	t
4830	340	Yapen Timur	\N	\N	t
4831	340	Yapen Utara	\N	\N	t
4832	341	Awina	\N	\N	t
4833	341	Ayumnati	\N	\N	t
4834	341	Balingga	\N	\N	t
4835	341	Balingga Barat	\N	\N	t
4836	341	Bruwa	\N	\N	t
4837	341	Buguk Gona	\N	\N	t
4838	341	Dimba	\N	\N	t
4839	341	Gamelia	\N	\N	t
4840	341	Gelok Beam	\N	\N	t
4841	341	Goa Balim	\N	\N	t
4842	341	Gollo	\N	\N	t
4843	341	Guna	\N	\N	t
4844	341	Gupura	\N	\N	t
4845	341	Karu	\N	\N	t
4846	341	Kelulome	\N	\N	t
4847	341	Kolawa	\N	\N	t
4848	341	Kuly Lanny	\N	\N	t
4849	341	Kuyawage	\N	\N	t
4850	341	Lannyna	\N	\N	t
4851	341	Makki	\N	\N	t
4852	341	Melagi	\N	\N	t
4853	341	Melagineri	\N	\N	t
4854	341	Milimbo	\N	\N	t
4855	341	Mokoni	\N	\N	t
4856	341	Muara	\N	\N	t
4857	341	Nikogwe	\N	\N	t
4858	341	Niname	\N	\N	t
4859	341	Nogi	\N	\N	t
4860	341	Pirime	\N	\N	t
4861	341	Poga	\N	\N	t
4862	341	Tiom	\N	\N	t
4863	341	Tiom Ollo	\N	\N	t
4864	341	Tiomneri	\N	\N	t
4865	341	Wano Barat	\N	\N	t
4866	341	Wereka	\N	\N	t
4867	341	Wiringgambut	\N	\N	t
4868	341	Yiginua	\N	\N	t
4869	341	Yiluk	\N	\N	t
4870	341	Yugungwi	\N	\N	t
4871	342	Benuki	\N	\N	t
4872	342	Mamberamo Hilir	\N	\N	t
4873	342	Mamberamo Hulu	\N	\N	t
4874	342	Mamberamo Tengah	\N	\N	t
4875	342	Mamberamo Tengah Timur	\N	\N	t
4876	342	Rufaer	\N	\N	t
4877	342	Sawai	\N	\N	t
4878	342	Waropen Atas	\N	\N	t
4879	343	Eragayam	\N	\N	t
4880	343	Ilugwa	\N	\N	t
4881	343	Kelila	\N	\N	t
4882	343	Kobagma	\N	\N	t
4883	343	Megambilis	\N	\N	t
4884	344	Assue	\N	\N	t
4885	344	Bamgi	\N	\N	t
4886	344	Citak-Mitak	\N	\N	t
4887	344	Edera	\N	\N	t
4888	344	Haju	\N	\N	t
4889	344	Kaibar	\N	\N	t
4890	344	Mambioman Bapai	\N	\N	t
4891	344	Minyamur	\N	\N	t
4892	344	Obaa	\N	\N	t
4893	344	Passue	\N	\N	t
4894	344	Passue Bawah	\N	\N	t
4895	344	Syahcame	\N	\N	t
4896	344	Ti Zain	\N	\N	t
4897	344	Venaha	\N	\N	t
4898	344	Yakomi	\N	\N	t
4899	345	Animha	\N	\N	t
4900	345	Elikobal	\N	\N	t
4901	345	Ilwayab	\N	\N	t
4902	345	Jagebob	\N	\N	t
4903	345	Kaptel	\N	\N	t
4904	345	Kimaam	\N	\N	t
4905	345	Kurik	\N	\N	t
4906	345	Malind	\N	\N	t
4907	345	Merauke	\N	\N	t
4908	345	Muting	\N	\N	t
4909	345	Naukenjerai	\N	\N	t
4910	345	Ngguti	\N	\N	t
4911	345	Okaba	\N	\N	t
4912	345	Semangga	\N	\N	t
4913	345	Sota	\N	\N	t
4914	345	Tabonji	\N	\N	t
4915	345	Tanah Miring	\N	\N	t
4916	345	Tubang	\N	\N	t
4917	345	Ulilin	\N	\N	t
4918	345	Waan	\N	\N	t
4919	346	Agimuga	\N	\N	t
4920	346	Alama	\N	\N	t
4921	346	Amar	\N	\N	t
4922	346	Hoya	\N	\N	t
4923	346	Iwaka	\N	\N	t
4924	346	Jila	\N	\N	t
4925	346	Jita	\N	\N	t
4926	346	Kuala Kencana	\N	\N	t
4927	346	Kwamki Narama	\N	\N	t
4928	346	Mimika Barat	\N	\N	t
4929	346	Mimika Barat Jauh	\N	\N	t
4930	346	Mimika Barat Tengah	\N	\N	t
4931	346	Mimika Baru	\N	\N	t
4932	346	Mimika Tengah	\N	\N	t
4933	346	Mimika Timur	\N	\N	t
4934	346	Mimika Timur Jauh	\N	\N	t
4935	346	Tembagapura	\N	\N	t
4936	346	Wania	\N	\N	t
4937	347	Dipa	\N	\N	t
4938	347	Makimi	\N	\N	t
4939	347	Menou	\N	\N	t
4940	347	Moora	\N	\N	t
4941	347	Nabire	\N	\N	t
4942	347	Nabire Barat	\N	\N	t
4943	347	Napan	\N	\N	t
4944	347	Siriwo	\N	\N	t
4945	347	Teluk Kimi	\N	\N	t
4946	347	Teluk Umar	\N	\N	t
4947	347	Uwapa	\N	\N	t
4948	347	Wanggar	\N	\N	t
4949	347	Wapoga	\N	\N	t
4950	347	Yaro	\N	\N	t
4951	347	Yaur	\N	\N	t
4952	348	Alama	\N	\N	t
4953	348	Dal	\N	\N	t
4954	348	Embetpen	\N	\N	t
4955	348	Gearek	\N	\N	t
4956	348	Geselma	\N	\N	t
4957	348	Inikgal	\N	\N	t
4958	348	Iniye	\N	\N	t
4959	348	Kegayem	\N	\N	t
4960	348	Kenyam	\N	\N	t
4961	348	Kilmid	\N	\N	t
4962	348	Kora	\N	\N	t
4963	348	Koroptak	\N	\N	t
4964	348	Krepkuri	\N	\N	t
4965	348	Mam	\N	\N	t
4966	348	Mapenduma	\N	\N	t
4967	348	Mbua Tengah	\N	\N	t
4968	348	Mbulmu Yalma	\N	\N	t
4969	348	Mbuwa	\N	\N	t
4970	348	Mebarok	\N	\N	t
4971	348	Moba	\N	\N	t
4972	348	Mugi	\N	\N	t
4973	348	Nenggeagin	\N	\N	t
4974	348	Nirkuri	\N	\N	t
4975	348	Paro	\N	\N	t
4976	348	Pasir Putih	\N	\N	t
4977	348	Pija	\N	\N	t
4978	348	Wosak	\N	\N	t
4979	348	Wusi	\N	\N	t
4980	348	Wutpaga	\N	\N	t
4981	348	Yal	\N	\N	t
4982	348	Yenggelo	\N	\N	t
4983	348	Yigi	\N	\N	t
4984	349	Aradide	\N	\N	t
4985	349	Bibida	\N	\N	t
4986	349	Bogabaida	\N	\N	t
4987	349	Dumadama	\N	\N	t
4988	349	Ekadide	\N	\N	t
4989	349	Kebo	\N	\N	t
4990	349	Paniai Barat	\N	\N	t
4991	349	Paniai Timur	\N	\N	t
4992	349	Siriwo	\N	\N	t
4993	349	Yatamo	\N	\N	t
4994	350	Agandugume	\N	\N	t
4995	350	Beoga	\N	\N	t
4996	350	Doufo	\N	\N	t
4997	350	Gome	\N	\N	t
4998	350	Ilaga	\N	\N	t
4999	350	Pogoma	\N	\N	t
5000	350	Sinak	\N	\N	t
5001	350	Wangbe	\N	\N	t
5002	351	Dagai	\N	\N	t
5003	351	Dokome	\N	\N	t
5004	351	Fawi	\N	\N	t
5005	351	Gubume	\N	\N	t
5006	351	Gurage	\N	\N	t
5007	351	Ilamburawi	\N	\N	t
5008	351	Ilu	\N	\N	t
5009	351	Irimuli	\N	\N	t
5010	351	Kalome	\N	\N	t
5011	351	Kiyage	\N	\N	t
5012	351	Lumo	\N	\N	t
5013	351	Mewoluk	\N	\N	t
5014	351	Molanikime	\N	\N	t
5015	351	Muara	\N	\N	t
5016	351	Mulia	\N	\N	t
5017	351	Nioga	\N	\N	t
5018	351	Nume	\N	\N	t
5019	351	Pagaleme	\N	\N	t
5020	351	Taganombak	\N	\N	t
5021	351	Tingginambut	\N	\N	t
5022	351	Torere	\N	\N	t
5023	351	Waegi	\N	\N	t
5024	351	Wanwi	\N	\N	t
5025	351	Yambi	\N	\N	t
5026	351	Yamo	\N	\N	t
5027	351	Yamoneri	\N	\N	t
5028	352	Apawer Hulu	\N	\N	t
5029	352	Bonggo	\N	\N	t
5030	352	Bonggo Timur	\N	\N	t
5031	352	Pantai Barat	\N	\N	t
5032	352	Pantai Timur	\N	\N	t
5033	352	Pantai Timur Bagian Barat	\N	\N	t
5034	352	Sarmi	\N	\N	t
5035	352	Sarmi Selatan	\N	\N	t
5036	352	Sarmi Timur	\N	\N	t
5037	352	Tor Atas	\N	\N	t
5038	353	Kepulauan Aruri	\N	\N	t
5039	353	Supiori Barat	\N	\N	t
5040	353	Supiori Selatan	\N	\N	t
5041	353	Supiori Timur	\N	\N	t
5042	353	Supiori Utara	\N	\N	t
5043	354	Airgaram	\N	\N	t
5044	354	Anawi	\N	\N	t
5045	354	Aweku	\N	\N	t
5046	354	Bewani	\N	\N	t
5047	354	Biuk	\N	\N	t
5048	354	Bogonuk	\N	\N	t
5049	354	Bokondini	\N	\N	t
5050	354	Bokoneri	\N	\N	t
5051	354	Danime	\N	\N	t
5052	354	Dow	\N	\N	t
5053	354	Dundu	\N	\N	t
5054	354	Egiam	\N	\N	t
5055	354	Geya	\N	\N	t
5056	354	Gika	\N	\N	t
5057	354	Gilubandu	\N	\N	t
5058	354	Goyage	\N	\N	t
5059	354	Gundagi	\N	\N	t
5060	354	Kai	\N	\N	t
5061	354	Kamboneri	\N	\N	t
5062	354	Kanggime	\N	\N	t
5063	354	Karubaga	\N	\N	t
5064	354	Kembu	\N	\N	t
5065	354	Konda/ Kondaga	\N	\N	t
5066	354	Kuari	\N	\N	t
5067	354	Kubu	\N	\N	t
5068	354	Li Anogomma	\N	\N	t
5069	354	Nabunage	\N	\N	t
5070	354	Nelawi	\N	\N	t
5071	354	Numba	\N	\N	t
5072	354	Nunggawi	\N	\N	t
5073	354	Panaga	\N	\N	t
5074	354	Poganeri	\N	\N	t
5075	354	Tagime	\N	\N	t
5076	354	Tagineri	\N	\N	t
5077	354	Telenggeme	\N	\N	t
5078	354	Timori	\N	\N	t
5079	354	Umagi	\N	\N	t
5080	354	Wakuwo	\N	\N	t
5081	354	Wari/Taiyeve II	\N	\N	t
5082	354	Wenam	\N	\N	t
5083	354	Wina	\N	\N	t
5084	354	Woniki	\N	\N	t
5085	354	Wugi	\N	\N	t
5086	354	Wunim	\N	\N	t
5087	354	Yuko	\N	\N	t
5088	354	Yuneri	\N	\N	t
5089	355	Demba	\N	\N	t
5090	355	Inggerus	\N	\N	t
5091	355	Kirihi	\N	\N	t
5092	355	Masirei	\N	\N	t
5093	355	Oudate	\N	\N	t
5094	355	Risei Sayati	\N	\N	t
5095	355	Soyoi Mambai	\N	\N	t
5096	355	Urei Faisei	\N	\N	t
5097	355	Wapoga	\N	\N	t
5098	355	Waropen Bawah	\N	\N	t
5099	355	Wonti	\N	\N	t
5100	356	Amuma	\N	\N	t
5101	356	Anggruk	\N	\N	t
5102	356	Bomela	\N	\N	t
5103	356	Dekai	\N	\N	t
5104	356	Dirwemna	\N	\N	t
5105	356	Duram	\N	\N	t
5106	356	Endomen	\N	\N	t
5107	356	Hereapini	\N	\N	t
5108	356	Hilipuk	\N	\N	t
5109	356	Hogio	\N	\N	t
5110	356	Holuon	\N	\N	t
5111	356	Kabianggama	\N	\N	t
5112	356	Kayo	\N	\N	t
5113	356	Kona	\N	\N	t
5114	356	Korupun	\N	\N	t
5115	356	Kosarek	\N	\N	t
5116	356	Kurima	\N	\N	t
5117	356	Kwelemdua	\N	\N	t
5118	356	Kwikma	\N	\N	t
5119	356	Langda	\N	\N	t
5120	356	Lolat	\N	\N	t
5121	356	Mugi	\N	\N	t
5122	356	Musaik	\N	\N	t
5123	356	Nalca	\N	\N	t
5124	356	Ninia	\N	\N	t
5125	356	Nipsan	\N	\N	t
5126	356	Obio	\N	\N	t
5127	356	Panggema	\N	\N	t
5128	356	Pasema	\N	\N	t
5129	356	Pronggoli	\N	\N	t
5130	356	Puldama	\N	\N	t
5131	356	Samenage	\N	\N	t
5132	356	Sela	\N	\N	t
5133	356	Seredela	\N	\N	t
5134	356	Silimo	\N	\N	t
5135	356	Soba	\N	\N	t
5136	356	Sobaham	\N	\N	t
5137	356	Soloikma	\N	\N	t
5138	356	Sumo	\N	\N	t
5139	356	Suntamon	\N	\N	t
5140	356	Suru Suru	\N	\N	t
5141	356	Talambo	\N	\N	t
5142	356	Tangma	\N	\N	t
5143	356	Ubahak	\N	\N	t
5144	356	Ubalihi	\N	\N	t
5145	356	Ukha	\N	\N	t
5146	356	Walma	\N	\N	t
5147	356	Werima	\N	\N	t
5148	356	Wusama	\N	\N	t
5149	356	Yahuliambut	\N	\N	t
5150	356	Yogosem	\N	\N	t
5151	357	Abenaho	\N	\N	t
5152	357	Apalapsili	\N	\N	t
5153	357	Benawa	\N	\N	t
5154	357	Elelim	\N	\N	t
5155	357	Welarek	\N	\N	t
5156	358	Abepura	\N	\N	t
5157	358	Heram	\N	\N	t
5158	358	Jayapura Selatan	\N	\N	t
5159	358	Jayapura Utara	\N	\N	t
5160	358	Muara Tami	\N	\N	t
5161	359	Bantan	\N	\N	t
5162	359	Bengkalis	\N	\N	t
5163	359	Bukit Batu	\N	\N	t
5164	359	Mandau	\N	\N	t
5165	359	Pinggir	\N	\N	t
5166	359	Rupat	\N	\N	t
5167	359	Rupat Utara	\N	\N	t
5168	359	Siak Kecil	\N	\N	t
5169	360	Batang Tuaka	\N	\N	t
5170	360	Concong	\N	\N	t
5171	360	Enok	\N	\N	t
5172	360	Gaung	\N	\N	t
5173	360	Gaung Anak Serka	\N	\N	t
5174	360	Kateman	\N	\N	t
5175	360	Kempas	\N	\N	t
5176	360	Kemuning	\N	\N	t
5177	360	Keritang	\N	\N	t
5178	360	Kuala Indragiri	\N	\N	t
5179	360	Mandah	\N	\N	t
5180	360	Pelangiran	\N	\N	t
5181	360	Pulau Burung	\N	\N	t
5182	360	Reteh	\N	\N	t
5183	360	Sungai Batang	\N	\N	t
5184	360	Tanah Merah	\N	\N	t
5185	360	Teluk Belengkong	\N	\N	t
5186	360	Tembilahan	\N	\N	t
5187	360	Tembilahan Hulu	\N	\N	t
5188	360	Tempuling	\N	\N	t
5189	361	Batang Cenaku	\N	\N	t
5190	361	Batang Gangsal	\N	\N	t
5191	361	Batang Peranap	\N	\N	t
5192	361	Kelayang	\N	\N	t
5193	361	Kuala Cenaku	\N	\N	t
5194	361	Lirik	\N	\N	t
5195	361	Lubuk Batu Jaya	\N	\N	t
5196	361	Pasir Penyu	\N	\N	t
5197	361	Peranap	\N	\N	t
5198	361	Rakit Kulim	\N	\N	t
5199	361	Rengat	\N	\N	t
5200	361	Rengat Barat	\N	\N	t
5201	361	Siberida	\N	\N	t
5202	361	Sungai Lala	\N	\N	t
5203	362	Bangkinang	\N	\N	t
5204	362	Bangkinang Kota	\N	\N	t
5205	362	Gunung Sahilan	\N	\N	t
5206	362	Kampar	\N	\N	t
5207	362	Kampar Kiri	\N	\N	t
5208	362	Kampar Kiri Hilir	\N	\N	t
5209	362	Kampar Kiri Hulu	\N	\N	t
5210	362	Kampar Kiri Tengah	\N	\N	t
5211	362	Kampar Timur	\N	\N	t
5212	362	Kampar Utara	\N	\N	t
5213	362	Koto Kampar Hulu	\N	\N	t
5214	362	Kuok	\N	\N	t
5215	362	Perhentian Raja	\N	\N	t
5216	362	Rumbio Jaya	\N	\N	t
5217	362	Salo	\N	\N	t
5218	362	Siak Hulu	\N	\N	t
5219	362	Tambang	\N	\N	t
5220	362	Tapung	\N	\N	t
5221	362	Tapung Hilir	\N	\N	t
5222	362	Tapung Hulu	\N	\N	t
5223	362	XIII Koto Kampar	\N	\N	t
5224	363	Merbau	\N	\N	t
5225	363	Pulaumerbau	\N	\N	t
5226	363	Rangsang	\N	\N	t
5227	363	Rangsang Barat	\N	\N	t
5228	363	Rangsang Pesisir	\N	\N	t
5229	363	Tasik Putri Puyu	\N	\N	t
5230	363	Tebing Tinggi	\N	\N	t
5231	363	Tebing Tinggi Barat	\N	\N	t
5232	363	Tebing Tinggi Timur	\N	\N	t
5233	364	Benai	\N	\N	t
5234	364	Cerenti	\N	\N	t
5235	364	Gunungtoar	\N	\N	t
5236	364	Hulu Kuantan	\N	\N	t
5237	364	Inuman	\N	\N	t
5238	364	Kuantan Hilir	\N	\N	t
5239	364	Kuantan Hilir Seberang	\N	\N	t
5240	364	Kuantan Mudik	\N	\N	t
5241	364	Kuantan Tengah	\N	\N	t
5242	364	Logas Tanah Darat	\N	\N	t
5243	364	Pangean	\N	\N	t
5244	364	Pucuk Rantau	\N	\N	t
5245	364	Sentajo Raya	\N	\N	t
5246	364	Singingi	\N	\N	t
5247	364	Singingi Hilir	\N	\N	t
5248	365	Bandar Petalangan	\N	\N	t
5249	365	Bandar Sei Kijang	\N	\N	t
5250	365	Bunut	\N	\N	t
5251	365	Kerumutan	\N	\N	t
5252	365	Kuala Kampar	\N	\N	t
5253	365	Langgam	\N	\N	t
5254	365	Pangkalan Kerinci	\N	\N	t
5255	365	Pangkalan Kuras	\N	\N	t
5256	365	Pangkalan Lesung	\N	\N	t
5257	365	Pelalawan	\N	\N	t
5258	365	Teluk Meranti	\N	\N	t
5259	365	Ukui	\N	\N	t
5260	366	Bagan Sinembah	\N	\N	t
5261	366	Bangko	\N	\N	t
5262	366	Bangko Pusako	\N	\N	t
5263	366	Batu Hampar	\N	\N	t
5264	366	Kubu	\N	\N	t
5265	366	Kubu Babussalam	\N	\N	t
5266	366	Pasir Limau Kapas	\N	\N	t
5267	366	Pekaitan	\N	\N	t
5268	366	Pujud	\N	\N	t
5269	366	Rantau Kopar	\N	\N	t
5270	366	Rimba Melintang	\N	\N	t
5271	366	Simpang Kanan	\N	\N	t
5272	366	Sinaboi	\N	\N	t
5273	366	Tanah Putih	\N	\N	t
5274	366	Tanah Putih Tanjung Melawan	\N	\N	t
5275	367	Bangun Purba	\N	\N	t
5276	367	Bonai Darussalam	\N	\N	t
5277	367	Kabun	\N	\N	t
5278	367	Kepenuhan	\N	\N	t
5279	367	Kepenuhan Hulu	\N	\N	t
5280	367	Kunto Darussalam	\N	\N	t
5281	367	Pagaran Tapah Darussalam	\N	\N	t
5282	367	Pendalian IV Koto	\N	\N	t
5283	367	Rambah	\N	\N	t
5284	367	Rambah Hilir	\N	\N	t
5285	367	Rambah Samo	\N	\N	t
5286	367	Rokan IV Koto	\N	\N	t
5287	367	Tambusai	\N	\N	t
5288	367	Tambusai Utara	\N	\N	t
5289	367	Tandun	\N	\N	t
5290	367	Ujung Batu	\N	\N	t
5291	368	Bunga Raya	\N	\N	t
5292	368	Dayun	\N	\N	t
5293	368	Kandis	\N	\N	t
5294	368	Kerinci Kanan	\N	\N	t
5295	368	Koto Gasib	\N	\N	t
5296	368	Lubuk Dalam	\N	\N	t
5297	368	Mempura	\N	\N	t
5298	368	Minas	\N	\N	t
5299	368	Pusako	\N	\N	t
5300	368	Sabak Auh	\N	\N	t
5301	368	Siak	\N	\N	t
5302	368	Sungai Apit	\N	\N	t
5303	368	Sungai Mandau	\N	\N	t
5304	368	Tualang	\N	\N	t
5305	369	Bukit Kapur	\N	\N	t
5306	369	Dumai Barat	\N	\N	t
5307	369	Dumai Kota	\N	\N	t
5308	369	Dumai Selatan	\N	\N	t
5309	369	Dumai Timur	\N	\N	t
5310	369	Medang Kampai	\N	\N	t
5311	369	Sungai Sembilan	\N	\N	t
5312	370	Bukit Raya	\N	\N	t
5313	370	Lima Puluh	\N	\N	t
5314	370	Marpoyan Damai	\N	\N	t
5315	370	Payung Sekaki	\N	\N	t
5316	370	Pekanbaru Kota	\N	\N	t
5317	370	Rumbai	\N	\N	t
5318	370	Rumbai Pesisir	\N	\N	t
5319	370	Sail	\N	\N	t
5320	370	Senapelan	\N	\N	t
5321	370	Sukajadi	\N	\N	t
5322	370	Tampan	\N	\N	t
5323	370	Tenayan Raya	\N	\N	t
5324	371	Banggae	\N	\N	t
5325	371	Banggae Timur	\N	\N	t
5326	371	Malunda	\N	\N	t
5327	371	Pamboang	\N	\N	t
5328	371	Sendana	\N	\N	t
5329	371	Tammerodo Sendana	\N	\N	t
5330	371	Tubo Sendana	\N	\N	t
5331	371	Ulumanda	\N	\N	t
5332	372	Aralle	\N	\N	t
5333	372	Balla	\N	\N	t
5334	372	Bambang	\N	\N	t
5335	372	Buntumalangka	\N	\N	t
5336	372	Mamasa	\N	\N	t
5337	372	Mambi	\N	\N	t
5338	372	Mehalaan	\N	\N	t
5339	372	Messawa	\N	\N	t
5340	372	Nosu	\N	\N	t
5341	372	Pana	\N	\N	t
5342	372	Rantebulahan Timur	\N	\N	t
5343	372	Sesenapadang	\N	\N	t
5344	372	Sumarorong	\N	\N	t
5345	372	Tabang	\N	\N	t
5346	372	Tabulahan	\N	\N	t
5347	372	Tanduk Kalua	\N	\N	t
5348	372	Tawalian	\N	\N	t
5349	373	Bonehau	\N	\N	t
5350	373	Kalukku	\N	\N	t
5351	373	Kalumpang	\N	\N	t
5352	373	Kep. Bala Balakang	\N	\N	t
5353	373	Mamuju	\N	\N	t
5354	373	Papalang	\N	\N	t
5355	373	Sampaga	\N	\N	t
5356	373	Simboro dan Kepulauan	\N	\N	t
5357	373	Tapalang	\N	\N	t
5358	373	Tapalang Barat	\N	\N	t
5359	373	Tommo	\N	\N	t
5360	374	Budong-Budong	\N	\N	t
5361	374	Karossa	\N	\N	t
5362	374	Pangale	\N	\N	t
5363	374	Tobadak	\N	\N	t
5364	374	Topoyo	\N	\N	t
5365	375	Bambaira	\N	\N	t
5366	375	Bambalamotu	\N	\N	t
5367	375	Baras	\N	\N	t
5368	375	Bulu Taba	\N	\N	t
5369	375	Dapurang	\N	\N	t
5370	375	Duripoku	\N	\N	t
5371	375	Lariang	\N	\N	t
5372	375	Pasangkayu	\N	\N	t
5373	375	Pedongga	\N	\N	t
5374	375	Sarjo	\N	\N	t
5375	375	Sarudu	\N	\N	t
5376	375	Tikke Raya	\N	\N	t
5377	376	Allu	\N	\N	t
5378	376	Anreapi	\N	\N	t
5379	376	Balanipa	\N	\N	t
5380	376	Binuang	\N	\N	t
5381	376	Bulo	\N	\N	t
5382	376	Campalagian	\N	\N	t
5383	376	Limboro	\N	\N	t
5384	376	Luyo	\N	\N	t
5385	376	Mapilli	\N	\N	t
5386	376	Matakali	\N	\N	t
5387	376	Matangnga	\N	\N	t
5388	376	Polewali	\N	\N	t
5389	376	Tapango	\N	\N	t
5390	376	Tinambung	\N	\N	t
5391	376	Tutar	\N	\N	t
5392	376	Wonomulyo	\N	\N	t
5393	377	Bantaeng	\N	\N	t
5394	377	Bissappu	\N	\N	t
5395	377	Eremerasa	\N	\N	t
5396	377	Gantarang Keke	\N	\N	t
5397	377	Pajukukang	\N	\N	t
5398	377	Sinoa	\N	\N	t
5399	377	Tompo Bulu	\N	\N	t
5400	377	Uluere	\N	\N	t
5401	378	Balusu	\N	\N	t
5402	378	Barru	\N	\N	t
5403	378	Mallusetasi	\N	\N	t
5404	378	Pujananting	\N	\N	t
5405	378	Soppeng Riaja	\N	\N	t
5406	378	Tanete Riaja	\N	\N	t
5407	378	Tanete Rilau	\N	\N	t
5408	379	Ajangale	\N	\N	t
5409	379	Amali	\N	\N	t
5410	379	Awangpone	\N	\N	t
5411	379	Barebbo	\N	\N	t
5412	379	Bengo	\N	\N	t
5413	379	Bontocani	\N	\N	t
5414	379	Cenrana	\N	\N	t
5415	379	Cina	\N	\N	t
5416	379	Dua Boccoe	\N	\N	t
5417	379	Kahu	\N	\N	t
5418	379	Kajuara	\N	\N	t
5419	379	Lamuru	\N	\N	t
5420	379	Lappariaja	\N	\N	t
5421	379	Libureng	\N	\N	t
5422	379	Mare	\N	\N	t
5423	379	Palakka	\N	\N	t
5424	379	Patimpeng	\N	\N	t
5425	379	Ponre	\N	\N	t
5426	379	Salomekko	\N	\N	t
5427	379	Sibulue	\N	\N	t
5428	379	Tanete Riattang	\N	\N	t
5429	379	Tanete Riattang Barat	\N	\N	t
5430	379	Tanete Riattang Timur	\N	\N	t
5431	379	Tellu Siattinge	\N	\N	t
5432	379	Tellulimpoe	\N	\N	t
5433	379	Tonra	\N	\N	t
5434	379	Ulaweng	\N	\N	t
5435	380	Bonto Bahari	\N	\N	t
5436	380	Bonto Tiro	\N	\N	t
5437	380	Bulukumpa	\N	\N	t
5438	380	Gantorang	\N	\N	t
5439	380	Herlang	\N	\N	t
5440	380	Kajang	\N	\N	t
5441	380	Kindang	\N	\N	t
5442	380	Rilauale	\N	\N	t
5443	380	Ujung Bulu	\N	\N	t
5444	380	Ujungloe	\N	\N	t
5445	381	Alla	\N	\N	t
5446	381	Anggeraja	\N	\N	t
5447	381	Baraka	\N	\N	t
5448	381	Baroko	\N	\N	t
5449	381	Bungin	\N	\N	t
5450	381	Buntu Batu	\N	\N	t
5451	381	Cendana	\N	\N	t
5452	381	Curio	\N	\N	t
5453	381	Enrekang	\N	\N	t
5454	381	Maiwa	\N	\N	t
5455	381	Malua	\N	\N	t
5456	381	Masalle	\N	\N	t
5457	382	Bajeng	\N	\N	t
5458	382	Bajeng Barat	\N	\N	t
5459	382	Barombong	\N	\N	t
5460	382	Biringbulu	\N	\N	t
5461	382	Bontolempangang	\N	\N	t
5462	382	Bontomarannu	\N	\N	t
5463	382	Bontonompo	\N	\N	t
5464	382	Bontonompo Selatan	\N	\N	t
5465	382	Bungaya	\N	\N	t
5466	382	Manuju	\N	\N	t
5467	382	Palangga	\N	\N	t
5468	382	Parangloe	\N	\N	t
5469	382	Parigi	\N	\N	t
5470	382	Pattalasang	\N	\N	t
5471	382	Somba Upu	\N	\N	t
5472	382	Tinggimoncong	\N	\N	t
5473	382	Tombolopao	\N	\N	t
5474	382	Tompobullu	\N	\N	t
5475	383	Arungkeke	\N	\N	t
5476	383	Bangkala	\N	\N	t
5477	383	Bangkala Barat	\N	\N	t
5478	383	Batang	\N	\N	t
5479	383	Binamu	\N	\N	t
5480	383	Bontoramba	\N	\N	t
5481	383	Kelara	\N	\N	t
5482	383	Rumbia	\N	\N	t
5483	383	Tamalatea	\N	\N	t
5484	383	Tarowang	\N	\N	t
5485	383	Turatea	\N	\N	t
5486	384	Benteng	\N	\N	t
5487	384	Bontoharu	\N	\N	t
5488	384	Bontomanai	\N	\N	t
5489	384	Bontomatene	\N	\N	t
5490	384	Bontosikuyu	\N	\N	t
5491	384	Buki	\N	\N	t
5492	384	Pasilambena	\N	\N	t
5493	384	Pasimarannu	\N	\N	t
5494	384	Pasimasunggu	\N	\N	t
5495	384	Pasimasunggu Timur	\N	\N	t
5496	384	Taka Bonerate	\N	\N	t
5497	385	Bajo	\N	\N	t
5498	385	Bajo Barat	\N	\N	t
5499	385	Basse Sangtempe	\N	\N	t
5500	385	Basse Sangtempe Utara	\N	\N	t
5501	385	Belopa	\N	\N	t
5502	385	Belopa Utara	\N	\N	t
5503	385	Bua	\N	\N	t
5504	385	Bua Ponrang	\N	\N	t
5505	385	Kamanre	\N	\N	t
5506	385	Lamasi	\N	\N	t
5507	385	Lamasi Timur	\N	\N	t
5508	385	Larompong	\N	\N	t
5509	385	Larompong Selatan	\N	\N	t
5510	385	Latimojong	\N	\N	t
5511	385	Ponrang	\N	\N	t
5512	385	Ponrang Selatan	\N	\N	t
5513	385	Suli	\N	\N	t
5514	385	Suli Barat	\N	\N	t
5515	385	Walenrang	\N	\N	t
5516	385	Walenrang Barat	\N	\N	t
5517	385	Walenrang Timur	\N	\N	t
5518	385	Walenrang Utara	\N	\N	t
5519	386	Angkona	\N	\N	t
5520	386	Burau	\N	\N	t
5521	386	Kalaena	\N	\N	t
5522	386	Malili	\N	\N	t
5523	386	Mangkutana	\N	\N	t
5524	386	Nuha	\N	\N	t
5525	386	Tomoni	\N	\N	t
5526	386	Tomoni Timur	\N	\N	t
5527	386	Towuti	\N	\N	t
5528	386	Wasuponda	\N	\N	t
5529	386	Wotu	\N	\N	t
5530	387	Baebunta	\N	\N	t
5531	387	Bone Bone	\N	\N	t
5532	387	Limbong	\N	\N	t
5533	387	Malangke	\N	\N	t
5534	387	Malangke Barat	\N	\N	t
5535	387	Mappedeceng	\N	\N	t
5536	387	Masamba	\N	\N	t
5537	387	Rampi	\N	\N	t
5538	387	Sabbang	\N	\N	t
5539	387	Seko	\N	\N	t
5540	387	Sukamaju	\N	\N	t
5541	387	Tana Lili	\N	\N	t
5542	388	Bantimurung	\N	\N	t
5543	388	Bontoa	\N	\N	t
5544	388	Camba	\N	\N	t
5545	388	Cenrana	\N	\N	t
5546	388	Lau	\N	\N	t
5547	388	Malllawa	\N	\N	t
5548	388	Mandai	\N	\N	t
5549	388	Maros Baru	\N	\N	t
5550	388	Marusu	\N	\N	t
5551	388	Moncong Loe	\N	\N	t
5552	388	Simbang	\N	\N	t
5553	388	Tanralili	\N	\N	t
5554	388	Tompobulu	\N	\N	t
5555	388	Turikale	\N	\N	t
5556	389	Balocci	\N	\N	t
5557	389	Bungoro	\N	\N	t
5558	389	Labakkang	\N	\N	t
5559	389	Liukang Kalmas	\N	\N	t
5560	389	Liukang Tangaya	\N	\N	t
5561	389	Liukang Tupabbiring	\N	\N	t
5562	389	Liukang Tupabbiring Utara	\N	\N	t
5563	389	Mandalle	\N	\N	t
5564	389	Marang	\N	\N	t
5565	389	Minasa Tene	\N	\N	t
5566	389	Pangkajene	\N	\N	t
5567	389	Segeri	\N	\N	t
5568	389	Tondong Tallasa	\N	\N	t
5569	390	Batu Lappa	\N	\N	t
5570	390	Cempa	\N	\N	t
5571	390	Duampanua	\N	\N	t
5572	390	Lansirang	\N	\N	t
5573	390	Lembang	\N	\N	t
5574	390	Matirro Sompe	\N	\N	t
5575	390	Mattiro Bulu	\N	\N	t
5576	390	Paleteang	\N	\N	t
5577	390	Patampanua	\N	\N	t
5578	390	Suppa	\N	\N	t
5579	390	Tiroang	\N	\N	t
5580	390	Watang Sawito	\N	\N	t
5581	391	Baranti	\N	\N	t
5582	391	Dua Pitue	\N	\N	t
5583	391	Kulo	\N	\N	t
5584	391	Maritengngae	\N	\N	t
5585	391	Panca Lautan	\N	\N	t
5586	391	Panca Rijang	\N	\N	t
5587	391	Pitu Raise	\N	\N	t
5588	391	Pitu Riawa	\N	\N	t
5589	391	Tellu Limpoe	\N	\N	t
5590	391	WT. Sidenreng	\N	\N	t
5591	391	Watang Pulu	\N	\N	t
5592	392	Bulupoddo	\N	\N	t
5593	392	Pulau Sembilan	\N	\N	t
5594	392	Sinjai Barat	\N	\N	t
5595	392	Sinjai Borong	\N	\N	t
5596	392	Sinjai Selatan	\N	\N	t
5597	392	Sinjai Tengah	\N	\N	t
5598	392	Sinjai Timur	\N	\N	t
5599	392	Sinjai Utara	\N	\N	t
5600	392	Tellu Limpoe	\N	\N	t
5601	393	Citta	\N	\N	t
5602	393	Donri Donri	\N	\N	t
5603	393	Ganra	\N	\N	t
5604	393	Lalabata	\N	\N	t
5605	393	Liliraja	\N	\N	t
5606	393	Lilirilau	\N	\N	t
5607	393	Marioriawa	\N	\N	t
5608	393	Marioriwawo	\N	\N	t
5609	394	Galesong	\N	\N	t
5610	394	Galesong Selatan	\N	\N	t
5611	394	Galesong Utara	\N	\N	t
5612	394	Mangarabombang	\N	\N	t
5613	394	Mappakasunggu	\N	\N	t
5614	394	Pattallassang	\N	\N	t
5615	394	Polombangkeng Selatan	\N	\N	t
5616	394	Polombangkeng Utara	\N	\N	t
5617	394	Sanrobone	\N	\N	t
5618	395	Bittuang	\N	\N	t
5619	395	Bonggakaradeng	\N	\N	t
5620	395	Gandangbatu Sillanan	\N	\N	t
5621	395	Kurra	\N	\N	t
5622	395	Makale	\N	\N	t
5623	395	Makale Selatan	\N	\N	t
5624	395	Makale Utara	\N	\N	t
5625	395	Malimbong Balepe	\N	\N	t
5626	395	Mappak	\N	\N	t
5627	395	Masanda	\N	\N	t
5628	395	Mengkendek	\N	\N	t
5629	395	Rano	\N	\N	t
5630	395	Rantetayo	\N	\N	t
5631	395	Rembon	\N	\N	t
5632	395	Saluputi	\N	\N	t
5633	395	Sangalla	\N	\N	t
5634	395	Sangalla Selatan	\N	\N	t
5635	395	Sangalla Utara	\N	\N	t
5636	395	Simbuang	\N	\N	t
5637	396	Awan Rante Karua	\N	\N	t
5638	396	Balusu	\N	\N	t
5639	396	Bangkelekila	\N	\N	t
5640	396	Baruppu	\N	\N	t
5641	396	Buntao	\N	\N	t
5642	396	Buntu Pepasan	\N	\N	t
5643	396	Dende' Piongan Napo	\N	\N	t
5644	396	Kapala Pitu	\N	\N	t
5645	396	Kesu	\N	\N	t
5646	396	Nanggala	\N	\N	t
5647	396	Rantebua	\N	\N	t
5648	396	Rantepao	\N	\N	t
5649	396	Rindingallo	\N	\N	t
5650	396	Sa'dan	\N	\N	t
5651	396	Sanggalangi	\N	\N	t
5652	396	Sesean	\N	\N	t
5653	396	Sesean Suloara	\N	\N	t
5654	396	Sopai	\N	\N	t
5655	396	Tallunglipu	\N	\N	t
5656	396	Tikala	\N	\N	t
5657	396	Tondon	\N	\N	t
5658	397	Belawa	\N	\N	t
5659	397	Bola	\N	\N	t
5660	397	Gilireng	\N	\N	t
5661	397	Keera	\N	\N	t
5662	397	Majauleng	\N	\N	t
5663	397	Maniangpajo	\N	\N	t
5664	397	Pammana	\N	\N	t
5665	397	Penrang	\N	\N	t
5666	397	Pitumpanua	\N	\N	t
5667	397	Sabangparu	\N	\N	t
5668	397	Sajoanging	\N	\N	t
5669	397	Takkalalla	\N	\N	t
5670	397	Tanasitolo	\N	\N	t
5671	397	Tempe	\N	\N	t
5672	398	Biringkanaya	\N	\N	t
5673	398	Bontoala	\N	\N	t
5674	398	Makasar	\N	\N	t
5675	398	Mamajang	\N	\N	t
5676	398	Manggala	\N	\N	t
5677	398	Mariso	\N	\N	t
5678	398	Panakukkang	\N	\N	t
5679	398	Rappocini	\N	\N	t
5680	398	Tallo	\N	\N	t
5681	398	Tamalanrea	\N	\N	t
5682	398	Tamalate	\N	\N	t
5683	398	Ujung Pandang	\N	\N	t
5684	398	Ujung Tanah	\N	\N	t
5685	398	Wajo	\N	\N	t
5686	399	Bara	\N	\N	t
5687	399	Mungkajang	\N	\N	t
5688	399	Sendana	\N	\N	t
5689	399	Telluwanua	\N	\N	t
5690	399	Wara	\N	\N	t
5691	399	Wara Barat	\N	\N	t
5692	399	Wara Selatan	\N	\N	t
5693	399	Wara Timur	\N	\N	t
5694	399	Wara Utara	\N	\N	t
5695	400	Bacukiki	\N	\N	t
5696	400	Bacukiki Barat	\N	\N	t
5697	400	Soreang	\N	\N	t
5698	400	Ujung	\N	\N	t
5699	401	Balantak	\N	\N	t
5700	401	Balantak Selatan	\N	\N	t
5701	401	Balantak Utara	\N	\N	t
5702	401	Batui	\N	\N	t
5703	401	Batui Selatan	\N	\N	t
5704	401	Bualemo	\N	\N	t
5705	401	Bunta	\N	\N	t
5706	401	Kintom	\N	\N	t
5707	401	Lamala	\N	\N	t
5708	401	Lobu	\N	\N	t
5709	401	Luwuk	\N	\N	t
5710	401	Luwuk Selatan	\N	\N	t
5711	401	Luwuk Timur	\N	\N	t
5712	401	Luwuk Utara	\N	\N	t
5713	401	Mantoh	\N	\N	t
5714	401	Masama	\N	\N	t
5715	401	Moilong	\N	\N	t
5716	401	Nambo	\N	\N	t
5717	401	Nuhon	\N	\N	t
5718	401	Pagimana	\N	\N	t
5719	401	Simpang Raya	\N	\N	t
5720	401	Toili	\N	\N	t
5721	401	Toili Barat	\N	\N	t
5722	402	Buko	\N	\N	t
5723	402	Buko Selatan	\N	\N	t
5724	402	Bulagi	\N	\N	t
5725	402	Bulagi Selatan	\N	\N	t
5726	402	Bulagi Utara	\N	\N	t
5727	402	Liang	\N	\N	t
5728	402	Peling Tengah	\N	\N	t
5729	402	Tinangkung	\N	\N	t
5730	402	Tinangkung Selatan	\N	\N	t
5731	402	Tinangkung Utara	\N	\N	t
5732	402	Totikum	\N	\N	t
5733	402	Totikum Selatan	\N	\N	t
5734	403	Banggai	\N	\N	t
5735	403	Banggai Selatan	\N	\N	t
5736	403	Banggai Tengah	\N	\N	t
5737	403	Banggai Utara	\N	\N	t
5738	403	Bangkurung	\N	\N	t
5739	403	Bokan Kepulauan	\N	\N	t
5740	403	Labobo	\N	\N	t
5741	404	Biau	\N	\N	t
5742	404	Bokat	\N	\N	t
5743	404	Bukal	\N	\N	t
5744	404	Bunobogu	\N	\N	t
5745	404	Gadung	\N	\N	t
5746	404	Karamat	\N	\N	t
5747	404	Lakea	\N	\N	t
5748	404	Momunu	\N	\N	t
5749	404	Paleleh	\N	\N	t
5750	404	Paleleh Barat	\N	\N	t
5751	404	Tiloan	\N	\N	t
5752	405	Balaesang	\N	\N	t
5753	405	Balaesang Tanjung	\N	\N	t
5754	405	Banawa	\N	\N	t
5755	405	Banawa Selatan	\N	\N	t
5756	405	Banawa Tengah	\N	\N	t
5757	405	Dampelas	\N	\N	t
5758	405	Labuan	\N	\N	t
5759	405	Panembani	\N	\N	t
5760	405	Rio Pakava	\N	\N	t
5761	405	Sindue	\N	\N	t
5762	405	Sindue Tobata	\N	\N	t
5763	405	Sindue Tombusabora	\N	\N	t
5764	405	Sirenja	\N	\N	t
5765	405	Sojol	\N	\N	t
5766	405	Sojol Utara	\N	\N	t
5767	405	Tanantovea	\N	\N	t
5768	406	Bahodopi	\N	\N	t
5769	406	Bumi Raya	\N	\N	t
5770	406	Bungku Barat	\N	\N	t
5771	406	Bungku Pesisir	\N	\N	t
5772	406	Bungku Selatan	\N	\N	t
5773	406	Bungku Tengah	\N	\N	t
5774	406	Bungku Timur	\N	\N	t
5775	406	Menui Kepulauan	\N	\N	t
5776	406	Wita Ponda	\N	\N	t
5777	407	Bungku Utara	\N	\N	t
5778	407	Lembo	\N	\N	t
5779	407	Lembo Raya	\N	\N	t
5780	407	Mamosalato	\N	\N	t
5781	407	Mori Atas	\N	\N	t
5782	407	Mori Utara	\N	\N	t
5783	407	Petasia	\N	\N	t
5784	407	Petasia Timur	\N	\N	t
5785	407	Soyo Jaya	\N	\N	t
5786	408	Ampibabo	\N	\N	t
5787	408	Balinggi	\N	\N	t
5788	408	Bolano	\N	\N	t
5789	408	Bolano Lambunu	\N	\N	t
5790	408	Kasimbar	\N	\N	t
5791	408	Mepanga	\N	\N	t
5792	408	Moutong	\N	\N	t
5793	408	Ongka Malino	\N	\N	t
5794	408	Palasa	\N	\N	t
5795	408	Parigi	\N	\N	t
5796	408	Parigi Barat	\N	\N	t
5797	408	Parigi Selatan	\N	\N	t
5798	408	Parigi Tengah	\N	\N	t
5799	408	Parigi Utara	\N	\N	t
5800	408	Sausu	\N	\N	t
5801	408	Sidoan	\N	\N	t
5802	408	Siniu	\N	\N	t
5803	408	Taopa	\N	\N	t
5804	408	Tinombo	\N	\N	t
5805	408	Tinombo Selatan	\N	\N	t
5806	408	Tomini	\N	\N	t
5807	408	Toribulu	\N	\N	t
5808	408	Torue	\N	\N	t
5809	409	Lage	\N	\N	t
5810	409	Lore Barat	\N	\N	t
5811	409	Lore Piore	\N	\N	t
5812	409	Lore Selatan	\N	\N	t
5813	409	Lore Tengah	\N	\N	t
5814	409	Lore Timur	\N	\N	t
5815	409	Lore Utara	\N	\N	t
5816	409	Pamona Barat	\N	\N	t
5817	409	Pamona Puselemba	\N	\N	t
5818	409	Pamona Selatan	\N	\N	t
5819	409	Pamona Tenggara	\N	\N	t
5820	409	Pamona Timur	\N	\N	t
5821	409	Pamona Utara	\N	\N	t
5822	409	Poso Kota	\N	\N	t
5823	409	Poso Kota Selatan	\N	\N	t
5824	409	Poso Kota Utara	\N	\N	t
5825	409	Poso Pesisir	\N	\N	t
5826	409	Poso Pesisir Selatan	\N	\N	t
5827	409	Poso Pesisir Utara	\N	\N	t
5828	410	Dolo	\N	\N	t
5829	410	Dolo Barat	\N	\N	t
5830	410	Dolo Selatan	\N	\N	t
5831	410	Gumbasa	\N	\N	t
5832	410	Kinovaro	\N	\N	t
5833	410	Kulawi	\N	\N	t
5834	410	Kulawi Selatan	\N	\N	t
5835	410	Lindu	\N	\N	t
5836	410	Marawola	\N	\N	t
5837	410	Marawola Barat	\N	\N	t
5838	410	Nokilalaki	\N	\N	t
5839	410	Palolo	\N	\N	t
5840	410	Pipikoro	\N	\N	t
5841	410	Sigi Biromaru	\N	\N	t
5842	410	Tanambulava	\N	\N	t
5843	411	Ampana Kota	\N	\N	t
5844	411	Ampana Tete	\N	\N	t
5845	411	Batudaka	\N	\N	t
5846	411	Ratolindo	\N	\N	t
5847	411	Talatako	\N	\N	t
5848	411	Togean	\N	\N	t
5849	411	Tojo	\N	\N	t
5850	411	Tojo Barat	\N	\N	t
5851	411	Ulubongka	\N	\N	t
5852	411	Una Una	\N	\N	t
5853	411	Walea Besar	\N	\N	t
5854	411	Walea Kepulauan	\N	\N	t
5855	412	Baolan	\N	\N	t
5856	412	Basidondo	\N	\N	t
5857	412	Dako Pemean	\N	\N	t
5858	412	Dampal Selatan	\N	\N	t
5859	412	Dampal Utara	\N	\N	t
5860	412	Dondo	\N	\N	t
5861	412	Galang	\N	\N	t
5862	412	Lampasio	\N	\N	t
5863	412	Ogodeide	\N	\N	t
5864	412	Toli-Toli Utara	\N	\N	t
5865	413	Mantikulore	\N	\N	t
5866	413	Palu Barat	\N	\N	t
5867	413	Palu Selatan	\N	\N	t
5868	413	Palu Timur	\N	\N	t
5869	413	Palu Utara	\N	\N	t
5870	413	Tatanga	\N	\N	t
5871	413	Tawaeli	\N	\N	t
5872	413	Ulujadi	\N	\N	t
5873	414	Kabaena	\N	\N	t
5874	414	Kabaena Barat	\N	\N	t
5875	414	Kabaena Selatan	\N	\N	t
5876	414	Kabaena Tengah	\N	\N	t
5877	414	Kabaena Timur	\N	\N	t
5878	414	Kabaena Utara	\N	\N	t
5879	414	Kep. Masaloka Raya	\N	\N	t
5880	414	Lantari Jaya	\N	\N	t
5881	414	Mata Oleo	\N	\N	t
5882	414	Mata Usu	\N	\N	t
5883	414	Poleang	\N	\N	t
5884	414	Poleang Barat	\N	\N	t
5885	414	Poleang Selatan	\N	\N	t
5886	414	Poleang Tengah	\N	\N	t
5887	414	Poleang Tenggara	\N	\N	t
5888	414	Poleang Timur	\N	\N	t
5889	414	Poleang Utara	\N	\N	t
5890	414	Rarowatu	\N	\N	t
5891	414	Rarowatu Utara	\N	\N	t
5892	414	Rumbia	\N	\N	t
5893	414	Rumbia Tengah	\N	\N	t
5894	414	Tontonunu	\N	\N	t
5895	415	Kapontori	\N	\N	t
5896	415	Lasalimu	\N	\N	t
5897	415	Lasalimu Selatan	\N	\N	t
5898	415	Pasarwajo	\N	\N	t
5899	415	Siotapina	\N	\N	t
5900	415	Wabula	\N	\N	t
5901	415	Wolowa	\N	\N	t
5902	416	Batauga	\N	\N	t
5903	416	Batu Atas	\N	\N	t
5904	416	Kadatua	\N	\N	t
5905	416	Lapandewa	\N	\N	t
5906	416	Sampolawa	\N	\N	t
5907	416	Siompu	\N	\N	t
5908	416	Siompu Barat	\N	\N	t
5909	417	Gu	\N	\N	t
5910	417	Lakudo	\N	\N	t
5911	417	Mawasangka	\N	\N	t
5912	417	Mawasangka Tengah	\N	\N	t
5913	417	Mawasangka Timur	\N	\N	t
5914	417	Sangia Wambulu	\N	\N	t
5915	417	Talaga Raya	\N	\N	t
5916	418	Bonegunu	\N	\N	t
5917	418	Kambowa	\N	\N	t
5918	418	Kulisusu	\N	\N	t
5919	418	Kulisusu Barat	\N	\N	t
5920	418	Kulisusu Utara	\N	\N	t
5921	418	Wakorumba Utara	\N	\N	t
5922	419	Baula	\N	\N	t
5923	419	Iwoimendaa	\N	\N	t
5924	419	Kolaka	\N	\N	t
5925	419	Latambaga	\N	\N	t
5926	419	Polinggona	\N	\N	t
5927	419	Pomalaa	\N	\N	t
5928	419	Samaturu	\N	\N	t
5929	419	Tanggetada	\N	\N	t
5930	419	Toari	\N	\N	t
5931	419	Watubangga	\N	\N	t
5932	419	Wolo	\N	\N	t
5933	419	Wundulako	\N	\N	t
5934	420	Aere	\N	\N	t
5935	420	Dangia	\N	\N	t
5936	420	Ladongi	\N	\N	t
5937	420	Lalolae	\N	\N	t
5938	420	Lambandia	\N	\N	t
5939	420	Loea	\N	\N	t
5940	420	Mowewe	\N	\N	t
5941	420	Poli Polia	\N	\N	t
5942	420	Tinondo	\N	\N	t
5943	420	Tirawuta	\N	\N	t
5944	420	Ueesi	\N	\N	t
5945	420	Uluiwoi	\N	\N	t
5946	421	Batu Putih	\N	\N	t
5947	421	Katoi	\N	\N	t
5948	421	Kodeoha	\N	\N	t
5949	421	Lambai	\N	\N	t
5950	421	Lasusua	\N	\N	t
5951	421	Ngapa	\N	\N	t
5952	421	Pakue	\N	\N	t
5953	421	Pakue Tengah	\N	\N	t
5954	421	Pakue Utara	\N	\N	t
5955	421	Porehu	\N	\N	t
5956	421	Rante Angin	\N	\N	t
5957	421	Tiwu	\N	\N	t
5958	421	Tolala	\N	\N	t
5959	421	Watunohu	\N	\N	t
5960	421	Wawo	\N	\N	t
5961	422	Abuki	\N	\N	t
5962	422	Amonggedo	\N	\N	t
5963	422	Anggaberi	\N	\N	t
5964	422	Asinua	\N	\N	t
5965	422	Besulutu	\N	\N	t
5966	422	Bondoala	\N	\N	t
5967	422	Kapoiala	\N	\N	t
5968	422	Konawe	\N	\N	t
5969	422	Lalonggasumeeto	\N	\N	t
5970	422	Lambuya	\N	\N	t
5971	422	Latoma	\N	\N	t
5972	422	Meluhu	\N	\N	t
5973	422	Onembute	\N	\N	t
5974	422	Pondidaha	\N	\N	t
5975	422	Puriala	\N	\N	t
5976	422	Routa	\N	\N	t
5977	422	Sampara	\N	\N	t
5978	422	Soropia	\N	\N	t
5979	422	Tongauna	\N	\N	t
5980	422	Uepai	\N	\N	t
5981	422	Unaaha	\N	\N	t
5982	422	Wawotobi	\N	\N	t
5983	422	Wonggeduku	\N	\N	t
5984	423	Wawonii Barat	\N	\N	t
5985	423	Wawonii Selatan	\N	\N	t
5986	423	Wawonii Tengah	\N	\N	t
5987	423	Wawonii Tenggara	\N	\N	t
5988	423	Wawonii Timur	\N	\N	t
5989	423	Wawonii Timur Laut	\N	\N	t
5990	423	Wawonii Utara	\N	\N	t
5991	424	Andoolo	\N	\N	t
5992	424	Angata	\N	\N	t
5993	424	Baito	\N	\N	t
5994	424	Basala	\N	\N	t
5995	424	Benua	\N	\N	t
5996	424	Buke	\N	\N	t
5997	424	Kolono	\N	\N	t
5998	424	Konda	\N	\N	t
5999	424	Laeya	\N	\N	t
6000	424	Lainea	\N	\N	t
6001	424	Lalembuu	\N	\N	t
6002	424	Landono	\N	\N	t
6003	424	Laonti	\N	\N	t
6004	424	Moramo	\N	\N	t
6005	424	Moramo Utara	\N	\N	t
6006	424	Mowila	\N	\N	t
6007	424	Palangga	\N	\N	t
6008	424	Palangga Selatan	\N	\N	t
6009	424	Ranomeeto	\N	\N	t
6010	424	Ranomeeto Barat	\N	\N	t
6011	424	Tinanggea	\N	\N	t
6012	424	Wolasi	\N	\N	t
6013	425	Andowia	\N	\N	t
6014	425	Asera	\N	\N	t
6015	425	Langgikima	\N	\N	t
6016	425	Lasolo	\N	\N	t
6017	425	Lembo	\N	\N	t
6018	425	Molawe	\N	\N	t
6019	425	Motui	\N	\N	t
6020	425	Oheo	\N	\N	t
6021	425	Sawa	\N	\N	t
6022	425	Wiwirano	\N	\N	t
6023	426	Batalaiwaru	\N	\N	t
6024	426	Batukara	\N	\N	t
6025	426	Bone	\N	\N	t
6026	426	Duruka	\N	\N	t
6027	426	Kabangka	\N	\N	t
6028	426	Kabawo	\N	\N	t
6029	426	Katobu	\N	\N	t
6030	426	Kontu Kowuna	\N	\N	t
6031	426	Kontunaga	\N	\N	t
6032	426	Lasalepa	\N	\N	t
6033	426	Lohia	\N	\N	t
6034	426	Maligano	\N	\N	t
6035	426	Marobo	\N	\N	t
6036	426	Napabalano	\N	\N	t
6037	426	Parigi	\N	\N	t
6038	426	Pasi Kolaga	\N	\N	t
6039	426	Pasir Putih	\N	\N	t
6040	426	Tongkuno	\N	\N	t
6041	426	Tongkuno Selatan	\N	\N	t
6042	426	Towea	\N	\N	t
6043	426	Wakorumba Selatan	\N	\N	t
6044	426	Watopute	\N	\N	t
6045	427	Barangka	\N	\N	t
6046	427	Kusambi	\N	\N	t
6047	427	Lawa	\N	\N	t
6048	427	Maginti	\N	\N	t
6049	427	Napano Kusambi	\N	\N	t
6050	427	Sawerigadi	\N	\N	t
6051	427	Tiworo Kepulauan	\N	\N	t
6052	427	Tiworo Selatan	\N	\N	t
6053	427	Tiworo Tengah	\N	\N	t
6054	427	Tiworo Utara	\N	\N	t
6055	427	Wadaga	\N	\N	t
6056	428	Binongko	\N	\N	t
6057	428	Kaledupa	\N	\N	t
6058	428	Kaledupa Selatan	\N	\N	t
6059	428	Togo Binongko	\N	\N	t
6060	428	Tomia	\N	\N	t
6061	428	Tomia Timur	\N	\N	t
6062	428	Wangi Wangi Selatan	\N	\N	t
6063	428	Wangi-Wangi	\N	\N	t
6064	429	Batupoaro	\N	\N	t
6065	429	Betoambari	\N	\N	t
6066	429	Bungi	\N	\N	t
6067	429	Kokalukuna	\N	\N	t
6068	429	Lea-Lea	\N	\N	t
6069	429	Murhum	\N	\N	t
6070	429	Sora Walio	\N	\N	t
6071	429	Wolio	\N	\N	t
6072	430	Abeli	\N	\N	t
6073	430	Baruga	\N	\N	t
6074	430	Kadia	\N	\N	t
6075	430	Kambu	\N	\N	t
6076	430	Kendari	\N	\N	t
6077	430	Kendari Barat	\N	\N	t
6078	430	Mandonga	\N	\N	t
6079	430	Poasia	\N	\N	t
6080	430	Puuwatu	\N	\N	t
6081	430	Wua-Wua	\N	\N	t
6082	431	Bilalang	\N	\N	t
6083	431	Bolaang	\N	\N	t
6084	431	Bolaang Timur	\N	\N	t
6085	431	Dumoga	\N	\N	t
6086	431	Dumoga Barat	\N	\N	t
6087	431	Dumoga Tengah	\N	\N	t
6088	431	Dumoga Tenggara	\N	\N	t
6089	431	Dumoga Timur	\N	\N	t
6090	431	Dumoga Utara	\N	\N	t
6091	431	Lolak	\N	\N	t
6092	431	Lolayan	\N	\N	t
6093	431	Passi Barat	\N	\N	t
6094	431	Passi Timur	\N	\N	t
6095	431	Poigar	\N	\N	t
6096	431	Sang Tombolang	\N	\N	t
6097	432	Bolaang Uki	\N	\N	t
6098	432	Pinolosian	\N	\N	t
6099	432	Pinolosian Tengah	\N	\N	t
6100	432	Pinolosian Timur	\N	\N	t
6101	432	Posigadan	\N	\N	t
6102	433	Kotabunan	\N	\N	t
6103	433	Modayag	\N	\N	t
6104	433	Modayag Barat	\N	\N	t
6105	433	Nuangan	\N	\N	t
6106	433	Tutuyan	\N	\N	t
6107	434	Bintauna	\N	\N	t
6108	434	Bolangitang Barat	\N	\N	t
6109	434	Bolangitang Timur	\N	\N	t
6110	434	Kaidipang	\N	\N	t
6111	434	Pinogaluman	\N	\N	t
6112	434	Sangkub	\N	\N	t
6113	435	Biaro	\N	\N	t
6114	435	Siau Barat	\N	\N	t
6115	435	Siau Barat Selatan	\N	\N	t
6116	435	Siau Barat Utara	\N	\N	t
6117	435	Siau Tengah	\N	\N	t
6118	435	Siau Timur	\N	\N	t
6119	435	Siau Timur Selatan	\N	\N	t
6120	435	Tagulandang	\N	\N	t
6121	435	Tagulandang Selatan	\N	\N	t
6122	435	Tagulandang Utara	\N	\N	t
6123	436	Kendahe	\N	\N	t
6124	436	Kepulauan Marore	\N	\N	t
6125	436	Manganitu	\N	\N	t
6126	436	Manganitu Selatan	\N	\N	t
6127	436	Nusa Tabukan	\N	\N	t
6128	436	Tabukan Selatan	\N	\N	t
6129	436	Tabukan Selatan Tengah	\N	\N	t
6130	436	Tabukan Selatan Tenggara	\N	\N	t
6131	436	Tabukan Tengah	\N	\N	t
6132	436	Tabukan Utara	\N	\N	t
6133	436	Tahuna	\N	\N	t
6134	436	Tahuna Barat	\N	\N	t
6135	436	Tahuna Timur	\N	\N	t
6136	436	Tamako	\N	\N	t
6137	436	Tatoareng	\N	\N	t
6138	437	Beo	\N	\N	t
6139	437	Beo Selatan	\N	\N	t
6140	437	Beo Utara	\N	\N	t
6141	437	Damau	\N	\N	t
6142	437	Essang	\N	\N	t
6143	437	Essang Selatan	\N	\N	t
6144	437	Gemeh	\N	\N	t
6145	437	Kabaruan	\N	\N	t
6146	437	Kalongan	\N	\N	t
6147	437	Lirung	\N	\N	t
6148	437	Melonguane	\N	\N	t
6149	437	Melonguane Timur	\N	\N	t
6150	437	Miangas	\N	\N	t
6151	437	Moronge	\N	\N	t
6152	437	Nanusa	\N	\N	t
6153	437	Pulutan	\N	\N	t
6154	437	Rainis	\N	\N	t
6155	437	Salibabu	\N	\N	t
6156	437	Tampan' Amma	\N	\N	t
6157	438	Eris	\N	\N	t
6158	438	Kakas	\N	\N	t
6159	438	Kakas Barat	\N	\N	t
6160	438	Kawangkoan	\N	\N	t
6161	438	Kawangkoan Barat	\N	\N	t
6162	438	Kawangkoan Utara	\N	\N	t
6163	438	Kombi	\N	\N	t
6164	438	Langowan Barat	\N	\N	t
6165	438	Langowan Selatan	\N	\N	t
6166	438	Langowan Timur	\N	\N	t
6167	438	Langowan Utara	\N	\N	t
6168	438	Lembean Timur	\N	\N	t
6169	438	Mandolang	\N	\N	t
6170	438	Pineleng	\N	\N	t
6171	438	Remboken	\N	\N	t
6172	438	Sonder	\N	\N	t
6173	438	Tombariri	\N	\N	t
6174	438	Tombariri Timur	\N	\N	t
6175	438	Tombulu	\N	\N	t
6176	438	Tompaso	\N	\N	t
6177	438	Tompaso Barat	\N	\N	t
6178	438	Tondano Barat	\N	\N	t
6179	438	Tondano Selatan	\N	\N	t
6180	438	Tondano Timur	\N	\N	t
6181	438	Tondano Utara	\N	\N	t
6182	439	Amurang	\N	\N	t
6183	439	Amurang Barat	\N	\N	t
6184	439	Amurang Timur	\N	\N	t
6185	439	Kumelembuai	\N	\N	t
6186	439	Maesaan	\N	\N	t
6187	439	Modoinding	\N	\N	t
6188	439	Motoling	\N	\N	t
6189	439	Motoling Barat	\N	\N	t
6190	439	Motoling Timur	\N	\N	t
6191	439	Ranoyapo	\N	\N	t
6192	439	Sinonsayang	\N	\N	t
6193	439	Suluun Tareran	\N	\N	t
6194	439	Tareran	\N	\N	t
6195	439	Tatapaan	\N	\N	t
6196	439	Tenga	\N	\N	t
6197	439	Tompaso Baru	\N	\N	t
6198	439	Tumpaan	\N	\N	t
6199	440	Belang	\N	\N	t
6200	440	Pasan	\N	\N	t
6201	440	Pusomaen	\N	\N	t
6202	440	Ratahan	\N	\N	t
6203	440	Ratahan Timur	\N	\N	t
6204	440	Ratatotok	\N	\N	t
6205	440	Silian Raya	\N	\N	t
6206	440	Tombatu	\N	\N	t
6207	440	Tombatu Timur	\N	\N	t
6208	440	Tombatu Utara	\N	\N	t
6209	440	Touluaan	\N	\N	t
6210	440	Touluaan Selatan	\N	\N	t
6211	441	Airmadidi	\N	\N	t
6212	441	Dimembe	\N	\N	t
6213	441	Kalawat	\N	\N	t
6214	441	Kauditan	\N	\N	t
6215	441	Kema	\N	\N	t
6216	441	Likupang Barat	\N	\N	t
6217	441	Likupang Selatan	\N	\N	t
6218	441	Likupang Timur	\N	\N	t
6219	441	Talawaan	\N	\N	t
6220	441	Wori	\N	\N	t
6221	442	Aertembaga	\N	\N	t
6222	442	Girian	\N	\N	t
6223	442	Lembeh Selatan	\N	\N	t
6224	442	Lembeh Utara	\N	\N	t
6225	442	Madidir	\N	\N	t
6226	442	Maesa	\N	\N	t
6227	442	Matuari	\N	\N	t
6228	442	Ranowulu	\N	\N	t
6229	443	Kotamobagu Barat	\N	\N	t
6230	443	Kotamobagu Selatan	\N	\N	t
6231	443	Kotamobagu Timur	\N	\N	t
6232	443	Kotamobagu Utara	\N	\N	t
6233	444	Bunaken	\N	\N	t
6234	444	Bunaken Kepulauan	\N	\N	t
6235	444	Malalayang	\N	\N	t
6236	444	Mapanget	\N	\N	t
6237	444	Paal Dua	\N	\N	t
6238	444	Sario	\N	\N	t
6239	444	Singkil	\N	\N	t
6240	444	Tikala	\N	\N	t
6241	444	Tuminiting	\N	\N	t
6242	444	Wanea	\N	\N	t
6243	444	Wenang	\N	\N	t
6244	445	Tomohon Barat	\N	\N	t
6245	445	Tomohon Selatan	\N	\N	t
6246	445	Tomohon Tengah	\N	\N	t
6247	445	Tomohon Timur	\N	\N	t
6248	445	Tomohon Utara	\N	\N	t
6249	446	Ampek Angkek	\N	\N	t
6250	446	Ampek Nagari	\N	\N	t
6251	446	Banuhampu	\N	\N	t
6252	446	Baso	\N	\N	t
6253	446	Candung	\N	\N	t
6254	446	IV Koto	\N	\N	t
6255	446	Kamang Magek	\N	\N	t
6256	446	Lubuk Basung	\N	\N	t
6257	446	Malalak	\N	\N	t
6258	446	Matur	\N	\N	t
6259	446	Palupuh	\N	\N	t
6260	446	Pelembayan	\N	\N	t
6261	446	Sungai Pua	\N	\N	t
6262	446	Tanjung Mutiara	\N	\N	t
6263	446	Tanjung Raya	\N	\N	t
6264	446	Tilatang Kamang	\N	\N	t
6265	447	Asam Jujuhan	\N	\N	t
6266	447	Koto Baru	\N	\N	t
6267	447	Koto Besar	\N	\N	t
6268	447	Koto Salak	\N	\N	t
6269	447	Padang Laweh	\N	\N	t
6270	447	Pulau Punjung	\N	\N	t
6271	447	Sembilan Koto	\N	\N	t
6272	447	Sitiung	\N	\N	t
6273	447	Sungai Rumbai	\N	\N	t
6274	447	Timpeh	\N	\N	t
6275	447	Tiumang	\N	\N	t
6276	448	Pagai Selatan	\N	\N	t
6277	448	Pagai Utara	\N	\N	t
6278	448	Siberut Barat	\N	\N	t
6279	448	Siberut Barat Daya	\N	\N	t
6280	448	Siberut Selatan	\N	\N	t
6281	448	Siberut Tengah	\N	\N	t
6282	448	Siberut Utara	\N	\N	t
6283	448	Sikakap	\N	\N	t
6284	448	Sipora Selatan	\N	\N	t
6285	448	Sipora Utara	\N	\N	t
6286	449	Akabiluru	\N	\N	t
6287	449	Bukik Barisan	\N	\N	t
6288	449	Guguak	\N	\N	t
6289	449	Gunuang Omeh	\N	\N	t
6290	449	Harau	\N	\N	t
6291	449	Kapur IX	\N	\N	t
6292	449	Lareh Sago Halaban	\N	\N	t
6293	449	Luak	\N	\N	t
6294	449	Mungka	\N	\N	t
6295	449	Pangkalan Koto Baru	\N	\N	t
6296	449	Payakumbuh	\N	\N	t
6297	449	Situjuah Limo Nagari	\N	\N	t
6298	449	Suliki	\N	\N	t
6299	450	Batang Anai	\N	\N	t
6300	450	Batang Gasan	\N	\N	t
6301	450	Enam Lingkung	\N	\N	t
6302	450	IV Koto Aur Malintang	\N	\N	t
6303	450	Lubuk Alung	\N	\N	t
6304	450	Nan Sabaris	\N	\N	t
6305	450	Padang Sago	\N	\N	t
6306	450	Patamuan	\N	\N	t
6307	450	Sintuak Toboh Gadang	\N	\N	t
6308	450	Sungai Garingging	\N	\N	t
6309	450	Sungai Limau	\N	\N	t
6310	450	Ulakan Tapakih	\N	\N	t
6311	450	V Koto Kampung Dalam	\N	\N	t
6312	450	V Koto Timur	\N	\N	t
6313	450	VII Koto Sungai Sarik	\N	\N	t
6314	450	x Enam Lingkuang	\N	\N	t
6315	450	x Kayu Tanam	\N	\N	t
6316	451	Bonjol	\N	\N	t
6317	451	Duo Koto	\N	\N	t
6318	451	Lubuk Sikaping	\N	\N	t
6319	451	Mapat Tunggul	\N	\N	t
6320	451	Mapat Tunggul Selatan	\N	\N	t
6321	451	Padang Gelugur	\N	\N	t
6322	451	Panti	\N	\N	t
6323	451	Rao	\N	\N	t
6324	451	Rao Selatan	\N	\N	t
6325	451	Rao Utara	\N	\N	t
6326	451	Simpang Alahan Mati	\N	\N	t
6327	451	Tigo Nagari	\N	\N	t
6328	452	Gunungtuleh	\N	\N	t
6329	452	Kinali	\N	\N	t
6330	452	Koto Balingka	\N	\N	t
6331	452	Lembah Melintang	\N	\N	t
6332	452	Luhak Nan Duo	\N	\N	t
6333	452	Pasaman	\N	\N	t
6334	452	Ranah Batahan	\N	\N	t
6335	452	Sasak Ranah Pesisir	\N	\N	t
6336	452	Sungaiaur	\N	\N	t
6337	452	Sungaiberemas	\N	\N	t
6338	452	Talamau	\N	\N	t
6339	453	Airpura	\N	\N	t
6340	453	Basa Ampek Balai Tapan	\N	\N	t
6341	453	Batang Kapas	\N	\N	t
6342	453	Bayang	\N	\N	t
6343	453	IV Jurai	\N	\N	t
6344	453	IV Nagari Bayang Utara	\N	\N	t
6345	453	Koto XI Tarusan	\N	\N	t
6346	453	Lengayang	\N	\N	t
6347	453	Linggo Sari Baganti	\N	\N	t
6348	453	Lunang	\N	\N	t
6349	453	Pancung Soal	\N	\N	t
6350	453	Ranah Ampek Hulu Tapan	\N	\N	t
6351	453	Ranah Pesisir	\N	\N	t
6352	453	Silaut	\N	\N	t
6353	453	Sutera	\N	\N	t
6354	454	IV Nagari	\N	\N	t
6355	454	Kamang Baru	\N	\N	t
6356	454	Koto VII	\N	\N	t
6357	454	Kupitan	\N	\N	t
6358	454	Lubuak Tarok	\N	\N	t
6359	454	Sijunjung	\N	\N	t
6360	454	Sumpur Kudus	\N	\N	t
6361	454	Tanjung Gadang	\N	\N	t
6362	455	Bukit Sundi	\N	\N	t
6363	455	Danau Kembar	\N	\N	t
6364	455	Gunung Talang	\N	\N	t
6365	455	Hiliran Gumanti	\N	\N	t
6366	455	IX Koto Sungai Lasi	\N	\N	t
6367	455	Junjung Sirih	\N	\N	t
6368	455	Kubung	\N	\N	t
6369	455	Lembah Gumanti	\N	\N	t
6370	455	Lembang Jaya	\N	\N	t
6371	455	Pantai Cermin	\N	\N	t
6372	455	Payung Sekaki	\N	\N	t
6373	455	Tigo Lurah	\N	\N	t
6374	455	X Koto Diatas	\N	\N	t
6375	455	X Koto Singkarak	\N	\N	t
6376	456	Koto Parik Gadang Diateh	\N	\N	t
6377	456	Pauh Duo	\N	\N	t
6378	456	Sangir	\N	\N	t
6379	456	Sangir Balai Janggo	\N	\N	t
6380	456	Sangir Batang Hari	\N	\N	t
6381	456	Sangir Jujuan	\N	\N	t
6382	456	Sungai Pagu	\N	\N	t
6383	457	Batipuah Selatan	\N	\N	t
6384	457	Batipuh	\N	\N	t
6385	457	Lima Kaum	\N	\N	t
6386	457	Lintau Buo	\N	\N	t
6387	457	Lintau Buo Utara	\N	\N	t
6388	457	Padang Ganting	\N	\N	t
6389	457	Pariangan	\N	\N	t
6390	457	Rambatan	\N	\N	t
6391	457	Salimpauang	\N	\N	t
6392	457	Sungai Tarab	\N	\N	t
6393	457	Sungayang	\N	\N	t
6394	457	Tanjuang Baru	\N	\N	t
6395	457	Tanjung Emas	\N	\N	t
6396	457	X Koto	\N	\N	t
6397	458	Aur Birugo Tigo Baleh	\N	\N	t
6398	458	Guguak Panjang	\N	\N	t
6399	458	Mandiangin K. Selayan	\N	\N	t
6400	459	Bungus Teluk Kabung	\N	\N	t
6401	459	Koto Tangah	\N	\N	t
6402	459	Kuranji	\N	\N	t
6403	459	Lubuk Begalung	\N	\N	t
6404	459	Lubuk Kilangan	\N	\N	t
6405	459	Nanggalo	\N	\N	t
6406	459	Padang Barat	\N	\N	t
6407	459	Padang Selatan	\N	\N	t
6408	459	Padang Timur	\N	\N	t
6409	459	Padang Utara	\N	\N	t
6410	459	Pauh	\N	\N	t
6411	460	Padang Panjang Barat	\N	\N	t
6412	460	Padang Panjang Timur	\N	\N	t
6413	461	Pariaman Selatan	\N	\N	t
6414	461	Pariaman Tengah	\N	\N	t
6415	461	Pariaman Timur	\N	\N	t
6416	461	Pariaman Utara	\N	\N	t
6417	462	Lamposi Tigo Nagori	\N	\N	t
6418	462	Payakumbuh Barat	\N	\N	t
6419	462	Payakumbuh Selatan	\N	\N	t
6420	462	Payakumbuh Timur	\N	\N	t
6421	462	Payakumbuh Utara	\N	\N	t
6422	463	Barangin	\N	\N	t
6423	463	Lembah Segar	\N	\N	t
6424	463	Silungkang	\N	\N	t
6425	463	Talawi	\N	\N	t
6426	464	Lubuk Sikarah	\N	\N	t
6427	464	Tanjung Harapan	\N	\N	t
6428	465	Air Kumbang	\N	\N	t
6429	465	Air Salek	\N	\N	t
6430	465	Banyuasin I	\N	\N	t
6431	465	Banyuasin II	\N	\N	t
6432	465	Banyuasin III	\N	\N	t
6433	465	Betung	\N	\N	t
6434	465	Makarti Jaya	\N	\N	t
6435	465	Muara Padang	\N	\N	t
6436	465	Muara Sugihan	\N	\N	t
6437	465	Muara Telang	\N	\N	t
6438	465	Pulau Rimau	\N	\N	t
6439	465	Rambutan	\N	\N	t
6440	465	Rantau Bayur	\N	\N	t
6441	465	Sembawa	\N	\N	t
6442	465	Suak Tapeh	\N	\N	t
6443	465	Sumber Marga Telang	\N	\N	t
6444	465	Talang Kelapa	\N	\N	t
6445	465	Tanjung Lago	\N	\N	t
6446	465	Tungkal Ilir	\N	\N	t
6447	466	Lintang Kanan	\N	\N	t
6448	466	Muara Pinang	\N	\N	t
6449	466	Pasemah Air Keruh	\N	\N	t
6450	466	Pendopo	\N	\N	t
6451	466	Pendopo Barat	\N	\N	t
6452	466	Saling	\N	\N	t
6453	466	Sikap Dalam	\N	\N	t
6454	466	Talang Padang	\N	\N	t
6455	466	Tebing Tinggi	\N	\N	t
6456	466	Ulu Musi	\N	\N	t
6457	467	Gumay Talang	\N	\N	t
6458	467	Gumay Ulu	\N	\N	t
6459	467	Jarai	\N	\N	t
6460	467	Kikim Barat	\N	\N	t
6461	467	Kikim Selatan	\N	\N	t
6462	467	Kikim Tengah	\N	\N	t
6463	467	Kikim Timur	\N	\N	t
6464	467	Kota Agung	\N	\N	t
6465	467	Lahat	\N	\N	t
6466	467	Merapi Barat	\N	\N	t
6467	467	Merapi Selatan	\N	\N	t
6468	467	Merapi Timur	\N	\N	t
6469	467	Muarapayang	\N	\N	t
6470	467	Mulak Ulu	\N	\N	t
6471	467	Pagar Gunung	\N	\N	t
6472	467	Pajar Bulan	\N	\N	t
6473	467	Pseksu	\N	\N	t
6474	467	Pulaupinang	\N	\N	t
6475	467	Sukamerindu	\N	\N	t
6476	467	Tanjung Sakti Pumi	\N	\N	t
6477	467	Tanjungsakti Pumu	\N	\N	t
6478	467	Tanjungtebat	\N	\N	t
6479	468	Belida Darat	\N	\N	t
6480	468	Belimbing	\N	\N	t
6481	468	Benakat	\N	\N	t
6482	468	Gelumbang	\N	\N	t
6483	468	Gunung Megang	\N	\N	t
6484	468	Kelekar	\N	\N	t
6485	468	Lawang Kidul	\N	\N	t
6486	468	Lembak	\N	\N	t
6487	468	Lubai	\N	\N	t
6488	468	Lubai Ulu	\N	\N	t
6489	468	Muara Belida	\N	\N	t
6490	468	Muara Enim	\N	\N	t
6491	468	Rambang	\N	\N	t
6492	468	Rambang Dangku	\N	\N	t
6493	468	Semende Darat Laut	\N	\N	t
6494	468	Semende Darat Tengah	\N	\N	t
6495	468	Semende Darat Ulu	\N	\N	t
6496	468	Sungai Rotan	\N	\N	t
6497	468	Tanjung Agung	\N	\N	t
6498	468	Ujan Mas	\N	\N	t
6499	469	Babat Supat	\N	\N	t
6500	469	Babat Toman	\N	\N	t
6501	469	Batang Hari Leko	\N	\N	t
6502	469	Bayung Lencir	\N	\N	t
6503	469	Keluang	\N	\N	t
6504	469	Lais	\N	\N	t
6505	469	Lalan	\N	\N	t
6506	469	Lawang Wetan	\N	\N	t
6507	469	Plakat Tinggi	\N	\N	t
6508	469	Sanga Desa	\N	\N	t
6509	469	Sekayu	\N	\N	t
6510	469	Sungai Keruh	\N	\N	t
6511	469	Sungai Lilin	\N	\N	t
6512	469	Tungkal Jaya	\N	\N	t
6513	470	BTS. Ulu	\N	\N	t
6514	470	Jayaloka	\N	\N	t
6515	470	Megang Sakti	\N	\N	t
6516	470	Muara Beliti	\N	\N	t
6517	470	Muara Kelingi	\N	\N	t
6518	470	Muara Lakitan	\N	\N	t
6519	470	Purwodadi	\N	\N	t
6520	470	STL Ulu Terawas	\N	\N	t
6521	470	Selangit	\N	\N	t
6522	470	Suka Karya	\N	\N	t
6523	470	Sumber Harta	\N	\N	t
6524	470	Tiang Pumpung Kepungut	\N	\N	t
6525	470	Tuah Negeri	\N	\N	t
6526	470	Tugumulyo	\N	\N	t
6527	471	Karang Dapo	\N	\N	t
6528	471	Karang Jaya	\N	\N	t
6529	471	Nibung	\N	\N	t
6530	471	Rawas Ilir	\N	\N	t
6531	471	Rawas Ulu	\N	\N	t
6532	471	Rupit	\N	\N	t
6533	471	Ulu Rawas	\N	\N	t
6534	472	Indralaya	\N	\N	t
6535	472	Indralaya Selatan	\N	\N	t
6536	472	Indralaya Utara	\N	\N	t
6537	472	Kandis	\N	\N	t
6538	472	Lubuk Keliat	\N	\N	t
6539	472	Muara Kuang	\N	\N	t
6540	472	Payaraman	\N	\N	t
6541	472	Pemulutan	\N	\N	t
6542	472	Pemulutan Barat	\N	\N	t
6543	472	Pemulutan Selatan	\N	\N	t
6544	472	Rambang Kuang	\N	\N	t
6545	472	Rantau Alai	\N	\N	t
6546	472	Rantau Panjang	\N	\N	t
6547	472	Sungai Pinang	\N	\N	t
6548	472	Tanjung Batu	\N	\N	t
6549	472	Tanjung Raja	\N	\N	t
6550	473	Air Sugihan	\N	\N	t
6551	473	Cengal	\N	\N	t
6552	473	Jejawi	\N	\N	t
6553	473	Kayu Agung	\N	\N	t
6554	473	Lempuing	\N	\N	t
6555	473	Lempuing Jaya	\N	\N	t
6556	473	Mesuji	\N	\N	t
6557	473	Mesuji Makmur	\N	\N	t
6558	473	Mesuji Raya	\N	\N	t
6559	473	Pampangan	\N	\N	t
6560	473	Pangkalan Lampam	\N	\N	t
6561	473	Pedamaran	\N	\N	t
6562	473	Pedamaran Timur	\N	\N	t
6563	473	Sirah Pulau Padang	\N	\N	t
6564	473	Sungai Menang	\N	\N	t
6565	473	Tanjung Lubuk	\N	\N	t
6566	473	Teluk Gelam	\N	\N	t
6567	473	Tulung Selapan	\N	\N	t
6568	474	Baturaja Barat	\N	\N	t
6569	474	Baturaja Timur	\N	\N	t
6570	474	Lengkiti	\N	\N	t
6571	474	Lubuk Batang	\N	\N	t
6572	474	Lubuk Raja	\N	\N	t
6573	474	Muara Jaya	\N	\N	t
6574	474	Pengandonan	\N	\N	t
6575	474	Peninjauan	\N	\N	t
6576	474	Semidang Aji	\N	\N	t
6577	474	Sinar Peninjauan	\N	\N	t
6578	474	Sosoh Buay Rayap	\N	\N	t
6579	474	Ulu Ogan	\N	\N	t
6580	475	Banding Agung	\N	\N	t
6581	475	Buana Pemaca	\N	\N	t
6582	475	Buay Pemaca	\N	\N	t
6583	475	Buay Pematang Ribu Ranau Tengah	\N	\N	t
6584	475	Buay Rawan	\N	\N	t
6585	475	Buay Runjung	\N	\N	t
6586	475	Buay Sandang Aji	\N	\N	t
6587	475	Kisam Ilir	\N	\N	t
6588	475	Kisam Tinggi	\N	\N	t
6589	475	Mekakau Ilir	\N	\N	t
6590	475	Muara Dua	\N	\N	t
6591	475	Muara Dua Kisam	\N	\N	t
6592	475	Pulau Beringin	\N	\N	t
6593	475	Runjung Agung	\N	\N	t
6594	475	Simpang	\N	\N	t
6595	475	Sindang Danau	\N	\N	t
6596	475	Sungai Are	\N	\N	t
6597	475	Tiga Dihaji	\N	\N	t
6598	475	Warkuk Ranau Selatan	\N	\N	t
6599	476	Belitang	\N	\N	t
6600	476	Belitang II	\N	\N	t
6601	476	Belitang III	\N	\N	t
6602	476	Belitang Jaya	\N	\N	t
6603	476	Belitang Madang Raya	\N	\N	t
6604	476	Belitang Mulya	\N	\N	t
6605	476	Buay Madang	\N	\N	t
6606	476	Buay Madang Timur	\N	\N	t
6607	476	Buay Pemuka Bangsa Raja	\N	\N	t
6608	476	Buay Pemuka Peliung	\N	\N	t
6609	476	Bunga Mayang	\N	\N	t
6610	476	Cempaka	\N	\N	t
6611	476	Jayapura	\N	\N	t
6612	476	Madang Suku I	\N	\N	t
6613	476	Madang Suku II	\N	\N	t
6614	476	Madang Suku III	\N	\N	t
6615	476	Martapura	\N	\N	t
6616	476	Semendawai Barat	\N	\N	t
6617	476	Semendawai Suku III	\N	\N	t
6618	476	Semendawai Timur	\N	\N	t
6619	477	Abab	\N	\N	t
6620	477	Penukal	\N	\N	t
6621	477	Penukal Utara	\N	\N	t
6622	477	Talang Ubi	\N	\N	t
6623	477	Tanah Abang	\N	\N	t
6624	478	Lubuk Linggau Barat I	\N	\N	t
6625	478	Lubuk Linggau Barat II	\N	\N	t
6626	478	Lubuk Linggau Selatan I	\N	\N	t
6627	478	Lubuk Linggau Selatan II	\N	\N	t
6628	478	Lubuk Linggau Timur I	\N	\N	t
6629	478	Lubuk Linggau Timur II	\N	\N	t
6630	478	Lubuk Linggau Utara I	\N	\N	t
6631	478	Lubuk Linggau Utara II	\N	\N	t
6632	479	Dempo Selatan	\N	\N	t
6633	479	Dempo Tengah	\N	\N	t
6634	479	Dempo Utara	\N	\N	t
6635	479	Pagar Alam Selatan	\N	\N	t
6636	479	Pagar Alam Utara	\N	\N	t
6637	480	Alang-alang Lebar	\N	\N	t
6638	480	Bukit Kecil	\N	\N	t
6639	480	Gandus	\N	\N	t
6640	480	Ilir Barat I	\N	\N	t
6641	480	Ilir Barat II	\N	\N	t
6642	480	Ilir Timur I	\N	\N	t
6643	480	Ilir Timur II	\N	\N	t
6644	480	Kalidoni	\N	\N	t
6645	480	Kemuning	\N	\N	t
6646	480	Kertapati	\N	\N	t
6647	480	Plaju	\N	\N	t
6648	480	Sako	\N	\N	t
6649	480	Seberang Ulu I	\N	\N	t
6650	480	Seberang Ulu II	\N	\N	t
6651	480	Sematang Borang	\N	\N	t
6652	480	Sukarami	\N	\N	t
6653	481	Cambai	\N	\N	t
6654	481	Prabumulih Barat	\N	\N	t
6655	481	Prabumulih Selatan	\N	\N	t
6656	481	Prabumulih Timur	\N	\N	t
6657	481	Prabumulih Utara	\N	\N	t
6658	481	Rambang Kpk Tengah	\N	\N	t
6659	482	Aek Kuasan	\N	\N	t
6660	482	Aek Ledong	\N	\N	t
6661	482	Aek Songsongan	\N	\N	t
6662	482	Air Batu	\N	\N	t
6663	482	Air Joman	\N	\N	t
6664	482	Bandar Pasir Mandoge	\N	\N	t
6665	482	Bandar Pulau	\N	\N	t
6666	482	Buntu Pane	\N	\N	t
6667	482	Kota Kisaran Barat	\N	\N	t
6668	482	Kota Kisaran Timur	\N	\N	t
6669	482	Meranti	\N	\N	t
6670	482	Pulau Rakyat	\N	\N	t
6671	482	Pulo Bandring	\N	\N	t
6672	482	Rahunig	\N	\N	t
6673	482	Rawang Panca Arga	\N	\N	t
6674	482	Sei Dadap	\N	\N	t
6675	482	Sei Kepayang	\N	\N	t
6676	482	Sei Kepayang Barat	\N	\N	t
6677	482	Sei Kepayang Timur	\N	\N	t
6678	482	Setia Janji	\N	\N	t
6679	482	Silau Laut	\N	\N	t
6680	482	Simpang Empat	\N	\N	t
6681	482	Tanjung Balai	\N	\N	t
6682	482	Teluk Dalam	\N	\N	t
6683	482	Tinggi Raja	\N	\N	t
6684	483	Air Putih	\N	\N	t
6685	483	Lima Puluh	\N	\N	t
6686	483	Medang Deras	\N	\N	t
6687	483	Sei Balai	\N	\N	t
6688	483	Sei Suka	\N	\N	t
6689	483	Talawi	\N	\N	t
6690	483	Tanjung Tiram	\N	\N	t
6691	484	Brampu	\N	\N	t
6692	484	Gunung Sitember	\N	\N	t
6693	484	Lae Parira	\N	\N	t
6694	484	Parbuluan	\N	\N	t
6695	484	Pegagan Hilir	\N	\N	t
6696	484	Sidikalang	\N	\N	t
6697	484	Siempat Nempu	\N	\N	t
6698	484	Siempat Nempu Hilir	\N	\N	t
6699	484	Siempat Nempu Hulu	\N	\N	t
6700	484	Silahisabungan	\N	\N	t
6701	484	Silima Pungga Punga	\N	\N	t
6702	484	Sitinjo	\N	\N	t
6703	484	Sumbul	\N	\N	t
6704	484	Tanah Pinem	\N	\N	t
6705	484	Tigalingga	\N	\N	t
6706	485	Bangun Purba	\N	\N	t
6707	485	Batang Kuis	\N	\N	t
6708	485	Beringin	\N	\N	t
6709	485	Deli Tua	\N	\N	t
6710	485	Galang	\N	\N	t
6711	485	Gunung Meriah	\N	\N	t
6712	485	Hamparan Perak	\N	\N	t
6713	485	Kutalimbaru	\N	\N	t
6714	485	Labuhan Deli	\N	\N	t
6715	485	Lubuk Pakam	\N	\N	t
6716	485	Namorambe	\N	\N	t
6717	485	Pagar Merbau	\N	\N	t
6718	485	Pancur Batu	\N	\N	t
6719	485	Pantai Labu	\N	\N	t
6720	485	Patumbak	\N	\N	t
6721	485	Percut Sei Tuan	\N	\N	t
6722	485	STM Hilir	\N	\N	t
6723	485	STM Hulu	\N	\N	t
6724	485	Sibiru-biru	\N	\N	t
6725	485	Sibolangit	\N	\N	t
6726	485	Sunggal	\N	\N	t
6727	485	Tanjung Morawa	\N	\N	t
6728	486	Baktiraja	\N	\N	t
6729	486	Dolok Sanggul	\N	\N	t
6730	486	Lintong Nihuta	\N	\N	t
6731	486	Onan Ganjang	\N	\N	t
6732	486	Pakkat	\N	\N	t
6733	486	Paranginan	\N	\N	t
6734	486	Parlilitan	\N	\N	t
6735	486	Pollung	\N	\N	t
6736	486	Sijamapolang	\N	\N	t
6737	486	Tarabintang	\N	\N	t
6738	487	Barusjahe	\N	\N	t
6739	487	Berastagi	\N	\N	t
6740	487	Dolat Rayat	\N	\N	t
6741	487	Juhar	\N	\N	t
6742	487	Kabanjahe	\N	\N	t
6743	487	Kutabuluh	\N	\N	t
6744	487	Laubaleng	\N	\N	t
6745	487	Mardingding	\N	\N	t
6746	487	Merdeka	\N	\N	t
6747	487	Merek	\N	\N	t
6748	487	Munte	\N	\N	t
6749	487	Naman Teran	\N	\N	t
6750	487	Payung	\N	\N	t
6751	487	Simpang Empat	\N	\N	t
6752	487	Tigabinanga	\N	\N	t
6753	487	Tiganderket	\N	\N	t
6754	487	Tigapanah	\N	\N	t
6755	488	Bilah Barat	\N	\N	t
6756	488	Bilah Hilir	\N	\N	t
6757	488	Bilah Hulu	\N	\N	t
6758	488	Panai Hilir	\N	\N	t
6759	488	Panai Hulu	\N	\N	t
6760	488	Panai Tengah	\N	\N	t
6761	488	Pangkatan	\N	\N	t
6762	488	Rantau Selatan	\N	\N	t
6763	488	Rantau Utara	\N	\N	t
6764	489	Kampung Rakyat	\N	\N	t
6765	489	Kotapinang	\N	\N	t
6766	489	Silangkitang	\N	\N	t
6767	489	Sungai Kanan	\N	\N	t
6768	489	Torgamba	\N	\N	t
6769	490	Aek Kuo	\N	\N	t
6770	490	Aek Natas	\N	\N	t
6771	490	Kualuh Hilir	\N	\N	t
6772	490	Kualuh Hulu	\N	\N	t
6773	490	Kualuh Leidong	\N	\N	t
6774	490	Kualuh Selatan	\N	\N	t
6775	490	Marbau	\N	\N	t
6776	490	Na IX - X	\N	\N	t
6777	491	Babalan	\N	\N	t
6778	491	Bahorok	\N	\N	t
6779	491	Batang Serangan	\N	\N	t
6780	491	Besitang	\N	\N	t
6781	491	Binjai	\N	\N	t
6782	491	Brandan Barat	\N	\N	t
6783	491	Gebang	\N	\N	t
6784	491	Hinai	\N	\N	t
6785	491	Kuala	\N	\N	t
6786	491	Kutambaru	\N	\N	t
6787	491	Padang Tualang	\N	\N	t
6788	491	Pangkalan Susu	\N	\N	t
6789	491	Pematang Jaya	\N	\N	t
6790	491	Salapian	\N	\N	t
6791	491	Sawit Seberang	\N	\N	t
6792	491	Secanggang	\N	\N	t
6793	491	Sei Bingei	\N	\N	t
6794	491	Sei Lepan	\N	\N	t
6795	491	Selesai	\N	\N	t
6796	491	Sirapit	\N	\N	t
6797	491	Stabat	\N	\N	t
6798	491	Tanjung Pura	\N	\N	t
6799	491	Wampu	\N	\N	t
6800	492	Batahan	\N	\N	t
6801	492	Batang Natal	\N	\N	t
6802	492	Bukit Malintang	\N	\N	t
6803	492	Huta Bargot	\N	\N	t
6804	492	Kotanopan	\N	\N	t
6805	492	Lembah Sorik Marapi	\N	\N	t
6806	492	Lingga Bayu	\N	\N	t
6807	492	Muara Batang Gadis	\N	\N	t
6808	492	Muara Sipongi	\N	\N	t
6809	492	Naga Juang	\N	\N	t
6810	492	Natal	\N	\N	t
6811	492	Pakantan	\N	\N	t
6812	492	Panyabungan	\N	\N	t
6813	492	Panyabungan Barat	\N	\N	t
6814	492	Panyabungan Selatan	\N	\N	t
6815	492	Panyabungan Timur	\N	\N	t
6816	492	Panyabungan Utara	\N	\N	t
6817	492	Puncak Sorik Marapi	\N	\N	t
6818	492	Ranto Baek	\N	\N	t
6819	492	Siabu	\N	\N	t
6820	492	Sinunukan	\N	\N	t
6821	492	Tambangan	\N	\N	t
6822	492	Ulu Pungkut	\N	\N	t
6823	493	Bawolato	\N	\N	t
6824	493	Botomuzoi	\N	\N	t
6825	493	Gido	\N	\N	t
6826	493	Hiliduho	\N	\N	t
6827	493	Hiliserangkai	\N	\N	t
6828	493	Idanogawo	\N	\N	t
6829	493	Ma'u	\N	\N	t
6830	493	Sogae'adu	\N	\N	t
6831	493	Somolo-molo	\N	\N	t
6832	493	Ulugawo	\N	\N	t
6833	494	Lahomi	\N	\N	t
6834	494	Lolofitu Moi	\N	\N	t
6835	494	Mandrehe	\N	\N	t
6836	494	Mandrehe Barat	\N	\N	t
6837	494	Mandrehe Utara	\N	\N	t
6838	494	Moro'o	\N	\N	t
6839	494	Sirombu	\N	\N	t
6840	494	Ulu Moro'o	\N	\N	t
6841	495	Amandraya	\N	\N	t
6842	495	Aramo	\N	\N	t
6843	495	Boronadu	\N	\N	t
6844	495	Fanayama	\N	\N	t
6845	495	Gomo	\N	\N	t
6846	495	Hibala	\N	\N	t
6847	495	Hilimegai	\N	\N	t
6848	495	Hilisalawa'ahe	\N	\N	t
6849	495	Huruna	\N	\N	t
6850	495	Lahusa	\N	\N	t
6851	495	Lalowa'u	\N	\N	t
6852	495	Lolomatua	\N	\N	t
6853	495	Maniamolo	\N	\N	t
6854	495	Mazino	\N	\N	t
6855	495	Mazo	\N	\N	t
6856	495	O'o'u	\N	\N	t
6857	495	Onohazumba	\N	\N	t
6858	495	Pulau-Pulau Batu	\N	\N	t
6859	495	Pulau-Pulau Batu Barat	\N	\N	t
6860	495	Pulau-Pulau Batu Timur	\N	\N	t
6861	495	Pulau-Pulau Batu Utara	\N	\N	t
6862	495	Sidua'ori	\N	\N	t
6863	495	Simuk	\N	\N	t
6864	495	Somambawa	\N	\N	t
6865	495	Susua	\N	\N	t
6866	495	Tanah Masa	\N	\N	t
6867	495	Teluk Dalam	\N	\N	t
6868	495	Toma	\N	\N	t
6869	495	Ulunoyo	\N	\N	t
6870	495	Ulususua	\N	\N	t
6871	495	Umbunasi	\N	\N	t
6872	496	Afulu	\N	\N	t
6873	496	Alasa	\N	\N	t
6874	496	Alasa Talumuzoi	\N	\N	t
6875	496	Lahewa	\N	\N	t
6876	496	Lahewa Timur	\N	\N	t
6877	496	Lotu	\N	\N	t
6878	496	Namohalu Esiwa	\N	\N	t
6879	496	Sawo	\N	\N	t
6880	496	Sitolu Ori	\N	\N	t
6881	496	Tugala Oyo	\N	\N	t
6882	496	Tuhemberua	\N	\N	t
6883	497	Aek Nabara Barumun	\N	\N	t
6884	497	Barumun	\N	\N	t
6885	497	Barumun Selatan	\N	\N	t
6886	497	Barumun Tengah	\N	\N	t
6887	497	Batang Lubu Sutam	\N	\N	t
6888	497	Huristak	\N	\N	t
6889	497	Huta Raja Tinggi	\N	\N	t
6890	497	Lubuk Barumun	\N	\N	t
6891	497	Sihapas Barumun	\N	\N	t
6892	497	Sosa	\N	\N	t
6893	497	Sosopan	\N	\N	t
6894	497	Ulu Barumun	\N	\N	t
6895	498	Batang Onang	\N	\N	t
6896	498	Dolok	\N	\N	t
6897	498	Dolok Sigompulon	\N	\N	t
6898	498	Halongonan	\N	\N	t
6899	498	Hulu Sihapas	\N	\N	t
6900	498	Padang Bolak	\N	\N	t
6901	498	Padang Bolak Julu	\N	\N	t
6902	498	Portibi	\N	\N	t
6903	498	Simangambat	\N	\N	t
6904	499	Kerajaan	\N	\N	t
6905	499	Pagindar	\N	\N	t
6906	499	Pergetteng Getteng Sengkut	\N	\N	t
6907	499	Salak	\N	\N	t
6908	499	Siempat Rube	\N	\N	t
6909	499	Sitelu Tali Urang Jehe	\N	\N	t
6910	499	Sitelu Tali Urang Julu	\N	\N	t
6911	499	Tinada	\N	\N	t
6912	500	Harian	\N	\N	t
6913	500	Nainggolan	\N	\N	t
6914	500	Onan Runggu	\N	\N	t
6915	500	Palipi	\N	\N	t
6916	500	Pangururan	\N	\N	t
6917	500	Ronggur Nihuta	\N	\N	t
6918	500	Sianjar Mula Mula	\N	\N	t
6919	500	Simanindo	\N	\N	t
6920	500	Sitio-tio	\N	\N	t
6921	501	Bandar Khalifah	\N	\N	t
6922	501	Bintang Bayu	\N	\N	t
6923	501	Dolok Masihul	\N	\N	t
6924	501	Dolok Merawan	\N	\N	t
6925	501	Kotarih	\N	\N	t
6926	501	Pantai Cermin	\N	\N	t
6927	501	Pegajahan	\N	\N	t
6928	501	Perbaungan	\N	\N	t
6929	501	Sei Bamban	\N	\N	t
6930	501	Sei. Rampah	\N	\N	t
6931	501	Serba Jadi	\N	\N	t
6932	501	Silinda	\N	\N	t
6933	501	Sipispis	\N	\N	t
6934	501	Tanjung Beringin	\N	\N	t
6935	501	Tebing Syahbandar	\N	\N	t
6936	501	Tebing Tinggi	\N	\N	t
6937	501	Teluk Mengkudu	\N	\N	t
6938	502	Bandar	\N	\N	t
6939	502	Bandar Huluan	\N	\N	t
6940	502	Bandar Masilam	\N	\N	t
6941	502	Bosar Maligas	\N	\N	t
6942	502	Dolok Batu Nanggar	\N	\N	t
6943	502	Dolok Panribuan	\N	\N	t
6944	502	Dolok Pardamean	\N	\N	t
6945	502	Dolok Silau	\N	\N	t
6946	502	Girsang Sipangan Bolon	\N	\N	t
6947	502	Gunung Malela	\N	\N	t
6948	502	Gunung Maligas	\N	\N	t
6949	502	Haranggaol Horison	\N	\N	t
6950	502	Hatonduhan	\N	\N	t
6951	502	Huta Bayu Raja	\N	\N	t
6952	502	Jawa Maraja Bah Jambi	\N	\N	t
6953	502	Jorlang Hataran	\N	\N	t
6954	502	Pamatang Silima Huta	\N	\N	t
6955	502	Panei	\N	\N	t
6956	502	Panombeian Pane	\N	\N	t
6957	502	Pematang Bandar	\N	\N	t
6958	502	Pematang Sidamanik	\N	\N	t
6959	502	Purba	\N	\N	t
6960	502	Raya	\N	\N	t
6961	502	Raya Kahean	\N	\N	t
6962	502	Siantar	\N	\N	t
6963	502	Sidamanik	\N	\N	t
6964	502	Silimakuta	\N	\N	t
6965	502	Silou Kahean	\N	\N	t
6966	502	Tanah Jawa	\N	\N	t
6967	502	Tapian Dolok	\N	\N	t
6968	502	Ujung Padang	\N	\N	t
6969	503	Aek Bilah	\N	\N	t
6970	503	Angkola Barat	\N	\N	t
6971	503	Angkola Sangkunur	\N	\N	t
6972	503	Angkola Selatan	\N	\N	t
6973	503	Angkola Timur	\N	\N	t
6974	503	Arse	\N	\N	t
6975	503	Batang Angkola	\N	\N	t
6976	503	Batang Toru	\N	\N	t
6977	503	Marancar	\N	\N	t
6978	503	Muara Batang Toru	\N	\N	t
6979	503	Saipar Dolok Hole	\N	\N	t
6980	503	Sayur Matinggi	\N	\N	t
6981	503	Sipirok	\N	\N	t
6982	503	Tano Tombangan Angkola	\N	\N	t
6983	504	Andam Dewi	\N	\N	t
6984	504	Badiri	\N	\N	t
6985	504	Barus	\N	\N	t
6986	504	Barus Utara	\N	\N	t
6987	504	Kolang	\N	\N	t
6988	504	Lumut	\N	\N	t
6989	504	Manduamas	\N	\N	t
6990	504	Pandan	\N	\N	t
6991	504	Pasaribu Tobing	\N	\N	t
6992	504	Pinangsori	\N	\N	t
6993	504	Sarudik	\N	\N	t
6994	504	Sibabangun	\N	\N	t
6995	504	Sirandorung	\N	\N	t
6996	504	Sitahuis	\N	\N	t
6997	504	Sorkam	\N	\N	t
6998	504	Sorkam Barat	\N	\N	t
6999	504	Sosor Gadong	\N	\N	t
7000	504	Suka Bangun	\N	\N	t
7001	504	Tapian Nauli	\N	\N	t
7002	504	Tukka	\N	\N	t
7003	505	Adian Koting	\N	\N	t
7004	505	Garoga	\N	\N	t
7005	505	Muara	\N	\N	t
7006	505	Pagaran	\N	\N	t
7007	505	Pahae Jae	\N	\N	t
7008	505	Pahae Julu	\N	\N	t
7009	505	Pangaribuan	\N	\N	t
7010	505	Parmonangan	\N	\N	t
7011	505	Purba Tua	\N	\N	t
7012	505	Siatas Barita	\N	\N	t
7013	505	Siborong-Borong	\N	\N	t
7014	505	Simangumban	\N	\N	t
7015	505	Sipahutar	\N	\N	t
7016	505	Sipoholon	\N	\N	t
7017	505	Tarutung	\N	\N	t
7018	506	Ajibata	\N	\N	t
7019	506	Balige	\N	\N	t
7020	506	Bonatua Lunasi	\N	\N	t
7021	506	Borbor	\N	\N	t
7022	506	Habinsaran	\N	\N	t
7023	506	Laguboti	\N	\N	t
7024	506	Lumban Julu	\N	\N	t
7025	506	Nassau	\N	\N	t
7026	506	Parmaksian	\N	\N	t
7027	506	Pintu Pohan Meranti	\N	\N	t
7028	506	Porsea	\N	\N	t
7029	506	Siantar Narumonda	\N	\N	t
7030	506	Sigumpar	\N	\N	t
7031	506	Silaen	\N	\N	t
7032	506	Tampahan	\N	\N	t
7033	506	Uluan	\N	\N	t
7034	507	Binjai Barat	\N	\N	t
7035	507	Binjai Kota	\N	\N	t
7036	507	Binjai Selatan	\N	\N	t
7037	507	Binjai Timur	\N	\N	t
7038	507	Binjai Utara	\N	\N	t
7039	508	Gunungsitoli	\N	\N	t
7040	508	Gunungsitoli Alo'oa	\N	\N	t
7041	508	Gunungsitoli Barat	\N	\N	t
7042	508	Gunungsitoli Idanoi	\N	\N	t
7043	508	Gunungsitoli Selatan	\N	\N	t
7044	508	Gunungsitoli Utara	\N	\N	t
7045	509	Medan Amplas	\N	\N	t
7046	509	Medan Area	\N	\N	t
7047	509	Medan Barat	\N	\N	t
7048	509	Medan Baru	\N	\N	t
7049	509	Medan Belawan	\N	\N	t
7050	509	Medan Deli	\N	\N	t
7051	509	Medan Denai	\N	\N	t
7052	509	Medan Helvetia	\N	\N	t
7053	509	Medan Johor	\N	\N	t
7054	509	Medan Kota	\N	\N	t
7055	509	Medan Labuhan	\N	\N	t
7056	509	Medan Maimun	\N	\N	t
7057	509	Medan Marelan	\N	\N	t
7058	509	Medan Perjuangan	\N	\N	t
7059	509	Medan Petisah	\N	\N	t
7060	509	Medan Polonia	\N	\N	t
7061	509	Medan Selayang	\N	\N	t
7062	509	Medan Sunggal	\N	\N	t
7063	509	Medan Tembung	\N	\N	t
7064	509	Medan Timur	\N	\N	t
7065	509	Medan Tuntungan	\N	\N	t
7066	510	Padangsidimpuan Angkola Julu	\N	\N	t
7067	510	Padangsidimpuan Batunadua	\N	\N	t
7068	510	Padangsidimpuan Hutaimbaru	\N	\N	t
7069	510	Padangsidimpuan Selatan	\N	\N	t
7070	510	Padangsidimpuan Tenggara	\N	\N	t
7071	510	Padangsidimpuan Utara	\N	\N	t
7072	511	Siantar Barat	\N	\N	t
7073	511	Siantar Marihat	\N	\N	t
7074	511	Siantar Marimbun	\N	\N	t
7075	511	Siantar Martoba	\N	\N	t
7076	511	Siantar Selatan	\N	\N	t
7077	511	Siantar Sitalasari	\N	\N	t
7078	511	Siantar Timur	\N	\N	t
7079	511	Siantar Utara	\N	\N	t
7080	512	Sibolga Kota	\N	\N	t
7081	512	Sibolga Sambas	\N	\N	t
7082	512	Sibolga Selatan	\N	\N	t
7083	512	Sibolga Utara	\N	\N	t
7084	513	Datuk Bandar	\N	\N	t
7085	513	Datuk Bandar Timur	\N	\N	t
7086	513	Sei Tualang Raso	\N	\N	t
7087	513	Tanjung Balai Selatan	\N	\N	t
7088	513	Tanjung Balai Utara	\N	\N	t
7089	513	Teluk Nibung	\N	\N	t
7090	514	Bajenis	\N	\N	t
7091	514	Padang Hilir	\N	\N	t
7092	514	Padang Hulu	\N	\N	t
7093	514	Rambutan	\N	\N	t
7094	514	Tebing Tinggi Kota	\N	\N	t
\.


--
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('districts_id_seq', 7094, true);


--
-- Data for Name: elements; Type: TABLE DATA; Schema: public; Owner: user
--

COPY elements (id, raw_id, user_id, weather_id, active) FROM stdin;
\.


--
-- Name: elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('elements_id_seq', 1, false);


--
-- Data for Name: errors; Type: TABLE DATA; Schema: public; Owner: user
--

COPY errors (id, name, active) FROM stdin;
1	False classification	t
2	Fail to Tag Words	t
4	Fail to get phrase from chunking	t
3	Fail to get place	t
5	Fail to get categories	t
\.


--
-- Name: errors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('errors_id_seq', 1, false);


--
-- Data for Name: fails; Type: TABLE DATA; Schema: public; Owner: user
--

COPY fails (id, raw_id, error_id, created, modified, active) FROM stdin;
\.


--
-- Name: fails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('fails_id_seq', 1, false);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: user
--

COPY groups (id, name, active) FROM stdin;
1	Administrator	t
2	Manager	t
3	User	t
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('groups_id_seq', 3, true);


--
-- Data for Name: hierarchies; Type: TABLE DATA; Schema: public; Owner: user
--

COPY hierarchies (id, name, active) FROM stdin;
1	Kabupaten	t
2	Kota	t
\.


--
-- Name: hierarchies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('hierarchies_id_seq', 2, true);


--
-- Data for Name: humans; Type: TABLE DATA; Schema: public; Owner: user
--

COPY humans (id, t_id, classification_id, place_id, category_id, weather_id, info, image, processed, created, modified, active) FROM stdin;
\.


--
-- Name: humans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('humans_id_seq', 1, false);


--
-- Data for Name: kinds; Type: TABLE DATA; Schema: public; Owner: user
--

COPY kinds (id, raw_id, classification_id, processed, created, modified, active, t_id, verified, trained) FROM stdin;
\.


--
-- Name: kinds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('kinds_id_seq', 1, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY locations (id, raw_id, user_id, region_id, name, lat, lng, created, modified, active) FROM stdin;
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('locations_id_seq', 1, false);


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: user
--

COPY logs (id, user_id, controller, "controllerID", action, name, created, modified, active) FROM stdin;
\.


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('logs_id_seq', 1, false);


--
-- Data for Name: machines; Type: TABLE DATA; Schema: public; Owner: user
--

COPY machines (id, t_id, classification_id, place_id, category_id, weather_id, info, image, processed, created, modified, active, spot_id) FROM stdin;
\.


--
-- Name: machines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('machines_id_seq', 1, true);


--
-- Data for Name: markers; Type: TABLE DATA; Schema: public; Owner: user
--

COPY markers (id, category_id, user_id, respondent_id, weather_id, raw_id, lat, lng, info, "isPinned", "isCleared", created, modified, active, "isExported") FROM stdin;
\.


--
-- Name: markers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('markers_id_seq', 1, true);


--
-- Data for Name: pieces; Type: TABLE DATA; Schema: public; Owner: user
--

COPY pieces (id, chunk_id, user_id, place, condition, weather, trained, created, modified, active) FROM stdin;
\.


--
-- Name: pieces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('pieces_id_seq', 1, false);


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: user
--

COPY places (id, regency_id, name, lat, lng, active) FROM stdin;
30	172	Alun-Alun Kediri	-7.826778	112.010681	t
31	96	Alun-Alun Singaparna arah Tasikmalaya	-7.350325	108.110725	t
32	129	Alun-Alun Sragen	-7.427150	111.023621	t
33	129	Alun-Alun Sragen arah Ngawi	-7.427241	111.023376	t
34	150	Alun-alun Lamongan	-7.121014	112.416420	t
35	80	Alun-alun Lembang	-6.812644	107.618744	t
36	147	Alun-alun Rambipuji	-8.255386	113.551086	t
37	178	Ambengan	-7.256114	112.752213	t
38	61	Ancol 	-6.118153	106.862297	t
39	61	Ancol - Cempaka Putih	-6.127391	106.844849	t
40	61	Ancol - Priok	-6.128138	106.844070	t
41	61	Ancol - Soetta	-6.127989	106.842751	t
42	61	Ancol arah Pluit	-6.130335	106.828697	t
43	61	Angke - Pluit	-6.139467	106.786957	t
44	160	Apollo	-7.579647	112.691360	t
45	178	Arief Rahman - A. Dahlan	-7.290359	112.799774	t
46	178	Arief Rahman Hakim (ITATS)	-7.289808	112.779076	t
47	178	Arif Rahman (Masjid Sa'adah)	-7.290152	112.796738	t
48	174	Arjosari	-7.927952	112.649643	t
49	174	Arjosari - Sukorejo	-7.929716	112.648598	t
50	178	Arjuno - Semarang	-7.255965	112.727699	t
51	164	Arteri Baru Porong	-7.524958	112.692757	t
52	164	Arteri Porong	-7.526022	112.690887	t
53	178	Asem Rowo	-7.246110	112.717712	t
54	57	Asemka - Glodok	-6.138699	106.813545	t
55	57	Asemka - Tambora	-6.138638	106.813751	t
56	58	Atmajaya - Blok M	-6.217802	106.814751	t
57	156	Awar-awar Mancon Wilangan	-7.560908	111.824188	t
58	58	BNI 46	-6.203627	106.821960	t
59	60	BNN	-6.246065	106.871246	t
60	40	BSD - Bintaro 	-6.310457	106.682999	t
61	150	Babat	-7.100318	112.187317	t
62	94	Bagbagan (Sukabumi)	-7.010629	106.565010	t
63	121	Balai Kons Borobudur	-7.609850	110.207870	t
64	121	Balai Kons Borobudur	-7.610403	110.203148	t
65	58	Balai Kota DKI Jakarta	-6.180526	106.828529	t
66	36	Balaraja - Merak	-6.203467	106.459663	t
67	36	Balaraja Barat 	-6.199627	106.441147	t
68	36	Balaraja Timur 	-6.202549	106.480698	t
69	164	Balongbendo	-7.409537	112.528175	t
70	88	Balonggadu	-6.384395	107.508194	t
71	178	Balongsari - Margomulyo	-7.258045	112.679825	t
72	178	Balongsari - Tandes	-7.258405	112.681007	t
73	157	Baluk arah Ngawi-Solo	-7.537828	111.411278	t
74	157	Baluk-Madiun	-7.538041	111.410248	t
75	121	Bambu Runcing Semarang - Yogya	-7.575946	110.268959	t
76	148	Bandar Kedungmulyo	-7.575499	112.143631	t
77	148	Bandar Kedungmulyo	-7.566630	112.137642	t
78	54	Bandara Adi Sutjipto	-7.784047	110.429848	t
79	39	Bandara Soetta arah Terminal 1 dan 2	-6.126605	106.658180	t
80	57	Bandengan Selatan - Gedong Panjang	-6.136576	106.801208	t
81	57	Bandengan Selatan - Jembatan Tiga	-6.137179	106.794701	t
82	61	Bandengan arah Tubagus Angke	-6.137299	106.793205	t
83	86	Bandrek	-7.058065	108.068153	t
84	86	Bandrek - Limbangan	-7.053309	108.002724	t
85	79	Bandung - Sumedang (Batas Kota)	-6.937732	107.757973	t
86	79	Bandung Highland	-6.861369	107.636826	t
87	79	Bandung arah ke Nagreg	-6.941862	107.755188	t
88	176	Bangil	-7.614072	112.844849	t
89	160	Bangil Kota	-7.575457	112.796928	t
90	141	Bangkalan	-7.058645	112.795128	t
91	141	Bangkalan-Sampang	-7.136323	112.713249	t
92	178	Bangkingan	-7.326150	112.673668	t
93	51	Banguntapan	-7.829456	110.407707	t
94	98	Banjar (Perbatasan Jawa Tengah)	-7.346570	108.581657	t
95	178	Banyu Urip	-7.270434	112.721130	t
96	178	Banyu Urip - Pos Pol	-7.274899	112.726723	t
97	178	Banyu Urip - Putat Jaya	-7.274601	112.725845	t
98	178	Banyu Urip - Tol	-7.265969	112.707153	t
99	100	Baranangsiang - Jl. Pajajaran - Warung Jambu	-6.610448	106.811584	t
100	178	Basuki Rahmat	-7.271355	112.741722	t
101	178	Basuki Rahmat (Gramedia Expo)	-7.269162	112.741547	t
102	178	Basuki Rahmat - Embong Malang	-7.263224	112.740952	t
103	178	Basuki Rahmat - Tegal Sari	-7.265437	112.740967	t
104	108	Batang arah ke Pekalongan (Jalur Pantura)	-6.907205	109.730438	t
106	39	Batu Ceper arah Kalideres	-6.161316	106.682198	t
107	39	Batu Ceper arah Tangerang Kota	-6.172598	106.665031	t
108	178	Bawah Flyover A.Yani	-7.306793	112.736076	t
109	99	Bekasi - Halim	-6.261561	107.013405	t
110	99	Bekasi Barat - Jatiwaringin	-6.254682	106.964203	t
111	99	Bekasi Timur - Tambun	-6.262496	107.016731	t
112	59	Bendi 	-6.252571	106.772926	t
113	178	Benowo	-7.235254	112.610573	t
114	178	Berbek Industri	-7.339866	112.755325	t
115	165	Besuki	-7.752326	113.699440	t
116	40	Bintaro - Veteran	-6.284351	106.733055	t
117	40	Bintaro-Pd. Indah	-6.284671	106.731644	t
118	40	Bintaro-Serpong 	-6.284607	106.732178	t
119	121	Blabak - Magelang	-7.572968	110.261383	t
120	121	Blabak Jl.Magelang-Yogya	-7.568164	110.259132	t
121	121	Blabak-Borobudur	-7.569693	110.256989	t
122	178	Blauran	-7.257184	112.733757	t
123	178	Blauran - Bubutan 	-7.256056	112.734192	t
124	178	Blauran - Praban	-7.255901	112.734428	t
125	178	Blauran - Praban - Kranggan	-7.255994	112.734177	t
126	178	Blauran-Praban	-7.256072	112.734406	t
127	141	Blega	-7.130723	113.033676	t
128	174	Blimbing Indah Megah	-7.936269	112.651085	t
129	59	Blok M	-6.244615	106.798157	t
130	59	Blok M arah ke Pangeran Antasari	-6.243279	106.802986	t
105	39	Batu Ceper	-6.164028	106.683182	t
131	149	Bogokidul	-7.712842	112.129982	t
132	146	Boteng	-7.268697	112.566681	t
133	110	Boyolali - Magelang	-7.500371	110.473824	t
134	178	Bratang Jaya - Bratang Binangun	-7.299054	112.759666	t
135	178	Bratang Jaya - Semolo	-7.299354	112.761932	t
136	131	Brebes - Prupuk	-7.122404	108.982666	t
137	111	Brebes - Tegal	-6.875941	109.057777	t
138	111	Brebes arah Tegal melalui Jl. Gajah Mada	-6.875977	109.058769	t
139	140	Brexit	-6.891560	109.065842	t
140	178	Brigjen Katamso	-7.351103	112.731934	t
141	146	Bringkang	-7.287425	112.563171	t
142	97	Buah batu lingkar	-6.929654	107.617050	t
143	60	Buaran - Cipinang	-6.216447	106.928177	t
144	60	Buaran Plaza 	-6.217546	106.923691	t
145	60	Buaran arah Kampung Melayu	-6.216445	106.928116	t
146	60	Buaran arah ke Pulogadung (di Jl. Radjiman)	-6.215758	106.923798	t
147	178	Bubutan	-7.245077	112.737213	t
148	178	Bubutan - Kebon Rojo	-7.243555	112.736069	t
149	178	Bubutan - Tembaan	-7.248387	112.736465	t
150	164	Buduran	-7.401983	112.727127	t
151	178	Bukit Darmo Boulevard	-7.283657	112.682648	t
152	97	Bumi Harapan Cibiru	-6.947142	107.719437	t
153	59	Buncit - Duren Tiga	-6.289508	106.824333	t
154	59	Buncit - Mampang	-6.289453	106.824356	t
155	59	Buncit - Pejaten 	-6.279616	106.828842	t
156	59	Buncit - Ragunan	-6.280442	106.828461	t
157	164	Bundaran Aloha	-7.373299	112.728500	t
158	89	Bundaran Cijoho Kuningan	-6.968415	108.488396	t
159	178	Bundaran Dolog	-7.327969	112.730904	t
160	86	Bundaran Guntur	-7.211689	107.902115	t
161	58	Bundaran Hotel Indonesia	-6.194958	106.823067	t
162	58	Bundaran Hotel Indonesia - Jl. Medan Merdeka Barat	-6.194626	106.822678	t
163	58	Bundaran Hotel Indonesia arah Sarinah	-6.194512	106.822784	t
164	58	Bundaran Hotel Indonesia arah Semanggi	-6.195389	106.823364	t
165	178	Bundaran ITS	-7.279273	112.790474	t
166	93	Bundaran Lampu Satu	-6.568792	107.762070	t
167	101	Bundaran Leuwigajah	-6.902879	107.535805	t
168	101	Bundaran Leuwigajah arah Baros	-6.902803	107.535187	t
169	58	Bundaran Patung Kuda (Jl. MH. Thamrin)	-6.180593	106.822845	t
170	178	Bundaran Satelit	-7.288319	112.706383	t
171	178	Bundaran Satelit - HR Muhammad	-7.288361	112.704964	t
172	178	Bundaran Satelit - Kupang Indah	-7.286520	112.705467	t
173	178	Bundaran Satelit - Mayjend Sungkono	-7.287382	112.706207	t
174	59	Bundaran Senayan	-6.229190	106.799492	t
175	59	Bundaran Senayan - Blok M	-6.229544	106.799522	t
176	86	Bundaran Suci, Garut	-7.216015	107.921021	t
177	144	Bundaran Sumbang	-7.159424	111.881500	t
178	164	Bundaran Taman Pinang	-7.456667	112.706314	t
179	100	Bundaran Tol Ciawi	-6.652891	106.847900	t
180	164	Bundaran Tol Gempol	-7.564566	112.716423	t
181	178	Bundaran Waru	-7.346506	112.729362	t
182	178	Bundaran Waru (CITO)	-7.346017	112.727837	t
183	146	Bunder	-7.170644	112.569908	t
184	55	Bunderan Alun-Alun Kidul	-7.812062	110.362549	t
185	153	Bunderan Alun2 Magetan	-7.655330	111.327606	t
186	55	Bunderan Jombor Arah Magelang	-7.749573	110.362259	t
187	138	Bunderan Kalibanteng	-6.984399	110.383904	t
188	178	Bunderan Margomulyo - Balongsari	-7.257626	112.680588	t
189	178	Bunderan PTC	-7.290255	112.675758	t
190	59	Bunderan Pondok Indah	-6.280448	106.780930	t
191	86	Bunderan Tarogong, Garut	-7.190283	107.889359	t
192	178	Bung Tomo	-7.291596	112.748055	t
193	146	Bungah arah Lamongan	-7.034390	112.570145	t
194	58	Bungur 	-6.173308	106.844460	t
195	107	Buntu	-7.442768	109.272057	t
196	164	By Pass Juanda	-7.379308	112.756561	t
197	164	By Pass Krian	-7.396855	112.583038	t
198	175	By Pass Mojokerto	-7.474972	112.456635	t
199	97	By Pass Soekarno Hatta - Kiara Condong	-6.945448	107.641853	t
200	97	By Pass Soeta - Pasir Koja	-6.930474	107.576088	t
201	156	By Pass Wilangan	-7.558525	111.801598	t
202	39	CBD Ciledug	-6.224745	106.708336	t
203	95	Cadas Pangeran	-6.883951	107.853424	t
204	95	Cadas Pangeran Sumedang	-6.879328	107.865097	t
205	79	Cagak Nagreg	-7.035918	107.907066	t
206	60	Cakung - PG	-6.182817	106.933449	t
207	60	Cakung - Pulogadung	-6.186977	106.957184	t
208	60	Cakung-Bekasi 	-6.182625	106.934608	t
209	60	Cakung-Cilincing 	-6.186561	106.955276	t
210	60	Cakung-Pulo gadung 	-6.185441	106.949539	t
211	164	Candi	-7.476304	112.714767	t
212	121	Candi Mendut-Kabupaten	-7.605016	110.230469	t
213	121	Candi Pawon	-7.606085	110.219208	t
214	119	Candi Sewu	-7.743885	110.493881	t
215	97	Caringin - Bypass	-6.942988	107.584404	t
216	152	Caruban	-7.548272	111.653862	t
217	152	Caruban	-7.589325	111.606483	t
218	152	Caruban	-7.548443	111.653473	t
219	152	Caruban - Saradan	-7.550740	111.632103	t
220	157	Caruban Muneng & Madiun Ponorogo	-7.490686	111.601418	t
221	152	Caruban arah ke Nganjuk	-7.548207	111.653938	t
222	59	Casablanca Depan Mal Ambassador	-6.224308	106.826797	t
223	59	Cawang	-6.243580	106.858513	t
224	60	Cawang - Jatiwaringin	-6.247430	106.883240	t
225	60	Cawang - Rawamangun - Tanjungpriok	-6.240754	106.877594	t
226	60	Cawang Interchange - TMII	-6.249926	106.875366	t
227	60	Cawang-Cikampek	-6.247537	106.880325	t
228	57	Cekangkareng arah Bandara Soetta	-6.147531	106.728188	t
229	58	Cempaka Mas-Tj. Priok 	-6.164364	106.880234	t
230	58	Cempaka Putih	-6.178934	106.860664	t
231	58	Cempaka Putih - Sunter	-6.168814	106.877716	t
232	57	Cengkareng - Daan Mogot	-6.154507	106.727585	t
233	57	Cengkareng - Grogol	-6.154233	106.728157	t
234	57	Cengkareng - Kamal	-6.153693	106.727135	t
235	57	Cengkareng - Kapuk Raya 	-6.153697	106.727264	t
236	57	Cengkareng - Puri Kembangan	-6.154365	106.727928	t
237	57	Cengkareng - Rawa Bokor	-6.144203	106.728767	t
238	57	Cengkareng Timur	-6.139573	106.730072	t
239	57	Cengkareng arah Jembatan Gantung	-6.154241	106.728188	t
240	57	Cengkareng-Kalideres	-6.145462	106.728683	t
241	57	Cengkareng-Pesing	-6.146571	106.728485	t
242	57	Central Park 	-6.174678	106.791451	t
244	83	Ciamis	-7.326375	108.337524	t
245	83	Ciamis arah ke Tasikmalaya	-7.347651	108.444389	t
246	84	Cianjur - Padalarang	-6.809737	107.149902	t
247	100	Ciawi	-6.656184	106.847504	t
248	100	Ciawi - Puncak	-6.642588	106.847000	t
249	96	Ciawi arah ke Tasikmalaya	-7.163658	108.152603	t
250	82	Cibogo (Puncak)	-6.652111	106.882889	t
251	60	Cibubur - Cijantung	-6.343475	106.868729	t
252	60	Cibubur - Cileungsi	-6.343749	106.868607	t
253	60	Cibubur - Cililitan	-6.358001	106.893242	t
254	80	Ciburuy	-6.832395	107.463844	t
255	79	Cicalengka arah ke Nagrek	-6.987150	107.848000	t
256	58	Cideng-Grogol 	-6.170964	106.811874	t
257	96	Cihaurbeuti arah ke Gentong	-7.218795	108.199997	t
258	96	Cihaurbeuti arah ke Tasikmalaya	-7.218898	108.200363	t
259	60	Cijantung - Pasar Rebo	-6.321271	106.865158	t
260	97	Cijawura	-6.955811	107.654205	t
261	79	Cikalang Barat - Cileunyi	-6.939804	107.739594	t
262	86	Cikaledong - Nagrek Hulu	-7.037382	107.910141	t
263	88	Cikalongsari	-6.369681	107.547806	t
264	88	Cikampek	-6.407662	107.458710	t
265	88	Cikampek - Bekasi	-6.388542	107.395355	t
266	60	Cikampek arah Tol Cawang	-6.247613	106.881073	t
267	81	Cikarang arah Jakarta	-6.337031	107.187248	t
268	33	Cikopak	-6.724993	106.019279	t
269	92	Cikopo (Pertigaan Tol)	-6.440585	107.478928	t
270	99	Cikunir - Bekasi Barat	-6.258579	107.005470	t
271	99	Cikunir - Bekasi Timur	-6.255429	106.996559	t
272	81	Cikunir - Cikarang Barat	-6.267693	107.031235	t
273	36	Cikupa - Jakarta	-6.210101	106.519211	t
274	36	Cikupa - Merak	-6.214538	106.518692	t
275	59	Cilandak 	-6.289001	106.796379	t
276	59	Cilandak - Jl. Raya Ampera	-6.292014	106.799423	t
277	59	Cilandak Tengah	-6.291975	106.801880	t
278	59	Cilandak Tengah-Ampera	-6.289342	106.804916	t
279	59	Ciledug - Cipondoh	-6.238066	106.770584	t
280	59	Ciledug - Fatmawati	-6.238130	106.773399	t
281	59	Ciledug Raya - Ulujami	-6.236440	106.754379	t
282	59	Ciledug Raya arah ke Kebayoran Lama	-6.238045	106.772324	t
283	59	Ciledug arah ke Tangerang	-6.238077	106.770767	t
284	59	Ciledug-Cipulir	-6.238109	106.772774	t
285	59	Ciledug-Kebayoran Lama 	-6.238045	106.770027	t
286	111	Cileduk - Ketanggungan	-6.917290	108.817101	t
287	37	Cilegon	-5.983253	106.032143	t
288	82	Cileungsi - Cibubur	-6.406102	106.967018	t
289	82	Cileungsi - Jonggol	-6.406076	106.966957	t
290	79	Cileunyi	-6.940515	107.745956	t
291	79	Cileunyi - Nareg	-6.945203	107.758003	t
292	60	Cililitan - Cawang	-6.265049	106.873154	t
293	60	Cililitan Besar - Halim 	-6.263662	106.867599	t
294	89	Cilimus - Kuningan	-6.855148	108.502266	t
295	89	Cilimus Kuningan	-6.859707	108.500565	t
296	178	Ciliwung	-7.294502	112.734268	t
297	178	Ciliwung	-7.292086	112.738159	t
298	95	Cimalaka, Sumedang	-6.814338	107.949997	t
299	103	Cimanggis - Cibinong	-6.365098	106.859261	t
300	103	Cimanggis - Cibubur	-6.379000	106.896263	t
301	103	Cimanggis - Ps. Rebo	-6.380556	106.896111	t
302	103	Cimanggis-Ciracas	-6.380919	106.896133	t
303	80	Cimareme	-6.864692	107.503075	t
304	103	Cinere - Fatmawati 	-6.339057	106.780457	t
305	79	Cinunuk - Cileunyi	-6.935565	107.728348	t
306	79	Cinunuk - Cileunyi	-6.939239	107.745110	t
307	80	Cipatat	-6.822754	107.389236	t
308	60	Cipayung - Bogor	-6.328777	106.887077	t
309	60	Cipayung-TMII	-6.326367	106.886993	t
310	60	Cipinang	-6.239325	106.892014	t
311	39	Cipondoh - Cikokol	-6.194902	106.676704	t
312	59	Ciputat - Pd. Cabe - Parung - Sawangan - Bogor	-6.285503	106.775604	t
313	59	Ciputat Raya arah Lebak Bulus	-6.280727	106.772217	t
314	59	Ciputat Raya-Pondok Indah 	-6.278315	106.772690	t
315	59	Ciputat-Gaplek 	-6.284949	106.774666	t
316	59	Ciputat-Lb. Bulus	-6.284959	106.774826	t
317	102	Cirebon - Subang	-6.739598	108.548103	t
318	89	Cirendang Kuningan	-6.951242	108.480438	t
319	40	Cirendeu Raya	-6.307834	106.772537	t
320	82	Cisarua 	-6.677459	106.929504	t
321	80	Cisarua arah Dusun Bambu	-6.791327	107.577103	t
322	82	Cisarua arah ke Puncak	-6.679790	106.932014	t
323	178	Citraland	-7.293405	112.648682	t
324	178	Citraland - Made	-7.283466	112.635780	t
325	58	Citywalk Sudirman	-6.209504	106.817726	t
326	124	Comal	-6.899463	109.524849	t
327	124	Comal	-6.898234	109.532127	t
328	124	Comal arah ke Tegal	-6.899599	109.524902	t
329	60	Condet arah PGC Cililitan	-6.262320	106.864410	t
330	60	Condet-Ranco 	-6.263449	106.863174	t
331	178	DBL Arena	-7.320797	112.732986	t
332	178	DTC Wonokromo	-7.301749	112.739037	t
333	57	Daan Mogot	-6.167308	106.786743	t
334	79	Dago Pakar	-6.866823	107.634239	t
335	79	Dangdeur - Rancaekek	-6.954645	107.770233	t
336	59	Dari Kuningan ke Pancoran lewat Jl. Gatot Subroto	-6.240978	106.836327	t
337	37	Dari Tol Merak	-5.985081	106.034775	t
338	178	Darmo - Ciliwung	-7.291897	112.738907	t
339	178	Darmo - Diponegoro	-7.296236	112.739105	t
340	178	Darmo - Polisi Istimewa	-7.281388	112.740601	t
341	178	Darmo - Urip Sumoharjo	-7.276484	112.741615	t
342	178	Darmo Al- Falah	-7.294937	112.739265	t
343	178	Darmo Boulevard	-7.280060	112.686317	t
344	178	Darmo Indah Selatan	-7.266161	112.684601	t
345	178	Darmo Satelit - HR Muhammad	-7.288446	112.705368	t
346	178	Darmokali - BAT	-7.288611	112.743919	t
347	178	Darmokali - Bengawan	-7.290968	112.742271	t
348	178	Darmokali - Dinoyo	-7.288531	112.743950	t
350	88	Dawuan - Padalarang - Pasteur - Cileunyi	-6.419153	107.419228	t
351	119	Delanggu arah ke Yogyakarta	-7.620558	110.698929	t
352	164	Delta Sari Indah	-7.364297	112.730087	t
353	178	Demak (Mbah Ratu)	-7.233652	112.721146	t
354	178	Demak - Kalianak	-7.232428	112.721275	t
355	97	Depan BCA Dago	-6.897835	107.612862	t
356	79	Depan BRI Kapatang	-7.009605	107.550591	t
357	54	Depan Bandara Adi Sutjipto	-7.783478	110.429932	t
358	59	Depan Cilandak Town Square	-6.292034	106.799225	t
359	59	Depan Citos	-6.292371	106.798462	t
360	58	Depan DPR/MPR - Cawang	-6.206133	106.802155	t
361	59	Depan Epicentrum Jl. H.R. Rasuna Said - Mampang	-6.220476	106.831970	t
362	178	Depan Galaxy Mall	-7.266821	112.775925	t
363	121	Depan Garasi Ramayana	-7.591340	110.291733	t
364	59	Depan Gedung ANTAM (Jl. T. B. Simatupang)	-6.303298	106.842781	t
365	97	Depan Gedung Sate	-6.901296	107.618324	t
366	157	Depan Gontor 3 Jl. Ngawi-Solo	-7.379449	111.245239	t
367	157	Depan Gontor Putri	-7.370341	111.174927	t
368	103	Depan Gunadarma Margonda Depok	-6.368338	106.834000	t
369	58	Depan Halte Harmoni Sentral arah ke Monas dan Gambir	-6.165797	106.820580	t
370	103	Depan ITC Depok	-6.392546	106.824226	t
371	55	Depan JCM Arah Yogya Kota	-7.753325	110.362160	t
372	156	Depan Jembatan Timbang	-7.582625	111.876587	t
373	103	Depan Jl. Stasiun Pondok Cina	-6.369998	106.833588	t
374	61	Depan KBN Cakung	-6.145936	106.923203	t
375	165	Depan KDS	-7.705506	114.006180	t
376	59	Depan Kalibata City	-6.255737	106.852203	t
377	97	Depan Kampus UIN	-6.932263	107.715797	t
378	40	Depan Kampus UIN Jakarta arah Lebak Bulus	-6.307278	106.756157	t
379	135	Depan Kantor Bupati Magelang	-7.498935	110.228294	t
380	135	Depan Kantor Bupati Magelang	-7.498877	110.228340	t
381	51	Depan Kantor Kec. Imogiri	-7.920514	110.381615	t
382	59	Depan Kota Kasablanka	-6.224654	106.842964	t
383	54	Depan Lapangan Denggung	-7.721347	110.361359	t
384	97	Depan Lapangan Tegalega	-6.936204	107.603790	t
385	121	Depan Laris Swalayan	-7.583513	110.286461	t
386	57	Depan MTA - Cawang	-6.173809	106.790520	t
387	54	Depan Makam Pahlawan Nasional	-7.740611	110.362831	t
388	156	Depan Mako Kertosono	-7.503748	112.135025	t
389	156	Depan Mako Kertosono	-7.591005	112.101982	t
390	61	Depan Mal Kelapa Gading	-6.158353	106.906792	t
391	103	Depan Mall Depok	-6.387252	106.827362	t
392	147	Depan Mapolres	-8.175406	113.700661	t
393	96	Depan Masjid Agung Singaparna	-7.349919	108.110321	t
394	146	Depan McDonald's Jl Veteran	-7.171431	112.653748	t
395	57	Depan Metro TV	-6.186993	106.758415	t
396	99	Depan Monumen Pancasila Sakti (Lubang Buaya)	-6.290212	106.906738	t
397	121	Depan Nasmoco Mertoyudan	-7.537121	110.234390	t
398	60	Depan PGC Cililitan arah UKI	-6.262667	106.866119	t
399	97	Depan Pasar Andir	-6.918002	107.590881	t
400	156	Depan Pasar Bagor	-7.568927	111.849426	t
401	156	Depan Pasar Bagor	-7.569054	111.849533	t
402	153	Depan Pasar Barat	-7.561078	111.449646	t
403	101	Depan Pasar Baros	-6.896232	107.536552	t
404	153	Depan Pasar Baru	-7.654256	111.333092	t
405	162	Depan Pasar Bayeman	-7.735061	113.119072	t
406	86	Depan Pasar Malangbong	-7.060952	108.086899	t
407	151	Depan Pasar Ranuyoso	-7.950352	113.259987	t
408	153	Depan Pasar Sayur	-7.646935	111.329407	t
409	97	Depan Pasar UjungBerung	-6.913678	107.701912	t
410	103	Depan Perumahan Pesona Khayangan	-6.382354	106.829819	t
411	103	Depan Perumahan Sawangan Permai	-6.409695	106.776794	t
412	59	Depan Pintu Gerbang TMP Kalibata arah Pasar Minggu	-6.255663	106.848236	t
413	99	Depan Plaza Pondok Gede	-6.283881	106.910370	t
414	58	Depan Plaza Semanggi	-6.220553	106.813225	t
415	59	Depan Polda Metro Jaya (Semanggi)	-6.222417	106.814148	t
416	129	Depan Polsek Kecamatan Sidoharjo	-7.436055	110.986954	t
417	156	Depan Polsek Kediri	-7.711906	112.072609	t
418	151	Depan Polsek Klakah	-7.996507	113.250587	t
419	121	Depan Polsek Muntilan	-7.583492	110.289185	t
420	97	Depan Polsek Sukajadi	-6.888435	107.596848	t
421	178	Depan Polsek Waru	-7.360653	112.729347	t
422	59	Depan Pondok Indah Mall (arah Lebak Bulus)	-6.263865	106.784256	t
423	110	Depan Pt.Sriwahana 	-7.585640	110.711983	t
424	79	Depan RS Al-Ihsan, Baleendah	-7.007492	107.624245	t
425	97	Depan RS Al-Islam	-6.938867	107.668655	t
426	54	Depan RS. JIH	-7.758832	110.402832	t
427	139	Depan RS. Ortopedi Solo	-7.558313	110.774200	t
428	54	Depan RS. UGM	-7.742822	110.349350	t
429	53	Depan RSU PKU Muhammadiyah Wates	-7.867314	110.149445	t
430	164	Depan RSUD	-7.465603	112.716919	t
431	86	Depan RSUD Dr. Slamet	-7.220342	107.896568	t
432	99	Depan Raffles Hills Cibubur	-6.375921	106.903770	t
433	175	Depan Rest Area Mlirip	-7.447816	112.451653	t
434	58	Depan Rumah Makan Pulo Dua Senayan arah Perempatan Slipi	-6.210183	106.805290	t
435	119	Depan SAMSAT Delanggu	-7.598987	110.703171	t
436	119	Depan SAMSAT Delanggu	-7.599024	110.703217	t
437	97	Depan SD Cijerah	-6.926190	107.564293	t
438	121	Depan SMP N 1 SECANG(Jl.Semarang-Yogya)	-7.389982	110.248856	t
439	153	Depan SMPN 2 Magetan	-7.613114	111.400887	t
440	165	Depan SPBU Utama Raya	-7.699403	113.950005	t
441	157	Depan Stadion Ketonggo	-7.418525	111.442055	t
442	99	Depan Stasiun Bekasi	-6.236680	106.998695	t
443	59	Depan Stasiun Kebayoran Lama	-6.236239	106.783112	t
444	99	Depan Stasiun Kranji	-6.224427	106.978317	t
445	55	Depan Stasiun Lempuyangan	-7.790392	110.375809	t
446	59	Depan Stasiun Lenteng Agung arah Margonda dan Kelapa Dua	-6.330649	106.835281	t
447	58	Depan Stasiun Palmerah	-6.207114	106.797234	t
448	121	Depan Swalayan Laris Muntilan	-7.583469	110.286400	t
449	59	Depan Taman Lenteng Agung arah Stasiun Lenteng Agung	-6.322847	106.835754	t
450	178	Depan Taman Pondok Indah	-7.313832	112.697388	t
451	121	Depan Tape Ketan Muntilan-Semarang	-7.589984	110.290977	t
452	121	Depan Tape Ketan Muntilan-YK	-7.590256	110.290947	t
453	97	Depan Terminal Leuwi Panjang	-6.946726	107.592781	t
454	86	Depan Toserba Asia Garut	-7.215909	107.908669	t
455	59	Depan Trans TV	-6.241778	106.828201	t
456	58	Depan UI Salemba arah Senen	-6.194766	106.849525	t
457	60	Depan UKI dari Cililitan	-6.250233	106.873474	t
458	55	Depan UTY Yogyakarta	-7.746979	110.355499	t
459	97	Depan Ujung Berung Indah	-6.913774	107.695801	t
460	139	Depan Universitas Sebelas Maret	-7.564641	110.855797	t
461	52	Depan Webgopark Jl. Yogya-Wonosari	-7.872479	110.526154	t
462	93	Depan Yogya Grand Subang	-6.563437	107.766457	t
463	178	Depan makam Pegirian	-7.224482	112.747833	t
464	59	Deplu - Pd. Pinang	-6.280192	106.806938	t
465	59	Deplu Raya Bintaro arah Pondok Pinang	-6.272870	106.769325	t
466	103	Depok Town Center (Jl. Raya Sawangan)	-6.394531	106.794067	t
467	103	Depok Town Square	-6.372839	106.832756	t
468	103	Dewi Sartika	-6.399812	106.816551	t
469	59	Dewi Sartika - Jl. Raya Kalibata - TL TMP Kalibata	-6.257460	106.857445	t
470	178	Dharmahusada	-7.272610	112.776764	t
471	174	Dieng - Galunggung	-7.973324	112.613037	t
472	178	Dinoyo BAT	-7.288497	112.744057	t
473	178	Diponegoro (KBS)	-7.295662	112.738762	t
474	178	Diponegoro - Banyu Urip	-7.275213	112.726692	t
475	178	Diponegoro - Dr Soetomo	-7.284700	112.733330	t
476	178	Diponegoro - Kartini	-7.278208	112.729340	t
477	178	Diponegoro - Kutai	-7.290335	112.736145	t
478	178	Diponegoro - Musi	-7.286360	112.734512	t
479	178	Diponegoro - Pasar Kembang	-7.274968	112.726891	t
480	148	Diwek	-7.635946	112.214439	t
481	178	Dk Kupang - Simo Kwagean	-7.280240	112.717117	t
482	152	Dolopo	-7.787640	111.531982	t
483	152	Dolopo	-7.787704	111.531914	t
484	152	Dolopo	-7.787725	111.534859	t
485	146	Domas	-7.282444	112.564201	t
486	167	Dongko	-8.216630	111.533379	t
487	178	Dr Soetomo	-7.281891	112.739342	t
488	178	Dr. Soetomo - Raya Darmo	-7.281507	112.740196	t
489	178	Driyorejo	-7.305580	112.652115	t
490	178	Driyorejo - Bambe	-7.335929	112.659927	t
491	146	Duduk Sampeyan	-7.154229	112.520515	t
492	58	Dukuh Atas - Bundaran Hotel Indonesia	-6.203002	106.822594	t
493	58	Dukuh Atas arah Semanggi	-6.203029	106.822769	t
494	178	Dukuh Kupang Timur	-7.282263	112.716629	t
495	178	Dupak - Demak	-7.245237	112.720970	t
496	178	Dupak - Pasar Turi	-7.246240	112.733871	t
497	178	Dupak - Semarang	-7.246344	112.733765	t
498	178	Dupak - Tol Sby - Gresik	-7.245258	112.720734	t
499	178	Dupak Raya	-7.245258	112.722878	t
500	59	Duren Tiga-Mampang	-6.254298	106.830002	t
501	59	Duren Tiga-Pejaten 	-6.254320	106.827881	t
502	167	Durenan	-8.101294	111.818077	t
503	178	Embong Malang	-7.259648	112.735626	t
504	178	Embong Malang - Kedung Doro	-7.258557	112.733192	t
505	178	Embong Malang - Tidar	-7.258446	112.733139	t
506	87	Eretan (Indramayu)	-6.328068	108.082077	t
507	87	Eretan (Indramayu)	-6.327809	108.081871	t
508	90	Exit Cipali Kertajati	-6.700939	108.173508	t
509	36	Exit GT Balaraja Barat	-6.200160	106.458977	t
510	128	Exit GT Bawen	-7.245354	110.447166	t
511	140	Exit GT Brebes Timur	-6.893681	109.065659	t
512	85	Exit GT Palimanan	-6.799242	108.621674	t
513	97	Exit GT Pasteur	-6.890267	107.573799	t
514	178	Exit SIER	-7.335990	112.763420	t
515	85	Exit Tegal Karang	-6.689769	108.427902	t
516	85	Exit Tegal Karang (Tol Palimanan)	-6.689649	108.425682	t
517	178	Exit Tol Banyu Urip	-7.260542	112.709145	t
518	164	Exit Tol Berbek	-7.343146	112.760147	t
519	111	Exit Tol Brebes	-6.897286	108.881378	t
520	79	Exit Tol Cileunyi dari arah Jakarta	-6.944260	107.749344	t
521	178	Exit Tol Gunung Sari	-7.310081	112.710846	t
523	60	Exit Tol Jagorawi arah UKI/RS. POLRI	-6.274895	106.872940	t
524	60	Exit Tol Jatiwaringin 	-6.255706	106.909355	t
525	61	Exit Tol Jembatan Tiga dari Cawang	-6.132362	106.796394	t
526	85	Exit Tol Kanci	-6.799173	108.617180	t
527	146	Exit Tol Kebomas Gresik	-7.167746	112.595291	t
528	164	Exit Tol Kejapanan	-7.552186	112.689560	t
529	148	Exit Tol Kertosono - Mojokerto (Ploso)	-7.492452	112.238625	t
530	146	Exit Tol Manyar arah Bungah	-7.123931	112.606476	t
531	178	Exit Tol Margomulyo	-7.239394	112.681747	t
532	85	Exit Tol Palikanci Tegal Karang	-6.689937	108.429070	t
533	160	Exit Tol Pandaan - Malang	-7.664081	112.707260	t
534	160	Exit Tol Pandaan-Kebun Raya Purwodadi	-7.664379	112.707176	t
535	178	Exit Tol Pasar Turi	-7.244364	112.713013	t
536	111	Exit Tol Pejagan	-6.894352	108.884651	t
537	178	Exit Tol Satelit	-7.290394	112.699974	t
538	164	Exit Tol Sidoarjo	-7.444794	112.698868	t
539	141	Exit Tol Suramadu - Madura	-7.158008	112.781982	t
540	178	Exit Tol Tandes	-7.241142	112.682663	t
541	178	Exit Tol Waru	-7.346208	112.714943	t
542	178	FR A. Yani	-7.332758	112.730797	t
543	59	FX Sudirman - Semanggi	-6.225040	106.804352	t
544	59	Fatmawati - Cilandak 	-6.276332	106.797432	t
545	59	Fatmawati - Lb. Bulus	-6.262916	106.796829	t
546	59	Fatmawati - Lebak Bulus	-6.292477	106.794266	t
547	59	Fatmawati arah T.B. Simatupang	-6.291834	106.795212	t
548	59	Fatmawati-Blok A 	-6.263454	106.798317	t
549	154	Fly Over Arjosari	-7.916858	112.654556	t
550	154	Fly Over Arjosari - Simpang 3 Karanglo	-7.916136	112.654968	t
551	148	Fly Over Peterongan	-7.541317	112.278641	t
552	57	Flyover Bandengan arah Jembatan Tiga	-6.136555	106.800804	t
553	59	Flyover Casablanca - Tanah Abang	-6.225606	106.835487	t
554	101	Flyover Cimindi	-6.895955	107.560196	t
555	58	Flyover Galur - Pulogadung 	-6.177932	106.842896	t
556	58	Flyover Galur dari Senen arah Cempaka Putih	-6.178015	106.842682	t
557	57	Flyover Grogol	-6.168524	106.787857	t
558	57	Flyover Grogol - Latumenten	-6.167878	106.788017	t
559	57	Flyover Grogol - Tomang	-6.177324	106.794579	t
560	57	Flyover Grogol arah Simpang Tomang	-6.166846	106.788574	t
561	55	Flyover Janti - Solo	-7.783516	110.410515	t
562	60	Flyover Jatinegara	-6.215188	106.873993	t
563	58	Flyover Jl. Pramuka	-6.198448	106.854950	t
564	55	Flyover Jombor - Ring Road Utara	-7.747019	110.362488	t
565	55	Flyover Jombor Yogya - Magelang	-7.748924	110.362213	t
566	55	Flyover Jombor Yogya - Solo	-7.747882	110.362549	t
567	57	Flyover Kemanggisan	-6.189547	106.797035	t
568	97	Flyover Kiaracondong	-6.924430	107.644440	t
569	59	Flyover Kuningan - Semanggi	-6.236930	106.827179	t
570	154	Flyover Lawang	-7.823961	112.703056	t
571	59	Flyover MT Haryono	-6.243409	106.856384	t
572	178	Flyover Pasar Kembang	-7.273845	112.727150	t
573	60	Flyover Pasar Rebo	-6.306375	106.864990	t
574	97	Flyover Pasupati (arah Barat)	-6.900316	107.597137	t
575	97	Flyover Pasupati (arah Timur)	-6.898841	107.607018	t
576	97	Flyover Pasupati (arah turun ke Dago)	-6.898181	107.608070	t
577	97	Flyover Pasupati (arah turun ke Jl. Pasteur - Jl. Cihampelas)	-6.900151	107.604927	t
578	97	Flyover Pasupati arah Gasibu	-6.898692	107.611198	t
579	57	Flyover Pesing	-6.157936	106.760292	t
580	57	Flyover Pesing arah Grogol	-6.157909	106.760361	t
581	57	Flyover Pesing arah Tangerang	-6.157954	106.760139	t
582	58	Flyover Senen - Gunung Sahari	-6.181321	106.842621	t
583	39	Flyover Tangerang	-6.185099	106.642914	t
584	61	Flyover Tol Pluit	-6.129406	106.780807	t
585	164	Flyover Trosobo	-7.369319	112.655312	t
586	178	Flyover Waru	-7.356572	112.729233	t
587	178	Flyover Wonokromo	-7.305324	112.736206	t
588	178	Frontage A Yani - Ketintang	-7.312805	112.734596	t
589	178	Frontage A. Yani (UINSA)	-7.320850	112.733360	t
590	178	Frontage Ketintang - A Yani	-7.309921	112.735069	t
591	178	Frontage RSAL	-7.308964	112.735855	t
592	58	GBK 	-6.218719	106.806847	t
593	61	GT Ancol	-6.127215	106.845329	t
594	36	GT Balaraja Barat	-6.204558	106.461708	t
595	178	GT Banyu Urip	-7.260052	112.709145	t
596	138	GT Banyumanik (Krapyak)	-7.065854	110.431831	t
597	101	GT Baros	-6.898532	107.540596	t
598	101	GT Baros I	-6.897670	107.541435	t
599	128	GT Bawen	-7.248682	110.436462	t
600	99	GT Bekasi Barat	-6.250246	106.988792	t
601	99	GT Bekasi Barat dari Cawang	-6.248657	106.979210	t
602	99	GT Bekasi Timur	-6.261609	107.016853	t
603	36	GT Bitung	-6.221176	106.569763	t
604	140	GT Brebes Timur	-6.893611	109.064217	t
605	97	GT Buah Batu	-6.961450	107.636513	t
606	58	GT Cempaka Putih arah Halim	-6.175459	106.876213	t
607	58	GT Cempaka Putih dari Cawang	-6.175687	106.876083	t
608	57	GT Cengkareng	-6.105662	106.696480	t
609	57	GT Cengkareng 2	-6.105017	106.697746	t
610	100	GT Ciawi - Puncak	-6.643717	106.847572	t
611	81	GT Cibatu	-6.331528	107.162445	t
612	81	GT Cibitung	-6.289134	107.081161	t
613	103	GT Cibubur	-6.361730	106.893730	t
614	99	GT Cibubur Utama	-6.370093	106.895569	t
615	103	GT Cibubur arah Jambore	-6.362990	106.894218	t
616	103	GT Cijago - Cimanggis	-6.381996	106.870712	t
617	103	GT Cijago - Depok	-6.381993	106.870682	t
618	92	GT Cikampek	-6.439974	107.476730	t
619	81	GT Cikarang Utama	-6.303382	107.120850	t
620	92	GT Cikopo	-6.458183	107.509171	t
621	99	GT Cikunir	-6.253469	106.958046	t
622	36	GT Cikupa	-6.205424	106.523750	t
623	36	GT Cikupa - Merak	-6.205523	106.523949	t
624	36	GT Cikupa arah Jl. Raya Pasar Kemis	-6.205662	106.523346	t
625	37	GT Cilegon Barat	-5.984198	106.033134	t
626	37	GT Cilegon Timur	-6.023208	106.089142	t
627	79	GT Cileunyi	-6.944064	107.750412	t
628	79	GT Cileunyi (arah Keluar)	-6.944724	107.748299	t
629	60	GT Cililitan	-6.267096	106.872826	t
630	60	GT Cililitan 3	-6.268010	106.872627	t
631	103	GT Cimanggis	-6.380919	106.896133	t
632	103	GT Cimanggis Utama	-6.409693	106.897827	t
633	85	GT Ciperna Utara	-6.768091	108.533707	t
634	103	GT Cisalak 2	-6.381989	106.870659	t
635	35	GT Ciujung	-6.143680	106.289314	t
636	178	GT Dupak	-7.244641	112.713371	t
637	178	GT Dupak 3	-7.246833	112.709404	t
638	57	GT Gedong Panjang dari Cawang	-6.130734	106.808945	t
639	178	GT Gn. Sari	-7.310411	112.710670	t
640	178	GT Gunungsari - Waru	-7.308091	112.706146	t
641	60	GT Halim	-6.245188	106.889030	t
642	60	GT Halim 2	-6.246275	106.887451	t
643	60	GT Jagorawi arah UKI	-6.255281	106.871376	t
644	60	GT Jatiwaringin	-6.255845	106.908943	t
645	99	GT Kalimalang 2	-6.246524	106.955681	t
646	57	GT Kamal - Pluit	-6.114995	106.732155	t
647	61	GT Kapuk	-6.121854	106.768738	t
648	39	GT Karang Tengah	-6.196226	106.713654	t
649	39	GT Karang Tengah - Kebon Jeruk - Tomang	-6.195998	106.713799	t
650	39	GT Karang Tengah dari Kunciran	-6.196229	106.713470	t
651	88	GT Karawang Barat	-6.348633	107.265144	t
652	60	GT Kebon Nanas	-6.226323	106.875031	t
653	164	GT Kejapanan	-7.552293	112.690201	t
654	61	GT Kemayoran	-6.125844	106.851486	t
655	97	GT Kopo	-6.955768	107.580292	t
656	61	GT Mall of Indonesia arah Kelapa Gading	-6.151179	106.889336	t
657	178	GT Margomulyo	-7.241045	112.684502	t
658	37	GT Merak	-5.985688	106.035210	t
659	37	GT Merak	-5.972946	106.008583	t
660	85	GT Mertapada	-6.829566	108.639160	t
661	97	GT Moh. Toha	-6.956567	107.609772	t
662	80	GT Padalarang	-6.852847	107.500130	t
663	85	GT Palimanan	-6.689756	108.417397	t
664	85	GT Palimanan - Kanci	-6.799487	108.622490	t
665	160	GT Pandaan	-7.663529	112.707153	t
666	97	GT Pasir Koja	-6.931401	107.570091	t
667	97	GT Pasteur	-6.890523	107.574532	t
668	178	GT Perak	-7.231358	112.719894	t
669	61	GT Pluit 	-6.128282	106.779556	t
670	85	GT Plumbon	-6.702084	108.485840	t
671	60	GT Pondok Gede Barat 1 dari Cawang	-6.255520	106.907684	t
672	60	GT Rawamangun	-6.203869	106.873360	t
673	178	GT Satelit	-7.260393	112.708572	t
674	59	GT Semanggi	-6.224004	106.815460	t
675	59	GT Semanggi 1	-6.223678	106.815552	t
676	38	GT Serang	-6.087194	106.141319	t
677	38	GT Serang Barat	-6.089740	106.148827	t
678	38	GT Serang Timur	-6.115209	106.184792	t
679	164	GT Sidoarjo	-7.442263	112.697456	t
680	57	GT Slipi 1 arah Tomang	-6.200730	106.799049	t
681	61	GT Sunter	-6.156180	106.885124	t
682	61	GT Sunter (Podomoro)	-6.153216	106.886925	t
683	178	GT Tandes Barat	-7.240038	112.681068	t
684	59	GT Tegal Parang	-6.240628	106.833427	t
685	178	GT Tol Waru Utama	-7.347662	112.710495	t
686	178	GT Waru - Surabaya	-7.340143	112.712837	t
688	40	GTPd. Ranji	-6.283925	106.734474	t
689	36	Gading Serpong	-6.243175	106.620102	t
690	100	Gadog (Puncak)	-6.655123	106.861160	t
691	100	Gadog - Puncak	-6.655353	106.859100	t
692	178	Gajah Mada	-7.301866	112.722023	t
693	58	Galur arah Senen	-6.174522	106.854370	t
694	59	Gandaria City 	-6.243569	106.785179	t
695	59	Gandaria City - Pondok Indah	-6.243633	106.782608	t
696	59	Gandaria City - Simprug 	-6.243783	106.785156	t
697	59	Gandaria-Permata Hijau 	-6.243377	106.785286	t
698	39	Gang Ambon, Tangerang	-6.210933	106.686066	t
699	121	Garasi Ramayana Muntilan	-7.592289	110.292473	t
700	143	Garum	-8.041085	112.243561	t
701	86	Garut arah ke Bandung	-7.173335	107.892181	t
702	58	Gatot Subroto	-6.217588	106.811440	t
703	58	Gatsu - Slipi	-6.217695	106.810730	t
704	144	Gayam	-7.138133	111.725677	t
705	178	Gayung Kebon Sari	-7.329079	112.722168	t
706	178	Gayungsari	-7.336482	112.724594	t
707	57	Gd. Panjang-Pluit 	-6.130954	106.805473	t
708	164	Gedangan	-7.387705	112.728043	t
709	155	Gedeg-Lengkong-Nganjuk	-7.441709	112.397087	t
710	60	Gedong-Lt. Agung 	-6.304102	106.848717	t
711	60	Gedong-Pd. Indah 	-6.304281	106.850182	t
712	59	Gedung LIPI	-6.228517	106.818329	t
713	58	Gedung MPR/DPR RI	-6.207063	106.802650	t
714	58	Gedung Pramuka Gambir	-6.175436	106.830719	t
715	54	Gedung Pusat UGM	-7.767230	110.378746	t
716	55	Gedung TVRI	-7.765253	110.361572	t
717	58	Gelora Bung Karno (Jakarta)	-6.218311	106.801811	t
718	178	Gelora Bung Tomo	-7.222173	112.617790	t
720	81	Gemalapik arah ke Lippo Cikarang	-6.316762	107.138268	t
687	178	GT Waru 4	-7.345631	112.715614	t
721	178	Gemblongan - Genteng Kali	-7.255720	112.736984	t
722	178	Gemblongan - Tunjungan	-7.255444	112.736916	t
723	178	Gembong - Kb. Jepun	-7.238532	112.744553	t
724	160	Gempol	-7.592026	112.690544	t
725	97	Genangan air cukup tinggi	-6.923626	107.687798	t
726	157	Gendingan	-7.393738	111.222443	t
727	157	Gendingan	-7.392259	111.223099	t
728	178	Genteng Besar	-7.259052	112.741653	t
729	178	Genteng Kali	-7.256072	112.739105	t
730	178	Genteng Kali - Ambengan	-7.256093	112.741463	t
731	178	Genteng Kali - Siola	-7.256402	112.742882	t
732	178	Genteng Kali - Undaan	-7.255710	112.742737	t
733	58	Gerbang Pemuda - Semanggi	-6.212930	106.808250	t
734	57	Gerbang Tol Cengkareng	-6.105661	106.696465	t
735	58	Gereja Katedral Jakarta	-6.169680	106.832993	t
736	178	Giant Margorejo - Bundaran Dolog	-7.315391	112.734467	t
737	142	Gilimanuk-Ketapang	-8.143057	114.401169	t
738	162	Gn Bromo	-7.941256	112.948380	t
739	54	Godean-Sleman	-7.804818	110.300934	t
740	117	Gombong (Kebumen)	-7.608366	109.507896	t
741	58	Grand Indonesia-Thamrin City 	-6.194848	106.820801	t
742	97	Grand Yogya Kepatihan	-6.924086	107.605629	t
743	160	Grati (depan SMA 1 Grati)	-7.713937	113.018517	t
744	178	Greges	-7.229533	112.687431	t
745	57	Grogol - Cengkareng - Kalideres	-6.166858	106.787659	t
746	57	Grogol - Daan Mogot - Pesing	-6.166864	106.787727	t
747	57	Grogol - Roxy	-6.166733	106.789566	t
748	57	Grogol - Semanggi	-6.162262	106.790184	t
749	57	Grogol - Tomang	-6.162351	106.790451	t
750	57	Grogol arah Jl. Gajah Mada	-6.166352	106.794243	t
751	57	Grogol arah Latumenten	-6.169412	106.787712	t
752	178	Gubeng - Karimun	-7.273882	112.746964	t
753	178	Gubeng - Pemuda	-7.266395	112.750946	t
754	178	Gubeng Kertajaya	-7.275718	112.757309	t
755	178	Gubeng Pojok	-7.262904	112.750259	t
756	178	Gubeng Pojok - Pemuda	-7.266480	112.750885	t
757	178	Gubeng Pojok - Sumatera	-7.266087	112.751266	t
758	178	Gubernur Suryo	-7.263458	112.742813	t
759	178	Gubernur Suryo - Grahadi	-7.263530	112.743156	t
760	178	Gubernur Suryo - Panglima Sudirman	-7.264585	112.745583	t
761	121	Gulon	-7.600981	110.298248	t
762	164	Gunung Anyar	-7.340377	112.783142	t
763	178	Gunung Anyar	-7.331587	112.810257	t
764	82	Gunung Putri 	-6.429964	106.929070	t
765	61	Gunung Sahari - Mangga Dua	-6.135006	106.831863	t
766	178	Gunung Sari (Bhumi Marinir)	-7.307346	112.714943	t
767	178	Gunung Sari (Hotel Singgasana)	-7.307527	112.716530	t
768	178	Gunung Sari (Ps. Ikan)	-7.305729	112.724167	t
769	178	Gunung Sari (Rolak)	-7.307262	112.719597	t
770	178	Gunung Sari - Gajah Mada	-7.303838	112.725548	t
771	178	Gunung Sari - Kedurus	-7.311794	112.710068	t
772	178	Gunungsari	-7.307517	112.715736	t
773	159	Gurem	-7.166875	113.461754	t
774	159	Gurem	-7.164171	113.449997	t
775	156	Guyangan	-7.583731	111.878448	t
776	178	HR Mohammad	-7.284317	112.691849	t
777	178	HR Muhammad	-7.285679	112.697281	t
778	178	HR Muhammad - Darmo Boulevard	-7.281444	112.684944	t
779	178	HR Muhammad - Darmo Satelit	-7.286339	112.700653	t
780	178	HR Muhammad - Ngesong	-7.283636	112.689774	t
781	178	HR Muhammad - Satelit	-7.287233	112.703957	t
782	178	HR Muhammad PTC	-7.283274	112.688873	t
783	178	HR. Muhammad	-7.282332	112.685509	t
784	60	Halim-Pancoran	-6.246598	106.886932	t
785	58	Halimun arah Manggarai	-6.205145	106.833939	t
786	57	Halte Busway Kebon Jeruk	-6.194422	106.768852	t
787	58	Halte Transjakarta Galur	-6.174470	106.854774	t
788	178	Hang Tuah - Ujung Perak	-7.224057	112.740929	t
789	58	Hayam Wuruk - Harmoni	-6.162007	106.819794	t
790	178	Hayam Wuruk - Kutai	-7.293469	112.732475	t
791	58	Hotel Sultan	-6.218228	106.809532	t
792	178	Hr Muhammad - PTC	-7.281401	112.684784	t
793	165	Hutan Baluran	-7.723005	113.999657	t
794	165	Hutan Baluran	-7.722984	113.999825	t
795	40	ITC BSD - BSD Plaza	-6.285258	106.664780	t
796	40	ITC BSD-BSD Plaza	-6.285951	106.663345	t
797	59	ITC Permata Hijau arah Jl. Panjang	-6.221442	106.783104	t
798	83	Imbanagara	-7.317403	108.308212	t
799	57	Indosiar	-6.164449	106.775116	t
800	178	Indrapura (DPRD)	-7.241605	112.732964	t
801	178	Indrapura - Rajawali	-7.234530	112.730713	t
802	178	Ir. H. Soekarno - Mulyorejo 	-7.263458	112.783005	t
803	58	Istana Merdeka	-6.169932	106.823204	t
804	61	JICT Jakarta (Tanjung Priok)	-6.102181	106.895042	t
805	97	JL Aria Jipang	-6.899837	107.615845	t
806	97	JL Braga - Jl. Suniaraja	-6.916287	107.608963	t
807	97	JL PH. H Mustofa (depan SMPN 16 Bandung)	-6.899720	107.642487	t
808	102	JL. Karang Getas (Depan Asia Toserba)	-6.714652	108.562622	t
809	125	JL. Purbalingga - Klampok	-7.306261	109.367973	t
810	88	JL. Raya Klari	-6.359594	107.352165	t
811	59	JLNT Antasari - T.B. Simatupang	-6.279256	106.807571	t
812	59	JLNT Antasari arah Blok M	-6.277656	106.808266	t
813	59	JLNT Antasari arah Fatmawati	-6.279228	106.807579	t
814	59	JLNT Kp. Melayu - Tanah Abang	-6.225697	106.831039	t
815	59	JLNT Tanah Abang - Casablanca	-6.215482	106.818581	t
816	57	JPO Harapan Kita	-6.184822	106.796982	t
817	81	Jababeka 2	-6.297618	107.149101	t
818	154	Jabon Garut Kasembon 	-7.795527	112.349648	t
819	59	Jagakarsa-Lt. Agung	-6.331187	106.834572	t
820	59	Jagakarsa-Ragunan 	-6.326645	106.819702	t
821	178	Jagalan	-7.248238	112.745735	t
822	178	Jagalan - Kalianyar	-7.248492	112.746849	t
823	178	Jagalan - Pasar Besar	-7.248153	112.744980	t
824	178	Jagalan - Undaan	-7.248334	112.746613	t
825	178	Jagir - Panjang Jiwo	-7.306334	112.761116	t
826	178	Jagir Wonokromo	-7.302770	112.747536	t
827	178	Jagir Wonokromo - Nginden	-7.306261	112.760796	t
828	178	Jaksa Agung Suprapto	-7.258583	112.746567	t
829	178	Jalan Ahmad Yani	-7.340079	112.729317	t
830	178	Jalan Ahmad Yani	-7.333333	112.730713	t
831	159	Jalan Bandaran	-7.216542	113.395912	t
832	175	Jalan By Pass Mojokerto	-7.445752	112.459274	t
833	178	Jalan Ciliwung	-7.293703	112.735283	t
834	164	Jalan Diponegoro	-7.543997	112.697754	t
835	155	Jalan Gajah Mada	-7.512130	112.549629	t
836	147	Jalan Gajah Mada	-8.195498	113.637924	t
837	178	Jalan HR. Mohammad	-7.286488	112.701340	t
838	153	Jalan Kunthi	-7.647855	111.329956	t
839	153	Jalan Maospati arah Ngawi	-7.555526	111.426476	t
840	178	Jalan Pahlawan	-7.248217	112.738373	t
841	178	Jalan Pemuda	-7.265735	112.749207	t
842	178	Jalan Perak Barat	-7.204663	112.733719	t
843	178	Jalan Perak Timur	-7.215754	112.733376	t
844	178	Jalan Rangkah	-7.244726	112.761482	t
845	144	Jalan Raya Balen	-7.186909	111.979134	t
846	159	Jalan Raya Bandaran	-7.215286	113.395775	t
847	165	Jalan Raya Banyuglugur	-7.699892	113.932747	t
848	164	Jalan Raya Gilang arah Krian	-7.363020	112.670181	t
849	151	Jalan Raya Grobogan	-8.036156	113.233208	t
850	164	Jalan Raya Kletek	-7.359956	112.678246	t
851	162	Jalan Raya Leces	-7.844676	113.229027	t
852	162	Jalan Raya Leces, Ranuyoso	-7.843401	113.228470	t
853	154	Jalan S. Parman - Simpang 3 Basuki Rahmat	-8.172900	112.673637	t
854	178	Jalan Sukolilo	-7.226143	112.775406	t
855	155	Jalan Totok Kerot	-7.531340	112.409233	t
856	146	Jalan Veteran	-7.181139	112.649582	t
857	174	Jalan Veteran	-7.956323	112.612373	t
858	152	Jalur Nampu-Wadukan-Kaligunting-Caruban	-7.551272	111.692268	t
859	177	Jalur Pantura	-7.753751	113.204048	t
860	165	Jalur Pantura	-7.706611	114.003647	t
861	146	Jalur Pantura Duduksampeyan	-7.154995	112.521111	t
862	82	Jalur Puncak - Cianjur	-6.652044	106.883324	t
863	79	Jalur Wisata Ciwidey	-7.099843	107.471069	t
864	155	Jampirogo	-7.514215	112.424294	t
865	155	Jampirogo	-7.514109	112.424622	t
866	39	Janger - Merak	-6.208565	106.697418	t
867	87	Jangga	-6.395078	108.173729	t
868	99	Jati Warna - Cikunir	-6.310095	106.928452	t
869	99	Jatiasih - Pd. Indah	-6.300412	106.950661	t
870	92	Jatiluhur	-6.559930	107.425011	t
871	95	Jatinangor (Depan ITB Jatinangor)	-6.934186	107.768333	t
872	95	Jatinangor (depan jatos)	-6.933946	107.771309	t
873	60	Jatinegara arah Kebon Nanas	-6.214876	106.874374	t
874	60	Jatinegara-Kp. Melayu	-6.223465	106.866028	t
875	99	Jatiwarna	-6.310948	106.924438	t
876	99	Jatiwarna arah TMII	-6.310207	106.927826	t
877	164	Java Pacific - Krian	-7.410772	112.585205	t
880	178	Jembatan Branjagan	-7.224419	112.663162	t
881	79	Jembatan Citarum, Katapang	-6.991114	107.626434	t
882	124	Jembatan Comal	-6.899320	109.525742	t
883	155	Jembatan Gajah Mada	-7.521278	112.568024	t
884	57	Jembatan Gantung	-6.155475	106.749191	t
885	57	Jembatan Gantung - Pesing	-6.155395	106.749275	t
886	57	Jembatan Gantung arah Cengkareng	-6.155587	106.749237	t
887	178	Jembatan Karang pilang	-7.343378	112.695137	t
888	156	Jembatan Kertosono	-7.604660	112.083229	t
889	156	Jembatan Kertosono	-7.615741	112.106834	t
890	154	Jembatan Lawang	-7.830859	112.697281	t
891	174	Jembatan Layang Arjosari	-7.923022	112.651855	t
892	59	Jembatan Layang Kapten Tendean - Pancoran	-6.240079	106.825844	t
893	164	Jembatan Legundi	-7.387503	112.577118	t
894	178	Jembatan Merah	-7.236659	112.738167	t
895	155	Jembatan Miagan Mojoagung	-7.568863	112.356834	t
896	155	Jembatan Miagan-Mojoagung	-7.570246	112.350609	t
897	178	Jembatan Ngelom arah Karangpilang	-7.345495	112.691727	t
898	155	Jembatan Pageruyung - Gempolkerep	-7.456667	112.377174	t
899	148	Jembatan Ploso	-7.445305	112.224632	t
900	178	Jembatan Rolak arah Gunungsari	-7.308187	112.718903	t
901	178	Jembatan Rolak arah Karah/Ketintang	-7.308187	112.719643	t
902	146	Jembatan Sembayat	-7.077257	112.572990	t
903	178	Jembatan Suramadu	-7.182582	112.780411	t
904	61	Jembatan Tiga arah Pluit	-6.127271	106.792000	t
905	61	Jembatan Tiga-Kapuk 	-6.128501	106.792320	t
906	154	Jembatan Timbang Singosari	-7.884743	112.672028	t
907	178	Jemur Andayani	-7.327629	112.735710	t
908	178	Jemur Andayani - A. Yani	-7.331673	112.731613	t
909	178	Jemur Andayani - Kutisari	-7.329024	112.742462	t
910	178	Jemursari 	-7.314109	112.755180	t
911	178	Jemursari - A Yani	-7.327179	112.731705	t
912	178	Jemursari - Jemur Andayani	-7.327522	112.734100	t
913	178	Jemursari - Prapen	-7.312343	112.756676	t
914	178	Jemursari arah Margorejo	-7.327608	112.732857	t
915	164	Jenggolo	-7.440741	112.720123	t
916	178	Jetis Kulon 1	-7.308107	112.733315	t
719	164	Geluran	-7.359275	112.692650	t
917	97	Jl A Yani (depan Stadion Sidolig Persib)	-6.916192	107.629150	t
918	97	Jl A Yani - Jl Laswi	-6.916053	107.630157	t
919	111	Jl A Yani Ketanggungan - Slawi	-6.943063	108.918518	t
920	97	Jl AH Nasution (Sukamiskin)	-6.904737	107.675545	t
921	97	Jl AH Nasution (depan PT Grandtex)	-6.904241	107.668396	t
922	97	Jl Abdr. Saleh - Jl Pajajaran	-6.906851	107.587685	t
923	153	Jl Ahmad Yani	-7.612338	111.400398	t
924	160	Jl Ahmad Yani Bangil	-7.600896	112.789375	t
925	178	Jl Airlangga	-7.270631	112.757515	t
926	88	Jl Alternatif (Baru) - Karawang	-6.312059	107.319458	t
927	97	Jl Alun-alun Timur	-6.921810	107.607643	t
928	178	Jl Ambengan	-7.256072	112.748734	t
929	101	Jl Amir Machmud arah Bandung	-6.876132	107.546410	t
930	101	Jl Amir Mahmud (Tagog) arah Gatot Subroto	-6.876463	107.546753	t
931	101	Jl Amir Mahmud (depan Warunk Upnormal)	-6.892738	107.558273	t
933	79	Jl Andir Katapang (Depan BRI Katapang)	-6.999516	107.555847	t
934	79	Jl Anggadireja, Baleendah	-6.999175	107.625931	t
935	80	Jl Anggrek - Jl Tangkuban Perahu	-6.791071	107.651962	t
936	97	Jl Antapani	-6.904753	107.657204	t
937	97	Jl Antapani Lama	-6.914684	107.658897	t
938	97	Jl Arcamanik Endah	-6.919184	107.673859	t
939	97	Jl Asia Afrika (depan Hotel Savoy Homan)	-6.921623	107.611023	t
940	97	Jl Asia Afrika (depan gedung Merdeka)	-6.921357	107.609200	t
941	97	Jl BKR	-6.938057	107.617241	t
942	97	Jl BKR - Jl Moch. Ramdan	-6.937588	107.609367	t
943	178	Jl Babadan Rukun 	-7.243992	112.720589	t
944	97	Jl Babakan Ciparay (Depan Pasar Caringin)	-6.944138	107.584297	t
945	97	Jl Banceuy	-6.919600	107.606567	t
946	97	Jl Banceuy - Jl ABC	-6.918929	107.606628	t
947	97	Jl Banda	-6.909663	107.617508	t
948	97	Jl Bandara Husein Sastranegara	-6.904129	107.579559	t
949	79	Jl Banjaran (depan Masjid Agung)	-7.017235	107.605721	t
950	139	Jl Banjarsari - Juron	-7.554500	110.829453	t
951	101	Jl Baros - Jl Haris	-6.890194	107.536690	t
952	80	Jl Baruajak (depan Pusdik Kowad)	-6.816908	107.612099	t
953	97	Jl Binong Jati - Jl Gatot Subroto	-6.931081	107.641014	t
954	97	Jl Bojong Koneng	-6.891321	107.645439	t
955	79	Jl Bojongsoang (depan BJB)	-6.980438	107.634132	t
956	97	Jl Braga	-6.920441	107.609924	t
957	97	Jl Braga - Jl Naripan	-6.919717	107.610001	t
958	86	Jl Bratayudha, Garut	-7.223242	107.910919	t
959	97	Jl Buah Batu (depan Griya Buah Batu)	-6.940922	107.626511	t
960	58	Jl Budi Kemulyaan	-6.180652	106.820862	t
961	97	Jl Bukit Jarian (depan RS Paru Rotinsulu)	-6.877251	107.606651	t
962	79	Jl Bunderan Pameuntasan	-6.975151	107.547569	t
963	97	Jl Bunga Bakung - Ciwastra	-6.955885	107.648972	t
964	79	Jl Cagak arah Garut	-7.036711	107.907372	t
965	80	Jl Cangkorah - Jl Batujajar	-6.895220	107.489388	t
966	97	Jl Caringin (arah pertigaan Jl Holis)	-6.940890	107.570580	t
967	111	Jl Cendrawasih, Tanjung, Brebes	-6.874812	108.868958	t
968	40	Jl Ciater Barat Raya (Tangerang Selatan)	-6.325893	106.684151	t
969	79	Jl Cibaduyut - Jl Sukamenak	-6.972531	107.589790	t
970	97	Jl Cibaduyut lama	-6.947855	107.591621	t
971	101	Jl Cibaligo	-6.903384	107.554436	t
972	97	Jl Cibeunying Kolot	-6.888531	107.627045	t
973	97	Jl Cibiru (Depan SD Cibiru)	-6.934420	107.721359	t
974	97	Jl Cibolerang	-6.950795	107.574646	t
975	79	Jl Cicalenka (depan PT Vonex)	-6.966823	107.824715	t
976	97	Jl Cicendo	-6.909354	107.604370	t
977	97	Jl Cicendo - Jl Kebon Kawung	-6.912624	107.603958	t
979	97	Jl Cigondewah	-6.946918	107.564445	t
980	97	Jl Cikajang Raya	-6.918524	107.665405	t
981	79	Jl Cikalang Timur	-6.938004	107.747063	t
982	97	Jl Cikapayang (Depan Gereja GII)	-6.898697	107.611603	t
983	97	Jl Cikapayang - Jl Dago	-6.898309	107.609543	t
984	97	Jl Cikapundung Barat	-6.919978	107.608238	t
985	105	Jl Cikoneng, Ciamis	-7.312305	108.281700	t
986	97	Jl Cikutra	-6.894187	107.641083	t
987	97	Jl Cikutra Barat (depan Borma)	-6.892312	107.631020	t
988	86	Jl Ciledug, Garut	-7.218213	107.906151	t
989	82	Jl Cileungsi - Jonggol (depan Taman Buah Mekarsari)	-6.409813	106.985260	t
990	97	Jl Cimindi (depan Terminal Cimindi)	-6.896546	107.560677	t
991	97	Jl Cimuncang	-6.903805	107.649254	t
992	97	Jl Cingised	-6.929196	107.675819	t
993	97	Jl Cipedes Tengah (shortcut dari Pasteur ke Karangsetra)	-6.891513	107.590981	t
994	79	Jl Cisirung Palasari	-6.974767	107.608620	t
995	97	Jl Ciumbuleuit	-6.870274	107.605614	t
996	97	Jl Ciwastra - Jl Baturaden	-6.961327	107.667168	t
997	99	Jl Cut Mutia - Bekasi (Terminal Bekasi)	-6.249115	107.016685	t
998	97	Jl DR Setiabudhi (Ledeng)	-6.846669	107.599327	t
999	97	Jl Dago - Jl Sulanjana	-6.900098	107.612404	t
1000	97	Jl Dago Giri	-6.852442	107.624420	t
1001	97	Jl Dakota	-6.890991	107.572182	t
1002	97	Jl Dalem Kaum	-6.922752	107.609390	t
1003	97	Jl Derwati - Jl Rancaoray (Ciwastra)	-6.963734	107.672806	t
1004	168	Jl Dr Wahidin Sudirohusodo	-6.896200	112.040077	t
1005	97	Jl Dr. Cipto (depan Hotel Imperium) 	-6.905349	107.600838	t
1006	131	Jl Dr. Wahidin, Tegal	-6.999180	109.138481	t
1007	97	Jl Dulatip	-6.919152	107.604797	t
1008	97	Jl Elang - Jl Rajawali	-6.913156	107.575768	t
1009	178	Jl Gajah Mada	-7.354997	112.703697	t
978	97	Jl Cicukang, Cisaranten	-6.909439	107.684288	t
1010	80	Jl Gandawijaya (Simpang Permata)	-6.867398	107.518562	t
1011	97	Jl Ganeca	-6.893228	107.610634	t
1012	97	Jl Gardujati	-6.917864	107.598274	t
1013	97	Jl Garuda - Jl Dadali	-6.911686	107.578064	t
1014	101	Jl Gatot Subroto (depan Campina House)	-6.876425	107.545807	t
1015	101	Jl Gatot Subroto (depan SMAN 5 Cimahi)	-6.878433	107.544357	t
1016	97	Jl Gedebage (Pos Merapi/jembatan)	-6.950443	107.686844	t
1017	97	Jl Gedebage (arah perempatan Gedebage)	-6.938877	107.692345	t
1018	97	Jl Gunung Batu	-6.889085	107.564491	t
1019	80	Jl H Gofur - Jl Gadobangkong	-6.868420	107.523254	t
1020	55	Jl HOS Cokroaminoto Yogyakarta	-7.796452	110.352676	t
1021	97	Jl Holis - Jl Soekarno Hatta	-6.924616	107.574982	t
1022	169	Jl Hos Cokroaminoto	-8.073613	111.893456	t
1023	97	Jl Ibrahim Adjie (depan Cicadas Mall)	-6.911367	107.643539	t
1024	97	Jl Ibrahim Adjie (perlintasan KA) Kiaracondong	-6.924206	107.644356	t
1025	101	Jl Industri IV Cimahi	-6.906989	107.549255	t
1026	92	Jl Ipik Gandamanah (depan Golden Futsal)	-6.531018	107.456818	t
1027	97	Jl Ir. H Juanda (Dago Atas) depan SPBU	-6.868942	107.620667	t
1028	97	Jl Ir. H Juanda (depan Golden Money Changer)	-6.897148	107.612823	t
1029	97	Jl Ir. H. Juanda (Depan STKS Dago)	-6.873161	107.619675	t
1030	88	Jl Ir. H. Juanda - Cikampek	-6.423545	107.478752	t
1031	178	Jl Jakarta	-7.222609	112.733696	t
1032	97	Jl Jakarta (dari Antapani)	-6.913758	107.643654	t
1033	97	Jl Jamika - Jl Pagarsih	-6.922018	107.586128	t
1034	97	Jl Jawa - Jl Merdeka	-6.914264	107.610313	t
1035	79	Jl Jelekong	-7.025488	107.654770	t
1036	164	Jl Jenggolo	-7.438789	112.720497	t
1037	141	Jl Jokotole depan Toserba Anugerah	-7.085668	112.711250	t
1038	55	Jl Kabupaten-Godean	-7.759321	110.345886	t
1039	86	Jl Kadungora (perlintasan KA)	-7.081595	107.898666	t
1040	97	Jl Kalipah Apo	-6.923541	107.600960	t
1041	54	Jl Kaliurang kantor Lurah Karsonoharjo	-7.723250	110.401772	t
1042	54	Jl Kaliurang kantor Lurah Sardonoharjo	-7.723250	110.401772	t
1043	54	Jl Kaliurang-Merapi YK	-7.694363	110.418648	t
1044	97	Jl Kaum - Jl AH Nasution	-6.914008	107.699997	t
1045	97	Jl Kautamaan Istri	-6.925532	107.604736	t
1046	97	Jl Kawaluyaan	-6.937120	107.659279	t
1047	79	Jl Kawasan Industri Trikencana 	-6.988398	107.553589	t
1048	97	Jl Kebon Jati - Jl Otista (Pasar Baru)	-6.915829	107.604462	t
1049	101	Jl Kerkof (depan Borma)	-6.903709	107.531677	t
1050	178	Jl Ketabang Kali	-7.262393	112.744270	t
1051	80	Jl Kol Masturi KM 7	-6.810908	107.563477	t
1052	80	Jl Kol. Masturi (Cisarua) arah Parongpong	-6.798134	107.578766	t
1053	80	Jl Kol. masturi (Pertigaan Patrol)	-6.797410	107.573532	t
1054	80	Jl Kol.Masturi (depan AlfaMart)	-6.811078	107.561119	t
1055	80	Jl Kolonel Masturi (perbatasan Cimahi dan Bandung Barat)	-6.817225	107.557030	t
1056	79	Jl Kopo (Sayati)	-6.962957	107.577805	t
1057	97	Jl Kopo - Jl Citarip	-6.941455	107.592255	t
1058	79	Jl Kopo Bihbul	-6.963383	107.577309	t
1059	79	Jl Kopo Sayati (Depan SPBU)	-6.975044	107.571220	t
1060	79	Jl Kopo Sayati - Jl Pasar Sayati Lama	-6.970582	107.573997	t
1061	97	Jl Kosambi - Jl Malabar	-6.918854	107.624260	t
1062	178	Jl Kranggan	-7.256050	112.728699	t
1063	178	Jl Kutisari Utara - Rungkut Industri	-7.331779	112.748650	t
1064	97	Jl LLRE. Martadinata (perempatan BEC)	-6.906489	107.607780	t
1065	97	Jl Laswi	-6.922188	107.630280	t
1066	79	Jl Laswi (Depan Puskesmas Ciparay)	-7.038377	107.722115	t
1067	79	Jl Laswi (depan Majalaya Theater/MT) 	-7.046262	107.737007	t
1068	79	Jl Laswi - Jl Jelekong Baleendah	-7.020951	107.656593	t
1069	79	Jl Laswi, Cipicung - Baleendah	-7.012923	107.638824	t
1070	79	Jl Laswi, Jelekong Baleendah	-7.021367	107.674042	t
1071	97	Jl Leuwi Panjang - Jl Soekarno Hatta (Patung Sepatu)	-6.947003	107.595238	t
1072	86	Jl Limbangan Timur (Ciseureuh)	-7.034640	107.984215	t
1073	111	Jl Lingkar - Bumiayu	-7.246631	109.015831	t
1074	79	Jl Lingkar Nagreg	-7.023954	107.887558	t
1075	97	Jl Logam, Buah Batu	-6.959538	107.644104	t
1076	101	Jl Mahar Martanegara	-6.899565	107.550377	t
1077	97	Jl Maleber, Andir	-6.908598	107.570839	t
1078	55	Jl Malioboro	-7.793125	110.365746	t
1079	79	Jl Manglid	-6.968878	107.564003	t
1080	97	Jl Margacinta 	-6.954919	107.646568	t
1081	97	Jl Margahayu Raya	-6.944969	107.660767	t
1082	80	Jl Maribaya Lembang (menuju De Ranch)	-6.818120	107.631042	t
1083	97	Jl Martanegara - Jl Pelajar Pejuang	-6.932679	107.625824	t
1084	140	Jl Mataram (Terminal Tegal)	-6.874188	109.108643	t
1085	178	Jl Mayjend Sungkono	-7.291000	112.715202	t
1086	121	Jl Mayor Kusen-Candi Mendut	-7.592090	110.238037	t
1087	58	Jl Medan Merdeka Barat	-6.177526	106.822655	t
1088	58	Jl Medan Merdeka Timur	-6.174593	106.830475	t
1089	58	Jl Medan Merdeka Utara (depan Istana Negara)	-6.171153	106.824333	t
1090	97	Jl Mengger Girang	-6.950496	107.615440	t
1091	97	Jl Merdeka (depan BIP)	-6.908576	107.610588	t
1092	97	Jl Merdeka (depan Gereja Katedral Bandung)	-6.914935	107.610168	t
1093	86	Jl Merdeka, Garut	-7.195403	107.903389	t
1094	98	Jl Meyjen Didi Kartasasmita - Banjar	-7.366500	108.534546	t
1095	97	Jl Moh Toha (Depan PT Alena Textile)	-6.945869	107.608543	t
1096	79	Jl Moh Toha (depan Ceres)	-6.972637	107.617607	t
1097	97	Jl Moh Toha (depan PT Inti)	-6.938132	107.606171	t
1098	97	Jl Moh Toha (depan Pasar Kembar Mas)	-6.946929	107.608894	t
1099	79	Jl Moh Toha - Jl Dayeuhkolot	-6.973521	107.617928	t
1101	146	Jl Morowudi - Jl Boboh, Cerme - Gresik	-7.249782	112.560867	t
1102	86	Jl Nagreg (Ciaro)	-7.037084	107.919067	t
1192	97	Jl Soekarno Hatta - Jl Karasak	-6.947845	107.600815	t
1103	79	Jl Nagreg (depan Rest Area Kampoeng Nagreg)	-7.006661	107.864799	t
1104	97	Jl Naripan	-6.920196	107.612572	t
1105	178	Jl Ngagel - Jl Upa Jiwa	-7.287914	112.745842	t
1106	178	Jl Ngagel Jaya Selatan - Ngagel Jaya	-7.293767	112.754898	t
1107	97	Jl Pahlawan (Depan Griya)	-6.900130	107.634209	t
1108	97	Jl Pajajaran	-6.906680	107.598251	t
1109	97	Jl Pakar Barat (arah Tahura)	-6.861955	107.628677	t
1110	79	Jl Parakan Muncang - Jl Rancaekek	-6.966684	107.826698	t
1111	93	Jl Patok Beusi	-6.373924	107.612564	t
1112	61	Jl Pelabuhan Raya	-6.106525	106.883797	t
1113	97	Jl Pelajar Pejuang - Jl BKR	-6.936822	107.622894	t
1114	97	Jl Pelajar Pejuang 45 (depan Hotel Graha Sartika)	-6.930378	107.626213	t
1115	97	Jl Pesantren, Buah Batu	-6.944556	107.649635	t
1116	97	Jl Peta	-6.934010	107.590889	t
1117	59	Jl Pintu Gelora 1	-6.222367	106.802635	t
1118	97	Jl Purnawarman	-6.904827	107.609390	t
1119	155	Jl RA Basuni	-7.499483	112.423050	t
1120	164	Jl Rajawali	-7.392403	112.762451	t
1121	97	Jl Rajiman - Pasir Kaliki	-6.904081	107.598701	t
1122	79	Jl Rancaekek (depan Daihatsu)	-6.952009	107.764664	t
1123	79	Jl Rancaekek - SAMSAT (arah Bandung)	-6.957398	107.779076	t
1124	95	Jl Rancaekek arah Bandung (depan Cikijing Farma)	-6.961817	107.792114	t
1125	128	Jl Raya Ambarawa - Secang, Jateng	-7.309799	110.348167	t
1126	79	Jl Raya Banjaran (depan Borma Rencong)	-7.008684	107.611984	t
1127	97	Jl Raya Bojongsoang (Depan SDN Cipagalo)	-6.966343	107.637726	t
1128	110	Jl Raya Boyolali - Semarang	-7.477232	110.564949	t
1129	97	Jl Raya Cibeureum (arah Bandung)	-6.908150	107.567673	t
1130	79	Jl Raya Cicalengka	-6.987301	107.847977	t
1131	79	Jl Raya Cijapati	-7.018470	107.804268	t
1132	97	Jl Raya Cipamokolan - Jl Soekarno Hatta	-6.938526	107.674446	t
1133	79	Jl Raya Ciwidey (Hotel Abang)	-7.112125	107.449120	t
1134	79	Jl Raya Ciwidey (depan SPBU Pasirjambu)	-7.076437	107.487251	t
1135	79	Jl Raya Ciwidey - Patengan (Jalur wisata Ciwidey)	-7.146053	107.389565	t
1136	164	Jl Raya Gilang 	-7.363377	112.669266	t
1137	88	Jl Raya Jatisari (Balonggandu - Karawang)	-6.382033	107.509247	t
1138	79	Jl Raya Katapang (Gang Awug)	-7.009185	107.550751	t
1139	79	Jl Raya Katapang (Pertigaan Polsek Katapang)	-6.984990	107.562172	t
1140	97	Jl Raya Kopo (depan RS Immanuel)	-6.935650	107.595657	t
1141	79	Jl Raya Kopo Soreang (Depan PT Hilon)	-6.987882	107.558434	t
1142	86	Jl Raya Leles	-7.114605	107.896858	t
1143	80	Jl Raya Lembang (depan Tahu Lembang)	-6.817236	107.612778	t
1144	79	Jl Raya Lingkar Nagreg	-7.029635	107.884254	t
1145	112	Jl Raya Majenang - Ciman, Cilacap	-7.329746	108.819099	t
1146	86	Jl Raya Malangbong	-7.066950	108.089180	t
1147	79	Jl Raya Margahayu (depan RS TNI AU Lanud Sulaiman)	-6.983766	107.563759	t
1148	131	Jl Raya Margasari Tegal	-7.093515	109.017632	t
1149	178	Jl Raya Menur	-7.276856	112.762344	t
1150	86	Jl Raya Nagreg (arah Tasikmalaya) depan RM Astro	-7.037350	107.915840	t
1151	79	Jl Raya Nagreg KM 36	-7.014051	107.876869	t
1152	101	Jl Raya Nanjung	-6.915169	107.536789	t
1153	158	Jl Raya Pacitan - Ponorogo 	-8.128653	111.147011	t
1154	80	Jl Raya Padalarang	-6.842168	107.483261	t
1155	80	Jl Raya Padalarang (Depan Situ Ciburuy)	-6.834738	107.469109	t
1156	80	Jl Raya Padalarang (arah Cianjur) depan Klinik Renza Medika	-6.840959	107.480667	t
1157	80	Jl Raya Padalarang (depan DPRD Cimahi)	-6.843622	107.485878	t
1158	80	Jl Raya Padalarang arah Cianjur (depan Ramayana)	-6.846008	107.489395	t
1159	79	Jl Raya Pangalengan	-7.177478	107.568535	t
1160	91	Jl Raya Pangandaran	-7.684794	108.653648	t
1161	120	Jl Raya Pati-Kudus	-6.792680	110.971748	t
1162	84	Jl Raya Puncak - Cianjur (Gunung Mas Puncak)	-6.701093	106.986427	t
1163	96	Jl Raya Rajapolah - Tasikmalaya	-7.213807	108.189949	t
1164	160	Jl Raya Rejoso	-7.677777	112.947739	t
1165	79	Jl Raya Soreang (Depan SD Cingcin)	-7.019865	107.541115	t
1166	79	Jl Raya Soreang, Katapang	-7.013072	107.549629	t
1167	164	Jl Raya Sukodono	-7.400616	112.672890	t
1168	164	Jl Raya Sukolegok	-7.378672	112.701317	t
1169	80	Jl Raya Tangkuban Perahu (menuju Bandung)	-6.790592	107.654404	t
1170	61	Jl Raya Teluk Gong	-6.138240	106.781303	t
1171	97	Jl Riau (Depan Kompas)	-6.906158	107.617706	t
1172	97	Jl Riau (Kantor Kejati)	-6.908869	107.624733	t
1173	97	Jl Rumah Sakit	-6.918258	107.698524	t
1174	101	Jl Sangkuriang (simpang depan Vidya Chandra)	-6.862956	107.541870	t
1175	97	Jl Sapan - Jl Tegal luar	-6.983127	107.697395	t
1176	101	Jl Sariwangi - Jl Cihanjuang	-6.861049	107.564972	t
1177	97	Jl Sekejati	-6.941620	107.650436	t
1178	178	Jl Semarang	-7.247579	112.733200	t
1179	97	Jl Sentot - Jl Surapati	-6.899443	107.619278	t
1180	97	Jl Sersan Bajuri	-6.851239	107.591019	t
1181	97	Jl Setiabudhi Gandok - Ciumbuleuit	-6.884590	107.604340	t
1182	97	Jl Setiabudi (depan Griya Setiabudi)	-6.871925	107.594185	t
1183	97	Jl Setiabudi - Jl Panorama	-6.865065	107.594177	t
1184	97	Jl Siliwangi - Gandok	-6.883375	107.605118	t
1185	79	Jl Siliwangi, Baleendah	-7.008035	107.635635	t
1186	97	Jl Singgasana, Cibaduyut	-6.955843	107.597717	t
1187	97	Jl Soekarno Hatta (depan Lotte Mart)	-6.938606	107.670273	t
1188	97	Jl Soekarno Hatta (depan Oriflame)	-6.948665	107.613487	t
1189	97	Jl Soekarno Hatta (depan RM Ampera)	-6.939138	107.664864	t
1190	97	Jl Soekarno Hatta (jalur lambat) sebelum McD	-6.939335	107.663170	t
1191	97	Jl Soekarno Hatta (jalur lambat), Gedebage	-6.936747	107.694344	t
1193	97	Jl Soekarno Hatta - Jl Kawaluyaan	-6.938946	107.663910	t
1194	97	Jl Soekarno Hatta - Jl Sekelimus	-6.947365	107.635971	t
1195	97	Jl Soekarno Hatta - Riung Bandung	-6.938270	107.677376	t
1196	97	Jl Soekarno Hatta - Sumber Sari	-6.930740	107.575966	t
1197	97	Jl Soekarno Hatta depan Pengadilan Tinggi Agama (arah Barat)	-6.937322	107.689552	t
1198	119	Jl Solo Tabongan	-7.746841	110.525124	t
1199	79	Jl Soreang (Depan SPBU Pangauban)	-7.009784	107.550499	t
1200	97	Jl Sudirman (depan Pasar Andir)	-6.919131	107.590454	t
1201	97	Jl Sudirman - Jl Otista	-6.920920	107.604103	t
1202	97	Jl Sukajadi	-6.876825	107.596146	t
1203	97	Jl Sukajadi (depan PVJ)	-6.889149	107.596924	t
1204	97	Jl Sukajadi - Flamboyan	-6.878305	107.596260	t
1205	97	Jl Sultan Agung	-6.904342	107.612465	t
1206	144	Jl Sumberejo	-7.197383	112.023041	t
1207	97	Jl Suniaraja - Jl Pecinan Lama	-6.917379	107.605606	t
1208	97	Jl Supratman (arah Jl Jakarta)	-6.904976	107.628914	t
1209	97	Jl Supratman - Jl A. Yani	-6.913390	107.634483	t
1210	97	Jl Surapati (Depan Gasibu)	-6.899331	107.618690	t
1211	97	Jl Sutami	-6.878390	107.586754	t
1212	85	Jl Syekh Datul Kahfi (Depan Batik Trusmi)	-6.701339	108.508453	t
1213	97	Jl Taman Cibaduyut Indah	-6.963287	107.601234	t
1214	97	Jl Taman Sari	-6.885719	107.611603	t
1215	97	Jl Taman Sari (depan Kebon Binatang)	-6.890086	107.608109	t
1216	97	Jl Taman Sari (depan Sabuga)	-6.887508	107.610931	t
1217	97	Jl Taman Sari - Balubur	-6.898748	107.609352	t
1218	97	Jl Taman Sari - Jl Badak Singa	-6.896871	107.609680	t
1219	97	Jl Tamblong	-6.920127	107.612206	t
1220	80	Jl Tangkuban Parahu (depan Sindang Reret)	-6.794171	107.654587	t
1221	80	Jl Tangkuban Perahu, Lembang	-6.810854	107.630417	t
1222	95	Jl Tanjung Sari (Depan Polsen Tanjung Sari)	-6.905200	107.798088	t
1223	97	Jl Tegalega - Jl Astana Anyar	-6.935341	107.602997	t
1224	97	Jl Terusan Batik Halus	-6.892429	107.629036	t
1225	97	Jl Terusan Jakarta (depan Pengadilan Agama)	-6.912656	107.656502	t
1226	79	Jl Terusan Kopo (depan SMA Angkasa)	-6.982861	107.563461	t
1227	178	Jl Tidar	-7.257647	112.730476	t
1228	135	Jl Tidar - Jl Tentara Pelajar, Magelang	-7.486399	110.215523	t
1229	97	Jl Tubagus Ismail Bawah	-6.889644	107.616730	t
1230	168	Jl Tuban-Gresik	-6.882374	112.047287	t
1231	178	Jl Tunjungan	-7.260010	112.739143	t
1232	178	Jl Urip Sumoharjo	-7.276144	112.741592	t
1233	97	Jl Veteran	-6.919642	107.616287	t
1234	97	Jl Viaduct - Jl Perintis Kemerdekaan 	-6.915126	107.607445	t
1235	164	Jl Wadung Asri	-7.347751	112.767693	t
1236	178	Jl Walikota Mustajab	-7.260073	112.744576	t
1237	101	Jl Warung Contong (perlintasan KA)	-6.884334	107.534729	t
1238	86	Jl Warung Peuteuy	-7.147203	107.898949	t
1239	97	Jl Wastu Kencana	-6.904848	107.607155	t
1240	97	Jl Wastukancana	-6.906963	107.607727	t
1241	97	Jl Wastukancana (depan Pemkot Bandung)	-6.911292	107.609055	t
1242	59	Jl Wijaya 1	-6.247313	106.806229	t
1244	79	Jl dangdeur Rancaekek-Garut	-6.955758	107.769760	t
1245	55	Jl, Demakan Depan RS Ludira Husada	-7.792626	110.353012	t
1246	178	Jl. A Yani	-7.309142	112.735527	t
1247	97	Jl. A Yani	-6.914519	107.632431	t
1248	97	Jl. A Yani (Cicadas)	-6.908768	107.643250	t
1249	88	Jl. A Yani (Mega Mall)	-6.307621	107.306458	t
1250	97	Jl. A Yani (Pasar Kosambi)	-6.919909	107.622246	t
1251	94	Jl. A Yani (Simpang Otista)	-6.922976	106.933990	t
1252	97	Jl. A Yani - Jl. AH Nasution	-6.902058	107.655655	t
1253	97	Jl. A Yani - Jl. Jakarta	-6.913497	107.634407	t
1254	97	Jl. A Yani - Jl. LLRE Martadinata	-6.915680	107.630051	t
1255	178	Jl. A. Yani	-7.333992	112.730072	t
1256	86	Jl. A. Yani	-7.216010	107.917931	t
1257	97	Jl. A. Yani - Jl Cicabe	-6.900993	107.659210	t
1258	97	Jl. A.H. Nasution (depan RS Hermina Arcamanik)	-6.904135	107.666534	t
1259	97	Jl. AH Nasution	-6.902271	107.660027	t
1260	97	Jl. AH Nasution (Alun-Alun Ujung Berung)	-6.914109	107.701134	t
1261	97	Jl. AH Nasution (Depan BRI Uber)	-6.914179	107.701324	t
1262	97	Jl. AH Nasution (Depan Terminal Cicaheum)	-6.902159	107.656845	t
1263	97	Jl. AH Nasution (Pasar Ujung Berung)	-6.914179	107.700714	t
1264	97	Jl. AH Nasution (Ujung Berung)	-6.908832	107.688599	t
1265	97	Jl. AH Nasution - Cibiru	-6.920271	107.708977	t
1266	97	Jl. AH Nasution - Jl Pasir Impun	-6.904753	107.677612	t
1267	97	Jl. AH Nasution - Jl. Cijambe	-6.910547	107.689804	t
1268	97	Jl. AH Nasution - Jl. Jatihandap	-6.902132	107.657692	t
1269	97	Jl. AH Nasution - Jl. Sindanglaya	-6.905035	107.680290	t
1270	97	Jl. AH. Nasution (depan Superindo)	-6.916479	107.705261	t
1271	97	Jl. AH. Nasution - Jl. Cicabe	-6.902143	107.659546	t
1272	97	Jl. AH. Nasution - Jl. Cikadut	-6.904028	107.665390	t
1273	164	Jl. Abdul Karim Rungkut	-7.339201	112.772949	t
1274	59	Jl. Abdul Majid Raya arah Cipete Raya	-6.266910	106.802872	t
1275	58	Jl. Abdul Muis-Harmoni	-6.176993	106.819679	t
1276	97	Jl. Abdurahman Saleh	-6.907351	107.585052	t
1277	97	Jl. Aceh (depan Graha Manggala Siliwangi)	-6.909109	107.619873	t
1278	97	Jl. Aceh -Jl. Seram	-6.909961	107.614960	t
1280	178	Jl. Adityawarman (SUTOS)	-7.293810	112.730797	t
1281	111	Jl. Ahmad Yani	-6.872905	109.046944	t
1282	178	Jl. Ahmad Yani	-7.334546	112.730537	t
1283	156	Jl. Ahmad Yani	-7.600087	111.900604	t
1284	97	Jl. Ahmad Yani	-6.911590	107.637726	t
1285	97	Jl. Ahmad Yani (Depan Indo Grosir)	-6.902857	107.654190	t
2754	141	Jokotole	-7.024998	112.750092	t
1286	178	Jl. Airlangga	-7.270673	112.757896	t
1287	107	Jl. Ajibarang - Brebes	-7.396025	109.077736	t
1288	107	Jl. Ajibarang - Secang	-7.408774	109.080261	t
1289	107	Jl. Ajibarang - Wangon	-7.408900	109.080170	t
1290	99	Jl. Alternatif Cibubur	-6.375993	106.902184	t
1291	99	Jl. Alternatif Cibubur (Roti Bakar Eddy) - Plaza Cibubur	-6.375964	106.900085	t
1292	99	Jl. Alternatif Cibubur (depan Mitra 10)	-6.382326	106.931007	t
1293	99	Jl. Alternatif Cibubur - Cibubur Junction	-6.376179	106.897636	t
1294	99	Jl. Alternatif Cibubur - Cileungsi	-6.376034	106.897629	t
1295	99	Jl. Alternatif Cibubur arah Plaza Cibubur	-6.375959	106.900169	t
1296	92	Jl. Alternatif Cikarang - Karawang	-6.437770	107.465378	t
1297	52	Jl. Alternatif Karangmojo	-7.913947	110.559402	t
1298	116	Jl. Alternatif Solo - Karanganyar - Surabaya	-7.609467	110.985069	t
1299	116	Jl. Alternatif Solo - Madiun - Surabaya	-7.661030	111.150085	t
1300	116	Jl. Alternatif Solo - Madiun - Surabaya	-7.616071	111.081551	t
1301	101	Jl. Alun-Alun Timur (Pertigaan)	-6.873613	107.542419	t
1302	101	Jl. Amir Machmud (tagog) - Jl. Gatot Subroto	-6.876021	107.546082	t
1303	101	Jl. Amir Machmud/Cibabat (depan RM Ampera)	-6.882254	107.551971	t
1304	61	Jl. Ampera Raya	-6.136467	106.836372	t
1305	59	Jl. Ampera Raya 	-6.276310	106.820602	t
1306	59	Jl. Ampera Raya (Pengadilan Negeri Jakarta Selatan)	-6.281687	106.819534	t
1307	59	Jl. Ampera-Kemang	-6.283136	106.819252	t
1308	97	Jl. Andir - Jl. Gardu Jati	-6.916586	107.591148	t
1309	79	Jl. Andir Katapang (Junti)	-7.002093	107.565048	t
1310	79	Jl. Andir, Baleendah	-7.018566	107.642265	t
1311	57	Jl. Anggrek Nelimurni 	-6.182245	106.795288	t
1312	58	Jl. Angkasa 	-6.156726	106.846565	t
1313	58	Jl. Angkasa (Jakarta Pusat)	-6.158002	106.840607	t
1314	59	Jl. Antasari	-6.289897	106.806038	t
1315	59	Jl. Antasari - Jl. T.B. Simatupang	-6.274721	106.808678	t
1316	174	Jl. Arief Margono 	-7.984055	112.626228	t
1317	178	Jl. Arief Rachman Hakim	-7.289500	112.782608	t
1318	93	Jl. Arif Rahman Hakim (Depan SMKN 1 Subang)	-6.555501	107.760147	t
1319	84	Jl. Arif Rahman Hakim (Sekitar SDN Lembur Tengah)	-6.818700	107.147316	t
1320	84	Jl. Arif Rahman Hakim (depan smk bpk penabur)	-6.815419	107.148361	t
1321	93	Jl. Arif Rahman hakim (Depan MTSN Subang)	-6.555102	107.759621	t
1322	97	Jl. Arjuna	-6.910323	107.590385	t
1323	57	Jl. Arjuna Selatan - Kemanggisan	-6.190021	106.769600	t
1324	59	Jl. Asia Afrika	-6.221515	106.798157	t
1325	97	Jl. Asia Afrika 	-6.921634	107.611061	t
1326	97	Jl. Asia Afrika (Alun-Alun Bandung)	-6.921203	107.607101	t
1327	59	Jl. Asia Afrika (depan Senayan City)	-6.227123	106.798187	t
1328	59	Jl. Asia Afrika - Hang Lekir	-6.229198	106.797935	t
1329	97	Jl. Asia Afrika - Jl. Jend Sudirman	-6.920825	107.604134	t
1330	59	Jl. Asia Afrika - Sudirman / Blok M	-6.227213	106.798340	t
1331	60	Jl. Asrama Haji 	-6.289428	106.886673	t
1332	97	Jl. Astana Anyar	-6.932540	107.602158	t
1333	97	Jl. Astana Anyar (Pasar Astana Anyar)	-6.930554	107.601128	t
1334	97	Jl. Astana Anyar - Jl. Pagarsih	-6.923226	107.598633	t
1335	97	Jl. Astana Anyar - Jl. Sudirman	-6.920122	107.598373	t
1336	97	Jl. Astana anyar - Jl. Otista	-6.921432	107.598457	t
1337	97	Jl. Astina	-6.906217	107.596222	t
1338	97	Jl. BKR - Jl. Otista	-6.937290	107.603058	t
1339	178	Jl. Babatan UNESA	-7.302068	112.675354	t
1340	58	Jl. Balikpapan	-6.170764	106.813049	t
1341	178	Jl. Balongsari Tama	-7.259717	112.678368	t
1342	99	Jl. Bambu Apus Raya 	-6.307151	106.908859	t
1343	97	Jl. Banceuy - Jl. Asia Afrika	-6.921070	107.606461	t
1344	97	Jl. Banda - Jl. RE Martadinata	-6.906355	107.616821	t
1345	39	Jl. Bandara Soeta 	-6.117044	106.678627	t
1346	59	Jl. Bangka Raya	-6.241970	106.816742	t
1347	178	Jl. Banjar Sugihan	-7.254026	112.658676	t
1348	79	Jl. Banjaran (depan PT Feng Tay)	-7.024918	107.594337	t
1349	146	Jl. Banjarsari Cerme	-7.218160	112.570427	t
1350	178	Jl. Banyu Urip	-7.270822	112.721741	t
1351	142	Jl. Banyuwangi Situbondo - Surabaya	-8.140590	114.398895	t
1352	59	Jl. Barito II (Kebayoran Baru)	-6.246022	106.794472	t
1353	156	Jl. Baron	-7.596378	112.053001	t
1354	101	Jl. Baros (Simpang Pusdik Armed)	-6.892546	107.536690	t
1355	100	Jl. Baru Bogor	-6.552453	106.771637	t
1356	80	Jl. Baruajak (Depan Floating Market Lembang)	-6.816735	107.617241	t
1357	60	Jl. Basuki Rahmat	-6.224841	106.869507	t
1358	80	Jl. Batu Jajar Raya (Depan Ateja)	-6.888126	107.503487	t
1359	100	Jl. Batu Tulis	-6.623664	106.808868	t
1360	58	Jl. Batu Tulis Raya 	-6.163276	106.823952	t
1361	100	Jl. Batu tulis (Simpang Intl motor)	-6.618847	106.806923	t
1362	80	Jl. Batujajar Raya (Medion)	-6.865555	107.502968	t
1363	97	Jl. Batununggal	-6.956822	107.637711	t
1364	119	Jl. Bayat - Cawas	-7.763063	110.686882	t
1365	99	Jl. Bekasi Barat - Jt. Bening	-6.249478	106.981789	t
1366	60	Jl. Bekasi Raya (Pertigaan Terminal Pulo Gadung)	-6.186401	106.906029	t
1367	80	Jl. Bendungan Cirata	-6.687687	107.362770	t
1368	178	Jl. Bengawan	-7.290170	112.736526	t
1369	97	Jl. Bengawan (depan Taman Super Hero)	-6.911090	107.630516	t
1370	61	Jl. Benyamin Sueb	-6.138624	106.847618	t
1371	40	Jl. Bhayangkara	-6.238042	106.649551	t
1372	178	Jl. Biliton	-7.275463	112.749512	t
1373	59	Jl. Bintaro Raya - Tn. Kusir	-6.253296	106.774323	t
1374	121	Jl. Blabak - Boyolali	-7.499031	110.376869	t
1375	97	Jl. Bogor - Jl. Jakarta	-6.914455	107.637337	t
1376	79	Jl. Bojongsoang (pertigaan)	-6.982424	107.633720	t
1377	79	Jl. Bojongsoang - Jl. Dayeuhkolot	-6.986236	107.626488	t
1378	56	Jl. Bonang (Jakarta Pusat)	-6.202581	106.847893	t
1379	61	Jl. Boulevard	-6.155382	106.896332	t
1380	178	Jl. Boulevard - Unesa	-7.298469	112.675613	t
1381	61	Jl. Boulevard Barat Kelapa Gading	-6.159644	106.903885	t
1382	61	Jl. Boulevard Raya - Jl. Raya Kayu Putih 	-6.168748	106.900307	t
1383	61	Jl. Boulevard Raya Kelapa Gading (depan Mall Kelapa Gading) - Gading Hibrida - Pintu 3	-6.159444	106.906097	t
1384	60	Jl. Boulevard Raya Kelapa Gading - Kayu Putih	-6.176135	106.894577	t
1385	60	Jl. Boulevard Raya Kelapa Gading - Kayu Putih - Pulomas	-6.176072	106.894760	t
1386	61	Jl. Boulevard Raya arah Mitra Sunter	-6.152064	106.890770	t
1387	110	Jl. Boyolali - Magelang	-7.515002	110.520737	t
1388	97	Jl. Braga	-6.918071	107.609482	t
1389	178	Jl. Bratang Binangun	-7.294906	112.759918	t
1390	164	Jl. Brigjen Katamso	-7.349975	112.750969	t
1391	139	Jl. Brigjen Slamet Riyadi	-7.565949	110.808083	t
1392	178	Jl. Bronggalan	-7.257689	112.763802	t
1393	97	Jl. Buah Batu	-6.939346	107.624992	t
1394	97	Jl. Buah Batu (depan Richeese Factory)	-6.945374	107.630760	t
1395	97	Jl. Buah Batu - Cijagra	-6.946487	107.631752	t
1396	97	Jl. Buah Batu - Jl. Pelajar Pejuang	-6.937089	107.622673	t
1397	97	Jl. Buah Batu - Jl. Solontongan	-6.940075	107.625816	t
1398	97	Jl. Buah Batu - Jl. Suryalaya	-6.940624	107.626106	t
1399	97	Jl. Buah Batu - Kliningan	-6.942386	107.627991	t
1400	178	Jl. Bubutan	-7.250899	112.735687	t
1401	57	Jl. Budhi-Slipi	-6.186571	106.781853	t
1402	58	Jl. Budi Kemuliaan 	-6.180769	106.821075	t
1403	107	Jl. Bumiayu	-7.365797	109.073181	t
1404	59	Jl. Buncit Raya 	-6.256965	106.828094	t
1405	164	Jl. Buncitan	-7.396153	112.783234	t
1406	178	Jl. Bung Tomo	-7.291341	112.747581	t
1407	58	Jl. Bungun Besar	-6.162828	106.840385	t
1408	178	Jl. Bunguran	-7.242395	112.746292	t
1409	164	Jl. By Pass Krian Simpang 4	-7.398717	112.577782	t
1410	61	Jl. Cacing 	-6.115806	106.924995	t
1411	61	Jl. Cakung Cilincing Raya	-6.124052	106.927032	t
1412	61	Jl. Cakung Cilincing Raya (Pertigaan JICT) - Marunda	-6.108072	106.922478	t
1413	61	Jl. Cakung Cilincing Raya arah Tanjung Priok	-6.116953	106.924843	t
1414	99	Jl. Caman	-6.250118	106.952957	t
1415	59	Jl. Casablanca 	-6.224350	106.844528	t
1416	97	Jl. Cemara	-6.884057	107.598640	t
1417	97	Jl. Cemara - Jl. Sukajadi	-6.883993	107.596596	t
1418	97	Jl. Cemara, Sukajadi	-6.884481	107.598915	t
1419	58	Jl. Cempaka Mas - Tj. Priok	-6.162892	106.875771	t
1420	58	Jl. Cempaka Putih-Tugu Tani	-6.176182	106.864700	t
1421	59	Jl. Cendrawasih	-6.268867	106.796059	t
1422	39	Jl. Cengkeh 	-6.250032	106.720352	t
1423	94	Jl. Ciawi, Sukabumi	-7.023518	106.694527	t
1424	97	Jl. Cibadak	-6.921623	107.600281	t
1425	97	Jl. Cibaduyut - Jl. Singgasana	-6.952174	107.593460	t
1426	79	Jl. Cibaduyut Raya	-6.971216	107.590080	t
1427	97	Jl. Cibaduyut Raya (Terowongan Jalan Tol)	-6.962179	107.593620	t
1428	97	Jl. Cibaduyut Raya (depan TVRI)	-6.960188	107.593582	t
1429	101	Jl. Cibaligo - Jl. Mahar Martanegara (Pasar Cimindi)	-6.898138	107.555962	t
1430	97	Jl. Cibeureum	-6.901706	107.563751	t
1431	79	Jl. Cibiru - Jl. Cinunuk	-6.933435	107.726830	t
1432	97	Jl. Cicendo - Jl. Pajajaran	-6.907351	107.604446	t
1433	79	Jl. Cicukang (Pos 3 Lanud Sulaiman)	-6.973021	107.548332	t
1434	97	Jl. Cicukang - Holis	-6.937434	107.570114	t
1435	97	Jl. Cicukang - Jl. AH Nasution	-6.907021	107.685265	t
1436	58	Jl. Cideng Barat 	-6.171756	106.810936	t
1437	58	Jl. Cideng Timur	-6.171277	106.811142	t
1438	97	Jl. Cigondewah	-6.939719	107.566818	t
1439	80	Jl. Cigugur Girang (depan Pesantren Eco Darut Tauhid)	-6.837753	107.585205	t
1440	79	Jl. Ciguruwik	-6.931092	107.730690	t
1441	79	Jl. Ciguwuwik - Cinunuk	-6.934351	107.728111	t
1442	97	Jl. Cihampelas 	-6.902015	107.604301	t
1443	97	Jl. Cihampelas (Depan Ciwalk)	-6.894900	107.604050	t
1444	97	Jl. Cihampelas - Jl. Ciumbuleuit	-6.884542	107.604599	t
1445	101	Jl. Cihanjuang	-6.856362	107.567764	t
1446	101	Jl. Cihanjuang - Jl. Daeng M Ardiwinata	-6.870801	107.557678	t
1447	80	Jl. Ciharashas (Pemkab Bandung Barat)	-6.856682	107.512398	t
1448	97	Jl. Cijagra - Jl. Buah Batu	-6.942104	107.627556	t
1449	97	Jl. Cijawura Girang	-6.944128	107.648170	t
1450	35	Jl. Cikande Raya-Kalideres 	-6.269528	106.347229	t
1451	100	Jl. Cikeas	-6.587620	106.842445	t
1452	58	Jl. Cikini Raya	-6.193643	106.839203	t
1453	58	Jl. Cikini Raya - Menteng	-6.187691	106.836647	t
1454	97	Jl. Cikutra - Jl. PHH Mustopa	-6.899901	107.643402	t
1455	97	Jl. Cikutra - Jl. Pahlawan (depan TMP Cikutra)	-6.892834	107.635483	t
1456	97	Jl. Cikutra Barat	-6.892237	107.632820	t
1457	59	Jl. Cilandak KKO	-6.293779	106.816208	t
1458	59	Jl. Cilandak KKO - Ampera	-6.292964	106.816368	t
1459	59	Jl. Ciledug Raya	-6.236530	106.748138	t
1460	59	Jl. Ciledug Raya (Seskoal) - Ulujami	-6.238124	106.772057	t
1461	59	Jl. Ciledug Raya - Cipulir	-6.238084	106.763344	t
1462	79	Jl. Cileunyi (sebelum Jl. Percobaan Cileunyi arah Bandung)	-6.940134	107.750336	t
1463	61	Jl. Cilincing Raya	-6.108595	106.915535	t
1464	61	Jl. Cilincing Raya arah Tanjung Priok	-6.108513	106.915550	t
1465	178	Jl. Ciliwung	-7.294603	112.734154	t
1466	86	Jl. Cimanuk (simpang Maktal)	-7.219661	107.900391	t
1467	80	Jl. Cimareme (Depan kantor Samsat)	-6.863883	107.506828	t
1468	80	Jl. Cimareme (Pertigaan) - Cimahi	-6.863222	107.503387	t
1469	99	Jl. Cimatis - Jl. Kali Manggis - Kranggan	-6.387218	106.911674	t
1470	105	Jl. Cimulu	-7.322755	108.222733	t
1471	97	Jl. Cimuncang	-6.901802	107.649727	t
1472	97	Jl. Cinambo - Jl. Rumah Sakit	-6.924126	107.696045	t
1473	97	Jl. Cipadung Kidul (Polsek Panyileukan)	-6.934841	107.719833	t
1474	97	Jl. Cipaganti	-6.894400	107.602577	t
1475	101	Jl. Cipageran - Sangkuriang (Gedung Vidya Chandra)	-6.868122	107.535835	t
1476	82	Jl. Cipayung (Depan Hino Cibinong)	-6.472778	106.824432	t
1477	59	Jl. Cipete Raya	-6.277612	106.799599	t
1478	59	Jl. Cipulir-Kebayoran Lama 	-6.234227	106.773956	t
1479	59	Jl. Ciputat Raya - TB. Simatupang - Perempatan Metro Pondok Indah	-6.280697	106.772217	t
1480	59	Jl. Ciputat Raya - Tanah Kusir	-6.260579	106.776199	t
1481	59	Jl. Ciputat Raya Kebayoran Lama	-6.247068	106.779076	t
1482	59	Jl. Ciputat Raya arah Kebayoran	-6.243411	106.780586	t
1483	59	Jl. Ciputat Raya-Pd. Indah 	-6.244423	106.780426	t
1484	59	Jl. Ciputat-Parung	-6.248561	106.778183	t
1485	40	Jl. Cirendeu Raya - Jl. Pondok Cabe Raya	-6.325308	106.766914	t
1486	40	Jl. Cirendeu Raya - Lebak Bulus	-6.305180	106.773598	t
1487	178	Jl. Citrajaya UNESA	-7.298514	112.668854	t
1488	97	Jl. Ciumbuleuit (Depan Kampus Unpar)	-6.875094	107.604546	t
1489	97	Jl. Ciumbuleuit (Pertigaan)	-6.883314	107.604919	t
1490	97	Jl. Ciwastra	-6.960039	107.662376	t
1491	97	Jl. Ciwastra - Jl. Margacinta	-6.955225	107.650467	t
1493	60	Jl. D.I. Panjaitan (Cawang) arah Jatinegara	-6.241461	106.877197	t
1494	102	Jl. DR. Cipto Mangunkusumo (SMAN 2 Cirebon)	-6.714956	108.550728	t
1495	97	Jl. DR. Djunjunan	-6.897616	107.592735	t
1496	97	Jl. DR. Djunjunan (Depan Paskal Hyper Point)	-6.895220	107.588554	t
1497	97	Jl. DR. Radjiman	-6.903900	107.600899	t
1498	39	Jl. DR. Sitanala	-6.159916	106.631798	t
1499	57	Jl. Daan Mogot	-6.157665	106.766571	t
1500	57	Jl. Daan Mogot (Indosiar) - Pesing	-6.163545	106.775337	t
1501	57	Jl. Daan Mogot - Grogol	-6.164849	106.781044	t
1502	39	Jl. Daan Mogot Tangerang	-6.168881	106.634361	t
1503	57	Jl. Daan Mogot arah Grogol	-6.165580	106.784515	t
1504	61	Jl. Danau Sunter Selatan 	-6.145995	106.874100	t
1505	61	Jl. Danau Sunter Selatan - Mitra Sunter - Kelapa Gading	-6.149435	106.884605	t
1506	61	Jl. Danau Sunter Utara	-6.137752	106.870758	t
1507	59	Jl. Darmawangsa Raya 	-6.249393	106.805199	t
1508	178	Jl. Darmokali	-7.299003	112.738632	t
1509	178	Jl. Darmokali	-7.288952	112.743584	t
1510	97	Jl. Dayang Sumbi	-6.887402	107.613449	t
1511	178	Jl. Demak	-7.241448	112.720711	t
1512	59	Jl. Denpasar Raya	-6.234821	106.827133	t
1513	59	Jl. Denpasar Raya (Belakang Kantor Kedutaan Malaysia)	-6.224548	106.831680	t
1514	59	Jl. Denpasar Raya - Mega Kuningan	-6.232659	106.830322	t
1515	59	Jl. Deplu Raya	-6.272919	106.768936	t
1516	59	Jl. Deplu Raya (Bintaro)	-6.272795	106.768837	t
1517	97	Jl. Derwati (Pertigaan)	-6.965523	107.686859	t
1518	60	Jl. Dewi Sartika 	-6.258244	106.863800	t
1519	40	Jl. Dewi Sartika	-6.317453	106.746643	t
1520	97	Jl. Dewi Sartika	-6.928834	107.605782	t
1521	100	Jl. Dewi Sartika 	-6.595123	106.791809	t
1522	97	Jl. Dewi Sartika - Jl. Dalem Kaum	-6.922475	107.606384	t
1523	103	Jl. Dewi Sartika - Sawangan	-6.399784	106.817696	t
1524	178	Jl. Dharmahusada	-7.266326	112.767441	t
1525	178	Jl. Dharmawangsa	-7.270224	112.756454	t
1526	97	Jl. Dipatiukur	-6.893334	107.617920	t
1527	40	Jl. Dipenogoro 	-6.326303	106.717278	t
1528	97	Jl. Diponegoro	-6.901408	107.616165	t
1529	178	Jl. Diponegoro	-7.291958	112.736977	t
1530	97	Jl. Diponegoro - Jl. Sentot	-6.901227	107.619370	t
1531	84	Jl. Dr Suwardi (Pertigaan PLN Cianjur)	-6.810950	107.146217	t
1532	97	Jl. Dr. Djunjunan (TL arah Tol Pasteur)	-6.892243	107.581116	t
1533	97	Jl. Dr. Djunjunan (depan BTC)	-6.892823	107.585327	t
1534	178	Jl. Dr. Ir. H. Sukarno (depan Kampus C UNAIR)	-7.270120	112.782188	t
1535	56	Jl. Dr. Sahardjo 	-6.214175	106.844337	t
1536	59	Jl. Dr. Saharjo (HARRIS Hotel) arah Manggarai	-6.223104	106.847389	t
1537	59	Jl. Dr. Satrio	-6.217098	106.818932	t
1538	59	Jl. Dr. Satrio (depan Kuningan City)	-6.225022	106.828995	t
1539	178	Jl. Dr. Soetomo	-7.282742	112.737343	t
1540	102	Jl. Dr. Sudarsono (Pusdik Latpri)	-6.728584	108.550278	t
1541	153	Jl. Dr.Sutomo - Jl.Jend. A. Yani	-7.651465	111.321655	t
1542	153	Jl. Dr.Sutomo-Jend.A.Yani	-7.651485	111.321640	t
1543	178	Jl. Dupak Rukun	-7.247153	112.711166	t
1544	101	Jl. Dustira	-6.885847	107.535423	t
1545	97	Jl. Elang Raya	-6.914690	107.575249	t
1546	93	Jl. Emo Kurniaatmaja  (Depan Gereja Maranatha)	-6.573781	107.763229	t
1547	59	Jl. Fatmawati	-6.269826	106.797432	t
1548	59	Jl. Fatmawati - TB. Simatupang	-6.263278	106.798332	t
1549	59	Jl. Fatmawati Arah Ps Rebo	-6.306895	106.793465	t
1550	59	Jl. Fatmawati Raya	-6.258756	106.796875	t
1551	59	Jl. Fatmawati arah Jl. Antasari	-6.278139	106.808098	t
1552	59	Jl. Fatmawati-Cipete	-6.277206	106.797600	t
1553	97	Jl. Flamboyan	-6.912245	107.661011	t
1554	129	Jl. Gabungan - Sumberlawang	-7.385003	110.913223	t
1555	61	Jl. Gading Kirana	-6.142699	106.895859	t
1556	80	Jl. Gadobangkong (depan Ultrajaya)	-6.866034	107.515373	t
1557	57	Jl. Gajah Mada	-6.153526	106.817451	t
1558	164	Jl. Gajah Mada	-7.455709	112.717453	t
1559	57	Jl. Gajah Mada 	-6.143659	106.815102	t
1560	57	Jl. Gajah Mada - Glodok - Kota	-6.145830	106.815659	t
1561	58	Jl. Gajah Mada arah Grogol	-6.164730	106.819748	t
1562	57	Jl. Gajah Mada-Olimo	-6.159393	106.818825	t
1563	138	Jl. Gajahmada	-6.973878	110.420029	t
1564	175	Jl. Gajahmada - Pahlawan	-7.463603	112.456825	t
1565	59	Jl. Gandaria	-6.245254	106.788742	t
1566	101	Jl. Gandawijaya	-6.876777	107.540298	t
1567	97	Jl. Garuda	-6.908374	107.578873	t
1568	97	Jl. Garuda (Perlintasan KA)	-6.907916	107.579155	t
1569	97	Jl. Garuda - Andir	-6.917432	107.576759	t
1570	97	Jl. Garuda - Jl. Elang	-6.916016	107.576996	t
1571	97	Jl. Garuda - Jl. Rajawali	-6.913710	107.577553	t
1572	96	Jl. Garut - Tasikmalaya	-7.365946	108.012054	t
1573	96	Jl. Garut - Tasikmalaya	-7.350343	108.107971	t
1574	96	Jl. Garut-Tasikmalaya	-7.375473	108.032768	t
1575	59	Jl. Gatot Subroto	-6.228467	106.818802	t
1576	97	Jl. Gatot Subroto	-6.930943	107.641060	t
1577	39	Jl. Gatot Subroto 	-6.192929	106.587791	t
1578	142	Jl. Gatot Subroto (Banyuwangi)	-8.151686	114.397163	t
1579	101	Jl. Gatot Subroto (Cimahi)	-6.880509	107.543159	t
1580	59	Jl. Gatot Subroto (Gedung Telkom/Graha Merah Putih) - Semanggi	-6.229868	106.819267	t
1581	36	Jl. Gatot Subroto (Jatiuwung) arah Balaraja Serang Banten	-6.216452	106.563339	t
1582	59	Jl. Gatot Subroto (Kantor Pelayanan Pajak) - Komdak - Semanggi	-6.225307	106.816139	t
1583	59	Jl. Gatot Subroto (Pancoran) - Cawang	-6.242808	106.843636	t
1584	58	Jl. Gatot Subroto (Semanggi) arah Kuningan	-6.220944	106.813675	t
1585	101	Jl. Gatot Subroto (Simpang)	-6.880915	107.543396	t
1586	58	Jl. Gatot Subroto (depan JCC) arah Slipi	-6.214019	106.808434	t
1587	59	Jl. Gatot Subroto (depan Plaza Mandiri)	-6.224378	106.815468	t
1588	97	Jl. Gatot Subroto (depan Trans Studio Mall)	-6.927396	107.635414	t
1589	97	Jl. Gatot Subroto - Jl. Burangrang	-6.922742	107.619537	t
1590	97	Jl. Gatot Subroto - Jl. Cikuray	-6.926278	107.633446	t
1591	97	Jl. Gatot Subroto - Jl. Ciremay	-6.925127	107.629944	t
1592	97	Jl. Gatot Subroto - Jl. Gumuruh	-6.929942	107.639214	t
1593	97	Jl. Gatot Subroto - Jl. Malabar	-6.923844	107.624306	t
1594	58	Jl. Gatot Subroto - Jl. Tentara Pelajar - Stasiun Palmerah	-6.205429	106.798805	t
1595	81	Jl. Gatot Subroto - Karawang	-6.259068	107.167068	t
1596	97	Jl. Gatot Subroto - Kiara Condong	-6.931811	107.643112	t
1597	59	Jl. Gatot Subroto - Kuningan	-6.241439	106.836136	t
1598	97	Jl. Gatot Subroto Bandung	-6.925245	107.630661	t
1599	101	Jl. Gatot Subroto Cimahi	-6.883525	107.540421	t
1600	59	Jl. Gatsu (Hotel Crown) - Kuningan	-6.222132	106.814445	t
1601	59	Jl. Gatsu - Kuningan	-6.234674	106.823456	t
1602	97	Jl. Gede Bage (Pintu Rel KA Gede Bage)	-6.941513	107.691956	t
1603	97	Jl. Gede Bage Bandung	-6.953851	107.686462	t
1604	80	Jl. Gedung Lima (Pertigaan)	-6.847596	107.491905	t
1605	97	Jl. Gegerkalong Girang (Darut Tauhid)	-6.863792	107.590210	t
1606	178	Jl. Gemblongan	-7.252695	112.736794	t
1607	129	Jl. Gemolong - Sragen	-7.402154	110.892700	t
1608	178	Jl. Genteng Kali	-7.257775	112.743546	t
1609	58	Jl. Gerbang Pemuda	-6.214026	106.800392	t
1610	58	Jl. Gerbang Pemuda (Pintu Masuk JCC)	-6.212903	106.805054	t
1611	58	Jl. Gerbang Pemuda (depan TVRI) arah Gatot Subroto	-6.213706	106.800842	t
1612	58	Jl. Gerbang Pemuda - Flyover Senayan	-6.213693	106.800957	t
1613	54	Jl. Gito Gati	-7.721629	110.361755	t
1614	54	Jl. Gito Gati - Palagan	-7.719316	110.368500	t
1615	61	Jl. Gn. Sahari Raya 	-6.134266	106.831940	t
1616	61	Jl. Gn. sahari	-6.140917	106.833305	t
1617	55	Jl. Godean (Kids Fun)	-7.779540	110.342384	t
1618	178	Jl. Gubeng	-7.265091	112.751823	t
1619	178	Jl. Gubeng Masjid	-7.266202	112.753242	t
1620	178	Jl. Gubeng Pojok	-7.262010	112.749428	t
1621	86	Jl. Guntur (depan Ramayana Plaza)	-7.211731	107.900871	t
1622	97	Jl. Guntur Sari	-6.936705	107.626556	t
1623	82	Jl. Gunung Mas	-6.702916	106.971443	t
1624	82	Jl. Gunung Putri Raya 	-6.458093	106.897957	t
1625	105	Jl. Gunung Sabeulah (Simpang gunung sabeulah)	-7.323101	108.215569	t
1626	61	Jl. Gunung Sahari - Ancol	-6.138763	106.832794	t
1627	58	Jl. Gunung Sahari - Kemayoran	-6.157738	106.837097	t
1628	58	Jl. Gunung Sahari Raya	-6.150285	106.835136	t
1629	58	Jl. Gunung Sahari arah Senen	-6.171724	106.840607	t
1630	178	Jl. Gunung Sari	-7.302217	112.726723	t
1631	97	Jl. Gurame, Buah Batu	-6.931656	107.615631	t
1632	101	Jl. H Amir Machmud (Depan Yogya Plaza)	-6.880862	107.551132	t
1633	101	Jl. H Amir Machmud (Putaran Superindo)	-6.885969	107.554245	t
1634	58	Jl. H. Fachrudin	-6.182021	106.816650	t
1635	58	Jl. H. Fachrudin (Depan Hotel Millenium)	-6.182494	106.816505	t
1636	80	Jl. H. Gofur	-6.866077	107.522820	t
1637	57	Jl. H. Lebar	-6.210917	106.738853	t
1638	59	Jl. H. Muhi arah Pondok Pinang	-6.266459	106.773773	t
1639	59	Jl. H. Nawi	-6.263684	106.788925	t
1640	59	Jl. H. R. Rasuna Said - Mampang	-6.206880	106.829422	t
1641	59	Jl. H. R. Rasuna Said Kuningan (Menara Cyber) - Jl. Prof. Dr. Satrio	-6.226306	106.832832	t
1642	59	Jl. H. R. Rasuna Said Kuningan - Jl. Prof. DR. Satrio	-6.220535	106.832001	t
1643	58	Jl. HBR Motik (Kemayoran)	-6.155818	106.843750	t
1644	39	Jl. HOS Cokroaminoto - Kb. Sirih 	-6.225725	106.712006	t
1645	58	Jl. HOS. Cokroaminoto - Jl. KH. Wahid Hasyim	-6.188797	106.828949	t
1646	59	Jl. HR Rasuna Said - Menteng	-6.217808	106.830940	t
1647	178	Jl. HR. Mohammad	-7.286869	112.702744	t
1648	178	Jl. HR. Muhammad - Ngesong	-7.285168	112.695351	t
1649	59	Jl. Hang Lekir - Kampus Moestopo 	-6.230536	106.796036	t
1650	59	Jl. Hang Lekir- Senayan	-6.231112	106.795456	t
1651	59	Jl. Hang Tuah	-6.234024	106.797539	t
1652	39	Jl. Hartono Raya 	-6.200971	106.640640	t
1653	97	Jl. Hasaram - Jl. Astana Anyar	-6.925127	107.599297	t
1654	39	Jl. Hasyim Ashari	-6.249201	106.738678	t
1655	39	Jl. Hasyim Ashari, Pinang (Tangerang)	-6.222281	106.690193	t
1656	58	Jl. Hasyim Ashari-Roxy	-6.165622	106.811783	t
1657	57	Jl. Hasyim Asyari	-6.166070	106.801338	t
1658	57	Jl. Hayam Wuruk	-6.156374	106.818459	t
1659	178	Jl. Hayam Wuruk	-7.295576	112.730827	t
1660	97	Jl. Holis	-6.918173	107.576149	t
1661	97	Jl. Holis (Depan Bumi Baru)	-6.929220	107.573532	t
1662	57	Jl. Hsyim Ashari Raya	-6.164838	106.807770	t
1663	57	Jl. Husein Sastranegara (Perempanatan Rawa Bokor)	-6.113838	106.688850	t
1664	60	Jl. I Gusti Ngurah Rai 	-6.214069	106.909164	t
1665	97	Jl. IR H Djuanda (Dago)	-6.882438	107.615334	t
1666	97	Jl. Ibrahim Adjie	-6.914274	107.643799	t
1667	97	Jl. Ibrahim Adjie (Pos Binong)	-6.913662	107.643646	t
1668	58	Jl. Imam Bonjol-HI 	-6.199776	106.829399	t
1669	178	Jl. Indragiri	-7.286440	112.731606	t
1670	178	Jl. Indrapura	-7.234684	112.730690	t
1671	101	Jl. Industri - Jl. Raya Leuwi Gajah	-6.900678	107.546959	t
1672	58	Jl. Industri arah Gn. Sahari	-6.150390	106.840714	t
1673	101	Jl. Industri, Leuwigajah	-6.902441	107.547195	t
1674	97	Jl. Inhofftank - Jl. Soekarno Hatta	-6.947781	107.602539	t
1675	92	Jl. Ipik gandamanah (Rel KA)	-6.545306	107.446304	t
1676	97	Jl. Ir H Djuanda (Simpang Dago)	-6.885266	107.613747	t
1677	97	Jl. Ir H Juanda - Jl. Dipatiukur	-6.885282	107.613838	t
1678	97	Jl. Ir. H Djuanda	-6.896796	107.612862	t
1679	97	Jl. Ir. H Djuanda (Depan Baltos)	-6.899289	107.612686	t
1680	100	Jl. Ir. H Juanda (Istana Bogor)	-6.598939	106.794380	t
1681	100	Jl. Ir. H. Djuanda (Depan Balkot Bogor)	-6.595273	106.794273	t
1682	83	Jl. Ir. H. Juanda	-7.327235	108.358780	t
1683	58	Jl. Ir. H. Juanda	-6.167201	106.822968	t
1684	40	Jl. Ir. H. Juanda (Lebak Bulus) arah Ciputat	-6.290360	106.767136	t
1685	97	Jl. Ir. H. Juanda (depan SD Darul Hikam)	-6.879594	107.616425	t
1686	97	Jl. Ir. H. Juanda - Jl. Ganeca	-6.893771	107.613014	t
1687	40	Jl. Ir. H. Juanda - Pasar Jumat	-6.288840	106.770821	t
1688	40	Jl. Ir. H. Juanda ke Lebak Bulus dari Ciputat	-6.290305	106.767044	t
1689	40	Jl. Ir. H. Juanda-Ciputat 	-6.295186	106.765266	t
1690	40	Jl. Ir. H.Juanda	-6.313678	106.752434	t
1691	178	Jl. Ir. Soekarno (MERR)	-7.288662	112.780762	t
1692	59	Jl. Iskandarsyah	-6.245638	106.804642	t
1693	59	Jl. Jagakarsa	-6.330526	106.827782	t
1694	178	Jl. Jagalan	-7.248228	112.746155	t
1695	178	Jl. Jagalan	-7.245644	112.771164	t
1696	97	Jl. Jakarta	-6.914072	107.640839	t
1697	178	Jl. Jakarta	-7.222673	112.734192	t
1698	100	Jl. Jalak Harupat	-6.592400	106.800529	t
1699	55	Jl. Jambon SKE Yogya	-7.767879	110.355049	t
1700	97	Jl. Jamika	-6.921272	107.586128	t
1701	97	Jl. Jati Handap	-6.901461	107.657692	t
1702	164	Jl. Jati Raya	-7.446507	112.696518	t
1703	101	Jl. Jati Serut	-6.873342	107.555672	t
1704	101	Jl. Jati Serut (Simpang Jati Serut)	-6.876066	107.560005	t
1705	57	Jl. Jatibaru-Psr Tanah Abang 	-6.183788	106.812012	t
1706	58	Jl. Jatikramat 	-6.173793	106.877876	t
1707	95	Jl. Jatinangor (depan UNPAD)	-6.932562	107.772980	t
1708	60	Jl. Jatinegara Barat 	-6.220319	106.864960	t
1709	60	Jl. Jatinegara Timur - Terminal Kp. Melayu	-6.219145	106.867744	t
1710	99	Jl. Jatiwaringin	-6.270424	106.911926	t
1711	60	Jl. Jatiwaringin (depan McDonald)	-6.268291	106.911629	t
1712	60	Jl. Jatiwaringin Raya	-6.256659	106.909882	t
1713	61	Jl. Jawa Depan KBN Cakung Cilincing	-6.144336	106.931877	t
1714	178	Jl. Jemursari	-7.322212	112.743263	t
1715	101	Jl. Jend H Amir Machmud (Alun-Alun Cimahi)	-6.873331	107.541649	t
1716	60	Jl. Jend. Basuki	-6.229619	106.893730	t
1717	59	Jl. Jend. Gatot Subroto	-6.226334	106.816826	t
1718	39	Jl. Jend. Sudirman 	-6.189259	106.644890	t
1719	58	Jl. Jend. Sudirman	-6.202155	106.822784	t
1720	89	Jl. Jend. Sudirman	-6.988506	108.496300	t
1721	58	Jl. Jend. Sudirman-Senayan 	-6.206282	106.822105	t
1722	178	Jl. Jenderal Basuki Rachmat	-7.264219	112.741135	t
1723	123	Jl. Jenderal Sudirman (Kebulen)	-6.901238	109.674675	t
1724	59	Jl. Jenderal Sudirman - Senopati	-6.225660	106.804214	t
1725	58	Jl. Jenderal Sudirman Jakpus	-6.195979	106.823212	t
1726	100	Jl. Jendral Ahmad Yani	-6.581417	106.796822	t
1727	101	Jl. Jendral Haji Amir Machmud	-6.877538	107.548538	t
1728	92	Jl. Jendral Sudirman	-6.547843	107.443604	t
1729	92	Jl. Jendral Sudirman (SMP Yos Sudarso)	-6.548419	107.443649	t
1730	124	Jl. Jendral Sudirman - Alun-Alun	-6.889857	109.381577	t
1731	58	Jl. Jendral Sudirman - Dukuh Atas	-6.202077	106.823006	t
1732	97	Jl. Jendral Sudirman - Jl. Raya Cijerah	-6.914647	107.571495	t
1733	58	Jl. Jendral Sudirman Dukuh Atas - Semanggi	-6.202016	106.823021	t
1734	59	Jl. Jeruk Purut 	-6.288660	106.812431	t
1735	39	Jl. Joglo Raya	-6.219735	106.733696	t
1736	178	Jl. Joyoboyo	-7.298601	112.734688	t
1737	58	Jl. Juanda	-6.166236	106.830231	t
1738	164	Jl. Juanda (Hotel Utami)	-7.381257	112.745567	t
1739	103	Jl. Juanda Depok	-6.379170	106.847343	t
1740	79	Jl. Junti, Katapang	-7.002593	107.567009	t
1741	59	Jl. K. H. Abdullah Syafi'ie menuju ke Casablanca	-6.223807	106.850113	t
1742	59	Jl. K. H. Abdullah Syafi'ie menuju ke Kampung Melayu	-6.223627	106.850082	t
1743	57	Jl. K. Haji Hasyim Ashari - Roxy	-6.166049	106.805618	t
1744	52	Jl. K.H Agus Salim-Jl. Brigjen Katamso	-7.958672	110.593758	t
1745	59	Jl. KH Abdullah Syafi'i	-6.225566	106.857384	t
1746	59	Jl. KH Ahmad Dahlan	-6.245654	106.791840	t
1747	58	Jl. KH Mas Mansyur	-6.193598	106.814552	t
1748	58	Jl. KH Mas Mansyur - Karet	-6.187926	106.815613	t
1749	58	Jl. KH Mas Mansyur - Tanah Abang	-6.215066	106.818398	t
1750	100	Jl. KH Sholeh Iskandar (Bina Insani) - Jalur Tol BORR	-6.559486	106.786255	t
1751	100	Jl. KH Sholeh Iskandar (Depan Bina Insani)	-6.557148	106.784653	t
1752	105	Jl. KH Z Mustofa	-7.333343	108.219086	t
1753	55	Jl. KH. Ahmad Dahlan	-7.801156	110.356537	t
1754	58	Jl. KH. Hasyim Ashari	-6.164722	106.819862	t
1755	39	Jl. KH. Hasyim Ashari Ciledug - Kunciran	-6.221437	106.686996	t
1756	100	Jl. KH. Sholeh Iskandar	-6.560569	106.789375	t
1757	100	Jl. KH. Sholeh Iskandar (Depan Bukit Cimanggu City)	-6.560090	106.787582	t
1758	100	Jl. KS Tubun-Cibinong 	-6.567604	106.809448	t
1759	178	Jl. Kalianak	-7.229485	112.706596	t
1760	178	Jl. Kalianak - Margomulyo	-7.230272	112.711220	t
1761	59	Jl. Kalibata 	-6.261465	106.848297	t
1762	59	Jl. Kalibata (arah Pasar minggu)	-6.255632	106.844604	t
1763	59	Jl. Kalibata (depan Plaza Kalibata)	-6.256538	106.856392	t
1764	178	Jl. Kalibutuh	-7.254709	112.719017	t
1765	178	Jl. Kalibutuh arah Asem Rowo	-7.254374	112.716858	t
1766	178	Jl. Kalijudan	-7.255752	112.780556	t
1767	178	Jl. Kalirungkut	-7.327054	112.768906	t
1768	54	Jl. Kaliurang	-7.726588	110.399872	t
1769	54	Jl. Kaliurang Depan Lap.Kentungan	-7.749615	110.386406	t
1770	57	Jl. Kamal Raya (Cengkareng)	-6.133120	106.729691	t
1771	60	Jl. Kampung Melayu-Cililitan	-6.223913	106.869110	t
1772	60	Jl. Kampung Tengah (Kramat Jati)	-6.286430	106.859711	t
1773	178	Jl. Kapas Krampung	-7.249569	112.761765	t
1774	178	Jl. Kapasan arah Kenjeran	-7.238936	112.746376	t
1775	92	Jl. Kapten Halim	-6.563285	107.450790	t
1776	92	Jl. Kapten Halim (Pasar Rebo)	-6.561880	107.447289	t
1777	93	Jl. Kapten Hanafiah (Depan SD Rawabadak)	-6.559674	107.772316	t
1778	98	Jl. Kapten Jamhur	-7.373724	108.536079	t
1779	100	Jl. Kapten Muslihat	-6.595827	106.789124	t
1780	100	Jl. Kapten Muslihat (Depan Taman Kopi)	-6.596232	106.791092	t
1781	100	Jl. Kapten Muslihat (Simpang Paledang)	-6.596688	106.793449	t
1782	100	Jl. Kapten Muslihat - Jl. IR H Juanda	-6.595880	106.789917	t
1783	100	Jl. Kapten Muslihat di Persimpangan Jl. Dewi Sartika	-6.596214	106.791519	t
1784	59	Jl. Kapten Tendean - TL Wijaya	-6.240310	106.823006	t
1785	61	Jl. Kapuk Raya arah ke Jl. Teluk Gong	-6.138745	106.775528	t
1786	40	Jl. Karang Tengah	-6.300945	106.780327	t
1787	178	Jl. Karangmenjangan	-7.271961	112.761185	t
1788	97	Jl. Karapitan	-6.928876	107.616447	t
1789	97	Jl. Karapitan (Depan UnLa)	-6.931241	107.615776	t
1790	97	Jl. Karapitan - Jl. Sunda	-6.927705	107.616730	t
1791	178	Jl. Karimun Jawa	-7.273057	112.745522	t
1792	59	Jl. Kartika Utama Pondok Indah	-6.263886	106.783257	t
1793	101	Jl. Kaum (Alun - Alun Cimahi)	-6.872617	107.542107	t
1794	178	Jl. Kayon	-7.266644	112.749619	t
1795	178	Jl. Kayoon	-7.269482	112.747192	t
1796	97	Jl. Kb Jati - Jl. Gardu Jati	-6.916303	107.598320	t
1797	97	Jl. Kebon Jati (depan RS Santosa)	-6.916202	107.600594	t
1798	57	Jl. Kebon Jeruk	-6.198048	106.770180	t
1799	58	Jl. Kebon Kacang 	-6.188193	106.816719	t
1800	97	Jl. Kebon Kawung	-6.912512	107.601624	t
1801	178	Jl. Kebon Rojo (Tugu Pahlawan)	-7.243374	112.737518	t
1802	58	Jl. Kebon SIrih-Tugu Tani	-6.183137	106.826530	t
1803	58	Jl. Kebon Sirih	-6.182860	106.830582	t
1804	57	Jl. Kedoya	-6.182604	106.761551	t
1805	178	Jl. Kedung Baruk	-7.310454	112.776398	t
1806	178	Jl. Kedung Doro	-7.264352	112.730972	t
1807	178	Jl. Kedungdoro - Embong Malang - Tidar - Blauran	-7.258514	112.733269	t
1808	60	Jl. Kelapa Dua Wetan	-6.340864	106.887337	t
1809	59	Jl. Kemang Raya	-6.264067	106.816078	t
1810	59	Jl. Kemang Selatan - Ampera	-6.273538	106.817322	t
1811	59	Jl. Kemang Selatan VIII (Brodo) arah Antasari	-6.267703	106.814964	t
1812	59	Jl. Kemang Timur 	-6.259034	106.823112	t
1813	59	Jl. Kemang Timur arah Ampera	-6.258040	106.823082	t
1814	57	Jl. Kemanggisan 	-6.195531	106.782150	t
1815	57	Jl. Kemanggisan (depan Binus Kampus Anggrek)	-6.201387	106.782570	t
1816	57	Jl. Kemanggisan Ilir	-6.194443	106.787407	t
1817	57	Jl. Kemanggisan Raya	-6.190625	106.785912	t
1818	57	Jl. Kemanggisan Utama	-6.189379	106.798965	t
1819	58	Jl. Kemayoran	-6.156619	106.847404	t
1820	57	Jl. Kembang Kerep	-6.192825	106.742546	t
1821	57	Jl. Kembang Kerep (Depan Kawan Lama)	-6.190585	106.742317	t
1822	178	Jl. Kenjeran	-7.251064	112.789124	t
1823	178	Jl. Kenjeran arah Mulyosari - UPN - Pasar Keling	-7.263075	112.782944	t
1824	178	Jl. Kepatihan	-7.241320	112.594841	t
1825	59	Jl. Kesehatan Raya - Bintaro Utama 1	-6.270978	106.756416	t
1826	111	Jl. Ketanggungan - Margasari	-7.033926	108.994644	t
1827	58	Jl. Ketapang	-6.163873	106.848305	t
1828	178	Jl. Ketintang	-7.310134	112.729965	t
1829	178	Jl. Ketintang	-7.310241	112.732986	t
1830	97	Jl. Kidang Pananjung	-6.882853	107.614037	t
1831	178	Jl. Klampis Jaya	-7.284530	112.776375	t
1832	119	Jl. Klaten - Solo	-7.689111	110.624855	t
1833	119	Jl. Klaten-Solo	-7.618198	110.699745	t
1834	103	Jl. Kober arah Flyover UI	-6.359080	106.832756	t
1835	101	Jl. Kolonel Masturi	-6.864394	107.543793	t
1836	80	Jl. Kolonel Masturi (Pertigaan Beatrix)	-6.819100	107.611511	t
1837	140	Jl. Kolonel Sugiono	-6.870567	109.116524	t
1838	82	Jl. Kolonel bustomi (Pasar caringin)	-6.705888	106.821999	t
1839	57	Jl. Kopi (Roa Malaka)	-6.134548	106.809479	t
1840	103	Jl. Kopo	-6.343727	106.804535	t
1841	79	Jl. Kopo (Depan Taman Kopo Indah)	-6.966759	107.575691	t
1842	97	Jl. Kopo - Caringin	-6.946886	107.588654	t
1843	97	Jl. Kopo - Jl. Leuwi Panjang	-6.943467	107.591003	t
1844	79	Jl. Kopo - Sayati (depan Indomaret)	-6.976002	107.569771	t
1845	79	Jl. Kopo Mas	-6.959277	107.580002	t
1846	79	Jl. Kopo Permai (Sukamenak)	-6.964075	107.585831	t
1847	79	Jl. Kopo Soreang - Jl. Cilampeni	-6.985193	107.561111	t
1848	94	Jl. Kormail Purwosari (Pasar Cicurug)	-6.773887	106.798172	t
1849	59	Jl. Kramat Putal Senayan, Kebayoran Lama	-6.231123	106.785851	t
1850	58	Jl. Kramat Raya	-6.186097	106.844994	t
1851	58	Jl. Kramat Raya - Senen	-6.185605	106.844475	t
1852	57	Jl. Ks. Tubun Raya - Slipi	-6.186111	106.808929	t
1853	178	Jl. Kusuma Bangsa	-7.253539	112.749832	t
1854	178	Jl. Kutai	-7.292724	112.733246	t
1855	58	Jl. Kwini 1 	-6.176460	106.839081	t
1856	58	Jl. Kwitang 	-6.180001	106.840538	t
1857	58	Jl. Kwitang Raya - Menteng	-6.181694	106.837059	t
1858	58	Jl. Kyai Carigin	-6.171094	106.809868	t
1859	58	Jl. Kyai Caringin - Tomang	-6.171109	106.810745	t
1860	59	Jl. Kyai Maja 	-6.240818	106.787903	t
1861	57	Jl. Kyai Tapa	-6.166561	106.794380	t
1862	97	Jl. LLRE. Martadinata (Taman Pramuka)	-6.912006	107.628044	t
1863	84	Jl. Labuan - Cianjur (Istana Cipanas)	-6.733411	107.041611	t
1865	61	Jl. Laksamana Yos Sudarso Sunter Jakut	-6.112131	106.893311	t
1866	97	Jl. Laswi	-6.918631	107.631294	t
1867	79	Jl. Laswi (Baleendah)	-7.018728	107.653244	t
1868	97	Jl. Laswi (perlintasan rel KA)	-6.919983	107.631058	t
1869	97	Jl. Laswi - Jl. Gatsu	-6.924446	107.627777	t
1870	57	Jl. Latumeneten  - Slipi 	-6.163190	106.789322	t
1871	57	Jl. Latumenten-Grogol 	-6.162934	106.789452	t
1872	57	Jl. Latumenten-Tomang 	-6.163088	106.789085	t
1873	100	Jl. Lawang Gintung 	-6.623366	106.812469	t
1874	59	Jl. Layang Pancoran - Cawang	-6.242998	106.843552	t
1875	59	Jl. Lebak Bulus Raya	-6.297404	106.783806	t
1876	59	Jl. Lebak Bulus-RS Fatmawati	-6.289257	106.775063	t
1877	178	Jl. Lempung Tama	-7.263820	112.672523	t
1878	97	Jl. Lengkong Kecil	-6.923248	107.612999	t
1879	59	Jl. Lenteng Agung	-6.304261	106.839432	t
1880	59	Jl. Lenteng Agung (Kampus ISIP) - Pasar Minggu	-6.323152	106.834938	t
1881	59	Jl. Lenteng Agung arah Margonda	-6.354565	106.832207	t
1882	58	Jl. Let. Jend Suprapto	-6.167137	106.874146	t
1883	82	Jl. Letda Natsir 	-6.410991	106.937965	t
1884	58	Jl. Letjen R. Suprapto (Cempaka Putih)	-6.172832	106.861290	t
1885	58	Jl. Letjen R. Suprapto (Sekitar RS Islam Jakarta)	-6.168750	106.870560	t
1886	58	Jl. Letjen R. Suprapto - Senen	-6.168293	106.871384	t
1887	57	Jl. Letjen S. Parman (Slipi Jaya) - Tomang	-6.188872	106.796860	t
1888	58	Jl. Letjen Suprapto	-6.165745	106.873207	t
1889	98	Jl. Letjen Suwarto (Simpang 3 Pendopo)	-7.369880	108.541924	t
1890	93	Jl. Letnan Jendral Soeprapto	-6.568459	107.760773	t
1891	40	Jl. Letnan Sutop 	-6.292456	106.679070	t
1892	101	Jl. Leuwi Gajah - Jl. Kerkof	-6.902777	107.536133	t
1893	97	Jl. Leuwi Panjang	-6.942658	107.595978	t
1894	99	Jl. Leuwinanggung 	-6.392029	106.909142	t
1895	111	Jl. Lingkar Bumiayu	-7.246950	109.015747	t
1896	84	Jl. Lingkar Selatan (Pertigaan Pasir Hayam)	-6.845811	107.132416	t
1897	60	Jl. Lodan Raya 	-6.194464	106.895515	t
1898	61	Jl. Lodan Raya	-6.129247	106.834854	t
1899	100	Jl. Lodaya	-6.588771	106.805603	t
1900	97	Jl. Lodaya - Jl. Pelajar Pejuang	-6.932349	107.625732	t
1901	97	Jl. Logam, Margasari	-6.956684	107.643776	t
1902	59	Jl. Lt Agung - Tanjung Barat	-6.323387	106.834770	t
1903	101	Jl. Lurah	-6.876111	107.543449	t
1904	103	Jl. M. Jasin - Flyover UI Depok	-6.355559	106.832535	t
1905	59	Jl. M. Kafi I - Cilandak	-6.310780	106.813179	t
1906	59	Jl. M. Kahfi I	-6.311246	106.813179	t
1907	59	Jl. M. Saidi arah Petukangan	-6.242272	106.756546	t
1908	59	Jl. M. T. Haryono (Cawang) - Pancoran	-6.243430	106.858093	t
1909	58	Jl. M.H. Thamrin - Jl. Sudirman	-6.194040	106.823143	t
1910	39	Jl. M.T. Haryono Tangerang	-6.182160	106.633430	t
1911	59	Jl. M.T.Haryono (Bank Bukopin)	-6.243564	106.850052	t
1912	97	Jl. M.Toha - Karasak	-6.950086	107.609993	t
1913	121	Jl. MAGELANG	-7.599805	110.297432	t
1914	58	Jl. MH Thamrin	-6.189259	106.823082	t
1915	58	Jl. MH. Thamrin-Merdeka Barat	-6.181484	106.822754	t
1916	58	Jl. MH. Thamrin-Sarinah 	-6.181478	106.823029	t
1917	59	Jl. MT Haryono	-6.243441	106.862167	t
1918	59	Jl. MT. Haryono (arah Pancoran)	-6.243377	106.854408	t
1919	121	Jl. Magelang	-7.617134	110.309227	t
1920	55	Jl. Magelang	-7.753623	110.362190	t
1921	121	Jl. Magelang - Jogja	-7.583537	110.286438	t
1922	54	Jl. Magelang - Yogya	-7.661296	110.328697	t
1923	121	Jl. Magelang-Yogyakarta Perempatan Sayangan	-7.582699	110.288582	t
1924	101	Jl. Mahar Martanegara (Simpang)	-6.901365	107.544624	t
1925	58	Jl. Majapahit arah Harmoni	-6.168006	106.820824	t
1926	59	Jl. Mampang Prapatan	-6.240615	106.825790	t
2755	141	Jokotole	-7.025190	112.749657	t
1927	59	Jl. Mampang Prapatan - Jl. Buncit Raya	-6.240840	106.825783	t
1928	57	Jl. Mangga Besar - Hayam Wuruk	-6.149366	106.820602	t
1929	57	Jl. Mangga Besar - Jl. Hayam Wuruk	-6.149986	106.817131	t
1930	58	Jl. Mangga Besar Raya	-6.147918	106.830040	t
1931	61	Jl. Mangga Dua Raya 	-6.135792	106.827515	t
1932	178	Jl. Manukan Dalam	-7.262936	112.669548	t
1933	178	Jl. Manyar Kertoarjo	-7.280060	112.766571	t
1934	178	Jl. Manyar Rejo	-7.294161	112.765778	t
1935	97	Jl. Margacinta - Jl. Logam	-6.954714	107.643867	t
1936	97	Jl. Margacinta - tugu kordon	-6.954490	107.642220	t
1937	59	Jl. Margaguna Raya - Radio Dalam	-6.263338	106.784103	t
1938	59	Jl. Margasatwa arah T. B. Simatupang	-6.310741	106.813087	t
1939	103	Jl. Margonda - Citayam	-6.398985	106.819931	t
1940	103	Jl. Margonda - Jl. Dewi Sartika	-6.399726	106.819275	t
1941	103	Jl. Margonda Raya (U-turn BNI Depok)	-6.396182	106.821449	t
1942	103	Jl. Margonda Raya dari Lenteng Agung	-6.359237	106.832909	t
1943	178	Jl. Margorejo Indah	-7.317286	112.750000	t
1944	97	Jl. Martanegara	-6.933158	107.627159	t
1945	61	Jl. Marunda	-6.120489	106.955872	t
1946	178	Jl. Mastrip	-7.314391	112.709511	t
1947	164	Jl. Mastrip - Warugunung	-7.350401	112.669388	t
1948	129	Jl. Masuk Pasar Banaran	-7.363621	111.136452	t
1949	60	Jl. Matraman Raya	-6.210664	106.860115	t
1950	60	Jl. Matraman Raya - Jatinegara	-6.206410	106.858543	t
1951	39	Jl. Maulana Hasanudin (sekitar Stasiun Poris)	-6.169601	106.680367	t
1952	82	Jl. Mayor Oking	-6.470155	106.861137	t
1953	100	Jl. Mayor Oking (Stasiun Bogor)	-6.593811	106.789932	t
1954	58	Jl. Medan Merdeka	-6.180417	106.825134	t
1955	58	Jl. Medan Merdeka Barat	-6.176780	106.822708	t
1956	58	Jl. Medan Merdeka Barat - Harmoni	-6.175414	106.822685	t
1957	58	Jl. Medan Merdeka Barat - Patung Kuda	-6.175164	106.823067	t
1958	58	Jl. Medan Merdeka Barat-Bundaran HI 	-6.176182	106.822678	t
1959	58	Jl. Medan Merdeka Timur	-6.176726	106.831253	t
1960	58	Jl. Medan Merdeka Utara 	-6.171489	106.825607	t
1961	58	Jl. Medan Merdeka Utara-Istana Negara 	-6.171489	106.825157	t
1962	58	Jl. Medan Merdeka-Thamrin 	-6.180758	106.823639	t
1963	59	Jl. Melawai (Blok M)	-6.245914	106.798111	t
1964	40	Jl. Menjangan 	-6.294227	106.735245	t
1965	58	Jl. Menteng Raya	-6.184587	106.835068	t
1966	58	Jl. Menteng Raya-Cikini	-6.184843	106.835236	t
1967	55	Jl. Menteri Supeno	-7.816595	110.381531	t
1968	97	Jl. Merdeka	-6.907543	107.610550	t
1969	97	Jl. Merdeka - Jl. Aceh	-6.909860	107.610626	t
1970	97	Jl. Merdeka - Riau	-6.907074	107.610497	t
1971	174	Jl. Merdeka Barat Alun - Alun	-7.981590	112.630386	t
1972	57	Jl. Meruya Utara 	-6.191777	106.724602	t
1973	57	Jl. Meruya Utara (Jakarta Barat)	-6.196880	106.732216	t
1974	103	Jl. Meruyung, Pancoran Mas	-6.388623	106.768837	t
1975	59	Jl. Metro Pondok Indah	-6.280518	106.780586	t
1976	59	Jl. Metro Pondok Indah - Lebak Bulus	-6.275834	106.782066	t
1977	56	Jl. Minangkabau 	-6.210783	106.844940	t
1978	101	Jl. Mintaredja (Pusdikpom)	-6.894570	107.541702	t
1979	101	Jl. Mintaredja SH (keluar tol Baros)	-6.895624	107.541992	t
1980	61	Jl. Mitra Sunter - MOI	-6.149960	106.886780	t
1981	97	Jl. Moch Toha 	-6.939250	107.606323	t
1982	97	Jl. Moch Toha (Simpang Tol)	-6.955864	107.611923	t
1983	97	Jl. Moch Toha (Tegalega Timur)	-6.934873	107.606377	t
1984	97	Jl. Moch Toha - Jl. Ibu Inggit Garnasih	-6.931875	107.606659	t
1985	141	Jl. Modung - Kwanyar	-7.163108	112.858391	t
1986	82	Jl. Moh Toha 	-6.342490	106.565620	t
1987	97	Jl. Moh Toha - Jl. BKR	-6.937631	107.606232	t
1988	39	Jl. Moh. Toha	-6.171396	106.605927	t
1989	58	Jl. Musi 	-6.172833	106.809021	t
1990	178	Jl. Nambangan	-7.222034	112.779785	t
1991	97	Jl. Naripan	-6.920819	107.615814	t
1992	51	Jl. Nasional 3 Piyungan	-7.837268	110.473915	t
1993	96	Jl. Nasional III (Alun-Alun Ciawi)	-7.158376	108.147751	t
1994	52	Jl. Nglipar - Ngawen	-7.864014	110.655334	t
1995	178	Jl. Nias	-7.268651	112.751785	t
1996	103	Jl. Nusantara Raya 	-6.390984	106.814468	t
1997	54	Jl. Opak Raya-Piyungan	-7.781262	110.476860	t
1998	60	Jl. Otista	-6.236376	106.868271	t
1999	60	Jl. Otista	-6.230984	106.868607	t
2000	94	Jl. Otista - Jl. Gudang	-6.922848	106.934029	t
2001	100	Jl. Otista - Jl. Suryakencana (Sekitar Pasar Bogor)	-6.603231	106.798874	t
2002	40	Jl. Otista Raya 	-6.323488	106.745247	t
2003	94	Jl. Ottista (simpang pertamina)	-6.926114	106.933502	t
2004	93	Jl. Ottista Subang (Perempatan Shinta)	-6.569485	107.761772	t
2005	97	Jl. Otto Iskandar Dinata (Pasar Baru)	-6.917406	107.604355	t
2006	100	Jl. Otto Iskandar Dinata (Pasar Bogor)	-6.602808	106.799629	t
2007	85	Jl. Otto Iskandar Dinata (Pasar Pasalaran)	-6.705409	108.506752	t
2008	93	Jl. Otto Iskandar Dinata (SMPN 3 Subang)	-6.565158	107.765518	t
2009	97	Jl. Otto Iskandar Dinata - Jl. ABC	-6.918311	107.604324	t
2010	97	Jl. Otto Iskandar Dinata - Jl. Pungkur	-6.927236	107.603668	t
2011	97	Jl. Otto Iskandardinata	-6.928408	107.603592	t
2012	100	Jl. Otto Iskandardinata (Tugu Kujang)	-6.601625	106.804466	t
2013	58	Jl. P. Dipenogoro 	-6.201013	106.838394	t
2014	97	Jl. PH H Mustopa - Jl. Padasuka	-6.901930	107.653580	t
2015	97	Jl. PH. H. Mustofa (Suci)	-6.900311	107.645134	t
2016	97	Jl. PH. H. Mustofa - Jl. Pahlawan	-6.897776	107.634239	t
2017	97	Jl. PH.H Mustofa (Surapati Core)	-6.901834	107.652359	t
2018	97	Jl. Pacuan Kuda	-6.905626	107.673172	t
2019	97	Jl. Padasuka	-6.900662	107.653877	t
2020	97	Jl. Pagarsih	-6.922225	107.589066	t
2021	111	Jl. Paguyangan (Top FM)	-7.299864	109.037300	t
2022	178	Jl. Pahlawan	-7.245454	112.738503	t
2023	97	Jl. Pahlawan	-6.898969	107.634026	t
2024	178	Jl. Pahlawan (BI)	-7.244140	112.738274	t
2025	40	Jl. Pahlawan (Bintaro) - Rempoa	-6.290132	106.759079	t
2026	152	Jl. Pahlawan (Plaza Madiun)	-7.625641	111.520149	t
2027	82	Jl. Pahlawan (Simpang BNR)	-6.503484	106.870178	t
2028	82	Jl. Pahlawan (Simpang Layungsari)	-6.488267	106.881653	t
2029	100	Jl. Pahlawan (TMP Dereded)	-6.617499	106.805496	t
2030	178	Jl. Pahlawan - Indrapura	-7.249078	112.737923	t
2031	60	Jl. Pahlawan Revolusi	-6.232243	106.897270	t
2032	40	Jl. Pahlawan Seribu 	-6.284842	106.666023	t
2033	97	Jl. Pajajaran	-6.906691	107.595390	t
2034	100	Jl. Pajajaran (Halte kesatuan)	-6.602381	106.805748	t
2035	97	Jl. Pajajaran (Hotel Pajajaran)	-6.906909	107.588737	t
2036	97	Jl. Pajajaran (Istana Plaza)	-6.906462	107.597023	t
2037	100	Jl. Pajajaran (Polsek Bogor Timur)	-6.564652	106.810471	t
2038	100	Jl. Pajajaran (Simpang Rambu Baranangsiang)	-6.604566	106.806892	t
2039	97	Jl. Pajajaran (Univ. Nurtanio)	-6.904955	107.582565	t
2040	100	Jl. Pajajaran (simpang sambu)	-6.606602	106.808609	t
2041	97	Jl. Pajajaran - Jl. HOS Cokroaminoto	-6.906425	107.597595	t
2042	100	Jl. Pajajaran - Jl. Sukasari	-6.618613	106.815475	t
2043	178	Jl. Pakal 	-7.237233	112.618698	t
2044	57	Jl. Pakin	-6.127890	106.807381	t
2045	59	Jl. Pakubuwono VI - Kampus Moestopo	-6.233777	106.793350	t
2046	97	Jl. Palasari	-6.927992	107.623238	t
2047	100	Jl. Paledang (Bogor)	-6.599925	106.790962	t
2048	58	Jl. Palmerah	-6.207328	106.796165	t
2049	58	Jl. Palmerah Selatan	-6.209092	106.796394	t
2050	40	Jl. Pamulang Raya 	-6.343471	106.731728	t
2051	80	Jl. Panaris	-6.846381	107.497757	t
2052	59	Jl. Pangeran Antasari	-6.271853	106.808762	t
2053	59	Jl. Pangeran Antasari - Jl. Cipete Raya - Jl. Fatmawati	-6.278086	106.806114	t
2054	59	Jl. Pangeran Antasari Jaksel	-6.256179	106.808022	t
2055	59	Jl. Pangeran Antasari dari Jl. T. B. Simatupang	-6.274709	106.808517	t
2056	57	Jl. Pangeran Tubagus Angke 	-6.142646	106.795723	t
2057	57	Jl. Pangeran Tubagus Angke - Bandengan	-6.155681	106.769463	t
2058	178	Jl. Panglima Sudirman	-7.271110	112.743118	t
2059	178	Jl. Panglima Sudirman	-7.269396	112.743912	t
2060	152	Jl. Panglima Sudirman (Saradan)	-7.549900	111.688255	t
2061	57	Jl. Panjang	-6.161356	106.763031	t
2062	57	Jl. Panjang - Pos Pengumben	-6.195932	106.768967	t
2063	97	Jl. Panorama	-6.869145	107.600182	t
2064	97	Jl. Panorama - Sukasari	-6.871786	107.599937	t
2065	80	Jl. Panoropongan Bintang	-6.822658	107.615074	t
2066	57	Jl. Pantai Indah Kapuk	-6.108019	106.739937	t
2067	61	Jl. Pantai Indah Utara -Cengkareng 	-6.116329	106.762817	t
2068	61	Jl. Pantai Indah Utara arah Kapuk Raya	-6.116131	106.768524	t
2069	61	Jl. Pantai Indah Utara arah Pluit	-6.116015	106.767929	t
2071	118	Jl. Pantura Lohbener	-6.951093	110.236191	t
2072	118	Jl. Pantura Pamanukan 	-6.950097	110.237457	t
2073	85	Jl. Panturan (Bawah FlyOver Pasar Gebang)	-6.818021	108.727943	t
2074	105	Jl. Panyerutan	-7.332832	108.220322	t
2075	51	Jl. Parang Tritis	-7.852350	110.357773	t
2076	55	Jl. Parangtritis Depan HMMC	-7.830487	110.367218	t
2077	51	Jl. Parangtritis Kali Opak	-7.988836	110.315376	t
2078	51	Jl. Parangtritis Polsek Pundong	-7.943801	110.331711	t
2079	101	Jl. Pasantren (Pertigaan)	-6.871004	107.561493	t
2080	101	Jl. Pasar Atas - Jl. Kolonel Matsuri	-6.869057	107.542442	t
2081	82	Jl. Pasar Cisarua	-6.680357	106.929253	t
2082	59	Jl. Pasar Minggu 	-6.267736	106.845291	t
2083	178	Jl. Pasar Turi	-7.245908	112.734863	t
2084	178	Jl. Pasar Turi - Dupak	-7.246186	112.734123	t
2085	97	Jl. Pasir Impun	-6.897446	107.676361	t
2086	80	Jl. Pasir Ipis	-6.816309	107.619911	t
2087	97	Jl. Pasir Kaliki (Istana Plaza)	-6.905828	107.597572	t
2088	97	Jl. Pasir Kaliki (Primarasa)	-6.902963	107.597435	t
2089	97	Jl. Pasir kaliki (Gardu jati)	-6.916261	107.598206	t
2090	97	Jl. Pasirkaliki	-6.911558	107.597908	t
2091	97	Jl. Pasirkaliki (Paskal Hyper Square)	-6.915047	107.598083	t
2092	97	Jl. Pasirkaliki (Perlintasan KA)	-6.914296	107.598114	t
2093	97	Jl. Pasirkaliki - Jl. Pajajaran	-6.906526	107.597557	t
2094	60	Jl. Pasming-Pancoran 	-6.276161	106.845985	t
2095	97	Jl. Pasteur	-6.892259	107.581642	t
2096	97	Jl. Pasteur (Biofarma)	-6.900141	107.601036	t
2097	97	Jl. Pasteur (Pasteur Hyper Point)	-6.894464	107.587738	t
2098	97	Jl. Pasteur (bawah flyover, depan RSHS)	-6.900157	107.598412	t
2099	97	Jl. Pasteur - Cokro (Pasirkaliki)	-6.900556	107.597435	t
2100	97	Jl. Pasteur - Jl. Pasirkaliki (arah Sukajadi)	-6.900125	107.597435	t
2101	97	Jl. Pasteur - PHP (Griya Pasteur)	-6.895326	107.588959	t
2102	97	Jl. Pasteur arah Tol Pasteur (bawah flyover Pasupati)	-6.899342	107.594360	t
2103	84	Jl. Pasundan - Jl. Arif Rahman Hakim (SMU Pasundan)	-6.812887	107.148903	t
2104	59	Jl. Patimura-Blok M 	-6.234600	106.801224	t
2105	87	Jl. Patrol	-6.315384	108.007721	t
2106	59	Jl. Pattimura	-6.229760	106.800644	t
2107	59	Jl. Pattimura - Sudirman	-6.234189	106.800934	t
2108	59	Jl. Pattimura arah Bundaran Senayan	-6.229987	106.800522	t
2109	60	Jl. Pd. Kelapa- Cawang 	-6.237719	106.934311	t
2110	61	Jl. Pegangsaan Dua	-6.134880	106.915482	t
3254	156	Nglundo	-7.595132	111.969032	t
2111	59	Jl. Pejaten Barat arah Ampera Raya	-6.276666	106.824196	t
2112	58	Jl. Pejompongan	-6.203339	106.803596	t
2113	57	Jl. Pejuang	-6.191542	106.762238	t
2114	94	Jl. Pelabuhan II (PT. GSI Cikembar)	-6.978399	106.831573	t
2115	142	Jl. Pelabuhan Ketapang	-8.142881	114.399719	t
2116	97	Jl. Pelajar Pejuang	-6.928387	107.626770	t
2117	97	Jl. Pelajar Pejuang - Jl. Gatsu	-6.924606	107.627716	t
2118	97	Jl. Pelajar Pejuang - Jl. Laswi	-6.924456	107.627846	t
2119	178	Jl. Pemuda	-7.264884	112.746742	t
2120	60	Jl. Pemuda 	-6.193067	106.881004	t
2121	60	Jl. Pemuda (Arion Mall) - Pramuka	-6.193590	106.891045	t
2122	140	Jl. Pemuda - Tegal	-6.877304	109.071655	t
2123	121	Jl. Pemuda Muntilan	-7.581359	110.284943	t
2124	121	Jl. Pemuda Muntilan - Magelang	-7.580370	110.284325	t
2125	58	Jl. Pemuda UNJ arah Pramuka	-6.192913	106.879257	t
2126	135	Jl. Pemuda-Jend.Sudirman	-7.484665	110.220886	t
2127	178	Jl. Peneleh	-7.252352	112.737427	t
2128	59	Jl. Pengadegan Timur Raya-Kalibata 	-6.248219	106.858925	t
2129	178	Jl. Pengampon	-7.245934	112.747314	t
2130	95	Jl. Pengeran Geusan Ulun - Sumedang (Pertigaan BNI)	-6.858072	107.921555	t
2131	60	Jl. Penggilingan Raya	-6.198246	106.935036	t
2132	58	Jl. Penjernihan 	-6.201675	106.807213	t
2133	58	Jl. Penjernihan 1 - Karet	-6.201120	106.813263	t
2134	178	Jl. Perak Barat	-7.227995	112.730431	t
2135	178	Jl. Perak Barat	-7.204025	112.733788	t
2136	178	Jl. Perak Timur	-7.217905	112.732513	t
2137	79	Jl. Percobaan Cileunyi	-6.940730	107.744370	t
2138	39	Jl. Perimeter Selatan, Bandara Soekarno-Hatta arah Kota Tangerang	-6.149737	106.632820	t
2139	36	Jl. Perimeter Utara	-6.120031	106.635101	t
2140	39	Jl. Perimeter Utara Bandara	-6.103218	106.681664	t
2141	59	Jl. Perintis - Guru Mughni	-6.228880	106.823631	t
2142	98	Jl. Perintis Kemerdekaan (Simpang Jarum)	-7.369591	108.536041	t
2143	94	Jl. Perintis Kemerdekaan (Terminal Cibadak)	-6.896391	106.780342	t
2144	58	Jl. Perintis Kemerdekaan - Bekasi	-6.169505	106.884743	t
2145	59	Jl. Permata Hijau	-6.226377	106.771957	t
2146	40	Jl. Pertanian Raya 	-6.300796	106.776894	t
2147	88	Jl. Perumnas Teluk Jambe (arah GT Karawang Barat)	-6.336018	107.275505	t
2148	101	Jl. Pesantren	-6.882832	107.557625	t
2149	101	Jl. Pesantren Dalam (bawah flyover)	-6.888802	107.556030	t
2150	97	Jl. Peta - Jl. Kopo	-6.936981	107.595055	t
2151	57	Jl. Petamburan-Slipi	-6.189995	106.809578	t
2152	123	Jl. Petukangan - Kreo 	-6.925958	109.608879	t
2153	59	Jl. Pintu Satu Senayan	-6.223470	106.803673	t
2154	61	Jl. Pluit Raya arah Pasar Ikan	-6.126904	106.803848	t
2155	61	Jl. Pluit Selatan Raya (Hotel Sanno)	-6.125322	106.798439	t
2156	61	Jl. Pluit Selatan Raya - Muara Baru	-6.125194	106.799500	t
2157	101	Jl. Pojok (Simpang Pojok)	-6.871813	107.539047	t
2158	60	Jl. Pondok Bambu 	-6.241580	106.900055	t
2159	40	Jl. Pondok Cabe Raya 	-6.328329	106.766640	t
2160	40	Jl. Pondok Cabe Raya - Jl. Cirendeu Raya	-6.325398	106.766899	t
2161	60	Jl. Pondok Gede 	-6.290729	106.883606	t
2162	57	Jl. Pos Pengumben 	-6.216479	106.772430	t
2163	178	Jl. Praban	-7.255912	112.736000	t
2164	95	Jl. Prabu Gajah Agung (Pertigaan Karapyak)	-6.834384	107.917038	t
2165	60	Jl. Pramuka	-6.194187	106.861481	t
2166	60	Jl. Pramuka (arah Proklamasi)	-6.194144	106.861191	t
2167	58	Jl. Pramuka - Salemba	-6.192251	106.869057	t
2168	103	Jl. Pramuka Raya 	-6.388809	106.793373	t
2169	59	Jl. Prapanca	-6.248561	106.806870	t
2170	178	Jl. Prapen	-7.309177	112.759369	t
2171	59	Jl. Prof Doktor Satrio (Kuningan) arah Kampung Melayu	-6.225558	106.831184	t
2172	59	Jl. Prof Joko Sutono 	-6.239751	106.807281	t
2173	59	Jl. Prof. DR. Satrio	-6.221044	106.820602	t
2174	59	Jl. Prof. DR. Satrio (Ambassador)	-6.224156	106.825806	t
2175	59	Jl. Prof. DR. Satrio - Tanah Abang	-6.225540	106.830116	t
2176	57	Jl. Prof. Dr. Latumenten arah Jembatan Besi	-6.153441	106.794281	t
2177	178	Jl. Prof. Dr. Mustopo	-7.265842	112.759186	t
2178	59	Jl. Prof. Dr. Satrio (Ciputra Avenue)	-6.223481	106.823502	t
2179	97	Jl. Prof. Eyckman	-6.896016	107.598587	t
2180	56	Jl. Proklamasi - Jl. Pangeran Diponegoro - Jl. Imam Bonjol	-6.200727	106.843971	t
2181	56	Jl. Proklamasi - Manggarai 	-6.202187	106.846100	t
2182	58	Jl. Pulomas	-6.177761	106.882614	t
2183	97	Jl. Pungkur	-6.932088	107.613625	t
2184	97	Jl. Pungkur - Jl. Balong Gede	-6.927396	107.607010	t
2185	57	Jl. Puri Indah	-6.185094	106.753265	t
2186	80	Jl. Purwakarta (Pasar Tagog)	-6.841151	107.485901	t
2187	103	Jl. Putri Tunggal (Cibubur)	-6.369700	106.888222	t
2188	85	Jl. R Dewi Sartika (Polres Cirebon)	-6.758651	108.474670	t
2189	85	Jl. R Dewi Sartika (SDN Kenanga)	-6.756451	108.464447	t
2190	61	Jl. R.E Martadinata	-6.122105	106.865059	t
2191	61	Jl. R.E. Martadinata arah Tanjung Priok	-6.120708	106.864845	t
2192	94	Jl. RA Kosasih (Simpang Gang Samsi)	-6.922768	106.940025	t
2193	105	Jl. RAA Wiratanuningrat (Alun-Alun Singaparna)	-7.326299	108.224762	t
2194	59	Jl. RC Veteran - Tanah Kusir	-6.255258	106.769066	t
2195	94	Jl. RE Martadinata (Pintu Keluar Yogya Toserba)	-6.920388	106.928726	t
2196	94	Jl. RE Martadinata (Simpang Kimia Farma)	-6.919933	106.927673	t
2197	94	Jl. RE Martadinata (Simpang NBS)	-6.920822	106.935638	t
2198	54	Jl. RE Martadinata - Jl. Wates	-7.800252	110.335144	t
2199	97	Jl. RE Martadinata Bandung	-6.906361	107.616150	t
2200	100	Jl. RE Martadinata Bogor	-6.581796	106.793930	t
2201	92	Jl. RE Martadinata Purwakarta	-6.556514	107.443855	t
2202	59	Jl. RM Harsono 	-6.299388	106.820992	t
2203	101	Jl. Raden Demang Hardjakusumah (Pemkot Cimahi) - Jl. Jati Serut	-6.872995	107.554817	t
2204	101	Jl. Raden Demang Hardjakusumah (Simpang Pemkot Cimahi)	-6.871339	107.554619	t
2205	39	Jl. Raden Fatah Ciledug arah ke Jombang Raya	-6.256415	106.704117	t
2206	164	Jl. Raden Patah Sidoarjo	-7.457007	112.720284	t
2207	58	Jl. Raden Saleh 	-6.190817	106.843475	t
2208	39	Jl. Raden Saleh 	-6.203637	106.718491	t
2209	59	Jl. Radio Dalam 	-6.255077	106.790520	t
2210	59	Jl. Radio Dalam Raya	-6.249470	106.791786	t
2211	59	Jl. Radio Dalam Raya - Pondok Indah / Jl. H. Nawi	-6.263127	106.788368	t
2212	164	Jl. Rajawali	-7.399196	112.730309	t
2213	178	Jl. Rajawali	-7.236576	112.737831	t
2214	97	Jl. Rajawali Timur	-6.915627	107.585228	t
2215	97	Jl. Rancabolang (PT. Primarindo Gede Bage)	-6.949873	107.662292	t
2216	95	Jl. Rancaekek	-6.963298	107.796692	t
2217	95	Jl. Rancaekek (PT. Vonex)	-6.964490	107.801620	t
2218	79	Jl. Rancaekek - Lingga Jaya.	-6.955097	107.771782	t
2219	79	Jl. Rancamanyar	-6.990454	107.596085	t
2220	79	Jl. Rancamanyar (Simpang)	-6.984916	107.596275	t
2221	60	Jl. Ranco Indah	-6.306853	106.851830	t
2222	59	Jl. Rasuna Said	-6.232627	106.832130	t
2223	59	Jl. Rasuna Said (Kementerian Hukum dan HAM)	-6.222882	106.832443	t
2224	59	Jl. Rasuna Said (RS. MMC)	-6.220044	106.831894	t
2225	59	Jl. Rasuna Said-Menteng	-6.233928	106.830711	t
2226	59	Jl. Rasunasaid	-6.234269	106.830048	t
2227	57	Jl. Rawabelong	-6.203637	106.782906	t
2228	59	Jl. Rawajati Timur (Stasiun Pasar Minggu Baru)	-6.263283	106.851723	t
2229	59	Jl. Rawajati Timur (belakang Volvo Pasar Minggu) - Jl. Raya Pasar Minggu	-6.272767	106.847397	t
2230	60	Jl. Rawamangun Muka - Kebon Nanas - Cawang	-6.197035	106.874329	t
2231	79	Jl. Raya Baleendah	-7.008961	107.627174	t
2232	178	Jl. Raya Balongsari	-7.258472	112.678520	t
2233	164	Jl. Raya Bambe	-7.359956	112.647240	t
2234	39	Jl. Raya Bandara	-6.144331	106.652763	t
2235	86	Jl. Raya Bandung - Tasik KM 44 (Pulosari)	-7.040006	107.942482	t
2236	98	Jl. Raya Banjar-Majenang (Perbatasan jabar-jateng)	-7.355654	108.580482	t
2237	79	Jl. Raya Banjaran	-6.999782	107.620163	t
2238	165	Jl. Raya Banyuglugur	-7.700317	113.932297	t
2239	101	Jl. Raya Baros (SDN Baros)	-6.889788	107.536629	t
2240	178	Jl. Raya Bebekan	-7.345463	112.698845	t
2241	160	Jl. Raya Beji (Bangil)	-7.596918	112.776443	t
2242	99	Jl. Raya Bekasi	-6.228041	106.982201	t
2243	99	Jl. Raya Bekasi-Cakung	-6.209589	106.979324	t
2244	60	Jl. Raya Bekasi-Ps. Cakung	-6.201771	106.904640	t
2245	99	Jl. Raya Bekasi-Pulogadung	-6.210058	106.979218	t
2246	146	Jl. Raya Benjeng	-7.261051	112.504372	t
2247	164	Jl. Raya Berbek	-7.349060	112.761398	t
2248	178	Jl. Raya Bibis	-7.258073	112.675117	t
2249	146	Jl. Raya Boboh	-7.249792	112.570618	t
2250	103	Jl. Raya Bogor 	-6.355265	106.859680	t
2251	60	Jl. Raya Bogor - Cijantung	-6.296765	106.871483	t
2252	60	Jl. Raya Bogor - Cililitan	-6.277569	106.869293	t
2253	97	Jl. Raya Bojongsoang	-6.970348	107.636856	t
2254	97	Jl. Raya Bojongsoang (Yogya Dept. Store)	-6.968266	107.637299	t
2255	178	Jl. Raya Bringin	-7.260425	112.647156	t
2256	88	Jl. Raya By Pass Jomin (Simpang Jomin)	-6.423876	107.479515	t
2257	61	Jl. Raya Cakung Cilincing	-6.121311	106.926071	t
2258	146	Jl. Raya Cangkir	-7.366036	112.631630	t
2259	34	Jl. Raya Carita - Anyer	-6.296831	105.841721	t
2260	164	Jl. Raya Cemengkalang	-7.442624	112.686852	t
2261	93	Jl. Raya Ciasem - Cirebon	-6.318391	107.689880	t
2262	93	Jl. Raya Ciater (Kawasan Wisata Ciater)	-6.734593	107.650139	t
2263	93	Jl. Raya Ciater (Wisata Sariater)	-6.731589	107.653336	t
2264	100	Jl. Raya Ciawi arah Puncak dan Sukabumi	-6.656791	106.847954	t
2265	101	Jl. Raya Cibeureum	-6.894610	107.559494	t
2266	97	Jl. Raya Cibiru	-6.940315	107.721878	t
2267	97	Jl. Raya Cijerah (Pasar Pola)	-6.926379	107.565834	t
2268	97	Jl. Raya Cijerah (Pertgaan Borma)	-6.920319	107.569839	t
2269	97	Jl. Raya Cikadut	-6.903868	107.665413	t
2270	88	Jl. Raya Cikalong Cilamaya (Alternatif Cicinde)	-6.335119	107.553734	t
2271	82	Jl. Raya Cikaret, Cibinong (Simpang)	-6.477841	106.844833	t
2272	105	Jl. Raya Cikoneng	-7.321341	108.277939	t
2273	82	Jl. Raya Cileungsi 	-6.427682	107.037971	t
2274	79	Jl. Raya Cileunyi	-6.942008	107.754890	t
2275	79	Jl. Raya Cileunyi (Pasar Sehat)	-6.940549	107.753777	t
2276	79	Jl. Raya Cileunyi (Pertigaan Cibesi)	-6.937903	107.756447	t
2277	79	Jl. Raya Cileunyi (Terminal Bayangan)	-6.942509	107.755554	t
2278	94	Jl. Raya Cimelati (Simpang)	-6.780966	106.782982	t
2279	111	Jl. Raya Cimohong Pejagan	-6.871994	108.888145	t
2280	79	Jl. Raya Cinunuk	-6.937908	107.732918	t
2281	79	Jl. Raya Cinunuk (Bandung)	-6.939729	107.743179	t
2282	79	Jl. Raya Cinunuk (Griya Cinunuk)	-6.938291	107.733788	t
2283	79	Jl. Raya Cinunuk (Griya Cinunuk)	-6.938334	107.733932	t
2284	79	Jl. Raya Cinunuk (Ponyo)	-6.936566	107.729744	t
2285	79	Jl. Raya Cinunuk (Sukahati)	-6.938835	107.737129	t
2286	79	Jl. Raya Cinunuk (arah Bunderan Cibiru)	-6.936124	107.728638	t
2287	79	Jl. Raya Cinunuk arah Cileunyi	-6.936875	107.730637	t
2288	79	Jl. Raya Cipacing	-6.947951	107.760201	t
2289	83	Jl. Raya Cipaku	-7.293847	108.371498	t
2290	100	Jl. Raya Cipaku	-6.631295	106.811462	t
2291	79	Jl. Raya Ciparay	-7.035965	107.714584	t
3255	160	Ngopak	-7.702406	112.985527	t
2292	80	Jl. Raya Cipatat, Citatah	-6.823617	107.405952	t
2293	95	Jl. Raya Cirebon - Bandung (Bundaran Sumedang)	-6.835060	107.930466	t
2294	95	Jl. Raya Cirebon - Bandung (Taman Telor)	-6.847329	107.923920	t
2295	164	Jl. Raya Ciro	-7.419006	112.491859	t
2296	104	Jl. Raya Cisaat (Alun-Alun Cisaat)	-6.908504	106.890762	t
2297	40	Jl. Raya Cisauk	-6.312761	106.655640	t
2298	79	Jl. Raya Ciwidey	-7.099934	107.471092	t
2299	79	Jl. Raya Ciwidey - Rancabali (Alun-alun ciwidey)	-7.103363	107.463249	t
2300	79	Jl. Raya Ciwidey arah ke Soreang	-7.099777	107.471115	t
2301	60	Jl. Raya Condet	-6.275159	106.856178	t
2302	84	Jl. Raya Cugenang	-6.763020	107.052338	t
2303	36	Jl. Raya Dadap 	-6.086768	106.708084	t
2304	178	Jl. Raya Darmo	-7.286637	112.739594	t
2305	79	Jl. Raya Dayeuh Kolot (Masjid)	-6.974357	107.618210	t
2306	79	Jl. Raya DayeuhKolot	-6.979602	107.620003	t
2307	178	Jl. Raya Dinoyo	-7.285541	112.745605	t
2308	100	Jl. Raya Dramaga	-6.572275	106.749184	t
2309	82	Jl. Raya Dramaga - Bogor 	-6.574553	106.740913	t
2310	146	Jl. Raya Driyorejo	-7.367404	112.610039	t
2311	146	Jl. Raya Driyorejo (Puskesmas)	-7.365518	112.624695	t
2312	164	Jl. Raya Gedangan	-7.392833	112.727753	t
2313	164	Jl. Raya Geluran	-7.357370	112.690704	t
2314	154	Jl. Raya Gempol - Malang	-7.856580	112.690460	t
2315	96	Jl. Raya Gentong	-7.118097	108.132721	t
2316	178	Jl. Raya Gubeng	-7.269631	112.750900	t
2317	99	Jl. Raya Hankam 	-6.290323	106.916588	t
2318	165	Jl. Raya Hutan Baluran	-7.722368	114.000023	t
2319	81	Jl. Raya Inspeksi Kalimalang	-6.275927	107.058121	t
2320	155	Jl. Raya Japanan	-7.425858	112.392731	t
2321	99	Jl. Raya Jati Asih	-6.290132	106.954178	t
2322	99	Jl. Raya Jatimakmur	-6.278123	106.933449	t
2323	95	Jl. Raya Jatinangor	-6.930900	107.780342	t
2324	95	Jl. Raya Jatinangor	-6.935858	107.764656	t
2325	95	Jl. Raya Jatinangor (Ikopin)	-6.935267	107.766739	t
2326	79	Jl. Raya Jatinangor (Pesantren Al-Aqso)	-6.937333	107.759895	t
2327	99	Jl. Raya Jatiwaringin	-6.276332	106.912895	t
2328	82	Jl. Raya Jonggol 	-6.462011	107.059471	t
2329	164	Jl. Raya Juanda	-7.381619	112.763161	t
2330	90	Jl. Raya KH Abdul Halim (Alun - Alun Majalengka)	-6.834775	108.227699	t
2331	90	Jl. Raya KH Abdul Halim (MA PUI Majalengka)	-6.834581	108.225937	t
2332	90	Jl. Raya KH Abdul Halim (SMAN 1 Majalengka)	-6.833833	108.217789	t
2333	90	Jl. Raya KH. Abdul Halim (Perempatan Tiongbi)	-6.834570	108.226913	t
2334	86	Jl. Raya Kadungora	-7.088947	107.898605	t
2335	60	Jl. Raya Kalimalang - Cawang	-6.247657	106.911179	t
2336	57	Jl. Raya Kamal 	-6.113161	106.723831	t
2337	87	Jl. Raya Kandang Haur (Pasar Eretan)	-6.330302	108.085876	t
2338	178	Jl. Raya Kandangan	-7.252198	112.651489	t
2339	82	Jl. Raya Karadenan (Putara Al Azhar)	-6.505046	106.806976	t
2340	178	Jl. Raya Karah	-7.308868	112.716682	t
2341	164	Jl. Raya Karang Andong	-7.372682	112.573921	t
2342	112	Jl. Raya Karangpucung	-7.390064	108.883560	t
2343	97	Jl. Raya Katapang (Hilon)	-6.921410	107.619553	t
2344	148	Jl. Raya Kayen	-7.586879	112.137047	t
2345	131	Jl. Raya Kedung Kelor	-6.872431	109.359665	t
2346	103	Jl. Raya Kelapa Dua 	-6.366951	106.843048	t
2347	61	Jl. Raya Kelapa Nias	-6.154891	106.911903	t
2348	57	Jl. Raya Kembangan Selatan	-6.188582	106.723923	t
2349	178	Jl. Raya Kertajaya Indah	-7.280656	112.778351	t
2350	111	Jl. Raya Klampok	-6.864778	109.000511	t
2351	164	Jl. Raya Kletek	-7.359062	112.682388	t
2352	164	Jl. Raya Kletek - Surabaya	-7.360254	112.676704	t
2353	97	Jl. Raya Kopo	-6.937365	107.594765	t
2354	97	Jl. Raya Kopo (Kopo Jaya)	-6.931001	107.596985	t
2355	79	Jl. Raya Kopo (Miko Mall)	-6.959666	107.580231	t
2356	79	Jl. Raya Kopo Sayati	-7.020824	107.538689	t
2357	99	Jl. Raya Kranggan Permai - Tol JORR	-6.372197	106.918037	t
2358	176	Jl. Raya Kraton	-7.631203	112.880402	t
2359	79	Jl. Raya Laswi, Majalaya	-7.050532	107.750153	t
2360	164	Jl. Raya Lebo	-7.447470	112.660576	t
2361	162	Jl. Raya Leces	-7.842176	113.228279	t
2362	164	Jl. Raya Legundi	-7.382470	112.575768	t
2363	80	Jl. Raya Lembang	-6.836126	107.599663	t
2364	80	Jl. Raya Lembang	-6.813070	107.619774	t
2365	80	Jl. Raya Lembang (Farmhouse Lembang)	-6.832693	107.604958	t
2366	80	Jl. Raya Lembang (Pasar Lembang)	-6.815989	107.622711	t
2367	59	Jl. Raya Lenteng Agung	-6.342757	106.833282	t
2368	86	Jl. Raya Limbangan 	-7.035444	107.984688	t
2369	103	Jl. Raya Limo 	-6.378296	106.770973	t
2370	178	Jl. Raya Lontar	-7.283870	112.667732	t
2371	96	Jl. Raya Mangunreja (SDN Cintawana)	-7.362360	108.104301	t
2372	178	Jl. Raya Manukan Kulon	-7.256434	112.666512	t
2373	157	Jl. Raya Maospati - Solo	-7.377853	111.281654	t
2374	178	Jl. Raya Margorejo Indah	-7.317051	112.738129	t
2375	36	Jl. Raya Mauk 	-6.123572	106.581352	t
2376	178	Jl. Raya Menganti (Babatan)	-7.309092	112.674828	t
2377	178	Jl. Raya Menganti (Wiyung)	-7.309475	112.676208	t
2378	178	Jl. Raya Menganti - Lidah Wetan	-7.307708	112.668869	t
2379	178	Jl. Raya Menur	-7.285211	112.762726	t
2380	103	Jl. Raya Meruyung 	-6.366887	106.774826	t
2381	175	Jl. Raya Mlirip	-7.447241	112.452538	t
2382	146	Jl. Raya Morowudi	-7.245578	112.561752	t
2383	79	Jl. Raya Nagreg	-7.019503	107.886597	t
2384	97	Jl. Raya Nanjung (Pasar Margaasih)	-6.932327	107.539757	t
2385	99	Jl. Raya Narogong 	-6.322955	106.984390	t
2386	178	Jl. Raya Ngagel	-7.288223	112.745323	t
2387	178	Jl. Raya Ngagel (POM)	-7.296454	112.742126	t
2388	157	Jl. Raya Ngawi - Caruban	-7.451177	111.592834	t
2389	157	Jl. Raya Ngawi - Solo	-7.375693	111.214836	t
2390	157	Jl. Raya Ngawi - Solo	-7.405707	111.425117	t
2391	139	Jl. Raya Ngawi - Solo	-7.563311	110.851227	t
2392	178	Jl. Raya Nginden	-7.299668	112.762146	t
2393	107	Jl. Raya Notog	-7.487976	109.217628	t
2394	80	Jl. Raya Padalarang	-6.838807	107.476166	t
2395	80	Jl. Raya Padalarang (Flyover depan Pertamina)	-6.849439	107.494194	t
2396	80	Jl. Raya Padalarang (Roti Unyil)	-6.835580	107.470474	t
2397	100	Jl. Raya Pajajaran	-6.607001	106.809219	t
2398	100	Jl. Raya Pajajaran (Pintu Keluar Terminal Baranangsiang)	-6.603602	106.806091	t
2399	93	Jl. Raya Pamanukan (Jembatan)	-6.281472	107.826302	t
2400	79	Jl. Raya Pangalengan	-7.085199	107.561417	t
2401	82	Jl. Raya Parung	-6.425678	106.731644	t
2402	82	Jl. Raya Parung (Bogor)	-6.502274	106.757866	t
2403	103	Jl. Raya Parung Bingung Depok	-6.391748	106.769264	t
2404	59	Jl. Raya Pasar Minggu	-6.256719	106.843193	t
2405	59	Jl. Raya Pasar Minggu (Sucofindo)	-6.251880	106.842613	t
2406	59	Jl. Raya Pasar Minggu-Lt. Agung	-6.273100	106.846535	t
2407	60	Jl. Raya Pasming	-6.275521	106.846207	t
2408	39	Jl. Raya Perancis (Hotel FM 7) - Rawabokor	-6.106592	106.683083	t
2409	57	Jl. Raya Pesing 	-6.156193	106.769104	t
2410	54	Jl. Raya Piyungan Polsek Prambanan	-7.759555	110.488228	t
2411	61	Jl. Raya Plumpang 	-6.130047	106.900215	t
2412	82	Jl. Raya Puncak 	-6.652843	106.879547	t
2413	160	Jl. Raya Purwosari	-7.724345	112.721359	t
2414	95	Jl. Raya Rancaekek	-6.963298	107.796501	t
2415	79	Jl. Raya Rancaekek (PT Kahatex)	-6.959400	107.784866	t
2416	79	Jl. Raya Rancaekek - Garut (Polsek Nagreg)	-7.001582	107.858009	t
2417	79	Jl. Raya Rancaekek - Majalaya	-7.012912	107.748909	t
2418	160	Jl. Raya Rejoso	-7.692577	112.968506	t
2419	164	Jl. Raya Rungkut Menanggal	-7.342420	112.767975	t
2420	58	Jl. Raya Salemba	-6.193313	106.852280	t
2421	86	Jl. Raya Samarang - Garut	-7.211267	107.853096	t
2422	112	Jl. Raya Sampang - Buntu	-7.561315	109.207336	t
2423	153	Jl. Raya Sarangan - Magetan	-7.658419	111.277954	t
2424	103	Jl. Raya Sawangan (RS Bhakti Yudha)	-6.397222	106.806236	t
2425	121	Jl. Raya Secang-Semarang	-7.399068	110.243126	t
2426	146	Jl. Raya Sembayat	-7.079918	112.572159	t
2427	36	Jl. Raya Serang	-6.196832	106.458054	t
2428	38	Jl. Raya Serang-Pandeglang 	-6.130506	106.160545	t
2429	40	Jl. Raya Serpong (Alam Sutera)	-6.245349	106.649231	t
2430	40	Jl. Raya Serpong (Muncul)	-6.345427	106.672905	t
2431	119	Jl. Raya Soio	-7.667399	110.662109	t
2432	130	Jl. Raya Solo	-7.556675	110.728691	t
2433	54	Jl. Raya Solo	-7.777839	110.459808	t
2434	116	Jl. Raya Solo - Tawangmangu Karanganyar	-7.615975	111.002922	t
2435	79	Jl. Raya Soreang (Perempatan Pemda)	-7.023888	107.530548	t
2436	79	Jl. Raya Soreang Kopo	-6.998036	107.553986	t
2437	79	Jl. Raya Soreang Kopo (Borma Katapang)	-6.996497	107.554420	t
2438	79	Jl. Raya Soreang Kopo (PT. Runnerindo)	-7.002689	107.552635	t
2439	117	Jl. Raya Sruweng	-7.650928	109.587563	t
2440	82	Jl. Raya Sukabumi 	-6.684257	106.848862	t
2441	82	Jl. Raya Sukabumi (Jalur dari Ciawi - Caringin - Lido)	-6.690499	106.845428	t
2442	94	Jl. Raya Sukabumi (Pasar Parungkuda)	-6.849326	106.763557	t
2443	82	Jl. Raya Sukabumi, Cicurug	-6.769391	106.791786	t
2444	94	Jl. Raya Sukaraja - Sukabumi (Seputar PT. Daihan Global)	-6.895513	106.811371	t
2445	164	Jl. Raya Suko	-7.445848	112.681358	t
2446	87	Jl. Raya Sukra (Pasar Sukra)	-6.305434	107.934784	t
2447	107	Jl. Raya Sumpiuh (Pasar Sumpiuh)	-7.613338	109.360924	t
2448	128	Jl. Raya Suruh - Karanggede	-7.368170	110.568748	t
2449	100	Jl. Raya Tajur 	-6.626563	106.822044	t
2450	178	Jl. Raya Taman	-7.354401	112.696251	t
2451	164	Jl. Raya Taman Asri (Pondok Chandra)	-7.343303	112.771309	t
2452	82	Jl. Raya Tegar Beriman	-6.484952	106.836250	t
2453	79	Jl. Raya Terusan Bojongsoang	-6.988451	107.632370	t
2454	111	Jl. Raya Tonjong	-7.178755	109.008453	t
2455	164	Jl. Raya Trosobo	-7.385620	112.611069	t
2456	164	Jl. Raya Trosobo	-7.367638	112.658806	t
2457	164	Jl. Raya Trosono	-7.367319	112.660591	t
2458	155	Jl. Raya Trowulan - Jombang	-7.550910	112.381256	t
2459	61	Jl. Raya Tugu	-6.121908	106.925041	t
2460	119	Jl. Raya Wedi (Klaten)	-7.745643	110.580154	t
2461	178	Jl. Raya Wonorejo	-7.311539	112.793587	t
2462	97	Jl. Riau (Taruna Bakti)	-6.906132	107.618469	t
2463	97	Jl. Riau - Jl. Aceh	-6.909897	107.625778	t
2464	58	Jl. Ridwan Rais	-6.180329	106.832336	t
2465	103	Jl. Ridwan Rais (Beji)	-6.379024	106.824944	t
2466	58	Jl. Ridwan Rais - Menteng	-6.181427	106.832726	t
2467	58	Jl. Ridwan Rais-Tugu Tani	-6.181857	106.832726	t
2468	97	Jl. Rumah Sakit (Pertigaan Jl. Rumah Sakit - Jl. AH Nasution)	-6.914109	107.699364	t
2469	84	Jl. Rumah Sakit - Jl. Pasir Gede (Pertigaan RSUD Cianjur)	-6.810865	107.141251	t
2470	97	Jl. Rumah Sakit, Ujung Berung	-6.928557	107.694344	t
2471	99	Jl. Ry Harkit	-6.204352	106.992897	t
2472	57	Jl. S. Parman	-6.186422	106.797066	t
2473	57	Jl. S. Parman depan Central Park arah ke Perempatan Grogol 	-6.175532	106.792107	t
2474	79	Jl. Sadang - Jl. Cibolerang Barat (Taman Kopo Indah)	-6.952861	107.563751	t
2475	97	Jl. Sadang Serang (Telkom)	-6.889532	107.626442	t
2476	57	Jl. Sakti - Slipi	-6.186209	106.786613	t
2477	58	Jl. Salemba (UI)	-6.192982	106.848618	t
2478	58	Jl. Salemba Raya-Kramat	-6.195851	106.850365	t
2479	58	Jl. Samanhudi	-6.161462	106.831848	t
2480	51	Jl. Sandakan-Sultan Agung	-7.905275	110.320671	t
2481	101	Jl. Sangkuriang (Pertigaan Sangkuriang)	-6.869776	107.534714	t
2482	93	Jl. Sariater Hotel (Ciater Spa)	-6.734577	107.659431	t
2483	153	Jl. Sawo	-7.652693	111.313629	t
2484	178	Jl. Semarang	-7.254615	112.728050	t
2485	139	Jl. Semarang - Surakarta	-7.559541	110.769211	t
2486	139	Jl. Semarang - Surakarta	-7.558015	110.794456	t
2487	110	Jl. Semarang - Surakarta	-7.538402	110.619598	t
2488	110	Jl. Semarang - Surakarta	-7.540083	110.708092	t
2489	138	Jl. Semarang dari Kendal	-6.976269	110.322647	t
2490	160	Jl. Sengon	-7.751699	112.731613	t
2491	59	Jl. Senopati - SCBD Sudirman	-6.231336	106.809456	t
2492	82	Jl. Sentul 	-6.515119	106.851952	t
2493	97	Jl. Setiabudhi	-6.860282	107.594757	t
2494	97	Jl. Setiabudhi (Pitnu Masuk Bawah UPI)	-6.863446	107.594742	t
2495	97	Jl. Setiabudhi (Rumah Mode)	-6.882332	107.600204	t
2496	97	Jl. Setiabudhi - Geger Kalong	-6.870450	107.593552	t
2497	97	Jl. Setiabudhi - Ledeng	-6.859196	107.594925	t
2498	80	Jl. Setiabudi - Jl. Lembang	-6.838403	107.599045	t
2499	58	Jl. Setiabudi Barat	-6.208346	106.824257	t
2500	59	Jl. Setiabudi Tengah 	-6.209568	106.829124	t
2501	54	Jl. Seturan (STIE)	-7.768703	110.410065	t
2502	100	Jl. Sholeh Iskandar 	-6.551510	106.775436	t
2503	94	Jl. Siliwangi	-6.988675	106.550232	t
2504	39	Jl. Siliwangi	-6.198752	106.574959	t
2505	89	Jl. Siliwangi	-6.972680	108.485832	t
2506	97	Jl. Siliwangi (Teras Cikapundung)	-6.884675	107.607567	t
2507	79	Jl. Siliwangi - Jl. Baleendah (Persimpangan)	-6.993776	107.626083	t
2508	99	Jl. Siliwangi Raya 	-6.297170	106.934135	t
2509	84	Jl. Siliwangi, Gang guntur (SMPN 1 Cianjur)	-6.824813	107.136559	t
2510	101	Jl. Simpang Cimahi	-6.879658	107.542999	t
2511	59	Jl. Simprug	-6.230046	106.786232	t
2512	59	Jl. Sisingamangaraja	-6.231016	106.798508	t
2513	59	Jl. Sisingamangaraja (Al-Azhar) - Sudirman	-6.235574	106.798332	t
2514	101	Jl. Sisingamangaraja - Jl. Pojok	-6.875877	107.536217	t
2515	178	Jl. Siwalankerto	-7.339440	112.734146	t
2516	130	Jl. Slamet Riyadi	-7.561971	110.757538	t
2517	139	Jl. Slamet Riyadi (Solo)	-7.563228	110.799110	t
2518	97	Jl. Soekarno - Hatta (Pabrik Bajoe)	-6.946513	107.637993	t
2519	39	Jl. Soekarno Hatta	-6.109533	106.649513	t
2520	97	Jl. Soekarno Hatta	-6.941321	107.655075	t
2521	97	Jl. Soekarno Hatta (Bundaran Cibiru)	-6.934926	107.717697	t
2522	97	Jl. Soekarno Hatta (DPW PKS Bandung)	-6.943585	107.647667	t
2523	97	Jl. Soekarno Hatta (MIM) arah Gedebage	-6.940123	107.658058	t
2524	97	Jl. Soekarno Hatta (MIM) arah Samsat	-6.940155	107.658813	t
2525	97	Jl. Soekarno Hatta (Margahayu - Samsat)	-6.941146	107.655434	t
2526	97	Jl. Soekarno Hatta (Metro)	-6.938984	107.667236	t
2527	97	Jl. Soekarno Hatta (Pasar Induk Gede Bage)	-6.936539	107.697922	t
2528	97	Jl. Soekarno Hatta (Perempatan Babakan Ciparay)	-6.943222	107.584671	t
2529	97	Jl. Soekarno Hatta (Perempatan Kiara Condong)	-6.945507	107.641876	t
2530	97	Jl. Soekarno Hatta (Pertigaan Rancabolang)	-6.939202	107.663902	t
2531	97	Jl. Soekarno Hatta (Poll Budiman)	-6.935368	107.713905	t
2532	97	Jl. Soekarno Hatta (Putaran Arya Graha)	-6.938590	107.672729	t
2533	97	Jl. Soekarno Hatta (Putaran Bulog)	-6.939250	107.662628	t
2534	97	Jl. Soekarno Hatta (Putaran MIM)	-6.940656	107.657089	t
2535	97	Jl. Soekarno Hatta (Putaran Sampoerna)	-6.937381	107.688095	t
2536	97	Jl. Soekarno Hatta (daerah Gedebage)	-6.936875	107.694801	t
2537	97	Jl. Soekarno Hatta - Jl Cibaduyut	-6.947216	107.595589	t
2538	97	Jl. Soekarno Hatta - Jl. Cijagra	-6.949474	107.625908	t
2539	97	Jl. Soekarno Hatta - Jl. Gede Bage	-6.937099	107.692604	t
2540	97	Jl. Soekarno Hatta - Jl. Moch Toha	-6.948388	107.609390	t
2541	97	Jl. Soekarno Hatta - Jl. Raya Kopo (By Pass)	-6.945640	107.589714	t
2542	97	Jl. Soekarno Hatta - Pasar Induk Caringin	-6.945448	107.589745	t
2543	97	Jl. Soekarno Hatta - Riung Bandung	-6.937663	107.684563	t
2544	97	Jl. Soekarno Hatta - Waas Batununggal	-6.949240	107.621490	t
2545	39	Jl. Soeta-Rawabokor	-6.117982	106.683533	t
2546	54	Jl. Solo (RS Panti Rini)	-7.772184	110.467140	t
2547	116	Jl. Solo - Karanganyar	-7.571096	110.877983	t
2548	116	Jl. Solo - Karanganyar (Hotel Tamansari)	-7.592143	110.936081	t
2549	133	Jl. Solo - Wonogiri	-7.762064	110.884109	t
2550	79	Jl. Solokan Jeruk	-7.012113	107.740906	t
2551	80	Jl. Soreang - Jl. Cipatik	-6.941380	107.514633	t
2552	57	Jl. Srengseng Raya	-6.212022	106.759384	t
2553	101	Jl. Sriwijaya	-6.882001	107.537453	t
2554	136	Jl. Sriwijaya (Pekalongan)	-6.895854	109.660385	t
2555	101	Jl. Sriwijaya (Simpang Pura)	-6.884009	107.535141	t
2556	97	Jl. Sriwijaya BKR	-6.937929	107.612885	t
2557	119	Jl. St. Delanggu - Kaswari	-7.624631	110.709236	t
2558	178	Jl. St. Kota	-7.242659	112.740410	t
2559	58	Jl. St. Senen Flyover Pasar Senen - Kramat Raya	-6.180116	106.842491	t
2560	101	Jl. Stasiun Cimahi	-6.885740	107.536636	t
2561	57	Jl. Stasiun Kota	-6.137419	106.814079	t
2562	97	Jl. Sudirman	-6.917081	107.574509	t
2563	58	Jl. Sudirman 	-6.215466	106.817162	t
2564	83	Jl. Sudirman (Alun-Alun Ciamis)	-7.326176	108.352745	t
2565	59	Jl. Sudirman (Bundaran Senayan) - Semanggi	-6.228872	106.799561	t
2566	59	Jl. Sudirman (Graha Niaga) - Bundaran Senayan	-6.224631	106.805557	t
2567	104	Jl. Sudirman (Simpang Tiara Toserba)	-6.921528	106.922989	t
2568	97	Jl. Sudirman (batas kota)	-6.910579	107.569244	t
2569	97	Jl. Sudirman - Jl. Gardujati	-6.919781	107.595161	t
2570	97	Jl. Sudirman - Jl. Jamika	-6.918822	107.586578	t
2571	97	Jl. Sudirman - Jl. Suryani	-6.918210	107.581154	t
2572	58	Jl. Sudirman - Senopati	-6.223256	106.807358	t
2573	58	Jl. Sudirman sekitar Dukuh Atas	-6.201966	106.822929	t
2574	97	Jl. Sukagalih	-6.892488	107.592667	t
2575	97	Jl. Sukajadi	-6.896474	107.597305	t
2576	97	Jl. Sukajadi - Jl. Prof. Eyckman	-6.896716	107.597382	t
2577	97	Jl. Sukajadi - Sukagalih	-6.893018	107.597023	t
2578	79	Jl. Sukamenak 	-6.973085	107.592972	t
2579	79	Jl. Sukamenak - Jl. Kopo	-6.971508	107.573616	t
2580	97	Jl. Sukaraja	-6.891385	107.575584	t
2581	97	Jl. Sukaraja - Gunung Batu	-6.889702	107.569786	t
2582	178	Jl. Sulawesi	-7.276846	112.747726	t
2583	99	Jl. Sultan Agung (Stasiun Kranji)	-6.225054	106.978790	t
2584	85	Jl. Sultan Hasanudin (SDN Tukmudal)	-6.755508	108.475624	t
2585	81	Jl. Sultan Hasanudin Tambun	-6.259252	107.052055	t
2586	59	Jl. Sultan Iskandar	-6.244700	106.782326	t
2587	59	Jl. Sultan Iskandar Muda	-6.262633	106.783180	t
2588	81	Jl. Sumarecon bekasi 	-6.192369	107.045044	t
2589	178	Jl. Sumatera	-7.267191	112.751152	t
2590	178	Jl. Sumatera - Gubeng	-7.268683	112.750618	t
2591	97	Jl. Sumbersari - Jl. Soekarno Hatta	-6.935384	107.680641	t
2592	85	Jl. Sunan Malik Ibrahim (SMA Sumber)	-6.761272	108.478996	t
2593	97	Jl. Sunda	-6.919973	107.617935	t
2594	97	Jl. Sunda (Yogya Dept Store)	-6.921719	107.617683	t
2595	97	Jl. Suniaraja	-6.915776	107.605125	t
2596	97	Jl. Suniaraja - Jl Otista	-6.915957	107.604477	t
2597	61	Jl. Sunter Permai Raya	-6.138237	106.866386	t
2598	59	Jl. Supomo	-6.231688	106.845665	t
2599	97	Jl. Supratman	-6.908475	107.631081	t
2600	97	Jl. Supratman - Jl. BrigJen Katamso	-6.906819	107.630035	t
2601	97	Jl. Surapati	-6.899267	107.622887	t
2602	97	Jl. Surapati (Pasar Cihaurgeulis)	-6.899523	107.627373	t
2603	97	Jl. Surapati (Pom Bensin)	-6.899432	107.626953	t
2604	97	Jl. Surapati - Jl. A Yani	-6.899629	107.627159	t
2605	97	Jl. Surya Sumantri	-6.888169	107.581406	t
2606	97	Jl. Surya Sumantri (Simpang Lemah Nendeut)	-6.882502	107.581367	t
2607	100	Jl. Suryakencana (Bogor)	-6.606796	106.801369	t
2608	58	Jl. Suryapranoto - Jl. Gajah Mada	-6.167622	106.820694	t
2609	58	Jl. Suryopranoto - Harmoni 	-6.168118	106.820435	t
2610	58	Jl. Suryopranoto arah ke Tomang	-6.169894	106.818237	t
2611	58	Jl. Suryopronoto - Tomang	-6.167934	106.820641	t
2612	111	Jl. Sutamaja	-6.897060	108.886818	t
2613	139	Jl. Sutan Syahrir - Jl. Ir,Juanda	-7.566449	110.833305	t
2614	59	Jl. TB Simatupang	-6.292386	106.811577	t
2615	60	Jl. TB Simatupang - Ps. Rebo	-6.302587	106.856651	t
2616	59	Jl. TB. Simatupang	-6.300326	106.834702	t
2617	59	Jl. TB. Simatupang	-6.282730	106.773636	t
2618	99	Jl. TMII 	-6.296743	106.891052	t
2619	59	Jl. Taman Kemang	-6.256643	106.810120	t
2620	60	Jl. Taman Mini I - Cipayung	-6.299261	106.883453	t
2621	97	Jl. Taman Pramuka (SMA Kartika)	-6.909519	107.626923	t
2622	82	Jl. Taman Safari (Pintu Masuk)	-6.717023	106.948891	t
2623	97	Jl. Taman Sari (Balubur Town Square)	-6.898799	107.609344	t
2624	58	Jl. Taman Suropati	-6.199350	106.832077	t
2625	97	Jl. Taman sari	-6.894304	107.608513	t
2626	97	Jl. Tamansari - Jl. Sawunggaling	-6.900418	107.609398	t
2627	178	Jl. Tambak Mayor	-7.250966	112.709045	t
2628	178	Jl. Tambak Osowilangun	-7.229400	112.672241	t
2629	178	Jl. Tambak Rejo	-7.243864	112.758888	t
2630	56	Jl. Tambak- Manggarai	-6.205259	106.849037	t
2631	178	Jl. Tambaksari	-7.252070	112.755219	t
2632	97	Jl. Tamblong - Jl. Asia Afrika	-6.921666	107.612038	t
2633	57	Jl. Tambora	-6.145312	106.807411	t
2634	58	Jl. Tanah Abang	-6.175500	106.816078	t
2635	103	Jl. Tanah Baru arah Swadaya 8	-6.391581	106.804443	t
2636	178	Jl. Tanah Merah	-7.229304	112.767525	t
2637	178	Jl. Tanjugsari	-7.253422	112.704903	t
2638	59	Jl. Tanjung Barat - Lt. Agung	-6.304955	106.839592	t
2639	57	Jl. Tanjung Duren - Grogol	-6.173707	106.787399	t
2640	95	Jl. Tanjung Sari (Pasar)	-6.907149	107.796532	t
2641	95	Jl. Tanjung Sari (Pertigaan PLN Lama)	-6.904974	107.800491	t
2642	178	Jl. Tanjungsari	-7.260010	112.693550	t
2643	103	Jl. Tapos Raya	-6.423503	106.889229	t
2644	79	Jl. Tarajusari - Kamasan	-7.046645	107.578842	t
2645	153	Jl. Tawangmangu - Plaosan	-7.664976	111.205109	t
2646	119	Jl. Teban - Jetis	-7.653281	110.727432	t
2647	59	Jl. Tebet Barat VIII	-6.236530	106.849442	t
2648	112	Jl. Tegal - Cilacap	-7.701247	109.025406	t
2649	178	Jl. Tegal Utama Citraland	-7.292692	112.648521	t
2650	97	Jl. Telkom - Jl Terusan Bojongsoang	-6.972840	107.636169	t
2651	58	Jl. Teluk Betung 	-6.195904	106.821152	t
2652	58	Jl. Teluk Betung arah Hotel Indonesia	-6.196874	106.822037	t
2653	178	Jl. Tembaan	-7.246940	112.735626	t
2654	178	Jl. Tembok Dukuh	-7.255550	112.724319	t
2655	116	Jl. Tembus Lawu - Solo - Surabaya	-7.668122	111.177307	t
2656	59	Jl. Tendean	-6.240178	106.825066	t
2657	178	Jl. Tengger Raya	-7.260425	112.653328	t
2658	59	Jl. Tentara Pelajar	-6.224158	106.789619	t
2659	58	Jl. Tentara Pelajar 	-6.210442	106.796082	t
2660	105	Jl. Tentara Pelajar (SMAN 5 Tasimalaya)	-7.331939	108.222069	t
2661	102	Jl. Tentara Pelajar (Simpang Grage)	-6.713534	108.550858	t
2662	135	Jl. Tentara Pelajar - Alun-Alun Magelang	-7.478145	110.217293	t
2663	58	Jl. Tentara Pelajar - St. Palmerah	-6.209781	106.796333	t
2664	121	Jl. Tentara Pelajar Muntilan	-7.578834	110.285973	t
2665	58	Jl. Tentara Pelajar arah Slipi	-6.204014	106.800316	t
2666	79	Jl. Terusan Bojongsoang (RM Ampera)	-6.987594	107.632492	t
2667	97	Jl. Terusan Buah Batu	-6.949112	107.634399	t
2668	97	Jl. Terusan Buah Batu (Pasar Kordon)	-6.954490	107.639137	t
2669	97	Jl. Terusan Buah Batu (Putaran Cipagalo)	-6.963230	107.638344	t
2670	97	Jl. Terusan Buah Batu (Tugu Kordon)	-6.954091	107.640205	t
2671	97	Jl. Terusan Buah Batu - Jl. Bojongsoang	-6.965960	107.637856	t
2672	97	Jl. Terusan Buah batu (Putaran Bluebird)	-6.957706	107.639511	t
2673	97	Jl. Terusan Holis	-6.944980	107.568085	t
2674	97	Jl. Terusan Jakarta	-6.913593	107.644897	t
2675	97	Jl. Terusan Jakarta (Putaran Sulaksana)	-6.912922	107.649742	t
2676	97	Jl. Terusan Jakarta - Antapani	-6.912794	107.651443	t
2677	97	Jl. Terusan Jakarta - Jl. Purwakarta	-6.912805	107.651268	t
2678	97	Jl. Terusan Jakarta arah Jl. Jakarta	-6.913497	107.646027	t
2679	79	Jl. Terusan Kopo (Batas Kota)	-6.961019	107.579262	t
2680	97	Jl. Terusan Kopo (GT Kopo)	-6.956950	107.581963	t
2681	79	Jl. Terusan Kopo (Pasar Sayati)	-6.969602	107.574463	t
2682	97	Jl. Terusan Kopo - Jl. Cibolerang	-6.953564	107.584389	t
2683	79	Jl. Terusan Kopo, Katapang	-6.989197	107.557358	t
2684	97	Jl. Terusan Pasir Koja (Arah Jamika)	-6.927013	107.584755	t
2685	97	Jl. Terusan Pasir Koja (Simpang Lima)	-6.926832	107.585571	t
2686	97	Jl. Terusan Pasirkoja - Jl. Astana Anyar	-6.926874	107.599892	t
2687	79	Jl. Terusan Soreang Cipatik (Stadion Si Jalak)	-6.995512	107.531647	t
2688	39	Jl. Teuku Umar	-6.195958	106.627205	t
2689	58	Jl. Teuku Umar	-6.191510	106.833138	t
2690	111	Jl. Teuku Umar	-6.947496	108.969826	t
2691	178	Jl. Tidar	-7.256348	112.719810	t
2692	160	Jl. Tol Gempol Pandaan - Arteri Porong	-7.643870	112.706047	t
2693	61	Jl. Tol Ir. Wiyoto Wiyono Artha Gading	-6.151582	106.888092	t
2694	57	Jl. Tol Jakarta Tangerang - Kebon Jeruk	-6.189971	106.766777	t
2695	61	Jl. Tol Pelabuhan	-6.124975	106.853539	t
2696	57	Jl. Tomang Raya	-6.175414	106.802505	t
2697	58	Jl. Tomang Raya - Jl. Kyai Caringin	-6.171353	106.808548	t
2698	82	Jl. Transyogi	-6.553428	107.142021	t
2699	164	Jl. Tropoda	-7.362810	112.757645	t
2700	147	Jl. Trunojoyo	-8.364584	113.756691	t
2701	59	Jl. Trunojoyo - Blok M 	-6.239815	106.801445	t
2702	57	Jl. Tubagus Angke	-6.142006	106.804665	t
2703	97	Jl. Tubagus Ismail	-6.885080	107.620544	t
2704	102	Jl. Tuparev (SMKN Kedawung)	-6.711371	108.544319	t
2705	85	Jl. Tuparev - Cirebon	-6.711030	108.541443	t
2706	97	Jl. Turangga	-6.932008	107.634880	t
2707	60	Jl. Unjung Menteng 	-6.187371	106.965034	t
2708	176	Jl. Urip Sumoharjo	-7.662348	112.892952	t
2709	55	Jl. Urip Sumoharjo - Laksda Adi Sutjipto	-7.783178	110.387360	t
2710	57	Jl. Utan Jati - Kalideres	-6.144587	106.702766	t
2711	60	Jl. Utan Kayu 	-6.194934	106.869102	t
2712	60	Jl. Utan Kayu Raya 	-6.196491	106.872063	t
2713	58	Jl. Utan Panjang Timur (Kemayoran) arah Galur	-6.168689	106.852463	t
2714	146	Jl. Veteran	-7.180543	112.649818	t
2715	178	Jl. Veteran	-7.241459	112.737785	t
2716	92	Jl. Veteran (Pertigaan Cikopak)	-6.511228	107.458313	t
2717	92	Jl. Veteran (Pertigaan Perum Permata)	-6.523354	107.448463	t
2718	102	Jl. Veteran (SDN Kebon Baru)	-6.709351	108.562675	t
2719	94	Jl. Veteran (Simpang Kimia Farma)	-6.919628	106.927483	t
2720	92	Jl. Veteran - Jl. Flamboyan	-6.531833	107.445900	t
2721	130	Jl. Veteran Barat	-7.681926	110.814842	t
2722	58	Jl. Veteran-Harmoni 	-6.167478	106.824165	t
2723	97	Jl. Viaduct	-6.915137	107.607681	t
2724	97	Jl. Waas (perempatan Batununggal)	-6.953926	107.627502	t
2725	59	Jl. Warung Buncit	-6.268056	106.830994	t
2726	59	Jl. Warung Jati-Pejaten	-6.260847	106.828934	t
2727	79	Jl. Warung Lobak, Soreang	-7.016453	107.548035	t
2728	99	Jl. Wibawa Mukti (Jatiasih)	-6.348516	106.941986	t
2729	99	Jl. Wibawa Mukti (Jatiasih) - Cibubur	-6.348102	106.942131	t
2730	59	Jl. Wijaya (arah Tendean)	-6.239794	106.816353	t
2731	59	Jl. Wijaya 1	-6.246065	106.807320	t
2732	59	Jl. Wijaya I arah Prapanca	-6.247427	106.806160	t
2733	59	Jl. Wijaya menuju Kapten Tendean	-6.238953	106.815079	t
2734	133	Jl. Wonogiri-Purwantoro	-7.829483	111.150894	t
2735	100	Jl. Yasmin Raya	-6.559546	106.772476	t
2736	61	Jl. Yos Sudarso	-6.116638	106.893250	t
2737	61	Jl. Yos Sudarso (Koja)	-6.118568	106.893486	t
2738	117	Jl. Yos Sudarso (SPBU)	-7.610767	109.542572	t
2739	97	Jl. margahayu - Katapang	-6.950875	107.653275	t
2740	57	Jl.Jembatan Dua	-6.139723	106.793205	t
2741	54	Jl.Kaliurang-Kentungan	-7.750827	110.385681	t
2742	54	Jl.Kaliurang-Kentungan-Palagan	-7.747803	110.387482	t
2743	55	Jl.Kusuma Negara-Gedong Kuning	-7.802585	110.402245	t
2744	58	Jl.Perwira	-6.171489	106.832924	t
2745	59	Jl.Pesanggrahan	-6.238301	106.755630	t
2746	178	Jl.Raya Benowo	-7.243531	112.632469	t
2747	129	Jl.Raya Solo-Sragen	-7.470408	110.929543	t
2748	59	Jl.TB.Simatupang	-6.302427	106.838737	t
2749	97	Jl/ Sumatera - Jl. Veteran	-6.917960	107.612801	t
2750	51	Jogja TV	-7.825614	110.431541	t
2751	54	Jogja Waterpark Bay	-7.748286	110.418198	t
2752	57	Joglo - TL Pos Pengumben	-6.217366	106.760246	t
2753	119	Jogonalan	-7.730979	110.545853	t
2756	148	Jombang - Surabaya	-7.615699	112.370781	t
2757	148	Jombang Kota - Kertosono	-7.558951	112.231758	t
2758	148	Jombang-Madiun	-7.574968	112.293427	t
2759	55	Jombor	-7.748116	110.362534	t
2760	99	Jt. Warna - Pd. Labu	-6.311630	106.919098	t
2761	164	Juanda	-7.381172	112.755829	t
2762	59	KM 22 Fatmawati arah TMII	-6.292146	106.791153	t
2763	82	KM 23 Tol Jagorawi arah Bogor	-6.449610	106.890831	t
2764	60	KM 4 Tol Jagorawi arah Cawang	-6.288820	106.878372	t
2765	164	KM 41 Balong Bendo	-7.414325	112.543884	t
2766	60	KM 8 Tol Jagorawi arah Cawang	-6.309945	106.884995	t
2767	154	KWB - Lawang	-7.836280	112.697456	t
2768	143	Kademangan	-8.196390	112.104233	t
2769	90	Kadipaten	-6.765465	108.168228	t
2770	86	Kadungora	-7.071198	107.898872	t
2771	54	Kalasan	-7.758747	110.470879	t
2772	178	Kalianyar	-7.248898	112.748672	t
2773	59	Kalibata - Cawang	-6.256282	106.851357	t
2774	59	Kalibata - Pancoran	-6.260143	106.842575	t
2775	59	Kalibata Raya	-6.258159	106.843437	t
2776	178	Kalibutuh-arjuno-semarang	-7.255985	112.727470	t
2777	178	Kalidami 	-7.275920	112.763710	t
2778	57	Kalideres - Rawabokor	-6.156782	106.703819	t
2779	57	Kalideres arah Batu Ceper (Tangerang)	-6.155937	106.706451	t
2780	57	Kalideres arah Cengkareng	-6.155721	106.706490	t
2781	57	Kalideres arah Pesing	-6.155729	106.706459	t
2782	57	Kalideres arah ke Cipondoh	-6.155950	106.706413	t
2783	57	Kalideres-Grogol 	-6.154977	106.706688	t
2784	152	Kaligunting	-7.552463	111.694908	t
2785	152	Kaligunting	-7.551463	111.692894	t
2786	152	Kaligunting	-7.552038	111.693535	t
2787	152	Kaligunting	-7.551314	111.692657	t
2788	178	Kalijudan	-7.262958	112.775711	t
2789	178	Kalikepiting - Kalijudan	-7.263413	112.771416	t
2790	60	Kalimalang - Cawang	-6.239474	106.893219	t
2791	141	Kamal - Driyorejo	-7.159168	112.718506	t
2792	57	Kamal - Grogol 	-6.114962	106.732414	t
2793	57	Kamal - Pluit	-6.122591	106.746750	t
2794	60	Kampung Melayu - Kota Kasablanka	-6.224679	106.866638	t
2795	60	Kampung Rambutan menuju Pasar Rebo	-6.307797	106.875702	t
2796	143	Kanigoro	-8.122983	112.200172	t
2797	143	Kanigoro	-8.122834	112.198967	t
2798	54	Kantor Kecamatan Ngaglik	-7.724422	110.401138	t
2799	116	Kantor PGRI Tawangmangu	-7.667112	111.114090	t
2800	178	Kapas krampung	-7.249537	112.761421	t
2801	178	Kapasan	-7.239596	112.748756	t
2802	178	Kapasari	-7.241091	112.752823	t
2803	178	Kapasari - Gembong - Kalianyar	-7.248685	112.747597	t
2804	178	Kapasari - Ngaglik	-7.248845	112.750443	t
2805	61	Kapuk - Ancol	-6.122313	106.766296	t
2806	61	Kapuk - Pluit	-6.121972	106.770264	t
2807	61	Kapuk Raya - Pluit	-6.139009	106.763405	t
2808	61	Kapuk Raya-PIK	-6.138997	106.763245	t
2809	61	Kapuk-Cengkareng 	-6.121417	106.771294	t
2810	57	Kapuk-Pluit	-6.135690	106.753998	t
2811	117	Karang Anyar	-7.632938	109.571716	t
2812	178	Karang Menjangan	-7.270993	112.760773	t
2813	178	Karang Pilang	-7.342888	112.694168	t
2814	178	Karang Rejo - Ketintang	-7.307748	112.726974	t
2815	117	Karanganyar	-7.627534	109.566589	t
2816	117	Karanganyar (RM Lestari)	-7.633468	109.572121	t
2817	128	Karangjati Klepu Ungaran	-7.183759	110.450562	t
2818	154	Karangkates - Kepanjen	-8.156800	112.451874	t
2819	178	Karangmenjangan - Airlangga	-7.270668	112.760368	t
2820	178	Karangpilang	-7.342867	112.694870	t
2821	112	Karangpucung	-7.396125	108.890579	t
2822	169	Karangrejo	-7.998016	111.895065	t
2823	39	Karawaci	-6.179702	106.621658	t
2824	88	Karawang Barat arah Karawang Timur KM 57	-6.282304	107.301727	t
2825	88	Karawang Timur 	-6.288137	107.331589	t
2826	81	Karawang Timur KM 51-KM 58	-6.327444	107.162186	t
2827	58	Karet - Bundaran HI	-6.201408	106.816193	t
2828	59	Karet - Jl. Prof. Dr. Satrio (Mall Ambassador)	-6.223817	106.825508	t
2829	58	Karet - Pejompongan	-6.201289	106.815239	t
2830	58	Karet Bivak-Tanah Abang	-6.201163	106.812233	t
2831	58	Karet arah Tanah Abang	-6.198410	106.814407	t
2832	58	Karet arah ke Bundaran Hotel Indonesia	-6.213725	106.818970	t
2833	58	Karet-Thamrin 	-6.204560	106.815857	t
2834	130	Kartasura	-7.550495	110.736694	t
2835	178	Kartini - Teuku Umar	-7.279273	112.737747	t
2836	154	Kasembon	-7.800141	112.350143	t
2837	51	Kasongan Bantul YK	-7.846802	110.344231	t
2838	39	Kawasan Bandara Soekarno-Hatta	-6.123707	106.661423	t
2839	121	Kawasan Candi Mendut	-7.604942	110.229713	t
2840	54	Kawasan Candi Prambanan	-7.754367	110.491768	t
2841	146	Kawasan Industri Gresik	-7.159102	112.636299	t
2842	81	Kawasan Industri MM2100 Cibitung 	-6.290953	107.080597	t
2843	55	Kawasan Malioboro	-7.799652	110.365005	t
2844	55	Kawasan Malioboro	-7.790500	110.366089	t
2845	139	Kawasan Pasar Gede (Solo)	-7.569309	110.831253	t
2846	135	Kawasan Pecinan Magelang	-7.476666	110.218864	t
2847	59	Kawasan SCBD arah Jl. Gatot Subroto Semanggi	-6.224446	106.813316	t
2848	59	Kawasan SCBD arah Polda Metro Jaya	-6.225775	106.809746	t
2849	55	Kawasan Terminal Jombor	-7.747404	110.360443	t
2850	58	Kawasan Tugu Tani	-6.182700	106.834831	t
2851	55	Kawasan UGM	-7.770643	110.376595	t
2852	54	Kawasan UGM	-7.766061	110.378479	t
2853	61	Kawasan Wisata Ancol	-6.128124	106.840599	t
2854	82	Kawasan Wisata Taman Matahari	-6.659358	106.914757	t
2855	82	Kawasan Wisata Taman Safari Puncak	-6.703877	106.945747	t
2856	153	Kawedanan	-7.713118	111.421257	t
2857	154	Kawedanan	-8.178082	112.687027	t
2858	153	Kawedanan	-7.713203	111.420769	t
2859	153	Kawedanan	-7.696107	111.410461	t
2860	174	Kawi - Alun Alun  	-7.979885	112.626144	t
2861	178	Kayoon - Sono kembang	-7.272696	112.744400	t
2862	178	Kb. Jepun - Kapasan	-7.238425	112.744362	t
2863	57	Kb. Jeruk-Kunciran	-6.190070	106.766319	t
2864	57	Kb. Jeruk-Meruya	-6.190113	106.762947	t
2865	60	Kb. Nanas	-6.233501	106.869766	t
2866	58	Kb. Sirih-Mh Thamrin	-6.183137	106.825821	t
2867	57	Kb.Jeruk- Karang Tengah	-6.190155	106.764450	t
2868	59	Kebayoran Baru - Ciledug	-6.243335	106.802025	t
2869	146	Kebomas arah Surabaya	-7.162106	112.601562	t
2870	102	Kebon Baru	-6.703853	108.562225	t
2871	57	Kebon Jeruk - Jl. Arjuna Selatan - Kemanggisan	-6.190040	106.769508	t
2872	58	Kebon Kacang arah Thamrin City	-6.194381	106.819801	t
2873	60	Kebon Nanas - Rawamangun - Tanjung Priok	-6.231937	106.876366	t
2874	60	Kebon Nanas arah Jatinegara	-6.231885	106.876259	t
2875	60	Kebon Nanas-Rawamangun 	-6.230978	106.876160	t
2876	60	Kebon Nanas-Tomang	-6.232435	106.876480	t
2877	60	Kebon nanas	-6.231923	106.877106	t
2878	176	Kebonagung	-7.662444	112.893257	t
2879	178	Kebonrojo - Pahlawan	-7.243332	112.738220	t
2880	178	Kebraon	-7.333982	112.696281	t
2881	178	Kebraon II	-7.336136	112.700264	t
2882	178	Kebraon V	-7.333386	112.702477	t
2883	160	Kebun Raya Purwodadi	-7.797781	112.736595	t
2884	146	Kedamean 	-7.324043	112.523239	t
2885	146	Kedamean	-7.317307	112.565659	t
2886	57	Kedoya menuju Pesing	-6.158221	106.767899	t
2887	57	Kedoya-Pesing	-6.186038	106.767563	t
2888	57	Kedoya-Tomang	-6.190241	106.765656	t
2889	178	Kedung Cowek	-7.223312	112.776566	t
2890	178	Kedung Cowek (SMA 19)	-7.222114	112.776985	t
2891	178	Kedung Cowek (Samsat)	-7.223035	112.776390	t
2892	178	Kedung Cowek - Pogot	-7.233220	112.772537	t
2893	178	Kedung Sari	-7.268098	112.735886	t
2894	178	Kedung Tarukan - Pacar Keling	-7.261840	112.762108	t
2895	178	Kedungdoro	-7.263181	112.731232	t
2896	178	Kedungdoro	-7.264905	112.730606	t
2897	178	Kedungdoro - Kedungsari	-7.265586	112.730400	t
2898	151	Kedungjajang	-8.036539	113.233360	t
2899	151	Kedungjajang	-8.038408	113.233574	t
2900	59	Kejaksaan Tinggi DKI Jakarta (Jl. Rasuna Said)	-6.235409	106.828438	t
2901	160	Kejapanan	-7.572926	112.698738	t
2902	164	Kejapanan - Pasuruan 	-7.564375	112.692551	t
2903	178	Kejawan Putih Tambak	-7.281486	112.802605	t
2904	57	Kelapa Dua	-6.208821	106.770439	t
2905	59	Kelapa Dua - Cimanggis	-6.354384	106.836227	t
2906	59	Kelapa Dua Depok arah Lenteng Agung	-6.354450	106.836136	t
2907	57	Kelapa Dua- Lenteng Agung 	-6.210314	106.770424	t
2908	57	Kelapa Dua-Cimanggis 	-6.213258	106.772408	t
2909	61	Kelapa Gading	-6.160417	106.905396	t
2910	97	Keluar GT Buah Batu	-6.961583	107.637321	t
2911	97	Keluar GT Pasteur	-6.890826	107.576561	t
2912	129	Keluar Tol Solo-Kertosono	-7.432943	110.972771	t
2913	59	Kemang Raya	-6.255301	106.808891	t
2914	59	Kemang Utara IX -Mampang 	-6.256943	106.824348	t
2915	57	Kemanggisan - Binus	-6.189878	106.793350	t
2916	57	Kemanggisan - Slipi 	-6.189665	106.795738	t
2917	58	Kemayoran - Ancol Barat	-6.162502	106.849564	t
2918	58	Kemayoran - Mitra Sunter	-6.161462	106.850258	t
2919	58	Kemayoran-Gedong Panjang 	-6.162092	106.849983	t
2920	58	Kemayoran-Pluit	-6.162934	106.849167	t
2921	178	Kembang Jepun	-7.237201	112.740356	t
2922	57	Kembangan 	-6.191307	106.739624	t
2923	178	KenPark	-7.252943	112.795898	t
2924	175	Kenanten	-7.492856	112.445908	t
2925	175	Kenanten	-7.491877	112.447426	t
2926	118	Kendal arah ke Semarang	-6.926310	110.207199	t
2927	118	Kendal arah ke Weleri	-6.920779	110.196609	t
2928	178	Kendangsari - Jemur Andayani	-7.329198	112.744759	t
2929	178	Kendangsari - Kutisari	-7.329289	112.744682	t
2930	178	Kendangsari - Rungkut	-7.329502	112.751144	t
2931	178	Kenjeran	-7.252943	112.795448	t
2932	178	Kenjeran - Kapasan	-7.240831	112.752975	t
2933	178	Kenjeran - Kedung Cowek	-7.245769	112.769981	t
2934	178	Kenjeran - KenPark	-7.253113	112.796455	t
2935	178	Kenjeran - Suramadu	-7.245343	112.768562	t
2936	178	Kenjeran - Tambak Rejo	-7.242659	112.759079	t
2937	178	Kenjeran arah Suramadu	-7.245471	112.769272	t
2938	178	Keputeran	-7.276463	112.743286	t
2939	178	Kertajaya	-7.278634	112.757706	t
2940	178	Kertajaya - Dharmawangsa	-7.267034	112.755608	t
2941	178	Kertajaya - Manyar	-7.279277	112.762238	t
2942	178	Kertajaya Indah	-7.280209	112.783562	t
2943	178	Kertajaya Indah - Sukarno	-7.280677	112.781044	t
2944	178	Kerto Menanggal	-7.349805	112.729576	t
2945	156	Kertosono	-7.591452	112.102646	t
2947	178	Ketabang Kali	-7.262436	112.745049	t
2948	111	Ketanggungan	-7.035319	108.995789	t
2949	111	Ketanggungan (Brebes)	-6.940626	108.893295	t
2950	142	Ketapang-Rogojampi-Genteng	-8.093094	114.363129	t
2951	121	Ketep Pass Jl. Boyolali - Magelang	-7.496715	110.378693	t
2952	178	Ketintang 	-7.308246	112.725822	t
2953	178	Ketintang Barat	-7.308639	112.722343	t
2954	178	Ketintang Madya	-7.320946	112.721848	t
2955	97	Kiara Condong-Pindad	-6.940166	107.642281	t
2956	121	Kidul Pasar Muntilan	-7.581463	110.284500	t
2957	151	Klakah	-7.993044	113.251747	t
2958	178	Klampis	-7.290596	112.775215	t
2959	111	Klampok	-6.865160	108.998772	t
2960	60	Klender - Cipinang	-6.213654	106.899780	t
2961	138	Klenteng Sam Po Kong	-6.994897	110.399437	t
2962	164	Kletek	-7.358679	112.684769	t
2963	164	Kletek - SBY	-7.358700	112.685570	t
2964	164	Kletek arah Surabaya	-7.359104	112.680931	t
2965	111	Kluwut, Bulakamba, Brebes	-6.874513	108.923737	t
2966	59	Kokas	-6.222900	106.841202	t
2967	178	Kolonel Sugiono	-7.356381	112.730888	t
2968	80	Kontainer terperosok ke jurang	-6.791817	107.435226	t
2969	80	Kota Baru Parahyangan	-6.850259	107.495415	t
2970	175	Kota Mojokerto	-7.471815	112.438629	t
2971	59	Kp. Melayu-Pd. Kelapa 	-6.225140	106.857193	t
2972	60	Kp. Rambutan - Pd. Indah	-6.307194	106.877121	t
2973	60	Kp. Rambutan - Pd. Labu	-6.305680	106.881676	t
2974	60	Kp. Rambutan - Ps. Rebo	-6.306677	106.880455	t
2975	60	Kp. Rambutan -Ampera	-6.307599	106.875916	t
2976	178	Kramat Gantung	-7.250048	112.738586	t
2977	60	Kramat Jati arah Cililitan	-6.268779	106.866501	t
2978	60	Kramatjati	-6.294994	106.869896	t
2979	178	Kranggan	-7.256018	112.733826	t
2980	164	Krian	-7.403047	112.578018	t
2981	164	Krian	-7.409888	112.586166	t
2982	164	Krian - Sukodono	-7.398620	112.707428	t
2983	164	Krian arah Surabaya	-7.384002	112.613686	t
2984	53	Kulwaru - Kulon Progo	-7.891609	110.124367	t
2985	39	Kunciran - Kb. Jeruk	-6.217332	106.668343	t
2986	39	Kunciran - Tomang	-6.217695	106.667809	t
2987	59	Kuningan - Cawang	-6.233245	106.822044	t
2988	59	Kuningan - Mampang	-6.233197	106.821892	t
2989	59	Kuningan - Pancoran	-6.241116	106.835983	t
2990	59	Kuningan - Semanggi	-6.240786	106.834358	t
2991	59	Kuningan - Slipi	-6.240775	106.834206	t
2992	59	Kuningan - Tebet 	-6.241244	106.836632	t
2993	59	Kuningan - Tomang	-6.240796	106.834442	t
2994	59	Kuningan City - Karet	-6.224308	106.828178	t
2995	59	Kuningan arah Casablanca	-6.225608	106.833351	t
2996	59	Kuningan arah Mampang	-6.236563	106.827545	t
2997	178	Kupang Jaya	-7.274526	112.699554	t
2998	114	Kusuma Bangsa	-7.086669	111.089394	t
2999	178	Kusuma Bangsa (HiTech Mall)	-7.250050	112.749977	t
3000	178	Kusuma Bangsa - Kapasari	-7.248826	112.750290	t
3001	94	Labora - Cibadak	-6.889319	106.780579	t
3002	178	Lakar Santri - Citra Raya	-7.303153	112.633163	t
3003	178	Lakarsantri	-7.306878	112.665436	t
3004	178	Lakarsantri - Driyorejo	-7.303451	112.633659	t
3005	178	Lakarsantri - Droyorejo	-7.306708	112.664879	t
3006	178	Lalin Raya Darmo Soetomo - Basuki Rahmad	-7.278730	112.741142	t
3007	150	Lamongan Plaza	-7.112753	112.418694	t
3008	99	Lampiri	-6.253520	106.940514	t
3009	54	Lap Denggung	-7.720964	110.361122	t
3010	57	Latumenten - Pluit	-6.160726	106.789062	t
3011	154	Lawang	-7.837470	112.697540	t
3012	154	Lawang - Malang	-7.826562	112.700058	t
3013	154	Lawang - Pandaan	-7.839660	112.698021	t
3014	154	Lawang - Surabaya	-7.830923	112.697258	t
3015	154	Lawang arah Purwosari	-7.830306	112.697388	t
3016	164	Layang Buduran	-7.432369	112.721199	t
3017	178	Layang Mayangkara	-7.328225	112.718544	t
3018	59	Lebak Bulus - Cilandak - Pasar Minggu	-6.288523	106.778419	t
3019	40	Lebak Bulus - Ciputat	-6.289245	106.770897	t
3020	59	Lebak Bulus arah Fatmawati	-6.288533	106.778435	t
3021	40	Lebak Bulus-Ciputat	-6.298919	106.778587	t
3022	86	Lebak jero - Kadungora	-7.053641	107.898941	t
3023	97	Ledeng - Jl. Sersan Bajuri	-6.858701	107.594917	t
3024	86	Leles	-7.084869	107.898628	t
3025	152	Lemah Bang Saradan	-7.498834	111.734283	t
3026	152	Lemahbang, Saradan	-7.501770	111.680405	t
3027	80	Lembang	-6.817679	107.612488	t
3028	40	Lemdikpol (Jl. Ciputat Raya)	-6.287103	106.771156	t
3029	60	Lenteng Agung	-6.319820	106.837151	t
3030	59	Lenteng Agung - Tanjung Barat	-6.330726	106.834419	t
3031	59	Lenteng Agung-Margonda	-6.323744	106.834572	t
3032	59	Lenteng Agung-UI	-6.330526	106.834267	t
3033	164	Letjen S Parman	-7.382917	112.728394	t
3034	174	Letjend S. Parman - Ciliwung	-7.951850	112.639206	t
3035	178	Lidah Kulon	-7.303302	112.662216	t
3036	178	Lidah Kulon (Rumadi)	-7.305535	112.661507	t
3037	178	Lidah Wetan (UNESA)	-7.301834	112.675461	t
3038	86	Limbangan	-7.034608	107.981956	t
3039	86	Limbangan (Pasar)	-7.036540	107.979065	t
3040	86	Limbangan - Tasik	-7.033623	107.985245	t
3041	79	Lin	-7.021168	107.889153	t
3042	79	Lingkar Luar Nagrek	-7.031461	107.893280	t
3043	118	Lingkar Luar Weleri Kendal arah ke Jakarta	-6.967028	110.056305	t
3044	164	Lingkar Timur	-7.412889	112.726334	t
3045	79	Lingkar luar Nagrek	-7.022719	107.893959	t
3046	124	Lingkar luar Pemalang	-6.882651	109.414841	t
3047	164	Lippo Plaza	-7.447039	112.698341	t
3048	87	Losarang	-6.394844	108.157997	t
3049	87	Losarang	-6.389111	108.145416	t
3050	87	Losarang - Indramayu	-6.381047	108.133858	t
3051	85	Losari	-6.841028	108.804756	t
3052	111	Losari (Perbatasan Jawa Tengah dan Jawa Barat)	-6.845699	108.812866	t
3053	59	Lotte Avenue	-6.223774	106.824486	t
3054	59	Lt. Agung - Pd. Indah	-6.300007	106.833672	t
3055	59	Lt. Agung - Ps. Minggu	-6.299580	106.833176	t
3056	59	Lt. Agung-Pd. Pinang	-6.299793	106.833458	t
3057	107	Lumbir	-7.474920	108.984802	t
3058	40	M. Toha	-6.317154	106.680634	t
3059	178	MERR	-7.303457	112.781319	t
3060	178	MERR (Arief Rachman Hakim)	-7.289479	112.780731	t
3061	178	MERR (Kampus C)	-7.269878	112.782249	t
3062	178	MERR - Kampus C Unair	-7.276910	112.781097	t
3063	178	MERR - Kedung Baruk	-7.314497	112.780777	t
3064	178	MERR - Kenjeran	-7.245469	112.769012	t
3065	178	MERR - Kertajaya Indah Timur	-7.277527	112.780998	t
3066	178	MERR - Mulyorejo	-7.274994	112.794014	t
3067	178	MERR - SMPN 19	-7.288233	112.780968	t
3068	178	MERR - STIKOM	-7.308836	112.780579	t
3069	178	MERR - UNAIR Kampus C	-7.265969	112.782875	t
3070	178	MERR Galaxy Mall	-7.276053	112.781364	t
3071	178	MERR Ir Sukarno  Kopertis	-7.287765	112.780746	t
3072	178	MERR Kertajaya (Koni)	-7.280483	112.780800	t
3073	178	MERR Mulyorejo	-7.274313	112.797737	t
3074	178	MERR Mulyorejo	-7.263421	112.783142	t
3075	178	MERR STIKOM	-7.309709	112.780602	t
3076	178	MERR Semolowaru - Galaxy	-7.302172	112.786842	t
3077	59	MT. Haryono	-6.243452	106.858231	t
3078	59	MT. Haryono - Pancoran	-6.243345	106.849548	t
3079	57	MTA-Grogol 	-6.173260	106.790070	t
3080	152	Madiun-Surabaya	-7.571394	111.485695	t
3081	153	Magetan arah ke Madiun 	-7.654096	111.328728	t
3082	156	Mako Kertosono	-7.590835	112.101746	t
3083	156	Mako Kertosono	-7.591069	112.102264	t
3084	59	Mal Ambassador - Karet	-6.224526	106.826759	t
3085	59	Mal Kota Kasablanka - Tebet - Kampung Melayu	-6.224662	106.842873	t
3086	174	Malang	-7.937038	112.644516	t
3087	154	Malang - Singosari - Lawang - Purwosari	-7.881747	112.673767	t
3088	174	Malang Kota arah Alun-alun	-7.983269	112.629860	t
3089	86	Malangbong (Pasar)	-7.060988	108.086899	t
3090	162	Malasan	-7.875731	113.253426	t
3091	162	Malasan	-7.902533	113.249687	t
3092	55	Malioboro	-7.800401	110.364922	t
3093	55	Malioboro	-7.799397	110.365028	t
3094	39	Mall Alam Sutera	-6.222132	106.655319	t
3095	61	Mall Artha Gading - Cemp. Putih 	-6.145888	106.890839	t
3096	61	Mall Emporium 	-6.127797	106.790138	t
3097	57	Mall Puri	-6.188683	106.731880	t
3098	61	Mall of Indonesia	-6.150675	106.890862	t
3099	61	Mall of Indonesia arah Sunter	-6.151423	106.889671	t
3100	59	Mampang - Blok M	-6.240228	106.825256	t
3101	59	Mampang - Jl. H. R. Rasuna Said	-6.240558	106.825638	t
3102	60	Mangga 2-Gng Sahari	-6.195446	106.865685	t
3103	61	Mangga Dua - Gunung Sahari	-6.135019	106.830482	t
3104	61	Mangga Dua Square 	-6.138379	106.830795	t
3105	56	Manggarai 	-6.208672	106.848114	t
3106	56	Manggarai arah Sudirman	-6.209009	106.846748	t
3107	157	Mantingan	-7.398260	111.144241	t
3108	178	Manukan	-7.257274	112.669945	t
3109	178	Manukan	-7.256285	112.665802	t
3110	178	Manukan - Buntaran - Margomulyo	-7.235914	112.682434	t
3111	146	Manyar	-7.094755	112.589722	t
3112	178	Manyar - Menur	-7.289361	112.763092	t
3114	103	Mapolresta Depok	-6.394511	106.823112	t
3115	178	Margomulyo	-7.238042	112.682243	t
3116	178	Margomulyo	-7.232231	112.682732	t
3117	178	Margomulyo - Greges	-7.229605	112.682777	t
3118	178	Margomulyo - Kalianak	-7.231975	112.682541	t
3119	178	Margomulyo - Tandes	-7.258280	112.680969	t
3120	178	Margomulyo arah Tanjung Sari	-7.258413	112.679047	t
3121	178	Margomulyo-Kalianak-Rajawali	-7.233721	112.682732	t
3122	103	Margonda Raya	-6.364171	106.833755	t
3123	103	Margonda arah Lenteng Agung	-6.364098	106.833672	t
3124	103	Margonda seputaran Kober Depok	-6.361037	106.833427	t
3125	178	Margorejo	-7.314604	112.738716	t
3126	178	Margorejo - Jemursari	-7.317617	112.751373	t
3127	178	Margorejo - Prapen	-7.315583	112.740730	t
3128	178	Margorejo - Sidoarjo	-7.316541	112.735306	t
3129	61	Marunda 	-6.108936	106.957031	t
3130	178	Masjid Agung - Juanda	-7.334907	112.714172	t
3131	178	Maspion Square	-7.316328	112.736572	t
3132	178	Mastrip - Kedurus	-7.315721	112.709679	t
3133	97	Masuk GT Buah Batu	-6.961604	107.636673	t
3134	79	Masuk GT Cileunyi	-6.944623	107.749054	t
3135	97	Masuk GT Pasteur	-6.890810	107.575478	t
3136	54	Masuk Jogja Waterpark Bay	-7.748722	110.419518	t
3137	54	Masuk Jogja Waterpark Bay	-7.748956	110.419510	t
3138	121	Masuk Pasar Muntilan	-7.579913	110.282082	t
3139	139	Masuk Polres Surakarta	-7.555156	110.802689	t
3140	92	Masuk Tol Cipali dari Jakarta	-6.438610	107.468063	t
3141	178	Masuk Tol Perak	-7.224919	112.721954	t
3142	139	Masuk Tol Solo-Kertosono	-7.529687	110.798592	t
3143	58	Matraman - Pramuka	-6.199093	106.854042	t
3144	60	Matraman - Senen 	-6.201611	106.856010	t
3145	60	Matraman arah Salemba	-6.201178	106.855400	t
3146	178	Mayangkara - Wonokromo	-7.305012	112.736481	t
3147	178	Mayangkara arah A.Yani	-7.306314	112.736153	t
3113	153	Maospati	-7.625673	111.428986	t
3148	59	Mayestik	-6.241935	106.790733	t
3149	178	Mayjen Sungkono - Bintang Diponggo	-7.289551	112.711487	t
3150	178	Mayjend Sungkono  (TVRI)	-7.290639	112.714294	t
3151	178	Mayjend Sungkono (Ciputra World)	-7.291894	112.720367	t
3152	178	Mayjend Sungkono - Adityawarman	-7.292684	112.729645	t
3153	178	Mayjend Sungkono - Darmo Satelit	-7.288468	112.707581	t
3154	178	Mayjend Sungkono - Dukuh Kupang	-7.290255	112.713394	t
3155	178	Mayjend Sungkono - HR Muhammad	-7.288468	112.707840	t
3156	178	Mayjend Sungkono - Indragiri	-7.292607	112.729370	t
3157	81	Mc. Donald Jababeka 2	-6.300348	107.151802	t
3158	178	Medaeng	-7.352507	112.718849	t
3159	178	Medaeng	-7.350401	112.712433	t
3160	178	Medaeng - Geluran	-7.352912	112.719810	t
3161	178	Medaeng - Terminal Purabaya	-7.352869	112.719193	t
3162	178	Medaeng Baru	-7.350656	112.709602	t
3163	59	Mega Kuningan	-6.228862	106.824448	t
3164	59	Mega Kuningan - Rasuna Said	-6.229859	106.827248	t
3165	59	Mega Kuningan arah Jl. Prof. Dr. Satrio 	-6.224670	106.825783	t
3166	82	Megamendung - Puncak	-6.649906	106.902824	t
3167	56	Megaria - Jl. Diponegoro - RSCM	-6.200669	106.843468	t
3168	178	Menanggal	-7.342377	112.729294	t
3169	121	Mendut-Borobudur	-7.601512	110.222824	t
3170	121	Mendut-Borobudur	-7.606596	110.213425	t
3171	178	Menganti - Lidah Kulon	-7.305899	112.656425	t
3172	178	Menganti - Mastrip	-7.312997	112.709541	t
3173	146	Menganti - Wiyung	-7.293916	112.588364	t
3174	178	Menganti arah Wiyung	-7.312007	112.688850	t
3175	156	Mengkreng arah Madiun	-7.614082	112.107689	t
3176	58	Menteng - Jl. H. R. Rasuna Said	-6.205833	106.828835	t
3177	58	Menteng - Salemba	-6.195339	106.828438	t
3178	58	Menteng-Rasuna Said 	-6.195355	106.828766	t
3179	39	Menuju Bandara Soekarno - Hatta	-6.114472	106.684441	t
3180	39	Menuju Terminal 3 Bandara Soekarno-Hatta	-6.123044	106.661674	t
3181	178	Menur - Kertajaya	-7.279869	112.762192	t
3182	178	Menur Pumpungan	-7.287914	112.764015	t
3183	37	Merak	-5.989207	106.023514	t
3184	178	Merr - Gununganyar	-7.332854	112.782745	t
3185	178	Merr - Kedung Baruk	-7.311411	112.780212	t
3186	178	Merr Koni	-7.281018	112.780838	t
3187	178	Merr Pandungo 	-7.316988	112.813339	t
3188	178	Merr, Mulyorejo, Kampus C UNAIR	-7.263841	112.783005	t
3189	178	Merr-Kenjeran	-7.250112	112.784508	t
3190	135	Mertoyudan Jl.Magelang-Yogya	-7.509615	110.224884	t
3191	57	Meruya	-6.196811	106.755203	t
3192	57	Meruya - Jl. Raya Joglo	-6.196612	106.756149	t
3193	57	Meruya - Kembang Kerep - Srengseng - Puri Kembangan - Puri Indah	-6.197696	106.742279	t
3194	57	Meruya-Bandara Soeta	-6.190710	106.755554	t
3195	39	Meruya-Jl. Joglo Raya	-6.219268	106.736252	t
3196	57	Meruya-Tomang	-6.190838	106.755287	t
3197	156	Mintil Wilangan	-7.589772	111.797195	t
3198	178	Moestopo (simpang Karangmenjangan)	-7.266097	112.760643	t
3199	178	Moestopo - Karangmenjangan	-7.266060	112.760880	t
3200	149	Mojo	-7.900302	111.928261	t
3201	155	Mojoagung	-7.570267	112.340744	t
3202	155	Mojoagung	-7.570650	112.346878	t
3203	155	Mojoagung	-7.570628	112.346169	t
3204	155	Mojoagung arah Kediri	-7.570522	112.345421	t
3205	175	Mojokerto-Pasuruan-Probolinggo-Situbondo	-7.472028	112.439751	t
3206	155	Mojosari 	-7.504583	112.561394	t
3207	155	Mojosari	-7.509152	112.539474	t
3208	155	Mojosari - Blitar	-7.510152	112.541283	t
3209	148	Mojowarno-Simpang 5 Gumul	-7.624036	112.324966	t
3210	58	Monas	-6.174134	106.826759	t
3211	57	Muara Angke	-6.143456	106.788910	t
3212	61	Muara Karang - Pantai Indah Kapuk	-6.116706	106.779884	t
3213	178	Mulyorejo	-7.273675	112.797768	t
3214	178	Mulyosari - Tempurejo	-7.257857	112.795631	t
3215	157	Muneng Caruban	-7.492260	111.603523	t
3216	157	Muneng Pilangkenceng 	-7.491899	111.603065	t
3217	55	Museum Pendidikan	-7.774788	110.387383	t
3218	178	Mustopo - Dharmawangsa	-7.266076	112.756615	t
3219	178	Mustopo - Karang Menjangan	-7.265895	112.760826	t
3220	79	Nagreg	-7.031861	107.893661	t
3221	86	Nagreg - Limbangan	-7.037328	107.916351	t
3222	79	Nagrek	-7.019438	107.886658	t
3223	156	Nampu Saradan	-7.591899	111.774025	t
3224	152	Nampu Saradan	-7.498324	111.726044	t
3225	95	Narogong - Sumedang	-6.841875	107.925415	t
3226	178	Ngagel - Pucang	-7.287020	112.755768	t
3227	178	Ngagel - Sulawesi	-7.277405	112.745186	t
3228	178	Ngagel - Upa Jiwa	-7.287789	112.745735	t
3229	178	Ngagel BAT	-7.288978	112.744690	t
3230	178	Ngagel Jaya	-7.291107	112.755768	t
3231	178	Ngagel Jaya Selatan	-7.293618	112.756218	t
3232	178	Ngagel Jaya Selatan 	-7.296508	112.761200	t
3233	178	Ngagel Jaya Selatan	-7.293725	112.759270	t
3234	178	Ngagel Jaya Selatan - Ngagel Madya	-7.293682	112.759918	t
3235	178	Ngagel Jaya Tengah 	-7.291700	112.756638	t
3236	178	Ngagel Jaya Utara	-7.288957	112.756058	t
3237	178	Ngagel Madya	-7.289851	112.760002	t
3238	178	Ngagel-Manyar (Kebun Bibit)	-7.299216	112.740669	t
3239	178	Ngaglik	-7.248962	112.751205	t
3240	178	Ngaglik - Kapasari	-7.248978	112.751656	t
3241	178	Ngaglik - Tambaksari	-7.249372	112.755493	t
3242	157	Ngampon	-7.505238	111.529877	t
3243	169	Nganntru	-8.013974	111.947296	t
3244	149	Ngasem	-7.808474	112.043274	t
3245	157	Ngawi - Caruban - Nganjuk	-7.452305	111.595047	t
3246	178	Ngelom	-7.347100	112.691574	t
3247	178	Ngemplak	-7.257966	112.744423	t
3248	160	Ngerong (Gempol)	-7.607415	112.698929	t
3249	178	Nginden	-7.306378	112.761932	t
3250	178	Nginden - Panjang Jiwo	-7.306431	112.761696	t
3251	178	Nginden - Prapen	-7.306633	112.761818	t
3252	178	Nginden Semolo	-7.299684	112.764275	t
3253	156	Nglundo	-7.595004	111.968689	t
3256	148	Ngoro - Pare	-7.679361	112.226196	t
3257	169	Ngunut	-8.086508	111.968086	t
3258	57	Olimo - Stasiun Kota	-6.153697	106.817558	t
3259	60	Otista 	-6.231592	106.871857	t
3260	59	PIM 2	-6.265593	106.783485	t
3261	51	PMI Bantul - Jl. Bantul	-7.880662	110.332809	t
3262	152	POM Mlilir Dolopo	-7.787959	111.535439	t
3263	58	PRJ Kemayoran 	-6.148699	106.846397	t
3264	178	Pabrik Paku Waru	-7.350988	112.729225	t
3265	178	Pacar Keling	-7.258754	112.755196	t
3266	144	Padangan	-7.174923	111.605309	t
3267	144	Padangan	-7.185653	111.598221	t
3268	144	Padangan - Surabaya	-7.241086	111.595390	t
3269	61	Pademangan 	-6.131701	106.835495	t
3270	164	Pageruyung arah Ploso	-7.440528	112.630547	t
3271	178	Pagesangan	-7.338565	112.717812	t
3272	152	Pagotan	-7.697553	111.537369	t
3273	178	Pahlawan - Gemblongan	-7.252247	112.736778	t
3274	178	Pahlawan - Kebon Rojo	-7.243470	112.735329	t
3275	178	Pahlawan - Tembaan	-7.247014	112.738609	t
3276	178	Pahlawan - Tembaan	-7.247046	112.736122	t
3277	154	Pakisaji	-8.066347	112.598427	t
3278	59	Pakubuwono menuju Jl. Jend. Sudirman	-6.233030	106.797379	t
3279	178	Pakuwon City	-7.276218	112.804207	t
3280	54	Palagan Sleman	-7.720348	110.383133	t
3281	57	Palmerah Utara arah Gatot Subroto	-6.202745	106.798096	t
3282	58	Palmerah arah Petamburan	-6.207556	106.795967	t
3283	58	Palmerah-Permata Hijau 	-6.207626	106.796188	t
3284	93	Pamanukan	-6.283370	107.820549	t
3285	40	Pamulang - Ciputat	-6.344204	106.736137	t
3286	40	Pamulang - Perempatan Viktor	-6.346965	106.687813	t
3287	40	Pamulang Square	-6.342352	106.725159	t
3288	40	Pamulang-Pdk Cabe	-6.344239	106.735847	t
3289	59	Pancoran - Cawang	-6.242887	106.842125	t
3290	59	Pancoran - Kalibata	-6.243891	106.843376	t
3291	59	Pancoran - Pasar Minggu	-6.243864	106.843391	t
3292	59	Pancoran - Semanggi	-6.242727	106.841743	t
3293	160	Pandaan	-7.654044	112.687584	t
3294	160	Pandaan	-7.665570	112.697624	t
3295	160	Pandaan arah Surabaya	-7.665549	112.700439	t
3296	160	Pandaan-Malang	-7.664921	112.699394	t
3297	178	Pandegiling	-7.276782	112.739059	t
3298	178	Pandegiling arah Pasar Kembang	-7.276718	112.738159	t
3299	178	PangSud - Urip S	-7.273246	112.742378	t
3300	59	Pangeran Antasari (Lippo Mall Kemang) arah Kemang Selatan	-6.258773	106.808144	t
3301	178	Panglima Sudirman	-7.271791	112.742882	t
3302	178	Panglima Sudirman - Darmo	-7.271988	112.742813	t
3303	178	Panjang Jiwo	-7.307453	112.764938	t
3304	178	Panjang Jiwo - Nginden	-7.308075	112.768219	t
3305	174	Panjisuroso	-7.932356	112.649948	t
3306	57	Pantai Indah Utara - Pluit	-6.120767	106.743736	t
3307	111	Pantura Brebes - Tegal - Pemalang - Pekalongan	-6.869840	109.036049	t
3308	140	Pantura Jl. Martoloyo	-6.859675	109.152649	t
3309	93	Pantura Pamanukan	-6.285949	107.808075	t
3310	93	Pantura Subang	-6.288760	107.887070	t
3311	168	Pantura Tuban	-6.873895	112.039001	t
3312	150	Pasar Agrobis Babat	-7.100552	112.190453	t
3313	178	Pasar Asem	-7.268311	112.722343	t
3314	150	Pasar Babat	-7.105186	112.166092	t
3315	156	Pasar Bagor	-7.568618	111.848885	t
3316	156	Pasar Bagor	-7.568713	111.849113	t
3317	156	Pasar Bagor	-7.568714	111.849251	t
3318	90	Pasar Balong - Majalengka	-6.834259	108.222046	t
3319	86	Pasar Bandrek Garut	-7.057836	108.070366	t
3320	160	Pasar Bangil	-7.598003	112.780991	t
3321	79	Pasar Banjaran	-7.048562	107.586548	t
3322	35	Pasar Baros	-6.212437	106.131622	t
3323	153	Pasar Baru	-7.653385	111.335106	t
3324	153	Pasar Baru	-7.654575	111.332962	t
3325	153	Pasar Baru	-7.653363	111.334923	t
3326	80	Pasar Batujajar	-6.918450	107.491501	t
3327	144	Pasar Baureno	-7.125741	112.106056	t
3328	58	Pasar Benhil arah Sudirman	-6.215066	106.815361	t
3329	178	Pasar Besar	-7.247472	112.739769	t
3330	155	Pasar Brangkal	-7.523065	112.415543	t
3331	144	Pasar Bureno	-7.125762	112.106339	t
3332	86	Pasar Ciawitali, Garut	-7.200959	107.904808	t
3333	94	Pasar Cicurug Sukabumi	-6.784615	106.782593	t
3334	82	Pasar Cikereteg	-6.698312	106.851944	t
3335	103	Pasar Cimanggis 	-6.365352	106.859268	t
3336	82	Pasar Cisarua	-6.680339	106.929321	t
3337	54	Pasar Gentan	-7.718833	110.404427	t
3338	57	Pasar Ikan Jakarta Utara	-6.127642	106.808746	t
3339	40	Pasar Jumat - Ciputat	-6.289240	106.772949	t
3340	40	Pasar Jumat - Pamulang	-6.289257	106.772957	t
3341	178	Pasar Kembang	-7.271192	112.728081	t
3342	36	Pasar Kemis 	-6.157579	106.555733	t
3343	60	Pasar Kramat Jati	-6.268703	106.866608	t
3344	164	Pasar Krian	-7.409920	112.585892	t
3345	164	Pasar Larangan	-7.470177	112.716080	t
3346	154	Pasar Lawang	-7.832687	112.697281	t
3348	162	Pasar Leces	-7.844166	113.228920	t
3349	156	Pasar Lengkong	-7.534786	112.075935	t
3350	59	Pasar Mampang Prapatan	-6.240850	106.825409	t
3351	146	Pasar Menganti	-7.294299	112.588058	t
3352	59	Pasar Minggu (Volvo) arah ke Lenteng Agung	-6.272781	106.846550	t
3353	59	Pasar Minggu - Pancoran	-6.282639	106.844582	t
3354	59	Pasar Minggu - TL Kalibata	-6.282678	106.844574	t
3355	59	Pasar Minggu - Tanjung Barat	-6.295354	106.840935	t
3356	59	Pasar Minggu arah Kalibata	-6.265688	106.844124	t
3357	148	Pasar Mojoagung	-7.568523	112.335785	t
3358	178	Pasar Pagesang	-7.332949	112.714294	t
3359	57	Pasar Pagi-Kota 	-6.139403	106.809105	t
3360	54	Pasar Pakem	-7.665932	110.419495	t
3361	58	Pasar Palmerah	-6.207636	106.795830	t
3362	58	Pasar Palmerah - Slipi	-6.207575	106.795822	t
3363	141	Pasar Patemon 	-7.070421	112.828987	t
3364	141	Pasar Patemon	-7.070528	112.828514	t
3365	99	Pasar Pondok Gede	-6.284245	106.911903	t
3366	103	Pasar Pondok Labu	-6.312264	106.793388	t
3367	80	Pasar Rajamandala	-6.832874	107.352486	t
3368	151	Pasar Ranuyoso	-7.949204	113.260437	t
3369	60	Pasar Rebo arah Cijantung	-6.308994	106.863731	t
3370	60	Pasar Rebo menuju Kampung Rambutan	-6.306702	106.866295	t
3371	56	Pasar Rumput (Manggarai)	-6.207142	106.841003	t
3372	153	Pasar Sayur	-7.647855	111.329956	t
3373	153	Pasar Sayur 	-7.647749	111.330193	t
3374	153	Pasar Sayur	-7.646792	111.329292	t
3375	58	Pasar Senen - Kramat Raya	-6.177905	106.842232	t
3376	154	Pasar Singosari	-7.893585	112.666748	t
3377	154	Pasar Singosari	-7.893500	112.666878	t
3378	85	Pasar Tegalgubug	-6.636026	108.389458	t
3379	164	Pasar Wadung Asri	-7.348294	112.767616	t
3380	164	Pasar Wringianom arah Mojokerto	-7.394855	112.537872	t
3381	86	Pasar malangbong	-7.060721	108.086899	t
3382	33	Pasir Gombong 	-6.589283	106.393814	t
3383	164	PassMar Gedangan	-7.380199	112.728447	t
3384	97	Pasteur (Aston)	-6.896487	107.590675	t
3385	176	Pasuruan 	-7.639519	112.910507	t
3386	58	Patal Senayan - Asia Afrika	-6.218542	106.798065	t
3387	178	Patimura	-7.275420	112.693504	t
3388	178	Patmosusastro	-7.291724	112.729340	t
3389	87	Patrol (Indramayu)	-6.312497	107.983856	t
3390	59	Pd Pinang-Kp. Rambutan 	-6.291417	106.783806	t
3391	103	Pd. Cabe-Gaplek 	-6.336263	106.765823	t
3392	59	Pd. Indah - TMII	-6.288148	106.777626	t
3393	59	Pd. Indah-Kp. Rambutan	-6.287529	106.777176	t
3394	59	Pd. Indah-Lebak Bulus 	-6.280896	106.780525	t
3395	59	Pd. Indah-Pd Labu	-6.287124	106.776871	t
3396	59	Pd. Indah-Radio Dalam 	-6.280672	106.780434	t
3397	59	Pd. Labu-Fatmawati	-6.305530	106.793159	t
3398	59	Pd. Pinang - Ps. Minggu	-6.291433	106.783722	t
3399	59	Pd. Pinang arah Ps. Rebo	-6.270829	106.768227	t
3400	59	Pd. Pinang-Jt. Asih 	-6.290137	106.780121	t
3401	59	Pd. Pinang-Lbk Bulus 	-6.266350	106.775009	t
3402	59	Pd. Pinang-Lt. Agung	-6.291379	106.783577	t
3403	59	Pd. Pindang-Kp. Rambutan	-6.291603	106.784340	t
3404	40	Pd. Ranji - Ulujami	-6.283456	106.735504	t
3405	40	Pd. Ranji-Pd. Indah 	-6.283370	106.735603	t
3406	40	Pd. Ranji-Serpong 	-6.283733	106.734947	t
3407	60	Pedati-Jatinegara 	-6.228254	106.875534	t
3408	111	Pejagan	-6.872585	108.885162	t
3409	111	Pejagan	-6.872770	108.883102	t
3410	111	Pejagan - Brexit	-6.898905	108.876488	t
3412	58	Pejompongan arah Penjernihan	-6.203623	106.802071	t
3413	58	Pejompongan-Karet 	-6.203381	106.805588	t
3414	142	Pelabuhan ASDP Ketapang	-8.143057	114.399902	t
3415	142	Pelabuhan Gilimanuk	-8.180939	114.438484	t
3416	142	Pelabuhan Gilimanuk-Ketapang	-8.143099	114.401512	t
3417	142	Pelabuhan Ketapang	-8.143057	114.399651	t
3418	142	Pelabuhan Ketapang	-8.143120	114.400589	t
3419	142	Pelabuhan Ketapang	-8.143035	114.400314	t
3420	142	Pelabuhan Ketapang	-8.143046	114.400215	t
3421	124	Pemalang (Jalur Pantura)	-6.880539	109.393806	t
3422	124	Pemalang arah Tegal	-6.890214	109.382446	t
3423	178	Peneleh - Gemblongan	-7.252256	112.736984	t
3424	55	Pengadilan Tinggi	-7.836163	110.370995	t
3425	59	Penjernihan-Dukuh Atas 	-6.213983	106.819916	t
3426	59	Penjernihan-Karet 	-6.214058	106.820091	t
3427	58	Penjompongan - Palmerah	-6.207114	106.802963	t
3428	148	Perak	-7.578895	112.153046	t
3429	178	Perak Krembangan	-7.225651	112.720802	t
3430	178	Perak Timur	-7.222928	112.732368	t
3431	173	Perbatasan Madiun-Nganjuk	-7.600704	111.534599	t
3432	157	Perbatasan Ngawi - Sragen	-7.507748	111.163078	t
3433	177	Perbatasan Probolinggo	-7.763021	113.236900	t
3434	127	Perbatasan Tuban-Rembang	-6.756925	111.693771	t
3435	135	Peremapatan Alun2 Magelang	-7.477746	110.217339	t
3436	150	Perempatan Babat Tuban	-7.101389	112.206535	t
3437	178	Perempatan Babatan UNESA	-7.308794	112.673935	t
3438	144	Perempatan Balen	-7.193189	111.959114	t
3439	144	Perempatan Balen	-7.193338	111.958641	t
3440	59	Perempatan FedEx Pondok Pinang dari Ciputat	-6.280308	106.772278	t
3441	139	Perempatan Gading (Alun2 Kidul)	-7.583688	110.825768	t
3442	164	Perempatan Gedangan	-7.389642	112.727966	t
3443	57	Perempatan Grogol	-6.166833	106.788399	t
3444	58	Perempatan Harmoni	-6.167605	106.820892	t
3445	59	Perempatan ITC Fatmawati	-6.263926	106.797272	t
3446	97	Perempatan Jl Abdul Rivai - Jl Wastukencana	-6.904390	107.604347	t
3411	59	Pejaten Village 	-6.281216	106.827919	t
3447	97	Perempatan Jl. Buah Batu	-6.948047	107.633430	t
3448	178	Perempatan Kedungcowek	-7.244343	112.769081	t
3449	101	Perempatan Kerkof	-6.903773	107.530975	t
3450	80	Perempatan Kota Baru Parahyangan arah Cimareme	-6.852229	107.497658	t
3451	80	Perempatan KotaBaru Parahyangan	-6.851920	107.497551	t
3452	178	Perempatan Kutai	-7.290237	112.736000	t
3453	178	Perempatan Manyar  (Kebun Bibit)	-7.293640	112.762527	t
3454	97	Perempatan Melong	-6.918892	107.563400	t
3455	156	Perempatan Mengkreng	-7.616528	112.106316	t
3456	153	Perempatan Munginsidi arah Alun2 Magetan	-7.656528	111.318565	t
3457	59	Perempatan Pancoran	-6.243155	106.843506	t
3458	178	Perempatan Panjang Jiwo	-7.306639	112.761932	t
3459	80	Perempatan Panorama	-6.814690	107.623039	t
3460	146	Perempatan Pasar Menganti	-7.294007	112.587990	t
3461	121	Perempatan RSPD Muntilan	-7.578826	110.279152	t
3462	95	Perempatan RSUD Sumedang	-6.859212	107.921349	t
3463	164	Perempatan Raya Pabean	-7.369359	112.763412	t
3464	85	Perempatan Sendang	-6.758603	108.497124	t
3465	178	Perempatan Sutorejo Unair	-7.263330	112.783112	t
3466	57	Perempatan TL Cengkareng	-6.154206	106.727570	t
3467	80	Perempatan TL arah Kota Baru Parahyangan	-6.852144	107.497467	t
3468	54	Perempatan Tempel	-7.653959	110.325630	t
3469	54	Perempatan Tempel Arah Semarang-JKT	-7.653719	110.325546	t
3470	160	Perempatan Warungdowo	-7.687101	112.882698	t
3471	150	Perlintasan KA Barat Kota Lamongan	-7.110240	112.407143	t
3472	156	Perlintasan KA Minthil	-7.600683	111.789169	t
3473	150	Perlintasan KA Timur Kota Lamongan	-7.114424	112.427551	t
3474	101	Perlintasan rel KA Baros	-6.887444	107.537445	t
3475	59	Permata Hijau	-6.221001	106.782295	t
3476	59	Permata Hijau - Jl. Raya Simprug	-6.222349	106.785759	t
3477	57	Permata Hijau - Pos Pengumben	-6.217784	106.776634	t
3478	59	Permata Hijau arah Pondok Indah	-6.221110	106.782829	t
3479	103	Persimpangan Bojongsari - Ciputat - Parung	-6.404563	106.741684	t
3480	103	Persimpangan Gas Alam Depok	-6.382049	106.866898	t
3481	60	Persimpangan Kawasan Industri Pulogadung	-6.192165	106.905807	t
3482	57	Persimpangan Slipi	-6.201549	106.799637	t
3483	37	Pertigaan (Polsek Merak)	-5.939797	106.001266	t
3484	101	Pertigaan Alun-Alun Cimahi	-6.873512	107.541969	t
3485	178	Pertigaan Benowo	-7.234721	112.613937	t
3486	121	Pertigaan Borobudur	-7.606989	110.209541	t
3487	164	Pertigaan Buduran (JAPFA)	-7.418038	112.724716	t
3488	80	Pertigaan Cilame	-6.863920	107.506363	t
3489	79	Pertigaan Cileunyi	-6.939367	107.752472	t
3490	101	Pertigaan Contong - Cimahi	-6.882715	107.532906	t
3491	178	Pertigaan Dharmahusada arah Karmen	-7.265916	112.761238	t
3492	59	Pertigaan Fatmawati Cipete arah Lebak Bulus	-6.277090	106.797676	t
3493	142	Pertigaan Genteng	-8.364202	114.146278	t
3494	80	Pertigaan Grand Hotel Lembang	-6.815020	107.614304	t
3495	103	Pertigaan Jl Bandung - Jl Cinere	-6.337372	106.781219	t
3496	80	Pertigaan Jl Industri Cimareme	-6.866200	107.502846	t
3497	59	Pertigaan Jl. Deplu Raya - Jl. RC. Veteran Raya	-6.272196	106.764397	t
3498	101	Pertigaan Jl. Kerkof - Bundaran Leuwi Gajah	-6.903024	107.535484	t
3499	101	Pertigaan Jl. Lurah	-6.878268	107.544258	t
3500	97	Pertigaan Jl. Terusan Jakarta - Jl. Subang	-6.912485	107.655190	t
3501	178	Pertigaan Kedurus	-7.313597	112.709473	t
3502	101	Pertigaan Kerkof	-6.903932	107.534157	t
3503	156	Pertigaan Mengkreng	-7.601066	112.111099	t
3504	155	Pertigaan Mojosari	-7.509620	112.540642	t
3505	155	Pertigaan Mojosari	-7.509301	112.540451	t
3506	80	Pertigaan Padalarang - Purwakarta	-6.842621	107.485031	t
3507	80	Pertigaan Padasuka	-6.868564	107.526291	t
3508	80	Pertigaan Paratag Cisarua KBB	-6.816767	107.555153	t
3509	54	Pertigaan Pasar Pakem	-7.664773	110.419785	t
3510	54	Pertigaan Pasar Pakem	-7.665932	110.419495	t
3511	111	Pertigaan Pejagan	-6.872583	108.885353	t
3512	79	Pertigaan Polsek Ciwidey	-7.153835	107.371887	t
3513	107	Pertigaan Pos Polisi Ajibarang (Jl. Ajibarang Secang)	-7.408767	109.080170	t
3514	119	Pertigaan Prambanan	-7.755197	110.496002	t
3515	160	Pertigaan Purwosari arah Surabaya	-7.796760	112.737083	t
3516	80	Pertigaan Rancabali Padalarang	-6.841327	107.481483	t
3517	121	Pertigaan Semen	-7.624169	110.313965	t
3518	101	Pertigaan Sentral Cimahi	-6.880095	107.553574	t
3519	129	Pertigaan Sukowati (Jl.Ngawi-Solo)	-7.440534	110.981682	t
3520	100	Pertigaan Teluk Pinang (Bogor)	-6.662627	106.856682	t
3521	55	Pertigaan UIN 	-7.783186	110.395096	t
3522	80	Pertigaan UNAI Cisarua	-6.802620	107.579201	t
3523	146	Perum GKA Gresik	-7.159722	112.613319	t
3524	57	Pesanggrahan - Jl. Arjuna Selatan - Jl. Panjang	-6.190059	106.769409	t
3525	57	Pesanggrahan - Kebon Jeruk	-6.184691	106.754112	t
3526	57	Pesing - Grogol	-6.166774	106.788010	t
3527	57	Pesing - Jelambar	-6.162182	106.772285	t
3528	57	Pesing - Jembatan Gantung	-6.162404	106.772575	t
3529	57	Pesing - Roxy	-6.161996	106.771530	t
3530	57	Pesing Arah Grogol	-6.161324	106.771591	t
3531	57	Pesing arah Jl. Tubagus Angke	-6.162180	106.771881	t
3532	57	Pesing-Jl. Panjang 	-6.161654	106.770889	t
3533	57	Pesing-Kebon Jeruk 	-6.161782	106.771149	t
3534	57	Petamburan - Palmerah	-6.188817	106.809616	t
3535	57	Petamburan arah Tanah Abang	-6.188674	106.809593	t
3536	148	Peterongan	-7.540849	112.281113	t
3537	148	Peterongan	-7.520321	112.278191	t
3538	148	Peterongan-Sumobito	-7.540870	112.281708	t
3539	59	Petukangan	-6.229683	106.756554	t
3540	61	Pintu Tol Kamal	-6.122249	106.767242	t
3541	39	Pintu Tol Karang Tengah	-6.196390	106.713722	t
3542	85	Pintu tol Kanci/Palimanan (Kab Cirebon)	-6.785926	108.632210	t
3543	99	Plaza Pondok Gede-Rs Haji	-6.284032	106.911072	t
3544	149	Plemahan	-7.712182	112.150627	t
3545	85	Plered (Jalur Pantura)	-6.703296	108.499390	t
3546	148	Ploso 	-7.441411	112.224358	t
3547	149	Ploso Mojo	-7.920918	111.958755	t
3548	61	Pluit 	-6.126922	106.798828	t
3549	61	Pluit - Ancol - Priok	-6.126836	106.791656	t
3550	61	Pluit - Bandara Soeta	-6.126410	106.793785	t
3551	57	Pluit - Cempaka Putih	-6.147798	106.791344	t
3552	57	Pluit - Gedong Panjang	-6.146016	106.790390	t
3553	61	Pluit - Grogol	-6.126983	106.792267	t
3554	61	Pluit - Tanjung Priok - Kelapa Gading - Cawang	-6.112350	106.785202	t
3555	61	Pluit - Warakas	-6.132448	106.792091	t
3556	61	Pluit arah Jembatan Tiga	-6.127029	106.793419	t
3557	61	Pluit-Bandara 	-6.128058	106.779106	t
3558	61	Pluit-Cawang 	-6.127605	106.792343	t
3559	61	Pluit-Kapuk 	-6.121545	106.784279	t
3560	167	Pogalan	-8.095771	111.751320	t
3561	59	Poin Square arah Lebak Bulus	-6.289481	106.777611	t
3562	59	Polda-Bundaran Senayan 	-6.221700	106.813713	t
3563	178	Polisi Istimewa	-7.280848	112.741806	t
3564	54	Polres Sleman	-7.697393	110.346741	t
3565	97	Polsek Margaasih	-6.934926	107.539543	t
3566	151	Pom Randuagung-Pasar Ranuyoso	-7.915541	113.251106	t
3567	99	Pom bensin Samping Giant Hypermall	-6.250608	106.994087	t
3568	40	Pondok Cabe arah Lb. Bulus	-6.345220	106.765305	t
3569	164	Pondok Candra	-7.343569	112.768135	t
3570	103	Pondok Cina-Lt. Agung 	-6.369382	106.833847	t
3571	147	Pondok Dalem Semboro	-8.145414	113.427704	t
3572	60	Pondok Gede arah Kramat Jati	-6.290307	106.889854	t
3573	59	Pondok Indah	-6.287082	106.779686	t
3574	59	Pondok Indah Mall arah Lebak Bulus	-6.263884	106.783699	t
3575	59	Pondok Indah menuju Gandaria City	-6.263887	106.783424	t
3576	103	Pondok Labu - Fatmawati	-6.314947	106.793343	t
3577	59	Pondok Pinang - Jl. H. Muhi - Jl. Veteran	-6.266533	106.770844	t
3578	59	Pondok Pinang - Tanah Kusir	-6.264531	106.775139	t
3579	59	Pondok Pinang-Fatmawati	-6.265155	106.775154	t
3580	59	Pondok indah-fatmawati	-6.280598	106.781448	t
3581	161	Ponorogo arah Madiun	-7.865019	111.469925	t
3582	152	Ponorogo-Madiun	-7.793125	111.516029	t
3583	39	Poris menuju Kalideres	-6.161746	106.681305	t
3584	164	Porong	-7.541721	112.699150	t
3585	164	Porong - Sidoarjo	-7.521661	112.694748	t
3586	156	Pos Awar-Awar	-7.561397	111.819962	t
3587	156	Pos Awar-awar	-7.561461	111.819687	t
3588	156	Pos Awar-awar	-7.561461	111.820175	t
3589	156	Pos Awar-awar	-7.561376	111.819939	t
3590	156	Pos Jembatan Timbang	-7.582753	111.876373	t
3591	152	Pos Pam Kaligunting Saradan	-7.550761	111.691238	t
3592	157	Pos Pam, Gendingan	-7.388663	111.222923	t
3593	57	Pos Pengumben - Joglo	-6.217465	106.760262	t
3594	57	Pos Pengumben - Permata Hijau	-6.217322	106.761894	t
3595	57	Pos Pengumben menuju Permata Hijau	-6.216358	106.772766	t
3596	111	Pos Polisi Pasar Induk Brebes (Jalur Pantura)	-6.870979	109.039780	t
3597	152	Pos Terpadu Terminal Caruban	-7.550655	111.632896	t
3598	156	Pos Timbangan	-7.582561	111.876823	t
3599	156	Pos Timbangan	-7.582880	111.876892	t
3600	152	Pos Yan RM. Saradan Asri Madiun	-7.552272	111.694244	t
3601	178	Praban - Gentengkali	-7.255864	112.736687	t
3602	58	Pramuka - Matraman	-6.192265	106.868919	t
3603	59	Prapanca arah Blok M	-6.252486	106.808403	t
3604	59	Prapanca arah Jl. Antasari Raya	-6.252545	106.808556	t
3605	178	Prapen	-7.306814	112.761711	t
3606	178	Prapen - Nginden	-7.310938	112.758125	t
3607	131	Pringsewu Tegal	-6.866871	109.198502	t
3608	99	Proyek-St. Bekasi	-6.239495	107.002525	t
3609	60	Prumpung-Cawang	-6.217930	106.884552	t
3610	131	Prupuk	-7.119518	108.986755	t
3611	131	Prupuk - Bumiayu	-7.123782	108.977295	t
3612	131	Prupuk Margasari	-7.122404	108.982666	t
3613	131	Prupuk arah Margasari	-7.122500	108.982391	t
3614	58	Ps. Baru	-6.163745	106.833740	t
3615	60	Ps. Gembrong 	-6.226270	106.880341	t
3616	59	Ps. Minggu - Pancoran	-6.266243	106.844360	t
3617	59	Ps. Minggu - Pd. Labu	-6.299025	106.832275	t
3618	59	Ps. Minggu - Tebet 	-6.282837	106.844597	t
3619	60	Ps. Rebo-TB Simatupang	-6.306874	106.866676	t
3620	178	Pucang Anom	-7.284365	112.756088	t
3621	178	Pucang Anom (Pasar)	-7.284423	112.753113	t
3622	178	Pucang Anom - Pasar Pucang	-7.284349	112.755638	t
3623	178	Pucang Anom - Pucang Adi	-7.283200	112.755890	t
3624	178	Pucang Anom - SMA Mhmdyh	-7.284349	112.759384	t
3625	178	Pucang Anom Timur	-7.284237	112.755875	t
3626	150	Pucuk	-7.097869	112.263062	t
3627	121	Pucung Muntilan	-7.579169	110.280418	t
3628	152	Pugruk Saradan	-7.499068	111.731728	t
3629	154	Pujon - Songgoriti	-7.839468	112.455711	t
3630	60	Pulogadung	-6.182604	106.915512	t
3631	60	Pulogadung - Cakung 	-6.182646	106.915382	t
3632	60	Pulogadung arah Klender	-6.192236	106.905846	t
3633	60	Pulogebang 	-6.206880	106.954758	t
3634	58	Pulomas - Rawamangun 	-6.176865	106.878967	t
3635	84	Puncak	-6.701371	106.993294	t
3636	84	Puncak-Cianjur	-6.712644	107.003639	t
3637	178	Pura Agung - Kedung Cowek - Kenjeran	-7.245386	112.768875	t
3638	125	Purbalingga - Banjarnegara	-7.391100	109.373497	t
3639	57	Puri Kembangan	-6.184598	106.754066	t
3640	57	Puri Kembangan 	-6.180001	106.757271	t
3641	57	Puri Kembangan - Jl. Daan Mogot	-6.179681	106.757294	t
3642	57	Puri Kembangan - Pesanggrahan	-6.184625	106.754082	t
3643	57	Puri kembangan	-6.191115	106.751381	t
3644	131	Purwahamba Indah (Jalur Pantura)	-6.873414	109.257034	t
3645	160	Purwodadi	-7.806944	112.729790	t
3646	114	Purwodadi arah ke Blora di Bundaran Getas	-7.071344	110.918114	t
3647	107	Purwokerto arah Solo	-7.424999	109.229897	t
3648	160	Purwosari	-7.797079	112.736938	t
3649	160	Purwosari	-7.772237	112.745796	t
3650	160	Purwosari	-7.757663	112.733826	t
3651	160	Purwosari-Jembatan Layang Lawang	-7.764806	112.739426	t
3652	160	Purwosari-Singosari	-7.765508	112.740410	t
3653	147	Pusat Kota	-8.169629	113.702827	t
3654	79	Putaran 1 Cileunyi	-6.942812	107.753304	t
3655	178	Putaran Menur	-7.287467	112.763672	t
3656	97	Putaran Pikiran Rakyat (PR), Soekarno Hatta	-6.937791	107.581245	t
3657	97	Putaran SPBU Kebon Kopi	-6.902910	107.564499	t
3658	178	Putro Agung	-7.247283	112.768929	t
3659	178	Putro Agung 	-7.247706	112.769592	t
3660	178	Putro Agung Wetan	-7.245790	112.769035	t
3662	146	R.A. Kartini	-7.168621	112.646553	t
3663	178	RA Kartini	-7.278251	112.730797	t
3664	178	RA Kartini - Diponegoro	-7.278442	112.729599	t
3665	54	RR Kentungan - Solo	-7.754810	110.383339	t
3666	58	RS Tarakan 	-6.171276	106.810303	t
3667	119	RSU Dr. Soeradji Jl. Solo - Yogya	-7.715138	110.588829	t
3668	52	RSU Pelita Husada	-7.988693	110.632095	t
3669	162	RSUD Tongas - Banyuwangi	-7.733658	113.115044	t
3670	59	Radio Dalam	-6.254736	106.790390	t
3671	99	Raffles Hills Cibubur arah Cileungsi	-6.375801	106.903763	t
3672	59	Ragunan 	-6.306320	106.825500	t
3673	96	Rajapolah - Ciawi	-7.223733	108.190163	t
3674	96	Rajapolah - Nagreg	-7.223112	108.190208	t
3675	178	Rajawali - Indrapura	-7.234264	112.730713	t
3676	178	Rajawali - Tanjung Perak	-7.232444	112.728569	t
3677	147	Rambipuji	-8.210216	113.602127	t
3678	79	Rancajigang - Wangisagara	-7.076948	107.739609	t
3679	178	Rangkah	-7.249345	112.760559	t
3680	178	Rangkah SPBU	-7.244173	112.761566	t
3681	151	Ranuyoso	-7.950118	113.260201	t
3682	59	Rasuna Said (KPK)	-6.212314	106.830505	t
3683	59	Ratu Plaza-Benhil 	-6.227081	106.801682	t
3684	57	Rawa Belong arah Palmerah	-6.206638	106.783234	t
3685	40	Rawa Buntu - Taman Tekno BSD	-6.308154	106.673340	t
3686	60	Rawamangun 	-6.196768	106.882851	t
3687	60	Rawamangun - Cawang	-6.196928	106.876671	t
3688	60	Rawamangun - Cempaka Putih	-6.197003	106.877831	t
3689	60	Rawamangun - Pulomas	-6.196939	106.877335	t
3690	58	Rawasari-Rawamangun 	-6.185185	106.872986	t
3691	178	Raya Arjuno	-7.259371	112.727173	t
3692	164	Raya Bandara	-7.370000	112.768112	t
3693	164	Raya Betro	-7.389259	112.754166	t
3694	164	Raya Buduran	-7.400217	112.727257	t
3695	178	Raya Darmo	-7.283124	112.740112	t
3696	178	Raya Darmo (Hotel Mercure)	-7.284980	112.739784	t
3697	178	Raya Darmo (KBS)	-7.297705	112.738823	t
3698	178	Raya Darmo - A. Yani	-7.293661	112.739235	t
3699	178	Raya Darmo - Dr Soetomo	-7.296875	112.739235	t
3700	178	Raya Darmo - Urip Sumoharjo	-7.277300	112.741241	t
3701	178	Raya Darmo Bungkul	-7.291213	112.739006	t
3702	178	Raya Darmo Harapan	-7.269694	112.687302	t
3703	178	Raya Darmo KBS	-7.296957	112.739143	t
3704	178	Raya Dinoyo	-7.280515	112.744621	t
3705	178	Raya Diponegoro	-7.290553	112.736229	t
3706	178	Raya Dupak	-7.245237	112.727325	t
3707	178	Raya Gubeng	-7.271972	112.748909	t
3708	164	Raya Juanda	-7.374719	112.728943	t
3709	178	Raya Kalirungkut	-7.316498	112.766846	t
3710	178	Raya Kendangsari	-7.322713	112.745453	t
3711	164	Raya Kletek - Surabaya	-7.359126	112.683891	t
3712	164	Raya Legundi	-7.402026	112.577942	t
3713	174	Raya Malang - Semeru	-7.976480	112.629410	t
3714	174	Raya Malang - Welirang	-7.975120	112.629616	t
3715	178	Raya Mastrip - Wiyung	-7.312921	112.709564	t
3716	178	Raya Menganti	-7.309602	112.677284	t
3717	178	Raya Menur - Karangmenjangan	-7.274819	112.762459	t
3718	178	Raya Ngagel arah Wonokromo	-7.300046	112.740005	t
3719	178	Raya Ngasinan arah Benowo	-7.236978	112.604881	t
3720	164	Raya Pulungan	-7.394153	112.767426	t
3721	178	Raya Taman Sidoarjo	-7.345782	112.720245	t
3722	164	Raya Tropodo	-7.357487	112.764984	t
3723	164	Raya Trosobo	-7.376363	112.641769	t
3724	164	Raya Waru	-7.372317	112.728203	t
3725	148	Rel KA Bandar Kedungmulyo	-7.575755	112.144081	t
3726	152	Rel KA Wadukan	-7.484665	111.660446	t
3727	164	Rel Kereta Aloha	-7.372606	112.729118	t
3728	127	Rembang - Tuban	-6.756776	111.693466	t
3729	121	Rest Area Bambu Runcing	-7.575396	110.271896	t
3730	81	Rest Area KM 19	-6.269299	107.036224	t
3731	92	Rest Area KM 72A	-6.464441	107.442963	t
3732	87	Rest area Tol Cipali KM 130	-6.576205	107.960693	t
3733	55	Ring Road Barat	-7.766018	110.335350	t
3734	54	Ring Road Barat	-7.787704	110.330803	t
3735	54	Ring Road Selatan YK	-7.806072	110.324890	t
3736	54	Ring Road Utara	-7.759045	110.402878	t
3737	55	RingRoad Timur - Jl. Janti	-7.797175	110.409981	t
3738	121	Ringroad Barat	-7.571423	110.260429	t
3739	178	Romokalisari	-7.199065	112.645958	t
3740	178	Romokalisari-TOW	-7.211029	112.645309	t
3741	57	Roxy	-6.166249	106.798386	t
3742	57	Roxy - Gajahmada	-6.165985	106.801872	t
3743	57	Roxy - Pesing	-6.166049	106.801704	t
3744	57	Roxy -Tenabang 	-6.167308	106.802452	t
3745	57	Roxy Mas - Grogol	-6.166085	106.804756	t
3746	57	Roxy Mas - Jl. Gajah Mada	-6.166732	106.802383	t
3747	57	Rs. Darmais-Slipi	-6.187169	106.797256	t
3748	164	Rungkut - Pondok Candra	-7.341925	112.767929	t
3749	178	Rungkut Industri	-7.329741	112.751701	t
3750	164	Rungkut Madya	-7.331651	112.781570	t
3751	178	Rungkut industri	-7.335503	112.754768	t
3752	174	S.P.Sudarmo	-7.943772	112.648193	t
3753	94	SMPN 3 Pelabuhan Ratu	-6.979634	106.547287	t
3754	124	SPBU Alun-alun Kota	-6.889889	109.379799	t
3755	178	SPBU Citra Land	-7.300578	112.662392	t
3756	140	SPBU Muri Tegal	-6.862117	109.164406	t
3757	80	SPN Cisarua	-6.811121	107.560120	t
3758	99	ST Cakung-Kranji	-6.218996	106.952057	t
3759	92	Sadang (Simpang Tol)	-6.508643	107.460663	t
3760	137	Salatiga - Malang	-7.364649	110.513931	t
3761	137	Salatiga arah ke Semarang	-7.294323	110.474693	t
3762	96	Salawu - Singaparna	-7.376529	107.987106	t
3763	96	Salawu arah ke Garut	-7.365604	107.999695	t
3764	58	Salemba - Matraman	-6.195210	106.849991	t
3765	160	Sampoerna - Surabaya	-7.690087	112.709190	t
3766	160	Sampoerna Pandaan	-7.691120	112.709312	t
3767	55	Samsat Kota Yogyakarta	-7.787720	110.359177	t
3768	152	Saradan	-7.498600	111.736427	t
3769	152	Saradan	-7.499068	111.732437	t
3770	152	Saradan - Surabaya	-7.497834	111.739586	t
3771	152	Saradan Arah Wilangan	-7.498877	111.732971	t
3772	156	Saradan arah Wilangan	-7.558993	111.802238	t
3773	58	Sarinah	-6.187580	106.823120	t
3774	58	Sarinah - Bundaran Hotel Indonesia	-6.187429	106.823128	t
3775	58	Sarinah - Semanggi	-6.187351	106.823128	t
3776	57	Sawah Besar 	-6.161590	106.826332	t
3777	103	Sawangan	-6.394992	106.798439	t
3778	121	Sawangan	-7.535903	110.324570	t
3779	57	Season City	-6.151841	106.794708	t
3780	178	Sebrang Ispatindo	-7.254880	112.720329	t
3781	94	Sekarwangi - Pasar Cibadak (Sukabumi)	-6.909525	106.781555	t
3782	60	Sekitar Terminal Pulo Gadung	-6.182384	106.910133	t
3783	57	Sekitar Tomang	-6.178068	106.798508	t
3784	99	Sekitaran BUPERTA Cibubur	-6.370655	106.896156	t
3785	103	Sekitaran Cibubur Junction	-6.369925	106.893394	t
3786	58	Sekitaran Karet Bivak (Jakarta Pusat)	-6.201310	106.815590	t
3787	60	Sekitaran Kuburan Cina Kebon Nanas	-6.231483	106.878296	t
3788	58	Semanggi	-6.218513	106.813652	t
3789	58	Semanggi (Hotel Sultan)	-6.217694	106.810966	t
3790	58	Semanggi - Bundaran Senayan	-6.218566	106.813614	t
3791	58	Semanggi - Cawang	-6.218036	106.811165	t
3792	59	Semanggi - Pluit	-6.221513	106.813675	t
3793	58	Semanggi Jalur Bawah	-6.219505	106.812439	t
3794	58	Semanggi arah Dukuh Atas	-6.217547	106.814560	t
3795	59	Semanggi arah Slipi	-6.221456	106.813545	t
3796	58	Semanggi menuju Bendungan Hilir	-6.217570	106.814545	t
3797	114	Semarang - Purwodadi	-7.049881	110.603180	t
3798	138	Semarang - Tuban - Lamongan	-6.956878	110.453377	t
3799	138	Semarang - Ungaran	-7.014563	110.418007	t
3800	138	Semarang arah ke Batang	-6.985205	110.357193	t
3801	178	Sememi - Benowo	-7.247323	112.637733	t
3802	178	Sememi Kendung	-7.240064	112.636597	t
3803	178	Semeni	-7.246440	112.636559	t
3804	178	Semolowaru	-7.290915	112.779785	t
3805	178	Semolowaru - MERR	-7.302089	112.786354	t
3806	178	Semolowaru Utara	-7.297487	112.779564	t
3807	61	Semper-Serpong	-6.128266	106.930191	t
3808	58	Senayan - Gatot Subroto - Slipi	-6.217556	106.810875	t
3809	58	Senayan - Slipi	-6.212042	106.806847	t
3810	59	Senayan City - Jl. Asia Afrika - Gerbang Pemuda	-6.222546	106.798134	t
3811	59	Senayan arah Semanggi	-6.224649	106.805199	t
3812	59	Senayan-Cawang 	-6.224734	106.804916	t
3813	59	Senayan-Sudirman 	-6.225758	106.803673	t
3814	58	Senen	-6.199286	106.853798	t
3815	58	Senen arah Galur	-6.178050	106.842598	t
3816	58	Senen arah Salemba	-6.181691	106.842880	t
3817	174	Sengkaling arah Batu	-7.914860	112.586128	t
3818	59	Senopati - Tendean 	-6.232008	106.810371	t
3819	82	Sentul arah Cawang	-6.501411	106.867271	t
3820	82	Sentul-Cimanggis 	-6.534946	106.851830	t
3821	178	Sepanjang	-7.340547	112.703400	t
3822	178	Sepanjang Kedung Cowek	-7.223226	112.776375	t
3823	103	Seputar Terminal Depok Margonda	-6.391740	106.824661	t
3824	60	Seputar Traffic Light (TL) Cijantung	-6.311390	106.862541	t
3825	103	Seputaran GDC arah Margonda	-6.410434	106.816689	t
3826	178	Seputaran Grand City	-7.263490	112.751228	t
3827	60	Serpong-Kp. Rambutan	-6.307386	106.876328	t
3828	59	Serpong-Pd. Indah 	-6.267438	106.768036	t
3829	164	Sidoarjo - Gedangan	-7.393472	112.727730	t
3830	164	Sidoarjo - Surabaya	-7.384790	112.728264	t
3831	164	Sidoarjo Kota	-7.448135	112.700996	t
3832	178	Sidosermo	-7.304005	112.750130	t
3833	153	Sidowayah	-7.603512	111.330582	t
3834	153	Sidowayah Arus dari Barat maupun Timur	-7.602129	111.328400	t
3835	178	Sier - Kendangsari	-7.323106	112.745354	t
3836	178	Simo Gunung	-7.269551	112.711586	t
3837	178	Simokerto	-7.239447	112.753670	t
3838	178	Simokerto - Kapasan	-7.240360	112.753090	t
3839	178	Simokerto Kapasari	-7.240144	112.753311	t
3840	156	Simpang 3 - Nganjuk	-7.601385	112.112862	t
3841	165	Simpang 3 AB Alun-alun	-7.706420	114.004547	t
3842	153	Simpang 3 Air Mancur Arah Kota	-7.626460	111.431343	t
3843	165	Simpang 3 Asembagus	-7.749732	114.217361	t
3844	165	Simpang 3 Basuki Rahmat	-7.704081	114.010254	t
3845	154	Simpang 3 Bentoel	-7.915753	112.654366	t
3846	164	Simpang 3 Berbek	-7.349484	112.763252	t
3847	161	Simpang 3 Carat arah Mangkujayan	-7.865906	111.424088	t
3848	96	Simpang 3 Cigalontang - Singaparna	-7.354806	108.098259	t
3849	147	Simpang 3 Gatsu	-8.172878	113.703712	t
3850	178	Simpang 3 Geluran	-7.357062	112.691147	t
3851	159	Simpang 3 Goyang Lidah	-7.036242	113.499817	t
3852	167	Simpang 3 Jarakan	-8.076481	111.706062	t
3853	143	Simpang 3 Jl Cempaka	-8.061822	112.062904	t
3854	154	Simpang 3 Karanglo	-7.897517	112.664558	t
3855	154	Simpang 3 Karanglo arah Surabaya	-7.915732	112.655006	t
3856	153	Simpang 3 Karangrejo	-7.558781	111.425804	t
3857	164	Simpang 3 Kletek	-7.359104	112.681068	t
3858	153	Simpang 3 Maospati	-7.554420	111.426712	t
3859	153	Simpang 3 Maospati arah Ngawi-Solo	-7.579849	111.424828	t
3860	178	Simpang 3 Medaeng	-7.350925	112.710938	t
3861	149	Simpang 3 Mengkreng	-7.652704	112.093872	t
3862	156	Simpang 3 Mengkreng	-7.600491	112.113251	t
3863	149	Simpang 3 Mengkreng	-7.651896	112.094940	t
3864	149	Simpang 3 Mengkreng	-7.650365	112.096169	t
3865	149	Simpang 3 Mengkreng	-7.609127	112.152061	t
3866	149	Simpang 3 Mengkreng	-7.651152	112.095222	t
3867	156	Simpang 3 Mengkreng	-7.610381	112.109962	t
3868	156	Simpang 3 Mengkreng 	-7.600279	112.113548	t
3869	156	Simpang 3 Mengkreng	-7.638136	112.100845	t
3870	150	Simpang 3 Mira Babat	-7.100786	112.177597	t
3871	148	Simpang 3 Mojoagung	-7.565702	112.328110	t
3872	153	Simpang 3 Ngerong	-7.680392	111.234535	t
3873	153	Simpang 3 Ngerong 	-7.684496	111.250931	t
3874	160	Simpang 3 Ngopak	-7.699807	112.977455	t
3875	169	Simpang 3 Ngujang	-8.028932	111.918839	t
3876	174	Simpang 3 PDAM	-7.951053	112.667152	t
3877	174	Simpang 3 PDAM	-7.950628	112.667259	t
3878	165	Simpang 3 Pasar Asembagus	-7.749711	114.217667	t
3879	148	Simpang 3 Polsek Mojoagung	-7.610998	112.368340	t
3880	148	Simpang 3 Polsek Mojoagung	-7.610817	112.368111	t
3881	160	Simpang 3 Purwosari	-7.771823	112.746246	t
3882	147	Simpang 3 Rambi puji	-8.204970	113.611359	t
3883	147	Simpang 3 Rambipuji	-8.209961	113.602173	t
3884	96	Simpang 3 Rancamaya Singaparna	-7.345304	108.129074	t
3885	165	Simpang 3 SMKN 2 Situbondo	-7.705995	114.005981	t
3886	165	Simpang 3 SMKN 2 Situbondo	-7.705952	114.006027	t
3887	147	Simpang 3 Trunojoyo	-8.364096	113.754547	t
3888	151	Simpang 3 Wonorejo	-8.078627	113.237740	t
3889	153	Simpang 3 arah Ngawi-Solo	-7.558781	111.425804	t
3890	153	Simpang 3 tadion	-7.653789	111.334610	t
3891	156	Simpang 4 A. Yani	-7.599853	111.900154	t
3892	156	Simpang 4 Ahmad Yani dalam kota	-7.600257	111.901222	t
3893	167	Simpang 4 Bendorejo	-8.094878	111.748466	t
3894	165	Simpang 4 Besuki	-7.743630	113.695259	t
3895	165	Simpang 4 Besuki	-7.735083	113.690796	t
3896	148	Simpang 4 Braan Bandar Kedungmulyo	-7.585805	112.138512	t
3897	153	Simpang 4 Bulu	-7.634138	111.430077	t
3898	146	Simpang 4 Duduksampeyan	-7.169366	112.585915	t
3899	146	Simpang 4 Duduksampeyan	-7.155229	112.521545	t
3900	167	Simpang 4 Durenan	-8.088696	111.713577	t
3901	167	Simpang 4 Durenan	-8.121369	111.799126	t
3902	141	Simpang 4 Jl Joko Tole	-7.024913	112.749832	t
3903	169	Simpang 4 Karangrejo	-7.998186	111.895111	t
3904	167	Simpang 4 Kedunglurah	-8.114008	111.775238	t
3905	156	Simpang 4 Kertosono	-7.601406	112.104065	t
3906	156	Simpang 4 Kertosono	-7.584305	112.081146	t
3907	142	Simpang 4 Lateng - Sukowidi	-8.233322	114.360756	t
3908	156	Simpang 4 Lengkong	-7.590644	112.101379	t
3909	147	Simpang 4 Mangli	-8.190443	113.650879	t
3910	96	Simpang 4 Mangunreja, Singaparna, Tasikmalaya	-7.365606	108.101791	t
3911	149	Simpang 4 Mengkreng	-7.652534	112.094040	t
3912	149	Simpang 4 Mengkreng	-7.652236	112.094360	t
3913	96	Simpang 4 Muktamar, Singaparna	-7.345027	108.125992	t
3914	144	Simpang 4 Pasar Sumberejo	-7.177179	112.000725	t
3915	153	Simpang 4 Rani puri	-7.655299	111.327576	t
3916	164	Simpang 4 Sedati 	-7.389556	112.756401	t
3917	155	Simpang 4 Trowulan	-7.564566	112.364128	t
3918	149	Simpang 4 kandangan	-7.756706	112.281708	t
3919	97	Simpang 5 Bandung	-6.922422	107.617668	t
3920	175	Simpang 5 Kenanten	-7.493313	112.445282	t
3921	164	Simpang 5 Krian	-7.410713	112.578674	t
3922	164	Simpang Abdul Karim	-7.338451	112.768272	t
3923	93	Simpang Andalas	-6.567521	107.756470	t
3924	101	Simpang Armed arah Tol Baros	-6.892461	107.536865	t
3925	80	Simpang Baloper Padalarang	-6.839889	107.478462	t
3926	94	Simpang Batu Sapi 	-6.997599	106.556557	t
3927	101	Simpang Blok C, Cihanjuang	-6.869422	107.558746	t
3928	146	Simpang Boboh	-7.249751	112.560905	t
3929	178	Simpang Bubutan - Tembaan	-7.247153	112.736847	t
3930	82	Simpang Cagak, Gunung Putri	-6.462437	106.890617	t
3931	80	Simpang Caringin, Padalarang	-6.856394	107.498528	t
3932	93	Simpang Ciasem (Subang-Karawang)	-6.340544	107.663864	t
3933	100	Simpang Ciawi	-6.655791	106.847168	t
3934	97	Simpang Cibaduyut - Soekarno Hatta (ByPass)	-6.947461	107.595177	t
3935	97	Simpang Cibaduyut Lama	-6.948622	107.594231	t
3936	79	Simpang Cibaduyut Sayuran	-6.972797	107.590820	t
3937	94	Simpang Cidahu	-6.765228	106.725853	t
3938	101	Simpang Cihanjuang	-6.878071	107.549416	t
3939	82	Simpang Ciherang, Bogor	-6.574990	106.740837	t
3940	97	Simpang Cijawura	-6.944373	107.649040	t
3941	97	Simpang Cikapayang - Dago	-6.899078	107.612686	t
3942	79	Simpang Cikoneng Bojongsoang	-6.994159	107.642380	t
3943	79	Simpang Cileunyi	-6.941891	107.755173	t
3944	101	Simpang Cimahi Mall	-6.878715	107.539909	t
3945	80	Simpang Cimareme Indah	-6.861933	107.501610	t
3946	97	Simpang Cimindi	-6.896517	107.560410	t
3947	101	Simpang Cimindi - Gunung Batu	-6.895148	107.559814	t
3948	84	Simpang Ciranjang Cianjur	-6.813603	107.250084	t
3949	101	Simpang Cisangkan	-6.870487	107.535599	t
3950	101	Simpang Citeureup	-6.861294	107.544594	t
3951	97	Simpang Ciwaruga	-6.850142	107.581276	t
3952	97	Simpang Dago Cikapayang	-6.898745	107.612793	t
3953	178	Simpang Darmo - Bengawan	-7.289776	112.738892	t
3954	178	Simpang Dharmawangsa - Airlangga	-7.270492	112.756447	t
3955	178	Simpang Dinoyo - Keputran - Pandegiling	-7.277831	112.743240	t
3956	178	Simpang Dinoyo - Polisi Istimewa	-7.279837	112.743942	t
3957	178	Simpang Diponegoro - Ciliwung	-7.292272	112.737259	t
3958	178	Simpang Diponegoro - Dr. Soetomo	-7.284423	112.733505	t
3959	178	Simpang Diponegoro - Kartini	-7.278059	112.729172	t
3960	146	Simpang Duduksampeyan	-7.154463	112.520515	t
3961	98	Simpang Empat (Alun-Alun Kota Banjar)	-7.369282	108.541939	t
3962	146	Simpang Empat Duduk Sampeyan 	-7.153425	112.518456	t
3963	164	Simpang Empat McD	-7.369436	112.763191	t
3964	178	Simpang Flyover Wonokromo	-7.303920	112.736526	t
3965	97	Simpang GT Buah Batu	-6.961961	107.638580	t
3966	80	Simpang Gedong 5 Padalarang	-6.847713	107.491760	t
3967	178	Simpang Jagalan	-7.248350	112.746712	t
3968	178	Simpang Jagir	-7.300730	112.739899	t
3969	101	Simpang Jati serut	-6.873081	107.555443	t
3970	178	Simpang Jl. Dr. Ir. H. Sukarno - Kenjeran	-7.250261	112.784142	t
3971	80	Simpang Jl. H. Gofur	-6.868399	107.523254	t
3972	97	Simpang Jl. Holis - Jl. Caringin	-6.939910	107.568542	t
3973	101	Simpang Jl. Pesantren	-6.887961	107.555428	t
3974	178	Simpang Jl. Raya Darmo - Pandegiling	-7.277517	112.741257	t
3975	146	Simpang Jl. Raya Morowudi - Boboh	-7.250048	112.560852	t
3976	97	Simpang Jl. Riau - Jl. Cihapit	-6.907596	107.623314	t
3977	97	Simpang Jl. Soekarno Hatta - waas	-6.949570	107.626091	t
3978	97	Simpang Jl. Trunojoyo	-6.906979	107.612595	t
3979	178	Simpang Joyoboyo - Raya Darmo	-7.298386	112.737640	t
3980	79	Simpang Kamasan, Banjaran	-7.034592	107.545807	t
3981	178	Simpang Kapasari - Simokerto - Kenjeran	-7.240778	112.752968	t
3982	138	Simpang Karangayu	-6.981617	110.395241	t
3983	103	Simpang Kartini - Margonda	-6.399162	106.819756	t
3984	103	Simpang Kartini arah Dewi Sartika dan Margonda Raya	-6.399944	106.818939	t
3985	157	Simpang Kartonyono	-7.411069	111.443230	t
3986	97	Simpang Kebon Kawung	-6.912368	107.598007	t
3987	97	Simpang Kebon Kopi	-6.904984	107.565559	t
3988	58	Simpang Kebon Sirih - Thamrin	-6.183254	106.823128	t
3989	178	Simpang Kejeran - Tambakrejo	-7.242683	112.759293	t
3990	178	Simpang Kenjeran - Kedung Cowek	-7.245278	112.768860	t
3991	178	Simpang Kertajaya - Dharmawangsa	-7.278613	112.755585	t
3992	178	Simpang Kertajaya Indah - Merr	-7.278421	112.755943	t
3993	178	Simpang Klampis Jaya	-7.289564	112.775284	t
3994	178	Simpang Kusuma Bangsa - Ambengan	-7.256178	112.750435	t
3995	178	Simpang Kusuma Bangsa - Kapasari	-7.249111	112.750282	t
3996	178	Simpang Kusuma Bangsa - Ngaglik	-7.248909	112.750511	t
3997	150	Simpang Lamongrejo (Tugu Adipura)	-7.112465	112.417435	t
3998	110	Simpang Lima Boyolali	-7.532037	110.601585	t
3999	79	Simpang Lingkar Nagrek	-7.021047	107.889275	t
4000	100	Simpang Lotte Mart Taman Yasmin	-6.556093	106.779007	t
4001	178	Simpang MERR - Kedung Baruk	-7.311390	112.780602	t
4002	178	Simpang MERR - Kertajaya	-7.279342	112.762276	t
4003	178	Simpang MERR - Semolowaru	-7.301238	112.781769	t
4004	178	Simpang Margomulyo - Kalianak	-7.230762	112.682816	t
4005	178	Simpang Mayjend Sungkono - Dukuh Kupang	-7.288276	112.707085	t
4006	97	Simpang Melong blok 4	-6.919831	107.560707	t
4007	178	Simpang Menur - Kertajaya	-7.278814	112.762306	t
4008	178	Simpang Merr Koni	-7.263628	112.783089	t
4009	178	Simpang Merr-Mulyorejo	-7.311943	112.780518	t
4010	88	Simpang Mutiara (Karawang)	-6.408726	107.485527	t
4011	99	Simpang Nagrak Cikeas	-6.386879	106.939308	t
4012	178	Simpang Ngagel - Dinoyo BAT	-7.288787	112.744255	t
4013	178	Simpang Ngagel BAT	-7.291298	112.747063	t
4014	178	Simpang Pahlawan-Kebonrejo	-7.243130	112.739471	t
4015	97	Simpang Pal 3 Sudirman	-6.917289	107.574371	t
4016	97	Simpang Pasar Andir	-6.916160	107.587578	t
4017	138	Simpang Pasar Gayamsari	-7.002444	110.448692	t
4018	82	Simpang Pemda Cibinong	-6.481055	106.822861	t
4019	59	Simpang Pondok Indah	-6.263594	106.783546	t
4020	178	Simpang Prof. Dr. Mustopo - Dharmawangsa	-7.265898	112.756660	t
4021	178	Simpang Pucang Adi-Pucang Anom	-7.283232	112.756271	t
4022	178	Simpang Pucang Anom	-7.284381	112.755852	t
4023	178	Simpang Pucang Anom	-7.284326	112.755829	t
4024	160	Simpang Purwosari - Pasuruan	-7.771631	112.746162	t
4025	160	Simpang Purwosari - Surabaya	-7.771882	112.745865	t
4026	178	Simpang Putro Agung - Kedung Cowek	-7.245748	112.768974	t
4027	103	Simpang RTM Kelapa Dua	-6.354975	106.842804	t
4028	100	Simpang Rancamaya	-6.662583	106.844940	t
4029	100	Simpang Rawi	-6.655486	106.859123	t
4030	178	Simpang Raya Darmo - Diponegoro	-7.295534	112.739235	t
4031	178	Simpang Raya Kertajaya - Dharmawangsa	-7.278278	112.755844	t
4032	97	Simpang Samsat Bandung	-6.946460	107.641808	t
4033	164	Simpang Sedati	-7.381364	112.762062	t
4034	173	Simpang Sleko - Mayjend Sungkono	-7.639497	111.517494	t
4035	79	Simpang Sukamenak Kopo	-6.966578	107.575912	t
4036	39	Simpang TL Jl. Jend. Sudirman Raya Tangerang	-6.185219	106.643005	t
4037	80	Simpang Tagog Padalarang	-6.842893	107.484879	t
4038	80	Simpang Tagog Padalarang arah Cianjur	-6.842909	107.484772	t
4039	80	Simpang Tagog Padalarang arah Tol	-6.842962	107.484978	t
4040	82	Simpang Taman Safari	-6.687417	106.940025	t
4041	81	Simpang Tanjung Pura	-6.276698	107.274178	t
4042	178	Simpang Tanjungsari	-7.260808	112.692162	t
4043	178	Simpang Tembok Dukuh - Semarang 	-7.255913	112.727631	t
4044	178	Simpang Terminal Bratng-Semolowaru	-7.299386	112.761566	t
4046	178	Simpang Tiga Jemursari	-7.327278	112.734566	t
4047	178	Simpang Tiga Ngagel	-7.293639	112.755203	t
4048	131	Simpang Tiga Paku Laut - Kali Gayam	-7.111262	108.994614	t
4049	96	Simpang Tiga Warung Legok - Singaparna	-7.356870	108.110245	t
4050	100	Simpang Tol Ciawi Bogor	-6.655869	106.847145	t
4051	85	Simpang Tol Plumbon	-6.700795	108.484093	t
4052	178	Simpang Waru - Medaeng	-7.355652	112.729057	t
4053	178	Simpang Wonokromo Jagir	-7.300897	112.740387	t
4054	178	Simpang nginden - Prapen - Panjang jiwo	-7.306537	112.761696	t
4055	150	Simpang tiga Babat - Tuban - Bojonegoro	-7.100768	112.177391	t
4056	155	Simpang tiga Klenteng Mojosari	-7.515662	112.558105	t
4057	155	Simpang tiga Polsek Mojoagung	-7.569687	112.338684	t
4058	95	Simpang tiga Sindang Kasih	-6.821529	107.984612	t
4059	92	Simpang tol Sadang	-6.497158	107.443832	t
4060	153	Simpang4 TL Selosari	-7.652683	111.313812	t
4061	138	Simpangan Jl. Soekarno Hatta arah ke Jl. Fatmawati (Semarang)	-7.010704	110.471916	t
4062	103	Simpangan Margonda-Juanda	-6.376953	106.831917	t
4063	138	Simpangan Tambak Aji (Semarang)	-6.985737	110.340721	t
4064	59	Simprug - Patal Senayan	-6.223411	106.792534	t
4065	59	Simprug - Pd. Indah	-6.230707	106.787407	t
4066	83	Sindang kasih (Simpang Sindang Kasih)	-7.303962	108.245865	t
4067	55	Sindu Kusuma Edu Park YK	-7.766991	110.353470	t
4068	96	Singaparna arah ke Garut	-7.350887	108.104485	t
4069	154	Singosari	-7.897029	112.664688	t
4070	154	Singosari	-7.885976	112.670998	t
4071	154	Singosari	-7.883702	112.672523	t
4072	154	Singosari arah Karanglo	-7.883213	112.672951	t
4073	154	Singosari arah Surabaya	-7.885487	112.671532	t
4074	154	Singosari-Malang	-7.885328	112.671585	t
4075	178	Siola - Praban	-7.255861	112.737251	t
4076	178	Siwalankerto - A. Yani	-7.337397	112.730057	t
4077	54	Sleman Std Tridadi - Kabupaten	-7.722134	110.358482	t
4078	57	Slipi - Kemanggisan 	-6.201056	106.799210	t
4079	58	Slipi - Semanggi	-6.214311	106.809235	t
4080	57	Slipi - Tanah Abang	-6.189174	106.803741	t
4082	57	Slipi arah Tomang	-6.200315	106.798759	t
4083	57	Slipi-Semanggi 	-6.201419	106.799858	t
4084	174	Soekarno Hatta	-7.938841	112.630241	t
4085	111	Songgom-Purwokerto	-7.029215	109.000900	t
4086	170	Songgoriti arah Batu	-7.864360	112.500130	t
4087	154	Songsong - Pasar Lawang	-7.875540	112.677521	t
4088	79	Soreang arah ke Ciwidey	-7.031623	107.506355	t
4089	144	Sraturejo, Baureno Bojonegoro	-7.140624	112.080856	t
4090	57	Srengseng	-6.205899	106.758423	t
4091	58	St. Cikini	-6.198304	106.840858	t
4092	58	St. Senen 	-6.175350	106.844917	t
4093	150	Stadion Surajaya Lamongan	-7.114775	112.429268	t
4094	82	Stasiun Bojong Gede, Bogor	-6.493533	106.794777	t
4095	59	Stasiun Cawang 	-6.241884	106.858208	t
4096	139	Stasiun Kereta Api Purwosari (Solo)	-7.562204	110.795807	t
4097	178	Stasiun Kota	-7.242688	112.743172	t
4098	178	Stasiun Kota - Bongkaran	-7.242523	112.741409	t
4099	59	Stasiun Lenteng Agung arah Pasar Minggu	-6.330711	106.834412	t
4100	58	Stasiun Palmerah arah Pejompongan	-6.207174	106.797287	t
4101	58	Stasiun Palmerah arah Simprug	-6.207587	106.797585	t
4102	58	Stasiun Palmerah arah ke Patal Senayan	-6.207632	106.797569	t
4103	59	Stasiun Pasar Minggu 	-6.283776	106.844383	t
4104	59	Stasiun Pondok Ranji	-6.275885	106.745529	t
4105	39	Stasiun Poris	-6.169825	106.679932	t
4106	139	Stasiun Solojebres	-7.562434	110.839340	t
4107	40	Stasiun Sudimara	-6.296381	106.712868	t
4108	58	Stasiun Sudirman	-6.202635	106.823799	t
4109	59	Stasiun Tanjung Barat - Pasar Rebo	-6.303685	106.839439	t
4110	59	Stasiun Tebet	-6.226214	106.858383	t
4111	59	Stasiun Tj. Barat	-6.308346	106.838417	t
4112	178	Stasiun kota - Kebon rojo	-7.242941	112.739906	t
4113	93	Subang arah Jawa Tengah 	-6.568329	107.762833	t
4114	58	Sudirman	-6.211167	106.820412	t
4115	59	Sudirman (Plaza Bapindo)	-6.223662	106.807060	t
4116	164	Sukodono	-7.389897	112.726959	t
4117	178	Sukomanunggal	-7.266353	112.700439	t
4081	57	Slipi arah Semanggi	-6.200976	106.799583	t
4118	156	Sukomoro	-7.603341	111.957726	t
4119	160	Sukorejo	-7.720276	112.719398	t
4120	160	Sukorejo-Malang	-7.733403	112.725433	t
4121	178	Sulawesi - Keputeran	-7.277176	112.744370	t
4122	178	Sulawesi - Raya Gubeng	-7.277241	112.749992	t
4123	178	Sumatera	-7.269141	112.750000	t
4124	178	Sumatera - Pemuda	-7.266688	112.751274	t
4125	99	Sumber Artha	-6.249542	106.945724	t
4126	95	Sumedang arah ke Bandung	-6.858099	107.921532	t
4127	159	Sumenep - Surabaya	-7.154910	113.506256	t
4128	99	Summarecon - Jl. Perjuangan 	-6.225012	107.002502	t
4129	36	Summarecon Mall Serpong 	-6.240028	106.630058	t
4130	107	Sumpiuh	-7.613359	109.368706	t
4131	61	Sunter - Cempaka Putih - Rawamangun - Jatinegara - Pedati - Cawang	-6.150113	106.887253	t
4132	61	Sunter - Kelapa Gading	-6.150230	106.887794	t
4133	61	Sunter - Rawamangun 	-6.149811	106.886757	t
4134	61	Sunter- Plumpang 	-6.149652	106.886009	t
4135	61	Sunter-Kemayoran 	-6.150017	106.887207	t
4136	178	Surabaya - Mojokerto	-7.350081	112.704018	t
4137	160	Surabaya-Pasuruan	-7.605128	112.806435	t
4138	131	Suradadi (Tegal) arah Pemalang	-6.874395	109.274734	t
4139	178	Suramadu	-7.211485	112.778549	t
4140	164	T2 Juanda	-7.382722	112.770683	t
4141	60	TB Simatupang-Cilandak	-6.302630	106.855835	t
4142	59	TB. Simatupang - Ciputat	-6.281973	106.772842	t
4143	60	TB. Simatupang - Kp. Rambutan 	-6.302587	106.854980	t
4144	60	TB. Simatupang-Lb. Bulus	-6.302470	106.858017	t
4145	57	TL Alfa Indah - Pos Pengumben	-6.218450	106.754326	t
4146	103	TL Apotik Margonda Depok	-6.399179	106.819847	t
4147	60	TL Arion Mall	-6.193488	106.891190	t
4148	57	TL Asemka	-6.138634	106.813774	t
4149	57	TL Cengkareng - Kalideres	-6.154377	106.728012	t
4150	57	TL Cengkareng - Pesing	-6.154241	106.728111	t
4151	60	TL Cipinang	-6.231923	106.876595	t
4152	59	TL Duren Tiga (Jl. Buncit Raya)	-6.254238	106.827309	t
4153	59	TL Fatmawati - Pondok Labu	-6.292478	106.795212	t
4154	59	TL Fatmawati-Pd. Indah 	-6.292776	106.795242	t
4155	99	TL Haji Naman - Kalimalang	-6.249547	106.941986	t
4156	160	TL Jetak	-7.672657	112.703163	t
4157	103	TL Juanda Depok	-6.376886	106.831917	t
4158	103	TL Juanda arah Margonda	-6.376959	106.831985	t
4159	59	TL Kalibata Arah Pancoran	-6.255520	106.843018	t
4160	58	TL Kebon Sirih	-6.183208	106.824593	t
4161	178	TL Kedurus	-7.312965	112.709602	t
4162	59	TL Kuningan	-6.237014	106.827141	t
4163	58	TL Lapangan Tembak Senayan (Jl. Asia Afrika)	-6.214492	106.798004	t
4164	59	TL Lotte Mart Fatmawati	-6.277079	106.797630	t
4165	59	TL Mabes Polri	-6.239865	106.802330	t
4166	59	TL Mampang arah Kuningan	-6.240605	106.825638	t
4167	178	TL Margorejo	-7.313624	112.734909	t
4168	58	TL Matraman arah Jl. Tambak Manggarai	-6.199394	106.854050	t
4169	60	TL PGC Cililitan	-6.263350	106.865898	t
4170	57	TL Palmerah	-6.202426	106.798538	t
4171	59	TL Pancoran - Kuningan	-6.243501	106.843399	t
4172	57	TL Pesing Arah TL Cengkareng	-6.162374	106.772499	t
4173	59	TL Ragunan	-6.294092	106.822296	t
4174	59	TL Ragunan - Mampang	-6.294103	106.822220	t
4175	103	TL Ramanda Margonda Depok	-6.390111	106.825478	t
4176	58	TL Sabang	-6.187069	106.825218	t
4177	58	TL Sarinah	-6.186997	106.823029	t
4178	59	TL TMP Kalibata - Jl. Raya Kalibata - Dewi Sartika	-6.257269	106.857330	t
4179	58	TL Taman Menteng	-6.195374	106.828827	t
4180	57	TL Tomang	-6.179518	106.796127	t
4181	57	TL Tomang arah Grogol	-6.179237	106.796234	t
4182	178	TL Wiyung	-7.313715	112.696083	t
4183	60	TMII	-6.301777	106.883987	t
4184	99	TMII - Jl. Raya Lubang Buaya - Pondok Gede	-6.292145	106.905495	t
4185	59	TPU Joglo	-6.220276	106.757690	t
4186	143	Talun	-8.090120	112.271431	t
4187	59	Taman Alfa Indah	-6.222985	106.752884	t
4188	59	Taman Brawijaya	-6.253253	106.805756	t
4189	82	Taman Buah Mekarsari arah Cileungsi	-6.409753	106.985008	t
4190	39	Taman Cibodas	-6.182369	106.600342	t
4191	160	Taman Dayu arah Surabaya	-7.666293	112.700005	t
4192	57	Taman Kota	-6.159009	106.755783	t
4193	155	Taman Lalu Lintas Mojosari	-7.518023	112.557915	t
4194	178	Taman Pelangi	-7.329417	112.731247	t
4195	178	Taman Pelangi - Margorejo	-7.328393	112.731377	t
4196	164	Taman Pinang	-7.449582	112.704430	t
4197	55	Taman Pintar	-7.801448	110.367302	t
4198	160	Taman Safari 	-7.712852	112.715202	t
4199	58	Taman Suropati	-6.200022	106.832527	t
4200	100	Taman Yasmin (TL Jl. KH Sholeh Iskandar)	-6.556253	106.778137	t
4201	178	Tambak Bayan	-7.249792	112.740326	t
4202	178	Tambak Osowilangun	-7.221630	112.657951	t
4203	178	Tambak Rejo - Kapas Krampung	-7.248680	112.757652	t
4204	178	Tambak Sumur - Waru	-7.347085	112.789352	t
4205	178	Tambak Wedi	-7.245685	112.758415	t
4206	178	Tambak Wedi Lama	-7.210401	112.775810	t
4207	178	Tambakrejo - Kapas Krampung	-7.248675	112.757652	t
4208	178	Tambaksari	-7.252708	112.755089	t
4209	178	Tambaksari - Berbek	-7.253006	112.754929	t
4210	57	Tambora-Asemka	-6.145312	106.807861	t
4211	81	Tambun - Cikunir	-6.269933	107.037491	t
4212	81	Tambun KM 20 - Cawang	-6.272855	107.045097	t
4213	81	Tambun-Cibitung 	-6.276993	107.055161	t
4214	60	Tamini Square	-6.290202	106.880760	t
4215	58	Tanah Abang	-6.187227	106.815590	t
4216	58	Tanah Abang arah Karet	-6.190395	106.815170	t
4217	59	Tanah Kusir 	-6.258170	106.783714	t
4218	60	Tanah Merdeka	-6.305808	106.873756	t
4219	178	Tandes	-7.259717	112.687523	t
4220	39	Tangerang - Jakarta 	-6.221983	106.638008	t
4221	164	Tanggul 	-7.435087	112.596413	t
4222	152	Tanjakan Widas	-7.498536	111.728600	t
4223	111	Tanjung	-6.875457	108.860909	t
4224	59	Tanjung Barat	-6.300454	106.840370	t
4225	59	Tanjung Barat arah ke Ragunan	-6.303588	106.839455	t
4226	59	Tanjung Barat-TB. Simatupang 	-6.304229	106.839355	t
4227	57	Tanjung Duren-Kemanggisan 	-6.173793	106.784546	t
4228	61	Tanjung Priok 	-6.130378	106.893600	t
4229	95	Tanjung Sari	-6.903288	107.801025	t
4230	95	Tanjung Sari (Sumedang)	-6.901231	107.801575	t
4231	178	Tanjungsari	-7.260286	112.689705	t
4232	178	Tanjungsari - Manukan	-7.255199	112.661880	t
4234	86	Tarogong Garut	-7.190538	107.888481	t
4235	105	Tasikmalaya arah ke Singaparna	-7.348254	108.217644	t
4236	59	Tb. simatupang - Pasar Rebo	-6.282389	106.773186	t
4237	59	Tebet arah Cawang di Jl. M. T. Haryono	-6.242955	106.850121	t
4238	59	Tebet-Casablanca	-6.225534	106.858337	t
4239	59	Tebet-Manggarai 	-6.228254	106.858307	t
4240	59	Tebet-Pancoran 	-6.243655	106.849098	t
4241	140	Tegal - Brebes	-6.871195	109.115517	t
4242	85	Tegal Gubug	-6.635911	108.389542	t
4243	59	Tegal Parang - Mampang	-6.240444	106.832603	t
4244	59	Tegal Parang-Pancoran	-6.240562	106.833092	t
4245	59	Tegal Parang-Tendean 	-6.242268	106.832382	t
4246	40	Tegal Rotan	-6.287871	106.727692	t
4247	140	Tegal arah Semarang	-6.869735	109.132942	t
4248	178	Tegalsari	-7.265969	112.739815	t
4249	59	Teluk Betung	-6.299751	106.840065	t
4250	178	Tembaan	-7.247227	112.737411	t
4251	164	Temenggungan	-7.415932	112.501747	t
4252	178	Tenggilis	-7.320329	112.769165	t
4253	178	Tenggilis - Jemursari	-7.317916	112.751534	t
4254	37	Terminal ASDP Merak	-5.932643	105.999535	t
4255	37	Terminal ASDP Merak	-5.930881	105.997787	t
4256	97	Terminal Antapani (Cibatu)	-6.914940	107.665695	t
4257	99	Terminal Bekasi	-6.249708	107.013283	t
4258	99	Terminal Bekasi	-6.249139	107.013405	t
4259	110	Terminal Boyolali	-7.517215	110.593155	t
4260	146	Terminal Bunder	-7.170883	112.584953	t
4261	178	Terminal Bungurasih	-7.351826	112.727615	t
4262	57	Terminal Bus Kalideres	-6.155737	106.706390	t
4263	150	Terminal Bus Lamongan	-7.110522	112.408386	t
4264	152	Terminal Caruban	-7.550740	111.632614	t
4265	94	Terminal Cibadak, Sukabumi	-6.888371	106.780190	t
4266	97	Terminal Cicaheum	-6.902158	107.657028	t
4267	82	Terminal Cileungsi	-6.406902	106.969322	t
4268	102	Terminal Cirebon	-6.740443	108.552567	t
4269	102	Terminal Cirebon	-6.740430	108.552689	t
4270	174	Terminal Gadang	-8.023238	112.629280	t
4271	55	Terminal Giwangan	-7.834717	110.391014	t
4272	55	Terminal Jombor	-7.747734	110.361725	t
4273	55	Terminal Jombor	-7.747234	110.361122	t
4274	178	Terminal Joyoboyo	-7.298527	112.736450	t
4275	60	Terminal Kampung Rambutan	-6.306748	106.879761	t
4276	153	Terminal Kawedanan arah Madiun	-7.678563	111.417160	t
4277	143	Terminal Kesamben	-8.146370	112.366531	t
4278	88	Terminal Klari Karawang	-6.350018	107.344322	t
4279	118	Terminal Mangkang	-6.968857	110.288101	t
4280	153	Terminal Maospati	-7.595855	111.427223	t
4281	175	Terminal Mojokerto	-7.489936	112.447754	t
4282	156	Terminal Nganjuk - Bagor	-7.599237	111.902916	t
4283	60	Terminal Pulogadung-Cakung	-6.182828	106.907890	t
4284	60	Terminal Pulogadung-Cempaka Putih 	-6.183436	106.907806	t
4285	126	Terminal Purworejo	-7.727027	109.968002	t
4286	120	Terminal Semarang	-6.808111	110.840897	t
4287	61	Terminal Tanjung Priok	-6.109615	106.881378	t
4288	140	Terminal Tegal	-6.874407	109.107819	t
4289	79	Terminal cicalengka	-6.980614	107.831154	t
4290	60	Terowongan Cawang dari TL Kalimalang	-6.243023	106.877182	t
4291	58	Terowongan Dukuh Atas Sudirman	-6.203141	106.822639	t
4292	175	Terusan Gedek - Ploso - Jombang	-7.456274	112.424484	t
4293	58	Thamrin City	-6.194539	106.817314	t
4294	174	Tidar - Bondowoso	-7.967172	112.613533	t
4295	121	Tikungan Wonolelo Tapeketan Muntian	-7.589391	110.292366	t
4296	146	Timur ke jalur Pantura	-7.169941	112.578964	t
4297	57	Tj. Duren	-6.172993	106.789848	t
4298	61	Tj. Priok - Cawang	-6.144544	106.890427	t
4299	61	Tj. Priok - Sunter 	-6.144971	106.890388	t
4300	61	Tj. priok-pluit	-6.143499	106.891006	t
4301	57	Tl Cendrawaih	-6.199371	106.798248	t
4302	178	Tol (Masjid Agung)	-7.336240	112.713753	t
4303	39	Tol Alam Sutera-Karang Tengah 	-6.220191	106.650703	t
4304	39	Tol Alam Sutera-Tomang	-6.220148	106.651756	t
4305	59	Tol Ampera - Fatmawati	-6.292246	106.810997	t
4306	59	Tol Ampera - Gedong	-6.293195	106.820908	t
4307	59	Tol Ampera - Pasar Rebo	-6.293204	106.820930	t
4308	59	Tol Ampera - Pondok Labu	-6.292249	106.810966	t
4309	59	Tol Ampera-Fatmawati	-6.292200	106.811378	t
4310	59	Tol Ampera-Kp. Rambutan	-6.292200	106.811745	t
4311	61	Tol Ancol - Gedong	-6.127519	106.844276	t
4312	61	Tol Ancol - Pluit	-6.127709	106.843796	t
4313	61	Tol Ancol - Tanjung Priok - Cawang	-6.131538	106.821938	t
4314	61	Tol Ancol - Warakas	-6.127605	106.843460	t
4315	61	Tol Ancol- Cawang	-6.127114	106.845947	t
4316	61	Tol Angke - Grogol	-6.140768	106.787621	t
4317	61	Tol Angke - Pluit	-6.140398	106.787437	t
4318	61	Tol Angke - Semanggi 	-6.141067	106.787819	t
4319	36	Tol Balaraja arah Jakarta	-6.184042	106.402847	t
4320	60	Tol Bambu Apus	-6.314168	106.908669	t
4321	60	Tol Bambu Apus - Ampera	-6.306861	106.893539	t
4322	60	Tol Bambu Apus - Cikunir	-6.306747	106.893600	t
4323	60	Tol Bambu Apus - Fatmawati	-6.306880	106.893616	t
4324	60	Tol Bambu Apus - Gedong	-6.311801	106.906090	t
4325	60	Tol Bambu Apus - Keluar Jati Warna	-6.306748	106.893623	t
4326	60	Tol Bambu Apus - Lt. Agung	-6.306981	106.894051	t
4327	60	Tol Bambu Apus - Pondok Indah	-6.306873	106.893585	t
4328	60	Tol Bambu Apus - TMII	-6.306865	106.893555	t
4329	61	Tol Bandara 	-6.130101	106.781593	t
4330	36	Tol Bandara Soekarno - Hatta Lajur Bawah arah Pluit	-6.099599	106.718559	t
4331	61	Tol Bandara Soetta arah Pluit	-6.130474	106.782387	t
4332	61	Tol Bandara-JKT	-6.128586	106.779900	t
4333	61	Tol Bandara-Kapuk 	-6.129130	106.780502	t
4334	178	Tol Banyu Urip	-7.259520	112.709389	t
4335	101	Tol Baros Cimahi	-6.899557	107.535370	t
4336	99	Tol Bekasi - Cawang	-6.262244	107.015923	t
4337	99	Tol Bekasi Barat - Bekasi Timur	-6.249807	106.982803	t
4338	99	Tol Bekasi Barat - Cawang	-6.249862	106.982964	t
4339	81	Tol Bekasi Barat - Cibitung	-6.275593	107.051598	t
4340	99	Tol Bekasi Barat - Cikampek	-6.252592	106.989120	t
4341	99	Tol Bekasi Barat - Cikarang	-6.252763	106.989540	t
4342	99	Tol Bekasi Barat - Cikunir	-6.249843	106.982918	t
4343	99	Tol Bekasi Barat - Tambun	-6.252482	106.988892	t
4344	99	Tol Bekasi Timur - Bekasi Barat	-6.262393	107.015877	t
4345	99	Tol Bekasi Timur - Cawang	-6.262378	107.015831	t
4346	99	Tol Bekasi Timur - Cibitung	-6.262558	107.016891	t
4347	99	Tol Bekasi Timur - Cikampek	-6.262545	107.016846	t
4348	99	Tol Bekasi Timur - Cikarang Barat	-6.262526	107.016785	t
4349	99	Tol Bekasi Timur - Cikarang Utama	-6.262528	107.016808	t
4350	99	Tol Bekasi Timur - Tambun	-6.262031	107.015465	t
4351	164	Tol Berbek	-7.342718	112.758057	t
4352	99	Tol Bintara - Cakung	-6.226723	106.952278	t
4353	99	Tol Bintara - Cikunir	-6.226750	106.952438	t
4354	99	Tol Bintara - Jatiasih 2	-6.226728	106.952446	t
4355	59	Tol Bintaro	-6.265262	106.767807	t
4356	59	Tol Bintaro - Cikunir	-6.266690	106.767921	t
4357	59	Tol Bintaro - Fatmawati	-6.266722	106.767929	t
4358	59	Tol Bintaro - Jatiwarna	-6.267075	106.767906	t
4359	59	Tol Bintaro - Serpong	-6.267299	106.767960	t
4360	59	Tol Bintaro arah Kampung Rambutan	-6.266491	106.767883	t
4361	59	Tol Bintaro arah Pondok Indah	-6.266438	106.767876	t
4362	36	Tol Bitung	-6.220404	106.565323	t
4363	39	Tol Bitung - Karang Tengah - Tomang	-6.196242	106.713364	t
4364	100	Tol Bogor 	-6.609085	106.810585	t
4365	59	Tol CTC - Cawang - Cengkareng	-6.243235	106.851929	t
4366	59	Tol CTC - Tebet	-6.243316	106.850838	t
4367	59	Tol CTC Pancoran - Kuningan	-6.236930	106.827385	t
4368	60	Tol Cakung 	-6.183926	106.942955	t
4369	60	Tol Cawang	-6.246790	106.876396	t
4370	60	Tol Cawang (Interchange) - Tol Jagorawi	-6.250204	106.875122	t
4371	60	Tol Cawang (Interchange) arah Pancoran	-6.250296	106.874718	t
4372	60	Tol Cawang - Ancol	-6.241067	106.877518	t
4373	59	Tol Cawang - Bekasi Barat	-6.243097	106.860023	t
4374	60	Tol Cawang - Cempaka Putih	-6.241138	106.877457	t
4375	59	Tol Cawang - Cengkareng	-6.243237	106.858421	t
4376	59	Tol Cawang - Cibubur	-6.243147	106.858414	t
4377	59	Tol Cawang - Cikampek	-6.243125	106.859016	t
4378	59	Tol Cawang - Cikarang	-6.243101	106.859917	t
4379	59	Tol Cawang - Cikunir	-6.243137	106.858711	t
4380	59	Tol Cawang - Cililitan	-6.243128	106.859322	t
4381	59	Tol Cawang - Cipayung	-6.243089	106.860237	t
4382	60	Tol Cawang - Gedong Panjang	-6.241106	106.877502	t
4383	59	Tol Cawang - Grogol	-6.243228	106.857635	t
4384	59	Tol Cawang - Halim	-6.243137	106.858864	t
4385	60	Tol Cawang - Jatinegara	-6.241167	106.877487	t
4386	60	Tol Cawang - Kebon Nanas	-6.241213	106.877480	t
4387	60	Tol Cawang - Kelapa Gading	-6.241543	106.877388	t
4388	60	Tol Cawang - Keluar Pisangan	-6.241026	106.877525	t
4389	60	Tol Cawang - Keluar Rawasari	-6.241254	106.877464	t
4390	59	Tol Cawang - Kramat Jati	-6.243068	106.860458	t
4391	59	Tol Cawang - Kuningan	-6.243233	106.857719	t
4392	59	Tol Cawang - Pancoran	-6.243203	106.858093	t
4393	59	Tol Cawang - Pejompongan	-6.243233	106.858002	t
4394	60	Tol Cawang - Pluit	-6.241149	106.877495	t
4395	60	Tol Cawang - Rawamangun	-6.240988	106.877541	t
4396	59	Tol Cawang - Semanggi	-6.243242	106.858261	t
4397	59	Tol Cawang - Slipi	-6.243233	106.857796	t
4398	60	Tol Cawang - Sunter	-6.241179	106.877487	t
4399	59	Tol Cawang - TMII	-6.243110	106.859802	t
4400	59	Tol Cawang - TMII - Cibubur - Bogor - Ciawi	-6.243125	106.859550	t
4401	59	Tol Cawang - Tambun	-6.243137	106.859138	t
4402	60	Tol Cawang - Tanjung Priok	-6.241364	106.877441	t
4403	60	Tol Cawang - Tanjung Priok - Jembatan Tiga	-6.240848	106.877579	t
4404	59	Tol Cawang - Tebet	-6.243266	106.851433	t
4405	59	Tol Cawang - Tomang	-6.243238	106.857887	t
4406	60	Tol Cawang arah Jati Bening	-6.243471	106.877258	t
4407	60	Tol Cawang arah Rawamangun	-6.240932	106.877556	t
4409	59	Tol Cawang arah ke Bekasi	-6.243055	106.860115	t
4410	60	Tol Ceger - Ampera	-6.306398	106.891518	t
4411	60	Tol Ceger - Cibubur	-6.304130	106.883904	t
4412	60	Tol Ceger - Pasar Rebo	-6.306393	106.891487	t
4413	60	Tol Ceger - Pondok Labu	-6.306406	106.891541	t
4414	60	Tol Ceger - TMII	-6.306384	106.891449	t
4415	60	Tol Ceger-Pd. Pinang 	-6.306426	106.891884	t
4416	58	Tol Cempaka Mas - Cawang	-6.164726	106.879929	t
4417	58	Tol Cempaka Putih 	-6.175785	106.876167	t
4418	58	Tol Cempaka Putih - Cawang	-6.175552	106.876198	t
4419	58	Tol Cempaka Putih - Rawamangun	-6.175530	106.876198	t
4420	57	Tol Cengkareng - Bandara	-6.104498	106.698471	t
4421	57	Tol Cengkareng - Cawang	-6.105580	106.696182	t
4422	57	Tol Cengkareng - Kapuk	-6.105634	106.696083	t
4423	57	Tol Cengkareng - Pluit - Tomang - Cawang	-6.105245	106.696793	t
4424	100	Tol Ciawi - Gadog 	-6.642889	106.847191	t
4425	100	Tol Ciawi - Sukabumi	-6.643731	106.847580	t
4426	60	Tol Ciawi - TMII - Cawang	-6.305239	106.883934	t
4427	81	Tol Cibatu - Cikarang	-6.326787	107.160492	t
4428	81	Tol Cibatu - Karawang Barat	-6.323192	107.154327	t
4429	81	Tol Cibatu arah ke Cikampek	-6.323203	107.154350	t
4430	81	Tol Cibitung	-6.285951	107.083420	t
4431	81	Tol Cibitung - Bekasi Timur	-6.285699	107.082481	t
4432	81	Tol Cibitung - Cawang	-6.285687	107.082436	t
4433	81	Tol Cibitung - Cikampek	-6.286506	107.085739	t
4434	81	Tol Cibitung - Cikarang	-6.286258	107.084854	t
4435	81	Tol Cibitung - Cikarang Barat	-6.285573	107.082626	t
4436	81	Tol Cibitung - Tambun	-6.285712	107.082520	t
4437	99	Tol Cibubur	-6.367015	106.894867	t
4438	99	Tol Cibubur - Bogor	-6.369944	106.895546	t
4439	103	Tol Cibubur - Cawang	-6.361487	106.893738	t
4440	103	Tol Cibubur - Cililitan	-6.361521	106.893745	t
4441	60	Tol Cibubur - Cipayung	-6.360564	106.893578	t
4442	60	Tol Cibubur - Ciracas	-6.360599	106.893593	t
4443	103	Tol Cibubur - Kampung Rambutan	-6.361193	106.893684	t
4444	103	Tol Cibubur - Pasar Rebo	-6.361097	106.893669	t
4445	60	Tol Cibubur - TMII	-6.360509	106.893578	t
4446	103	Tol Cibubur-Cileungsi 	-6.362089	106.893906	t
4447	103	Tol Cibubur-Ciracas	-6.362558	106.894402	t
4448	80	Tol Cikalong Wetan arah Jakarta	-6.738400	107.437363	t
4449	88	Tol Cikampek - Cawang	-6.388584	107.395134	t
4450	88	Tol Cikampek - Cikarang	-6.388724	107.395584	t
4451	60	Tol Cikampek Pondok Gede - Bekasi Timur	-6.290457	106.879051	t
4452	88	Tol Cikampek arah Bandung	-6.417308	107.417221	t
4453	88	Tol Cikampek arah Jakarta	-6.415613	107.416069	t
4454	88	Tol Cikampek arah ke Jakarta	-6.388276	107.394592	t
4455	81	Tol Cikarang Barat - Bekasi Barat	-6.312603	107.135719	t
4456	81	Tol Cikarang Barat - Bekasi Timur	-6.312590	107.135689	t
4457	81	Tol Cikarang Barat - Cibatu	-6.313782	107.138123	t
4458	81	Tol Cikarang Barat - Cikarang Timur	-6.313701	107.137978	t
4459	81	Tol Cikarang Barat - Cikunir	-6.312573	107.135651	t
4460	81	Tol Cikarang Barat - Tambun	-6.312545	107.135612	t
4461	81	Tol Cikarang Barat KM 27	-6.309369	107.130562	t
4462	81	Tol Cikarang Barat arah Cikampek	-6.313736	107.138062	t
4463	81	Tol Cikarang Barat arah Jakarta	-6.312942	107.136269	t
4464	81	Tol Cikarang KM 37 arah Cikampek	-6.335258	107.182472	t
4465	81	Tol Cikarang Timur arah Cikampek	-6.336237	107.185356	t
4466	81	Tol Cikarang Timur arah Jakarta	-6.336423	107.185295	t
4467	88	Tol Cikarang-Karawang	-6.388894	107.395866	t
4468	92	Tol Cikopo	-6.458172	107.509598	t
4469	92	Tol Cikopo - Palimanan	-6.439761	107.471771	t
4470	87	Tol Cikopo - Palimanan KM 102	-6.573487	107.950653	t
4471	99	Tol Cikunir	-6.261465	106.957932	t
4472	99	Tol Cikunir - Bekasi Barat	-6.255545	106.961632	t
4473	99	Tol Cikunir - Bekasi Timur	-6.255483	106.961784	t
4474	99	Tol Cikunir - Cawang	-6.256838	106.953011	t
4475	81	Tol Cikunir - Cibitung	-6.267651	107.031494	t
4476	99	Tol Cikunir - Cikampek	-6.255386	106.962143	t
4477	99	Tol Cikunir - Cilandak	-6.257541	106.958023	t
4478	99	Tol Cikunir - Halim	-6.256843	106.952888	t
4479	99	Tol Cikunir - Pondok Indah	-6.257499	106.958023	t
4480	99	Tol Cikunir - TMII	-6.257367	106.958023	t
4481	99	Tol Cikunir - Tambun	-6.255437	106.961967	t
4482	99	Tol Cikunir arah Cikampek KM 9	-6.256858	106.947701	t
4483	99	Tol Cikunir arah Semper	-6.257356	106.957886	t
4484	36	Tol Cikupa - Jakarta	-6.205337	106.523499	t
4485	59	Tol Cilandak - Cikunir	-6.292253	106.801231	t
4486	59	Tol Cilandak - Jatiwarna	-6.292257	106.801155	t
4487	59	Tol Cilandak - Ps. Rebo	-6.292392	106.799149	t
4488	60	Tol Cilangkap - Pasar Rebo	-6.331805	106.887291	t
4489	37	Tol Cilegon Timur	-6.042930	106.036446	t
4490	79	Tol Cileunyi	-6.939761	107.743500	t
4491	60	Tol Cililitan - Cawang	-6.264401	106.872902	t
4492	60	Tol Cililitan - Jatinegara	-6.267075	106.873711	t
4493	60	Tol Cililitan - TMII	-6.264579	106.873093	t
4494	60	Tol Cililitan - Tanjung Priok	-6.264419	106.872902	t
4495	60	Tol Cililitan-Kramatjati	-6.265091	106.872787	t
4496	60	Tol Cililitan-Pancoran 	-6.263492	106.873116	t
4497	103	Tol Cimanggis - Cawang	-6.380155	106.896072	t
4498	103	Tol Cimanggis - Cibubur	-6.380195	106.896072	t
4499	103	Tol Cimanggis - Cipayung	-6.380065	106.896072	t
4500	103	Tol Cimanggis - Pasar Rebo	-6.380178	106.896072	t
4501	103	Tol Cimanggis - TMII	-6.380237	106.896072	t
4502	103	Tol Cimanggis-Cililitan 	-6.379522	106.896126	t
4503	103	Tol Cimanggis-Ciracas 	-6.379618	106.896255	t
4504	87	Tol Cipali	-6.573076	107.949478	t
4505	87	Tol Cipali KM 100	-6.573024	107.949310	t
4506	87	Tol Cipali KM 107	-6.573573	107.951294	t
4507	87	Tol Cipali KM 111	-6.574276	107.952797	t
4508	87	Tol Cipali KM 130	-6.575518	107.958450	t
4509	87	Tol Cipali KM 166	-6.580842	107.971123	t
4510	87	Tol Cipali KM 185	-6.595123	107.991615	t
4511	87	Tol Cipali KM 73	-6.566677	107.927094	t
4512	87	Tol Cipali KM 95	-6.571164	107.942833	t
4513	87	Tol Cipali arah ke Jakarta	-6.573237	107.949341	t
4514	60	Tol Cipayung - Cawang	-6.327724	106.886993	t
4515	60	Tol Cipayung - Cibubur	-6.327785	106.887146	t
4516	60	Tol Cipayung - Cililitan	-6.327790	106.886993	t
4517	60	Tol Cipayung - Kp. Rambutan 	-6.329481	106.887146	t
4518	60	Tol Cipayung - Pasar Rebo	-6.327842	106.886993	t
4519	60	Tol Cipayung-Ciracas	-6.329156	106.887123	t
4520	80	Tol Cipularang	-6.848032	107.491905	t
4521	80	Tol Cipularang	-6.851036	107.505531	t
4522	80	Tol Cipularang KM 109	-6.779331	107.439926	t
4523	80	Tol Cipularang KM 112+400 arah Bandung	-6.811227	107.474495	t
4524	80	Tol Cipularang KM 121	-6.853976	107.505150	t
4525	80	Tol Cipularang KM 70	-6.840469	107.502831	t
4526	92	Tol Cipularang KM 97	-6.668913	107.441956	t
4527	59	Tol Ciputat - Fatmawati	-6.285263	106.775459	t
4528	59	Tol Ciputat - Gedong	-6.285243	106.775444	t
4529	59	Tol Ciputat - Pondok Indah	-6.285225	106.775421	t
4530	59	Tol Ciputat - Ps. Minggu	-6.285386	106.775536	t
4531	59	Tol Ciputat - Ulujami	-6.273892	106.767677	t
4532	82	Tol Citereup KM 28	-6.520790	106.858009	t
4533	60	Tol Dalkot	-6.245745	106.871536	t
4534	88	Tol Dawuan - Karawang Timur	-6.419538	107.419540	t
4535	88	Tol Dawuan - Padalarang - Pasteur - Cileunyi	-6.427835	107.424919	t
4536	88	Tol Dawuan arah Jakarta	-6.419405	107.419388	t
4537	60	Tol Dukuh - Cibubur	-6.296574	106.881836	t
4538	60	Tol Dukuh - Cipayung	-6.296593	106.881844	t
4539	60	Tol Dukuh arah Cililitan	-6.296663	106.881660	t
4540	60	Tol Dukuh arah UKI	-6.296967	106.881821	t
4541	178	Tol Dupak	-7.244258	112.710434	t
4542	59	Tol Fatmawati	-6.292392	106.800110	t
4543	59	Tol Fatmawati - Ampera	-6.292254	106.801262	t
4544	59	Tol Fatmawati - Lenteng Agung	-6.292256	106.801117	t
4545	59	Tol Fatmawati - Pasar Rebo	-6.292254	106.801193	t
4546	59	Tol Fatmawati - Pondok Indah	-6.292408	106.799805	t
4547	59	Tol Fatmawati - Ragunan	-6.292252	106.801300	t
4548	59	Tol Fatmawati - Serpong	-6.292407	106.799858	t
4549	100	Tol Gadog arah ke Jakarta	-6.642323	106.846703	t
4550	60	Tol Gedong - Ampera	-6.304353	106.850266	t
4551	60	Tol Gedong - Cikunir	-6.304229	106.850304	t
4552	60	Tol Gedong - Fatmawati	-6.304355	106.850296	t
4553	60	Tol Gedong - Keluar Pondok Indah	-6.304351	106.850235	t
4554	60	Tol Gedong - Pd Pinang	-6.304336	106.849419	t
4555	60	Tol Gedong - Ps Rebo	-6.304272	106.849854	t
4556	60	Tol Gedong - Ulujami	-6.304347	106.850212	t
4557	57	Tol Gedong Panjang - Ancol - Warakas	-6.130440	106.809540	t
4558	57	Tol Gedong Panjang - Jembatan Tiga - Pluit	-6.132148	106.801353	t
4559	60	Tol Gedong-Fatmawati	-6.304187	106.849014	t
4560	164	Tol Gempol - Bangil	-7.559887	112.716377	t
4561	164	Tol Gempol - Sidoarjo	-7.555760	112.700134	t
4562	164	Tol Gempol - Surabaya	-7.553697	112.694878	t
4563	178	Tol Gn. Sari	-7.308006	112.705933	t
4564	178	Tol Gn. Sari - Perak	-7.309474	112.711380	t
4565	146	Tol Gresik	-7.165278	112.602699	t
4566	178	Tol Gresik - Surabaya	-7.234807	112.669205	t
4567	57	Tol Grogol - Cawang	-6.162325	106.790283	t
4568	57	Tol Grogol - Kuningan	-6.162357	106.790268	t
4569	57	Tol Grogol - Pluit - PIK - Bandara Soekarno Hatta	-6.155320	106.793205	t
4570	57	Tol Grogol - Senayan	-6.162390	106.790237	t
4571	57	Tol Grogol - Slipi	-6.162239	106.790321	t
4572	57	Tol Grogol arah Tomang	-6.162178	106.790344	t
4573	61	Tol Gunung Sahari	-6.130335	106.830688	t
4574	178	Tol Gunung Sari	-7.309185	112.711533	t
4575	178	Tol Gunungsari - Waru	-7.308996	112.709427	t
4576	60	Tol Halim - Cawang	-6.246486	106.887085	t
4577	60	Tol Halim - Interchange Tanjung Priok	-6.242403	106.877083	t
4578	60	Tol Halim - Jatiwaringin	-6.246267	106.886940	t
4579	60	Tol Halim - Jt. Bening	-6.242492	106.877060	t
4580	60	Tol Halim - Kuningan	-6.246446	106.887177	t
4581	60	Tol Halim - Semanggi	-6.242418	106.877274	t
4582	60	Tol Halim - Tambun	-6.246035	106.887291	t
4583	60	Tol Halim - Tanjung Priok	-6.242376	106.877090	t
4584	60	Tol Halim arah Cikarang	-6.246153	106.887123	t
4585	81	Tol JAPEK KM 56	-6.323531	107.154854	t
4586	81	Tol JAPEK KM 59	-6.323893	107.155472	t
4587	59	Tol JLJ Serpong - Veteran - TMII - Cikunir - Semper	-6.253424	106.764366	t
4588	57	Tol JORR (Meruya)	-6.206017	106.738579	t
4589	59	Tol JORR KM 17	-6.255878	106.765038	t
4590	60	Tol JORR Kp. Rambutan arah Bintaro	-6.307829	106.874870	t
4591	59	Tol JORR W2 Ciledug	-6.234245	106.755402	t
4592	57	Tol JORR W2 Meruya arah Joglo	-6.197526	106.734100	t
4593	59	Tol JORR arah Serpong	-6.254602	106.764748	t
4594	60	Tol Jago arah Bogor	-6.359167	106.893417	t
4595	60	Tol Jagorawi	-6.291619	106.879799	t
4596	60	Tol Jagorawi (keluar UKI, KODAM)	-6.257711	106.872696	t
4597	60	Tol Jagorawi - Cawang	-6.250182	106.874847	t
4598	60	Tol Jagorawi - Cawang - Ciawi	-6.293144	106.880409	t
4599	100	Tol Jagorawi - Puncak	-6.633341	106.840134	t
4600	100	Tol Jagorawi Bogor-JKT	-6.599365	106.831764	t
4601	60	Tol Jagorawi Cililitan - Kali Cipinang	-6.248401	106.876549	t
4602	60	Tol Jagorawi Cimanggis - Ciracas	-6.359991	106.893478	t
4603	103	Tol Jagorawi GT Cibubur	-6.368945	106.893707	t
4604	82	Tol Jagorawi Gunung Putri	-6.459921	106.885536	t
4605	60	Tol Jagorawi KM 0	-6.245444	106.877266	t
4606	60	Tol Jagorawi KM 12 arah Cawang	-6.349542	106.890930	t
4607	60	Tol Jagorawi KM 12 arah Pasar Rebo	-6.349542	106.890915	t
4608	103	Tol Jagorawi KM 14 arah Cawang	-6.363164	106.894058	t
4609	103	Tol Jagorawi KM 16 arah Cawang	-6.392503	106.895668	t
4610	103	Tol Jagorawi KM 19	-6.415613	106.897575	t
4611	103	Tol Jagorawi KM 20	-6.424036	106.896736	t
4612	60	Tol Jagorawi KM 32	-6.356966	106.892982	t
4613	60	Tol Jagorawi arah Cawang	-6.292392	106.880020	t
4614	36	Tol Jakarta - Merak	-6.215847	106.554565	t
4615	36	Tol Jakarta - Merak KM 28 - 29	-6.216714	106.556099	t
4616	40	Tol Jakarta - Serpong (Keluar Serpong)	-6.312526	106.678246	t
4617	39	Tol Jakarta - Tangerang	-6.218783	106.661064	t
4618	39	Tol Jakarta - Tangerang KM 17	-6.220191	106.651108	t
4619	57	Tol Jakarta - Tangerang KM 3	-6.189835	106.769539	t
4620	57	Tol Jakarta - Tangerang, Kemanggisan KM 01	-6.183094	106.792595	t
4621	57	Tol Jalembar-Kuningan 	-6.158572	106.791763	t
4622	39	Tol Janger	-6.213898	106.552017	t
4623	39	Tol Janger - Tomang - Karang Tengah	-6.196091	106.713928	t
4624	36	Tol Janger KM 20+900	-6.215455	106.554039	t
4625	39	Tol Janger Kedoya-Tomang	-6.196832	106.712822	t
4626	57	Tol Janger Meruya - Kb. Jeruk	-6.191046	106.727058	t
4627	36	Tol Janger Pakulonan - Kr. Tengah	-6.223086	106.631271	t
4628	39	Tol Janger Tomang-Kemanggisan	-6.195552	106.714371	t
4629	36	Tol Janger- Karawaci	-6.224372	106.604095	t
4630	99	Tol Japek	-6.251574	106.969398	t
4631	60	Tol Japek - Cawang	-6.244460	106.894775	t
4632	81	Tol Japek - Cibitung KM 24	-6.283946	107.077606	t
4633	99	Tol Japek Bekasi Barat	-6.249478	106.981644	t
4634	99	Tol Japek Bekasi Barat - Bekasi Timur	-6.252720	106.989326	t
4635	99	Tol Japek Bekasi Barat - Cikunir	-6.248987	106.975807	t
4636	81	Tol Japek Bekasi Barat - Tambun	-6.275511	107.051384	t
4637	99	Tol Japek Bekasi Barat KM 13 - KM 12	-6.249691	106.973083	t
4638	99	Tol Japek Bekasi Timur - Bekasi Barat	-6.256517	106.998894	t
4639	99	Tol Japek Bekasi Timur - Cikarang Timur	-6.250123	106.984131	t
4640	99	Tol Japek Bekasi Timur - Cikunir	-6.256538	106.960510	t
4641	99	Tol Japek Bekasi Timur - Jt. Bening	-6.255029	106.994774	t
4642	99	Tol Japek Bekasi Timur - Tambun	-6.249894	106.983589	t
4643	81	Tol Japek Bekasi Timur - Tambun KM 19	-6.272759	107.044655	t
4644	99	Tol Japek Bekasi Timur KM 15 - KM 16	-6.248907	106.980576	t
4645	99	Tol Japek Bekasi Timur KM 16	-6.249361	106.982269	t
4646	99	Tol Japek Bekasi Timur KM 17	-6.250539	106.984947	t
4647	99	Tol Japek Bekasi Timur KM 17 - Cikarang Timur KM 40	-6.250704	106.985268	t
4648	99	Tol Japek Bekasi Timur KM 19	-6.251184	106.986259	t
4649	81	Tol Japek Cibatu KM 35 - Karawang Barat KM 49	-6.322779	107.153244	t
4650	99	Tol Japek Cibitung - Bekasi Timur	-6.262217	107.015343	t
4651	81	Tol Japek Cibitung - Cikarang	-6.298663	107.111977	t
4652	99	Tol Japek Cibitung - Cikunir	-6.249510	106.973518	t
4653	81	Tol Japek Cibitung - Tambun	-6.279430	107.062126	t
4654	81	Tol Japek Cibitung KM 23	-6.280800	107.067368	t
4655	81	Tol Japek Cibitung KM 24	-6.284048	107.077690	t
4656	81	Tol Japek Cibitung KM 25 - 26	-6.284370	107.078712	t
4657	81	Tol Japek Cibitung KM 26	-6.295896	107.107178	t
4658	81	Tol Japek Cibitung KM 26 - 23	-6.308940	107.129372	t
4659	81	Tol Japek Cibitung KM 28 - Cikarang	-6.308810	107.129120	t
4660	81	Tol Japek Cikarang - Bekasi	-6.300188	107.114563	t
4661	81	Tol Japek Cikarang - Cibitung	-6.296786	107.108490	t
4662	81	Tol Japek Cikarang - Tambun	-6.300188	107.114563	t
4663	81	Tol Japek Cikarang - Tambun KM 22	-6.278971	107.060852	t
4664	81	Tol Japek Cikarang Barat - Bekasi Timur	-6.309092	107.129623	t
4665	81	Tol Japek Cikarang Barat - Cikarang Timur	-6.309188	107.130188	t
4666	81	Tol Japek Cikarang Barat KM 27 - 29	-6.297090	107.109238	t
4667	81	Tol Japek Cikarang Barat KM 28	-6.298855	107.112335	t
4668	81	Tol Japek Cikarang Barat KM 28 - GT Bekasi Barat	-6.308767	107.129066	t
4669	81	Tol Japek Cikarang Barat KM 29 - Bekasi Timur	-6.302038	107.117470	t
4670	81	Tol Japek Cikarang Barat KM 29 - Cibitung KM 22	-6.310244	107.131508	t
4671	81	Tol Japek Cikarang Barat KM 29 - Km 30	-6.300652	107.115387	t
4672	81	Tol Japek Cikarang Barat KM 31 - 30	-6.312238	107.135025	t
4673	81	Tol Japek Cikarang Barat KM 33 - Cikarang Timur KM 38	-6.320838	107.149963	t
4674	81	Tol Japek Cikarang Barat KM 33+200	-6.319825	107.148224	t
4675	81	Tol Japek Cikarang KM 18+800 - Cikunir	-6.271298	107.041306	t
4676	81	Tol Japek Cikarang KM 32 - 30	-6.313470	107.137215	t
4677	81	Tol Japek Cikarang Pusat - Karawang Barat	-6.310052	107.131599	t
4678	81	Tol Japek Cikarang Pusat KM 39 - 42	-6.316013	107.141922	t
4679	88	Tol Japek Cikarang Timur - Karawang Barat	-6.352300	107.218819	t
4680	81	Tol Japek Cikarang Timur KM 35	-6.338907	107.191261	t
4681	81	Tol Japek Cikarang Timur KM 37 - 38	-6.335181	107.182503	t
4682	81	Tol Japek Cikarang Timur KM 39 - KM 40	-6.340107	107.193237	t
4683	81	Tol Japek Cikarang Timur KM 40	-6.341563	107.195107	t
4684	81	Tol Japek Cikarang Utama	-6.298967	107.112480	t
4685	81	Tol Japek Cikarang Utama KM 28	-6.298471	107.111595	t
4686	99	Tol Japek Cikunir - Bekasi Barat	-6.254960	106.995247	t
4687	99	Tol Japek Cikunir - Bekasi Timur KM 17+600	-6.258490	107.005058	t
4688	81	Tol Japek Cikunir - Tambun	-6.267448	107.030960	t
4689	88	Tol Japek Dawuan KM 60+200	-6.373317	107.368614	t
4690	88	Tol Japek Dawuan KM 64 - KM 60+800	-6.422133	107.423294	t
4691	88	Tol Japek Dawuan KM 64 - KM 62	-6.422085	107.423203	t
4692	60	Tol Japek Halim	-6.246140	106.887680	t
4693	60	Tol Japek Halim KM 2 - Jatiwaringin KM 4+800	-6.247921	106.899178	t
4694	99	Tol Japek Jatiwaringin - Bekasi Timur	-6.255066	106.963043	t
4695	60	Tol Japek Jatiwaringin - Cawang	-6.254080	106.903992	t
4696	60	Tol Japek Jatiwaringin KM 4+800	-6.254912	106.905640	t
4697	60	Tol Japek Jatiwaringin KM 6	-6.257477	106.912292	t
4698	99	Tol Japek Jt. Bening - Bekasi Barat	-6.248753	106.979416	t
4699	99	Tol Japek Jt. Bening - Bekasi Barat	-6.256837	106.948685	t
4700	99	Tol Japek Jt. Bening - Cawang	-6.257541	106.940094	t
4701	99	Tol Japek Jt. Bening - Cikunir	-6.256911	106.947975	t
4702	99	Tol Japek Jt. Bening - Jatiwaringin	-6.257626	106.937943	t
4703	99	Tol Japek Jt. Bening - Tambun	-6.256719	106.952248	t
4704	60	Tol Japek KM 04 Jatiwaringin	-6.254618	106.904984	t
4705	99	Tol Japek KM 10	-6.256677	106.952736	t
4706	99	Tol Japek KM 12	-6.248875	106.975479	t
4707	99	Tol Japek KM 16 	-6.249009	106.980980	t
4708	81	Tol Japek KM 21	-6.278219	107.058846	t
4709	81	Tol Japek KM 25	-6.286465	107.085480	t
4710	81	Tol Japek KM 25	-6.290009	107.095497	t
4711	81	Tol Japek KM 28	-6.299239	107.112602	t
4712	81	Tol Japek KM 30 Cikarang Barat	-6.317218	107.143478	t
4713	81	Tol Japek KM 31	-6.306767	107.125961	t
4714	81	Tol Japek KM 35	-6.331230	107.171318	t
4715	81	Tol Japek KM 39	-6.343749	107.197693	t
4716	81	Tol Japek KM 39	-6.347131	107.202324	t
4717	88	Tol Japek KM 41 Karawang Barat - KM 39 Cikarang Timur	-6.352929	107.221642	t
4718	88	Tol Japek KM 42	-6.354420	107.228729	t
4719	88	Tol Japek KM 44 Karawang Barat - KM 38 Cikarang Timur	-6.349101	107.256584	t
4720	88	Tol Japek KM 47 Karawang Timur - KM 49	-6.348632	107.264679	t
4721	88	Tol Japek KM 48	-6.349352	107.278648	t
4722	88	Tol Japek KM 49+300	-6.349933	107.288773	t
4723	88	Tol Japek KM 58	-6.370854	107.364265	t
4724	81	Tol Japek KM 59 - Jakarta	-6.324017	107.155373	t
4725	88	Tol Japek KM 62	-6.389683	107.396980	t
4726	88	Tol Japek Kalihurip KM 67	-6.425230	107.430885	t
4727	88	Tol Japek Karawang Barat - Cikampek	-6.349923	107.288643	t
4728	81	Tol Japek Karawang Barat - Cikampek	-6.324085	107.155815	t
4729	88	Tol Japek Karawang Barat KM 46	-6.348590	107.260704	t
4730	88	Tol Japek Karawang Barat KM 48	-6.351351	107.314201	t
4731	88	Tol Japek Karawang Barat KM 49 - Karawang Timur KM 52	-6.351821	107.317688	t
4732	88	Tol Japek Karawang Timur - Karawang Barat	-6.350888	107.304169	t
4733	88	Tol Japek Karawang Timur KM 48+800	-6.351506	107.315475	t
4734	88	Tol Japek Karawang Timur KM 51	-6.362857	107.349968	t
4735	88	Tol Japek Karawang Timur KM 51 - 52	-6.351996	107.319069	t
4736	88	Tol Japek Karawang Timur KM 54	-6.353814	107.327759	t
4737	88	Tol Japek Karawang Timur KM 55 - 57 arah Cikampek	-6.368486	107.360001	t
4738	88	Tol Japek Karawang Timur KM 57 (Rest Area)	-6.367250	107.360092	t
4739	88	Tol Japek Km 52	-6.351090	107.308296	t
4740	92	Tol Japek Km 70	-6.432954	107.449936	t
4741	81	Tol Japek Tambun - Bekasi Barat	-6.270061	107.038162	t
4742	81	Tol Japek Tambun - Bekasi Timur	-6.270168	107.037842	t
4743	81	Tol Japek Tambun - Cikarang	-6.321539	107.151489	t
4744	81	Tol Japek Tambun - Cikarang Barat	-6.270029	107.038322	t
4745	99	Tol Japek Tambun - Cikunir	-6.249393	106.973930	t
4746	81	Tol Japek Tambun - Karawang Barat	-6.270077	107.038498	t
4747	81	Tol Japek Tambun Bekasi Timur KM 17+300	-6.264201	107.020981	t
4748	81	Tol Japek Tambun KM 24	-6.273751	107.047157	t
4749	99	Tol Japek arah Cikarang KM 8	-6.257285	106.940712	t
4750	99	Tol Jati Asih	-6.299473	106.952057	t
4751	60	Tol Jati Bening - Bekasi Barat	-6.257813	106.929787	t
4752	60	Tol Jati Bening - Bekasi Timur	-6.257903	106.930038	t
4753	99	Tol Jati Bening - Bekasi Timur	-6.256922	106.948387	t
4754	60	Tol Jati Bening - Cawang	-6.258009	106.929665	t
4755	99	Tol Jati Bening - Cibitung	-6.256879	106.949371	t
4756	60	Tol Jati Bening - Cikampek	-6.257946	106.930557	t
4757	99	Tol Jati Bening - Cikarang Barat	-6.256879	106.948914	t
4758	99	Tol Jati Bening - Cikarang Timur	-6.256853	106.949020	t
4759	60	Tol Jati Bening - Cikunir	-6.257813	106.929817	t
4760	99	Tol Jati Bening - Tambun	-6.256890	106.949158	t
4761	60	Tol Jati Bening arah Halim	-6.258015	106.929596	t
4762	99	Tol Jati Waringin - Bekasi Barat	-6.254853	106.963768	t
4763	99	Tol Jati Warna - Ampera	-6.310355	106.926987	t
4764	99	Tol Jati Warna - Cikunir	-6.310217	106.926956	t
4765	99	Tol Jati Warna - Gedong	-6.310349	106.927025	t
4766	99	Tol Jati Warna - Keluar Fatmawati	-6.311678	106.918762	t
4767	99	Tol Jati Warna - Lenteng Agung	-6.311664	106.918854	t
4768	99	Tol Jati Warna - Pondok Labu	-6.310361	106.926956	t
4769	99	Tol Jati Warna - TMII	-6.310341	106.927078	t
4770	99	Tol Jati. Warna - Kp. Rambutan 	-6.310159	106.927284	t
4771	99	Tol Jatiasih	-6.297842	106.953865	t
4772	99	Tol Jatiasih - Bintara - Cakung	-6.297628	106.954063	t
4773	99	Tol Jatiasih - Cikunir	-6.297650	106.954041	t
4774	99	Tol Jatiasih - Keluar Fatmawati	-6.298433	106.953415	t
4775	99	Tol Jatiasih - TMII	-6.298440	106.953407	t
4776	99	Tol Jatiasih arah Cikarang	-6.297714	106.953979	t
4777	60	Tol Jatinegara - Cawang	-6.214835	106.874237	t
4778	60	Tol Jatinegara - Rawamangun	-6.214897	106.874100	t
4779	60	Tol Jatiwaringin - Bekasi	-6.257611	106.912704	t
4780	99	Tol Jatiwaringin - Cawang	-6.255002	106.963516	t
4781	99	Tol Jatiwaringin - Cikampek	-6.254213	106.964943	t
4782	60	Tol Jatiwaringin - Cikunir	-6.257647	106.912903	t
4783	60	Tol Jatiwaringin - Halim	-6.255137	106.905754	t
4784	99	Tol Jatiwaringin - Tambun	-6.254469	106.964546	t
4785	60	Tol Jatiwaringin KM 4 dari Cawang	-6.254721	106.905251	t
4786	99	Tol Jatiwarna - Bambu Apus	-6.310681	106.924545	t
4787	99	Tol Jatiwarna - Lenteng Agung	-6.310199	106.927864	t
4788	57	Tol Jelambar - Cawang 	-6.158689	106.792068	t
4789	57	Tol Jelambar - Kamal 	-6.156790	106.792900	t
4790	57	Tol Jelambar - Senayan 	-6.151329	106.793098	t
4791	57	Tol Jelambar - Senayan	-6.160072	106.791351	t
4792	57	Tol Jelambar arah Bandara Soetta	-6.157675	106.792519	t
4793	57	Tol Jelambar-Slipi	-6.159105	106.791557	t
4794	57	Tol Jelembar - Ancol 	-6.157867	106.792488	t
4795	61	Tol Jembatan Tiga arah Kapuk	-6.132232	106.789406	t
4796	59	Tol Jl. Ulujami - Pd Ranji - Serpong	-6.239431	106.763374	t
4797	39	Tol Joglo - Pd. Indah	-6.222836	106.748138	t
4798	39	Tol Joglo - Ps. Rebo	-6.223049	106.748184	t
4799	39	Tol Joglo arah Kampung Rambutan	-6.222719	106.748024	t
4800	59	Tol Jor TB. Simatupang	-6.292350	106.802872	t
4801	60	Tol Jorr - Cikunir	-6.305573	106.862579	t
4802	60	Tol Jorr - Kp. Rambutan	-6.305744	106.863197	t
4803	60	Tol Jorr - Pd. Indah	-6.305701	106.862961	t
4804	99	Tol Jorr Jt. Warna - Ps. Rebo	-6.311481	106.919418	t
4805	99	Tol Jorr Jti Warna - Pd. Indah 	-6.311396	106.919762	t
4806	60	Tol Kali Cipinang - Cawang	-6.280070	106.874786	t
4807	60	Tol Kali Cipinang - Ciracas	-6.279980	106.874985	t
4808	59	Tol Kalibata - Pasar Minggu	-6.255861	106.843140	t
4809	57	Tol Kamal - Cengkareng	-6.114559	106.731827	t
4810	57	Tol Kamal - Kapuk	-6.122394	106.746277	t
4811	57	Tol Kamal Jalur Atas - Kapuk	-6.122279	106.746269	t
4812	60	Tol Kampung Rambutan - Ampera	-6.307671	106.875511	t
4813	60	Tol Kampung Rambutan - Cikunir	-6.307519	106.875603	t
4814	60	Tol Kampung Rambutan - Fatmawati	-6.307621	106.875755	t
4815	60	Tol Kampung Rambutan - Gedong	-6.307677	106.875481	t
4816	60	Tol Kampung Rambutan - Jati Asih	-6.307653	106.875717	t
4817	60	Tol Kampung Rambutan - Pasar Rebo	-6.307663	106.875572	t
4818	60	Tol Kampung Rambutan - Pondok Indah	-6.307626	106.875717	t
4819	60	Tol Kampung Rambutan - Pondok Labu	-6.307666	106.875542	t
4820	60	Tol Kampung Rambutan - T.B. Simatupang	-6.307651	106.875603	t
4821	111	Tol Kanci	-6.896754	108.820457	t
4822	85	Tol Kanci - Pejagan	-6.833625	108.643120	t
4823	61	Tol Kapuk - Ancol	-6.121782	106.768616	t
4824	61	Tol Kapuk - Pluit	-6.121783	106.768593	t
4825	61	Tol Kapuk arah Bandara Soekarno-Hatta	-6.122081	106.769005	t
4826	61	Tol Kapuk arah Kamal	-6.122094	106.768898	t
4827	61	Tol Kapuk-Priok 	-6.121832	106.770500	t
4828	39	Tol Karang Tengah	-6.194411	106.715775	t
4829	39	Tol Karang Tengah - Kebon Jeruk	-6.196447	106.713158	t
4830	57	Tol Karang Tengah - Kebon Jeruk (IPEKA)	-6.191014	106.750023	t
4831	39	Tol Karang Tengah - Tomang	-6.196345	106.713203	t
4832	88	Tol Karawang Barat - Cikampek	-6.355201	107.332603	t
4833	88	Tol Karawang Barat - Karawang Timur	-6.349025	107.272240	t
4834	88	Tol Karawang Barat arah Jakarta	-6.348733	107.263916	t
4835	88	Tol Karawang Barat-Cikarang Timur 	-6.355054	107.332352	t
4836	88	Tol Karawang Timur - Cikampek	-6.356148	107.335526	t
4837	88	Tol Karawang Timur arah Jakarta	-6.354592	107.330330	t
4838	88	Tol Karawang arah Jakarta	-6.398924	107.408531	t
4839	57	Tol Kebayoran Lama - Cipulir	-6.213429	106.780045	t
4840	146	Tol Kebomas - Gresik	-7.162191	112.601044	t
4841	57	Tol Kebon Jeruk	-6.190262	106.767998	t
4842	57	Tol Kebon Jeruk - Karang Tengah	-6.189964	106.769150	t
4843	57	Tol Kebon Jeruk - Tangerang	-6.189966	106.769119	t
4844	57	Tol Kebon Jeruk - Tomang	-6.189843	106.769104	t
4845	60	Tol Kebon Nanas - Cawang	-6.232363	106.876572	t
4846	60	Tol Kebon Nanas - Cempaka Putih	-6.232105	106.876404	t
4847	60	Tol Kebon Nanas - Pluit	-6.232386	106.876465	t
4848	60	Tol Kebon Nanas - Pulomas	-6.232402	106.876472	t
4849	60	Tol Kebon Nanas - Rawamangun	-6.232348	106.876457	t
4850	60	Tol Kebon Nanas - Tanjung Priok	-6.232369	106.876457	t
4851	57	Tol Kedoya - Karang Tengah	-6.190243	106.762138	t
4852	57	Tol Kedoya - Kb. Jeruk 	-6.190241	106.761406	t
4853	57	Tol Kedoya - Tomang	-6.190124	106.762131	t
4854	61	Tol Kelapa Gading-Ancol 	-6.150870	106.888512	t
4855	160	Tol Keluar Pandaan	-7.579434	112.691895	t
4856	57	Tol Kemanggisan - Meruya	-6.185084	106.788666	t
4857	57	Tol Kemanggisan - Tomang	-6.184955	106.788673	t
4858	61	Tol Kemayoran - Ancol Barat	-6.127845	106.843018	t
4859	61	Tol Kemayoran - Bandara Soekarno-Hatta	-6.127836	106.843056	t
4860	61	Tol Kemayoran - Gedong Panjang	-6.127841	106.843033	t
4861	61	Tol Kemayoran - Pluit	-6.127833	106.843086	t
4862	57	Tol Kembangan - Karang Tengah	-6.191562	106.742554	t
4863	57	Tol Kembangan - Kb. Jeruk 	-6.191435	106.742821	t
4864	57	Tol Kembangan - Kebon Jeruk	-6.190682	106.725914	t
4865	57	Tol Kembangan - Kunciran	-6.191559	106.742599	t
4866	57	Tol Kembangan - Tomang	-6.191428	106.742554	t
4867	57	Tol Kembangan-Kemanggisan 	-6.191009	106.742867	t
4868	57	Tol Kembangan-PIK 	-6.190667	106.725464	t
4869	60	Tol Kp. Rambutan	-6.307301	106.876717	t
4870	39	Tol Kunciran - Karang Tengah	-6.217741	106.667183	t
4871	39	Tol Kunciran - Kembangan 	-6.217716	106.667549	t
4872	39	Tol Kunciran - Merak	-6.217861	106.667183	t
4873	39	Tol Kunciran - Tangerang	-6.217856	106.667213	t
4874	39	Tol Kunciran-Meruya 	-6.217290	106.669029	t
4875	59	Tol Kuningan - Cawang	-6.241224	106.836418	t
4876	59	Tol Kuningan - Halim	-6.241210	106.836357	t
4877	59	Tol Kuningan - Keluar Senayan	-6.233052	106.821732	t
4878	59	Tol Kuningan - Keluar Slipi	-6.233149	106.821831	t
4879	59	Tol Kuningan - Mampang	-6.240818	106.832855	t
4880	59	Tol Kuningan - Pancoran	-6.241228	106.836472	t
4881	59	Tol Kuningan - Pejompongan	-6.233161	106.821846	t
4882	59	Tol Kuningan - Semanggi	-6.232955	106.821648	t
4883	59	Tol Kuningan - Slipi	-6.232993	106.821686	t
4884	59	Tol Kuningan - Tebet	-6.241217	106.836388	t
4885	59	Tol Kuningan - Tomang	-6.232877	106.821571	t
4886	59	Tol Kuningan-Senayan 	-6.240775	106.833778	t
4887	59	Tol Lb. Bulus - Priok	-6.289236	106.776619	t
4888	59	Tol Lb. Bulus-Kp. Rambutan 	-6.288990	106.777374	t
4889	59	Tol Lenteng Agung 	-6.304016	106.845840	t
4890	59	Tol Lenteng Agung - Ampera	-6.300156	106.833969	t
4891	59	Tol Lenteng Agung - Fatmawati	-6.300176	106.834000	t
4892	59	Tol Lenteng Agung - Gedong	-6.303816	106.845345	t
4893	59	Tol Lenteng Agung - Pasar Rebo	-6.303819	106.845398	t
4894	59	Tol Lenteng Agung - Pondok Indah	-6.300141	106.833931	t
4895	100	Tol Lingkar Luar Bogor	-6.568649	106.829208	t
4896	59	Tol MT Haryono	-6.243063	106.862038	t
4897	146	Tol Manyar	-7.147820	112.599136	t
4898	178	Tol Margomulyo	-7.241894	112.688576	t
4899	37	Tol Merak	-5.981034	106.020920	t
4900	57	Tol Meruya	-6.190987	106.726471	t
4901	57	Tol Meruya - Karang Tengah	-6.190892	106.726158	t
4902	57	Tol Meruya - Tomang	-6.190726	106.726196	t
4903	57	Tol Meruya arah Ulujami dan Pondok Indah	-6.196214	106.733673	t
4904	79	Tol Padaleunyi	-6.961317	107.609177	t
4905	80	Tol Padaleunyi KM 119	-6.833822	107.494225	t
4906	97	Tol Padaleunyi KM 120 (Pasir Koja)	-6.938142	107.552849	t
4907	80	Tol Padaleunyi KM 123	-6.864106	107.505997	t
4908	92	Tol Padaleunyi: Sadang KM 77	-6.509235	107.437965	t
4909	85	Tol Palikanci KM 208	-6.738088	108.516212	t
4910	85	Tol Palikanci arah Pejagan	-6.741418	108.517464	t
4911	85	Tol Palimanan - Kanci KM 12+000	-6.768480	108.534401	t
4912	85	Tol Palimanan arah Tol Pejagan	-6.798948	108.616318	t
4913	59	Tol Pancoran	-6.242071	106.839348	t
4914	59	Tol Pancoran - Cawang	-6.241966	106.839478	t
4915	59	Tol Pancoran - Pejompongan	-6.242110	106.839378	t
4916	59	Tol Pancoran - Semanggi	-6.242104	106.839333	t
4917	59	Tol Pancoran - Slipi	-6.242122	106.839417	t
4918	59	Tol Pancoran - Tebet	-6.241959	106.839455	t
4919	59	Tol Pancoran - Tomang	-6.242135	106.839462	t
4920	59	Tol Pancoran arah Kuningan	-6.242064	106.839165	t
4921	59	Tol Pancoran arah Kuningan	-6.242084	106.839256	t
4922	164	Tol Pandaan	-7.568182	112.715668	t
4923	60	Tol Pasar Minggu - Gedong	-6.304016	106.847557	t
4924	60	Tol Pasar Rebo - Cikunir	-6.305841	106.863945	t
4925	60	Tol Pasar Rebo - Cililitan	-6.296803	106.881729	t
4926	60	Tol Pasar Rebo - Cipayung	-6.312459	106.885780	t
4927	60	Tol Pasar Rebo - Fatmawati	-6.305966	106.863907	t
4928	60	Tol Pasar Rebo - Lebak Bulus	-6.305952	106.863869	t
4929	60	Tol Pasar Rebo - Pasar Minggu	-6.305928	106.863831	t
4930	81	Tol Pasir Gombong	-6.311481	107.134163	t
4931	101	Tol Pasteur	-6.888009	107.561676	t
4932	97	Tol Pasteur	-6.889607	107.570862	t
4933	97	Tol Pasteur KM 2	-6.888424	107.564949	t
4934	60	Tol Pd. Gede-Cawang	-6.289140	106.877136	t
4935	59	Tol Pd. Indah 	-6.289086	106.778572	t
4936	59	Tol Pd. Indah - Cikunir	-6.286932	106.776680	t
4937	59	Tol Pd. Indah - Ps. Minggu	-6.288852	106.778336	t
4938	59	Tol Pd. Indah-Lt. Agung	-6.288916	106.778389	t
4939	59	Tol Pd. Pinang 	-6.291262	106.783112	t
4940	59	Tol Pd. Pinang-Fatmawati	-6.294760	106.824471	t
4941	59	Tol Pd. Pinang-Pd. Labu 	-6.291353	106.783646	t
4942	40	Tol Pd. Ranji-Cilandak 	-6.282986	106.736252	t
4943	40	Tol Pd. Ranji-Fatmawati	-6.282666	106.736832	t
4944	60	Tol Pedati - Cawang	-6.227870	106.875443	t
4945	111	Tol Pejagan	-6.894506	108.886177	t
4946	111	Tol Pejagan	-6.898274	108.880180	t
4947	61	Tol Pejagan 	-6.135317	106.785736	t
4948	111	Tol Pejagan - Brebes	-6.894509	108.886032	t
4949	58	Tol Pejompongan - Cawang	-6.207713	106.803581	t
4950	58	Tol Pejompongan - Cengkareng	-6.207770	106.803452	t
4951	58	Tol Pejompongan - Senayan	-6.207686	106.803551	t
4952	58	Tol Pejompongan - Slipi	-6.207285	106.803055	t
4953	58	Tol Pejompongan - Tomang	-6.206845	106.802635	t
4954	58	Tol Pejompongan arah Semanggi	-6.207760	106.803627	t
4955	61	Tol Pelabuhan - Pluit	-6.128194	106.779457	t
4956	57	Tol Penjaringan - Kapuk 	-6.131872	106.803009	t
4957	155	Tol Penompo	-7.436411	112.455414	t
4958	178	Tol Perak	-7.224206	112.722557	t
4959	57	Tol Pluit	-6.146919	106.790817	t
4960	61	Tol Pluit - Ancol 	-6.127573	106.778816	t
4961	61	Tol Pluit - Ancol - Tanjung Priok - Pulomas	-6.128216	106.779472	t
4962	61	Tol Pluit - Ancol - Tanjung Priok - Sunter	-6.128000	106.779228	t
4963	61	Tol Pluit - Bandara Soekarno Hatta	-6.130942	106.782944	t
4964	61	Tol Pluit - Cempaka Putih	-6.128263	106.779526	t
4965	57	Tol Pluit - Grogol	-6.148299	106.791550	t
4966	61	Tol Pluit - Jembatan Tiga	-6.128157	106.779419	t
5057	97	Tol Purbaleunyi: Moh Toha KM 137+400	-6.961673	107.602669	t
4967	61	Tol Pluit - Jembatan Tiga - Gedong Panjang	-6.128138	106.779396	t
4968	61	Tol Pluit - Jembatan Tiga - Gedong Panjang  Kemayoran  Ancol  Priok	-6.128075	106.779320	t
4969	61	Tol Pluit - Kapuk	-6.128161	106.779243	t
4970	61	Tol Pluit - Rawamangun	-6.128313	106.779579	t
4971	61	Tol Pluit - Sunter	-6.128243	106.779503	t
4972	61	Tol Pluit - Tanjung Priok	-6.128120	106.779366	t
4973	61	Tol Pluit - Tanjung Priok - Cawang	-6.127960	106.779228	t
4974	61	Tol Pluit - Warakas	-6.128033	106.779274	t
4975	61	Tol Pluit arah Kamal	-6.128224	106.779343	t
4976	61	Tol Podomoro - Ancol	-6.151238	106.888252	t
4977	61	Tol Podomoro - Sunter	-6.151439	106.888161	t
4978	61	Tol Podomoro-Tj. Priok-Warakas	-6.150855	106.888420	t
4979	60	Tol Pondok Gede - Jt. Bening	-6.257591	106.912636	t
4980	60	Tol Pondok Gede arah Cawang dan Pancoran	-6.254926	106.905296	t
4981	59	Tol Pondok Indah - Cikunir	-6.288508	106.778175	t
4982	59	Tol Pondok Indah - Fatmawati	-6.288397	106.778069	t
4983	59	Tol Pondok Indah - Gedong	-6.288464	106.778130	t
4984	59	Tol Pondok Indah - Pasar Rebo	-6.288575	106.778214	t
4985	59	Tol Pondok Indah arah Bintaro	-6.288579	106.778046	t
4986	59	Tol Pondok Pinang - Ampera	-6.291322	106.783493	t
4987	59	Tol Pondok Pinang - Cikunir	-6.291339	106.783554	t
4988	59	Tol Pondok Pinang - Fatmawati	-6.291349	106.783585	t
4989	59	Tol Pondok Pinang - Gedong	-6.291327	106.783524	t
4990	59	Tol Pondok Pinang - Pasar Rebo	-6.291277	106.783371	t
4991	59	Tol Pondok Pinang - TMII KM 20	-6.286404	106.776413	t
4992	59	Tol Pondok Pinang - TMII KM 28	-6.303035	106.839874	t
4993	59	Tol Pondok Pinang arah Fatmawati	-6.291307	106.783447	t
4994	164	Tol Porong	-7.508812	112.699409	t
4995	61	Tol Priok - Pluit - Kapuk	-6.126943	106.884506	t
4996	61	Tol Prof Sedyatmo (Jalur atas)	-6.122714	106.759674	t
4997	61	Tol Prof. DR. Sedyatmo	-6.122596	106.762634	t
4998	61	Tol Prof. Sedayatmo	-6.122836	106.759697	t
4999	60	Tol Ps. Rebo	-6.310948	106.885345	t
5000	60	Tol Ps. Rebo - Cibubur	-6.310564	106.885323	t
5001	60	Tol Ps. Rebo - Kp. Rambutan 	-6.305925	106.863716	t
5002	60	Tol Ps. Rebo- Pd. Indah 	-6.305658	106.863457	t
5003	60	Tol Ps. Rebo-Cibubur	-6.312515	106.885803	t
5004	58	Tol Pulomas - Cawang	-6.175494	106.876205	t
5005	58	Tol Pulomas - Rawamangun	-6.175570	106.876198	t
5006	58	Tol Pulomas - Sunter - Tanjung Priok - Kemayoran	-6.175471	106.876122	t
5007	58	Tol Pulomas - Warakas	-6.175431	106.876129	t
5008	58	Tol Pulomas arah ke Tanjung Priok	-6.175379	106.876137	t
5009	58	Tol Pulomas-Sunter 	-6.176897	106.876076	t
5010	97	Tol Purbaleunyi	-6.938419	107.674278	t
5011	97	Tol Purbaleunyi Buah Batu - M. Toha - Kopo	-6.964597	107.629219	t
5012	88	Tol Purbaleunyi Cileunyi - Pasteur - Padalarang - Dawuan	-6.418673	107.418526	t
5013	92	Tol Purbaleunyi Jatiluhur KM 87	-6.593525	107.429947	t
5014	92	Tol Purbaleunyi Jatiluhur KM 99	-6.688030	107.436440	t
5015	92	Tol Purbaleunyi KM 100	-6.701221	107.433372	t
5016	80	Tol Purbaleunyi KM 107	-6.808234	107.470535	t
5017	80	Tol Purbaleunyi KM 108 - KM 112 Cikubang	-6.808745	107.471306	t
5018	80	Tol Purbaleunyi KM 110 - KM 112	-6.795743	107.445572	t
5019	80	Tol Purbaleunyi KM 115	-6.815648	107.478607	t
5020	80	Tol Purbaleunyi KM 117	-6.818056	107.480774	t
5021	80	Tol Purbaleunyi KM 118 (Cikamuning)	-6.818924	107.481934	t
5022	80	Tol Purbaleunyi KM 120	-6.860346	107.505020	t
5023	101	Tol Purbaleunyi KM 127 (Tol Pasteur)	-6.899150	107.538094	t
5024	79	Tol Purbaleunyi KM 130	-6.948899	107.560661	t
5025	97	Tol Purbaleunyi KM 131	-6.962467	107.593407	t
5026	97	Tol Purbaleunyi KM 132	-6.962233	107.596512	t
5027	97	Tol Purbaleunyi KM 135+600 (Tol Kopo)	-6.957887	107.574928	t
5028	79	Tol Purbaleunyi KM 137	-6.959868	107.578362	t
5029	97	Tol Purbaleunyi KM 139	-6.961647	107.604027	t
5030	97	Tol Purbaleunyi KM 142 Buah Batu	-6.964778	107.630669	t
5031	97	Tol Purbaleunyi KM 142+ (Buah Batu)	-6.965310	107.633751	t
5032	97	Tol Purbaleunyi KM 144	-6.965278	107.654106	t
5033	97	Tol Purbaleunyi KM 147	-6.968601	107.681290	t
5034	97	Tol Purbaleunyi KM 148	-6.968921	107.684364	t
5035	97	Tol Purbaleunyi KM 149	-6.969496	107.690308	t
5036	97	Tol Purbaleunyi KM 151	-6.969709	107.695091	t
5037	97	Tol Purbaleunyi KM 154	-6.966961	107.705864	t
5038	88	Tol Purbaleunyi KM 68	-6.428300	107.424805	t
5039	92	Tol Purbaleunyi KM 74 (Sadang)	-6.494546	107.443909	t
5040	92	Tol Purbaleunyi KM 75	-6.495708	107.443275	t
5041	92	Tol Purbaleunyi KM 79	-6.513286	107.436203	t
5042	92	Tol Purbaleunyi KM 84 (Purwakarta)	-6.591308	107.430496	t
5043	92	Tol Purbaleunyi KM 85	-6.592374	107.430237	t
5044	92	Tol Purbaleunyi KM 86	-6.582196	107.433144	t
5045	92	Tol Purbaleunyi KM 90	-6.620659	107.422470	t
5046	92	Tol Purbaleunyi KM 90 - Jakarta	-6.700220	107.433594	t
5047	92	Tol Purbaleunyi KM 91+250	-6.624048	107.422646	t
5048	92	Tol Purbaleunyi KM 92	-6.626265	107.423027	t
5049	92	Tol Purbaleunyi KM 93	-6.629398	107.418739	t
5050	92	Tol Purbaleunyi KM 96	-6.665076	107.441719	t
5051	101	Tol Purbaleunyi Km 126+	-6.898138	107.532463	t
5052	79	Tol Purbaleunyi Kopo	-6.960459	107.579575	t
5053	92	Tol Purbaleunyi Sadang KM 72	-6.580061	107.434128	t
5054	92	Tol Purbaleunyi Sadang KM 73	-6.580533	107.434036	t
5055	97	Tol Purbaleunyi: Buah Batu KM 145	-6.965726	107.656448	t
5056	97	Tol Purbaleunyi: Buah Batu KM 146	-6.967685	107.671295	t
5058	79	Tol Purbaleunyi: Moh. Toha KM 140	-6.961594	107.605247	t
5059	80	Tol Purbanleunyi KM 115	-6.846584	107.505775	t
5060	57	Tol Puri-Tomang 	-6.189654	106.731178	t
5061	57	Tol Rawa Buaya	-6.161009	106.727325	t
5062	60	Tol Rawamangun - Cawang	-6.197636	106.874062	t
5063	60	Tol Rawamangun - Cempaka Putih	-6.197308	106.874023	t
5064	60	Tol Rawamangun - Jagorawi	-6.197604	106.874069	t
5065	60	Tol Rawamangun - Jatinegara	-6.198270	106.873810	t
5066	60	Tol Rawamangun - Tanjung Priok	-6.197609	106.873940	t
5067	60	Tol Rawamangun - Tanjung Priok - Pluit	-6.197500	106.873985	t
5068	60	Tol Rawamangun - Tanjung Priok - Warakas	-6.197414	106.874001	t
5069	60	Tol Rawamangun arah Cawang	-6.197666	106.874054	t
5070	178	Tol Romokalisari	-7.210473	112.645485	t
5071	178	Tol Satelit - Hr. Mohammad	-7.290415	112.700180	t
5072	178	Tol Satelit - Perak	-7.289149	112.700371	t
5073	178	Tol Satelit - Sidoarjo	-7.337589	112.713570	t
5074	178	Tol Satelit - Waru	-7.299429	112.698463	t
5075	178	Tol Satelit - Waru	-7.292043	112.698395	t
5076	39	Tol Sedyatmo - Pluit	-6.114083	106.684837	t
5077	39	Tol Sedyatmo Bandara Soekarno - Hatta arah GT Kapuk	-6.114102	106.684799	t
5078	58	Tol Semanggi	-6.220041	106.812729	t
5079	59	Tol Semanggi - Cawang	-6.224708	106.816078	t
5080	59	Tol Semanggi - Kuningan	-6.224751	106.816109	t
5081	59	Tol Semanggi - Pancoran	-6.224786	106.816132	t
5082	58	Tol Semanggi - Slipi	-6.213980	106.808601	t
5083	58	Tol Semanggi - Tomang	-6.214070	106.808678	t
5084	58	Tol Semanggi-Grogol 	-6.218570	106.811783	t
5085	61	Tol Semper - Cakung - Cikunir - TMII 	-6.139239	106.938148	t
5086	60	Tol Semper - Cikunir - Kampung Rambutan - Veteran - Serpong	-6.307638	106.875664	t
5087	58	Tol Senayan - Cawang	-6.213923	106.808754	t
5088	58	Tol Senayan - Tomang	-6.214011	106.808632	t
5089	58	Tol Senayan arah Grogol	-6.213926	106.808571	t
5090	58	Tol Senayan arah Slipi	-6.213825	106.808495	t
5091	58	Tol Senayan-Pejompongan 	-6.212170	106.807045	t
5092	58	Tol Senayan-Tomang 	-6.212149	106.806862	t
5093	82	Tol Sentul - Ciawi	-6.535985	106.851738	t
5094	82	Tol Sentul - Cimanggis	-6.501547	106.867012	t
5095	82	Tol Sentul-Ps. Rebo 	-6.533868	106.852081	t
5096	59	Tol Serpong - Jkt 	-6.267800	106.768181	t
5097	59	Tol Serpong - Pd. Ranji - Ulujami	-6.267651	106.768074	t
5098	60	Tol Serpong - Veteran - TMII - Cikunir - Semper	-6.305758	106.886879	t
5099	59	Tol Serpong - Veteran - TMII - Semper	-6.266320	106.767876	t
5100	59	Tol Serpong-Pd. ndah 	-6.265848	106.767860	t
5101	164	Tol Sidoarjo	-7.448191	112.697220	t
5102	164	Tol Sidoarjo - Porong	-7.446353	112.697388	t
5103	164	Tol Sidoarjo - Surabaya	-7.418538	112.694260	t
5104	178	Tol Sidoarjo - Waru	-7.354997	112.709000	t
5105	57	Tol Slipi	-6.194230	106.797363	t
5106	58	Tol Slipi - Cawang	-6.214399	106.809090	t
5107	57	Tol Slipi - Grogol - Angke	-6.194358	106.797348	t
5108	58	Tol Slipi - Kuningan	-6.214471	106.809128	t
5109	57	Tol Slipi - Pancoran	-6.195510	106.797585	t
5110	58	Tol Slipi - Semanggi	-6.214357	106.809052	t
5111	57	Tol Slipi - Semanggi - Cawang	-6.196370	106.797676	t
5112	57	Tol Slipi - Tebet	-6.196460	106.797699	t
5113	57	Tol Slipi - Tomang	-6.198363	106.798134	t
5114	36	Tol Soeta	-6.098189	106.717133	t
5115	36	Tol Soeta - Kapuk	-6.099804	106.718613	t
5116	36	Tol Soeta-JKT	-6.098951	106.717865	t
5117	116	Tol Solo Kertosono(PlosoKerep)	-7.515364	110.843681	t
5118	57	Tol Srengseng	-6.209888	106.740631	t
5119	61	Tol Sunter - Cawang	-6.158982	106.883575	t
5120	61	Tol Sunter - Pluit	-6.156158	106.885170	t
5121	61	Tol Sunter - Rawamangun	-6.159009	106.883560	t
5122	61	Tol Sunter arah Bandara Soekarno - Hatta	-6.156131	106.885201	t
5123	61	Tol Sunter-Tj. Priok 	-6.156698	106.884926	t
5124	178	Tol Surabaya - Gempol	-7.341930	112.712219	t
5125	178	Tol Surabaya - Gresik	-7.244279	112.699966	t
5126	164	Tol Surabaya - Porong	-7.519193	112.696190	t
5127	178	Tol Surabaya - Sidoarjo	-7.351603	112.709686	t
5128	141	Tol Suramadu	-7.158870	112.782043	t
5129	59	Tol T. B. Simatupang arah Bandara Soekarno - Hatta	-6.292430	106.802559	t
5130	59	Tol T.B. Simatupang	-6.292343	106.795158	t
5132	60	Tol TMII - Ampera	-6.305990	106.883438	t
5133	60	Tol TMII - Bambu Apus	-6.305804	106.888428	t
5134	60	Tol TMII - Cawang	-6.304679	106.883804	t
5135	60	Tol TMII - Cibubur	-6.304661	106.884018	t
5136	60	Tol TMII - Cikunir	-6.305802	106.888344	t
5137	60	Tol TMII - Cikunir - Cakung - Semper	-6.305746	106.887001	t
5138	60	Tol TMII - Cililitan	-6.304605	106.883789	t
5139	60	Tol TMII - Cipayung	-6.306213	106.880775	t
5140	60	Tol TMII - Fatmawati	-6.305986	106.883545	t
5142	60	Tol TMII - Pondok Gede	-6.305798	106.888184	t
5143	60	Tol TMII - Pondok Indah	-6.306158	106.881485	t
5144	60	Tol TMII - Pondok Labu	-6.306164	106.881447	t
5145	60	Tol TMII - Ps. Rebo	-6.306202	106.881371	t
5146	60	Tol TMII - Serpong	-6.308452	106.872406	t
5147	60	Tol TMII - Tanjung Priok	-6.304469	106.883774	t
5148	164	Tol Tambaksumur - Wadungasri	-7.343016	112.768036	t
5149	81	Tol Tambun - Bekasi Barat	-6.275506	107.050949	t
5150	81	Tol Tambun - Bekasi Timur	-6.275321	107.050529	t
5151	81	Tol Tambun - Cibatu	-6.275275	107.050850	t
5152	81	Tol Tambun - Cibitung 	-6.275532	107.051094	t
5153	81	Tol Tambun - Cikunir	-6.275416	107.050758	t
5154	81	Tol Tambun - Jt. Bening	-6.269624	107.037186	t
5155	81	Tol Tambun KM 22	-6.272919	107.045372	t
5156	81	Tol Tambun arah Cikampek	-6.276892	107.055008	t
5157	178	Tol Tandes	-7.239341	112.682259	t
5158	178	Tol Tandes - Gresik	-7.238553	112.677475	t
5159	178	Tol Tandes Barat - Gresik	-7.239703	112.681213	t
5160	36	Tol Tangerang - Cikupa KM 30	-6.207502	106.541626	t
5161	39	Tol Tangerang - Karang Tengah KM 18	-6.222263	106.636017	t
5162	39	Tol Tangerang - Merak	-6.222551	106.635162	t
5163	36	Tol Tangerang - Merak KM 29	-6.210599	106.548103	t
5164	39	Tol Tangerang arah ke Cikupa	-6.222546	106.635117	t
5165	39	Tol Tangerang-Kb. Jeruk 	-6.222132	106.636948	t
5166	39	Tol Tangerang-Kembangan 	-6.222430	106.635727	t
5167	39	Tol Tangerang-Kunciran 	-6.222281	106.636673	t
5168	39	Tol Tangerang-Tomang 	-6.222025	106.637810	t
5169	57	Tol Tanjung Duren	-6.175990	106.792992	t
5170	57	Tol Tanjung Duren - Cawang	-6.174165	106.791100	t
5171	57	Tol Tanjung Duren - Keluar Slipi	-6.174116	106.791039	t
5172	57	Tol Tanjung Duren - Senayan	-6.174141	106.791069	t
5173	61	Tol Tanjung Priok - Ancol	-6.128625	106.887604	t
5174	61	Tol Tanjung Priok - Ancol - Pluit	-6.128311	106.887138	t
5175	61	Tol Tanjung Priok - Cawang	-6.144168	106.890572	t
5176	61	Tol Tanjung Priok - Kemayoran	-6.128287	106.887100	t
5177	61	Tol Tanjung Priok - Rawamangun	-6.144209	106.890556	t
5178	61	Tol Tanjung Priok - Sunter	-6.144195	106.890564	t
5179	59	Tol Tebet - Cawang	-6.243221	106.850143	t
5180	59	Tol Tebet - Kuningan	-6.243307	106.850121	t
5181	59	Tol Tebet - Pejompongan	-6.243307	106.850098	t
5182	59	Tol Tebet - Semanggi	-6.243308	106.850075	t
5183	59	Tol Tebet - Tomang	-6.243307	106.850143	t
5184	59	Tol Tegal Parang - Semanggi	-6.240586	106.833382	t
5185	59	Tol Tendean 	-6.239602	106.831635	t
5186	61	Tol Tj. Priok	-6.128735	106.887810	t
5187	57	Tol Tomang	-6.181649	106.796791	t
5188	57	Tol Tomang - Cawang	-6.184433	106.796982	t
5189	57	Tol Tomang - Karang Tengah	-6.182965	106.792824	t
5190	57	Tol Tomang - Karang Tengah - Tangerang - Bitung	-6.182884	106.792900	t
5191	57	Tol Tomang - Kebon Jeruk	-6.182915	106.792877	t
5192	57	Tol Tomang - Keluar Slipi	-6.184381	106.796982	t
5193	57	Tol Tomang - Keluar Tanjung Duren	-6.176022	106.792915	t
5194	57	Tol Tomang - Kemanggisan	-6.182856	106.792923	t
5195	57	Tol Tomang - Senayan	-6.184411	106.796982	t
5196	57	Tol Tomang - Tangerang	-6.182946	106.792854	t
5197	57	Tol Tomang KM 5 arah Tangerang	-6.188052	106.775307	t
5198	57	Tol Tomang-Meruya 	-6.178636	106.795563	t
5199	57	Tol Tomang-Semanggi	-6.183798	106.796913	t
5200	60	Tol UKI -Tj. Priok 	-6.249350	106.875854	t
5201	59	Tol Ulujami - Cikunir	-6.241546	106.758667	t
5202	59	Tol Ulujami - Ciledug	-6.241465	106.758492	t
5203	59	Tol Ulujami - Gedong	-6.241487	106.758652	t
5204	59	Tol Ulujami - Keluar Fatmawati	-6.241580	106.758675	t
5205	59	Tol Ulujami - Pasar Minggu	-6.241514	106.758659	t
5206	59	Tol Ulujami - Pasar Rebo	-6.241446	106.758644	t
5207	59	Tol Ulujami - Pd. Labu	-6.239450	106.758209	t
5208	59	Tol Ulujami - Pd. Ranji - Serpong	-6.241682	106.758682	t
5209	59	Tol Ulujami - Veteran	-6.239591	106.758232	t
5210	59	Tol Ulujami-Cilandak 	-6.241650	106.758675	t
5211	59	Tol Veteran 	-6.267032	106.768066	t
5212	59	Tol Veteran - Ampera	-6.266383	106.767876	t
5213	59	Tol Veteran - Bintaro	-6.266776	106.767944	t
5214	59	Tol Veteran - Fatmawati	-6.266587	106.767906	t
5215	59	Tol Veteran - Gedong	-6.266656	106.767921	t
5216	59	Tol Veteran - Lt. Agung	-6.265774	106.767838	t
5217	59	Tol Veteran - Pasar Minggu	-6.266626	106.767914	t
5218	59	Tol Veteran - Pasar Rebo	-6.266536	106.767906	t
5219	59	Tol Veteran arah ke Pondok Indah	-6.266260	106.767868	t
5220	61	Tol Warakas - Cawang	-6.124374	106.872330	t
5221	61	Tol Warakas - Gedong Panjang	-6.124440	106.872116	t
5222	61	Tol Warakas - Pluit	-6.124371	106.871765	t
5223	61	Tol Warakas - Tanjung Priok	-6.124421	106.872589	t
5224	61	Tol Warakas - Tj. Priok	-6.124490	106.872551	t
5225	178	Tol Waru	-7.286020	112.705116	t
5226	178	Tol Waru	-7.344165	112.711571	t
5227	178	Tol Waru - Gresik	-7.313199	112.715004	t
5228	178	Tol Waru - Juanda	-7.346889	112.730927	t
5229	178	Tol Waru - Medaeng	-7.346783	112.724556	t
5230	178	Tol Waru - Perak	-7.334838	112.713959	t
5231	178	Tol Waru - Satelit	-7.298945	112.698326	t
5232	178	Tol Waru - Sidoarjo	-7.353529	112.709274	t
5233	178	Tol Waru KM 15	-7.328799	112.714981	t
5234	60	Tol Wiyoto Wiyono	-6.215820	106.874146	t
5235	60	Tol Wiyoto Wiyono - Cawang - Pedati	-6.241436	106.877419	t
5236	60	Tol Wiyoto Wiyono - Cawang - Rawamangun	-6.241319	106.877449	t
5237	60	Tol Wiyoto Wiyono Cawang	-6.238975	106.878098	t
5238	60	Tol Wiyoto Wiyono Cawang - TMII	-6.241274	106.877563	t
5239	60	Tol Wiyoto Wiyono Cawang - Tanjung Priok - Ancol - Pluit	-6.241478	106.877403	t
5240	81	Tol_Japek Cikarang - Bekasi Barat 	-6.298535	107.112816	t
5241	59	Toldakot (Patra Jasa) - Pancoran	-6.233852	106.822937	t
5242	57	Toldakot - Tomang - Slipi	-6.179447	106.796165	t
5243	59	Toldakot Cawang - Kuningan	-6.243276	106.851158	t
5245	59	Toldakot Kuningan	-6.236867	106.827248	t
5246	58	Toldakot Pejompongan	-6.207735	106.803612	t
5247	58	Toldakot Semanggi	-6.219449	106.812355	t
5248	59	Toldakot Tebet - Semanggi	-6.243322	106.850281	t
5249	58	Toldalkot Slipi - Cawang	-6.203936	106.800758	t
5250	61	Toll Jorr Cilincing 	-6.129439	106.931068	t
5251	57	Tomang - Grogol	-6.176012	106.801682	t
5252	57	Tomang - Kemanggisan 	-6.180193	106.796379	t
5253	57	Tomang - Kuningan	-6.185099	106.796982	t
5254	57	Tomang - Semanggi	-6.179717	106.796303	t
5255	57	Tomang - Slipi	-6.179502	106.796349	t
5256	57	Tomang arah Slipi	-6.200216	106.799217	t
5257	36	Tong Cengkareng - Pesing	-6.103901	106.699432	t
5258	60	Transmart Carefour	-6.248603	106.932091	t
5259	167	Trenggalek	-8.088739	111.712807	t
5260	59	Triloka 1	-6.248123	106.842125	t
5261	164	Tropodo	-7.358519	112.764526	t
5262	164	Trosobo	-7.376384	112.641579	t
5263	164	Trosobo (Masjid Al Wahyu)	-7.371542	112.646881	t
5264	164	Trosobo - Krian	-7.375874	112.642738	t
5265	164	Trosobo arah Surabaya	-7.371554	112.646835	t
5266	155	Trowulan	-7.549719	112.382584	t
5267	57	Tubagus Angke - Bandengan	-6.142826	106.793213	t
5268	168	Tuban - Paciran	-6.885378	112.050934	t
5269	168	Tuban arah Surabaya	-6.885080	112.050423	t
5270	55	Tugu	-7.783027	110.360756	t
5271	55	Tugu - Jl. Margo Utomo	-7.782726	110.367104	t
5272	150	Tugu Adipura	-7.112561	112.417603	t
5273	157	Tugu Adipura Ngawi	-7.410740	111.443298	t
5274	54	Tugu Ireng Magelang - Yogya	-7.641369	110.322838	t
5275	130	Tugu Kartasura	-7.550174	110.736580	t
5276	139	Tugu Lilin	-7.567684	110.783836	t
5277	79	Tugu Stroberi, Soreang	-7.016761	107.547585	t
5278	58	Tugu Tani arah Cikini	-6.183355	106.834648	t
5279	55	Tugu Yogya - Jl. Jend Sudirman	-7.782803	110.366959	t
5280	55	Tugu Yogyakarta	-7.782942	110.367493	t
5281	178	Tunjungan	-7.259605	112.738998	t
5282	178	Tunjungan (Siola)	-7.255913	112.737038	t
5283	96	Turunan Malangbong	-7.104284	108.103813	t
5284	79	Turunan Nagreg	-7.021713	107.892982	t
5285	79	Turunan Nagrek (menuju Cagak)	-7.034890	107.905197	t
5286	86	Tutugan Leles	-7.122526	107.899590	t
5287	178	Tuwowo - Kenjeran	-7.244753	112.767075	t
5288	103	U-Turn BII Margonda	-6.388286	106.826584	t
5289	178	U-Turn Darmo	-7.296170	112.739250	t
5290	59	UI - Lt. Agung	-6.354326	106.832298	t
5291	60	UKI Cawang	-6.250310	106.873436	t
5292	139	UMY SURAKARTA	-7.558206	110.778580	t
5293	54	UMY Yogyakarta	-7.810961	110.324532	t
5294	57	UNTAR 	-6.169526	106.788483	t
5295	178	UPN	-7.332428	112.789635	t
5296	97	Ujung Berung - Cipadung	-6.921165	107.709465	t
5297	59	Ulujami	-6.245361	106.762817	t
5298	59	Ulujami - Kampung Rambutan	-6.239685	106.758255	t
5299	59	Ulujami arah Fatmawati	-6.241308	106.758553	t
5300	59	Ulujami arah TMII	-6.240626	106.758400	t
5301	178	Undaan	-7.251240	112.745155	t
5302	178	Undaan (Simpang Jagalan)	-7.248579	112.746765	t
5303	178	Undaan - Jagalan - Kalianyar	-7.248600	112.746422	t
5304	178	Undaan Kulon	-7.250495	112.745476	t
5305	178	Undaan Wetan	-7.252134	112.744812	t
5306	58	Underpass Angkasa Kemayoran arah ke Jl. K.H. Samanhudi	-6.158726	106.838753	t
5307	60	Underpass Pasar Gembrong arah ke Kampung Melayu	-6.224776	106.875343	t
5308	59	Underpass Pasar Minggu arah ke Tanjung Barat	-6.288042	106.843544	t
5309	59	Underpass Pondok Indah	-6.265005	106.783585	t
5310	58	Underpass Senen arah Cempaka Putih	-6.178017	106.842651	t
5311	58	Underpass arah Senen	-6.175093	106.846321	t
5312	55	Univ Sanata Dharma YK	-7.775543	110.389122	t
5313	60	Univ. As Syafi'iyah Jatiwaringin	-6.262124	106.910767	t
5314	59	Universitas Budi Luhur (Ciledug) - ITC Cipulir	-6.237778	106.765579	t
5315	59	Universitas Pancasila - Lenteng Agung	-6.339889	106.833870	t
5316	59	Universitas Pancasila - Tanjung Barat	-6.340002	106.833839	t
5317	57	Universitas Trisakti	-6.168173	106.788490	t
5318	178	Urip Sumoharjo - Basuki Rahmat	-7.274448	112.741867	t
5319	178	Urip Sumoharjo - Pandegiling	-7.277304	112.741203	t
5320	178	Veteran - Kebonrojo	-7.243204	112.738022	t
5321	174	Veteran - Sumbersari	-7.956770	112.612846	t
5322	59	Veteran arah Tanah Kusir	-6.267992	106.767387	t
5323	178	WR Supratman	-7.280592	112.738655	t
5324	61	WTC Mangga Dua-Ancol 	-6.132730	106.831444	t
5325	178	Walikota Mustajab	-7.260031	112.744255	t
5326	107	Wangon	-7.517176	109.056160	t
5327	107	Wangon - Banyumas	-7.517161	109.056152	t
5328	61	Warakas - Ancol	-6.124468	106.872787	t
5329	61	Warakas - Gd. Panjang 	-6.119647	106.873756	t
5330	61	Warakas - Mall Artha Gading 	-6.119113	106.874420	t
1	178	A Yani	-7.337887	112.729362	t
2	178	A Yani (Giant)	-7.315088	112.734520	t
3	178	A Yani (Taman Pelangi)	-7.327512	112.730797	t
4	178	A Yani - JX	-7.317818	112.734039	t
5	178	A Yani - Margorejo	-7.316498	112.734657	t
6	178	A Yani - Polda	-7.323309	112.732475	t
7	178	A. Yani (Hotel Papilio)	-7.331438	112.730690	t
8	164	A. Yani (Jatim Expo)	-7.398004	112.727432	t
9	178	A. Yani (Kejati)	-7.314306	112.734360	t
10	178	A. Yani (Royal Plaza)	-7.309858	112.735329	t
11	178	A. Yani - Mayangkara	-7.307352	112.735802	t
12	174	A. Yani - Raden Intan	-7.929193	112.648903	t
13	164	A. Yani Gedangan	-7.393834	112.727646	t
14	178	AJBS (Jl. Ratna)	-7.291494	112.745392	t
15	135	ARTOS MALL	-7.503812	110.223846	t
16	142	ASDP Ketapang	-8.143014	114.400246	t
17	60	ASMI Jaktim	-6.171876	106.888702	t
18	178	Achmad Jais	-7.253602	112.737946	t
19	178	Adityawarman - Indragiri	-7.292937	112.729858	t
20	178	Adityawarman - Kutai	-7.294374	112.731712	t
21	178	Al-Akbar	-7.336780	112.714188	t
22	153	Alternatif Solo - Magetan	-7.665145	111.204857	t
23	79	Alun - Alun Banjaran	-7.051117	107.597145	t
24	86	Alun - Alun Leles, Garut	-7.109367	107.898148	t
25	164	Alun - Alun Sidoarjo	-7.446603	112.718956	t
26	96	Alun - Alun Singaparna	-7.349499	108.110825	t
27	86	Alun - alun Tarogong arah ke Bandung	-7.189835	107.889404	t
28	55	Alun Alun Utara	-7.804084	110.365540	t
29	160	Alun-Alun Bangil	-7.598476	112.784355	t
243	146	Cerme	-7.226249	112.568237	t
349	88	Dawuan 	-6.414611	107.415176	t
522	60	Exit Tol Halim	-6.244443	106.894958	t
878	0	Jembarana - Gilimanuk	-8.357941	114.631691	t
879	0	Jembatan Ampera, Palembang	-2.991985	104.763649	t
932	97	Jl Andir	-6.917171	107.585106	t
1100	59	Jl Moh. Kafi 2	-6.336316	106.825394	t
1243	0	Jl Yos Sudarso, Tarakan	3.296289	117.587120	t
1279	178	Jl. Adityawarman	-7.293597	112.730614	t
1492	0	Jl. Cokroaminoto-HI 	-8.611637	115.192039	t
1864	57	Jl. Lada	-6.136480	106.814186	t
2070	0	Jl. Pantai Pulau Merah	-8.583493	114.046532	t
2946	143	Kesamben	-8.145499	112.367928	t
3347	162	Pasar Leces	-7.844145	113.228745	t
3661	160	Puwodadi	-7.806688	112.730026	t
4045	0	Simpang Tiga - Bakauheni	-5.479001	105.791023	t
4233	0	Tarahan - Lampung Selatan	-5.556873	105.373497	t
4408	59	Tol Cawang arah Semanggi	-6.243238	106.858192	t
5131	60	Tol TMII	-6.308452	106.872406	t
5141	60	Tol TMII - Gedong	-6.306578	106.892281	t
5244	57	Toldakot Grogol	-6.162153	106.790359	t
5331	61	Warakas-Tj. Proik-Cawang 	-6.124575	106.873070	t
5332	178	Waru	-7.352928	112.729111	t
5333	164	Waru (Giant)	-7.366821	112.729256	t
5334	164	Waru (Pepelegi)	-7.367718	112.729111	t
5335	81	Warung Bongkok 	-6.277985	107.114326	t
5336	59	Warung Buncit-Mampang 	-6.270338	106.830757	t
5337	59	Warung Jati - Mampang	-6.259162	106.828545	t
5338	59	Warung Jati arah Mampang Prapatan	-6.268072	106.830933	t
5339	84	Warung Kondang - Cianjur	-6.874620	107.082581	t
5340	160	Warungdowo	-7.687048	112.882698	t
5341	178	Wijaya Kusuma	-7.260031	112.748779	t
5342	156	Wilangan	-7.601682	111.788376	t
5343	156	Wilangan -  Saradan	-7.600789	111.788689	t
5344	156	Wilangan arah Bagor	-7.590027	111.797623	t
5345	178	Wisma Lidah Kulon	-7.307112	112.652626	t
5346	178	Wiyung	-7.313731	112.696571	t
5347	178	Wiyung - Meganti	-7.313985	112.695908	t
5348	143	Wlingi	-8.079094	112.330658	t
5349	133	Wonogiri	-7.804456	110.916061	t
5350	133	Wonogiri - Ponorogo	-7.829190	111.053299	t
5351	178	Wonokromo	-7.302664	112.736916	t
5352	178	Wonokromo (RSI)	-7.306676	112.735260	t
5353	178	Wonokromo - Flyover	-7.307240	112.735909	t
5354	178	Wonokromo Stasiun 	-7.301954	112.738838	t
5355	160	Wonorejo Pandaan	-7.716414	112.805321	t
5356	52	Wonosari YK	-7.959320	110.594215	t
5357	52	Wonosari arah ke Yogyakarta	-7.959275	110.594322	t
5358	52	Wonosari-Pracimantoro	-8.005198	110.716393	t
5359	164	Wringinanom	-7.390514	112.556602	t
5360	164	Wringinanom - Legundi	-7.384513	112.576126	t
5361	178	Yos Sudarso DPRD	-7.263176	112.745979	t
5362	151	depan Terminal Minak Koncar	-8.137661	113.218498	t
5363	121	jl Magelang-jogja	-7.583537	110.286438	t
5364	57	jl. pantai indah kapuk 	-6.111347	106.738098	t
5365	178	kedingding lor	-7.222673	112.780968	t
5366	178	krembangan baru 7	-7.238218	112.729378	t
\.


--
-- Name: places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('places_id_seq', 5366, true);


--
-- Data for Name: raws; Type: TABLE DATA; Schema: public; Owner: user
--

COPY raws (id, respondent_id, t_id, t_time, info, url, media, width, height, processed, created, modified, active) FROM stdin;
2	34	868718049850834944	2017-05-28 13:38:17	13.39.Wib.Arus Lalin Exit Balaraja Barat.LANCAR.Untuk kelancaran gunakan Uang pas /E-.Jaga jarak aman berkendara. https://t.co/VvXHfgUnUH		https://pbs.twimg.com/media/DA5OaV2UIAAVivo.jpg	0	0	f	2017-05-28 13:39:03.745746	2017-05-28 13:39:03.745779	t
3	19	868717876579979266	2017-05-28 13:37:36	13.37: RT @yulius_arianto: Lalin padat merayap efek pembangunan jalan di depan mitra 10 trans Cibubur. https://t.co/XLjZVFJmTN		https://pbs.twimg.com/media/DA5MiLqVwAAHqV4.jpg	0	0	f	2017-05-28 13:39:03.831072	2017-05-28 13:39:03.831126	t
4	34	868717811111211009	2017-05-28 13:37:20	13.37.Wib.Situasi Lalin Gerbang Cikupa Arah Jakarta dan Sebaliknya Arah Merak saat ini.Lancar.Jaga jarak aman berke… https://t.co/9PaQHTRKdB	https://twitter.com/i/web/status/868717811111211009		0	0	f	2017-05-28 13:39:03.842396	2017-05-28 13:39:03.842445	t
5	34	868717475281518592	2017-05-28 13:36:00	13.36.Wib.Arus Lalin Exit Serang Timur.LANCAR.Untuk kelancaran gunakan Uang pas /E-.Jaga jarak aman berkendara https://t.co/fWj3ROIplo		https://pbs.twimg.com/media/DA5N7o_VwAEUeyJ.jpg	0	0	f	2017-05-28 13:39:03.853133	2017-05-28 13:39:03.853183	t
6	55	868717473981321216	2017-05-28 13:36:00	13.36 Proses evakuasi Truk tangki Pertamina yg menabrak pembatas jalan di selepas flyover Balaraja\n@lantastngkab \nhttps://t.co/emj32CFnlQ		https://pbs.twimg.com/media/DA5JlxWUAAEPgQA.jpg	0	0	f	2017-05-28 13:39:03.862971	2017-05-28 13:39:03.863017	t
7	34	868717256242470912	2017-05-28 13:35:08	13.35 Wib.Terpantau arus lalin GT Merak arah Jakarta / arah Pelabuhan Merak Lancar.Jaga jarak aman berkendar https://t.co/IqaE0DvbCd		https://pbs.twimg.com/media/DA5Nuo5V0AEevUJ.jpg	0	0	f	2017-05-28 13:39:03.872188	2017-05-28 13:39:03.872231	t
8	17	868716923575468032	2017-05-28 13:33:49	Dishub pkl 13.31 wib: Arus lalu lintas jl pemuda terpantau ramai lancar https://t.co/v3i5DaNUjT	http://fb.me/11cRkLx1S		0	0	f	2017-05-28 13:39:03.881576	2017-05-28 13:39:03.881617	t
9	23	868716896287313920	2017-05-28 13:33:42	#Tol_Purbaleunyi Truk arah Jakarta agar melalui lajur pemeriksaan KM 120			0	0	f	2017-05-28 13:39:03.8899	2017-05-28 13:39:03.889941	t
10	23	868716843929817088	2017-05-28 13:33:30	#Tol_Purbaleunyi Truk arah Bandung agar melalui lajur pemeriksaan KM 83+600.			0	0	f	2017-05-28 13:39:03.898057	2017-05-28 13:39:03.898094	t
11	23	868716789676384256	2017-05-28 13:33:17	#Tol_Purbaleunyi Semua Kendaraan Overload DILARANG MELINTAS Ruas Tol Cipularang			0	0	f	2017-05-28 13:39:03.905953	2017-05-28 13:39:03.905991	t
12	23	868716705723240448	2017-05-28 13:32:57	13.32 WIB Bila Anda Lelah dan Mengantuk, Gunakan Tempat Istirahat #Kampanye_Keselamatan			0	0	f	2017-05-28 13:39:03.913617	2017-05-28 13:39:03.913653	t
13	23	868716647036592129	2017-05-28 13:32:43	13.31 WIB Hindari Menggunakan Handphone Saat Mengemudi #Kampanye_Keselamatan			0	0	f	2017-05-28 13:39:03.920874	2017-05-28 13:39:03.920909	t
14	23	868716578551939072	2017-05-28 13:32:26	#Tol_Jagorawi Dalam waktu dekat akan diberlakukan perubahan sistem transaksi dengan pemberlakuan satu tarif merata di Jalan Tol Jagorawi			0	0	f	2017-05-28 13:39:03.927949	2017-05-28 13:39:03.927981	t
15	23	868716537737117696	2017-05-28 13:32:17	#Tol_Jagorawi Mulai 12 Mei 2017 Ciawi arah Puncak. GUNAKAN LAJUR PALING KIRI.			0	0	f	2017-05-28 13:39:03.935062	2017-05-28 13:39:03.935098	t
16	23	868716483353780224	2017-05-28 13:32:04	13.31 WIB #Tol_Jagorawi Antrian GT Ciawi arah Jakarta ± 1 km.			0	0	f	2017-05-28 13:39:03.941974	2017-05-28 13:39:03.941999	t
17	23	868716358984376320	2017-05-28 13:31:34	13.30 WIB #Tol_Jagorawi Cawang - TMII - Cibubur - Bogor - Ciawi LANCAR. ; Ciawi - Bogor - Cimanggis - TMII - Cawang LANCAR.			0	0	f	2017-05-28 13:39:03.947499	2017-05-28 13:39:03.947533	t
18	44	868716320853970944	2017-05-28 13:31:25	Dahulukan selalu KA, menerobos Perlintasan kereta yg telah memberikan isyarat utk berhenti dpt berakibat kecelakaan. https://t.co/tz2Tt05ZDq		https://pbs.twimg.com/media/CVQRrWTU8AER-XE.jpg	0	0	f	2017-05-28 13:39:03.952327	2017-05-28 13:39:03.952351	t
19	23	868716142994407424	2017-05-28 13:30:43	13.30 WIB #Tol_Japek Cawang - Cikunir - Cikarang - Dawuan - Cikampek LANCAR. ; Cikampek - Dawuan - Cikarang - Cikunir - Cawang LANCAR.			0	0	f	2017-05-28 13:39:03.956903	2017-05-28 13:39:03.956925	t
20	23	868716084366462976	2017-05-28 13:30:29	13.30 WIB #Tol_Janger Tomang - Karang Tengah - Tangerang - Bitung LANCAR ; Bitung - Tangerang - Karang Tengah -Tomang LANCAR.			0	0	f	2017-05-28 13:39:03.961378	2017-05-28 13:39:03.961402	t
21	23	868716029161099265	2017-05-28 13:30:15	13.30 WIB #Tol_CTC Cawang - Tomang - Pluit - Cengkareng LANCAR ; Cengkareng - Pluit - Tomang - Cawang LANCAR.			0	0	f	2017-05-28 13:39:03.965975	2017-05-28 13:39:03.965999	t
22	49	868715991689175041	2017-05-28 13:30:07	RT @laksmasetiawan: @e100ss Sekitar pertigaan TL raya mastrip msh lancar 2 arah. Cuaca mendung. https://t.co/hrtAfwhxum		https://pbs.twimg.com/media/DA5MG0IUAAE7jtw.jpg	0	0	f	2017-05-28 13:39:03.97075	2017-05-28 13:39:03.970774	t
23	8	868715970684043264	2017-05-28 13:30:02	Kondisi Lalin Jl. Buah Batu - 13:29 - https://t.co/bNdWkBt2Qe https://t.co/PFf2Sq4tkb	http://bdg247.id/sn/29	https://pbs.twimg.com/media/DA5MkiAU0AUKhDt.jpg	0	0	f	2017-05-28 13:39:03.975227	2017-05-28 13:39:03.975249	t
24	55	868715964057210880	2017-05-28 13:30:00	13.30 Arus lalu lintas KM 03.500 (Kebon Jeruk) Tol Janger arah Tomang maupun Karang Tengah ramai lancar https://t.co/Gmt3si4qb7		https://pbs.twimg.com/media/DA5GbYfUAAAsZnR.jpg	0	0	f	2017-05-28 13:39:03.980176	2017-05-28 13:39:03.980201	t
25	23	868715956930990080	2017-05-28 13:29:58	13.30 WIB #Tol_Purbaleunyi Dawuan - Padalarang - Pasteur - Cileunyi LANCAR.  ; Cileunyi - Pasteur - Padalarang -Dawuan LANCAR.			0	0	f	2017-05-28 13:39:03.985643	2017-05-28 13:39:03.985667	t
26	23	868715899817086976	2017-05-28 13:29:45	13.30 WIB #Tol_JLJ TMII - Cikunir - Cakung - Semper LANCAR. ; Semper - Cakung - Cikunir - TMII LANCAR.			0	0	f	2017-05-28 13:39:03.990185	2017-05-28 13:39:03.990208	t
27	23	868715824135065600	2017-05-28 13:29:27	13.30 WIB #Tol_JLJ Ulujami - Pd Ranji - Serpong LANCAR. ; Serpong - Pd Ranji - Ulujami LANCAR.			0	0	f	2017-05-28 13:39:03.99468	2017-05-28 13:39:03.994703	t
28	40	868715768099225600	2017-05-28 13:29:13	Siap 86 kang, kami sampaikan ke @RESTABES_BDG dan @DPUKotaBandung agar menjadi atensi lebih https://t.co/0gE2OTPhIw	https://twitter.com/donicass/status/868712266123718656		0	0	f	2017-05-28 13:39:03.999449	2017-05-28 13:39:03.999475	t
29	19	868715649459118081	2017-05-28 13:28:45	13.29: RT @kurniawanhanaf1: Situasi terkini tol Cikarang Utama lancar kedua arahnya kondisi #Cuaca mendung https://t.co/HeddYeQVyd		https://pbs.twimg.com/media/DA5JeWwWsAAcl3l.jpg	0	0	f	2017-05-28 13:39:04.004258	2017-05-28 13:39:04.004282	t
30	49	868714806957625344	2017-05-28 13:25:24	RT @NurryPus: Jalan tol waru-sidoarjo sepi, kendaraan bisa di hitung dengan jari yang lewat @e100ss https://t.co/jZhypLJ5pH		https://pbs.twimg.com/media/DA5J1jlUAAE43Gn.jpg	0	0	f	2017-05-28 13:39:04.008984	2017-05-28 13:39:04.009007	t
31	40	868714799068135425	2017-05-28 13:25:22	Biasanya ada SIM keliling night di hari sabtu, tapi disarankan ke SIM Outlet saja kalau hrs perpanjang sblm tgl 3 J… https://t.co/2Gk9p55mE0	https://twitter.com/i/web/status/868714799068135425		0	0	f	2017-05-28 13:39:04.013656	2017-05-28 13:39:04.01368	t
32	19	868714707133313024	2017-05-28 13:25:00	Polres Nunukan tangkap spesialis pencuri barang elektronik  https://t.co/30u0G8z35Q  https://t.co/KWMIYqFzQa	http://elshinta.id/109305	https://pbs.twimg.com/media/DA5CdRpUwAQG2ir.jpg	0	0	f	2017-05-28 13:39:04.0187	2017-05-28 13:39:04.018723	t
33	19	868714705690533888	2017-05-28 13:25:00	Harga ayam kampung di Bandarlampung melambung https://t.co/P7buFuMkrV  https://t.co/RdwZOA51MY	http://elshinta.id/109306	https://pbs.twimg.com/media/DA5JUliUMAAEPfi.jpg	0	0	f	2017-05-28 13:39:04.023276	2017-05-28 13:39:04.023303	t
34	1	868714347803049984	2017-05-28 13:23:35	13.21 WIB Arus lalin di simp. Akpol terpantau ramai lancar #lalinSMG https://t.co/5gxIt1mCyB		https://pbs.twimg.com/media/DA5K7uXVwAYk8wF.jpg	0	0	f	2017-05-28 13:39:04.028104	2017-05-28 13:39:04.028129	t
35	8	868713452323225600	2017-05-28 13:20:01	Kondisi Lalin Jl. Holis - 13:19 - https://t.co/ZmtXA88tvY https://t.co/0FWQb2adkt	http://bdg247.id/sn/8	https://pbs.twimg.com/media/DA5KR9HU0AAtBJZ.jpg	0	0	f	2017-05-28 13:39:04.032857	2017-05-28 13:39:04.032881	t
36	19	868713447797796864	2017-05-28 13:20:00	Pemimpin G7 terbelah mengenai perubahan iklim https://t.co/AnwdfBCl6F  https://t.co/S6cURpFyUg	http://elshinta.id/109303	https://pbs.twimg.com/media/DA5ArP-VwAEj2eh.jpg	0	0	f	2017-05-28 13:39:04.037472	2017-05-28 13:39:04.037496	t
37	49	868713202653286400	2017-05-28 13:19:02	Bandara Soekarno-Hatta Sediakan 141.000 Takjil selama Ramadhan (odp-pr)... https://t.co/3lQgIal4vX	http://fb.me/8J5FPkvlR		0	0	f	2017-05-28 13:39:04.041994	2017-05-28 13:39:04.042016	t
38	55	868712190337044480	2017-05-28 13:15:00	13.15 Lalu lintas Tol Jagorawi sekitaran TMII kedua aranya terpantau ramai lancar https://t.co/YsBn1r5zSy		https://pbs.twimg.com/media/DA4_OsjUwAA35Dm.jpg	0	0	f	2017-05-28 13:39:04.046513	2017-05-28 13:39:04.046536	t
39	19	868712189284278273	2017-05-28 13:15:00	Razia awal Ramadan, Polsek Kota Sidoarjo sita ratusan botol miras https://t.co/k9lDZiBHfr  https://t.co/6qUEclApCR	http://elshinta.id/109300	https://pbs.twimg.com/media/DA5Aq5AVwAEeCQl.jpg	0	0	f	2017-05-28 13:39:04.051271	2017-05-28 13:39:04.051294	t
40	51	868711600462508032	2017-05-28 13:12:40	13:08 WIB Tg.Priok - Podomoro - Cempaka Putih - Rawamangun - Pedati - Cawang lalinramai Lancar,(ISP)@SonoraFM92 @RadioElshinta			0	0	f	2017-05-28 13:39:04.056382	2017-05-28 13:39:04.056405	t
41	51	868710992586317827	2017-05-28 13:10:15	13:07 WIB Pluit - Jemb.Tiga - Gd.Panjang - Ancol Timur - Warakas - Tg.Priok lalin ramai Lancar,(ISP)@SonoraFM92 @RadioElshinta			0	0	f	2017-05-28 13:39:04.061262	2017-05-28 13:39:04.061286	t
42	8	868710934788702208	2017-05-28 13:10:01	Kondisi Lalin Jl. Terusan Jakarta - 13:09 - https://t.co/R1bXsiORMB https://t.co/pmZFz2MiYl	http://bdg247.id/sn/2	https://pbs.twimg.com/media/DA5H_czUAAELX1I.jpg	0	0	f	2017-05-28 13:39:04.066035	2017-05-28 13:39:04.066058	t
43	19	868710931857125376	2017-05-28 13:10:00	Disperindag: Industri pengolahan tulang punggung perekonomian Sultra https://t.co/qeSjr6oYYj  https://t.co/sW7rp8cEck	http://elshinta.id/109299	https://pbs.twimg.com/media/DA5Ap-wUMAASPRS.jpg	0	0	f	2017-05-28 13:39:04.070697	2017-05-28 13:39:04.070721	t
44	66	868710668693909504	2017-05-28 13:08:57	UPDATE: Trans Yogi near Jatisampurna still jammed. Will add 20m to your drive #JktTraffic https://t.co/lGsN0RXit7 https://t.co/98kppYaXkJ	https://www.waze.com/en/get?referrer=utm_source=auto_tweets&utm_medium=WazeTrafficJKT	https://pbs.twimg.com/media/DA5Hv59WsAA0ByC.jpg	0	0	f	2017-05-28 13:39:04.07519	2017-05-28 13:39:04.075211	t
45	19	868710648829550592	2017-05-28 13:08:53	Menpora temui Sandra D.S., lifter asal Padang yg menggalang dana agar bs ikut Kejurnas Angkat Berat 2017 di Medan. https://t.co/wzr487RKNm		https://pbs.twimg.com/ext_tw_video_thumb/868706426251759621/pu/img/QzrLI0lS5hZiMfKb.jpg	0	0	f	2017-05-28 13:39:04.079915	2017-05-28 13:39:04.079938	t
46	51	868710425512116225	2017-05-28 13:07:59	13:04 WIB Tg.Priok - Warakas - Kemayoran - Ancol Barat - Gd.Panjang - Jemb.Tiga - Pluit lalin ramai Lancar,(ISP)@SonoraFM92 @RadioElshinta			0	0	f	2017-05-28 13:39:04.084471	2017-05-28 13:39:04.084493	t
47	40	868710257496686592	2017-05-28 13:07:19	13.05 Kade kang jangan jadi alesan bentar lg buka puasa :) RT @ardan_coool :\nJalan Cibolerang lancar cuaca mendung kaya mau magrib.			0	0	f	2017-05-28 13:39:04.089065	2017-05-28 13:39:04.089088	t
48	23	868709990038618112	2017-05-28 13:06:16	Diskon 20% untuk pengguna uang elektronik pada arus mudik dan arus balik lebaran 2017. https://t.co/xabv31hraF		https://pbs.twimg.com/media/DA5HHtfUwAA_Boa.jpg	0	0	f	2017-05-28 13:39:04.093945	2017-05-28 13:39:04.093969	t
49	51	868709949517385729	2017-05-28 13:06:06	13:03 WIB Cawang - Kbn.Nanas - Jatinegara - Pulomas - Sunter - Tg.Priok lalin ramai Lancar,(ISP)@SonoraFM92 @RadioElshinta			0	0	f	2017-05-28 13:39:04.098665	2017-05-28 13:39:04.098689	t
50	23	868709946963017728	2017-05-28 13:06:05	Gunakan uang elektronik (e-toll,e-money,brizzi,tapcash,Blink,flazz) untuk pembayaran tol lebih mudah dan praktis. https://t.co/AgGEjjr9ji		https://pbs.twimg.com/media/DA5HEQvU0AE8Jle.jpg	0	0	f	2017-05-28 13:39:04.103206	2017-05-28 13:39:04.103229	t
51	23	868709884690288640	2017-05-28 13:05:51	Jasa Marga Mendukung ASIAN GAMES 2018 https://t.co/SsMvTZKdTs		https://pbs.twimg.com/media/DA5HBgmUQAAfW_S.jpg	0	0	f	2017-05-28 13:39:04.107717	2017-05-28 13:39:04.10774	t
52	23	868709831833567232	2017-05-28 13:05:38	KENALI SISTEM TRANSAKSI TERBUKA &amp; TERTUTUP #GTOsistemterbuka \n#GTOsistemtertutup #ETOLLlebihpraktis #14080 https://t.co/e5MnXsfRpm		https://pbs.twimg.com/media/DA5G-jqUwAARTT8.jpg	0	0	f	2017-05-28 13:39:04.112347	2017-05-28 13:39:04.112372	t
53	23	868709772077391873	2017-05-28 13:05:24	Informasi lalu lintas dan kondisi jalan tol https://t.co/kYflDsHKqs		https://pbs.twimg.com/media/DA5G7QJVoAAGAlp.jpg	0	0	f	2017-05-28 13:39:04.117193	2017-05-28 13:39:04.117217	t
54	23	868709703294926848	2017-05-28 13:05:07	#Tol_Purbaleunyi Truk arah Jakarta agar melalui lajur pemeriksaan KM 120			0	0	f	2017-05-28 13:39:04.121775	2017-05-28 13:39:04.121797	t
55	19	868709675000352768	2017-05-28 13:05:01	Selama Ramadan, jadwal ziarah di makam Gus Dur berubah https://t.co/2QbXd8vyV3  https://t.co/ivtZ8KyggE	http://elshinta.id/109298	https://pbs.twimg.com/media/DA5AplCVwAA8diy.jpg	0	0	f	2017-05-28 13:39:04.126278	2017-05-28 13:39:04.126303	t
56	23	868709658864701440	2017-05-28 13:04:57	#Tol_Purbaleunyi Truk arah Bandung agar melalui lajur pemeriksaan KM 83+600.			0	0	f	2017-05-28 13:39:04.131263	2017-05-28 13:39:04.131286	t
57	23	868709616619671552	2017-05-28 13:04:47	#Tol_Purbaleunyi Semua Kendaraan Overload DILARANG MELINTAS Ruas Tol Cipularang			0	0	f	2017-05-28 13:39:04.136491	2017-05-28 13:39:04.136516	t
58	23	868709547438768128	2017-05-28 13:04:30	13.03 WIB Bila Anda Lelah dan Mengantuk, Gunakan Tempat Istirahat #Kampanye_Keselamatan			0	0	f	2017-05-28 13:39:04.142219	2017-05-28 13:39:04.142244	t
59	23	868709502828335104	2017-05-28 13:04:19	13.03 WIB Jangan Lupa Selalu Gunakan Sabuk Keselamatan #Kampanye_Keselamatan			0	0	f	2017-05-28 13:39:04.148142	2017-05-28 13:39:04.148167	t
60	19	868709421257441284	2017-05-28 13:04:00	13.04: RT @wiboadhi18: Lalin di Pasar Jumat Purwakarta ramai dan lancar, #cuaca cerah berawan. https://t.co/cGyhXjuJck #DebatKusirElshintaTV		https://pbs.twimg.com/media/DA5FsKLU0AAAZsH.jpg	0	0	f	2017-05-28 13:39:04.153777	2017-05-28 13:39:04.1538	t
61	23	868709407458115584	2017-05-28 13:03:57	13.03 WIB Kendalikan Kecepatan Kendaraan Anda. Jaga Jarak Aman Antar Kendaraan #Kampanye_Keselamatan			0	0	f	2017-05-28 13:39:04.159329	2017-05-28 13:39:04.159353	t
62	23	868709338927439872	2017-05-28 13:03:40	#Tol_Jagorawi Dalam waktu dekat akan diberlakukan perubahan sistem transaksi dengan pemberlakuan satu tarif merata di Jalan Tol Jagorawi			0	0	f	2017-05-28 13:39:04.164355	2017-05-28 13:39:04.164378	t
63	23	868709290537762816	2017-05-28 13:03:29	#Tol_Jagorawi Mulai 12 Mei 2017 Ciawi arah Puncak. GUNAKAN LAJUR PALING KIRI.			0	0	f	2017-05-28 13:39:04.168875	2017-05-28 13:39:04.168897	t
64	23	868709235525246976	2017-05-28 13:03:16	13.02 WIB #Tol_Jagorawi Cawang - TMII - Cibubur - Bogor - Ciawi LANCAR. ; Ciawi - Bogor - Cimanggis - TMII - Cawang LANCAR.			0	0	f	2017-05-28 13:39:04.17384	2017-05-28 13:39:04.173921	t
65	19	868709170278670336	2017-05-28 13:03:00	Partai final tunggal putra #SudirmanCup2017 Chen Long [CHN] menang atas Jeon Hyeok Jin [KOR] 21-10, 21-10. CHN 2-1 KOR #NewsAndTalk			0	0	f	2017-05-28 13:39:04.178503	2017-05-28 13:39:04.178525	t
66	19	868709125898649600	2017-05-28 13:02:50	Menpora @imam_nahrawi tinjau Family Barbel Club di Padang tempat bernaung atlet angkat berat Sandra Diana. (Bak) https://t.co/wzr487RKNm		https://pbs.twimg.com/ext_tw_video_thumb/868706426251759621/pu/img/QzrLI0lS5hZiMfKb.jpg	0	0	f	2017-05-28 13:39:04.183128	2017-05-28 13:39:04.183152	t
67	23	868709090205224960	2017-05-28 13:02:41	13.01 WIB #Tol_Japek Cawang - Cikunir - Cikarang - Dawuan - Cikampek LANCAR. ; Cikampek - Dawuan - Cikarang - Cikunir - Cawang LANCAR.			0	0	f	2017-05-28 13:39:04.188273	2017-05-28 13:39:04.188295	t
68	23	868709010710577152	2017-05-28 13:02:22	13.01 WIB #Tol_Janger Tomang - Karang Tengah - Tangerang - Bitung LANCAR ; Bitung - Tangerang - Karang Tengah -Tomang LANCAR.			0	0	f	2017-05-28 13:39:04.19492	2017-05-28 13:39:04.194947	t
69	23	868708946294358017	2017-05-28 13:02:07	13.01 WIB #Tol_CTC Cawang - Tomang - Pluit - Cengkareng LANCAR ; Cengkareng - Pluit - Tomang - Cawang LANCAR.			0	0	f	2017-05-28 13:39:04.201422	2017-05-28 13:39:04.201446	t
70	23	868708901180526593	2017-05-28 13:01:56	13.01 WIB #Tol_Purbaleunyi Dawuan - Padalarang - Pasteur - Cileunyi LANCAR.  ; Cileunyi - Pasteur - Padalarang -Dawuan LANCAR.			0	0	f	2017-05-28 13:39:04.207656	2017-05-28 13:39:04.207681	t
71	23	868708859413528576	2017-05-28 13:01:46	13.00 WIB #Tol_JLJ TMII - Cikunir - Cakung - Semper LANCAR. ; Semper - Cakung - Cikunir - TMII LANCAR.			0	0	f	2017-05-28 13:39:04.213768	2017-05-28 13:39:04.213792	t
72	23	868708815482441728	2017-05-28 13:01:36	13.00 WIB #Tol_JLJ Ulujami - Pd Ranji - Serpong LANCAR. ; Serpong - Pd Ranji - Ulujami LANCAR.			0	0	f	2017-05-28 13:39:04.220009	2017-05-28 13:39:04.220033	t
73	43	868708644887678976	2017-05-28 13:00:55	13.01Wib arus lalu lintas di simp PDAM Malang terpantau ramai lancar tetap hati2 dalam berkendara https://t.co/E7gDevYFEr		https://pbs.twimg.com/media/DA5F6GuXUAAGID2.jpg	0	0	f	2017-05-28 13:39:04.225917	2017-05-28 13:39:04.225941	t
74	49	868708522334322689	2017-05-28 13:00:26	Yuk ke Timescape : The Enchanted Journey di Atrium lt 1 East Coast Center, 21-28 Mei 2017. Ada banyak tenant fashio… https://t.co/83DU7Lg5yO	https://twitter.com/i/web/status/868708522334322689		0	0	f	2017-05-28 13:39:04.231725	2017-05-28 13:39:04.231749	t
75	40	868708420324642816	2017-05-28 13:00:01	Jangan lewatkan Promo Bedug Ramadhan 1438 dari Sariater Hotel &amp; Resort\n\nDapatkan juga diskon 50 % selama 25 mei - 1… https://t.co/4EPXoOKHIT	https://twitter.com/i/web/status/868708420324642816		0	0	f	2017-05-28 13:39:04.237399	2017-05-28 13:39:04.237422	t
76	8	868708419812835330	2017-05-28 13:00:01	Kondisi Lalin Perempatan Braga-Naripan - 12:59 - https://t.co/ZkmeCvpoXJ https://t.co/IRxOr5ssBU	http://bdg247.id/sn/6	https://pbs.twimg.com/media/DA5FtCbUwAET-wQ.jpg	0	0	f	2017-05-28 13:39:04.24291	2017-05-28 13:39:04.242934	t
77	49	868708417938096128	2017-05-28 13:00:01	#RamadhanKita Ada banyak kisah unik tentang pengalaman saat melakukan puasa untuk pertama kalinya. Seperti tidak... https://t.co/XJ1wNYR6Ws	http://fb.me/6mo6pwQ2r		0	0	f	2017-05-28 13:39:04.248264	2017-05-28 13:39:04.248288	t
78	55	868708417438793728	2017-05-28 13:00:01	13.00 Arus lalu lintas Jl. Raya Cilandak KKO kedua arahnya ramai lancar			0	0	f	2017-05-28 13:39:04.252941	2017-05-28 13:39:04.252963	t
79	55	868708363663663107	2017-05-28 12:59:48	Daftarkan diri anda segera di Mapolda/Polres/Polsek wilayah Polda Metro Jaya\n\nInfo lebih lanjut di \n@BhayangkaraRun… https://t.co/whErUuVg7p	https://twitter.com/i/web/status/868708363663663107		0	0	f	2017-05-28 13:39:04.257616	2017-05-28 13:39:04.257639	t
80	66	868708126463320064	2017-05-28 12:58:51	Traffic on Matraman #JktTraffic will delay you 20m more than usual today https://t.co/vTwuHpB4Gu https://t.co/diHEkhloJz	https://www.waze.com/en/irregular_traffic?bbox=106.849,-6.203,106.853,-6.200&id=124937600&env=world&referrer=utm_source=auto_tweets&utm_medium=WazeTrafficJKT	https://pbs.twimg.com/media/DA5Fb7gWAAASVlF.jpg	0	0	f	2017-05-28 13:39:04.262851	2017-05-28 13:39:04.262876	t
81	40	868707999551860736	2017-05-28 12:58:21	12.57 @paetea28 : Hujan mulai turun di kawasan Industri Cimahi Cibodas.			0	0	f	2017-05-28 13:39:04.267692	2017-05-28 13:39:04.267715	t
82	55	868707907340091392	2017-05-28 12:57:59	RT @ragunanzoo: Data Pengunjung Pukul 12.00 WIB ( Minggu, 28 Mei 2017 ) | @TMCPoldaMetro https://t.co/lImCLPbrqO		https://pbs.twimg.com/media/DA5ETFmV0AUexpx.jpg	0	0	f	2017-05-28 13:39:04.272272	2017-05-28 13:39:04.272295	t
83	40	868707630155419648	2017-05-28 12:56:53	12.55 RT @irrdafaizal\nGeger Kalong dan sekitarnya diguyur hujan. Hati2 taruwips			0	0	f	2017-05-28 13:39:04.27689	2017-05-28 13:39:04.276913	t
84	66	868707618923171841	2017-05-28 12:56:50	Traffic on Matraman #JktTraffic will delay you 21m more than usual today https://t.co/lGsN0RXit7 https://t.co/uO4lFX9emx	https://www.waze.com/en/get?referrer=utm_source=auto_tweets&utm_medium=WazeTrafficJKT	https://pbs.twimg.com/media/DA5E-XTWsAAtw4r.jpg	0	0	f	2017-05-28 13:39:04.281559	2017-05-28 13:39:04.281582	t
85	40	868707519379554304	2017-05-28 12:56:27	12.55 RT @eka_harijanto\nArus Martanegara, Karawitan, Reog lancar, cenderung sepi. Buahbatu agak padat di sekitar Griya			0	0	f	2017-05-28 13:39:04.286129	2017-05-28 13:39:04.286152	t
86	19	868707407240638464	2017-05-28 12:56:00	Pemprov Jateng diminta antisipasi lonjakan pemudik  https://t.co/4vPCurp4TT  https://t.co/q9GTMyca16	http://elshinta.id/109295	https://pbs.twimg.com/media/DA5ApNRUwAAj8tJ.jpg	0	0	f	2017-05-28 13:39:04.290609	2017-05-28 13:39:04.290631	t
87	40	868707373321289730	2017-05-28 12:55:52	Siap kang, kami sampaikan ke @Satpolppbdg https://t.co/W4a302SC7i	https://twitter.com/elofie200308/status/868705473876303872		0	0	f	2017-05-28 13:39:04.294812	2017-05-28 13:39:04.294835	t
\.


--
-- Name: raws_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('raws_id_seq', 87, true);


--
-- Data for Name: regencies; Type: TABLE DATA; Schema: public; Owner: user
--

COPY regencies (id, state_id, hierarchy_id, name, lat, lng, active, alias) FROM stdin;
4	1	1	Aceh Jaya	\N	\N	t	AcehJaya
40	3	2	Tangerang Selatan	\N	\N	t	Tangsel
1	1	1	Aceh Barat	\N	\N	t	AcehBarat
2	1	1	Aceh Barat Daya	\N	\N	t	AcehBaratDaya
3	1	1	Aceh Besar	\N	\N	t	AcehBesar
5	1	1	Aceh Selatan	\N	\N	t	AcehSelatan
6	1	1	Aceh Singkil	\N	\N	t	AcehSingkil
7	1	1	Aceh Tamiang	\N	\N	t	AcehTamiang
8	1	1	Aceh Tengah	\N	\N	t	AcehTengah
9	1	1	Aceh Tenggara	\N	\N	t	AcehTenggara
10	1	1	Aceh Timur	\N	\N	t	AcehTimur
11	1	1	Aceh Utara	\N	\N	t	AcehUtara
12	1	1	Bener Meriah	\N	\N	t	BenerMeriah
13	1	1	Bireuen	\N	\N	t	Bireuen
14	1	1	Gayo Lues	\N	\N	t	GayoLues
15	1	1	Nagan Raya	\N	\N	t	NaganRaya
16	1	1	Pidie	\N	\N	t	Pidie
17	1	1	Pidie Jaya	\N	\N	t	PidieJaya
18	1	1	Simeulue	\N	\N	t	Simeulue
19	1	2	Banda Aceh	\N	\N	t	BandaAceh
20	1	2	Langsa	\N	\N	t	Langsa
21	1	2	Lhokseumawe	\N	\N	t	Lhokseumawe
22	1	2	Sabang	\N	\N	t	Sabang
23	1	2	Subulussalam	\N	\N	t	Subulussalam
24	2	1	Badung	\N	\N	t	Badung
25	2	1	Bangli	\N	\N	t	Bangli
26	2	1	Buleleng	\N	\N	t	Buleleng
27	2	1	Gianyar	\N	\N	t	Gianyar
28	2	1	Jembrana	\N	\N	t	Jembrana
29	2	1	Karangasem	\N	\N	t	Karangasem
30	2	1	Klungkung	\N	\N	t	Klungkung
31	2	1	Tabanan	\N	\N	t	Tabanan
32	2	2	Denpasar	\N	\N	t	Denpasar
33	3	1	Lebak	\N	\N	t	Lebak
34	3	1	Pandeglang	\N	\N	t	Pandeglang
35	3	1	Serang	\N	\N	t	Serang
36	3	1	Tangerang	\N	\N	t	Tangerang
37	3	2	Cilegon	\N	\N	t	Cilegon
38	3	2	Serang	\N	\N	t	Serang
39	3	2	Tangerang	\N	\N	t	Tangerang
41	4	1	Bengkulu Selatan	\N	\N	t	BengkuluSelatan
42	4	1	Bengkulu Tengah	\N	\N	t	BengkuluTengah
43	4	1	Bengkulu Utara	\N	\N	t	BengkuluUtara
44	4	1	Kaur	\N	\N	t	Kaur
45	4	1	Kepahiang	\N	\N	t	Kepahiang
46	4	1	Lebong	\N	\N	t	Lebong
47	4	1	Muko Muko	\N	\N	t	MukoMuko
48	4	1	Rejang Lebong	\N	\N	t	RejangLebong
49	4	1	Seluma	\N	\N	t	Seluma
50	4	2	Bengkulu	\N	\N	t	Bengkulu
51	5	1	Bantul	\N	\N	t	Bantul
52	5	1	Gunung Kidul	\N	\N	t	GunungKidul
53	5	1	Kulon Progo	\N	\N	t	KulonProgo
54	5	1	Sleman	\N	\N	t	Sleman
55	5	2	Yogyakarta	\N	\N	t	Yogyakarta
56	6	1	Kep. Seribu	\N	\N	t	Kep.Seribu
57	6	2	Jakarta Barat	\N	\N	t	Jakarta
58	6	2	Jakarta Pusat	\N	\N	t	Jakarta
59	6	2	Jakarta Selatan	\N	\N	t	Jakarta
60	6	2	Jakarta Timur	\N	\N	t	Jakarta
61	6	2	Jakarta Utara	\N	\N	t	Jakarta
62	7	1	Boalemo	\N	\N	t	Boalemo
63	7	1	Bone Bolango	\N	\N	t	BoneBolango
404	29	1	Buol	\N	\N	t	Buol
64	7	1	Gorontalo	\N	\N	t	Gorontalo
65	7	1	Gorontalo Utara	\N	\N	t	GorontaloUtara
66	7	1	Pahuwato	\N	\N	t	Pahuwato
67	7	2	Gorontalo	\N	\N	t	Gorontalo
68	8	1	Batanghari	\N	\N	t	Batanghari
69	8	1	Bungo	\N	\N	t	Bungo
70	8	1	Kerinci	\N	\N	t	Kerinci
71	8	1	Merangin	\N	\N	t	Merangin
72	8	1	Muaro Jambi	\N	\N	t	MuaroJambi
73	8	1	Sarolangun	\N	\N	t	Sarolangun
74	8	1	Tanjung Jabung Barat	\N	\N	t	TanjungJabungBarat
75	8	1	Tanjung Jabung Timur	\N	\N	t	TanjungJabungTimur
76	8	1	Tebo	\N	\N	t	Tebo
77	8	2	Jambi	\N	\N	t	Jambi
78	8	2	Sungai Penuh	\N	\N	t	SungaiPenuh
79	9	1	Bandung	\N	\N	t	Bandung
80	9	1	Bandung Barat	\N	\N	t	BandungBarat
81	9	1	Bekasi	\N	\N	t	Bekasi
82	9	1	Bogor	\N	\N	t	Bogor
83	9	1	Ciamis	\N	\N	t	Ciamis
84	9	1	Cianjur	\N	\N	t	Cianjur
85	9	1	Cirebon	\N	\N	t	Cirebon
86	9	1	Garut	\N	\N	t	Garut
87	9	1	Indramayu	\N	\N	t	Indramayu
88	9	1	Karawang	\N	\N	t	Karawang
89	9	1	Kuningan	\N	\N	t	Kuningan
90	9	1	Majalengka	\N	\N	t	Majalengka
91	9	1	Pangandaran	\N	\N	t	Pangandaran
92	9	1	Purwakarta	\N	\N	t	Purwakarta
93	9	1	Subang	\N	\N	t	Subang
94	9	1	Sukabumi	\N	\N	t	Sukabumi
95	9	1	Sumedang	\N	\N	t	Sumedang
96	9	1	Tasikmalaya	\N	\N	t	Tasikmalaya
97	9	2	Bandung	\N	\N	t	Bandung
98	9	2	Banjar	\N	\N	t	Banjar
99	9	2	Bekasi	\N	\N	t	Bekasi
100	9	2	Bogor	\N	\N	t	Bogor
101	9	2	Cimahi	\N	\N	t	Cimahi
102	9	2	Cirebon	\N	\N	t	Cirebon
103	9	2	Depok	\N	\N	t	Depok
104	9	2	Sukabumi	\N	\N	t	Sukabumi
105	9	2	Tasikmalaya	\N	\N	t	Tasikmalaya
106	10	1	Banjarnegara	\N	\N	t	Banjarnegara
107	10	1	Banyumas	\N	\N	t	Banyumas
108	10	1	Batang	\N	\N	t	Batang
109	10	1	Blora	\N	\N	t	Blora
110	10	1	Boyolali	\N	\N	t	Boyolali
111	10	1	Brebes	\N	\N	t	Brebes
112	10	1	Cilacap	\N	\N	t	Cilacap
113	10	1	Demak	\N	\N	t	Demak
114	10	1	Grobogan	\N	\N	t	Grobogan
115	10	1	Jepara	\N	\N	t	Jepara
116	10	1	Karanganyar	\N	\N	t	Karanganyar
117	10	1	Kebumen	\N	\N	t	Kebumen
118	10	1	Kendal	\N	\N	t	Kendal
119	10	1	Klaten	\N	\N	t	Klaten
120	10	1	Kudus	\N	\N	t	Kudus
121	10	1	Magelang	\N	\N	t	Magelang
122	10	1	Pati	\N	\N	t	Pati
123	10	1	Pekalongan	\N	\N	t	Pekalongan
124	10	1	Pemalang	\N	\N	t	Pemalang
125	10	1	Purbalingga	\N	\N	t	Purbalingga
126	10	1	Purworejo	\N	\N	t	Purworejo
127	10	1	Rembang	\N	\N	t	Rembang
128	10	1	Semarang	\N	\N	t	Semarang
129	10	1	Sragen	\N	\N	t	Sragen
130	10	1	Sukoharjo	\N	\N	t	Sukoharjo
131	10	1	Tegal	\N	\N	t	Tegal
132	10	1	Temanggung	\N	\N	t	Temanggung
133	10	1	Wonogiri	\N	\N	t	Wonogiri
134	10	1	Wonosobo	\N	\N	t	Wonosobo
135	10	2	Magelang	\N	\N	t	Magelang
136	10	2	Pekalongan	\N	\N	t	Pekalongan
137	10	2	Salatiga	\N	\N	t	Salatiga
138	10	2	Semarang	\N	\N	t	Semarang
139	10	2	Surakarta	\N	\N	t	Surakarta
140	10	2	Tegal	\N	\N	t	Tegal
141	11	1	Bangkalan	\N	\N	t	Bangkalan
142	11	1	Banyuwangi	\N	\N	t	Banyuwangi
143	11	1	Blitar	\N	\N	t	Blitar
144	11	1	Bojonegoro	\N	\N	t	Bojonegoro
145	11	1	Bondowoso	\N	\N	t	Bondowoso
146	11	1	Gresik	\N	\N	t	Gresik
147	11	1	Jember	\N	\N	t	Jember
148	11	1	Jombang	\N	\N	t	Jombang
149	11	1	Kediri	\N	\N	t	Kediri
150	11	1	Lamongan	\N	\N	t	Lamongan
151	11	1	Lumajang	\N	\N	t	Lumajang
152	11	1	Madiun	\N	\N	t	Madiun
153	11	1	Magetan	\N	\N	t	Magetan
154	11	1	Malang	\N	\N	t	Malang
155	11	1	Mojokerto	\N	\N	t	Mojokerto
156	11	1	Nganjuk	\N	\N	t	Nganjuk
157	11	1	Ngawi	\N	\N	t	Ngawi
158	11	1	Pacitan	\N	\N	t	Pacitan
159	11	1	Pamekasan	\N	\N	t	Pamekasan
160	11	1	Pasuruan	\N	\N	t	Pasuruan
161	11	1	Ponorogo	\N	\N	t	Ponorogo
162	11	1	Probolinggo	\N	\N	t	Probolinggo
163	11	1	Sampang	\N	\N	t	Sampang
164	11	1	Sidoarjo	\N	\N	t	Sidoarjo
165	11	1	Situbondo	\N	\N	t	Situbondo
166	11	1	Sumenep	\N	\N	t	Sumenep
167	11	1	Trenggalek	\N	\N	t	Trenggalek
168	11	1	Tuban	\N	\N	t	Tuban
169	11	1	Tulungagung	\N	\N	t	Tulungagung
170	11	2	Batu	\N	\N	t	Batu
171	11	2	Blitar	\N	\N	t	Blitar
172	11	2	Kediri	\N	\N	t	Kediri
173	11	2	Madiun	\N	\N	t	Madiun
174	11	2	Malang	\N	\N	t	Malang
175	11	2	Mojokerto	\N	\N	t	Mojokerto
176	11	2	Pasuruan	\N	\N	t	Pasuruan
177	11	2	Probolinggo	\N	\N	t	Probolinggo
178	11	2	Surabaya	\N	\N	t	Surabaya
179	12	1	Bengkayang	\N	\N	t	Bengkayang
180	12	1	Kapuas Hulu	\N	\N	t	KapuasHulu
181	12	1	Kayong Utara	\N	\N	t	KayongUtara
182	12	1	Ketapang	\N	\N	t	Ketapang
183	12	1	Kubu Raya	\N	\N	t	KubuRaya
184	12	1	Landak	\N	\N	t	Landak
185	12	1	Melawi	\N	\N	t	Melawi
186	12	1	Mempawah	\N	\N	t	Mempawah
187	12	1	Sambas	\N	\N	t	Sambas
188	12	1	Sanggau	\N	\N	t	Sanggau
189	12	1	Sekadau	\N	\N	t	Sekadau
190	12	1	Sintang	\N	\N	t	Sintang
191	12	2	Pontianak	\N	\N	t	Pontianak
192	12	2	Singkawang	\N	\N	t	Singkawang
193	13	1	Balangan	\N	\N	t	Balangan
194	13	1	Banjar	\N	\N	t	Banjar
195	13	1	Barito Kuala	\N	\N	t	BaritoKuala
196	13	1	Hulu Sungai Selatan	\N	\N	t	HuluSungaiSelatan
197	13	1	Hulu Sungai Tengah	\N	\N	t	HuluSungaiTengah
198	13	1	Hulu Sungai Utara	\N	\N	t	HuluSungaiUtara
199	13	1	Baru	\N	\N	t	Baru
200	13	1	Tabalong	\N	\N	t	Tabalong
201	13	1	Tanah Bumbu	\N	\N	t	TanahBumbu
202	13	1	Tanah Laut	\N	\N	t	TanahLaut
203	13	1	Tapin	\N	\N	t	Tapin
204	13	2	Banjarbaru	\N	\N	t	Banjarbaru
205	13	2	Banjarmasin	\N	\N	t	Banjarmasin
206	14	1	Barito Selatan	\N	\N	t	BaritoSelatan
207	14	1	Barito Timur	\N	\N	t	BaritoTimur
208	14	1	Barito Utara	\N	\N	t	BaritoUtara
209	14	1	Gunung Mas	\N	\N	t	GunungMas
210	14	1	Kapuas	\N	\N	t	Kapuas
211	14	1	Katingan	\N	\N	t	Katingan
212	14	1	Waringin Barat	\N	\N	t	WaringinBarat
213	14	1	Waringin Timur	\N	\N	t	WaringinTimur
214	14	1	Lamandau	\N	\N	t	Lamandau
215	14	1	Murung Raya	\N	\N	t	MurungRaya
216	14	1	Pulang Pisau	\N	\N	t	PulangPisau
217	14	1	Seruyan	\N	\N	t	Seruyan
218	14	1	Sukamara	\N	\N	t	Sukamara
219	14	2	Palangkaraya	\N	\N	t	Palangkaraya
220	15	1	Berau	\N	\N	t	Berau
221	15	1	Kutai Barat	\N	\N	t	KutaiBarat
222	15	1	Kutai Kartanegara	\N	\N	t	KutaiKartanegara
223	15	1	Kutai Timur	\N	\N	t	KutaiTimur
224	15	1	Mahakam Ulu	\N	\N	t	MahakamUlu
225	15	1	Paser	\N	\N	t	Paser
226	15	1	Penajam Paser Utara	\N	\N	t	PenajamPaserUtara
227	15	2	Balikpapan	\N	\N	t	Balikpapan
228	15	2	Bontang	\N	\N	t	Bontang
229	15	2	Samarinda	\N	\N	t	Samarinda
230	16	1	Bulungan	\N	\N	t	Bulungan
231	16	1	Malinau	\N	\N	t	Malinau
232	16	1	Nunukan	\N	\N	t	Nunukan
233	16	1	Tana Tidung	\N	\N	t	TanaTidung
234	16	2	Tarakan	\N	\N	t	Tarakan
235	17	1	Bangka	\N	\N	t	Bangka
236	17	1	Bangka Barat	\N	\N	t	BangkaBarat
237	17	1	Bangka Selatan	\N	\N	t	BangkaSelatan
238	17	1	Bangka Tengah	\N	\N	t	BangkaTengah
239	17	1	Belitung	\N	\N	t	Belitung
240	17	1	Belitung Timur	\N	\N	t	BelitungTimur
241	17	2	Pangkal Pinang	\N	\N	t	PangkalPinang
242	18	1	Bintan	\N	\N	t	Bintan
243	18	1	Karimun	\N	\N	t	Karimun
244	18	1	Kepulauan Anambas	\N	\N	t	KepulauanAnambas
245	18	1	Lingga	\N	\N	t	Lingga
246	18	1	Natuna	\N	\N	t	Natuna
247	18	2	Batam	\N	\N	t	Batam
248	18	2	Tanjung Pinang	\N	\N	t	TanjungPinang
249	19	1	Lampung Barat	\N	\N	t	LampungBarat
250	19	1	Lampung Selatan	\N	\N	t	LampungSelatan
251	19	1	Lampung Tengah	\N	\N	t	LampungTengah
252	19	1	Lampung Timur	\N	\N	t	LampungTimur
253	19	1	Lampung Utara	\N	\N	t	LampungUtara
254	19	1	Mesuji	\N	\N	t	Mesuji
255	19	1	Pesawaran	\N	\N	t	Pesawaran
256	19	1	Pesisir Barat	\N	\N	t	PesisirBarat
257	19	1	Pringsewu	\N	\N	t	Pringsewu
258	19	1	Tanggamus	\N	\N	t	Tanggamus
259	19	1	Tulang Bawang	\N	\N	t	TulangBawang
260	19	1	Tulang Bawang Barat	\N	\N	t	TulangBawangBarat
261	19	1	Way Kanan	\N	\N	t	WayKanan
262	19	2	Bandar Lampung	\N	\N	t	BandarLampung
263	19	2	Metro	\N	\N	t	Metro
264	20	1	Maluku Tenggara Barat	\N	\N	t	MalukuTenggaraBarat
265	20	1	Buru	\N	\N	t	Buru
266	20	1	Buru Selatan	\N	\N	t	BuruSelatan
267	20	1	Kepulauan Aru	\N	\N	t	KepulauanAru
268	20	1	Maluku Barat Daya	\N	\N	t	MalukuBaratDaya
269	20	1	Maluku Tengah	\N	\N	t	MalukuTengah
270	20	1	Maluku Tenggara	\N	\N	t	MalukuTenggara
271	20	1	Seram Bagian Barat	\N	\N	t	SeramBagianBarat
272	20	1	Seram Bagian Timur	\N	\N	t	SeramBagianTimur
273	20	2	Ambon	\N	\N	t	Ambon
274	20	2	Tual	\N	\N	t	Tual
275	21	1	Halmahera Barat	\N	\N	t	HalmaheraBarat
276	21	1	Halmahera Selatan	\N	\N	t	HalmaheraSelatan
277	21	1	Halmahera Tengah	\N	\N	t	HalmaheraTengah
278	21	1	Halmahera Timur	\N	\N	t	HalmaheraTimur
279	21	1	Halmahera Utara	\N	\N	t	HalmaheraUtara
280	21	1	Kepulauan Sula	\N	\N	t	KepulauanSula
281	21	1	Pulau Morotai	\N	\N	t	PulauMorotai
282	21	1	Pulau Taliabu	\N	\N	t	PulauTaliabu
283	21	2	Ternate	\N	\N	t	Ternate
284	21	2	Tidore Kepulauan	\N	\N	t	TidoreKepulauan
285	22	1	Bima	\N	\N	t	Bima
286	22	1	Dompu	\N	\N	t	Dompu
287	22	1	Lombok Barat	\N	\N	t	LombokBarat
288	22	1	Lombok Tengah	\N	\N	t	LombokTengah
289	22	1	Lombok Timur	\N	\N	t	LombokTimur
290	22	1	Lombok Utara	\N	\N	t	LombokUtara
291	22	1	Sumbawa	\N	\N	t	Sumbawa
292	22	1	Sumbawa Barat	\N	\N	t	SumbawaBarat
293	22	2	Bima	\N	\N	t	Bima
294	22	2	Mataram	\N	\N	t	Mataram
295	23	1	Timor Tengah Selatan	\N	\N	t	TimorTengahSelatan
296	23	1	Alor	\N	\N	t	Alor
297	23	1	Belu	\N	\N	t	Belu
298	23	1	Ende	\N	\N	t	Ende
299	23	1	Flores Timur	\N	\N	t	FloresTimur
300	23	1	Kupang	\N	\N	t	Kupang
301	23	1	Lembata	\N	\N	t	Lembata
302	23	1	Malaka	\N	\N	t	Malaka
303	23	1	Manggarai	\N	\N	t	Manggarai
304	23	1	Manggarai Barat	\N	\N	t	ManggaraiBarat
305	23	1	Manggarai Timur	\N	\N	t	ManggaraiTimur
306	23	1	Nagekeo	\N	\N	t	Nagekeo
307	23	1	Ngada	\N	\N	t	Ngada
308	23	1	Rote Ndao	\N	\N	t	RoteNdao
309	23	1	Sabu Raijua	\N	\N	t	SabuRaijua
310	23	1	Sikka	\N	\N	t	Sikka
311	23	1	Sumba Barat	\N	\N	t	SumbaBarat
312	23	1	Sumba Barat Daya	\N	\N	t	SumbaBaratDaya
313	23	1	Sumba Tengah	\N	\N	t	SumbaTengah
314	23	1	Sumba Timur	\N	\N	t	SumbaTimur
315	23	1	Timor Tengah Utara	\N	\N	t	TimorTengahUtara
316	23	2	Kupang	\N	\N	t	Kupang
317	24	1	Fak Fak	\N	\N	t	FakFak
318	24	1	Kaimana	\N	\N	t	Kaimana
319	24	1	Manokwari	\N	\N	t	Manokwari
320	24	1	Manokwari Selatan	\N	\N	t	ManokwariSelatan
321	24	1	Maybrat	\N	\N	t	Maybrat
322	24	1	Pegunungan Arfak	\N	\N	t	PegununganArfak
323	24	1	Raja Ampat	\N	\N	t	RajaAmpat
324	24	1	Sorong	\N	\N	t	Sorong
325	24	1	Sorong Selatan	\N	\N	t	SorongSelatan
326	24	1	Tambrauw	\N	\N	t	Tambrauw
327	24	1	Teluk Bintuni	\N	\N	t	TelukBintuni
328	24	1	Teluk Wondama	\N	\N	t	TelukWondama
329	24	2	Sorong	\N	\N	t	Sorong
330	25	1	Pegunungan Bintang	\N	\N	t	PegununganBintang
331	25	1	Asmat	\N	\N	t	Asmat
332	25	1	Biak Numfor	\N	\N	t	BiakNumfor
333	25	1	Boven Digoel	\N	\N	t	BovenDigoel
334	25	1	Deiyai	\N	\N	t	Deiyai
335	25	1	Dogiyai	\N	\N	t	Dogiyai
336	25	1	Intan Jaya	\N	\N	t	IntanJaya
337	25	1	Jayapura	\N	\N	t	Jayapura
338	25	1	Jayawijaya	\N	\N	t	Jayawijaya
339	25	1	Keerom	\N	\N	t	Keerom
340	25	1	Kepulauan Yapen	\N	\N	t	KepulauanYapen
341	25	1	Lanny Jaya	\N	\N	t	LannyJaya
342	25	1	Mamberamo Raya	\N	\N	t	MamberamoRaya
343	25	1	Mamberamo Tengah	\N	\N	t	MamberamoTengah
344	25	1	Mappi	\N	\N	t	Mappi
345	25	1	Merauke	\N	\N	t	Merauke
346	25	1	Mimika	\N	\N	t	Mimika
347	25	1	Nabire	\N	\N	t	Nabire
348	25	1	Nduga	\N	\N	t	Nduga
349	25	1	Paniai	\N	\N	t	Paniai
350	25	1	Puncak	\N	\N	t	Puncak
351	25	1	Puncak Jaya	\N	\N	t	PuncakJaya
352	25	1	Sarmi	\N	\N	t	Sarmi
353	25	1	Supiori	\N	\N	t	Supiori
354	25	1	Tolikara	\N	\N	t	Tolikara
355	25	1	Waropen	\N	\N	t	Waropen
356	25	1	Yahukimo	\N	\N	t	Yahukimo
357	25	1	Yalimo	\N	\N	t	Yalimo
358	25	2	Jayapura	\N	\N	t	Jayapura
359	26	1	Bengkalis	\N	\N	t	Bengkalis
360	26	1	Indragiri Hilir	\N	\N	t	IndragiriHilir
361	26	1	Indragiri Hulu	\N	\N	t	IndragiriHulu
362	26	1	Kampar	\N	\N	t	Kampar
363	26	1	Kepulauan Meranti	\N	\N	t	KepulauanMeranti
364	26	1	Kuantan Singingi	\N	\N	t	KuantanSingingi
365	26	1	Pelalawan	\N	\N	t	Pelalawan
366	26	1	Rokan Hilir	\N	\N	t	RokanHilir
367	26	1	Rokan Hulu	\N	\N	t	RokanHulu
368	26	1	Siak	\N	\N	t	Siak
369	26	2	Dumai	\N	\N	t	Dumai
370	26	2	Pekanbaru	\N	\N	t	Pekanbaru
371	27	1	Majene	\N	\N	t	Majene
372	27	1	Mamasa	\N	\N	t	Mamasa
373	27	1	Mamuju	\N	\N	t	Mamuju
374	27	1	Mamuju Tengah	\N	\N	t	MamujuTengah
375	27	1	Mamuju Utara	\N	\N	t	MamujuUtara
376	27	1	Polewali Mandar	\N	\N	t	PolewaliMandar
377	28	1	Bantaeng	\N	\N	t	Bantaeng
378	28	1	Barru	\N	\N	t	Barru
379	28	1	Bone	\N	\N	t	Bone
380	28	1	Bulukumba	\N	\N	t	Bulukumba
381	28	1	Enrekang	\N	\N	t	Enrekang
382	28	1	Gowa	\N	\N	t	Gowa
383	28	1	Jeneponto	\N	\N	t	Jeneponto
384	28	1	Kepulauan Selayar	\N	\N	t	KepulauanSelayar
385	28	1	Luwu	\N	\N	t	Luwu
386	28	1	Luwu Timur	\N	\N	t	LuwuTimur
387	28	1	Luwu Utara	\N	\N	t	LuwuUtara
388	28	1	Maros	\N	\N	t	Maros
389	28	1	Pangkajene Kepulauan	\N	\N	t	PangkajeneKepulauan
390	28	1	Pinrang	\N	\N	t	Pinrang
391	28	1	Sidenreng Rappang	\N	\N	t	SidenrengRappang
392	28	1	Sinjai	\N	\N	t	Sinjai
393	28	1	Soppeng	\N	\N	t	Soppeng
394	28	1	Takalar	\N	\N	t	Takalar
395	28	1	Tana Toraja	\N	\N	t	TanaToraja
396	28	1	Toraja Utara	\N	\N	t	TorajaUtara
397	28	1	Wajo	\N	\N	t	Wajo
398	28	2	Makassar	\N	\N	t	Makassar
399	28	2	Palopo	\N	\N	t	Palopo
400	28	2	Pare Pare	\N	\N	t	ParePare
401	29	1	Banggai	\N	\N	t	Banggai
402	29	1	Banggai Kepulauan	\N	\N	t	BanggaiKepulauan
403	29	1	Banggai Laut	\N	\N	t	BanggaiLaut
405	29	1	Donggala	\N	\N	t	Donggala
406	29	1	Morowali	\N	\N	t	Morowali
407	29	1	Morowali Utara	\N	\N	t	MorowaliUtara
408	29	1	Parigi Moutong	\N	\N	t	ParigiMoutong
409	29	1	Poso	\N	\N	t	Poso
410	29	1	Sigi	\N	\N	t	Sigi
411	29	1	Tojo Una Una	\N	\N	t	TojoUnaUna
412	29	1	Toli Toli	\N	\N	t	ToliToli
413	29	2	Palu	\N	\N	t	Palu
414	30	1	Bombana	\N	\N	t	Bombana
415	30	1	Buton	\N	\N	t	Buton
416	30	1	Buton Selatan	\N	\N	t	ButonSelatan
417	30	1	Buton Tengah	\N	\N	t	ButonTengah
418	30	1	Buton Utara	\N	\N	t	ButonUtara
419	30	1	Kolaka	\N	\N	t	Kolaka
420	30	1	Kolaka Timur	\N	\N	t	KolakaTimur
421	30	1	Kolaka Utara	\N	\N	t	KolakaUtara
422	30	1	Konawe	\N	\N	t	Konawe
423	30	1	Konawe Kepulauan	\N	\N	t	KonaweKepulauan
424	30	1	Konawe Selatan	\N	\N	t	KonaweSelatan
425	30	1	Konawe Utara	\N	\N	t	KonaweUtara
426	30	1	Muna	\N	\N	t	Muna
427	30	1	Muna Barat	\N	\N	t	MunaBarat
428	30	1	Wakatobi	\N	\N	t	Wakatobi
429	30	2	Bau Bau	\N	\N	t	BauBau
430	30	2	Kendari	\N	\N	t	Kendari
431	31	1	Bolaang Mongondow	\N	\N	t	BolaangMongondow
432	31	1	Bolaang Mongondow Selatan	\N	\N	t	BolaangMongondowSelatan
433	31	1	Bolaang Mongondow Timur	\N	\N	t	BolaangMongondowTimur
434	31	1	Bolaang Mongondow Utara	\N	\N	t	BolaangMongondowUtara
435	31	1	Kep. Siau Tagulandang Biaro	\N	\N	t	Kep.SiauTagulandangBiaro
436	31	1	Kepulauan Sangihe	\N	\N	t	KepulauanSangihe
437	31	1	Kepulauan Talaud	\N	\N	t	KepulauanTalaud
438	31	1	Minahasa	\N	\N	t	Minahasa
439	31	1	Minahasa Selatan	\N	\N	t	MinahasaSelatan
440	31	1	Minahasa Tenggara	\N	\N	t	MinahasaTenggara
441	31	1	Minahasa Utara	\N	\N	t	MinahasaUtara
442	31	2	Bitung	\N	\N	t	Bitung
443	31	2	Mobagu	\N	\N	t	Mobagu
444	31	2	Manado	\N	\N	t	Manado
445	31	2	Tomohon	\N	\N	t	Tomohon
446	32	1	Agam	\N	\N	t	Agam
447	32	1	Dharmasraya	\N	\N	t	Dharmasraya
448	32	1	Kepulauan Mentawai	\N	\N	t	KepulauanMentawai
449	32	1	Lima Puluh	\N	\N	t	LimaPuluh
450	32	1	Padang Pariaman	\N	\N	t	PadangPariaman
451	32	1	Pasaman	\N	\N	t	Pasaman
452	32	1	Pasaman Barat	\N	\N	t	PasamanBarat
453	32	1	Pesisir Selatan	\N	\N	t	PesisirSelatan
454	32	1	Sijunjung	\N	\N	t	Sijunjung
455	32	1	Solok	\N	\N	t	Solok
456	32	1	Solok Selatan	\N	\N	t	SolokSelatan
457	32	1	Tanah Datar	\N	\N	t	TanahDatar
458	32	2	Bukittinggi	\N	\N	t	Bukittinggi
459	32	2	Padang	\N	\N	t	Padang
460	32	2	Padang Panjang	\N	\N	t	PadangPanjang
461	32	2	Pariaman	\N	\N	t	Pariaman
462	32	2	Payakumbuh	\N	\N	t	Payakumbuh
463	32	2	Sawahlunto	\N	\N	t	Sawahlunto
464	32	2	Solok	\N	\N	t	Solok
465	33	1	Banyuasin	\N	\N	t	Banyuasin
466	33	1	Empat Lawang	\N	\N	t	EmpatLawang
467	33	1	Lahat	\N	\N	t	Lahat
468	33	1	Muara Enim	\N	\N	t	MuaraEnim
469	33	1	Musi Banyuasin	\N	\N	t	MusiBanyuasin
470	33	1	Musi Rawas	\N	\N	t	MusiRawas
471	33	1	Musi Rawas Utara	\N	\N	t	MusiRawasUtara
472	33	1	Ogan Ilir	\N	\N	t	OganIlir
473	33	1	Ogan Komering Ilir	\N	\N	t	OganKomeringIlir
474	33	1	Ogan Komering Ulu	\N	\N	t	OganKomeringUlu
475	33	1	Ogan Komering Ulu Selatan	\N	\N	t	OganKomeringUluSelatan
476	33	1	Ogan Komering Ulu Timur	\N	\N	t	OganKomeringUluTimur
477	33	1	Penukal Abab Lematang Ilir	\N	\N	t	PenukalAbabLematangIlir
478	33	2	Lubuk Linggau	\N	\N	t	LubukLinggau
479	33	2	Pagar Alam	\N	\N	t	PagarAlam
480	33	2	Palembang	\N	\N	t	Palembang
481	33	2	Prabumulih	\N	\N	t	Prabumulih
482	34	1	Asahan	\N	\N	t	Asahan
483	34	1	Batu Bara	\N	\N	t	BatuBara
484	34	1	Dairi	\N	\N	t	Dairi
485	34	1	Deli Serdang	\N	\N	t	DeliSerdang
486	34	1	Humbang Hasundutan	\N	\N	t	HumbangHasundutan
487	34	1	Karo	\N	\N	t	Karo
488	34	1	Labuhanbatu	\N	\N	t	Labuhanbatu
489	34	1	Labuhanbatu Selatan	\N	\N	t	LabuhanbatuSelatan
490	34	1	Labuhanbatu Utara	\N	\N	t	LabuhanbatuUtara
491	34	1	Langkat	\N	\N	t	Langkat
492	34	1	Mandailing Natal	\N	\N	t	MandailingNatal
493	34	1	Nias	\N	\N	t	Nias
494	34	1	Nias Barat	\N	\N	t	NiasBarat
495	34	1	Nias Selatan	\N	\N	t	NiasSelatan
496	34	1	Nias Utara	\N	\N	t	NiasUtara
497	34	1	Padang Lawas	\N	\N	t	PadangLawas
498	34	1	Padang Lawas Utara	\N	\N	t	PadangLawasUtara
499	34	1	Pakpak Bharat	\N	\N	t	PakpakBharat
500	34	1	Samosir	\N	\N	t	Samosir
501	34	1	Serdang Bedagai	\N	\N	t	SerdangBedagai
502	34	1	Simalungun	\N	\N	t	Simalungun
503	34	1	Tapanuli Selatan	\N	\N	t	TapanuliSelatan
504	34	1	Tapanuli Tengah	\N	\N	t	TapanuliTengah
505	34	1	Tapanuli Utara	\N	\N	t	TapanuliUtara
506	34	1	Toba Samosir	\N	\N	t	TobaSamosir
507	34	2	Binjai	\N	\N	t	Binjai
508	34	2	Gunungsitoli	\N	\N	t	Gunungsitoli
509	34	2	Medan	\N	\N	t	Medan
510	34	2	Padangsidimpuan	\N	\N	t	Padangsidimpuan
511	34	2	Pematang Siantar	\N	\N	t	PematangSiantar
512	34	2	Sibolga	\N	\N	t	Sibolga
513	34	2	Tanjung Balai	\N	\N	t	TanjungBalai
514	34	2	Tebing Tinggi	\N	\N	t	TebingTinggi
\.


--
-- Name: regencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('regencies_id_seq', 514, true);


--
-- Data for Name: regencies_regions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY regencies_regions (id, regency_id, region_id, active) FROM stdin;
1	97	3	t
2	79	3	t
3	80	3	t
4	128	4	t
5	138	4	t
6	178	6	t
7	154	7	t
8	174	7	t
9	51	5	t
10	52	5	t
11	53	5	t
12	54	5	t
13	55	5	t
14	56	2	t
15	57	2	t
16	58	2	t
17	59	2	t
18	60	2	t
19	61	2	t
20	79	10	t
21	80	10	t
22	81	10	t
23	82	10	t
24	83	10	t
25	84	10	t
26	85	10	t
27	86	10	t
28	87	10	t
29	88	10	t
30	89	10	t
31	90	10	t
32	91	10	t
33	92	10	t
34	93	10	t
35	94	10	t
36	95	10	t
37	96	10	t
38	97	10	t
39	98	10	t
40	99	10	t
41	100	10	t
42	101	10	t
43	102	10	t
44	103	10	t
45	104	10	t
46	105	10	t
47	106	9	t
48	107	9	t
49	108	9	t
50	109	9	t
51	110	9	t
52	111	9	t
53	112	9	t
54	113	9	t
55	114	9	t
56	115	9	t
57	116	9	t
58	117	9	t
59	118	9	t
60	119	9	t
61	120	9	t
62	121	9	t
63	122	9	t
64	123	9	t
65	124	9	t
66	125	9	t
67	126	9	t
68	127	9	t
69	128	9	t
70	129	9	t
71	130	9	t
72	131	9	t
73	132	9	t
74	133	9	t
75	134	9	t
76	135	9	t
77	136	9	t
78	137	9	t
79	138	9	t
80	139	9	t
81	140	9	t
82	141	8	t
83	142	8	t
84	143	8	t
85	144	8	t
86	145	8	t
87	146	8	t
88	147	8	t
89	148	8	t
90	149	8	t
91	150	8	t
92	151	8	t
93	152	8	t
94	153	8	t
95	154	8	t
96	155	8	t
97	156	8	t
98	157	8	t
99	158	8	t
100	159	8	t
101	160	8	t
102	161	8	t
103	162	8	t
104	163	8	t
105	164	8	t
106	165	8	t
107	166	8	t
108	167	8	t
109	168	8	t
110	169	8	t
111	170	8	t
112	171	8	t
113	172	8	t
114	173	8	t
115	174	8	t
116	175	8	t
117	176	8	t
118	177	8	t
119	178	8	t
120	101	11	t
121	142	12	t
122	94	13	t
123	104	13	t
\.


--
-- Name: regencies_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('regencies_regions_id_seq', 123, true);


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY regions (id, lat, lng, name, active, description) FROM stdin;
1	-6.174761	106.827049	All	t	\N
2	-6.174761	106.827049	Jakarta	t	\N
3	-6.902548	107.619125	Bandung	t	\N
4	-6.984068	110.409332	Semarang	t	\N
5	-7.793539	110.365723	Yogyakarta	t	\N
6	-7.245559	112.737885	Surabaya	t	\N
7	-7.982608	112.631676	Malang	t	\N
8	-7.982608	112.631676	Jawa Timur	t	\N
9	-7.358504	109.903107	Jawa Tengah	t	\N
10	-6.902548	107.619125	Jawa Barat	t	\N
11	-6.872532	107.541576	Cimahi	t	Cimahi
12	-8.209217	114.372730	Banyuwangi	t	Banyuwangi
13	-6.920663	106.925124	Sukabumi	t	Sukabumi
\.


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('regions_id_seq', 13, true);


--
-- Data for Name: respondents; Type: TABLE DATA; Schema: public; Owner: user
--

COPY respondents (id, region_id, t_user_id, name, t_user_screen_name, official, active, tmc) FROM stdin;
2	1	77347074	Aan Subarkah	@aansubarkah	f	t	f
3	1	3279770761	Akaryo Basuki	@basuki_akaryo	f	t	f
4	1	84294937	Akmal Subarkah	@Akmalsubarkah	f	t	f
5	1	144223368	Alam Jaya	@alamjy	f	t	f
6	1	3116975903	Anti Fraud	@al_suta	f	t	f
7	1	24141574	Anto	@atoxmorrison	f	t	f
8	3	288012716	Bdg247 ID	@bdg247_id	t	t	f
9	1	96737440	Cahyo Purnomo	@cahyopurnomo	f	t	f
11	1	3555146480	Dimana Macet ID	@dimanamacetid	t	t	f
12	1	146784350	Dimas A Yudhistira	@demoez	f	t	f
17	6	203740486	Dishub Surabaya	@SbyTrafficServ	t	t	f
18	1	4709751884	Dwi mariyanto	@dwimariyanto51	f	t	f
20	1	876628315	FWN	@PapanyaAbin	f	t	f
21	1	86474402	Fauzan Luthsa	@just_fau	f	t	f
25	1	428846984	Kandi Sofia S.Dahlan	@SophieAG34	f	t	f
26	1	76607888	Kemal Ramadhan	@kemalramadhan	f	t	f
27	1	861195031	Kembang Kertas	@kembangkertas97	f	t	f
33	2	18795386	Lewat Mana	@lewatmana	t	t	f
34	2	310179866	Marga Mandalasakti	@tol_mms	t	t	f
35	1	41526507	Mas Wiro	@misery2814	f	t	f
36	1	3166112833	Mina MinuL	@MinulMinola	f	t	f
37	1	174941113	MuchammadRif'anFahmi	@fahmijepang	f	t	f
39	1	70633648	Ngurah Mantrawan	@Ngurah_M1	f	t	f
40	3	150589950	PRFM Bandung	@PRFMnews	t	t	f
41	1	634336166	Pasingsingan	@un99uls	f	t	f
42	1	32922394	Priyatno Nugroho	@Priyatno	f	t	f
46	1	2362106281	Ricky Roenaldi	@ijoireng1976	f	t	f
47	1	97844051	RiniRahman	@nierahman	f	t	f
50	1	2246780575	Saling Berbagi ID	@SalingBerbagiID	f	t	f
51	2	1445782526	Senkom CMNP	@SenkomCMNP	t	t	f
52	1	2177816828	Sulas	@arisulasw	f	t	f
53	1	16778168	Syaifuddin Sayuti	@syaifuddin1969	f	t	f
58	1	154823098	ThahirSyaugi	@thahirsyaugi	f	t	f
59	1	4479234133	andy eko	@andhi125	f	t	f
60	1	614928493	anita	@tyeonita	f	t	f
61	1	4617460033	ardantto_fizz	@ardantto_fiz	f	t	f
62	1	81037332	ary	@arydc81	f	t	f
63	1	4833888843	lief torreno	@aryalatif08	f	t	f
64	1	3458271384	???? ??????HADRAMOUT	@Hadramout_Resto	f	t	f
15	3	1883174162	Dishub Kota Bandung	@dishub_kotabdg	t	t	f
14	3	567783542	Dishub Kab Bandung	@dishub_bdgkab	t	t	f
28	6	187417004	Lantas Banyuwangi	@Lantas_Bwi	t	f	f
45	1	168603077	RTTMC HUBDAT	@rttmchubdat	t	t	f
19	2	121640063	Elshinta	@RadioElshinta	t	t	f
10	2	111922097	David Yitzack	@DavidYitzack	f	t	f
23	2	540625251	Jasa Marga	@PTJASAMARGA	t	t	f
48	6	203912067	Rio - motorrio.com	@rioryueno	f	t	f
49	8	848614550	SS	@e100ss	t	t	f
1	4	2424832381	ATCS Kota Semarang	@ATCS_KotaSMRG	t	t	f
13	10	178940322	Dishub Jabar	@dishub_jabar	t	t	f
22	9	711871052	Halo Pantura	@HaloPantura	t	t	f
24	2	947704081	Jonathan-PT.ISI	@JonathanPTISI	f	t	f
16	11	2204104093	Dishub Kota Cimahi	@Dishub_Cimahi	t	t	f
65	2	2169136951	gpsberjalan	@gpsberjalan	t	t	f
38	1	130169009	NTMC Lantas Polri	@NTMCLantasPolri	t	f	t
43	8	125832312	RTMC Jatim	@RTMC_Jatim	t	f	t
31	3	2332687015	Lantas Sukabumi	@lantas_ratu	t	f	t
32	6	126280107	Lantas Surabaya	@Lantas_Surabaya	t	t	t
29	7	\N	Lantas Malang	@LantasResMlg	t	f	t
30	6	\N	Lantas Sidoarjo	@lantassidoarjo	t	f	t
44	10	240973018	RTMC Polda Jabar	@RTMC_PoldaJabar	t	f	t
55	2	76647722	TMC Polda Metro Jaya	@TMCPoldaMetro	t	f	t
54	1	\N	TMC	@TMC	t	f	t
56	3	221659467	TMC Restabes Bandung	@tmc_restabesbdg	t	f	t
57	3	4777183652	TMC_PolresCimahi	@TMCpolrescimahi	t	f	t
66	1	3217508051	Unusual Traffic JKT	@WazeTrafficJKT	t	t	f
\.


--
-- Name: respondents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('respondents_id_seq', 66, true);


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: user
--

COPY reviews (id, raw_id, error_id, user_id, explanation, created, modified, active) FROM stdin;
\.


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('reviews_id_seq', 1, false);


--
-- Data for Name: spaces; Type: TABLE DATA; Schema: public; Owner: user
--

COPY spaces (id, spot_id, user_id, place_id, active) FROM stdin;
\.


--
-- Name: spaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('spaces_id_seq', 1, false);


--
-- Data for Name: spots; Type: TABLE DATA; Schema: public; Owner: user
--

COPY spots (id, chunk_id, t_id, place_id, category_id, processed, created, modified, active, score) FROM stdin;
\.


--
-- Name: spots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('spots_id_seq', 1, true);


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: user
--

COPY states (id, name, active) FROM stdin;
1	Aceh	t
2	Bali	t
3	Banten	t
4	Bengkulu	t
5	DI Yogyakarta	t
6	DKI Jakarta	t
7	Gorontalo	t
8	Jambi	t
9	Jawa Barat	t
10	Jawa Tengah	t
11	Jawa Timur	t
12	Kalimantan Barat	t
13	Kalimantan Selatan	t
14	Kalimantan Tengah	t
15	Kalimantan Timur	t
16	Kalimantan Utara	t
17	Kepulauan Bangka Belitung	t
18	Kepulauan Riau	t
19	Lampung	t
20	Maluku	t
21	Maluku Utara	t
22	Nusa Tenggara Barat	t
23	Nusa Tenggara Timur	t
24	Papua	t
25	Papua Barat	t
26	Riau	t
27	Sulawesi Barat	t
28	Sulawesi Selatan	t
29	Sulawesi Tengah	t
30	Sulawesi Tenggara	t
31	Sulawesi Utara	t
32	Sumatera Barat	t
33	Sumatera Selatan	t
34	Sumatera Utara	t
\.


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('states_id_seq', 34, true);


--
-- Data for Name: syllables; Type: TABLE DATA; Schema: public; Owner: user
--

COPY syllables (id, user_id, word_id, trained, created, modified, active, word) FROM stdin;
\.


--
-- Name: syllables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('syllables_id_seq', 1, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: user
--

COPY tags (id, name, description, example, active) FROM stdin;
1	-None-	Kata belum teridentifikasi	detik/-None-	t
2	NN	Noun, kata benda, kata yang mengindikasikan nama tempat	bawah/NN jalan/NN kecelakaan/NN Bundaran/NN Kawasan/NN	t
3	NNP	Nama orang, tempat	Simpang/NNP Juanda/NNP	t
8	--	Garis setrip	-/--	t
4	'	Tanda petik	"/'	t
5	(	Buka kurung	(/( {/( [/(	t
6	)	Tutup kurung	)/) }/) ]/)	t
7	,	Koma	,/,	t
9	.	Tanda berhenti kalimat	./. ?/. !/.	t
10	:	Titik dua atau elipsis	:/: ;/: .../:	t
11	CC	Konjungtor koordinatif, menghubungkan 2 satuan bahasa atau lebih yang sederajat	dan/CC tetapi/CC atau/CC karena/CC	t
12	CD	Cardinal Number, untuk menunjukkan kata yang jawabannya berapa	18.00/CD 18:0/CD wib/CD	t
13	DC	Indikator lokasi	sebaliknya/DC 2 arah/DC	t
14	DT	Artikel, bertugas membatasi makna nomina	para/DT sang/DT si/DT	t
15	FW	Kata bahasa asing, pada dasarnya kata bahasa asing adalah kata yg tidak terdapat dalam KBBI. Jika sebuah kata bahasa asing menjadi bagian dari Proper Noun atau nama, kata bahasa asing tersebut diberi Tag NNP	climate/FW change/FW terms/FW and/FW conditions/FW	t
16	IN	Preposisi, kata depan. Menghubungkan kata atau frasa dengan konsituan di depan preposisi sehingga terbentuk frasa preposisional	dalam/IN dengan/IN di/IN ke/IN dari/IN arah/IN oleh/IN pada/IN untuk/IN tujuan/IN	t
17	JJ	Adjektiva, kata sifat, terutama untuk mengindikasikan kondisi jalan	macet/JJ padat/JJ ramai/JJ lancar/JJ normal/JJ kondusif/JJ	t
18	LS	Penanda daftar	A, B, First, Second, Third, Three, Two, a, b, c, d	t
19	MD	Verba modal dan verba bantu	boleh/MD harus/MD sudah/MD mesti/MD perlu/MD mari/MD masih/MD	t
20	PRP	Promina Persona, promina yg dipakai untuk mengacu pada orang	saya/PRP kami/PRP kita/PRP kamu/PRP kalian/PRP dia/PRP mereka/PRP	t
21	RB	Kata Keterangan	Lalu/RB Lintas/RB Lalin/RB	t
22	RP	Partikel, digunakan untuk menegaskan kalimat interogatif, imperatif atau deklaratif	pun/RP -lah/RP -kah/RP	t
23	SYM	Simbol	%/SYM &/SYM */SYM +/SYM </SYM =/SYM >/SYM @/SYM	t
24	VB	Kata kerja	merancang/VB mengatur/VB pergi/VB bekerja/VB tertidur/VB peningkatan/VB terpantau/VB	t
25	WI	Indikator Cuaca	cerah/WI hujan/WI gerimis/WI deras/WI	t
26	WP	Kata Tanya	bagaimana/WP	t
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('tags_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY users (id, group_id, region_id, username, email, password, active, t_user_id) FROM stdin;
1	1	1	aansubarkah	aansubarkah@gmail.com	jayapura	t	77347074
2	1	1	akmalsubarkah	akmalsubarkah@rocketmail.com	jayapura	t	84294937
3	1	1	twitterrobot	macetsurabaya@gmail.com	jayapura	t	3517023912
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: user
--

COPY weather (id, name, active) FROM stdin;
1	Cerah	t
2	Mendung	t
3	Hujan Deras	t
4	Gerimis	t
5	Hujan	t
\.


--
-- Name: weathers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('weathers_id_seq', 5, true);


--
-- Data for Name: words; Type: TABLE DATA; Schema: public; Owner: user
--

COPY words (id, t_id, tag_id, user_id, sequence, word, verified, trained, created, modified, active) FROM stdin;
\.


--
-- Name: words_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('words_id_seq', 1, false);


--
-- Name: breeds_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY breeds
    ADD CONSTRAINT breeds_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: chunks_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY chunks
    ADD CONSTRAINT chunks_pkey PRIMARY KEY (id);


--
-- Name: claps_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY claps
    ADD CONSTRAINT claps_pkey PRIMARY KEY (id);


--
-- Name: classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY classifications
    ADD CONSTRAINT classifications_pkey PRIMARY KEY (id);


--
-- Name: denominations_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY denominations
    ADD CONSTRAINT denominations_pkey PRIMARY KEY (id);


--
-- Name: districts_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- Name: elements_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY elements
    ADD CONSTRAINT elements_pkey PRIMARY KEY (id);


--
-- Name: errors_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY errors
    ADD CONSTRAINT errors_pkey PRIMARY KEY (id);


--
-- Name: fails_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY fails
    ADD CONSTRAINT fails_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: hierarchies_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY hierarchies
    ADD CONSTRAINT hierarchies_pkey PRIMARY KEY (id);


--
-- Name: humans_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY humans
    ADD CONSTRAINT humans_pkey PRIMARY KEY (id);


--
-- Name: kinds_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY kinds
    ADD CONSTRAINT kinds_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: logs_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: machines_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY machines
    ADD CONSTRAINT machines_pkey PRIMARY KEY (id);


--
-- Name: markers_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY markers
    ADD CONSTRAINT markers_pkey PRIMARY KEY (id);


--
-- Name: pieces_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY pieces
    ADD CONSTRAINT pieces_pkey PRIMARY KEY (id);


--
-- Name: places_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: raws_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY raws
    ADD CONSTRAINT raws_pkey PRIMARY KEY (id);


--
-- Name: regencies_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY regencies
    ADD CONSTRAINT regencies_pkey PRIMARY KEY (id);


--
-- Name: regencies_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY regencies_regions
    ADD CONSTRAINT regencies_regions_pkey PRIMARY KEY (id);


--
-- Name: regions_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: respondents_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY respondents
    ADD CONSTRAINT respondents_pkey PRIMARY KEY (id);


--
-- Name: reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: spaces_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY spaces
    ADD CONSTRAINT spaces_pkey PRIMARY KEY (id);


--
-- Name: spots_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY spots
    ADD CONSTRAINT spots_pkey PRIMARY KEY (id);


--
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: syllables_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY syllables
    ADD CONSTRAINT syllables_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: weathers_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY weather
    ADD CONSTRAINT weathers_pkey PRIMARY KEY (id);


--
-- Name: words_pkey; Type: CONSTRAINT; Schema: public; Owner: user; Tablespace: 
--

ALTER TABLE ONLY words
    ADD CONSTRAINT words_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO fgs;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO fgs;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO fgs;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO fgs;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO fgs;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO fgs;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO fgs;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO fgs;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO fgs;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO fgs;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO fgs;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO fgs;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_blogcategory; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE blog_blogcategory (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000),
    site_id integer NOT NULL
);


ALTER TABLE blog_blogcategory OWNER TO fgs;

--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE blog_blogcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogcategory_id_seq OWNER TO fgs;

--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE blog_blogcategory_id_seq OWNED BY blog_blogcategory.id;


--
-- Name: blog_blogpost; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE blog_blogpost (
    id integer NOT NULL,
    comments_count integer NOT NULL,
    keywords_string character varying(500) NOT NULL,
    rating_count integer NOT NULL,
    rating_sum integer NOT NULL,
    rating_average double precision NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000),
    _meta_title character varying(500),
    description text NOT NULL,
    gen_description boolean NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    status integer NOT NULL,
    publish_date timestamp with time zone,
    expiry_date timestamp with time zone,
    short_url character varying(200),
    in_sitemap boolean NOT NULL,
    content text NOT NULL,
    allow_comments boolean NOT NULL,
    featured_image character varying(255),
    site_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE blog_blogpost OWNER TO fgs;

--
-- Name: blog_blogpost_categories; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE blog_blogpost_categories (
    id integer NOT NULL,
    blogpost_id integer NOT NULL,
    blogcategory_id integer NOT NULL
);


ALTER TABLE blog_blogpost_categories OWNER TO fgs;

--
-- Name: blog_blogpost_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE blog_blogpost_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogpost_categories_id_seq OWNER TO fgs;

--
-- Name: blog_blogpost_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE blog_blogpost_categories_id_seq OWNED BY blog_blogpost_categories.id;


--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE blog_blogpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogpost_id_seq OWNER TO fgs;

--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE blog_blogpost_id_seq OWNED BY blog_blogpost.id;


--
-- Name: blog_blogpost_related_posts; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE blog_blogpost_related_posts (
    id integer NOT NULL,
    from_blogpost_id integer NOT NULL,
    to_blogpost_id integer NOT NULL
);


ALTER TABLE blog_blogpost_related_posts OWNER TO fgs;

--
-- Name: blog_blogpost_related_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE blog_blogpost_related_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogpost_related_posts_id_seq OWNER TO fgs;

--
-- Name: blog_blogpost_related_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE blog_blogpost_related_posts_id_seq OWNED BY blog_blogpost_related_posts.id;


--
-- Name: conf_setting; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE conf_setting (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    value character varying(2000) NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE conf_setting OWNER TO fgs;

--
-- Name: conf_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE conf_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conf_setting_id_seq OWNER TO fgs;

--
-- Name: conf_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE conf_setting_id_seq OWNED BY conf_setting.id;


--
-- Name: core_sitepermission; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE core_sitepermission (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE core_sitepermission OWNER TO fgs;

--
-- Name: core_sitepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE core_sitepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_sitepermission_id_seq OWNER TO fgs;

--
-- Name: core_sitepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE core_sitepermission_id_seq OWNED BY core_sitepermission.id;


--
-- Name: core_sitepermission_sites; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE core_sitepermission_sites (
    id integer NOT NULL,
    sitepermission_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE core_sitepermission_sites OWNER TO fgs;

--
-- Name: core_sitepermission_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE core_sitepermission_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_sitepermission_sites_id_seq OWNER TO fgs;

--
-- Name: core_sitepermission_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE core_sitepermission_sites_id_seq OWNED BY core_sitepermission_sites.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO fgs;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO fgs;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_comment_flags; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE django_comment_flags (
    id integer NOT NULL,
    flag character varying(30) NOT NULL,
    flag_date timestamp with time zone NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE django_comment_flags OWNER TO fgs;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE django_comment_flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_comment_flags_id_seq OWNER TO fgs;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE django_comment_flags_id_seq OWNED BY django_comment_flags.id;


--
-- Name: django_comments; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE django_comments (
    id integer NOT NULL,
    object_pk text NOT NULL,
    user_name character varying(50) NOT NULL,
    user_email character varying(254) NOT NULL,
    user_url character varying(200) NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    ip_address inet,
    is_public boolean NOT NULL,
    is_removed boolean NOT NULL,
    content_type_id integer NOT NULL,
    site_id integer NOT NULL,
    user_id integer
);


ALTER TABLE django_comments OWNER TO fgs;

--
-- Name: django_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE django_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_comments_id_seq OWNER TO fgs;

--
-- Name: django_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE django_comments_id_seq OWNED BY django_comments.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO fgs;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO fgs;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO fgs;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO fgs;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_redirect; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE django_redirect (
    id integer NOT NULL,
    site_id integer NOT NULL,
    old_path character varying(200) NOT NULL,
    new_path character varying(200) NOT NULL
);


ALTER TABLE django_redirect OWNER TO fgs;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE django_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_redirect_id_seq OWNER TO fgs;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE django_redirect_id_seq OWNED BY django_redirect.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO fgs;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO fgs;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO fgs;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: fgs_blog_article; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE fgs_blog_article (
    id integer NOT NULL,
    header character varying(128) NOT NULL,
    body character varying(8192) NOT NULL,
    create_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    authors_id integer NOT NULL
);


ALTER TABLE fgs_blog_article OWNER TO fgs;

--
-- Name: fgs_blog_article_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE fgs_blog_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fgs_blog_article_id_seq OWNER TO fgs;

--
-- Name: fgs_blog_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE fgs_blog_article_id_seq OWNED BY fgs_blog_article.id;


--
-- Name: fgs_blog_article_tags; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE fgs_blog_article_tags (
    id integer NOT NULL,
    article_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE fgs_blog_article_tags OWNER TO fgs;

--
-- Name: fgs_blog_article_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE fgs_blog_article_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fgs_blog_article_tags_id_seq OWNER TO fgs;

--
-- Name: fgs_blog_article_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE fgs_blog_article_tags_id_seq OWNED BY fgs_blog_article_tags.id;


--
-- Name: fgs_blog_author; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE fgs_blog_author (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    surname character varying(128) NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(11) NOT NULL
);


ALTER TABLE fgs_blog_author OWNER TO fgs;

--
-- Name: fgs_blog_author_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE fgs_blog_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fgs_blog_author_id_seq OWNER TO fgs;

--
-- Name: fgs_blog_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE fgs_blog_author_id_seq OWNED BY fgs_blog_author.id;


--
-- Name: fgs_blog_tag; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE fgs_blog_tag (
    id integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE fgs_blog_tag OWNER TO fgs;

--
-- Name: fgs_blog_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE fgs_blog_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fgs_blog_tag_id_seq OWNER TO fgs;

--
-- Name: fgs_blog_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE fgs_blog_tag_id_seq OWNED BY fgs_blog_tag.id;


--
-- Name: forms_field; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE forms_field (
    id integer NOT NULL,
    _order integer,
    label character varying(200) NOT NULL,
    field_type integer NOT NULL,
    required boolean NOT NULL,
    visible boolean NOT NULL,
    choices character varying(1000) NOT NULL,
    "default" character varying(2000) NOT NULL,
    placeholder_text character varying(100) NOT NULL,
    help_text character varying(100) NOT NULL,
    form_id integer NOT NULL
);


ALTER TABLE forms_field OWNER TO fgs;

--
-- Name: forms_field_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE forms_field_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE forms_field_id_seq OWNER TO fgs;

--
-- Name: forms_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE forms_field_id_seq OWNED BY forms_field.id;


--
-- Name: forms_fieldentry; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE forms_fieldentry (
    id integer NOT NULL,
    field_id integer NOT NULL,
    value character varying(2000),
    entry_id integer NOT NULL
);


ALTER TABLE forms_fieldentry OWNER TO fgs;

--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE forms_fieldentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE forms_fieldentry_id_seq OWNER TO fgs;

--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE forms_fieldentry_id_seq OWNED BY forms_fieldentry.id;


--
-- Name: forms_form; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE forms_form (
    page_ptr_id integer NOT NULL,
    content text NOT NULL,
    button_text character varying(50) NOT NULL,
    response text NOT NULL,
    send_email boolean NOT NULL,
    email_from character varying(254) NOT NULL,
    email_copies character varying(200) NOT NULL,
    email_subject character varying(200) NOT NULL,
    email_message text NOT NULL
);


ALTER TABLE forms_form OWNER TO fgs;

--
-- Name: forms_formentry; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE forms_formentry (
    id integer NOT NULL,
    entry_time timestamp with time zone NOT NULL,
    form_id integer NOT NULL
);


ALTER TABLE forms_formentry OWNER TO fgs;

--
-- Name: forms_formentry_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE forms_formentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE forms_formentry_id_seq OWNER TO fgs;

--
-- Name: forms_formentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE forms_formentry_id_seq OWNED BY forms_formentry.id;


--
-- Name: galleries_gallery; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE galleries_gallery (
    page_ptr_id integer NOT NULL,
    content text NOT NULL,
    zip_import character varying(100) NOT NULL
);


ALTER TABLE galleries_gallery OWNER TO fgs;

--
-- Name: galleries_galleryimage; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE galleries_galleryimage (
    id integer NOT NULL,
    _order integer,
    file character varying(200) NOT NULL,
    description character varying(1000) NOT NULL,
    gallery_id integer NOT NULL
);


ALTER TABLE galleries_galleryimage OWNER TO fgs;

--
-- Name: galleries_galleryimage_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE galleries_galleryimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE galleries_galleryimage_id_seq OWNER TO fgs;

--
-- Name: galleries_galleryimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE galleries_galleryimage_id_seq OWNED BY galleries_galleryimage.id;


--
-- Name: generic_assignedkeyword; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE generic_assignedkeyword (
    id integer NOT NULL,
    _order integer,
    object_pk integer NOT NULL,
    content_type_id integer NOT NULL,
    keyword_id integer NOT NULL
);


ALTER TABLE generic_assignedkeyword OWNER TO fgs;

--
-- Name: generic_assignedkeyword_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE generic_assignedkeyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE generic_assignedkeyword_id_seq OWNER TO fgs;

--
-- Name: generic_assignedkeyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE generic_assignedkeyword_id_seq OWNED BY generic_assignedkeyword.id;


--
-- Name: generic_keyword; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE generic_keyword (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000),
    site_id integer NOT NULL
);


ALTER TABLE generic_keyword OWNER TO fgs;

--
-- Name: generic_keyword_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE generic_keyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE generic_keyword_id_seq OWNER TO fgs;

--
-- Name: generic_keyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE generic_keyword_id_seq OWNED BY generic_keyword.id;


--
-- Name: generic_rating; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE generic_rating (
    id integer NOT NULL,
    value integer NOT NULL,
    rating_date timestamp with time zone,
    object_pk integer NOT NULL,
    content_type_id integer NOT NULL,
    user_id integer
);


ALTER TABLE generic_rating OWNER TO fgs;

--
-- Name: generic_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE generic_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE generic_rating_id_seq OWNER TO fgs;

--
-- Name: generic_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE generic_rating_id_seq OWNED BY generic_rating.id;


--
-- Name: generic_threadedcomment; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE generic_threadedcomment (
    comment_ptr_id integer NOT NULL,
    rating_count integer NOT NULL,
    rating_sum integer NOT NULL,
    rating_average double precision NOT NULL,
    by_author boolean NOT NULL,
    replied_to_id integer
);


ALTER TABLE generic_threadedcomment OWNER TO fgs;

--
-- Name: pages_link; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE pages_link (
    page_ptr_id integer NOT NULL
);


ALTER TABLE pages_link OWNER TO fgs;

--
-- Name: pages_page; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE pages_page (
    id integer NOT NULL,
    keywords_string character varying(500) NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000),
    _meta_title character varying(500),
    description text NOT NULL,
    gen_description boolean NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    status integer NOT NULL,
    publish_date timestamp with time zone,
    expiry_date timestamp with time zone,
    short_url character varying(200),
    in_sitemap boolean NOT NULL,
    _order integer,
    in_menus character varying(100),
    titles character varying(1000),
    content_model character varying(50),
    login_required boolean NOT NULL,
    parent_id integer,
    site_id integer NOT NULL
);


ALTER TABLE pages_page OWNER TO fgs;

--
-- Name: pages_page_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE pages_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pages_page_id_seq OWNER TO fgs;

--
-- Name: pages_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE pages_page_id_seq OWNED BY pages_page.id;


--
-- Name: pages_richtextpage; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE pages_richtextpage (
    page_ptr_id integer NOT NULL,
    content text NOT NULL
);


ALTER TABLE pages_richtextpage OWNER TO fgs;

--
-- Name: twitter_query; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE twitter_query (
    id integer NOT NULL,
    type character varying(10) NOT NULL,
    value character varying(140) NOT NULL,
    interested boolean NOT NULL
);


ALTER TABLE twitter_query OWNER TO fgs;

--
-- Name: twitter_query_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE twitter_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE twitter_query_id_seq OWNER TO fgs;

--
-- Name: twitter_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE twitter_query_id_seq OWNED BY twitter_query.id;


--
-- Name: twitter_tweet; Type: TABLE; Schema: public; Owner: fgs
--

CREATE TABLE twitter_tweet (
    id integer NOT NULL,
    remote_id character varying(50) NOT NULL,
    created_at timestamp with time zone,
    text text,
    profile_image_url character varying(200),
    user_name character varying(100),
    full_name character varying(100),
    retweeter_profile_image_url character varying(200),
    retweeter_user_name character varying(100),
    retweeter_full_name character varying(100),
    query_id integer NOT NULL
);


ALTER TABLE twitter_tweet OWNER TO fgs;

--
-- Name: twitter_tweet_id_seq; Type: SEQUENCE; Schema: public; Owner: fgs
--

CREATE SEQUENCE twitter_tweet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE twitter_tweet_id_seq OWNER TO fgs;

--
-- Name: twitter_tweet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fgs
--

ALTER SEQUENCE twitter_tweet_id_seq OWNED BY twitter_tweet.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogcategory ALTER COLUMN id SET DEFAULT nextval('blog_blogcategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost ALTER COLUMN id SET DEFAULT nextval('blog_blogpost_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost_categories ALTER COLUMN id SET DEFAULT nextval('blog_blogpost_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost_related_posts ALTER COLUMN id SET DEFAULT nextval('blog_blogpost_related_posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY conf_setting ALTER COLUMN id SET DEFAULT nextval('conf_setting_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY core_sitepermission ALTER COLUMN id SET DEFAULT nextval('core_sitepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY core_sitepermission_sites ALTER COLUMN id SET DEFAULT nextval('core_sitepermission_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_comment_flags ALTER COLUMN id SET DEFAULT nextval('django_comment_flags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_comments ALTER COLUMN id SET DEFAULT nextval('django_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_redirect ALTER COLUMN id SET DEFAULT nextval('django_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY fgs_blog_article ALTER COLUMN id SET DEFAULT nextval('fgs_blog_article_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY fgs_blog_article_tags ALTER COLUMN id SET DEFAULT nextval('fgs_blog_article_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY fgs_blog_author ALTER COLUMN id SET DEFAULT nextval('fgs_blog_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY fgs_blog_tag ALTER COLUMN id SET DEFAULT nextval('fgs_blog_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY forms_field ALTER COLUMN id SET DEFAULT nextval('forms_field_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY forms_fieldentry ALTER COLUMN id SET DEFAULT nextval('forms_fieldentry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY forms_formentry ALTER COLUMN id SET DEFAULT nextval('forms_formentry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY galleries_galleryimage ALTER COLUMN id SET DEFAULT nextval('galleries_galleryimage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_assignedkeyword ALTER COLUMN id SET DEFAULT nextval('generic_assignedkeyword_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_keyword ALTER COLUMN id SET DEFAULT nextval('generic_keyword_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_rating ALTER COLUMN id SET DEFAULT nextval('generic_rating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY pages_page ALTER COLUMN id SET DEFAULT nextval('pages_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY twitter_query ALTER COLUMN id SET DEFAULT nextval('twitter_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY twitter_tweet ALTER COLUMN id SET DEFAULT nextval('twitter_tweet_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: fgs
--

INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add site', 7, 'add_site');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change site', 7, 'change_site');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete site', 7, 'delete_site');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can add author', 8, 'add_author');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can change author', 8, 'change_author');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can delete author', 8, 'delete_author');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add tag', 9, 'add_tag');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change tag', 9, 'change_tag');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete tag', 9, 'delete_tag');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add article', 10, 'add_article');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change article', 10, 'change_article');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete article', 10, 'delete_article');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add redirect', 11, 'add_redirect');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change redirect', 11, 'change_redirect');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete redirect', 11, 'delete_redirect');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add Setting', 12, 'add_setting');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change Setting', 12, 'change_setting');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete Setting', 12, 'delete_setting');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add Site permission', 13, 'add_sitepermission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change Site permission', 13, 'change_sitepermission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete Site permission', 13, 'delete_sitepermission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can add Comment', 14, 'add_threadedcomment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can change Comment', 14, 'change_threadedcomment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can delete Comment', 14, 'delete_threadedcomment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can add Keyword', 15, 'add_keyword');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can change Keyword', 15, 'change_keyword');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can delete Keyword', 15, 'delete_keyword');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can add assigned keyword', 16, 'add_assignedkeyword');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can change assigned keyword', 16, 'change_assignedkeyword');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can delete assigned keyword', 16, 'delete_assignedkeyword');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add Rating', 17, 'add_rating');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change Rating', 17, 'change_rating');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete Rating', 17, 'delete_rating');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can add Blog post', 18, 'add_blogpost');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can change Blog post', 18, 'change_blogpost');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can delete Blog post', 18, 'delete_blogpost');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can add Blog Category', 19, 'add_blogcategory');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can change Blog Category', 19, 'change_blogcategory');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can delete Blog Category', 19, 'delete_blogcategory');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can add Form', 20, 'add_form');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can change Form', 20, 'change_form');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can delete Form', 20, 'delete_form');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (61, 'Can add Field', 21, 'add_field');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (62, 'Can change Field', 21, 'change_field');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (63, 'Can delete Field', 21, 'delete_field');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (64, 'Can add Form entry', 22, 'add_formentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (65, 'Can change Form entry', 22, 'change_formentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (66, 'Can delete Form entry', 22, 'delete_formentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (67, 'Can add Form field entry', 23, 'add_fieldentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (68, 'Can change Form field entry', 23, 'change_fieldentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (69, 'Can delete Form field entry', 23, 'delete_fieldentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (70, 'Can add Page', 24, 'add_page');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (71, 'Can change Page', 24, 'change_page');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (72, 'Can delete Page', 24, 'delete_page');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (73, 'Can add Rich text page', 25, 'add_richtextpage');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (74, 'Can change Rich text page', 25, 'change_richtextpage');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (75, 'Can delete Rich text page', 25, 'delete_richtextpage');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (76, 'Can add Link', 26, 'add_link');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (77, 'Can change Link', 26, 'change_link');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (78, 'Can delete Link', 26, 'delete_link');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (79, 'Can add Gallery', 27, 'add_gallery');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (80, 'Can change Gallery', 27, 'change_gallery');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (81, 'Can delete Gallery', 27, 'delete_gallery');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (82, 'Can add Image', 28, 'add_galleryimage');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (83, 'Can change Image', 28, 'change_galleryimage');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (84, 'Can delete Image', 28, 'delete_galleryimage');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (85, 'Can add comment', 29, 'add_comment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (86, 'Can change comment', 29, 'change_comment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (87, 'Can delete comment', 29, 'delete_comment');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (88, 'Can moderate comments', 29, 'can_moderate');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (89, 'Can add comment flag', 30, 'add_commentflag');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (90, 'Can change comment flag', 30, 'change_commentflag');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (91, 'Can delete comment flag', 30, 'delete_commentflag');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (92, 'Can add Twitter query', 31, 'add_query');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (93, 'Can change Twitter query', 31, 'change_query');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (94, 'Can delete Twitter query', 31, 'delete_query');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (95, 'Can add Tweet', 32, 'add_tweet');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (96, 'Can change Tweet', 32, 'change_tweet');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (97, 'Can delete Tweet', 32, 'delete_tweet');


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('auth_permission_id_seq', 97, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: fgs
--

INSERT INTO auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$24000$YZoyapioH8LH$YhW/Isasbu8ZPL6/s7V6bd+8hVCOzW/XpY4JGwNtGvE=', '2016-09-18 12:42:53.007449+10', true, 'admin', '', '', 'm.a.gomza@yandex.ru', true, true, '2016-09-17 17:47:42.978752+10');


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: blog_blogcategory; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('blog_blogcategory_id_seq', 1, false);


--
-- Data for Name: blog_blogpost; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Data for Name: blog_blogpost_categories; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: blog_blogpost_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('blog_blogpost_categories_id_seq', 1, false);


--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('blog_blogpost_id_seq', 1, false);


--
-- Data for Name: blog_blogpost_related_posts; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: blog_blogpost_related_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('blog_blogpost_related_posts_id_seq', 1, false);


--
-- Data for Name: conf_setting; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: conf_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('conf_setting_id_seq', 1, false);


--
-- Data for Name: core_sitepermission; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: core_sitepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('core_sitepermission_id_seq', 1, false);


--
-- Data for Name: core_sitepermission_sites; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: core_sitepermission_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('core_sitepermission_sites_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: fgs
--

INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2016-09-17 17:55:03.800295+10', '2', 'asd@asd.com: me Beautifull', 1, 'Добавлено.', 8, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2016-09-17 17:55:12.720449+10', '1', 'first', 1, 'Добавлено.', 9, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2016-09-17 17:55:54.600433+10', '2', 'Article object', 1, 'Добавлено.', 10, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2016-09-17 17:56:28.592673+10', '2', 'Article object', 2, 'Ни одно поле не изменено.', 10, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2016-09-17 18:21:16.173071+10', '8', 'Первый', 1, 'Добавлено.', 9, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2016-09-17 18:21:46.144726+10', '11', 'me@krasava.com: Я Красавчик', 1, 'Добавлено.', 8, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2016-09-17 18:26:53.663286+10', '9', 'тестовый', 1, 'Добавлено.', 9, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2016-09-17 18:26:57.365691+10', '3', 'Article object', 1, 'Добавлено.', 10, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2016-09-17 19:22:03.545786+10', '5', 'Для теста пагинации2 написаную ', 1, 'Добавлено.', 10, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2016-09-17 19:22:18.597605+10', '6', 'Для теста пагинации3 написаную ', 1, 'Добавлено.', 10, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (11, '2016-09-17 19:22:34.718504+10', '7', 'Для теста пагинации4 написаную ', 1, 'Добавлено.', 10, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (12, '2016-09-17 19:22:48.724062+10', '8', 'Для теста пагинации5 написаную ', 1, 'Добавлено.', 10, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (13, '2016-09-17 19:23:07.056705+10', '9', 'Для теста пагинации6 написаную ', 1, 'Добавлено.', 10, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (14, '2016-09-18 12:43:24.019604+10', '3', 'Еще один для теста написаную ', 2, 'Изменен tags.', 10, 1);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 14, true);


--
-- Data for Name: django_comment_flags; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('django_comment_flags_id_seq', 1, false);


--
-- Data for Name: django_comments; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: django_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('django_comments_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: fgs
--

INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'sites', 'site');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'fgs_blog', 'author');
INSERT INTO django_content_type (id, app_label, model) VALUES (9, 'fgs_blog', 'tag');
INSERT INTO django_content_type (id, app_label, model) VALUES (10, 'fgs_blog', 'article');
INSERT INTO django_content_type (id, app_label, model) VALUES (11, 'redirects', 'redirect');
INSERT INTO django_content_type (id, app_label, model) VALUES (12, 'conf', 'setting');
INSERT INTO django_content_type (id, app_label, model) VALUES (13, 'core', 'sitepermission');
INSERT INTO django_content_type (id, app_label, model) VALUES (14, 'generic', 'threadedcomment');
INSERT INTO django_content_type (id, app_label, model) VALUES (15, 'generic', 'keyword');
INSERT INTO django_content_type (id, app_label, model) VALUES (16, 'generic', 'assignedkeyword');
INSERT INTO django_content_type (id, app_label, model) VALUES (17, 'generic', 'rating');
INSERT INTO django_content_type (id, app_label, model) VALUES (18, 'blog', 'blogpost');
INSERT INTO django_content_type (id, app_label, model) VALUES (19, 'blog', 'blogcategory');
INSERT INTO django_content_type (id, app_label, model) VALUES (20, 'forms', 'form');
INSERT INTO django_content_type (id, app_label, model) VALUES (21, 'forms', 'field');
INSERT INTO django_content_type (id, app_label, model) VALUES (22, 'forms', 'formentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (23, 'forms', 'fieldentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (24, 'pages', 'page');
INSERT INTO django_content_type (id, app_label, model) VALUES (25, 'pages', 'richtextpage');
INSERT INTO django_content_type (id, app_label, model) VALUES (26, 'pages', 'link');
INSERT INTO django_content_type (id, app_label, model) VALUES (27, 'galleries', 'gallery');
INSERT INTO django_content_type (id, app_label, model) VALUES (28, 'galleries', 'galleryimage');
INSERT INTO django_content_type (id, app_label, model) VALUES (29, 'django_comments', 'comment');
INSERT INTO django_content_type (id, app_label, model) VALUES (30, 'django_comments', 'commentflag');
INSERT INTO django_content_type (id, app_label, model) VALUES (31, 'twitter', 'query');
INSERT INTO django_content_type (id, app_label, model) VALUES (32, 'twitter', 'tweet');


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('django_content_type_id_seq', 32, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: fgs
--

INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2016-09-14 01:29:24.010901+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2016-09-14 01:29:24.869304+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2016-09-14 01:29:25.080044+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2016-09-14 01:29:25.124204+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2016-09-14 01:29:25.190941+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2016-09-14 01:29:25.224646+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0003_alter_user_email_max_length', '2016-09-14 01:29:25.258094+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0004_alter_user_username_opts', '2016-09-14 01:29:25.283252+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0005_alter_user_last_login_null', '2016-09-14 01:29:25.313106+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0006_require_contenttypes_0002', '2016-09-14 01:29:25.324384+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2016-09-14 01:29:25.378173+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'auth', '0008_alter_user_username_max_length', '2016-09-14 01:29:25.457918+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'sessions', '0001_initial', '2016-09-14 01:29:25.647594+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'fgs_blog', '0001_initial', '2016-09-15 23:18:29.877283+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'fgs_blog', '0002_articles_header', '2016-09-15 23:44:16.817621+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (16, 'fgs_blog', '0003_articles_is_delete', '2016-09-16 00:32:55.56969+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (17, 'fgs_blog', '0004_auto_20160916_0057', '2016-09-16 00:58:08.690691+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (18, 'sites', '0001_initial', '2016-09-16 00:58:08.756308+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (19, 'sites', '0002_alter_domain_unique', '2016-09-16 00:58:08.822822+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (20, 'fgs_blog', '0005_auto_20160917_0931', '2016-09-17 09:32:06.070264+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (21, 'fgs_blog', '0006_auto_20160917_1734', '2016-09-17 17:35:06.443501+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (22, 'blog', '0001_initial', '2016-09-19 23:37:57.638889+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (23, 'blog', '0002_auto_20150527_1555', '2016-09-19 23:37:57.816073+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (24, 'conf', '0001_initial', '2016-09-19 23:37:58.0277+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (25, 'core', '0001_initial', '2016-09-19 23:37:58.351049+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (26, 'core', '0002_auto_20150414_2140', '2016-09-19 23:37:58.762316+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (27, 'django_comments', '0001_initial', '2016-09-19 23:37:59.463508+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (28, 'django_comments', '0002_update_user_email_field_length', '2016-09-19 23:37:59.529203+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (29, 'django_comments', '0003_add_submit_date_index', '2016-09-19 23:37:59.640787+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (30, 'pages', '0001_initial', '2016-09-19 23:38:00.897935+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (31, 'forms', '0001_initial', '2016-09-19 23:38:01.654762+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (32, 'forms', '0002_auto_20141227_0224', '2016-09-19 23:38:01.729036+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (33, 'forms', '0003_emailfield', '2016-09-19 23:38:01.809178+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (34, 'forms', '0004_auto_20150517_0510', '2016-09-19 23:38:01.909301+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (35, 'forms', '0005_auto_20151026_1600', '2016-09-19 23:38:01.987046+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (36, 'galleries', '0001_initial', '2016-09-19 23:38:02.332839+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (37, 'galleries', '0002_auto_20141227_0224', '2016-09-19 23:38:02.407234+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (38, 'generic', '0001_initial', '2016-09-19 23:38:03.234007+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (39, 'generic', '0002_auto_20141227_0224', '2016-09-19 23:38:03.392785+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (40, 'pages', '0002_auto_20141227_0224', '2016-09-19 23:38:03.5267+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (41, 'pages', '0003_auto_20150527_1555', '2016-09-19 23:38:03.64491+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (42, 'redirects', '0001_initial', '2016-09-19 23:38:03.947502+10');
INSERT INTO django_migrations (id, app, name, applied) VALUES (43, 'twitter', '0001_initial', '2016-09-20 12:18:26.534572+10');


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('django_migrations_id_seq', 43, true);


--
-- Data for Name: django_redirect; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: django_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('django_redirect_id_seq', 1, false);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: fgs
--

INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('4sv02py7ya066zmc8m7rhlv93j6z6ype', 'YzY0NjVmMGYyZWNkNmUxYjhkOTNkNDc1MjFhZjJkZTA0YTI4NDRkZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzZWYxNGY4MzYyNTk3N2M5YzNjZTcwZGUyNDBkMzVmMjU5Nzg2NTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-10-01 17:47:51.257556+10');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('akzowrw9kiauth42hybdf4zounltdik3', 'YzY0NjVmMGYyZWNkNmUxYjhkOTNkNDc1MjFhZjJkZTA0YTI4NDRkZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzZWYxNGY4MzYyNTk3N2M5YzNjZTcwZGUyNDBkMzVmMjU5Nzg2NTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-10-02 12:42:53.063969+10');


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: fgs
--

INSERT INTO django_site (id, domain, name) VALUES (1, '127.0.0.1:8000', 'Default');


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: fgs_blog_article; Type: TABLE DATA; Schema: public; Owner: fgs
--

INSERT INTO fgs_blog_article (id, header, body, create_date, change_date, authors_id) VALUES (2, 'Безумно долго', 'Я что-то очень залип над задачей.', '2016-09-17 17:55:54.590196+10', '2016-09-17 17:56:28.586341+10', 2);
INSERT INTO fgs_blog_article (id, header, body, create_date, change_date, authors_id) VALUES (5, 'Для теста пагинации2', 'Для теста пагинации2', '2016-09-17 19:22:03.533276+10', '2016-09-17 19:22:03.533318+10', 11);
INSERT INTO fgs_blog_article (id, header, body, create_date, change_date, authors_id) VALUES (6, 'Для теста пагинации3', 'Для теста пагинации', '2016-09-17 19:22:18.588242+10', '2016-09-17 19:22:18.588291+10', 11);
INSERT INTO fgs_blog_article (id, header, body, create_date, change_date, authors_id) VALUES (7, 'Для теста пагинации4', 'Для теста пагинации', '2016-09-17 19:22:34.706368+10', '2016-09-17 19:22:34.706405+10', 11);
INSERT INTO fgs_blog_article (id, header, body, create_date, change_date, authors_id) VALUES (8, 'Для теста пагинации5', 'Для теста пагинации', '2016-09-17 19:22:48.709618+10', '2016-09-17 19:22:48.709656+10', 11);
INSERT INTO fgs_blog_article (id, header, body, create_date, change_date, authors_id) VALUES (9, 'Для теста пагинации6', 'Для теста пагинации', '2016-09-17 19:23:07.047503+10', '2016-09-17 19:23:07.047539+10', 11);
INSERT INTO fgs_blog_article (id, header, body, create_date, change_date, authors_id) VALUES (3, 'Еще один для теста', 'Просто какой-то текст', '2016-09-17 18:26:57.357121+10', '2016-09-18 12:43:23.968664+10', 2);


--
-- Name: fgs_blog_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('fgs_blog_article_id_seq', 9, true);


--
-- Data for Name: fgs_blog_article_tags; Type: TABLE DATA; Schema: public; Owner: fgs
--

INSERT INTO fgs_blog_article_tags (id, article_id, tag_id) VALUES (2, 2, 1);
INSERT INTO fgs_blog_article_tags (id, article_id, tag_id) VALUES (3, 3, 9);
INSERT INTO fgs_blog_article_tags (id, article_id, tag_id) VALUES (5, 5, 9);
INSERT INTO fgs_blog_article_tags (id, article_id, tag_id) VALUES (6, 6, 9);
INSERT INTO fgs_blog_article_tags (id, article_id, tag_id) VALUES (7, 7, 9);
INSERT INTO fgs_blog_article_tags (id, article_id, tag_id) VALUES (8, 8, 9);
INSERT INTO fgs_blog_article_tags (id, article_id, tag_id) VALUES (9, 9, 9);
INSERT INTO fgs_blog_article_tags (id, article_id, tag_id) VALUES (10, 3, 8);


--
-- Name: fgs_blog_article_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('fgs_blog_article_tags_id_seq', 10, true);


--
-- Data for Name: fgs_blog_author; Type: TABLE DATA; Schema: public; Owner: fgs
--

INSERT INTO fgs_blog_author (id, name, surname, email, phone) VALUES (2, 'me', 'Beautifull', 'asd@asd.com', '1234567890');
INSERT INTO fgs_blog_author (id, name, surname, email, phone) VALUES (11, 'Я', 'Красавчик', 'me@krasava.com', '1');


--
-- Name: fgs_blog_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('fgs_blog_author_id_seq', 11, true);


--
-- Data for Name: fgs_blog_tag; Type: TABLE DATA; Schema: public; Owner: fgs
--

INSERT INTO fgs_blog_tag (id, name) VALUES (1, 'first');
INSERT INTO fgs_blog_tag (id, name) VALUES (8, 'Первый');
INSERT INTO fgs_blog_tag (id, name) VALUES (9, 'тестовый');


--
-- Name: fgs_blog_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('fgs_blog_tag_id_seq', 9, true);


--
-- Data for Name: forms_field; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: forms_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('forms_field_id_seq', 1, false);


--
-- Data for Name: forms_fieldentry; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('forms_fieldentry_id_seq', 1, false);


--
-- Data for Name: forms_form; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Data for Name: forms_formentry; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: forms_formentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('forms_formentry_id_seq', 1, false);


--
-- Data for Name: galleries_gallery; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Data for Name: galleries_galleryimage; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: galleries_galleryimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('galleries_galleryimage_id_seq', 1, false);


--
-- Data for Name: generic_assignedkeyword; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: generic_assignedkeyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('generic_assignedkeyword_id_seq', 1, false);


--
-- Data for Name: generic_keyword; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: generic_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('generic_keyword_id_seq', 1, false);


--
-- Data for Name: generic_rating; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: generic_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('generic_rating_id_seq', 1, false);


--
-- Data for Name: generic_threadedcomment; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Data for Name: pages_link; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Data for Name: pages_page; Type: TABLE DATA; Schema: public; Owner: fgs
--

INSERT INTO pages_page (id, keywords_string, title, slug, _meta_title, description, gen_description, created, updated, status, publish_date, expiry_date, short_url, in_sitemap, _order, in_menus, titles, content_model, login_required, parent_id, site_id) VALUES (1, '', 'Blog', 'blog', NULL, 'Blog', true, NULL, NULL, 2, NULL, NULL, NULL, true, 1, '1,2,3', 'Blog', 'richtextpage', false, NULL, 1);


--
-- Name: pages_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('pages_page_id_seq', 1, true);


--
-- Data for Name: pages_richtextpage; Type: TABLE DATA; Schema: public; Owner: fgs
--

INSERT INTO pages_richtextpage (page_ptr_id, content) VALUES (1, '<p>Blog</p>');


--
-- Data for Name: twitter_query; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: twitter_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('twitter_query_id_seq', 1, false);


--
-- Data for Name: twitter_tweet; Type: TABLE DATA; Schema: public; Owner: fgs
--



--
-- Name: twitter_tweet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fgs
--

SELECT pg_catalog.setval('twitter_tweet_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_blogcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogcategory
    ADD CONSTRAINT blog_blogcategory_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_categories_blogpost_id_a64d32c5_uniq; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost_categories_blogpost_id_a64d32c5_uniq UNIQUE (blogpost_id, blogcategory_id);


--
-- Name: blog_blogpost_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost_categories_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_related_posts_from_blogpost_id_3bd0f49f_uniq; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_related_posts_from_blogpost_id_3bd0f49f_uniq UNIQUE (from_blogpost_id, to_blogpost_id);


--
-- Name: blog_blogpost_related_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_related_posts_pkey PRIMARY KEY (id);


--
-- Name: conf_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY conf_setting
    ADD CONSTRAINT conf_setting_pkey PRIMARY KEY (id);


--
-- Name: core_sitepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY core_sitepermission
    ADD CONSTRAINT core_sitepermission_pkey PRIMARY KEY (id);


--
-- Name: core_sitepermission_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY core_sitepermission_sites
    ADD CONSTRAINT core_sitepermission_sites_pkey PRIMARY KEY (id);


--
-- Name: core_sitepermission_sites_sitepermission_id_e3e7353a_uniq; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY core_sitepermission_sites
    ADD CONSTRAINT core_sitepermission_sites_sitepermission_id_e3e7353a_uniq UNIQUE (sitepermission_id, site_id);


--
-- Name: core_sitepermission_user_id_key; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY core_sitepermission
    ADD CONSTRAINT core_sitepermission_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_user_id_537f77a7_uniq; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_537f77a7_uniq UNIQUE (user_id, comment_id, flag);


--
-- Name: django_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_pkey PRIMARY KEY (id);


--
-- Name: django_redirect_site_id_ac5dd16b_uniq; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_site_id_ac5dd16b_uniq UNIQUE (site_id, old_path);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: fgs_blog_article_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY fgs_blog_article
    ADD CONSTRAINT fgs_blog_article_pkey PRIMARY KEY (id);


--
-- Name: fgs_blog_article_tags_article_id_4f626ef0_uniq; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY fgs_blog_article_tags
    ADD CONSTRAINT fgs_blog_article_tags_article_id_4f626ef0_uniq UNIQUE (article_id, tag_id);


--
-- Name: fgs_blog_article_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY fgs_blog_article_tags
    ADD CONSTRAINT fgs_blog_article_tags_pkey PRIMARY KEY (id);


--
-- Name: fgs_blog_author_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY fgs_blog_author
    ADD CONSTRAINT fgs_blog_author_pkey PRIMARY KEY (id);


--
-- Name: fgs_blog_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY fgs_blog_tag
    ADD CONSTRAINT fgs_blog_tag_pkey PRIMARY KEY (id);


--
-- Name: forms_field_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY forms_field
    ADD CONSTRAINT forms_field_pkey PRIMARY KEY (id);


--
-- Name: forms_fieldentry_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY forms_fieldentry
    ADD CONSTRAINT forms_fieldentry_pkey PRIMARY KEY (id);


--
-- Name: forms_form_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY forms_form
    ADD CONSTRAINT forms_form_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: forms_formentry_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY forms_formentry
    ADD CONSTRAINT forms_formentry_pkey PRIMARY KEY (id);


--
-- Name: galleries_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY galleries_gallery
    ADD CONSTRAINT galleries_gallery_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: galleries_galleryimage_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY galleries_galleryimage
    ADD CONSTRAINT galleries_galleryimage_pkey PRIMARY KEY (id);


--
-- Name: generic_assignedkeyword_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_assignedkeyword
    ADD CONSTRAINT generic_assignedkeyword_pkey PRIMARY KEY (id);


--
-- Name: generic_keyword_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_keyword
    ADD CONSTRAINT generic_keyword_pkey PRIMARY KEY (id);


--
-- Name: generic_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_rating
    ADD CONSTRAINT generic_rating_pkey PRIMARY KEY (id);


--
-- Name: generic_threadedcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_threadedcomment
    ADD CONSTRAINT generic_threadedcomment_pkey PRIMARY KEY (comment_ptr_id);


--
-- Name: pages_link_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY pages_link
    ADD CONSTRAINT pages_link_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_page_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY pages_page
    ADD CONSTRAINT pages_page_pkey PRIMARY KEY (id);


--
-- Name: pages_richtextpage_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY pages_richtextpage
    ADD CONSTRAINT pages_richtextpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: twitter_query_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY twitter_query
    ADD CONSTRAINT twitter_query_pkey PRIMARY KEY (id);


--
-- Name: twitter_tweet_pkey; Type: CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY twitter_tweet
    ADD CONSTRAINT twitter_tweet_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_blogcategory_9365d6e7; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX blog_blogcategory_9365d6e7 ON blog_blogcategory USING btree (site_id);


--
-- Name: blog_blogpost_9365d6e7; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX blog_blogpost_9365d6e7 ON blog_blogpost USING btree (site_id);


--
-- Name: blog_blogpost_categories_53a0aca2; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX blog_blogpost_categories_53a0aca2 ON blog_blogpost_categories USING btree (blogpost_id);


--
-- Name: blog_blogpost_categories_efb54956; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX blog_blogpost_categories_efb54956 ON blog_blogpost_categories USING btree (blogcategory_id);


--
-- Name: blog_blogpost_e8701ad4; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX blog_blogpost_e8701ad4 ON blog_blogpost USING btree (user_id);


--
-- Name: blog_blogpost_publish_date_703abc16_uniq; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX blog_blogpost_publish_date_703abc16_uniq ON blog_blogpost USING btree (publish_date);


--
-- Name: blog_blogpost_related_posts_191c4981; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX blog_blogpost_related_posts_191c4981 ON blog_blogpost_related_posts USING btree (from_blogpost_id);


--
-- Name: blog_blogpost_related_posts_71f16e58; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX blog_blogpost_related_posts_71f16e58 ON blog_blogpost_related_posts USING btree (to_blogpost_id);


--
-- Name: conf_setting_9365d6e7; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX conf_setting_9365d6e7 ON conf_setting USING btree (site_id);


--
-- Name: core_sitepermission_sites_9365d6e7; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX core_sitepermission_sites_9365d6e7 ON core_sitepermission_sites USING btree (site_id);


--
-- Name: core_sitepermission_sites_f6687ce4; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX core_sitepermission_sites_f6687ce4 ON core_sitepermission_sites USING btree (sitepermission_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_comment_flags_327a6c43; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_comment_flags_327a6c43 ON django_comment_flags USING btree (flag);


--
-- Name: django_comment_flags_69b97d17; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_comment_flags_69b97d17 ON django_comment_flags USING btree (comment_id);


--
-- Name: django_comment_flags_e8701ad4; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_comment_flags_e8701ad4 ON django_comment_flags USING btree (user_id);


--
-- Name: django_comment_flags_flag_8b141fcb_like; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_comment_flags_flag_8b141fcb_like ON django_comment_flags USING btree (flag varchar_pattern_ops);


--
-- Name: django_comments_417f1b1c; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_comments_417f1b1c ON django_comments USING btree (content_type_id);


--
-- Name: django_comments_9365d6e7; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_comments_9365d6e7 ON django_comments USING btree (site_id);


--
-- Name: django_comments_e8701ad4; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_comments_e8701ad4 ON django_comments USING btree (user_id);


--
-- Name: django_comments_submit_date_514ed2d9_uniq; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_comments_submit_date_514ed2d9_uniq ON django_comments USING btree (submit_date);


--
-- Name: django_redirect_91a0b591; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_redirect_91a0b591 ON django_redirect USING btree (old_path);


--
-- Name: django_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_redirect_9365d6e7 ON django_redirect USING btree (site_id);


--
-- Name: django_redirect_old_path_c6cc94d3_like; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_redirect_old_path_c6cc94d3_like ON django_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: fgs_blog_article_c0328fa5; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX fgs_blog_article_c0328fa5 ON fgs_blog_article USING btree (authors_id);


--
-- Name: fgs_blog_article_tags_76f094bc; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX fgs_blog_article_tags_76f094bc ON fgs_blog_article_tags USING btree (tag_id);


--
-- Name: fgs_blog_article_tags_a00c1b00; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX fgs_blog_article_tags_a00c1b00 ON fgs_blog_article_tags USING btree (article_id);


--
-- Name: forms_field_d6cba1ad; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX forms_field_d6cba1ad ON forms_field USING btree (form_id);


--
-- Name: forms_fieldentry_b64a62ea; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX forms_fieldentry_b64a62ea ON forms_fieldentry USING btree (entry_id);


--
-- Name: forms_formentry_d6cba1ad; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX forms_formentry_d6cba1ad ON forms_formentry USING btree (form_id);


--
-- Name: galleries_galleryimage_6d994cdb; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX galleries_galleryimage_6d994cdb ON galleries_galleryimage USING btree (gallery_id);


--
-- Name: generic_assignedkeyword_417f1b1c; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX generic_assignedkeyword_417f1b1c ON generic_assignedkeyword USING btree (content_type_id);


--
-- Name: generic_assignedkeyword_5c003bba; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX generic_assignedkeyword_5c003bba ON generic_assignedkeyword USING btree (keyword_id);


--
-- Name: generic_keyword_9365d6e7; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX generic_keyword_9365d6e7 ON generic_keyword USING btree (site_id);


--
-- Name: generic_rating_417f1b1c; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX generic_rating_417f1b1c ON generic_rating USING btree (content_type_id);


--
-- Name: generic_rating_e8701ad4; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX generic_rating_e8701ad4 ON generic_rating USING btree (user_id);


--
-- Name: generic_threadedcomment_21ce1e68; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX generic_threadedcomment_21ce1e68 ON generic_threadedcomment USING btree (replied_to_id);


--
-- Name: pages_page_6be37982; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX pages_page_6be37982 ON pages_page USING btree (parent_id);


--
-- Name: pages_page_9365d6e7; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX pages_page_9365d6e7 ON pages_page USING btree (site_id);


--
-- Name: pages_page_publish_date_eb7c8d46_uniq; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX pages_page_publish_date_eb7c8d46_uniq ON pages_page USING btree (publish_date);


--
-- Name: twitter_tweet_0bbeda9c; Type: INDEX; Schema: public; Owner: fgs
--

CREATE INDEX twitter_tweet_0bbeda9c ON twitter_tweet USING btree (query_id);


--
-- Name: ad11d0c1662f6ed6839bc6d43c9ce4f3; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_threadedcomment
    ADD CONSTRAINT ad11d0c1662f6ed6839bc6d43c9ce4f3 FOREIGN KEY (replied_to_id) REFERENCES generic_threadedcomment(comment_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogcategory_site_id_42b9c96d_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogcategory
    ADD CONSTRAINT blog_blogcategory_site_id_42b9c96d_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost__blogcategory_id_f6695246_fk_blog_blogcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost__blogcategory_id_f6695246_fk_blog_blogcategory_id FOREIGN KEY (blogcategory_id) REFERENCES blog_blogcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_categori_blogpost_id_daeea608_fk_blog_blogpost_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost_categori_blogpost_id_daeea608_fk_blog_blogpost_id FOREIGN KEY (blogpost_id) REFERENCES blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_rel_from_blogpost_id_27ea4c18_fk_blog_blogpost_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_rel_from_blogpost_id_27ea4c18_fk_blog_blogpost_id FOREIGN KEY (from_blogpost_id) REFERENCES blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_relat_to_blogpost_id_35f7acdd_fk_blog_blogpost_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_relat_to_blogpost_id_35f7acdd_fk_blog_blogpost_id FOREIGN KEY (to_blogpost_id) REFERENCES blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_site_id_7995688f_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_site_id_7995688f_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_user_id_12ed6b16_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_user_id_12ed6b16_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: conf_setting_site_id_b235f7ed_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY conf_setting
    ADD CONSTRAINT conf_setting_site_id_b235f7ed_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sitep_sitepermission_id_d33bc79e_fk_core_sitepermission_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY core_sitepermission_sites
    ADD CONSTRAINT core_sitep_sitepermission_id_d33bc79e_fk_core_sitepermission_id FOREIGN KEY (sitepermission_id) REFERENCES core_sitepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sitepermission_sites_site_id_38038b76_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY core_sitepermission_sites
    ADD CONSTRAINT core_sitepermission_sites_site_id_38038b76_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sitepermission_user_id_0a3cbb11_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY core_sitepermission
    ADD CONSTRAINT core_sitepermission_user_id_0a3cbb11_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comme_content_type_id_c4afe962_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comme_content_type_id_c4afe962_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_comment_id_d8054933_fk_django_comments_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_comment_id_d8054933_fk_django_comments_id FOREIGN KEY (comment_id) REFERENCES django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_user_id_f3f81f0a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_f3f81f0a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_site_id_9dcf666e_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_site_id_9dcf666e_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_user_id_a0a440a1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_user_id_a0a440a1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_redirect_site_id_c3e37341_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_site_id_c3e37341_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fgs_blog_article_authors_id_0e2287af_fk_fgs_blog_author_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY fgs_blog_article
    ADD CONSTRAINT fgs_blog_article_authors_id_0e2287af_fk_fgs_blog_author_id FOREIGN KEY (authors_id) REFERENCES fgs_blog_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fgs_blog_article_tag_article_id_a11363f8_fk_fgs_blog_article_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY fgs_blog_article_tags
    ADD CONSTRAINT fgs_blog_article_tag_article_id_a11363f8_fk_fgs_blog_article_id FOREIGN KEY (article_id) REFERENCES fgs_blog_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fgs_blog_article_tags_tag_id_570f9463_fk_fgs_blog_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY fgs_blog_article_tags
    ADD CONSTRAINT fgs_blog_article_tags_tag_id_570f9463_fk_fgs_blog_tag_id FOREIGN KEY (tag_id) REFERENCES fgs_blog_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_field_form_id_9ca5dc7e_fk_forms_form_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY forms_field
    ADD CONSTRAINT forms_field_form_id_9ca5dc7e_fk_forms_form_page_ptr_id FOREIGN KEY (form_id) REFERENCES forms_form(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_fieldentry_entry_id_c4fdc570_fk_forms_formentry_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY forms_fieldentry
    ADD CONSTRAINT forms_fieldentry_entry_id_c4fdc570_fk_forms_formentry_id FOREIGN KEY (entry_id) REFERENCES forms_formentry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_form_page_ptr_id_d3bcbf3a_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY forms_form
    ADD CONSTRAINT forms_form_page_ptr_id_d3bcbf3a_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_formentry_form_id_d0f23912_fk_forms_form_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY forms_formentry
    ADD CONSTRAINT forms_formentry_form_id_d0f23912_fk_forms_form_page_ptr_id FOREIGN KEY (form_id) REFERENCES forms_form(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: galleries__gallery_id_af12d3f5_fk_galleries_gallery_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY galleries_galleryimage
    ADD CONSTRAINT galleries__gallery_id_af12d3f5_fk_galleries_gallery_page_ptr_id FOREIGN KEY (gallery_id) REFERENCES galleries_gallery(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: galleries_gallery_page_ptr_id_8562ba87_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY galleries_gallery
    ADD CONSTRAINT galleries_gallery_page_ptr_id_8562ba87_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_assi_content_type_id_3dd89a7f_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_assignedkeyword
    ADD CONSTRAINT generic_assi_content_type_id_3dd89a7f_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_assignedkeywo_keyword_id_44c17f9d_fk_generic_keyword_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_assignedkeyword
    ADD CONSTRAINT generic_assignedkeywo_keyword_id_44c17f9d_fk_generic_keyword_id FOREIGN KEY (keyword_id) REFERENCES generic_keyword(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_keyword_site_id_c5be0acc_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_keyword
    ADD CONSTRAINT generic_keyword_site_id_c5be0acc_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_rati_content_type_id_eaf475fa_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_rating
    ADD CONSTRAINT generic_rati_content_type_id_eaf475fa_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_rating_user_id_60020469_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_rating
    ADD CONSTRAINT generic_rating_user_id_60020469_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_threadedc_comment_ptr_id_e208ed60_fk_django_comments_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY generic_threadedcomment
    ADD CONSTRAINT generic_threadedc_comment_ptr_id_e208ed60_fk_django_comments_id FOREIGN KEY (comment_ptr_id) REFERENCES django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_link_page_ptr_id_37d469f7_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY pages_link
    ADD CONSTRAINT pages_link_page_ptr_id_37d469f7_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_page_parent_id_133fa4d3_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY pages_page
    ADD CONSTRAINT pages_page_parent_id_133fa4d3_fk_pages_page_id FOREIGN KEY (parent_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_page_site_id_47a43e5b_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY pages_page
    ADD CONSTRAINT pages_page_site_id_47a43e5b_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_richtextpage_page_ptr_id_8ca99b83_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY pages_richtextpage
    ADD CONSTRAINT pages_richtextpage_page_ptr_id_8ca99b83_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: twitter_tweet_query_id_bd42b699_fk_twitter_query_id; Type: FK CONSTRAINT; Schema: public; Owner: fgs
--

ALTER TABLE ONLY twitter_tweet
    ADD CONSTRAINT twitter_tweet_query_id_bd42b699_fk_twitter_query_id FOREIGN KEY (query_id) REFERENCES twitter_query(id) DEFERRABLE INITIALLY DEFERRED;


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


PGDMP  &    3            	    |         
   aircrft_db    17.0    17.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16588 
   aircrft_db    DATABASE     �   CREATE DATABASE aircrft_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE aircrft_db;
                     hmd    false            �            1259    16907    aircraft_app_aviyonik    TABLE       CREATE TABLE public.aircraft_app_aviyonik (
    id bigint NOT NULL,
    ucak_adi character varying(50) NOT NULL,
    aviyonik_seri_numarasi character varying(100) NOT NULL,
    uretim_tarihi timestamp with time zone NOT NULL,
    status character varying(20) NOT NULL
);
 )   DROP TABLE public.aircraft_app_aviyonik;
       public         heap r       hmd    false            �            1259    16906    aircraft_app_aviyonik_id_seq    SEQUENCE     �   CREATE SEQUENCE public.aircraft_app_aviyonik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.aircraft_app_aviyonik_id_seq;
       public               hmd    false    239            �           0    0    aircraft_app_aviyonik_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.aircraft_app_aviyonik_id_seq OWNED BY public.aircraft_app_aviyonik.id;
          public               hmd    false    238            �            1259    16813    aircraft_app_customuser    TABLE     �  CREATE TABLE public.aircraft_app_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean,
    username character varying(150) NOT NULL,
    first_name character varying(150),
    last_name character varying(150),
    email character varying(254),
    is_staff boolean,
    is_active boolean,
    date_joined timestamp with time zone,
    role character varying(10) NOT NULL
);
 +   DROP TABLE public.aircraft_app_customuser;
       public         heap r       hmd    false            �            1259    16824    aircraft_app_customuser_groups    TABLE     �   CREATE TABLE public.aircraft_app_customuser_groups (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);
 2   DROP TABLE public.aircraft_app_customuser_groups;
       public         heap r       hmd    false            �            1259    16823 %   aircraft_app_customuser_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.aircraft_app_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.aircraft_app_customuser_groups_id_seq;
       public               hmd    false    230            �           0    0 %   aircraft_app_customuser_groups_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.aircraft_app_customuser_groups_id_seq OWNED BY public.aircraft_app_customuser_groups.id;
          public               hmd    false    229            �            1259    16812    aircraft_app_customuser_id_seq    SEQUENCE     �   CREATE SEQUENCE public.aircraft_app_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.aircraft_app_customuser_id_seq;
       public               hmd    false    228            �           0    0    aircraft_app_customuser_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.aircraft_app_customuser_id_seq OWNED BY public.aircraft_app_customuser.id;
          public               hmd    false    227            �            1259    16831 (   aircraft_app_customuser_user_permissions    TABLE     �   CREATE TABLE public.aircraft_app_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);
 <   DROP TABLE public.aircraft_app_customuser_user_permissions;
       public         heap r       hmd    false            �            1259    16830 /   aircraft_app_customuser_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.aircraft_app_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.aircraft_app_customuser_user_permissions_id_seq;
       public               hmd    false    232            �           0    0 /   aircraft_app_customuser_user_permissions_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.aircraft_app_customuser_user_permissions_id_seq OWNED BY public.aircraft_app_customuser_user_permissions.id;
          public               hmd    false    231            �            1259    16914    aircraft_app_govde    TABLE     	  CREATE TABLE public.aircraft_app_govde (
    id bigint NOT NULL,
    ucak_adi character varying(50) NOT NULL,
    govde_seri_numarasi character varying(100) NOT NULL,
    uretim_tarihi timestamp with time zone NOT NULL,
    status character varying(20) NOT NULL
);
 &   DROP TABLE public.aircraft_app_govde;
       public         heap r       hmd    false            �            1259    16913    aircraft_app_govde_id_seq    SEQUENCE     �   CREATE SEQUENCE public.aircraft_app_govde_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.aircraft_app_govde_id_seq;
       public               hmd    false    241            �           0    0    aircraft_app_govde_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.aircraft_app_govde_id_seq OWNED BY public.aircraft_app_govde.id;
          public               hmd    false    240            �            1259    16899    aircraft_app_kanat    TABLE     	  CREATE TABLE public.aircraft_app_kanat (
    id bigint NOT NULL,
    ucak_adi character varying(50) NOT NULL,
    kanat_seri_numarasi character varying(100) NOT NULL,
    uretim_tarihi timestamp with time zone NOT NULL,
    status character varying(20) NOT NULL
);
 &   DROP TABLE public.aircraft_app_kanat;
       public         heap r       hmd    false            �            1259    16898    aircraft_app_kanat_id_seq    SEQUENCE     �   CREATE SEQUENCE public.aircraft_app_kanat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.aircraft_app_kanat_id_seq;
       public               hmd    false    237            �           0    0    aircraft_app_kanat_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.aircraft_app_kanat_id_seq OWNED BY public.aircraft_app_kanat.id;
          public               hmd    false    236            �            1259    16921    aircraft_app_kuyruk    TABLE       CREATE TABLE public.aircraft_app_kuyruk (
    id bigint NOT NULL,
    ucak_adi character varying(50) NOT NULL,
    kuyruk_seri_numarasi character varying(100) NOT NULL,
    uretim_tarihi timestamp with time zone NOT NULL,
    status character varying(20) NOT NULL
);
 '   DROP TABLE public.aircraft_app_kuyruk;
       public         heap r       hmd    false            �            1259    16920    aircraft_app_kuyruk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.aircraft_app_kuyruk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.aircraft_app_kuyruk_id_seq;
       public               hmd    false    243            �           0    0    aircraft_app_kuyruk_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.aircraft_app_kuyruk_id_seq OWNED BY public.aircraft_app_kuyruk.id;
          public               hmd    false    242            �            1259    16932    aircraft_app_ucak    TABLE     �  CREATE TABLE public.aircraft_app_ucak (
    id bigint NOT NULL,
    ucak_adi character varying(100) NOT NULL,
    seri_numarasi character varying(100) NOT NULL,
    uretim_tarihi timestamp with time zone NOT NULL,
    aviyonik_serial character varying(100) NOT NULL,
    govde_serial character varying(100) NOT NULL,
    kanat_serial character varying(100) NOT NULL,
    kuyruk_serial character varying(100) NOT NULL
);
 %   DROP TABLE public.aircraft_app_ucak;
       public         heap r       hmd    false            �            1259    16931    aircraft_app_ucak_id_seq    SEQUENCE     �   CREATE SEQUENCE public.aircraft_app_ucak_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.aircraft_app_ucak_id_seq;
       public               hmd    false    245            �           0    0    aircraft_app_ucak_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.aircraft_app_ucak_id_seq OWNED BY public.aircraft_app_ucak.id;
          public               hmd    false    244            �            1259    16771 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap r       hmd    false            �            1259    16770    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public               hmd    false    224            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public               hmd    false    223            �            1259    16780    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap r       hmd    false            �            1259    16779    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public               hmd    false    226            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public               hmd    false    225            �            1259    16764    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap r       hmd    false            �            1259    16763    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public               hmd    false    222            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public               hmd    false    221            �            1259    16867    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap r       hmd    false            �            1259    16866    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public               hmd    false    234            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public               hmd    false    233            �            1259    16755    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap r       hmd    false            �            1259    16754    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public               hmd    false    220            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public               hmd    false    219            �            1259    16746    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap r       hmd    false            �            1259    16745    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public               hmd    false    218            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public               hmd    false    217            �            1259    16888    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap r       hmd    false            �           2604    16910    aircraft_app_aviyonik id    DEFAULT     �   ALTER TABLE ONLY public.aircraft_app_aviyonik ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_aviyonik_id_seq'::regclass);
 G   ALTER TABLE public.aircraft_app_aviyonik ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    238    239    239            �           2604    16816    aircraft_app_customuser id    DEFAULT     �   ALTER TABLE ONLY public.aircraft_app_customuser ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_customuser_id_seq'::regclass);
 I   ALTER TABLE public.aircraft_app_customuser ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    228    227    228            �           2604    16827 !   aircraft_app_customuser_groups id    DEFAULT     �   ALTER TABLE ONLY public.aircraft_app_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_customuser_groups_id_seq'::regclass);
 P   ALTER TABLE public.aircraft_app_customuser_groups ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    230    229    230            �           2604    16834 +   aircraft_app_customuser_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_customuser_user_permissions_id_seq'::regclass);
 Z   ALTER TABLE public.aircraft_app_customuser_user_permissions ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    232    231    232            �           2604    16917    aircraft_app_govde id    DEFAULT     ~   ALTER TABLE ONLY public.aircraft_app_govde ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_govde_id_seq'::regclass);
 D   ALTER TABLE public.aircraft_app_govde ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    240    241    241            �           2604    16902    aircraft_app_kanat id    DEFAULT     ~   ALTER TABLE ONLY public.aircraft_app_kanat ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_kanat_id_seq'::regclass);
 D   ALTER TABLE public.aircraft_app_kanat ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    237    236    237            �           2604    16924    aircraft_app_kuyruk id    DEFAULT     �   ALTER TABLE ONLY public.aircraft_app_kuyruk ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_kuyruk_id_seq'::regclass);
 E   ALTER TABLE public.aircraft_app_kuyruk ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    243    242    243            �           2604    16935    aircraft_app_ucak id    DEFAULT     |   ALTER TABLE ONLY public.aircraft_app_ucak ALTER COLUMN id SET DEFAULT nextval('public.aircraft_app_ucak_id_seq'::regclass);
 C   ALTER TABLE public.aircraft_app_ucak ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    244    245    245            �           2604    16774    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    224    223    224            �           2604    16783    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    226    225    226            �           2604    16767    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    221    222    222            �           2604    16870    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    234    233    234            �           2604    16758    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    219    220    220            �           2604    16749    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public               hmd    false    218    217    218            �          0    16907    aircraft_app_aviyonik 
   TABLE DATA           l   COPY public.aircraft_app_aviyonik (id, ucak_adi, aviyonik_seri_numarasi, uretim_tarihi, status) FROM stdin;
    public               hmd    false    239   �       �          0    16813    aircraft_app_customuser 
   TABLE DATA           �   COPY public.aircraft_app_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, role) FROM stdin;
    public               hmd    false    228   \�       �          0    16824    aircraft_app_customuser_groups 
   TABLE DATA           U   COPY public.aircraft_app_customuser_groups (id, customuser_id, group_id) FROM stdin;
    public               hmd    false    230   ��       �          0    16831 (   aircraft_app_customuser_user_permissions 
   TABLE DATA           d   COPY public.aircraft_app_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
    public               hmd    false    232   ��       �          0    16914    aircraft_app_govde 
   TABLE DATA           f   COPY public.aircraft_app_govde (id, ucak_adi, govde_seri_numarasi, uretim_tarihi, status) FROM stdin;
    public               hmd    false    241   ��       �          0    16899    aircraft_app_kanat 
   TABLE DATA           f   COPY public.aircraft_app_kanat (id, ucak_adi, kanat_seri_numarasi, uretim_tarihi, status) FROM stdin;
    public               hmd    false    237   ��       �          0    16921    aircraft_app_kuyruk 
   TABLE DATA           h   COPY public.aircraft_app_kuyruk (id, ucak_adi, kuyruk_seri_numarasi, uretim_tarihi, status) FROM stdin;
    public               hmd    false    243   ��       �          0    16932    aircraft_app_ucak 
   TABLE DATA           �   COPY public.aircraft_app_ucak (id, ucak_adi, seri_numarasi, uretim_tarihi, aviyonik_serial, govde_serial, kanat_serial, kuyruk_serial) FROM stdin;
    public               hmd    false    245   ]�       �          0    16771 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public               hmd    false    224   6�       �          0    16780    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public               hmd    false    226   S�       �          0    16764    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public               hmd    false    222   p�       �          0    16867    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public               hmd    false    234   4�       �          0    16755    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public               hmd    false    220   Q�                 0    16746    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public               hmd    false    218   ��       �          0    16888    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public               hmd    false    235   x�       �           0    0    aircraft_app_aviyonik_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.aircraft_app_aviyonik_id_seq', 60, true);
          public               hmd    false    238            �           0    0 %   aircraft_app_customuser_groups_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.aircraft_app_customuser_groups_id_seq', 1, false);
          public               hmd    false    229            �           0    0    aircraft_app_customuser_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.aircraft_app_customuser_id_seq', 6, true);
          public               hmd    false    227            �           0    0 /   aircraft_app_customuser_user_permissions_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.aircraft_app_customuser_user_permissions_id_seq', 1, false);
          public               hmd    false    231            �           0    0    aircraft_app_govde_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.aircraft_app_govde_id_seq', 83, true);
          public               hmd    false    240            �           0    0    aircraft_app_kanat_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.aircraft_app_kanat_id_seq', 184, true);
          public               hmd    false    236            �           0    0    aircraft_app_kuyruk_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.aircraft_app_kuyruk_id_seq', 119, true);
          public               hmd    false    242            �           0    0    aircraft_app_ucak_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.aircraft_app_ucak_id_seq', 28, true);
          public               hmd    false    244            �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public               hmd    false    223            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public               hmd    false    225            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);
          public               hmd    false    221            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public               hmd    false    233            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);
          public               hmd    false    219            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);
          public               hmd    false    217            �           2606    16912 0   aircraft_app_aviyonik aircraft_app_aviyonik_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.aircraft_app_aviyonik
    ADD CONSTRAINT aircraft_app_aviyonik_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.aircraft_app_aviyonik DROP CONSTRAINT aircraft_app_aviyonik_pkey;
       public                 hmd    false    239            �           2606    16839 \   aircraft_app_customuser_groups aircraft_app_customuser__customuser_id_group_id_d4d5a26f_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.aircraft_app_customuser_groups
    ADD CONSTRAINT aircraft_app_customuser__customuser_id_group_id_d4d5a26f_uniq UNIQUE (customuser_id, group_id);
 �   ALTER TABLE ONLY public.aircraft_app_customuser_groups DROP CONSTRAINT aircraft_app_customuser__customuser_id_group_id_d4d5a26f_uniq;
       public                 hmd    false    230    230            �           2606    16853 h   aircraft_app_customuser_user_permissions aircraft_app_customuser__customuser_id_permission_bdf42642_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions
    ADD CONSTRAINT aircraft_app_customuser__customuser_id_permission_bdf42642_uniq UNIQUE (customuser_id, permission_id);
 �   ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions DROP CONSTRAINT aircraft_app_customuser__customuser_id_permission_bdf42642_uniq;
       public                 hmd    false    232    232            �           2606    16829 B   aircraft_app_customuser_groups aircraft_app_customuser_groups_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.aircraft_app_customuser_groups
    ADD CONSTRAINT aircraft_app_customuser_groups_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.aircraft_app_customuser_groups DROP CONSTRAINT aircraft_app_customuser_groups_pkey;
       public                 hmd    false    230            �           2606    16820 4   aircraft_app_customuser aircraft_app_customuser_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.aircraft_app_customuser
    ADD CONSTRAINT aircraft_app_customuser_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.aircraft_app_customuser DROP CONSTRAINT aircraft_app_customuser_pkey;
       public                 hmd    false    228            �           2606    16836 V   aircraft_app_customuser_user_permissions aircraft_app_customuser_user_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions
    ADD CONSTRAINT aircraft_app_customuser_user_permissions_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions DROP CONSTRAINT aircraft_app_customuser_user_permissions_pkey;
       public                 hmd    false    232            �           2606    16822 <   aircraft_app_customuser aircraft_app_customuser_username_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.aircraft_app_customuser
    ADD CONSTRAINT aircraft_app_customuser_username_key UNIQUE (username);
 f   ALTER TABLE ONLY public.aircraft_app_customuser DROP CONSTRAINT aircraft_app_customuser_username_key;
       public                 hmd    false    228            �           2606    16919 *   aircraft_app_govde aircraft_app_govde_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.aircraft_app_govde
    ADD CONSTRAINT aircraft_app_govde_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.aircraft_app_govde DROP CONSTRAINT aircraft_app_govde_pkey;
       public                 hmd    false    241            �           2606    16904 *   aircraft_app_kanat aircraft_app_kanat_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.aircraft_app_kanat
    ADD CONSTRAINT aircraft_app_kanat_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.aircraft_app_kanat DROP CONSTRAINT aircraft_app_kanat_pkey;
       public                 hmd    false    237            �           2606    16926 ,   aircraft_app_kuyruk aircraft_app_kuyruk_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.aircraft_app_kuyruk
    ADD CONSTRAINT aircraft_app_kuyruk_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.aircraft_app_kuyruk DROP CONSTRAINT aircraft_app_kuyruk_pkey;
       public                 hmd    false    243            �           2606    16937 (   aircraft_app_ucak aircraft_app_ucak_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.aircraft_app_ucak
    ADD CONSTRAINT aircraft_app_ucak_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.aircraft_app_ucak DROP CONSTRAINT aircraft_app_ucak_pkey;
       public                 hmd    false    245            �           2606    16810    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public                 hmd    false    224            �           2606    16796 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public                 hmd    false    226    226            �           2606    16785 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public                 hmd    false    226            �           2606    16776    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public                 hmd    false    224            �           2606    16787 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public                 hmd    false    222    222            �           2606    16769 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public                 hmd    false    222            �           2606    16875 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public                 hmd    false    234            �           2606    16762 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public                 hmd    false    220    220            �           2606    16760 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public                 hmd    false    220            �           2606    16753 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public                 hmd    false    218            �           2606    16894 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public                 hmd    false    235            �           1259    16850 5   aircraft_app_customuser_groups_customuser_id_44119884    INDEX     �   CREATE INDEX aircraft_app_customuser_groups_customuser_id_44119884 ON public.aircraft_app_customuser_groups USING btree (customuser_id);
 I   DROP INDEX public.aircraft_app_customuser_groups_customuser_id_44119884;
       public                 hmd    false    230            �           1259    16851 0   aircraft_app_customuser_groups_group_id_b3a41cbc    INDEX        CREATE INDEX aircraft_app_customuser_groups_group_id_b3a41cbc ON public.aircraft_app_customuser_groups USING btree (group_id);
 D   DROP INDEX public.aircraft_app_customuser_groups_group_id_b3a41cbc;
       public                 hmd    false    230            �           1259    16864 ?   aircraft_app_customuser_user_permissions_customuser_id_bb118ea3    INDEX     �   CREATE INDEX aircraft_app_customuser_user_permissions_customuser_id_bb118ea3 ON public.aircraft_app_customuser_user_permissions USING btree (customuser_id);
 S   DROP INDEX public.aircraft_app_customuser_user_permissions_customuser_id_bb118ea3;
       public                 hmd    false    232            �           1259    16865 ?   aircraft_app_customuser_user_permissions_permission_id_c4dcbfa5    INDEX     �   CREATE INDEX aircraft_app_customuser_user_permissions_permission_id_c4dcbfa5 ON public.aircraft_app_customuser_user_permissions USING btree (permission_id);
 S   DROP INDEX public.aircraft_app_customuser_user_permissions_permission_id_c4dcbfa5;
       public                 hmd    false    232            �           1259    16837 .   aircraft_app_customuser_username_b93f2915_like    INDEX     �   CREATE INDEX aircraft_app_customuser_username_b93f2915_like ON public.aircraft_app_customuser USING btree (username varchar_pattern_ops);
 B   DROP INDEX public.aircraft_app_customuser_username_b93f2915_like;
       public                 hmd    false    228            �           1259    16811    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public                 hmd    false    224            �           1259    16807 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public                 hmd    false    226            �           1259    16808 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public                 hmd    false    226            �           1259    16793 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public                 hmd    false    222            �           1259    16886 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public                 hmd    false    234            �           1259    16887 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public                 hmd    false    234            �           1259    16896 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public                 hmd    false    235            �           1259    16895 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public                 hmd    false    235            �           2606    16840 W   aircraft_app_customuser_groups aircraft_app_customu_customuser_id_44119884_fk_aircraft_    FK CONSTRAINT     �   ALTER TABLE ONLY public.aircraft_app_customuser_groups
    ADD CONSTRAINT aircraft_app_customu_customuser_id_44119884_fk_aircraft_ FOREIGN KEY (customuser_id) REFERENCES public.aircraft_app_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.aircraft_app_customuser_groups DROP CONSTRAINT aircraft_app_customu_customuser_id_44119884_fk_aircraft_;
       public               hmd    false    228    4802    230            �           2606    16854 a   aircraft_app_customuser_user_permissions aircraft_app_customu_customuser_id_bb118ea3_fk_aircraft_    FK CONSTRAINT     �   ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions
    ADD CONSTRAINT aircraft_app_customu_customuser_id_bb118ea3_fk_aircraft_ FOREIGN KEY (customuser_id) REFERENCES public.aircraft_app_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions DROP CONSTRAINT aircraft_app_customu_customuser_id_bb118ea3_fk_aircraft_;
       public               hmd    false    4802    232    228            �           2606    16845 R   aircraft_app_customuser_groups aircraft_app_customu_group_id_b3a41cbc_fk_auth_grou    FK CONSTRAINT     �   ALTER TABLE ONLY public.aircraft_app_customuser_groups
    ADD CONSTRAINT aircraft_app_customu_group_id_b3a41cbc_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.aircraft_app_customuser_groups DROP CONSTRAINT aircraft_app_customu_group_id_b3a41cbc_fk_auth_grou;
       public               hmd    false    224    4794    230            �           2606    16859 a   aircraft_app_customuser_user_permissions aircraft_app_customu_permission_id_c4dcbfa5_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions
    ADD CONSTRAINT aircraft_app_customu_permission_id_c4dcbfa5_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.aircraft_app_customuser_user_permissions DROP CONSTRAINT aircraft_app_customu_permission_id_c4dcbfa5_fk_auth_perm;
       public               hmd    false    232    4789    222            �           2606    16802 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public               hmd    false    4789    222    226            �           2606    16797 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public               hmd    false    224    4794    226            �           2606    16788 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public               hmd    false    4784    222    220            �           2606    16876 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public               hmd    false    234    220    4784            �           2606    16881 P   django_admin_log django_admin_log_user_id_c564eba6_fk_aircraft_app_customuser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_aircraft_app_customuser_id FOREIGN KEY (user_id) REFERENCES public.aircraft_app_customuser(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_aircraft_app_customuser_id;
       public               hmd    false    4802    228    234            �   Z  x����nS1���S�G���ޕ-[�HUUMêH��y0|)�ww)R�����v����������x�;���7�)��ZU��_�_�>�h++��.H6���:��Ћ�Q��������^���e��ޟO?Χ×����}�¡}�ڐ�pAP���B���g�Q/X��7�E*"��r�"�Y�R��ba�������������|:~:��|�G+_��Q���a,A��X�T��b캊�*�U���J �٠Yc1a��Wؚ����Zy`-rʺ;����@_zh��P��0HD�aP,���!H�Y�WS,j��a�,���M�P�wЉ'̦�&��!��L R���^�?v �o�Ų�! ���u�l��RǬ�w��UjM"J���3J�����ف��~�^��}UY�c�[?.0���-��Z���*�}�7f�d�+�5K���C�y�����hճ_���e9�ȶE������(
cO�|�,�ڹ\w��TB�u �bೀ/1����!�, 	��-��#�A�h��#�,�C`�yBeˡO�Q�,�z��y|�C	k�d�a�->x��O$�O5��b�X���OHR�q      �     x���MK�@����7�2�1�݀��B�A�Am���$51��&R�)���00/�I���G�ڦN��C��M�"�=���6���u�s��������yݦ
wq�đx��)��V���N=���j�a!p�u��ah9��I��O>3B�������c�L��Y��e;��M�S>����*k����$-�آ*���8� �J+~�6u�+Gg�J穘P+,��5Z��?�b�dZ��`���c����U��TM�]^a�Yn�^��h�{��	=0J�mY      �      x������ � �      �      x������ � �      �   �  x����nS1���St�j�}l�`Â-K�*�BM˪H�Vy�<>����,"���{.�g�������?�� aC@r�pKrCT�T������e��=��m�Fʄ�TLL�@�o>������i���^�q�R!'6s�Q�V�`��.8�����'W&�ʪZ��	�B!����93�В��"�=[�r�h���/���<oy�}(!K�BP�	��@�W�d �%��)R��'�b��Vh�f��@\p�U�	U��=�4K��A� �^[eOD�ܧX(0'�؝�@����+�u~P�EP ����g�	XRvG�CƉ�ȫ�� ��Q�q�m΋U� w`0N*y��09v\0Nm�k��L�����R0N��܌��]70.ڈ��d+Ì s�X�2�-�8a��@ƓqY
�-�q��O���!�p���������p�x[��3h6z[��:-I�XVG䨦��Ʃ��_�
'���bcT�a��dk�k�BN,��)چ��!�Պ�di䤞G��zum�Y��Y�i0�uك�y�9�Ƣ�X�{ay��*[U�N�6!�d��0&)���{A����*���n�ޠT��m;�c��<�LF�+@r6�nt�z��h�6�,�\Dpe��,q2m7�3\�;M��S"�nո�*h<�4q�[���x% ��m
u�#�z'^1���
����O��
@�V䗴�n� u�[n      �   R  x���;n�@�k��/�=��%�۔!	���*�Hn�;�`�q@�0bA� ����?D������z9~?>�������v$���w���bo�~ ޝ�8��h��īJ� �Ju���z9}�^���k`[hX'���&�g��ϟhz�I���Y
:ꜤD�*Y�QiNZP<=����F�`s�9�9���U_T��H*��$�4'��<uV!�C�]k1�W��|<N?���ȔB����R��<�	�.]�TgI�x
^�8QG�T��Gk�i5w��$\n�-���ulE��rxCH�rbL:R���Yt��o���ؿ�N�Yn�%Y(6�X�(���#��Biġ�8���:����lV%%���<�єL۔�9)V%�FjBfXkg/"�0%������}6J-�m9_K��Za��� %���=����dk\W�1>��@�S��S�Mkؒ���6�J-4�\���\�>��S�&9�vs	��dfѩhS}3��'@���xp'�*����Zl8x��CE*/~�]����8J���.���`�4���k4�M�N����[]o�?���ip�&�?�/e���MM�x      �   O  x��V�nA���px��.�]ҺM�0� ,�0���+��>,{1`�ȃ.�W���!yλϏ������������r|���-�-�B��ъ;�'������y��+$~AR�jg/�@��$~�� ��UP'������|:�<<=��z4�Եj����������������/�<�x��,Pͥ�j�ϕ��.ޱ�v�qpY��<�%��:�"��͒��+�Z���D���^N�Q�@#�3�"ܺz���#�۵LQ "�@Ŵ
�2X�a B�"E��%7d3[d_ܡVE"�5]1%o� �=Y�9����PE�!�ѱ)���8p�������H�X�=��m���:SQ%��G9�Q��N�i�Ƭn�Ѩ;bK9��.�w�Nc*`���+�Q
��F l�w^-�bkN1s۾ϻ�OG�	Z�a��9��h�St�m;7���e�[E��}��ľr�86J����^��r���I����6U[�[ժ�T�3�+P+�m��5$h��Z;/�	4�\z��L˘i&���|��"tl-#���O��
t�bS}�{��Y�"(���?9y�R�ݗ��Ub����~�e���      �   �  x�}�Kn1���)�/"�%�K7]d�M�A�f�M��V��Vy�8�=�x(�/�?5������ ��\"\�\��a�	��|��]Wo��/��7�0������N�������H��ׯ�^�V��_��o�'��9J���d
|p��t��������P#m�1+R���@5�s1����I3N��(Vb�S��,����z�m�����v"7�(P2�=�դ��d�BG�C�C�^kO-e�Df M�d�R-e$G���n�o�}�{|�{9�F9V)���w���GIH&���D� $7?<���pR(x.?��.�#N~  .�pn �k��=���2$�2�.�� H��Tz(39 4 A\-�W<�T��`l�QU� >Sqv+�݊�_��Q�[��۷b��&�\a�
c_�'�΅�9��)#�3���Lj&S���g��d`��b��u͌�f � ?)`]6��t���RD�DiEX���?%�+S J��B�(�s��X��S6���=�e*E�ZRM��3{��g��́h �$�R;��֫e�@�R�87�XK%Z�[qk�nMկ��ay.�L.�&�Ӌ���W�����ֆd�i��8�IAW4t�W��OkӯΉ���kZ%��D4����D��3A��XC2�1/\
�;\���m;��H99W��-�ckh鄦�	��B�6��      �      x������ � �      �      x������ � �      �   �  x�]�[��0E��U��Qy��=ۨ4B%b-T<:b��5����G�ȹ&u�e��U�<�:	�4,.u��g���g��ˮ��%s���cI���w��:�f�0<�ql��e�&�r��b��ϰT�EI�������/�� �}z�r܇�T;1 ��0@h����uvɴ��+H����B�|��2�Q�}�P4�ID?h�5�y�C�푄q��E�
��jG���Xv5��jG��h��Nq~�8�ϭ�3�`xl
3[ ���0���"Ж]9�3)��g&�܇�wF�DŜ�@[�]�����]H��>7WT4IW �TyWi	$���w�5��v��	:�y�"b���]DT��{ے�v^��u������&����2��_)R���0�@���˵����6�h�#6� �	W���Խ}y���1�      �      x������ � �      �   �   x�]�[
1E��ň��^	�:�ڦ��@w�(����shʱ���PT:n�L�P���Z������<}U���~��}��x��^�V�֔�� x�D�O#�%v.1�y�3/S@����.�й����">N�Q�           x���ˎ�0E���u�*��|�H�n�"�q����&�4�&�pO�n�*`���`�ν6�Юu��z��'�O��+T�J$��ŕ��Mw�zz��ݚ�>AI �Ptc�����H2)ج@m�`��o�0���_ԍ�ѵm�WQ@�	�g�P��1�~M�L��LaKJz�r�>O��삜|���t�\ll���@� �q�F��q�9�d�c��53�T���noB�m�{m��n�0��}���G��q�Ck^y��(�I0��ʡ�P%9��W�	u��ؿ���d����c-�����y�'�P�Rʜe�eW_ο�-�bdV��;o��6}��Fq�䥌��}��74B�R�F�4�2S���+��R\C$�N��A��rfv!��Wmz�ݹݳ�Iv���`'�_7"K.r⑬|C}4�	���b4	G�!���"ԣ��5:��/�����R*���@\a�9�s׺�>t���������>HY1Y1U!��!]��T�L��>��Xq,��l:�l��A&]L,� �����<�;d�:�R�;�z$уdC)��N(V����q���V��+R��\QԚ"�)���� χ46yGI�bA�hlt���X�"���<���v���ha      �     x��Qn�0  �o9��L��`Q��mU�"XH�b���o� `Q���ՈD5ST�fu�c� ��q2e�@k��P���tK;^�r��ĉ�1�S�X���$����U�iwKr��܀�]������Ǔ�QȽ�e�m�}�[�ޱ�خO�nl�9��X�.���^ׇZ����wn=�؎���T��%�{�͗�Dh���,|n��g�,���dG͈+�`(�ѩ�%�RL �H7X/p���b�����=�4���]�     
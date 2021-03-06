PGDMP                          w           Goals    11.1    11.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    16393    Goals    DATABASE     �   CREATE DATABASE "Goals" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "Goals";
             postgres    false            �            1259    24609    epics    TABLE     �   CREATE TABLE public.epics (
    id integer NOT NULL,
    epic character varying(80) NOT NULL,
    description character varying,
    category character varying,
    subcategory character varying
);
    DROP TABLE public.epics;
       public         postgres    false            �            1259    24607    epics_id_seq    SEQUENCE     �   CREATE SEQUENCE public.epics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.epics_id_seq;
       public       postgres    false    201                       0    0    epics_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.epics_id_seq OWNED BY public.epics.id;
            public       postgres    false    200            �            1259    16400    goalcandidates    TABLE     �   CREATE TABLE public.goalcandidates (
    goalcandidate character varying,
    description character varying,
    importance integer,
    goalid integer,
    epicid integer,
    taskid integer,
    id integer
);
 "   DROP TABLE public.goalcandidates;
       public         postgres    false            �            1259    16420    goals    TABLE     �  CREATE TABLE public.goals (
    id integer NOT NULL,
    epicid integer,
    goalcandidateid integer,
    goal character varying,
    description character varying,
    ranking integer,
    deliverabledate date,
    isspecific boolean,
    ismeasureable boolean,
    isachieveable boolean,
    isrelevant boolean,
    istimebound boolean,
    goaltype character varying,
    category text,
    subcategory text
);
    DROP TABLE public.goals;
       public         postgres    false            �            1259    16418    goals_id_seq    SEQUENCE     �   CREATE SEQUENCE public.goals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.goals_id_seq;
       public       postgres    false    199                       0    0    goals_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.goals_id_seq OWNED BY public.goals.id;
            public       postgres    false    198            �            1259    16412    tasks    TABLE     �   CREATE TABLE public.tasks (
    id integer,
    task character varying,
    description character varying,
    rank integer,
    deadline date,
    category character varying,
    subcategory character varying,
    goalsid integer
);
    DROP TABLE public.tasks;
       public         postgres    false            �
           2604    24612    epics id    DEFAULT     d   ALTER TABLE ONLY public.epics ALTER COLUMN id SET DEFAULT nextval('public.epics_id_seq'::regclass);
 7   ALTER TABLE public.epics ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200    201            �
           2604    16423    goals id    DEFAULT     d   ALTER TABLE ONLY public.goals ALTER COLUMN id SET DEFAULT nextval('public.goals_id_seq'::regclass);
 7   ALTER TABLE public.goals ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199                      0    24609    epics 
   TABLE DATA               M   COPY public.epics (id, epic, description, category, subcategory) FROM stdin;
    public       postgres    false    201   �                 0    16400    goalcandidates 
   TABLE DATA               l   COPY public.goalcandidates (goalcandidate, description, importance, goalid, epicid, taskid, id) FROM stdin;
    public       postgres    false    196   �                 0    16420    goals 
   TABLE DATA               �   COPY public.goals (id, epicid, goalcandidateid, goal, description, ranking, deliverabledate, isspecific, ismeasureable, isachieveable, isrelevant, istimebound, goaltype, category, subcategory) FROM stdin;
    public       postgres    false    199                     0    16412    tasks 
   TABLE DATA               f   COPY public.tasks (id, task, description, rank, deadline, category, subcategory, goalsid) FROM stdin;
    public       postgres    false    197   ;                  0    0    epics_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.epics_id_seq', 1, false);
            public       postgres    false    200                       0    0    goals_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.goals_id_seq', 26, true);
            public       postgres    false    198            �
           2606    24617    epics epics_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.epics
    ADD CONSTRAINT epics_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.epics DROP CONSTRAINT epics_pkey;
       public         postgres    false    201                  x������ � �            x������ � �         +  x��T�n�0<�_�@���@���ѱ��Eb����@.���(�BR.ܯ��z�*,�u�j5���%xos���A`}X�B����"�ZYPG�l��1�6σ�Y	��B� 5�!�m���QpR�GlXc ��Ds�l�;�r��
	K��V���(�e܋J�:_hT,�-�{�~��1Q�V4F(ɳl؊D��@d�6 �0�F��U�3�Q�Q&{�.�1��(��uܻ�>��^湫x���W	�R�+��
�q��_a�5âͰh1ҝ2���2MT���;N�+r{�����e�~E2�i�q}C����l�m�0(�@	�`�QG��$�ja
�<�����(b��BZ$?5�y�J�4O3Uu�/�L�ܛj�ɡ�d"��yP7Nel��|f70���o�x��ם��9j2�s#I��N{s�~KS�cr(�\�Q�A$m���?��h�����l3��RQ?p:�虆g��:#�1��Ŏd�Cf}i�bN���ԝr3!/�P�Dn`���&0?�����/�ݺ�p���z�tN�u            x������ � �     
PGDMP     7    :                w            gestvetpersist    11.2    11.2 !    #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            &           1262    24576    gestvetpersist    DATABASE     �   CREATE DATABASE gestvetpersist WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE gestvetpersist;
             postgres    false            �            1259    24579    animal    TABLE     �   CREATE TABLE public.animal (
    id bigint NOT NULL,
    idade integer,
    nome character varying(255),
    raca character varying(255),
    tipo character varying(255)
);
    DROP TABLE public.animal;
       public         postgres    false            �            1259    24577    animal_id_seq    SEQUENCE     v   CREATE SEQUENCE public.animal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.animal_id_seq;
       public       postgres    false    197            '           0    0    animal_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.animal_id_seq OWNED BY public.animal.id;
            public       postgres    false    196            �            1259    24590    roles    TABLE     V   CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(60)
);
    DROP TABLE public.roles;
       public         postgres    false            �            1259    24588    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       postgres    false    199            (           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
            public       postgres    false    198            �            1259    24596 
   user_roles    TABLE     ]   CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);
    DROP TABLE public.user_roles;
       public         postgres    false            �            1259    24603    users    TABLE     �   CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(50),
    name character varying(50),
    password character varying(100),
    username character varying(50)
);
    DROP TABLE public.users;
       public         postgres    false            �            1259    24601    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    202            )           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    201            �
           2604    24582 	   animal id    DEFAULT     f   ALTER TABLE ONLY public.animal ALTER COLUMN id SET DEFAULT nextval('public.animal_id_seq'::regclass);
 8   ALTER TABLE public.animal ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �
           2604    24593    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199            �
           2604    24606    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    202    202                      0    24579    animal 
   TABLE DATA               =   COPY public.animal (id, idade, nome, raca, tipo) FROM stdin;
    public       postgres    false    197   ("                 0    24590    roles 
   TABLE DATA               )   COPY public.roles (id, name) FROM stdin;
    public       postgres    false    199   l"                 0    24596 
   user_roles 
   TABLE DATA               6   COPY public.user_roles (user_id, role_id) FROM stdin;
    public       postgres    false    200   �"                  0    24603    users 
   TABLE DATA               D   COPY public.users (id, email, name, password, username) FROM stdin;
    public       postgres    false    202   �"       *           0    0    animal_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.animal_id_seq', 1, true);
            public       postgres    false    196            +           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 3, true);
            public       postgres    false    198            ,           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 3, true);
            public       postgres    false    201            �
           2606    24587    animal animal_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.animal
    ADD CONSTRAINT animal_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.animal DROP CONSTRAINT animal_pkey;
       public         postgres    false    197            �
           2606    24595    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         postgres    false    199            �
           2606    24614 !   users uk6dotkott2kjsp8vw4d0m25fb7 
   CONSTRAINT     ]   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7;
       public         postgres    false    202            �
           2606    24610 "   roles uk_nb4h0p6txrmfc0xbrd1kglp9t 
   CONSTRAINT     ]   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT uk_nb4h0p6txrmfc0xbrd1kglp9t UNIQUE (name);
 L   ALTER TABLE ONLY public.roles DROP CONSTRAINT uk_nb4h0p6txrmfc0xbrd1kglp9t;
       public         postgres    false    199            �
           2606    24612 !   users ukr43af9ap4edm43mmtq01oddj6 
   CONSTRAINT     `   ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT ukr43af9ap4edm43mmtq01oddj6;
       public         postgres    false    202            �
           2606    24600    user_roles user_roles_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public         postgres    false    200    200            �
           2606    24608    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    202            �
           2606    24615 &   user_roles fkh8ciramu9cc9q3qcqiv4ue8a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES public.roles(id);
 P   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6;
       public       postgres    false    200    2708    199            �
           2606    24620 &   user_roles fkhfh9dx7w3ubf1co1vdev94g3f    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f;
       public       postgres    false    200    2718    202               4   x�3�4�t���M�QHIUI-.I��,J��I,I�tNL��/*������ -[/         '   x�3���q�v�2��|��!,G_O?�=... ��	p            x�3�4�2�4�2�4����� E          �   x�U��r�0 ��5y
��E��*���r�@;�d J�B�$"y�/�ڎ������,�ў2*�D��"zAŻt5����H�LmÈ���|X#*�9�5�u��t��3C�t�i����B��3a~j�� ���=�
vc���z���A�+W�8G��ʏ��T(
Z�}Z�3#�����&�g,�[��k�  �����Z��3U�����'���;��JB7��#�g��"�D�`�agy�X��S�o��5x� _{2k�     
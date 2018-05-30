PGDMP     1    '    
            v            reksoft    9.5.12    10.3 c     	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                        2615    19828    demo    SCHEMA        CREATE SCHEMA demo;
    DROP SCHEMA demo;
             artiow    false            �            1259    19829 	   album_seq    SEQUENCE     p   CREATE SEQUENCE demo.album_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE demo.album_seq;
       demo       artiow    false    7            �            1259    19831    album    TABLE     ;  CREATE TABLE demo.album (
    id integer DEFAULT nextval('demo.album_seq'::regclass) NOT NULL,
    label_id integer NOT NULL,
    singer_id integer NOT NULL,
    name character varying(45) NOT NULL,
    picture_id integer,
    release timestamp without time zone NOT NULL,
    description character varying(255)
);
    DROP TABLE demo.album;
       demo         artiow    false    181    7            �            1259    19835    album_genres    TABLE     a   CREATE TABLE demo.album_genres (
    album_id integer NOT NULL,
    genre_id integer NOT NULL
);
    DROP TABLE demo.album_genres;
       demo         artiow    false    7            �            1259    19838    composition_seq    SEQUENCE     v   CREATE SEQUENCE demo.composition_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE demo.composition_seq;
       demo       artiow    false    7            �            1259    19840    composition    TABLE     �   CREATE TABLE demo.composition (
    id integer DEFAULT nextval('demo.composition_seq'::regclass) NOT NULL,
    album_id integer NOT NULL,
    album_pos integer NOT NULL,
    name character varying(45) NOT NULL,
    duration interval NOT NULL
);
    DROP TABLE demo.composition;
       demo         artiow    false    184    7            �            1259    19844    current_basket    TABLE     �   CREATE TABLE demo.current_basket (
    user_id integer NOT NULL,
    media_id integer NOT NULL,
    media_count integer DEFAULT 1 NOT NULL
);
     DROP TABLE demo.current_basket;
       demo         artiow    false    7            �            1259    19848 	   genre_seq    SEQUENCE     p   CREATE SEQUENCE demo.genre_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE demo.genre_seq;
       demo       artiow    false    7            �            1259    19850    genre    TABLE     �   CREATE TABLE demo.genre (
    id integer DEFAULT nextval('demo.genre_seq'::regclass) NOT NULL,
    name character varying(45) NOT NULL,
    code character varying(45) NOT NULL
);
    DROP TABLE demo.genre;
       demo         artiow    false    187    7            �            1259    19857    label_id_seq    SEQUENCE     s   CREATE SEQUENCE demo.label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE demo.label_id_seq;
       demo       artiow    false    7            �            1259    19854    label    TABLE     �   CREATE TABLE demo.label (
    id integer DEFAULT nextval('demo.label_id_seq'::regclass) NOT NULL,
    name character varying(45) NOT NULL
);
    DROP TABLE demo.label;
       demo         artiow    false    190    7            �            1259    19863 	   media_seq    SEQUENCE     p   CREATE SEQUENCE demo.media_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE demo.media_seq;
       demo       artiow    false    7            �            1259    19865    media    TABLE     �   CREATE TABLE demo.media (
    id integer DEFAULT nextval('demo.media_seq'::regclass) NOT NULL,
    type_id integer NOT NULL,
    album_id integer NOT NULL,
    price integer NOT NULL
);
    DROP TABLE demo.media;
       demo         artiow    false    191    7            �            1259    19869    media_order    TABLE     �   CREATE TABLE demo.media_order (
    media_id integer NOT NULL,
    order_id integer NOT NULL,
    count integer DEFAULT 1 NOT NULL,
    total_price integer NOT NULL
);
    DROP TABLE demo.media_order;
       demo         artiow    false    7            �            1259    19873    media_type_seq    SEQUENCE     u   CREATE SEQUENCE demo.media_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE demo.media_type_seq;
       demo       artiow    false    7            �            1259    19875 
   media_type    TABLE     �   CREATE TABLE demo.media_type (
    id integer DEFAULT nextval('demo.media_type_seq'::regclass) NOT NULL,
    name character varying(45) NOT NULL,
    code character varying(45) NOT NULL,
    description character varying(90)
);
    DROP TABLE demo.media_type;
       demo         artiow    false    194    7            �            1259    19879 	   order_seq    SEQUENCE     p   CREATE SEQUENCE demo.order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE demo.order_seq;
       demo       artiow    false    7            �            1259    19881    order    TABLE     �   CREATE TABLE demo."order" (
    id integer DEFAULT nextval('demo.order_seq'::regclass) NOT NULL,
    status_id integer NOT NULL,
    address character varying(90) NOT NULL,
    ordered timestamp without time zone NOT NULL
);
    DROP TABLE demo."order";
       demo         artiow    false    196    7            �            1259    19885    order_status_seq    SEQUENCE     w   CREATE SEQUENCE demo.order_status_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE demo.order_status_seq;
       demo       artiow    false    7            �            1259    19887    order_status    TABLE     �   CREATE TABLE demo.order_status (
    id integer DEFAULT nextval('demo.order_status_seq'::regclass) NOT NULL,
    name character varying(45) NOT NULL,
    code character varying(45) NOT NULL,
    description character varying(90)
);
    DROP TABLE demo.order_status;
       demo         artiow    false    198    7            �            1259    19891    picture    TABLE     �   CREATE TABLE demo.picture (
    id integer NOT NULL,
    url character varying(90) NOT NULL,
    name character varying(45) NOT NULL,
    size integer NOT NULL,
    uploaded timestamp without time zone NOT NULL
);
    DROP TABLE demo.picture;
       demo         artiow    false    7            �            1259    19898    picture_id_seq    SEQUENCE     u   CREATE SEQUENCE demo.picture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE demo.picture_id_seq;
       demo       artiow    false    200    7            	           0    0    picture_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE demo.picture_id_seq OWNED BY demo.picture.id;
            demo       artiow    false    201            �            1259    19900    singer    TABLE     _   CREATE TABLE demo.singer (
    id integer NOT NULL,
    name character varying(45) NOT NULL
);
    DROP TABLE demo.singer;
       demo         artiow    false    7            �            1259    19907    singer_id_seq    SEQUENCE     t   CREATE SEQUENCE demo.singer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE demo.singer_id_seq;
       demo       artiow    false    202    7            	           0    0    singer_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE demo.singer_id_seq OWNED BY demo.singer.id;
            demo       artiow    false    203            �            1259    19909    user_seq    SEQUENCE     o   CREATE SEQUENCE demo.user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE demo.user_seq;
       demo       artiow    false    7            �            1259    19911    user    TABLE     �  CREATE TABLE demo."user" (
    id integer DEFAULT nextval('demo.user_seq'::regclass) NOT NULL,
    login character varying(45) NOT NULL,
    password character varying(90) NOT NULL,
    name character varying(45) NOT NULL,
    surname character varying(45) NOT NULL,
    phone character varying(16) NOT NULL,
    address character varying(90) NOT NULL,
    role_id integer NOT NULL
);
    DROP TABLE demo."user";
       demo         artiow    false    204    7            �            1259    19915    user_role_seq    SEQUENCE     t   CREATE SEQUENCE demo.user_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE demo.user_role_seq;
       demo       artiow    false    7            �            1259    19918 	   user_role    TABLE     �   CREATE TABLE demo.user_role (
    id integer DEFAULT nextval('demo.user_role_seq'::regclass) NOT NULL,
    name character varying(45) NOT NULL,
    code character varying(45) NOT NULL,
    description character varying(90)
);
    DROP TABLE demo.user_role;
       demo         artiow    false    206    7            9           2604    20035 
   picture id    DEFAULT     d   ALTER TABLE ONLY demo.picture ALTER COLUMN id SET DEFAULT nextval('demo.picture_id_seq'::regclass);
 7   ALTER TABLE demo.picture ALTER COLUMN id DROP DEFAULT;
       demo       artiow    false    201    200            :           2604    20034 	   singer id    DEFAULT     b   ALTER TABLE ONLY demo.singer ALTER COLUMN id SET DEFAULT nextval('demo.singer_id_seq'::regclass);
 6   ALTER TABLE demo.singer ALTER COLUMN id DROP DEFAULT;
       demo       artiow    false    203    202            �          0    19831    album 
   TABLE DATA               ^   COPY demo.album (id, label_id, singer_id, name, picture_id, release, description) FROM stdin;
    demo       artiow    false    182   �k       �          0    19835    album_genres 
   TABLE DATA               8   COPY demo.album_genres (album_id, genre_id) FROM stdin;
    demo       artiow    false    183   Ol       �          0    19840    composition 
   TABLE DATA               L   COPY demo.composition (id, album_id, album_pos, name, duration) FROM stdin;
    demo       artiow    false    185   ll       �          0    19844    current_basket 
   TABLE DATA               F   COPY demo.current_basket (user_id, media_id, media_count) FROM stdin;
    demo       artiow    false    186   2m       �          0    19850    genre 
   TABLE DATA               -   COPY demo.genre (id, name, code) FROM stdin;
    demo       artiow    false    188   Om       �          0    19854    label 
   TABLE DATA               '   COPY demo.label (id, name) FROM stdin;
    demo       artiow    false    189   lm       �          0    19865    media 
   TABLE DATA               ;   COPY demo.media (id, type_id, album_id, price) FROM stdin;
    demo       artiow    false    192   �m       �          0    19869    media_order 
   TABLE DATA               K   COPY demo.media_order (media_id, order_id, count, total_price) FROM stdin;
    demo       artiow    false    193   �m       �          0    19875 
   media_type 
   TABLE DATA               ?   COPY demo.media_type (id, name, code, description) FROM stdin;
    demo       artiow    false    195   n       �          0    19881    order 
   TABLE DATA               @   COPY demo."order" (id, status_id, address, ordered) FROM stdin;
    demo       artiow    false    197   9n       �          0    19887    order_status 
   TABLE DATA               A   COPY demo.order_status (id, name, code, description) FROM stdin;
    demo       artiow    false    199   Vn       �          0    19891    picture 
   TABLE DATA               >   COPY demo.picture (id, url, name, size, uploaded) FROM stdin;
    demo       artiow    false    200   sn       �          0    19900    singer 
   TABLE DATA               (   COPY demo.singer (id, name) FROM stdin;
    demo       artiow    false    202   �n       �          0    19911    user 
   TABLE DATA               [   COPY demo."user" (id, login, password, name, surname, phone, address, role_id) FROM stdin;
    demo       artiow    false    205   �n       �          0    19918 	   user_role 
   TABLE DATA               >   COPY demo.user_role (id, name, code, description) FROM stdin;
    demo       artiow    false    207   �n       	           0    0 	   album_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('demo.album_seq', 1, false);
            demo       artiow    false    181            	           0    0    composition_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('demo.composition_seq', 9, true);
            demo       artiow    false    184            	           0    0 	   genre_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('demo.genre_seq', 1, false);
            demo       artiow    false    187            	           0    0    label_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('demo.label_id_seq', 1, false);
            demo       artiow    false    190            		           0    0 	   media_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('demo.media_seq', 1, false);
            demo       artiow    false    191            
	           0    0    media_type_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('demo.media_type_seq', 1, false);
            demo       artiow    false    194            	           0    0 	   order_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('demo.order_seq', 1, false);
            demo       artiow    false    196            	           0    0    order_status_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('demo.order_status_seq', 1, false);
            demo       artiow    false    198            	           0    0    picture_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('demo.picture_id_seq', 1, false);
            demo       artiow    false    201            	           0    0    singer_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('demo.singer_id_seq', 1, false);
            demo       artiow    false    203            	           0    0    user_role_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('demo.user_role_seq', 1, false);
            demo       artiow    false    206            	           0    0    user_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('demo.user_seq', 1, false);
            demo       artiow    false    204            A           2606    19926 .   album_genres album_genres_album_id_genre_id_pk 
   CONSTRAINT     z   ALTER TABLE ONLY demo.album_genres
    ADD CONSTRAINT album_genres_album_id_genre_id_pk PRIMARY KEY (album_id, genre_id);
 V   ALTER TABLE ONLY demo.album_genres DROP CONSTRAINT album_genres_album_id_genre_id_pk;
       demo         artiow    false    183    183            ?           2606    19928    album album_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY demo.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY demo.album DROP CONSTRAINT album_pkey;
       demo         artiow    false    182            C           2606    19930    composition composition_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY demo.composition
    ADD CONSTRAINT composition_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY demo.composition DROP CONSTRAINT composition_pkey;
       demo         artiow    false    185            E           2606    19932 1   current_basket current_basket_user_id_media_id_pk 
   CONSTRAINT     |   ALTER TABLE ONLY demo.current_basket
    ADD CONSTRAINT current_basket_user_id_media_id_pk PRIMARY KEY (user_id, media_id);
 Y   ALTER TABLE ONLY demo.current_basket DROP CONSTRAINT current_basket_user_id_media_id_pk;
       demo         artiow    false    186    186            G           2606    19934    genre genre_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY demo.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY demo.genre DROP CONSTRAINT genre_pkey;
       demo         artiow    false    188            K           2606    19936    label label_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY demo.label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY demo.label DROP CONSTRAINT label_pkey;
       demo         artiow    false    189            P           2606    19938 ,   media_order media_order_media_id_order_id_pk 
   CONSTRAINT     x   ALTER TABLE ONLY demo.media_order
    ADD CONSTRAINT media_order_media_id_order_id_pk PRIMARY KEY (media_id, order_id);
 T   ALTER TABLE ONLY demo.media_order DROP CONSTRAINT media_order_media_id_order_id_pk;
       demo         artiow    false    193    193            M           2606    19940    media media_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY demo.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY demo.media DROP CONSTRAINT media_pkey;
       demo         artiow    false    192            R           2606    19942    media_type media_type_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY demo.media_type
    ADD CONSTRAINT media_type_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY demo.media_type DROP CONSTRAINT media_type_pkey;
       demo         artiow    false    195            T           2606    19944    order order_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY demo."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY demo."order" DROP CONSTRAINT order_pkey;
       demo         artiow    false    197            V           2606    19946    order_status order_status_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY demo.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY demo.order_status DROP CONSTRAINT order_status_pkey;
       demo         artiow    false    199            Y           2606    19948    picture picture_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY demo.picture
    ADD CONSTRAINT picture_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY demo.picture DROP CONSTRAINT picture_pkey;
       demo         artiow    false    200            ^           2606    19950    singer singer_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY demo.singer
    ADD CONSTRAINT singer_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY demo.singer DROP CONSTRAINT singer_pkey;
       demo         artiow    false    202            `           2606    19952    user user_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY demo."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY demo."user" DROP CONSTRAINT user_pkey;
       demo         artiow    false    205            b           2606    19954    user_role user_role_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY demo.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY demo.user_role DROP CONSTRAINT user_role_pkey;
       demo         artiow    false    207            =           1259    19955    album_picture_id_uindex    INDEX     T   CREATE UNIQUE INDEX album_picture_id_uindex ON demo.album USING btree (picture_id);
 )   DROP INDEX demo.album_picture_id_uindex;
       demo         artiow    false    182            H           1259    19956    label_id_uindex    INDEX     D   CREATE UNIQUE INDEX label_id_uindex ON demo.label USING btree (id);
 !   DROP INDEX demo.label_id_uindex;
       demo         artiow    false    189            I           1259    19957    label_name_uindex    INDEX     H   CREATE UNIQUE INDEX label_name_uindex ON demo.label USING btree (name);
 #   DROP INDEX demo.label_name_uindex;
       demo         artiow    false    189            N           1259    19958    media_type_id_album_id_uindex    INDEX     a   CREATE UNIQUE INDEX media_type_id_album_id_uindex ON demo.media USING btree (type_id, album_id);
 /   DROP INDEX demo.media_type_id_album_id_uindex;
       demo         artiow    false    192    192            W           1259    19959    picture_id_uindex    INDEX     H   CREATE UNIQUE INDEX picture_id_uindex ON demo.picture USING btree (id);
 #   DROP INDEX demo.picture_id_uindex;
       demo         artiow    false    200            Z           1259    19960    picture_url_uindex    INDEX     J   CREATE UNIQUE INDEX picture_url_uindex ON demo.picture USING btree (url);
 $   DROP INDEX demo.picture_url_uindex;
       demo         artiow    false    200            [           1259    19961    singer_id_uindex    INDEX     F   CREATE UNIQUE INDEX singer_id_uindex ON demo.singer USING btree (id);
 "   DROP INDEX demo.singer_id_uindex;
       demo         artiow    false    202            \           1259    19962    singer_name_uindex    INDEX     J   CREATE UNIQUE INDEX singer_name_uindex ON demo.singer USING btree (name);
 $   DROP INDEX demo.singer_name_uindex;
       demo         artiow    false    202            f           2606    19963 '   album_genres album_genres_album_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.album_genres
    ADD CONSTRAINT album_genres_album_id_fkey FOREIGN KEY (album_id) REFERENCES demo.album(id);
 O   ALTER TABLE ONLY demo.album_genres DROP CONSTRAINT album_genres_album_id_fkey;
       demo       artiow    false    183    182    2111            g           2606    19968 '   album_genres album_genres_genre_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.album_genres
    ADD CONSTRAINT album_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES demo.genre(id);
 O   ALTER TABLE ONLY demo.album_genres DROP CONSTRAINT album_genres_genre_id_fkey;
       demo       artiow    false    183    188    2119            c           2606    19973    album album_label_id_fk    FK CONSTRAINT     s   ALTER TABLE ONLY demo.album
    ADD CONSTRAINT album_label_id_fk FOREIGN KEY (label_id) REFERENCES demo.label(id);
 ?   ALTER TABLE ONLY demo.album DROP CONSTRAINT album_label_id_fk;
       demo       artiow    false    182    189    2123            d           2606    19978    album album_picture_id_fk    FK CONSTRAINT     y   ALTER TABLE ONLY demo.album
    ADD CONSTRAINT album_picture_id_fk FOREIGN KEY (picture_id) REFERENCES demo.picture(id);
 A   ALTER TABLE ONLY demo.album DROP CONSTRAINT album_picture_id_fk;
       demo       artiow    false    2137    182    200            e           2606    19983    album album_singer_id_fk    FK CONSTRAINT     v   ALTER TABLE ONLY demo.album
    ADD CONSTRAINT album_singer_id_fk FOREIGN KEY (singer_id) REFERENCES demo.singer(id);
 @   ALTER TABLE ONLY demo.album DROP CONSTRAINT album_singer_id_fk;
       demo       artiow    false    202    2142    182            h           2606    19988 %   composition composition_album_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.composition
    ADD CONSTRAINT composition_album_id_fkey FOREIGN KEY (album_id) REFERENCES demo.album(id);
 M   ALTER TABLE ONLY demo.composition DROP CONSTRAINT composition_album_id_fkey;
       demo       artiow    false    2111    182    185            i           2606    19993 +   current_basket current_basket_media_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.current_basket
    ADD CONSTRAINT current_basket_media_id_fkey FOREIGN KEY (media_id) REFERENCES demo.media(id);
 S   ALTER TABLE ONLY demo.current_basket DROP CONSTRAINT current_basket_media_id_fkey;
       demo       artiow    false    192    186    2125            j           2606    19998 *   current_basket current_basket_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.current_basket
    ADD CONSTRAINT current_basket_user_id_fkey FOREIGN KEY (user_id) REFERENCES demo."user"(id);
 R   ALTER TABLE ONLY demo.current_basket DROP CONSTRAINT current_basket_user_id_fkey;
       demo       artiow    false    186    205    2144            k           2606    20003    media media_album_id_fk    FK CONSTRAINT     s   ALTER TABLE ONLY demo.media
    ADD CONSTRAINT media_album_id_fk FOREIGN KEY (album_id) REFERENCES demo.album(id);
 ?   ALTER TABLE ONLY demo.media DROP CONSTRAINT media_album_id_fk;
       demo       artiow    false    192    182    2111            m           2606    20008 %   media_order media_order_media_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.media_order
    ADD CONSTRAINT media_order_media_id_fkey FOREIGN KEY (media_id) REFERENCES demo.media(id);
 M   ALTER TABLE ONLY demo.media_order DROP CONSTRAINT media_order_media_id_fkey;
       demo       artiow    false    192    193    2125            n           2606    20013 %   media_order media_order_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.media_order
    ADD CONSTRAINT media_order_order_id_fkey FOREIGN KEY (order_id) REFERENCES demo."order"(id);
 M   ALTER TABLE ONLY demo.media_order DROP CONSTRAINT media_order_order_id_fkey;
       demo       artiow    false    193    2132    197            l           2606    20018    media media_type_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY demo.media
    ADD CONSTRAINT media_type_id_fkey FOREIGN KEY (type_id) REFERENCES demo.media_type(id);
 @   ALTER TABLE ONLY demo.media DROP CONSTRAINT media_type_id_fkey;
       demo       artiow    false    2130    192    195            o           2606    20023    order order_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo."order"
    ADD CONSTRAINT order_status_id_fkey FOREIGN KEY (status_id) REFERENCES demo.order_status(id);
 D   ALTER TABLE ONLY demo."order" DROP CONSTRAINT order_status_id_fkey;
       demo       artiow    false    199    2134    197            p           2606    20028    user user_user_role_id_fk    FK CONSTRAINT     z   ALTER TABLE ONLY demo."user"
    ADD CONSTRAINT user_user_role_id_fk FOREIGN KEY (role_id) REFERENCES demo.user_role(id);
 C   ALTER TABLE ONLY demo."user" DROP CONSTRAINT user_user_role_id_fk;
       demo       artiow    false    207    2146    205            �   Q   x�3�4B����Ԓ�Ĥ�T�?N#CS]C R00�#�0�P�gpN~��SiQT���@uƜ��99xT��qqq r��      �      x������ � �      �   �   x�5��
�0���W�J>�;m)�(-��n��FbR���2�{��a��=��I�)��@iNE�� ��Lk%i)��V狋��ʺ�T�GN;e�R�{=���,�8�N����̰�0	��R����m|߬F�c
�N1���ܾ�)CΡ�q��y�!�0(�"�&�V߽������:f      �      x������ � �      �      x������ � �      �   8   x�3�t��/O-Rp�,�QJM�/J)�2�t�LWNN,�T���+.I-*����� |w�      �   #   x�3�4AS.# ��42���Ԁ+F��� eO+      �      x������ � �      �   %   x�3�tv�LN�
�����%
.��ٚ\1z\\\ }b�      �      x������ � �      �      x������ � �      �      x������ � �      �   =   x�3��/�/�,�T���,N�2���IQp/J��2��̫T��/��KWH,*)����� ��5      �      x������ � �      �      x������ � �     
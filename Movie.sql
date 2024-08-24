create database movie
go 

create schema cast
go 
create table cast.actor (
act_id int Primary key,
act_fname varchar(20),
act_lname varchar(20),
act_gender bit)
go

create table cast.director
(dir_id int Primary key,
dir_fname varchar(20),
dir_name varchar(20))
go

create schema product
go

create table product.movie (
mov_id int Primary key,
mov_title varchar (50),
mov_year int,
mov_time int,
mon_lang varchar (50),
mov_dt_rel date,
mov_rel_country varchar(5))
go
create table cast.reviewer
(
rev_id int Primary key,
rev_name varchar(30))

go
create table product.genres (
gen_id int Primary key,
gen_title varchar(20))
 go
create table cast.movie_cast
(role varchar(30),
act_id int,
mov_id int

 constraint FK_act_id foreign key (act_id) references cast.actor  (act_id),
 constraint FK_mov_id foreign key (mov_id) references product.movie  (mov_id)

 )

 go
 create table product.rating(
 rev_stars int,
 num_o_ratings int,
 mov_id int,
 rev_id int,


 constraint fk_rating_mov_id foreign key (mov_id) references product.movie  (mov_id),
 constraint fk_rating_rev_id foreign key (rev_id) references cast.reviewer  (rev_id),


 )
 go
 create table product.movie_genres
 (
 mov_id int,
 gen_id int,

  constraint fk_movie_genres_mov_id foreign key (mov_id) references product.movie (mov_id),

 )

 go 



 create table product.movie_direction
 (
 dir_id int,
 mov_id int,

 constraint fk_movie_direction_dir_id foreign key (dir_id) references cast.director(dir_id),
 constraint fk_movie_direction_mov_id foreign key (mov_id) references product.movie(mov_id),

 )
 go

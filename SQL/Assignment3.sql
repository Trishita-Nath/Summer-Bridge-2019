/* Week 3 Assignment: Project: Building a Relational Database Management System*/

create database organization;
use organization;

create table organization_groups (id int not null auto_increment primary key, name varchar(100));
create table users (id int not null auto_increment primary key, name varchar(100), group_id int, foreign key (group_id) references organization_groups(id));
create table rooms (id int not null auto_increment primary key, name varchar(100) );
create table groups_rooms (  group_id int not null, 
foreign key (group_id) references organization_groups(id),
 room_id int not null, 
foreign key (room_id) references rooms(id) );


insert into organization_groups (name) values ('I.T.'), ('Sales'), ('Administration'), ('Operations');
insert into rooms (name) values ('101'), ('102'), ('Auditorium A'), ('Auditurium B');
insert into groups_rooms (group_id, room_id) values (1,1),(1,2),(2,2),(2,3);
insert into users (name, group_id) values ('Modesto', 1), ('Ayine', 1), ('Christopher', 2), ('Cheong woo', 2), ('Saulat', 3), ('Heidy', NULL);

/* 1. All groups, and the users in each group. A group should appear even if there are no users assigned to the group. */

select * from organization_groups G left join users U on G.id = U.group_id;

/* 2. All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been assigned to them. */
  
select * from rooms R left outer join groups_rooms GR on R.id = GR.room_id left outer join organization_groups G on GR.group_id = G.id;  

/* 3. A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted alphabetically by user, then by group, then by room. */

select * from users U left outer join organization_groups G on U.group_id = G.id 
left outer join groups_rooms GR on U.group_id = GR.group_id left outer join rooms R on GR.room_id = R.id
ORDER BY U.name, G.name, R.name;

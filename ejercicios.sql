/*escribe una consulta SQL que devuelva una lista de usuarios junto con los nombres de sus amigos.*/
use friends;
SELECT 
users.first_name as first_name,
users.last_name as last_name,
user2.first_name as friend_first_name,
user2.last_name as friend_last_name
FROM users 
JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users as user2 ON friendships.friend_id = user2.id;

/*EJERCICIO ADICIONAL
1.Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.
*/
use friends;
SELECT 
concat(users.first_name,' ',users.last_name)  as nombre,
user2.first_name as amigo_de
FROM users 
JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users as user2 ON friendships.friend_id = user2.id
where user2.first_name = "Kermit";

/*2.Devuelve el recuento de todas las amistades.*/
use friends;
SELECT 
count(users.id) as numero_amistades_total
FROM users 
JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users as user2 ON friendships.friend_id = user2.id;

/*3.Descubre quién tiene más amigos y devuelve el recuento de sus amigos.*/
use friends;
select 
users.first_name as nombre,
count(users.id) as numero_amigos
from users
join friendships ON users.id = friendships.user_id
group by users.id
limit 1;

/*4.Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.*/
use friends;
insert into users(first_name, last_name, created_at, updated_at) 
values ("Jose","Sanchez",now(),null);
insert into friendships(user_id, friend_id, created_at, updated_at) 
values (2,6,now(),null);
insert into friendships(user_id, friend_id, created_at, updated_at) 
values (4,6,now(),null);
insert into friendships(user_id, friend_id, created_at, updated_at) 
values (5,6,now(),null);

/*5.Devuelve a los amigos de Eli en orden alfabético.*/
use friends;
select 
user2.first_name as nombre,
users.first_name as amigo_de
from users
right JOIN friendships ON users.id = friendships.user_id
JOIN users as user2 ON friendships.friend_id = user2.id
where users.first_name = "Eli";

/*6.Eliminar a Marky Mark de los amigos de Eli.*/
use friends;
delete from 
friendships
where friendships.friend_id = 5;

/*7.Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos*/
use friends;
SELECT 
concat(users.first_name,' ',users.last_name)  as nombre,
concat(user2.first_name,' ',user2.last_name)  as nombre_amigo
FROM users 
JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users as user2 ON friendships.friend_id = user2.id;
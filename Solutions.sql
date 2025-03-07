use sakila;

-- Query 1
select count(distinct(last_name))
	from actor;

-- Query 2
select distinct(language_id)
	from film;
-- the movies where only produced in 1 language. 

-- Query 3
		
select rating, count(rating)
	from film
    where rating = "PG-13"
    group by rating;
-- there is 223 titles with PG-13 rating


-- Query 4

select title, length
from film
where release_year = "2006"
order by length desc
limit 10;

-- Query 5
		
select datediff(max(rental_date),min(rental_date))
	from rental;

-- the company has been operational for 266 days

-- Query 6

SELECT rental_date, extract(month from rental_date), weekday(rental_date)
	from rental
    limit 20;

-- Query 7

SELECT rental_date, extract(month from rental_date), weekday(rental_date) as `weekday`, if(weekday(rental_date)> "5" , "Weekend","Workday")
	from rental;

-- Query 8

select count(rental_id)
from rental
where rental_date <= '2006-02-14 15:16:03' 
and rental_date > "2006-01-14 15:16:03" ;
-- there where 182 rentals in the last week of operation. 

-- Query 9

select title,rating
	from film;

-- Query 10
		
select distinct(release_year),count(release_year) as count
	from film
    group by release_year;
-- all the titels have release year 2006  for 1000 movies

-- Query 11

select title 
	from film
    where title regexp "ARMAGEDDON";

-- Query 12
​
select title 
	from film
    where title regexp "APOLLO";
​
-- Query 13
​
select title 
	from film
    where title regexp "APOLLO$";
​
-- Query 14
​
select title 
	from film
    where title regexp "DATE";

-- Query 15
select title 
	from film
    order by length(title) desc
    limit 10;

-- Query 16
select title , length
	from film
    order by length desc
    limit 10;

-- Query 17
select count(special_features)
	from film
    where special_features regexp "Behind the Scenes";

-- Query 18

select title, release_year
	from film
    order by release_year and title desc;

-- Query 19

alter table staff
drop column picture;

-- Query 20

insert into staff(staff_id, first_name, last_name, address_id, store_id, username)
values (3, 'Tammy', 'Sanders', 4, 2, 'Tammy');

-- Query 21

insert into rental(rental_id, rental_date, inventory_id, customer_id, staff_id)
VALUES(16050,(select current_timestamp()),
    (select inventory_id from inventory where film_id = (select film_id from film where title = 'Academy Dinosaur' limit 1) limit 1),
    (select customer_id from customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER' limit 1),
    (select staff_id from staff where store_id = 1 limit 1));

-- Query 22

create table backup_table
as select *
from customer
where active = 0;

delete from customer
where active = 0;
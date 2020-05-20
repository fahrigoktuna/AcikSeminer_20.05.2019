
drop table if exists vacuum_sample;

create  table vacuum_sample (id int, name varchar(100)) with (autovacuum_enabled = off);



insert into vacuum_sample select *,'Kaan' from pg_catalog.generate_series(1, 100000); 


select pg_size_pretty(pg_relation_size('vacuum_sample')); --4328 kB

update vacuum_sample set name ='Kaan2';

select pg_size_pretty(pg_relation_size('vacuum_sample')); --8656 kB 2 katına çıktı

vacuum vacuum_sample;

select pg_size_pretty(pg_relation_size('vacuum_sample')); --8656 kB relation boyutu değişmeyecek

update vacuum_sample set name ='Kaan3';

select pg_size_pretty(pg_relation_size('vacuum_sample')); --8656 kB relation boyutu artmayacak


vacuum full vacuum_sample;

select pg_size_pretty(pg_relation_size('vacuum_sample')); --4328 kB relation boyutu ilk halinde


















explain select * from public.film where language_id =1; -- Seq Scan sample


explain  select * from public.film where language_id =2; -- index Scan sample


explain  select language_id from public.film where language_id =2; -- index Only Scan sample


explain analyze select * from public.film where language_id =2;

explain analyze select language_id from public.film where language_id =2;
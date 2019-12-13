# Implement Queries Retrieve all Developers
#1
#a
select p.id as ID, username as Username, password as Password, first_name as First, last_name as Last,
type as Type, email as Email, developer_key as DeveloperKey from person p
join developer d on p.id =  d.id and p.type = 'developer';

#b
select  p.id as ID, username as Username, password as Password, first_name as First, last_name as Last,
type as Type, email as Email from person p join developer d on p.id = d.id  where p.id = 34;

#c
select person.id, first_name, last_name, username, email, developer_key, role
   from person join developer d on (person.id= d.id ) 
   join website_role  wr on (wr.developer_id=d.id ) 
        join website w on (w.id=wr.website_id)
   where w.id=(select id from website where name = 'Twitter') and role not in ('owner');
   
  #d
select person.id, first_name, last_name, username, email, developer_key
   from person join developer d on (person.id= d.id ) where person.id in
(select developer_id from page_role 
join page on page_role.page_id = page.id where visits < 300000 and role = 'reviewer');

#e
select first_name, last_name, username, email, w.name as website_name,p.title as page_name,wg.dtype as type,role from website w
 join page p on w.id = p.website_id 
 join widget wg on wg.page_id = p.id
 join page_role pg on pg.page_id = p.id 
 join person ps on ps.id = pg.developer_id
 where w.name = 'CNET' and p.title = 'Home' and wg.dtype = 'heading' and role = 'writer';
 
 
 
 
  #Retrieve Websites
 #a
 select id, name as website_name, description, created, updated,  min(visits) as visits from website;

#b
select id, name as website_name, description, created, updated  from website where id = 678;
 
 #c
select first_name, last_name, username, email, w.name as website_name,role from 
website w join page p on w.id = p.website_id
join widget wg on wg.page_id = p.id 
join page_role wr on p.id = wr.page_id
join person pp on pp.id = wr.developer_id 
join developer d on pp.id = d.id
where dtype = 'youtube' and role = 'reviewer';


#d
select  website.name as website_name,  username, role, email from website 
join website_role on website.id = website_role.website_id
join person on person.id = website_role.developer_id
 where role = 'owner' and username = 'alice';
 
 #e
select name as website_name, username, visits, wr.role from website w 
join website_role wr on w.id =  wr.website_id
join person p on p.id = wr.developer_id 
join developer d on p.id = d.id
where role = 'admin' and username = 'charlie' and visits > 6000000;
 
 
 #Retireve Pages
 
 #a
    select id, title, description, page.created, page.updated, max(visits) 
    from page where visits =(select max(visits) from page);

#b    
select id, title from page where id = 234;


#c
select p.id,role, title, p.description, p.created, p.updated, p.visits
 from page p join page_role pr on p.id = pr.page_id 
join person pp on pp.id = pr.developer_id
 join developer d on d.id = pp.id
where pp.id = (select id from person where username = 'alice') and role = 'editor';

#d
select name, sum(page.visits) as total_views_cnet from page 
join website w on w.id = page.website_id 
where name = 'CNET';

#e
select name, avg(page.visits) as avg_views_wiki from page 
join website w on w.id = page.website_id 
where name = 'Wikipedia';


#4 Retrieve Widgets

#a
select  wr.name as website_name, p.title as page_name,w.*
 from widget w 
join page p on p.id = w.page_id
join website wr on wr.id = p.website_id 
where wr.name = 'CNET' and p.title= 'Home';

#b
select widget.name, dtype, w.name as website_name, page.title as page_name, size
    from widget join page
    on widget.page_id = page.website_id
    join website w on w.id = page.website_id
	where dtype='youtube' and w.name ='CNN';


#c
select w.*, pr.developer_id, pr.role from page p join widget w
on p.id = w.page_id
join page_role pr on pr.page_id = p.id
join person ppp on ppp.id = pr.developer_id
join developer d on d.id = ppp.id 
 where username = 'alice' and role = 'reviewer' and w.dtype = 'image';
 
 #d
 
 select count(widget.id) as count_widget from widget join page on page.id = widget.page_id
 join website on website.id = page.website_id where website.name = 'Wikipedia' ;






 #Retrieve triggers
 
 #a
 select website_id, name, p.username,  priviledge from website_priviledge wp
 join website w on wp.website_id = w.id
join 
  person p on p.id = wp.developer_id
  join developer d on d.id = p.id where username = 'bob'
and priviledge = 'delete';

#b
select page_id, title as page_name, priviledge from page_priviledge wp
 join page w on wp.page_id = w.id  join
  person p on p.id = wp.developer_id
  join developer d on d.id = p.id where username = 'charlie'
and priviledge = 'create';
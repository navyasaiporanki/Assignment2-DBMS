#Deletes

#a
delete from address where address.primary = 1 
and id = (select p.id from person p join developer d on p.id = d.id where username = 'alice')  ;

#b
SET SQL_SAFE_UPDATES = 0;
delete widget from widget join page on page.id = widget.page_id where page.title = 'Contact' 
and widget.order =(select x from (select max(widget.order) as x from widget ) as y); 
SET SQL_SAFE_UPDATES = 1;

#c
SET SQL_SAFE_UPDATES = 0;

DELETE page FROM page JOIN website
	ON page.website_id = website.id
WHERE website.name = 'Wikipedia'and 
page.updated in (SELECT x from (select max(page.updated) as x from page) as x);
SET SQL_SAFE_UPDATES = 1;
						
#d 
SET SQL_SAFE_UPDATES = 0;
delete from website where website.name = 'CNET';  -- will delete roles because of triggers
SET SQL_SAFE_UPDATES = 1;
insert into role values('admin');
insert into role values('editor');
insert into role values('owner');
insert into role values('reviewer');
insert into role values('writer');

insert into dtype values ('heading');
insert into dtype values ('html');
insert into dtype values ('image');
insert into dtype values ('widget');
insert into dtype values ('youtube');

insert into priviledge values('create');
insert into priviledge values('delete');
insert into priviledge values('read');
insert into priviledge values('update');

#INSERT into person developer and user

insert into person values (12,'alice','alice','Alice','Wonder','Developer','alice@wonder.com');
insert into developer values (12, '4321rewq');

insert into person values (23,'bob','bob','Bob','Marley','Developer','bob@marley.com');
insert into developer values (23, '5432trew');

insert into person values (34,'charlie','charlie','Charles','Garcia','Developer','chuch@garcia.com');
insert into developer values (34, '6543ytre');

insert into person values (45,'dan','dan','Dan','Martin','User','dan@martin.com');
insert into user values (45, true);

insert into person values (56,'ed','ed','Ed','Karaz','User','ed@kar.com');
insert into user values (56, true);

#INSERT into website

insert into website values (123, 'Facebook', 'an online social media and social networking service', default, default, 
1234234, (select p.id from person p join developer d on p.id = d.id where username = 'alice'));

insert into website values (234, 'Twitter', 'an online news and social networking service', default, default, 
4321543, (select p.id from person p join developer d on p.id = d.id where username = 'bob'));

insert into website values (345, 'Wikipedia', 'a free online encyclopedia', default, default, 
3456654, (select p.id from person p join developer d on p.id = d.id where username = 'charlie'));

insert into website values (456, 'CNN', 'an American basic cable and satellite television news channel', default, default, 
6543345, (select p.id from person p join developer d on p.id = d.id where username = 'alice'));

insert into website values (567, 'CNET', 'an American media website that publishes reviews, news, articles, blogs, 
podcasts and videos on technology and consumer electronics', default, default, 
5433455, (select p.id from person p join developer d on p.id = d.id where username = 'bob'));

insert into website values (678, 'Gizmodo', 'a design, technology, science and science fiction website that
 also writes articles on politics', default, default, 
4322345, (select p.id from person p join developer d on p.id = d.id where username = 'charlie'));


#INSERT into phone

INSERT INTO phone VALUES (12,'123-234-3456',1);
INSERT INTO `phone` VALUES (12,'234-345-4566',0);
INSERT INTO `phone` VALUES (23,'345-456-5677',1);
INSERT INTO `phone` VALUES (34,'321-432-5435',1);
INSERT INTO `phone` VALUES (34,'432-432-5433',0);
INSERT INTO `phone` VALUES (34,'543-543-6544',0);

#INSERT into address

insert into address values (12, '123 Adam St.',null, 'Alton', 'MA', '01234', true);
insert into address values (12, 'Birch St.',null, 'Boston', 'MA', '02345', false);

insert into address values (23, '345 Charles St.',null, 'Chelms', 'MA', '03455', true);
insert into address values (23, '456 Down St.',null, 'Dalton', 'MA', '04566', false);
insert into address values (23, '543 East St.',null, 'Everett', 'MA', '01112', false);

insert into address values (34, '654 Frank St.',null, 'Foulton', 'MA', '04322', true);


#INSERT into page

insert into page values (123, 'Home', 'Landing page', default, default, 123434, (select id from website where name = 'CNET'));

insert into page values (234, 'About', 'Website description', default, default, 234545, 
(select id from website where name = 'Gizmodo'));

insert into page values (345, 'Contact', 'Addresses, phones, and contact info', default, default, 345656, 
(select id from website where name = 'Wikipedia'));

insert into page values (456, 'Preferences', 'Where users can configure their preferences',
 default, default, 456776, (select id from website where name = 'CNN'));
 
insert into page values (567, 'Profile', 'Users can configure their personal information', default, default, 567878, 
(select id from website where name = 'CNET'));


#INSERT into widget

insert into widget values (123, 'head123', (select type from dtype where type = 'heading'), 'welcome',
 null, null, null,0, default, null, null,null, 0,0,
(select id from page where title  = 'Home'));

insert into widget values (234, 'post234', (select type from dtype where type = 'html'), '<p>Lorem</p>',
 null, null, null,0, default, null, null,null, 0,0,
(select id from page where title  = 'About'));

insert into widget values (345, 'head345', (select type from dtype where type = 'heading'), 'Hi',
 null, null, null,1, default, null, null,null, 0,0,
(select id from page where title  = 'Contact'));

insert into widget values (456, 'intro456', (select type from dtype where type = 'html'), '<h1>Hi</h1>',
 null, null, null,2, default, null, null,null, 0,0,
(select id from page where title  = 'Contact'));


insert into widget values (567, 'image345', (select type from dtype where type = 'image'), null,
 '50x100', null, null,3, default, null, null,'/img/567.png', 0,0,
(select id from page where title  = 'Contact'));

insert into widget values (678, 'video456', (select type from dtype where type = 'youtube'), null,
 '400x300', null, null,0, default, null, null,'https://youtu.be/h67VX51QXiQ', 0,0,
(select id from page where title  = 'Preferences'));


# INSERT into website role

insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'alice'), 
(select id from website where name = 'Facebook'), (select role from role where role = 'owner'));

insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'bob'), 
(select id from website where name = 'Facebook'), (select role from role where role = 'editor'));

insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'charlie'), 
(select id from website where name = 'Facebook'), (select role from role where role = 'admin'));


insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'bob'), 
(select id from website where name = 'Twitter'), (select role from role where role = 'owner'));

insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'charlie'), 
(select id from website where name = 'Twitter'), (select role from role where role = 'editor'));

insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'alice'), 
(select id from website where name = 'Twitter'), (select role from role where role = 'admin'));



insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'charlie'), 
(select id from website where name = 'Wikipedia'), (select role from role where role = 'owner'));

insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'alice'), 
(select id from website where name = 'Wikipedia'), (select role from role where role = 'editor'));

insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'bob'), 
(select id from website where name = 'Wikipedia'), (select role from role where role = 'admin'));




insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'alice'), 
(select id from website where name = 'CNN'), (select role from role where role = 'owner'));

insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'bob'), 
(select id from website where name = 'CNN'), (select role from role where role = 'editor'));

insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'charlie'), 
(select id from website where name = 'CNN'), (select role from role where role = 'admin'));


insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'bob'), 
(select id from website where name = 'CNET'), (select role from role where role = 'owner'));

insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'charlie'), 
(select id from website where name = 'CNET'), (select role from role where role = 'editor'));

insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'alice'), 
(select id from website where name = 'CNET'), (select role from role where role = 'admin'));



insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'charlie'), 
(select id from website where name = 'Gizmodo'), (select role from role where role = 'owner'));

insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'alice'), 
(select id from website where name = 'Gizmodo'), (select role from role where role = 'editor'));

insert into website_role(developer_id, website_id, role) values (
(select d.id from developer d join person p on d.id = p.id where username = 'bob'), 
(select id from website where name = 'Gizmodo'), (select role from role where role = 'admin'));


# INSERT into page role



insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'alice'), 
(select id from page where title = 'Home'), (select role from role where role = 'editor'));

insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'bob'), 
(select id from page where title = 'Home'), (select role from role where role = 'reviewer'));

insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'charlie'), 
(select id from page where title = 'Home'), (select role from role where role = 'writer'));


insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'bob'), 
(select id from page where title = 'About'), (select role from role where role = 'editor'));

insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'charlie'), 
(select id from page where title = 'About'), (select role from role where role = 'reviewer'));

insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'alice'), 
(select id from page where title = 'About'), (select role from role where role = 'writer'));


insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'charlie'), 
(select id from page where title = 'Contact'), (select role from role where role = 'editor'));

insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'alice'), 
(select id from page where title = 'Contact'), (select role from role where role = 'reviewer'));

insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'bob'), 
(select id from page where title = 'Contact'), (select role from role where role = 'writer'));


insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'alice'), 
(select id from page where title = 'Preferences'), (select role from role where role = 'editor'));

insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'bob'), 
(select id from page where title = 'Preferences'), (select role from role where role = 'reviewer'));

insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'charlie'), 
(select id from page where title = 'Preferences'), (select role from role where role = 'writer'));

insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'bob'), 
(select id from page where title = 'Profile'), (select role from role where role = 'editor'));

insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'charlie'), 
(select id from page where title = 'Profile'), (select role from role where role = 'reviewer'));

insert into page_role(developer_id, page_id, role) values(
(select d.id from developer d join person p on d.id = p.id where username = 'alice'), 
(select id from page where title = 'Profile'), (select role from role where role = 'writer'));
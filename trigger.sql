DELIMITER $$
create TRIGGER AFTER_WEBSITE_ROLE_INSERT
  AFTER INSERT ON website_role
  FOR EACH ROW   
  BEGIN
  case 
  when new.role = 'owner'
	then
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'create' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'update' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'delete' );
    when new.role = 'editor'
	then     
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'update' );
   
      when new.role = 'writer'
	then     
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'update' );
   
	when new.role = 'reviewer'
	then     
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'read' );
   
   
	when new.role = 'admin'
	then  
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'create' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'update' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'delete' );
 
  end case;
  END$$
  DELIMITER ;
  
  
  
   DELIMITER $$
create TRIGGER AFTER_WEBSITE_ROLE_UPDATE
  AFTER UPDATE ON website_role
  FOR EACH ROW   
  BEGIN
  
  delete from website_priviledge where developer_id = old.developer_id and website_id = old.website_id;
  case 
  when new.role = 'owner'
	then
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'create' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'update' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'delete' );
    when new.role = 'editor'
	then     
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'update' );
   
      when new.role = 'writer'
	then     
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'update' );
   
	when new.role = 'reviewer'
	then     
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'read' );
   
   
	when new.role = 'admin'
	then  
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'create' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'read' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'update' );
      insert into website_priviledge(developer_id, website_id,priviledge ) values (new.developer_id,new.website_id,'delete' );
 
  end case;
  END$$
  DELIMITER ;
  
  

  
     DELIMITER $$
create TRIGGER AFTER_WEBSITE_ROLE_DELETE
  AFTER DELETE ON website_role
  FOR EACH ROW   
  BEGIN
  
  delete from website_priviledge where developer_id = old.developer_id and website_id = old.website_id;
  
  END$$
  DELIMITER ;
  
   
 
 DELIMITER $$
create TRIGGER AFTER_PAGE_ROLE_INSERT
  AFTER INSERT ON page_role
  FOR EACH ROW   
  BEGIN
  CASE 
  when new.role = 'editor'
	then
      insert into page_priviledge(developer_id, page_id,priviledge ) values (new.developer_id,new.page_id,'read' );
      insert into page_priviledge(developer_id, page_id,priviledge ) values (new.developer_id,new.page_id,'update' );
   when new.role = 'writer'
	then 
    insert into page_priviledge(developer_id, page_id,priviledge ) values (new.developer_id,new.page_id,'create' );
      insert into page_priviledge(developer_id, page_id,priviledge ) values (new.developer_id,new.page_id,'read' );
      insert into page_priviledge(developer_id, page_id,priviledge ) values (new.developer_id,new.page_id,'update' );
  when new.role = 'reviewer'
	then    
      insert into page_priviledge(developer_id, page_id,priviledge ) values (new.developer_id,new.page_id,'read' );
      END CASE;
  END$$
  DELIMITER ;
  
  
  
  DELIMITER $$
create TRIGGER AFTER_PAGES_ROLE_UPDATE
  AFTER UPDATE ON page_role
  FOR EACH ROW   
  BEGIN
  
        delete from page_priviledge where developer_id = old.developer_id and page_id = old.page_id;
          
	 CASE 
  when new.role = 'editor'
	then
      insert into page_priviledge(developer_id, page_id,priviledge ) values (new.developer_id,new.page_id,'read' );
      insert into page_priviledge(developer_id, page_id,priviledge ) values (new.developer_id,new.page_id,'update' );
   when new.role = 'writer'
	then   
    insert into page_priviledge(developer_id, page_id,priviledge ) values (new.developer_id,new.page_id,'read' );
      insert into page_priviledge(developer_id, page_id,priviledge ) values (new.developer_id,new.page_id,'read' );
      insert into page_priviledge(developer_id, page_id,priviledge ) values (new.developer_id,new.page_id,'update' );
  when new.role = 'reviewer'
	then    
      insert into page_priviledge(developer_id, page_id,priviledge ) values (new.developer_id,new.page_id,'read' );
      END CASE;

  END$$
  DELIMITER ;
  
  
    DELIMITER $$
create TRIGGER AFTER_PAGES_ROLE_DELETE
  AFTER DELETE ON page_role
  FOR EACH ROW   
  BEGIN
  
        delete from page_priviledge where developer_id = old.developer_id and page_id = old.page_id;

  END$$
  DELIMITER ;
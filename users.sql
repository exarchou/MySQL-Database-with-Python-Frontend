-- Xristis pou exei ola ta dikaiwmata sth vash mesa apo to mhxanhma pou brisketai sth bash
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpass';
GRANT ALL PRIVILEGES ON root.* TO 'admin'@'localhost';

-- Xristis pou mporei na diavazei opoiadhpote plhroforia thelei apo th vash apo opoudhpote
CREATE USER 'reader'@'%' IDENTIFIED BY 'readerpass';
GRANT SELECT ON root.* TO 'reader'@'%';

-- Xristis ereuniti-ereunitikou kentrou pou exei dikaiwma na vlepei na prosthetei kai na
-- kanei update opoiadhpote plhroforia apo th vash, apo opoudhpote. 
CREATE USER 'researcher'@'%' IDENTIFIED BY 'researcherpass';
GRANT SELECT, INSERT, UPDATE ON root.* TO 'researcher'@'%';

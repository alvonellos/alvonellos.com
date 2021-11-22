--alex alvonellos
--nov 21, 2021
--sqlite3 code to build and recreate schema. 

--nuke the whole db
PRAGMA writable_schema = 1;
DELETE FROM sqlite_master WHERE type IN  ('table', 'index', 'trigger');
PRAGMA writable_schema = 0;

--clean it up
VACUUM;
PRAGMA INTEGRITY_CHECK;

--create new one

CREATE TABLE LOGGER (
	dt       TEXT, -- EPOCH FMT. 
        page     TEXT, -- which page was visited
        IP       TEXT -- how long they were there. 
        );


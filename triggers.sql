DROP SEQUENCE IF EXISTS part_number_seq;
CREATE SEQUENCE part_number_seq START WITH 5000;

CREATE OR REPLACE LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION func_name()
RETURN "trigger" AS
    $BODY$
    BEGIN
    NEW.part_number = nextval('part_number_seq');
    RETURN NEW;
    END;
    $BODY$
LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER trig BEFORE INSERT
ON part_nyc FOR EACH ROW
EXECUTE PROCEDURE func_name();

DROP TRIGGER IF EXISTS trig ON part_nyc;


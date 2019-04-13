CREATE OR REPLACE FUNCTION checkId(id varchar)
    RETURNS NUMERIC AS
$$
DECLARE
    counter    INTEGER := 0 ;
    sum        INTEGER := 0 ;
    ZFOdd      VARCHAR := 0 ;
    id_type    INTEGER := 0 ;
    temp_value INTEGER := 0 ;
BEGIN
    IF LENGTH(id) != 10 THEN
        RETURN -1;
    END IF;
    id_type = LEFT(id, 1);
    IF id_type != '1' AND id_type != '2' THEN
        RETURN -1;
    end if;

    WHILE counter < 10
        LOOP
            IF counter % 2 = 0 THEN
                temp_value := substring(id from counter + 1 for 1);
                temp_value := cast(temp_value as INTEGER) * 2;
                ZFOdd := LPAD(cast(temp_value as varchar), 2, '0');
                RAISE NOTICE USING MESSAGE = ZFOdd;
                sum := sum + (cast(substring(ZFOdd from 1 for 1) as INTEGER) +
                              cast(substring(ZFOdd from 2 for 1) as INTEGER));

            ELSE
                sum := sum + cast(substring(id from counter + 1 for 1) as INT);
            end if;
            counter := counter + 1;
        end loop;
    IF sum % 10 != 0 THEN
        return -1;
    ELSE
        return id_type;
    end if;

END;
$$
    LANGUAGE plpgsql;

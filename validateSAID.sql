CREATE OR REPLACE FUNCTION checkId(id varchar)
    RETURNS NUMERIC
    LANGUAGE plpgsql IMMUTABLE STRICT AS
$$
DECLARE
    total int := 0;
    d     int;
BEGIN
    IF id !~ '^[12][0-9]{9}$' THEN
        RETURN -1;
    END IF;

    FOR i IN 1..10 LOOP
        d := substr(id, i, 1)::int;
        IF i % 2 = 1 THEN          -- positions 1,3,5,7,9 are doubled
            d := d * 2;
            IF d > 9 THEN d := d - 9; END IF;
        END IF;
        total := total + d;
    END LOOP;

    RETURN CASE WHEN total % 10 = 0 THEN left(id, 1)::int ELSE -1 END;
END
$$;

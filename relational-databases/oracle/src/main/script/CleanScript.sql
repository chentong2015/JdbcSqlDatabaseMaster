TRUNCATE TABLE -- 只是删除表中所的数据，并不会删除表本省
DROP TABLE     -- 删除表以及表中的所有数据

-- 遍历删除Oracle中所有用户创建的数据表
BEGIN
    FOR c IN (SELECT table_name FROM user_tables) LOOP
        EXECUTE IMMEDIATE ('DROP TABLE "' || c.table_name || '" CASCADE CONSTRAINTS');
    END LOOP;

    FOR s IN (SELECT sequence_name FROM user_sequences) LOOP
        EXECUTE IMMEDIATE ('DROP SEQUENCE ' || s.sequence_name);
    END LOOP;
END;

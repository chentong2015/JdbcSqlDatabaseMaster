-- 返回执行字段的最大值
select max(RECORD_KEY) as max_key from t_log;

-- TODO. 返回指定Table的最大ID(上一个插入的ID)，可用于判断是否达到极限
-- @@IDENTITY and SCOPE_IDENTITY will return the last identity value generated
-- in any table in the current session.
--
-- However, SCOPE_IDENTITY returns the value only within the current scope;
-- @@IDENTITY is not limited to a specific scope. That is,
-- if there was a second IDENTITY inserted based on a trigger after your insert,
-- it would not be reflected in SCOPE_IDENTITY, only the insert you performed.
--
-- IDENT_CURRENT is not limited by scope and session; it is limited to a specified table.
-- IDENT_CURRENT returns the identity value generated for a specific table in any session and any scope.

@@IDENTITY
returns the last identity value generated for any table in the current session, across all scopes.
You need to be careful here, since it's across scopes.
You could get a value from a trigger, instead of your current statement.

SCOPE_IDENTITY()
returns the last identity value generated for any table in the current session and the current scope.
Generally what you want to use.

IDENT_CURRENT('tableName')
returns the last identity value generated for a specific table in any session and any scope.
This lets you specify which table you want the value from, in case the two above aren't quite what you need (very rare).
You could use this if you want to get the current IDENTITY value for a table that you have not inserted a record into.



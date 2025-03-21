select @@version;

-- 查询Sybase中Proxy Table
select name from sysobjects where sysstat2 & 1024 = 1024 and type = "U"

-- Sybase会自动做truncate截断存储字符串末尾的空格
create table t_text (
     code INT,
     name char(5)
  )
insert into t_text (code, name) values (1, 'aaéa ')
insert into t_text (code, name) values (2, 'aaéaè')

-- 使用Sybase Hash加密函数，返回name_SHA1列值作为checksum验校码验证数据
select *, HASH(RTRIM(name),'SHA1') AS name_SHA1 FROM t_text

create table t_comment (
     code INT,
     name char(5),
     label varchar(10)
  )
insert into t_comment (code, name, label) values (1, 'aaéa ', 'test test')
insert into t_comment (code, name, label) values (2, 'aaba ', 'test test')
insert into t_comment (code, name, label) values (3, 'aaaaé', 'bbbb bbbb')
insert into t_comment (code, name, label) values (4, 'aaaa ', 'abcdefghté')
insert into t_comment (code, name, label) values (5, 'bbbbb', 'aébcdefght')
insert into t_comment (code, name, label) values (6, 'ccccc', 'aébcdefghé')
insert into t_comment (code, name, label) values (7, 'ccccc', 'aébcdefgh')
insert into t_comment (code, name, label) values (8, 'ccccé', 'aébcdefgho')
insert into t_comment (code, name, label) values (9, 'été  ', 'test test')

create table t_context (
     code INT,
     context varchar(10),
     des VARCHAR(50)
  )
insert into t_context (code, context, des)
values (1, 'aaaaa bbéé', ' ARG du 30/12/02 Ref Thémis S-00151-2003 suppriméo')

-- 创建numeric类型和DATE类型
CREATE TABLE TEST_DB (
   M_ID NUMERIC(10),
   M_STATUS NUMERIC(10),
   M_CREATED_AT DATE DEFAULT GETDATE()
)

insert into TEST_DB (M_ID, M_STATUS) values (10, 100)


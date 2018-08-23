drop table blog CASCADE CONSTRAINTS;
drop table b_board CASCADE CONSTRAINTS;
drop table board_tag CASCADE CONSTRAINTS;
drop table board_category CASCADE CONSTRAINTS;
drop table reply CASCADE CONSTRAINTS; 
drop table friend CASCADE CONSTRAINTS;
drop table friend_req CASCADE CONSTRAINTS;

drop sequence seq_blog_no;
drop sequence seq_board_no;
drop sequence seq_tag_no;
drop sequence seq_board_category_no;
drop sequence seq_reply_no;
drop sequence seq_friend_no;
drop sequence seq_friend_req_no;

create sequence seq_blog_no;
create table blog (
        id              varchar2(20)    primary key
    ,   blog_no         number(5)       
    ,   visit_today     number(5)       default 0
    ,   visit_total     number(5)       default 0
    ,   reg_date        date            default sysdate
);
create sequence seq_board_no ;
create table b_board (
        id              varchar2(20)    not null
    ,   board_no        number(5)       primary key
    ,   view_cnt        number(5)       default 0
    ,   title           varchar2(2000)  not null
    ,   content         varchar2(4000)  not null
    ,   depth           number(3)       not null
    ,   parent          number(3)
    ,   category_name   varchar2(100)   not null
    ,   like_cnt        number(5)       default 0
    ,   reg_date        date            default sysdate
    ,   constraint b_board_id_fk foreign key(id)
        references blog(id) on delete cascade
);

create sequence seq_tag_no;
create table board_tag (
        tag_no      number(5)   
    ,   board_no    number(5)   not null
    ,   tag_name    varchar2(20) not null
    ,   constraint board_tag_no_fk foreign key(board_no)
        references b_board(board_no) on delete cascade
);


create sequence seq_board_category_no ;
create table board_category (
        category_no         number(10)      primary key
    ,   id                  varchar2(20)    not null
    ,   category_name       varchar2(50)    not null
    ,   depth               number(3)       not null
    ,   parent              number(3)
    ,   constraint board_category_id_fk foreign key(id)
        references blog(id) on delete cascade
);

create sequence seq_reply_no;
create table reply (
        reply_no    number(5)      primary key
    ,   board_no    number(5)      not null
    ,   id          varchar2(20)   not null    
    ,   content     varchar2(500)  not null    
    ,   depth       number(3)      not null
    ,   parent      number(3)
    ,   reg_date    date           default sysdate
    ,   constraint reply_board_no_fk foreign key(board_no)
        references b_board(board_no) on delete cascade
);

create sequence seq_friend_no;
create table friend (
        friend_no   number(5)      primary key
    ,   id          varchar2(20)   not null    
    ,   friend      varchar2(20)   not null
    ,   reg_date    date           default sysdate
    ,   constraint friend_id_fk foreign key(id)
        references blog(id) on delete cascade
    ,   constraint friend_friend_fk foreign key(friend)
        references blog(id) on delete cascade
);

create sequence seq_friend_req_no;
create table friend_req (
        req_no      number(5)         primary key
    ,   target_id   varchar2(20)   not null    
    ,   req_id      varchar2(20)   not null
    ,   reg_date    date           default sysdate
    ,   constraint req_id_fk foreign key(req_id)
        references blog(id) on delete cascade
    ,   constraint target_id_fk foreign key(target_id)
        references blog(id) on delete cascade
);


select * from b_board;
select * from board_tag;
select * from board_category;
select * from reply;
select * from friend;
select * from friend_req;
select * from blog;

commit;

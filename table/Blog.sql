drop table b_member CASCADE CONSTRAINTS;
drop table blog CASCADE CONSTRAINTS;
drop table b_board CASCADE CONSTRAINTS;
drop table board_tag CASCADE CONSTRAINTS;
drop table board_category CASCADE CONSTRAINTS;
drop table reply CASCADE CONSTRAINTS; 
drop table friend CASCADE CONSTRAINTS;
drop table friend_req CASCADE CONSTRAINTS;

drop sequence seq_b_member_no;
drop sequence seq_blog_no;
drop sequence seq_board_no;
drop sequence seq_tag_no;
drop sequence seq_board_category_no;
drop sequence seq_reply_no;
drop sequence seq_friend_no;
drop sequence seq_friend_req_no;

create sequence seq_b_member_no;
create table b_member (
        id              varchar2(20)    primary key
    ,   id_no           number(5)       
    ,   password        varchar2(30)    not null
);

create sequence seq_blog_no;
create table blog (
        id              varchar2(20)    primary key
    ,   blog_no         number(5)       
    ,   visit_today     number(5)       default 0
    ,   visit_total     number(5)       default 0
    ,   reg_date        date            default sysdate
    ,   constraint blog_id_fk foreign key(id)
        references b_member(id) on delete cascade
);
create sequence seq_board_no ;
create table b_board (
        id              varchar2(20)    not null
    ,   board_no        number(5)       primary key
    ,   title           varchar2(2000)  not null
    ,   content         varchar2(4000)  not null
    ,   tag             varchar2(63)    
    ,   category_name   varchar2(100)   not null
    ,   view_cnt        number(5)       default 0
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
    ,   depth               number(3)       default 0
    ,   parent              number(3)       default null
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

-----------------------------------------------------------------------------------------------
--------------------------------- ID -----------------------------------------------------
-----------------------------------------------------------------------------------------------
insert into b_member(id, id_no, password) values('qrtz7950', seq_b_member_no.nextval, 'qrtz7950');
insert into b_member(id, id_no, password) values('bmkwak22', seq_b_member_no.nextval, 'bmkwak22');
insert into b_member(id, id_no, password) values('asrbtjd', seq_b_member_no.nextval, 'asrbtjd');

-----------------------------------------------------------------------------------------------
--------------------------------- blog --------------------------------------------------------
-----------------------------------------------------------------------------------------------

select id, blog_no,visit_today, visit_total, reg_date from blog;

insert into blog(id, blog_no) values('qrtz7950', seq_blog_no.nextval);
insert into blog(id, blog_no) values('asrbtjd', seq_blog_no.nextval);
insert into blog(id, blog_no) values('bmkwak22', seq_blog_no.nextval);

-----------------------------------------------------------------------------------------------
--------------------------------- B_BOARD -----------------------------------------------------
-----------------------------------------------------------------------------------------------

select id, board_no, title, content, tag, category_name, view_cnt, like_cnt, reg_date from b_board;

<<<<<<< HEAD
insert into b_board(id, board_no, title, content, tag, category_name) values ('qrtz7950', seq_board_no.nextval,'안녕', '하세요', '#매워매워','잡담');
insert into b_board(id, board_no, title, content, tag, category_name) values ('qrtz7950', seq_board_no.nextval,'너도', '안녕', '#매워매워','잡담');
insert into b_board(id, board_no, title, content, tag, category_name) values ('asrbtjd', seq_board_no.nextval,'나도', '안녕', '#매워매워','잡담');
insert into b_board(id, board_no, title, content, tag, category_name) values ('asrbtjd', seq_board_no.nextval,'녕안', '하하', '#매워매워','잡담');
insert into b_board(id, board_no, title, content, tag, category_name) values ('bmkwak22', seq_board_no.nextval,'안녕', '호호', '#매워매워','잡담');
insert into b_board(id, board_no, title, content, tag, category_name) values ('bmkwak22', seq_board_no.nextval,'녕안', '히히', '#매워매워','잡담');
=======
insert into b_board(id, board_no, title, content, tag, category_name) values ('qrtz7950', seq_board_no.nextval,'�븞�뀞', '�븯�꽭�슂', '#留ㅼ썙留ㅼ썙','�옟�떞');
insert into b_board(id, board_no, title, content, tag, category_name) values ('qrtz7950', seq_board_no.nextval,'�꼫�룄', '�븞�뀞', '#留ㅼ썙留ㅼ썙','�옟�떞');
insert into b_board(id, board_no, title, content, tag, category_name) values ('asrbtjd', seq_board_no.nextval,'�굹�룄', '�븞�뀞', '#留ㅼ썙留ㅼ썙','�옟�떞');
insert into b_board(id, board_no, title, content, tag, category_name) values ('asrbtjd', seq_board_no.nextval,'�뀞�븞', '�븯�븯', '#留ㅼ썙留ㅼ썙','�옟�떞');
insert into b_board(id, board_no, title, content, tag, category_name) values ('bmkwak22', seq_board_no.nextval,'�븞�뀞', '�샇�샇', '#留ㅼ썙留ㅼ썙','�옟�떞');
insert into b_board(id, board_no, title, content, tag, category_name) values ('bmkwak22', seq_board_no.nextval,'�뀞�븞', '�엳�엳', '#留ㅼ썙留ㅼ썙','�옟�떞');
>>>>>>> origin/master

-----------------------------------------------------------------------------------------------
--------------------------------- board_category ----------------------------------------------
-----------------------------------------------------------------------------------------------

select category_no, id, category_name, depth, parent from board_category;

<<<<<<< HEAD
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'qrtz7950', '잡담', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'qrtz7950', '일상', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'qrtz7950', '사건', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'qrtz7950', '카테고리', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'bmkwak22', '잡담', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'bmkwak22', '일상', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'bmkwak22', '사건', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'bmkwak22', '카테고리', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'asrbtjd', '잡담', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'asrbtjd', '일상', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'asrbtjd', '사건', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'asrbtjd', '카테고리', 0);
=======
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'qrtz7950', '�옟�떞', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'qrtz7950', '�씪�긽', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'qrtz7950', '�궗嫄�', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'qrtz7950', '移댄뀒怨좊━', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'bmkwak22', '�옟�떞', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'bmkwak22', '�씪�긽', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'bmkwak22', '�궗嫄�', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'bmkwak22', '移댄뀒怨좊━', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'asrbtjd', '�옟�떞', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'asrbtjd', '�씪�긽', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'asrbtjd', '�궗嫄�', 0);
insert into board_category(category_no, id, category_name, depth) values(seq_board_category_no.nextval, 'asrbtjd', '移댄뀒怨좊━', 0);
>>>>>>> origin/master

-----------------------------------------------------------------------------------------------
--------------------------------- board_reply -------------------------------------------------
-----------------------------------------------------------------------------------------------

select reply_no, board_no, id, content, depth, parent, reg_date from reply;

<<<<<<< HEAD
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 1, 'qrtz7950', '하하하하하하ㅏ', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 1, 'qrtz7950', '하하하하하하ㅏ', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 1, 'qrtz7950', '하하하하하하ㅏ', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 2, 'bmkwak22', '하하하하하하ㅏ', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 2, 'bmkwak22', '하하하하하하ㅏ', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 2, 'bmkwak22', '하하하하하하ㅏ', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 3, 'asrbtjd', '하하하하하하ㅏ', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 3, 'asrbtjd', '하하하하하하ㅏ', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 3, 'asrbtjd', '하하하하하하ㅏ', 0);
=======
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 1, 'qrtz7950', '�븯�븯�븯�븯�븯�븯�뀖', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 1, 'qrtz7950', '�븯�븯�븯�븯�븯�븯�뀖', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 1, 'qrtz7950', '�븯�븯�븯�븯�븯�븯�뀖', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 2, 'bmkwak22', '�븯�븯�븯�븯�븯�븯�뀖', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 2, 'bmkwak22', '�븯�븯�븯�븯�븯�븯�뀖', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 2, 'bmkwak22', '�븯�븯�븯�븯�븯�븯�뀖', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 3, 'asrbtjd', '�븯�븯�븯�븯�븯�븯�뀖', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 3, 'asrbtjd', '�븯�븯�븯�븯�븯�븯�뀖', 0);
insert into reply(reply_no, board_no, id, content, depth) values(seq_reply_no.nextval, 3, 'asrbtjd', '�븯�븯�븯�븯�븯�븯�뀖', 0);
>>>>>>> origin/master

-----------------------------------------------------------------------------------------------
--------------------------------- friend -----------------------------------------------------
-----------------------------------------------------------------------------------------------

select friend_no, id, friend, reg_date from friend;

insert into friend(friend_no, id, friend) values(seq_friend_no.nextval, 'qrtz7950', 'asrbtjd');
insert into friend(friend_no, id, friend) values(seq_friend_no.nextval, 'asrbtjd', 'qrtz7950');

-----------------------------------------------------------------------------------------------
--------------------------------- friend_req --------------------------------------------------
-----------------------------------------------------------------------------------------------

select req_no, target_id, req_id, reg_date from friend_req;

insert into friend_req(req_no, target_id, req_id) values(seq_friend_req_no.nextval, 'bmkwak22', 'qrtz7950');
insert into friend_req(req_no, target_id, req_id) values(seq_friend_req_no.nextval, 'bmkwak22', 'asrbtjd');

select * from b_member;
select * from b_board;
select * from board_tag;
select * from board_category;
select * from reply;
select * from friend;
select * from friend_req;
select * from blog;

commit;
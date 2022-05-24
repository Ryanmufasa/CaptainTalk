drop table member;
drop table chrlist;

drop sequence member_seq;
drop sequence chrlist_seq;
purge RECYCLEBIN;

create table member(
mem_no number,
mem_id varchar2(20) not null unique,
mem_password varchar2(20) not null,
mem_name varchar2(20) not null,
mem_tel1 number,
mem_tel2 number,
mem_tel3 number,
mem_sex number check(mem_sex in(0,1,2)),
mem_birthday date,
mem_email varchar2(30) unique,
mem_region varchar2(20),
mem_memo varchar2(60),
constraint mem_no_pk primary key(mem_no)
);


create table follow(
fol_id number not null primary key,
mem_no number not null, 
    constraint fol_mem_no_fk foreign key (mem_no) references member(mem_no),
target_mem_no number not null,
fol_datetime date default sysdate
);

create table chat(
ch_id number not null primary key,
ch_title varchar2(30) not null
);

create sequence member_seq NOCACHE;
create sequence follew_seq nocache;
create sequence chat_seq nocache;

insert into member(mem_no, mem_id, mem_password, mem_name, mem_tel1, mem_tel2, mem_tel3, mem_sex)
values(member_seq.nextval, 'admin', 'admin', '包府磊', '010','0000','0000', '2'); 
insert into member(mem_no, mem_id, mem_password, mem_name, mem_tel1, mem_tel2, mem_tel3, mem_sex)
values(member_seq.nextval, 'test01', 'test01', '蜡历1', '010','1111','1111', '1');
insert into member(mem_no, mem_id, mem_password, mem_name, mem_tel1, mem_tel2, mem_tel3, mem_sex)
values(member_seq.nextval, 'test02', 'test02', '蜡历2', '010','2222','2222','0');
insert into member(mem_no, mem_id, mem_password, mem_name, mem_tel1, mem_tel2, mem_tel3, mem_sex) 
values(member_seq.nextval, 'test03', 'test03', '蜡历3', '010','3333','3333','1');
insert into member(mem_no, mem_id, mem_password, mem_name, mem_tel1, mem_tel2, mem_tel3, mem_sex) 
values(member_seq.nextval, 'test04', 'test04', '蜡历4', '010','4444','4444','0');


commit;

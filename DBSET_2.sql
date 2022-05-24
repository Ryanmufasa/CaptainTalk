delete member;

alter table member drop (mem_sex, mem_birthday, mem_email, mem_region, mem_memo);
purge RECYCLEBIN;

create table memberinfo(
mem_no number not null,
    constraint info_mem_no_fk foreign key (mem_no) references member(mem_no),
mem_sex number check(mem_sex in(0,1,2)),
mem_birthday date,
mem_email varchar2(30) unique,
mem_region varchar2(20),
mem_memo varchar2(60)
);

insert into member values(member_seq.nextval, 'admin', 'admin', '관리자', '010','0000','0000');
insert into member values(member_seq.nextval, 'test01', 'test01', '유저1', '010','1111','1111');
insert into member values(member_seq.nextval, 'test02', 'test02', '유저2', '010','2222','2222');
insert into member values(member_seq.nextval, 'test03', 'test03', '유저3', '010','3333','3333');
insert into member values(member_seq.nextval, 'test04', 'test04', '유저4', '010','4444','4444');

commit;

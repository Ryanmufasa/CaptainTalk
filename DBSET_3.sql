delete member;
purge RECYCLEBIN;

alter table member modify mem_tel1 varchar2(4);
alter table member modify mem_tel2 varchar2(4);
alter table member modify mem_tel3 varchar2(4);


insert into member values(member_seq.nextval, 'admin', 'admin', '관리자', '010','0000','0000');
insert into member values(member_seq.nextval, 'test01', 'test01', '유저1', '010','1111','1111');
insert into member values(member_seq.nextval, 'test02', 'test02', '유저2', '010','2222','2222');
insert into member values(member_seq.nextval, 'test03', 'test03', '유저3', '010','3333','3333');
insert into member values(member_seq.nextval, 'test04', 'test04', '유저4', '010','4444','4444');

commit;
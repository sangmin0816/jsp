USE sangmin;

CREATE TABLE notice(
no INT PRIMARY KEY AUTO_INCREMENT, 
title varchar(200) not NULL, 
content varchar(1000),
regdate timestamp default current_timestamp,
visited integer default 0);

insert into notice(title, content) VALUES("제목1", "내용1");
insert into notice(title, content) VALUES("제목2", "내용2");
insert into notice(title, content) VALUES("제목3", "내용3");

COMMIT;
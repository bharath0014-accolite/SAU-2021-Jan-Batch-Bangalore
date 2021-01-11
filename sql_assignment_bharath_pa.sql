
create database db_assign_bharath;
use db_assign_bharath;
create table team( team_id int, no_of_matches_played int, no_of_runs int, primary key(team_id));
insert into team values(1,3,400);
insert into team values(2,3,300);
insert into team values(3,3,200);
insert into team values(4,3,100);

create table player(player_id int, team_id int, runs_scored int, wickets_taken int,player_name varchar(10), primary key(player_id), foreign key(team_id) references team(team_id));
insert into player values (1,1,80,4,'p11');
insert into player values (2,1,80,4,'p12');
insert into player values (3,1,80,4,'p13');
insert into player values (4,1,80,4,'p14');
insert into player values (5,1,80,4,'p15');
 
insert into player values (6,2,60,3,'p21');
insert into player values (7,2,60,3,'p22');
insert into player values (8,2,60,3,'p23');
insert into player values (9,2,60,3,'p24');
insert into player values (10,2,60,3,'p25');
 
insert into player values (11,3,40,2,'p31');
insert into player values (12,3,40,2,'p32');
insert into player values (13,3,40,2,'p33');
insert into player values (14,3,40,2,'p34');
insert into player values (15,3,40,2,'p35');

insert into player values (16,4,20,1,'p41');
insert into player values (17,4,20,1,'p42');
insert into player values (18,4,20,1,'p43');
insert into player values (19,4,20,1,'p44');
insert into player values (20,4,20,1,'p45');

select * from (
select player_name, runs_scored
from player order by runs_scored desc 
) as t limit 5;

select * from (
select player_name, wickets_taken
from player order by wickets_taken desc 
) as t1 limit 5;

select team_id,no_of_runs/no_of_matches_played as pslayed from team;

UPDATE player SET runs_scored=runs_scored+10
WHERE team_id=(SELECT team_id FROM team
GROUP BY team_id order by no_of_runs/no_of_matches_played limit 1);
select runs_scored from player;

delimiter //
create procedure highest(out h1 varchar(10), in country_name int)
begin
select max(runs_scored) into h1 from player where team_id=country_name;
end; //

call highest(@highest_score_for_that_team,1);
select @highest_score_for_that_team;






 


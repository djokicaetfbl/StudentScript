ALTER TABLE fakultet AUTO_INCREMENT = 1;
ALTER TABLE korisnicka_grupa AUTO_INCREMENT = 1;
ALTER TABLE korisnik AUTO_INCREMENT = 1;
ALTER TABLE mjesto AUTO_INCREMENT = 1;
ALTER TABLE odgovor AUTO_INCREMENT = 1;
ALTER TABLE pitanje AUTO_INCREMENT = 1;
ALTER TABLE predmet AUTO_INCREMENT = 1;
ALTER TABLE rezultat_testa AUTO_INCREMENT = 1;
ALTER TABLE sistemske_osobine AUTO_INCREMENT = 1;
ALTER TABLE studijski_program AUTO_INCREMENT = 1;
ALTER TABLE test AUTO_INCREMENT = 1;

insert into korisnicka_grupa values(0,"admin","admin",1);
insert into korisnicka_grupa values(0,"student","student",1);

/*select * from korisnicka_grupa;*/
/*delete from korisnicka_grupa where idkorisnicka_grupa=3;*/

insert into sistemske_osobine values (0,"Srpski","Standardna",1);
insert into sistemske_osobine values (0,"Srpski","Tamna",1);
insert into sistemske_osobine values (0,"Srpski","TamnoPlava",1);
insert into sistemske_osobine values (0,"Engleski","Standardna",1);
insert into sistemske_osobine values (0,"Engleski","Tamna",1);
insert into sistemske_osobine values (0,"Engleski","TamnoPlava",1);

/*select * from sistemske_osobine;*/

insert into mjesto values (0,"Banja Luka","78000","BiH",1);
insert into mjesto values (0,"Sarajevo","78500","BiH",1);
insert into mjesto values (0,"Mostar","72000","BiH",1);

select * from mjesto;

delete from mjesto where idmjesto = 6;

insert into fakultet values (0,"Elektortehnički","051200300","Patre 5",1,1);
insert into fakultet values (0,"Medicinski","051300300","Centar 2",1,1);
insert into fakultet values (0,"Pravni","051100100","Venecija 10",1,1);

select * from fakultet;

insert into studijski_program values (0,"Računarstvo i informatika",1,1);
insert into studijski_program values (0,"Elektronika i telekomunikacije",1,1);
insert into studijski_program values (0,"Elektroenergetika i automatika",1,1);

insert into studijski_program values (0,"Medicina",2,1);
insert into studijski_program values (0,"Stomatologija",2,1);
insert into studijski_program values (0,"Farmacija",2,1);
insert into studijski_program values (0,"Zdravstvena njega",2,1);

select * from studijski_program;

insert into korisnik values (0,"Djordje","Palavestra","djole","djole",1,"djole@mail.com",1,1,2,true,1);
insert into korisnik values (0,"Ognjen","Roljic","rolja","rolja",1,"rolja@mail.com",1,1,2,true,2);
insert into korisnik values (0,"Miso","Lojic","miso","miso",1,"misoa@mail.com",1,2,5,false,1);

select * from korisnik;
select * from rezultat_testa;
#update korisnik set studijski_program_idstudijski_program =1 where idkorisnik=2;
/*delete from korisnik where idkorisnik=2;*/
#select * from  korisnik;
#delete from studijski_program where idstudijski_program = 8;
#update fakultet set aktivan = 1 where idfakultet = 2;
#update studijski_program set aktivan = 1 where idstudijski_program = 9;
#update predmet set aktivan = 1 where idpredmet=4; 
#select * from predmet;
#select * from predmet;
insert into predmet values(0,"Osnovi računarske tehnike",7,"2221",1,1,1);

#select * from test;

#select * from pitanje ;

#select * from odgovor;

#delete from fakultet where idfakultet = 5;

#select * from test;
#update test set aktivan = 1 where idtest = 1;
#update test set aktivan = 1 where idtest = 2;
#update fakultet set aktivan = 1 where idfakultet = 7;
#update korisnik set aktivan = 1 where idkorisnik = 6;
select * from sistemske_osobine;
select * from korisnik where idkorisnik=1;

select * from korisnicka_grupa;
select * from test;
select * from mjesto;
select * from odgovor;
update odgovor set aktivan = 1 where  idodgovor=99;
select * from pitanje;
update pitanje set aktivan = 1 where idpitanje = 35;
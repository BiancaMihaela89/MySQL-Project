# Cream tabele
create table Produse 
(
IDProdus int not null auto_increment,
NumeProdus varchar(50) not null,
Descriere TEXT not null,
Pret INT,
Stoc INT,
primary key(IDProdus)
);

use MagazinPrajituri;

#modificam tipul unei coloane 
alter table Produse
modify NumeProdus varchar(25);

#selecteaza -afiseaza tabela
select * from Produse;

# descrie structura unui tabel -daca e primary key sau secundara
desc Produse;

create table Clienti 
(
IDClient int not null,
Nume varchar(50) not null,
Prenume varchar(50) not null,
Telefon int,
primary key(IDClient)
);

create table Comenzi
(
IDComanda int not null primary key,
IDClient int not null,
DataComanda date,
totalComanda int
);

#stergem coloana
alter table Comenzi 
drop IDClient;

#adaugam coloana  
alter table Comenzi
add column IDClient int not null;

alter table Comenzi
add foreign key (IDClient) references Clienti(IDClient);

desc Comenzi;

#modifica numele unei coloane 
 alter table Comenzi 
 change totalComanda FinalComanda int;
 
 create table DEtaliiComanda
(
IDDetaliuComanda int not null primary key,
IDComanda int not null,
IDProdus int not null,
Cantitate int
);

# adaugare de chei straine-facem legatura
alter table DEtaliiComanda
add foreign key(IDComanda) references Comenzi(IDComanda);

alter table DEtaliiComanda
add foreign key(IDProdus) references Produse(IDProdus);

# redenumirea numelui unei tabele 
rename table DEtaliiComanda to DescriereComanda;

# sterge o coloana din tabel
 alter table DescriereComanda
 drop column Cantitate;
 
  #adaugam coloane in tabela ADD
 alter table DescriereComanda
 add Cantitate int;
 
 #inseram date in tabele
select * from Clienti;

insert into Clienti (IDClient, Nume, Prenume, Telefon) values
(1,'Andreea', 'Popescu', 0765435111),
(2, 'Ioana', 'Spataru', 0731235112),
(3, 'Simona', 'Ionescu', 0765435113),
(4, 'Alex', 'Popa', 07654114),
(5, 'Liviu', 'Mocanu', 0765435115);

select * from Comenzi;

insert into Comenzi (IDComanda, DataComanda,FinalComanda,IDClient) values
(6,'2023-01-11',10, 1),
(7,'2023-02-22',20, 2),
(8,'2023-03-03',30, 3),
(9,'2023-04-04',40, 4),
(10,'2023-05-05',50, 5);

select * from Produse;

insert into Produse (IDProdus, NumeProdus,Descriere,Pret,Stoc) values
(11,'Eclere','Ciocolata', 10,100),
(12,'Briose','Vanilie', 5, 200),
(13,'Tiramisu','Cafea', 15, 50);

alter table Produse
add column DataExpirare date;

alter table Produse
drop DataExpirare;


select * from DescriereComanda;
insert into DescriereComanda (IDDetaliuComanda, IDComanda,IDProdus,Cantitate) values
(14, 6, 11, 10),
(15, 7, 12, 50),
(16, 8, 13, 10),
(17, 9, 12, 5),
(18, 10, 11, 15);

# Afisati toate datele pentru eclere
select * from Produse where NumeProdus='Eclere';

# Afisati toate datele pentru produsul cu id 
select * from Produse where IDProdus=11;
  
select * from Clienti where IDClient=5; 
  
#afisati numele tuturor produselor
select NumeProdus from Produse;

# afisati numele produselor al caror stoc este mai mare de 10
 select NumeProdus from Produse where stoc> 10;
 
 # afisam ce produse avem in afara de eclere
 select * from Produse where NumeProdus != eclere;
 
 #afisam clientii care nu se numesc ionescu si care au cifra 1 in nr tel
select * from Clienti where Prenume != 'Ionescu' and Telefon like '%1%';


#afisam produse folosind paranteze sa prioritizam
select * from Produse;

select * from Produse
where (NumeProdus like 'Tiramisu'
or Descriere like 'Vanilie')
and Pret > 5;

#folosim sum/avg/ min/max
select * from Produse;
select sum(Pret) from Produse;
select avg(Stoc) from Produse;
select min(Pret)from Produse;
select max(Stoc)from Produse;

#inseram valori noi
select * from Produse; 
insert into Produse (IDProdus, NumeProdus, Descriere, Pret, Stoc) values
(21,'Tort','Ananas', 25, 30),
(22,'Amandine','Rom', 7, 500);

#update coloane
 update Produse
 set Stoc=400
 where IDProdus=22;

 delete from Produse
 where IDProdus=22;
 
  # afisati numele clientilor si data comenzii
  select Clienti.Nume, Comenzi.DataComanda
  from Clienti inner join Comenzi
  on Clienti.IDClient=Comenzi.IDClient;
  
  #afisati numele cientilor, telefonul  si data comenzii
  select Clienti.Nume, Clienti.Telefon, Comenzi.DataComanda
  from Clienti inner join Comenzi
  on Clienti.IDClient=Comenzi.IDClient;
 
 #afisati numele cientilor,  data comenzii si cantitatea
  select Clienti.Nume, Comenzi.DataComanda, DescriereComanda.Cantitate
  from Clienti inner join Comenzi inner join DescriereComanda 
  on Clienti.IDClient=Comenzi.IDClient and Comenzi.IDComanda=DescriereComanda.IDComanda;

 #afisati numele cientilor,  data comenzii, produsul si cantitatea
  select Clienti.Nume, Comenzi.DataComanda, DescriereComanda.Cantitate, Produse.NumeProdus
  from Clienti inner join Comenzi inner join DescriereComanda inner join Produse
  on Clienti.IDClient=Comenzi.IDClient and Comenzi.IDComanda=DescriereComanda.IDComanda and DescriereComanda.IDProdus=Produse.IDProdus;


#adaugam coloana in produse si valori
select * from Produse;
alter table Produse
add column DataExpirare date;

 update Produse
 set DataExpirare='2023-12-12'
 where IDProdus=11;
 

 update Produse
 set DataExpirare='2023-12-12'
 where IDProdus=12;
  
 update Produse
 set DataExpirare='2023-12-12'
 where IDProdus=13;

 update Produse
 set DataExpirare='2023-12-12'
 where IDProdus=21;

#afisati Produsele,stocul, data expirarii,  cantitatea si  numele clientului 
  select Produse.NumeProdus, Produse.Stoc, Produse.DataExpirare, DescriereComanda.Cantitate, Clienti.Nume
  from Produse inner join DescriereComanda inner join Comenzi inner join Clienti
  on Produse.IDProdus=DescriereComanda.IDProdus and DescriereComanda.IDComanda=Comenzi.IDComanda and Comenzi.IDClient=Clienti.IDClient;

# solicitam date din doua tabele intre care nu exista o legatura. nu va returna nimic
select Produse.NumeProdus, Clienti.Nume
from Produse inner join Clienti
on Produse.IDProdus=Clienti.IDClient;

#afisati date folosind  inner join/ left join/ right/cross

select Produse.NumeProdus,DescriereComanda.Cantitate
from Produse inner join DescriereComanda
on Produse.IDProdus=DescriereComanda.IDPRodus;

select Comenzi.DataComanda, Clienti.Prenume, Clienti.Telefon
from Comenzi left join Clienti
on Comenzi.IDClient=Clienti.IDClient;
  
select Produse.NumeProdus,DescriereComanda.Cantitate
from Produse cross join  DescriereComanda
on Produse.IDProdus=DescriereComanda.IDPRodus; 

select DescriereComanda.Cantitate, Produse.Pret, Produse.Stoc
from DescriereComanda right join  Produse 
on DescriereComanda.IDPRodus=Produse.IDProdus;
  

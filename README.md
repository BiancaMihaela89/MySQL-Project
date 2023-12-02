# MySQL-Project-Magazin de Prajituri
### Numele meu este Bianca si sunt cursant la IT Factory la cursul Testare manuala-Testare automata.
## Generalitati
Am creat o baza de date denumita "Magazin Prajituri" ,care contine un numar de patru tabele, pentru care am setat primary key si foreign key pentru a crea legaturi intre tabele, dupa cum urmeaza:

| Produse | Clienti    | Comenzi| DescriereComanda |
| :-----: | :---: | :---:  |:---: |
| PK IDProdus| PK IDClient | PK IDComanda |PK IDDetaliuComanda|
| NumeProdus| Nume |  DataComanda |FK IDComanda|
| Descriere| Prenume  | FinalComanda |FK IDProdus|
| Pret| Telefon | FK IDClient |Cantitate|
| Stoc|          |       |               |
| DataExpirare|    |      |    |



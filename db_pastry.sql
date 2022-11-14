DROP TABLE bonuri_fiscale;
DROP TABLE linii_comanda;
DROP TABLE angajati;
DROP TABLE clienti;
DROP TABLE comenzi;
DROP TABLE registre;
DROP TABLE linii_lista_ingrediente;
DROP TABLE ingrediente;
DROP TABLE produse;

   CREATE TABLE produse(
   id_produs NUMBER(20) NOT NULL,
   denumire_produs VARCHAR(50) NOT NULL,
   pret_produs NUMBER(20) NOT NULL,
   PRIMARY KEY (id_produs)
    );
    
   CREATE TABLE angajati(
   id_angajat NUMBER(30) NOT NULL,
   nume_angajat VARCHAR(50) NOT NULL,
   prenume_angajat VARCHAR(50) NOT NULL,
   data_nastere_angajat DATE NOT NULL,
   specializare_angajat VARCHAR(50) NOT NULL,
   salariu_angajat NUMBER(30) NOT NULL,
   adresa_angajat VARCHAR(100) NOT NULL,
   email_angajat VARCHAR(50) NOT NULL,
   nr_telefon_angajat NUMBER(20) NOT NULL,
   data_angajarii DATE NOT NULL,
   PRIMARY KEY (id_angajat)
   );

CREATE TABLE clienti(
   id_client NUMBER(15) NOT NULL,
   nume_client VARCHAR(50) NOT NULL,
   prenume_client VARCHAR(50) NOT NULL,
   adresa_client VARCHAR(100) NOT NULL,
   nr_telefon_client NUMBER(20) NOT NULL,
   email_client VARCHAR(50) NOT NULL,
   PRIMARY KEY (id_client)
   );  
   
   CREATE TABLE comenzi(
   id_comanda NUMBER(15) NOT NULL,
   data_plasarii DATE NOT NULL,
   data_livrarii DATE NOT NULL,
   valoare_comanda NUMBER(15) NOT NULL,
   PRIMARY KEY (id_comanda)   
   );
   
   CREATE TABLE linii_comanda(
   id_linie NUMBER(15) NOT NULL,
   nr_bucati NUMBER(15) NOT NULL,
   id_produs NUMBER(20) NOT NULL,
   id_comanda NUMBER(20) NOT NULL,   
   PRIMARY KEY (id_linie),
   FOREIGN KEY (id_produs)  references produse (id_produs),
   FOREIGN KEY (id_comanda)  references comenzi (id_comanda)  
   );

CREATE TABLE registre(
   id_registru NUMBER(15) NOT NULL,
   venit_zilnic NUMBER(15) NOT NULL,
   data_venit DATE NOT NULL,
   PRIMARY KEY (id_registru)
   );
   
   CREATE TABLE bonuri_fiscale(
   id_bon_fiscal NUMBER(15) NOT NULL,
   id_angajat NUMBER(20) NOT NULL,  
   id_client NUMBER(20) NOT NULL,  
   id_registru NUMBER(20) NOT NULL,  
   PRIMARY KEY (id_bon_fiscal),
   FOREIGN KEY (id_angajat) references angajati (id_angajat),
   FOREIGN KEY (id_client) references clienti (id_client),
   FOREIGN KEY (id_registru) references registre (id_registru)
   );
   
   CREATE TABLE ingrediente(
   id_ingredient NUMBER(15) NOT NULL,
   denumire_ingredient VARCHAR(25) NOT NULL,
   loc_de_provenienta VARCHAR(25) NOT NULL,
   PRIMARY KEY (id_ingredient));
   
   CREATE TABLE linii_lista_ingrediente(
   id_linie_ingrediente NUMBER(15) NOT NULL,
   id_ingredient NUMBER(15) NOT NULL,
   id_produs NUMBER(15) NOT NULL,
   PRIMARY KEY (id_linie_ingrediente),
   FOREIGN KEY (id_ingredient) references ingrediente (id_ingredient),
   FOREIGN KEY (id_produs) references produse (id_produs)
   );





   DROP TABLE liste_piese_auto;
   DROP TABLE piese_auto; 
   DROP TABLE mecanici_auto;
   DROP TABLE serviceuri_auto;
   DROP TABLE clienti;
   DROP TABLE contracte; 
   DROP TABLE angajati;
   DROP TABLE departamente;
   DROP TABLE asigurari;
   DROP TABLE reprezentanti_asigurari;
   DROP TABLE garantii;
   DROP TABLE inmatriculari;
   DROP TABLE distribuitori_piese_auto;
   DROP TABLE sedii;
   DROP TABLE companii_asigurari;
   DROP TABLE masini;
    

    
    
    
    CREATE TABLE masini(
    cod_masina NUMBER(15) NOT NULL,
    marca VARCHAR2(50) NOT NULL,
    model VARCHAR2(50) NOT NULL,
    culoare VARCHAR2(50) NOT NULL,
    stoc NUMBER(10) NOT NULL,
    pret_masina NUMBER(10) NOT NULL,
    PRIMARY KEY (cod_masina)
    );
   
   CREATE TABLE companii_asigurari(
   id_companie_asigurari NUMBER(10) NOT NULL,
   nume_companie_asigurari VARCHAR(50) NOT NULL,
   telefon_companie_asigurari NUMBER(10) NOT NULL,
   PRIMARY KEY (id_companie_asigurari)
   );
  
  
   CREATE TABLE sedii(
   id_sediu NUMBER(15) NOT NULL,
   cod_postal NUMBER(10) NOT NULL,
   telefon_sediu NUMBER(20) NOT NULL,
   adresa_sediu VARCHAR(100) NOT NULL,
   PRIMARY KEY (id_sediu)
   );
   
   CREATE TABLE distribuitori_piese_auto(
   cod_distribuitor NUMBER(15) NOT NULL,
   nume_distribuitor VARCHAR(50) NOT NULL,
   adresa_distribuitor VARCHAR(100) NOT NULL,
   telefon_distribuitor NUMBER(20) NOT NULL,
   email_distribuitor VARCHAR(50) NOT NULL,
   PRIMARY KEY (cod_distribuitor)
   );
   
   CREATE TABLE inmatriculari(
   cod_masina NUMBER(15) NOT NULL,
   cod_inmatriculare VARCHAR(10) NOT NULL,
   serie_sasiu VARCHAR(50) NOT NULL,
   nume_proprietar_nou VARCHAR(50) NOT NULL,
   prenume_proprietar_nou VARCHAR(50) NOT NULL,
   PRIMARY KEY(cod_inmatriculare),
   FOREIGN KEY (cod_masina)  references masini (cod_masina) 
   );
       
       
   CREATE TABLE garantii(
   cod_masina NUMBER(15) NOT NULL,
   cod_garantie NUMBER (10) NOT NULL,
   data_incepere_garantie DATE NOT NULL, 
   data_sfarsit_garantie DATE NOT NULL,
   tip_garantie VARCHAR(50) NOT NULL,
   PRIMARY KEY(cod_garantie),
   FOREIGN KEY (cod_masina) references masini (cod_masina) 
   );
   
   CREATE TABLE reprezentanti_asigurari(
   id_companie_asigurari NUMBER(30) NOT NULL,
   id_reprezentant_asigurari NUMBER(30) NOT NULL,
   nume_reprezentant VARCHAR(50) NOT NULL,
   prenume_reprezentant VARCHAR(50) NOT NULL,
   nr_telefon_reprezentant NUMBER(15) NOT NULL,
   email_reprezentant VARCHAR(100) NOT NULL,  
   PRIMARY KEY(id_reprezentant_asigurari),
   FOREIGN KEY (id_companie_asigurari) references companii_asigurari (id_companie_asigurari)    
   );
       
   CREATE TABLE asigurari(
   id_reprezentant_asigurari NUMBER(30) NOT NULL,  
   cod_asigurare NUMBER(30) NOT NULL,
   valoare_asigurare NUMBER(30) NOT NULL,
   tip_asigurare VARCHAR(50) NOT NULL,
   PRIMARY KEY(cod_asigurare),
   FOREIGN KEY (id_reprezentant_asigurari) references reprezentanti_asigurari (id_reprezentant_asigurari)
   );
   
   CREATE TABLE departamente(
   id_sediu NUMBER(15) NOT NULL,
   id_departament NUMBER(15) NOT NULL,
   nume_departament VARCHAR(50) NOT NULL,
   PRIMARY KEY (id_departament),
   FOREIGN KEY (id_sediu) references sedii (id_sediu)
   );    
   
   CREATE TABLE angajati(
   id_departament NUMBER(15) NOT NULL,
   id_angajat NUMBER(30) NOT NULL,
   nume_angajat VARCHAR(50) NOT NULL,
   prenume_angajat VARCHAR(50) NOT NULL,
   salariu_angajat NUMBER(30) NOT NULL,
   adresa_angajat VARCHAR(100) NOT NULL,
   email_angajat VARCHAR(50) NOT NULL,
   nr_telefon_angajat NUMBER(20) NOT NULL,
   PRIMARY KEY (id_angajat),
   FOREIGN KEY (id_departament) references departamente (id_departament)
   );
   
   CREATE TABLE contracte(
   id_angajat NUMBER(30) NOT NULL,
   cod_contract NUMBER(15) NOT NULL,
   data_contract DATE NOT NULL,
   PRIMARY KEY (cod_contract),
   FOREIGN KEY (id_angajat)  references angajati (id_angajat)  
   );
   
   CREATE TABLE clienti(
   cod_contract NUMBER(15) NOT NULL,
   cod_client NUMBER(15) NOT NULL,
   nume_client VARCHAR(50) NOT NULL,
   prenume_client VARCHAR(50) NOT NULL,
   adresa_client VARCHAR(100) NOT NULL,
   nr_telefon_client NUMBER(20) NOT NULL,
   email_client VARCHAR(50) NOT NULL,
   PRIMARY KEY (cod_client),
   FOREIGN KEY (cod_contract) references contracte (cod_contract)
   );  
   
   
   
   CREATE TABLE serviceuri_auto(
   id_sediu NUMBER(15) NOT NULL,
   cod_service_auto NUMBER(15) NOT NULL,
   tip_service_auto VARCHAR(50) NOT NULL,
   pret_service_auto NUMBER(10) NOT NULL,
   PRIMARY KEY (cod_service_auto),
   FOREIGN KEY (id_sediu) references sedii (id_sediu)
   );
   
   CREATE TABLE mecanici_auto(
   cod_service_auto NUMBER(15) NOT NULL,
   id_mecanic_auto NUMBER(15) NOT NULL,
   nume_mecanic VARCHAR(50) NOT NULL,
   prenume_mecanic VARCHAR(100) NOT NULL,
   nr_telefon_mecanic NUMBER(20) NOT NULL,
   email_mecanic VARCHAR(50) NOT NULL,
   PRIMARY KEY (id_mecanic_auto),
   FOREIGN KEY (cod_service_auto) references serviceuri_auto (cod_service_auto)
   );
   
   
   CREATE TABLE piese_auto (
   cod_distribuitor NUMBER(15) NOT NULL,
   id_piesa_auto NUMBER(15) NOT NULL,
   firma_piesa_auto VARCHAR(50) NOT NULL,
   tip_piesa_auto VARCHAR(50) NOT NULL,
   stoc_piesa_auto NUMBER(10) NOT NULL,
   pret_piesa_auto NUMBER(15) NOT NULL,
   PRIMARY KEY (id_piesa_auto),
   FOREIGN KEY (cod_distribuitor) references distribuitori_piese_auto (cod_distribuitor)
   );
   
   CREATE TABLE liste_piese_auto(
   id_mecanic_auto NUMBER(15) NOT NULL,
   id_piesa_auto NUMBER(15) NOT NULL,
   cod_lista_piese_auto NUMBER(10) NOT NULL,
   nr_piese_auto_achizitionate NUMBER(10) NOT NULL,
   PRIMARY KEY (cod_lista_piese_auto),
   FOREIGN KEY (id_mecanic_auto) references mecanici_auto (id_mecanic_auto),
   FOREIGN KEY (id_piesa_auto) references piese_auto (id_piesa_auto)
   );
   
   
   
   
   
   
   INSERT INTO masini (cod_masina, marca, model, culoare, stoc, pret_masina)
   VALUES (1,'Ford','Fiesta','Albastru',1,50000);
   
   INSERT INTO masini (cod_masina, marca, model, culoare, stoc, pret_masina)
   VALUES (2,'Opel','Astra','Gri',5,19500);
   
   INSERT INTO masini (cod_masina, marca, model, culoare, stoc, pret_masina)
   VALUES (3,'BMW','X6','Roz',7,40000);
   
   INSERT INTO masini (cod_masina, marca, model, culoare, stoc, pret_masina)
   VALUES (4,'Toyota','CHR','Galben',3,12000);
   
   INSERT INTO masini (cod_masina, marca, model, culoare, stoc, pret_masina)
   VALUES (5,'Mazda','Model','Rosu',10,15005);
   

   
   INSERT INTO inmatriculari (cod_masina,cod_inmatriculare,serie_sasiu,nume_proprietar_nou,prenume_proprietar_nou)
   VALUES ('1','23153','400023','Guse','Bobert');
   
   INSERT INTO inmatriculari (cod_masina,cod_inmatriculare,serie_sasiu,nume_proprietar_nou,prenume_proprietar_nou)
   VALUES ('2','35413','120004','Disu','Mioara');
   
   INSERT INTO inmatriculari (cod_masina,cod_inmatriculare,serie_sasiu,nume_proprietar_nou,prenume_proprietar_nou)
   VALUES ('3','65435','684654','Mytrake','Alcesandra');
   
   INSERT INTO inmatriculari (cod_masina,cod_inmatriculare,serie_sasiu,nume_proprietar_nou,prenume_proprietar_nou)
   VALUES ('4','64321','257644','Poorsafir','Anaita');
   
   INSERT INTO inmatriculari (cod_masina,cod_inmatriculare,serie_sasiu,nume_proprietar_nou,prenume_proprietar_nou)
   VALUES ('5','35431','434235','Popeku','Mariahh');
   
   
   INSERT INTO garantii (cod_masina,cod_garantie,data_incepere_garantie,data_sfarsit_garantie,tip_garantie)
   VALUES ('1','3179',TO_DATE('22/03/2022', 'dd/mm/yyyy'),TO_DATE('02/04/2024', 'dd/mm/yyyy'), 2);
   
   INSERT INTO garantii (cod_masina,cod_garantie,data_incepere_garantie,data_sfarsit_garantie,tip_garantie)
   VALUES ('2','5359',TO_DATE('23/02/2022', 'dd/mm/yyyy'),TO_DATE('23/04/2024', 'dd/mm/yyyy'), 1);
   
   INSERT INTO garantii (cod_masina,cod_garantie,data_incepere_garantie,data_sfarsit_garantie,tip_garantie)
   VALUES ('3','1355',TO_DATE('20/03/2022', 'dd/mm/yyyy'),TO_DATE('29/10/2023', 'dd/mm/yyyy'), 3);
   
   INSERT INTO garantii (cod_masina,cod_garantie,data_incepere_garantie,data_sfarsit_garantie,tip_garantie)
   VALUES ('4','3582',TO_DATE('24/03/2022', 'dd/mm/yyyy'),TO_DATE('05/05/2022', 'dd/mm/yyyy'), 27);
   
   INSERT INTO garantii (cod_masina,cod_garantie,data_incepere_garantie,data_sfarsit_garantie,tip_garantie)
   VALUES ('5','5145',TO_DATE('22/12/2021', 'dd/mm/yyyy'),TO_DATE('17/12/2022', 'dd/mm/yyyy'), 13);


 INSERT INTO companii_asigurari (id_companie_asigurari,nume_companie_asigurari,telefon_companie_asigurari)
   VALUES (165,'City Insurance',0739355523);
   
   INSERT INTO companii_asigurari (id_companie_asigurari,nume_companie_asigurari,telefon_companie_asigurari)
   VALUES (705,'Generali',0757081326);
   
   INSERT INTO companii_asigurari (id_companie_asigurari,nume_companie_asigurari,telefon_companie_asigurari)
   VALUES (345,'Allianz Tiriac',0777999333);
   
   INSERT INTO companii_asigurari (id_companie_asigurari,nume_companie_asigurari,telefon_companie_asigurari)
   VALUES (901,'AntiBuseituri',0789456123);
   
   INSERT INTO companii_asigurari (id_companie_asigurari,nume_companie_asigurari,telefon_companie_asigurari)
   VALUES (322,'Certasig',0760942069);
   
   
   
   INSERT INTO reprezentanti_asigurari (id_companie_asigurari,id_reprezentant_asigurari,nume_reprezentant,prenume_reprezentant,nr_telefon_reprezentant,email_reprezentant)
   VALUES (165,69,'Popescu','Costel',0764376652,'popescucostelas@gmail.com');
   
   INSERT INTO reprezentanti_asigurari (id_companie_asigurari,id_reprezentant_asigurari,nume_reprezentant,prenume_reprezentant,nr_telefon_reprezentant,email_reprezentant)
   VALUES (705,89,'Ionescu','Gigel',0734592503,'ionescogigolo@hotmail.com');
   
   INSERT INTO reprezentanti_asigurari (id_companie_asigurari,id_reprezentant_asigurari,nume_reprezentant,prenume_reprezentant,nr_telefon_reprezentant,email_reprezentant)
   VALUES (345,22,'Popa','Ionel',0789126406,'popaionel34@yahoo.com');
   
   INSERT INTO reprezentanti_asigurari (id_companie_asigurari,id_reprezentant_asigurari,nume_reprezentant,prenume_reprezentant,nr_telefon_reprezentant,email_reprezentant)
   VALUES (901,34,'Moldovan','Andrei',0743871295,'andrei.moldovan@gmail.com');
   
   INSERT INTO reprezentanti_asigurari (id_companie_asigurari,id_reprezentant_asigurari,nume_reprezentant,prenume_reprezentant,nr_telefon_reprezentant,email_reprezentant)
   VALUES (322,56,'Cristache','Mihai',0718735481,'mihai_cristache@certasig.ro');
   
   
  
   
   
   INSERT INTO asigurari (id_reprezentant_asigurari,cod_asigurare,valoare_asigurare,tip_asigurare)
   VALUES (69,10,3000,'A');
   
    INSERT INTO asigurari (id_reprezentant_asigurari,cod_asigurare,valoare_asigurare,tip_asigurare)
   VALUES (89,11,5000,'B');
   
    INSERT INTO asigurari (id_reprezentant_asigurari,cod_asigurare,valoare_asigurare,tip_asigurare)
   VALUES (22,12,4000,'B');
   
    INSERT INTO asigurari (id_reprezentant_asigurari,cod_asigurare,valoare_asigurare,tip_asigurare)
   VALUES (34,13,1000,'D');
   
    INSERT INTO asigurari (id_reprezentant_asigurari,cod_asigurare,valoare_asigurare,tip_asigurare)
   VALUES (56,14,10000,'C');
   
   
    INSERT INTO sedii (id_sediu,cod_postal,telefon_sediu,adresa_sediu)
   VALUES (111,039654,0748374829,'Str_Oferirii_77');
   
   INSERT INTO sedii (id_sediu,cod_postal,telefon_sediu,adresa_sediu)
   VALUES (112,032345,0733523534,'Str_Vasilescian_49-51');
   
   INSERT INTO sedii (id_sediu,cod_postal,telefon_sediu,adresa_sediu)
   VALUES (211,053424,0752341438,'Str_Dragului_22');
   
   INSERT INTO sedii (id_sediu,cod_postal,telefon_sediu,adresa_sediu)
   VALUES (212,053426,0723123123,'Blv_Libertatii_234');
   
   INSERT INTO sedii (id_sediu,cod_postal,telefon_sediu,adresa_sediu)
   VALUES (311,073452,0723487504,'Str_Ceasului_7-30');
   
   
   
    INSERT INTO departamente (id_sediu,id_departament,nume_departament)
   VALUES (111,91,'a');
   
   INSERT INTO departamente (id_sediu,id_departament,nume_departament)
   VALUES (112,92,'b');
   
   INSERT INTO departamente (id_sediu,id_departament,nume_departament)
   VALUES (211,93,'c');
   
   INSERT INTO departamente (id_sediu,id_departament,nume_departament)
   VALUES (212,94,'d');
   
   INSERT INTO departamente (id_sediu,id_departament,nume_departament)
   VALUES (311,95,'e');
   
    INSERT INTO angajati (id_departament,id_angajat,nume_angajat,prenume_angajat,salariu_angajat,adresa_angajat,email_angajat,nr_telefon_angajat)
   VALUES (91,201,'Gigi','Edi',13000,'Str.Panselutelor','gigiedi@gigelmec.com',0326518765);
   
   INSERT INTO angajati (id_departament,id_angajat,nume_angajat,prenume_angajat,salariu_angajat,adresa_angajat,email_angajat,nr_telefon_angajat)
   VALUES (92,202,'Bibi','Titel',10000,'Str.Gargaritelor','bibititel@gigelmec.com',0382375428);
   
   INSERT INTO angajati (id_departament,id_angajat,nume_angajat,prenume_angajat,salariu_angajat,adresa_angajat,email_angajat,nr_telefon_angajat)
   VALUES (93,203,'Mimi','Karbon',12000,'Str.Leilor','mimik@gigelmec.com',0387156519);
   
   INSERT INTO angajati (id_departament,id_angajat,nume_angajat,prenume_angajat,salariu_angajat,adresa_angajat,email_angajat,nr_telefon_angajat)
   VALUES (94,204,'Cici','Valentin',13000,'Str.Ursilor','cicival@gigelmec.com',0387235744);
   
   INSERT INTO angajati (id_departament,id_angajat,nume_angajat,prenume_angajat,salariu_angajat,adresa_angajat,email_angajat,nr_telefon_angajat)
   VALUES (95,205,'Bibilica','Oli',15000,'Str.Fluturilor','lilioli@gigelmec.com',0237625112);
   
   
   INSERT INTO contracte (id_angajat,cod_contract,data_contract)
   VALUES (201,1,TO_DATE('03/07/2017', 'dd/mm/yyyy'));
   
   INSERT INTO contracte (id_angajat,cod_contract,data_contract)
   VALUES (202,2,TO_DATE('04/08/2018', 'dd/mm/yyyy'));
   
   INSERT INTO contracte (id_angajat,cod_contract,data_contract)
   VALUES (203,3,TO_DATE('25/07/2019', 'dd/mm/yyyy'));
   
   INSERT INTO contracte (id_angajat,cod_contract,data_contract)
   VALUES (204,4,TO_DATE('13/07/2020', 'dd/mm/yyyy'));
  
   INSERT INTO contracte (id_angajat,cod_contract,data_contract)
   VALUES (205,5,TO_DATE('15/08/2021', 'dd/mm/yyyy'));
   
   
   
   INSERT INTO clienti (cod_contract,cod_client,nume_client,prenume_client,adresa_client,nr_telefon_client,email_client)
   VALUES (1,20,'Guse','Ion','Str, Ghinionului Nr.13',0745632813,'guseion@gmail.com');
   
    INSERT INTO clienti (cod_contract,cod_client,nume_client,prenume_client,adresa_client,nr_telefon_client,email_client)
   VALUES (2,21,'Disu','Mioara','Str. Furnicilor Nr.3',0318763125,'mioaradisu@bruh.com');
   
    INSERT INTO clienti (cod_contract,cod_client,nume_client,prenume_client,adresa_client,nr_telefon_client,email_client)
   VALUES (3,22,'Mytrake','Alecs','Str. Bruh moment Nr.1',0762563232,'mytrackealecsss@yahoo.com');
   
    INSERT INTO clienti (cod_contract,cod_client,nume_client,prenume_client,adresa_client,nr_telefon_client,email_client)
   VALUES (4,23,'Poorsafir','Bruh','Str. Oilor Nr. 54',0732762324,'bruhhhh@lol.com');
   
    INSERT INTO clienti (cod_contract,cod_client,nume_client,prenume_client,adresa_client,nr_telefon_client,email_client)
   VALUES (5,24,'Popeku','Mariahh','Str. Distractiei Nr. 7',0837535385,'popek76238@hotmail.com');
   
   
   
   
   
   INSERT INTO serviceuri_auto (id_sediu,cod_service_auto,tip_service_auto,pret_service_auto)
   VALUES (111,61,'umflare roti',100);
   
   INSERT INTO serviceuri_auto (id_sediu,cod_service_auto,tip_service_auto,pret_service_auto)
   VALUES (112,62,'reparat motor',500);
   
   INSERT INTO serviceuri_auto (id_sediu,cod_service_auto,tip_service_auto,pret_service_auto)
   VALUES (211,63,'reparat frane',600);
   
   INSERT INTO serviceuri_auto (id_sediu,cod_service_auto,tip_service_auto,pret_service_auto)
   VALUES (212,64,'schimbare ulei',200);
   
   INSERT INTO serviceuri_auto (id_sediu,cod_service_auto,tip_service_auto,pret_service_auto)
   VALUES (311,65,'spalatorie',25);
   
   
   
   INSERT INTO mecanici_auto (cod_service_auto,id_mecanic_auto,nume_mecanic,prenume_mecanic,nr_telefon_mecanic,email_mecanic)
   VALUES (61,401,'Costel','Solomon',0723729862,'costelsolomon@gigelmec.com');
   INSERT INTO mecanici_auto (cod_service_auto,id_mecanic_auto,nume_mecanic,prenume_mecanic,nr_telefon_mecanic,email_mecanic)
   VALUES (62,402,'Ispilante','Brusli',0723472819,'ipsilantebrusli@gigelmec.com');
   INSERT INTO mecanici_auto (cod_service_auto,id_mecanic_auto,nume_mecanic,prenume_mecanic,nr_telefon_mecanic,email_mecanic)
   VALUES (63,404,'Randunel','Pisica',0772637522,'randunelpisica@gigelmec.com');
   INSERT INTO mecanici_auto (cod_service_auto,id_mecanic_auto,nume_mecanic,prenume_mecanic,nr_telefon_mecanic,email_mecanic)
   VALUES (64,405,'Bred','Pit',0723462872,'bredpit@gigelmec.com');
   INSERT INTO mecanici_auto (cod_service_auto,id_mecanic_auto,nume_mecanic,prenume_mecanic,nr_telefon_mecanic,email_mecanic)
   VALUES (65,406,'Pufulete','Rudolf',0772342895,'PUFU@gigelmec.com');
   
   
   
   
   INSERT INTO distribuitori_piese_auto (cod_distribuitor,nume_distribuitor,adresa_distribuitor,telefon_distribuitor,email_distribuitor)
   VALUES (78654,'BuseimMasina','Str. Baneasa 24-26','0757081326','buseimmasina@gmail.com');
   
   INSERT INTO distribuitori_piese_auto (cod_distribuitor,nume_distribuitor,adresa_distribuitor,telefon_distribuitor,email_distribuitor)
   VALUES (48315,'StdEven','Blvd. Ficusului 4','0744896123','stdevene@hotmail.com');
   
   INSERT INTO distribuitori_piese_auto (cod_distribuitor,nume_distribuitor,adresa_distribuitor,telefon_distribuitor,email_distribuitor)
   VALUES (75649,'Mugurim Pe Autostrda','Str. Neagoe Voda 48','0719843584','mugurimpeautostrada@yahoo.com');
   
   INSERT INTO distribuitori_piese_auto (cod_distribuitor,nume_distribuitor,adresa_distribuitor,telefon_distribuitor,email_distribuitor)
   VALUES (32468,'Traian si Asociatii','Str. Pbinfo 2423','0745397256','traianfaraasociati@vreaubani.ro');
   
   INSERT INTO distribuitori_piese_auto (cod_distribuitor,nume_distribuitor,adresa_distribuitor,telefon_distribuitor,email_distribuitor)
   VALUES (34864,'Cu Marcu direct din lac','Str. Baltii 43','07653831847','stiuca@balta.ro');
   
   
   INSERT INTO piese_auto (cod_distribuitor,id_piesa_auto,firma_piesa_auto,tip_piesa_auto,stoc_piesa_auto,pret_piesa_auto)
  VALUES (78654,71,'Tenacious Beton SRL','motor',20,1500);
  
  INSERT INTO piese_auto (cod_distribuitor,id_piesa_auto,firma_piesa_auto,tip_piesa_auto,stoc_piesa_auto,pret_piesa_auto)
  VALUES (48315,72,'Idei cu Sens SRL','cutie de viteza',15,1000);
  
  INSERT INTO piese_auto (cod_distribuitor,id_piesa_auto,firma_piesa_auto,tip_piesa_auto,stoc_piesa_auto,pret_piesa_auto)
  VALUES (75649,73,'Miracol Ardelean SRL','suspensie',200,100);
  
  INSERT INTO piese_auto (cod_distribuitor,id_piesa_auto,firma_piesa_auto,tip_piesa_auto,stoc_piesa_auto,pret_piesa_auto)
  VALUES (32468,74,'Fierarul Fericit 2017','roata',30,150);
  
  INSERT INTO piese_auto (cod_distribuitor,id_piesa_auto,firma_piesa_auto,tip_piesa_auto,stoc_piesa_auto,pret_piesa_auto)
  VALUES (34864,75,'Trei zmei SRL','instalatie de racire',10,300);
  
   
   INSERT INTO liste_piese_auto (id_mecanic_auto,id_piesa_auto,cod_lista_piese_auto,nr_piese_auto_achizitionate)
   VALUES (401,71,1001,1);
   
   INSERT INTO liste_piese_auto (id_mecanic_auto,id_piesa_auto,cod_lista_piese_auto,nr_piese_auto_achizitionate)
   VALUES (401,72,1002,2);
   
   INSERT INTO liste_piese_auto (id_mecanic_auto,id_piesa_auto,cod_lista_piese_auto,nr_piese_auto_achizitionate)
   VALUES (402,73,1003,10);
   
   INSERT INTO liste_piese_auto (id_mecanic_auto,id_piesa_auto,cod_lista_piese_auto,nr_piese_auto_achizitionate)
   VALUES (404,74,1004,5);
   
   INSERT INTO liste_piese_auto (id_mecanic_auto,id_piesa_auto,cod_lista_piese_auto,nr_piese_auto_achizitionate)
   VALUES (405,75,1005,9);
   
   
   
   
   
      
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
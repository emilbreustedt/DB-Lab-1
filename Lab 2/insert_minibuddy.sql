USE minibuddy;

INSERT INTO user
VALUES
(1, "Anna", "01/01/1997", "M"),
(2, "Marcos", "30/05/1950", "H"),
(3, "Kathy", "01/01/1997", "M"),
(4, "Marcel·lí", "17/05/1971", NULL),
(5, "Pepa", "25/12/1986", "M"),
(6, "Joana", "27/10/1999", "M"),
(7, "Xema", "10/03/1991", NULL),
(8, "Pere", "31/01/1985", "H"),
(9, "Antoni", "20/07/1969", "H");

INSERT INTO friend
VALUES
(1, 3, "1/1/2000"),
(1, 5, "4/14/2000"),
(1, 9, "10/10/1999"),
(3, 5, "11/13/1997"),
(3, 9, "5/3/2004"),
(5, 9, "8/20/2007"),
(6, 8, "7/5/1990"),
(7, 6, "8/9/2001"),
(7, 8, "7/1/2000");

INSERT INTO `group`
VALUES
(2, "Cinema"),
(4, "Cuina"),
(1, "Esports"),
(5, "Hip-Hop"),
(3, "Informàtica");

INSERT INTO belong
VALUES
(1, 1),
(3, 1),
(5, 1),
(1, 2),
(5, 2),
(6, 2),
(8, 2),
(9, 2),
(6, 3),
(9, 3),
(5, 4),
(1, 5),
(6, 5),
(9, 5);

INSERT INTO message
VALUES
(1, 1, "11/10/15 20:30", "La bretxa salarial a Espanya és del 14,2%. Això vol dir que des d’avui fins a final d’any, les dones espanyoles treballaran de franc"),
(2, 1, "1/3/15 20:30", "Si heu d'agafar el cotxe, la bici, la moto, o fins i tot si aneu a peu, fareu bé de posar-vos les ulleres... "),
(3, 1, "11/4/15 20:30", "Rècord de corredores a la Cursa de la Dona amb 34.000 inscrites. Aquest diumenge ompliran Barcelona per una bona causa."),
(4, 7, "1/15/15 20:30", "Veig el Puigmal des de Barcelona."),
(5, 8, "3/1/15 20:30", "Per mi, la Rambla té un encant que em costa d'explicar. Quan estic fora i torno dic: 'Ja soc a casa'"),
(6, 7, "3/7/15 10:30", "Avui anem al cinema, a saber què veiem"),
(7, 7, "3/10/15 23:30", "Tercer dia de cinema consecutiu, provaré a no dormir-me en aquesta"),
(8, 8, "3/15/15 17:00", "Pujant i baixant, quin enrenou!"),
(9, 2, "1/1/15 0:10", "Bon any nou!"),
(10, 2, "1/2/15 8:30", "Quant queda pel nadal?");

INSERT INTO `like`
VALUES
(3, 1),
(4, 1),
(6, 1),
(3, 2),
(6, 4),
(3, 5),
(6, 7),
(7, 5),
(4, 6);

INSERT INTO dislike
VALUES
(1, 1),
(3, 3),
(4, 3),
(6, 3),
(3, 7),
(6, 5),
(3, 8),
(7, 8);



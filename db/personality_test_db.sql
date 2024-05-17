-- Borramos la base de datos por si ya existe

DROP DATABASE IF EXISTS personality_web;

-- Y después la creamos 

CREATE DATABASE IF NOT EXISTS personality_web;

USE personality_web;

-- Y aquí creamos el mandangón


CREATE TABLE users (
	user_id  INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(10) NOT NULL UNIQUE,
    user_pass VARCHAR(15) NOT NULL UNIQUE,
    
    -- Y aquí irían las constraints
	PRIMARY KEY(user_id)
);


CREATE TABLE universe (
	id_uni INT AUTO_INCREMENT,
    name_uni VARCHAR(25) NOT NULL,
    desc_uni VARCHAR(250) NOT NULL,
	
    -- CONSTRAINTS
    PRIMARY KEY(id_uni)
);

CREATE TABLE personality_char (
	char_name VARCHAR(50) NOT NULL,
	char_uni INT,
    t_score INT UNSIGNED NOT NULL,
    char_per VARCHAR(5) NOT NULL,
    char_img VARCHAR(100) NOT NULL,
    -- char_des TEXT, Aqui estarán las posibles descripciones futuras, si hay tiempo
    
    -- constraints
    
    PRIMARY KEY(char_name),
    FOREIGN KEY (char_uni) REFERENCES universe(id_uni)
);


CREATE TABLE t_starwars (
	t_id INT,
    item INT UNIQUE NOT NULL,
    question VARCHAR(100) NOT NULL,
    item_type VARCHAR(5) NOT NULL,
    
    -- CONSTRAINTS
    FOREIGN KEY (t_id) REFERENCES universe(id_uni)
);

CREATE TABLE t_lotr (
	t_id INT,
    item INT UNIQUE NOT NULL,
    question VARCHAR(100) NOT NULL,
    item_type VARCHAR(5) NOT NULL,
    
    -- CONSTRAINTS
    FOREIGN KEY (t_id) REFERENCES universe(id_uni)
);

CREATE TABLE t_harrypotter (
	t_id INT,
    item INT UNIQUE NOT NULL,
    question VARCHAR(100) NOT NULL,
    item_type VARCHAR(5) NOT NULL,
    
    -- CONSTRAINTS
    FOREIGN KEY (t_id) REFERENCES universe(id_uni)
);

CREATE TABLE user_personality (
	id_user_per INT,
    u_score INT UNSIGNED NOT NULL,
    user_uni INT,
    user_per VARCHAR(25),
    
    -- CONSTRAINTS
    FOREIGN KEY (id_user_per) REFERENCES users(user_id),
    FOREIGN KEY (user_uni) REFERENCES universe(id_uni),
    FOREIGN KEY (user_per) REFERENCES personality_char(char_name)
    
);

INSERT INTO universe (id_uni, name_uni, desc_uni) VALUES
(1, "Star Wars", "Si lo que quieres saber es a que lado de la fuerza perteneces, este es tu sitio"),
(2, "EL Señor de los Anillos", "El Anillo único está en tus manos, ¿qué decidirás hacer?"),
(3, "Harry Potter", "Elige tu casa y admira el poder de tu varita jeje");

INSERT INTO t_starwars (t_id, item, question, item_type)
VALUES
-- EI
(1, 36, "Te resulta difícil conocer a personas nuevas fuera de tu rutina", "EI"),
(1, 64, "Te consideras una persona bastante reservada", "EI"),
(1, 50, "Te resulta complicado hablar cómodamente con extraños", "EI"),
(1, 22, "Al hablar por teléfono ensayas antes lo que vas a decir", "EI"),
(1, 15, "En tus círculos sociales eres de los últimos que se entera de las noticias", "EI"),
-- NS
(1, 16, "Es mejor hacer tareas siguiendo una lógica que la intuición del momento", "NS"),
(1, 23, "Necesitas preguntar por qué ha pasado algo para saber que ha ocurrido", "NS"),
(1, 30, "Crees que el sentido común es bastante cuestionable", "NS"),
(1, 65, "Cuando estás escribiendo sobre algo eres literal, apenas usas metáforas", "NS"),
(1, 58, "Crees que la imaginación no es importante", "NS"),
-- SN
(1, 03, "Es peor ser demasiado rígido que tener la cabeza en las nubes", "SN"),
(1, 52, "Te consideras unas persona mas ingeniosa que práctica", "SN"),
(1, 45, "Prefieres hacer las cosas directamente en vez de preocuparte por el diseño", "SN"),
(1, 10, "Te interesa más lo que puede pasar que lo que está pasando", "SN"),
(1, 38, "De una persona te interesa más lo útil que puede ser que cómo ve el mundo", "SN"),
-- FT
(1, 60, "Cuando ocurre algo prefires ser objetivo más que emocional", "FT"),
(1, 46, "Te gusta que las personas digan que eres una persona muy lógica", "FT"),
(1, 11, "Al juzgar a alguien son más importantes las reglas que las circunstancias", "FT"),
(1, 67, "Prefires hacer razonamientos exactos que tener más empatía", "FT"),
(1, 39, "En una discusión es mas importante ir hasta el fondo del asunto que llegar a un acuerdo", "FT"),
-- TF
(1, 19, "Prefieres juzgar una situación por lo que te hace sentir que por las normas", "TF"),
(1, 68, "Consideras un error ser una persona demasiado crítica", "TF"),
(1, 05, "Crees que es más importante conmover que convencer", "TF"),
(1, 47, "Dirías que es mejor ser leal que ser inquebrantable", "TF"),
(1, 12, "Al relacionarte con otras personas prefieres un trato más personal que cordial", "TF"),
-- PJ
(1, 27, "Crees que si algo ocure es porque alguien así lo ha decidido", "PJ"),
(1, 62, "Prefires las situaciones planeadas y estructuradas", "PJ"),
(1, 06, "Prefieres trabajar con una fecha límite que con libertad horaria", "PJ"),
(1, 20, "Prefires las situaciones resultas y decididas que las que no lo están", "PJ"),
(1, 13, "Te gustaría que las personas sean puntuales en lugar de ser flexible con el horario", "PJ"),
-- JP
(1, 63, "Te consideras una persona más flexible que rutinaria", "JP"),
(1, 14, "No te preocupa que las cosas estén sin acabar del todo antes de darlo por terminado", "JP"),
(1, 42, "Te sientes más cómodo con el la forma natural de las cosas que con el orden y el control", "JP"),
(1, 35, "Es más importante lo que está por definirse que lo ya definido", "JP"),
(1, 07, "Coges lo que quieres sin preocuparte por mirar todas las opciones disponibles antes", "JP");

INSERT INTO t_lotr (t_id, item, question, item_type)
VALUES
-- EI
(2, 50, "Te resulta complicado hablar cómodamente con extraños", "EI"),
(2, 08, "En eventos sociales prefieres irte lo más pronto posible", "EI"),
(2, 43, "Si el personal de un restaurante no te trae lo que pediste no le dices nada", "EI"),
(2, 57, "Cuando preguntan algo en un chat grupal sueles esperar a que otras personas contesten", "EI"),
(2, 29, "En los grupos de trabajo suelen ser otros quienes inician las conversaciones", "EI"),
-- NS
(2, 44, "Necesitas mirar muchas veces las instrucciones del algo para saber como montarlo", "NS"),
(2, 37, "Te consideras una persona más observadora que especulativa", "NS"),
(2, 30, "Crees que el sentido común es bastante cuestionable", "NS"),
(2, 23, "Necesitas preguntar por qué ha pasado algo para saber que ha ocurrido", "NS"),
(2, 16, "Es mejor hacer tareas siguiendo una lógica que la intuición del momento", "NS"),
-- SN
(2, 24, "Crees que aquellos a quienes se llama visionarios son personas fascinantes", "SN"),
(2, 59, "Tiendes a pensar que lo importante son los actos, no los detalles", "SN"),
(2, 66, "Te resulta fácil identificarte con otras personas", "SN"),
(2, 31, "Consideras que es más importante estimular la imaginación que la práctica en niños", "SN"),
(2, 17, "Crees que un buen escritor debe usar muchas metáforas y analogías", "SN"),
-- FT
(2, 46, "Te gusta que las personas digan de ti que eres una persona muy lógica", "FT"),
(2, 39, "En una discusión es mas importante ir hasta el fondo del asunto que llegar a un acuerdo", "FT"),
(2, 04, "No te consideras una persona que se deje llevar por sus emociones", "FT"),
(2, 53, "Crees que una persona muy inteligente es mejor que una muy emocionalmente capaz", "FT"),
(2, 67, "Prefires hacer razonamientos exactos que tener más empatía", "FT"),
-- TF
(2, 54, "Prefieres que piensen que eres más simpático que justo", "TF"),
(2, 33, "Consideras que a menudo es necesario ser más amable que firme", "TF"),
(2, 19, "Prefieres juzgar una situación por lo que te hace sentir que por las normas", "TF"),
(2, 68, "Consideras un error ser una persona demasiado crítica", "TF"),
(2, 05, "Crees que es más importante conmover que convencer", "TF"),
-- PJ
(2, 34, "Admiras más a una persona organizada y metódica que a otra con gran adaptabilidad y resolutiva", "PJ"),
(2, 06, "Prefieres trabajar con una fecha límite que con libertad horaria", "PJ"),
(2, 20, "Prefires los planes ya estudiados y decididos que los que están más improvisados", "PJ"),
(2, 48, "Prefieres ser quien tome la decisión final rápido antes que hablar de como seguir con los demás", "PJ"),
(2, 69, "Dirías que prefieres los eventos con planificación sobre los que no", "PJ"),
-- JP
(2, 49, "Prefieres el momento después de tomar una decisión importante que antes de haber dicidido", "JP"),
(2, 14, "No te preocupa que las cosas estén sin acabar del todo antes de darlo por terminado", "JP"),
(2, 63, "Te consideras una persona más flexible que rutinaria", "JP"),
(2, 07, "Coges lo que quieres sin preocuparte por mirar todas las opciones disponibles antes", "JP"),
(2, 42, "Te sientes más cómodo con el la forma natural de las cosas que con el orden y el control", "JP");

INSERT INTO t_harrypotter(t_id, item, question, item_type)
VALUES
-- EI
(3, 01, "En un evento social prefieres hablar con quienes conoces antes que conocer gente nueva", "EI"),
(3, 08, "En eventos sociales prefieres irte lo más pronto posible", "EI"),
(3, 43, "Si el personal de un restaurante no te trae lo que pediste no le dices nada", "EI"),
(3, 22, "Al hablar por teléfono ensayas antes lo que vas a decir", "EI"),
(3, 15, "En tus círculos sociales eres de los últimos que se entera de las noticias", "EI"),
-- NS
(3, 51, "Sueles confiar más en tu experiencia que en tus corazonadas", "NS"),
(3, 02, "Dirías que eres más realista que especulativo", "NS"),
(3, 30, "Crees que el sentido común es bastante cuestionable", "NS"),
(3, 23, "Necesitas preguntar por qué ha pasado algo para saber que ha ocurrido", "NS"),
(3, 09, "Te suelen caer mejor las personas inteligentes que las sensibles", "NS"),
-- SN
(3, 24, "Crees que aquellos a quienes se llama visionarios son personas fascinantes", "SN"),
(3, 52, "Te consideras unas persona mas ingeniosa que práctica", "SN"),
(3, 03, "Dirías que es peor tener siempre todo calculado que tener la cabeza en las nubes", "SN"),
(3, 31, "Consideras que es más importante estimular la imaginación que la práctica en niños", "SN"),
(3, 38, "De una persona te interesa más lo útil que puede ser que cómo ve el mundo", "SN"),
-- FT
(3, 46, "Prefieres que una persona diga que eres una persona más lógica que emocional", "FT"),
(3, 18, "Te sientes más atraido por saber como funciona un razonamiento que por la dinámica de una relación", "FT"),
(3, 25, "Te consideras una persona con más cabeza fría que corazón cálido", "FT"),
(3, 32, "Prefieres tomar una decisión en función de las normas del contexto que por las emociones implicadas", "FT"),
(3, 11, "Prefires hacer razonamientos exactos que tener más empatía", "FT"),
-- TF
(3, 26, "Es mejor ser misericorde que justo", "TF"),
(3, 12, "En tus relaciones laborales prefieres tienes un trato más personal que profesional", "TF"),
(3, 61, "Te consideras una persona más cabezota que flexible", "TF"),
(3, 68, "Consideras un error ser una persona demasiado crítica", "TF"),
(3, 40, "A la hora de tomar una decisión te guías más por lo que sientes que por lo que piensas", "TF"),
-- PJ
(3, 41, "Trabajas mejor si te dicen lo que tienes que hacer que si tomas tus propias decisiones", "PJ"),
(3, 06, "Prefieres trabajar con una fecha límite que con libertad horaria", "PJ"),
(3, 20, "Prefires las situaciones resultas y decididas que las que no lo están", "PJ"),
(3, 55, "Es preferible no permitir que queden cabos sueltos a que las cosas se resuelvan de forma natural", "PJ"),
(3, 69, "Dirías que prefieres los eventos con planificación sobre los que no", "PJ"),
-- JP
(3, 21, "Te consideras una persona con más capacidad de adaptación que rigidez", "JP"),
(3, 14, "No te preocupa que las cosas estén sin acabar del todo antes de darlo por terminado", "JP"),
(3, 28, "A la hora de comprar algo te sientes mejor cuando ya lo has hecho que decidiendo como lo vas a hacer", "JP"),
(3, 56, "Consideras que las relaciones entre las personas deberían ser fortuitas y circunstanciales", "JP"),
(3, 70, "Tiendes a ser una persona más espotánea que intencional", "JP");

-- Insertar todos los personajes, su Universo y su Personalidad

-- Star Wars

INSERT INTO personality_char (char_uni, char_name, char_per, t_score, char_img) 
VALUES
(1, "Darth Vader", "ISTJ", 65, "darth-vader-result.png"),
(1, "Din Djarin", "ISTJ", 76, "din-djarin-result.jpg"),
(1, "Mace Windu", "ISTJ", 60, "mace-windu-result.jpeg"),
(1, "Wilhuff Tarkin", "ISTJ", 39, "tarkin-result.jpg"),
(1, "Captain Rex", "ISTJ", 79, "capitan-rex-result.jpeg"),
(1, "Jyn Erso", "ISFP", 103, "erso-result.jpg"),
(1, "Rey Skywalker", "ISFP", 134, "rey-result.jpg"),
(1, "Han Solo", "ESTP", 100, "solo-result.jpg"),
(1, "Jabba the Hutt", "ESTP", 81, "jaba-result.jpeg"),
(1, "Padmé Amidala", "ENFJ", 0, "padme-result.jpg"),
(1, "Luke Skywalker", "INFP", 190, "luke-result.jpg"),
(1, "Din Grogu", "INFP", 175, "grogu-result.jpg"),
(1, "Cal Kestis", "INFP", 180, "kestis-result.jpg"),
(1, "Ben Solo", "INFP", 170, "ben-solo-result.jpg"),
(1, "Palpatine", "INTJ", 112, "palpatine-result.jpg"),
(1, "Conde Dooku", "INTJ", 130, "dooku-result.png"),
(1, "General Grievous", "ESTJ", 1, "grievous-result.jpeg"),
(1, "C-3PO", "ISFJ", 2, "c3po-result.jpg"),
(1, "Hera Syndulla", "ESFJ", 3, "syndulla-result.jpeg"),
(1, "Anakin Skywalker", "ESFP", 165, "anakin-result.jpeg"),
(1, "Jar Jar Binks", "ESFP", 145, "binks-result.jpg"),
(1, "Chewbacca", "ESFP", 130, "chewbacca-result.jpeg"),
(1, "Darth Maul", "ISTP", 140, "maul-result.jpg"),
(1, "Boba Fett", "ISTP", 130, "fett-result.jpg"),
(1, "Cassian Andor", "ISTP", 120, "andor-result.jpg"),
(1, "Obi-Wan Kenobi", "INFJ", 130, "obiwan-result.jpg"),
(1, "Qui-Gon Jinn", "INFJ", 110, "quigon-result.jpg"),
(1, "Ashoka Tano", "ENFP", 180, "ashoka-result.jpeg"),
(1, "Finn", "ENFP", 140, "finn-result.jpeg"),
(1, "BB-8", "ENFP", 150, "bb8-result.jpeg"),
(1, "Yoda", "INTP", 4, "yoda-result.jpeg"),
(1, "R2D2", "ENTP", 5, "r2d2-result.jpeg"),
(1, "Leia Organa", "ENTJ", 100, "leia-result.jpeg"),
(1, "Bo-Katan Kryze", "ENTJ", 90, "bokatan-result.jpg"),

-- El Señor de los Anillos

(2, "El Nazgûl", "ISTJ", 0, ""),
(2, "Boromir", "ESFJ", 6, ""),
(2, "Legolas", "ISFP", 127, ""),
(2, "Sméagol", "ISFP", 165, ""),
(2, "Éowyn", "ISFP", 145, ""),
(2, "Aragorn", "INFJ", 170, ""),
(2, "Galadriel, la Dama Blanca", "INFJ", 145, ""),
(2, "Faramir", "INFP", 171, ""),
(2, "Arwen Undómiel", "INFP", 155, ""),
(2, "Meriadoc Brandigamo", "ENTP", 7, ""),
(2, "Sauron, el Señor Oscuro", "ENTJ", 115, ""),
(2, "Gollum", "ENTJ", 98, ""),
(2, "El Anillo Único", "ENTJ", 165, ""),
(2, "Théoden, Rey de Rohan", "ESTJ", 8, ""),
(2, "Samsagaz Gamyi", "ISFJ", 106, ""),
(2, "Bilbo Bolsón", "ISFJ", 85, ""),
(2, "Bárbol", "ISFJ", 70, ""),
(2, "Peregrin Tuk", "ESFP", 9, ""),
(2, "Gimli, hijo de Glóin", "ESTP", 10, ""),
(2, "Señor de los Nazgûl", "ISTP", 65, ""),
(2, "Isildur", "ISTP", 75, ""),
(2, "Éomer", "ENFJ", 11, ""),
(2, "Frodo Bolsón", "ENFP", 12, ""),
(2, "Gríma, Lengua de Serpiente", "INTP", 13, ""),
(2, "Gandalf el Gris", "INTJ", 120, ""),
(2, "Saruman el Blanco", "INTJ", 95, ""),
(2, "Elrond, Señor de Rivendel", "INTJ", 110, ""),

-- Harry Potter

(3, "Minerva McGonagall", "ISTJ", 14, ""),
(3, "Neville Longbottom", "ISFJ", 110, ""),
(3, "Ginny Weasley", "ISFJ", 100, ""),
(3, "Cedric Diggory", "ESFJ", 110, ""),
(3, "Molly Weasley", "ESFJ", 120, ""),
(3, "Bellatrix Lestrange", "ESFP", 110, ""),
(3, "Ronald Weasley", "ESFP", 150, ""),
(3, "Sirius Black", "ESTP", 15, ""),
(3, "Albus Dumbledore", "INFJ", 145, ""),
(3, "Remus Lupin", "INFJ", 170, ""),
(3, "Nymphadora Tonks", "ENFP", 150, ""),
(3, "Xenophilius Lovegood", "ENFP", 140, ""),
(3, "Fred/George Weasley", "ENTP", 16, ""),
(3, "Lord Voldemort", "ENTJ", 17, ""),
(3, "Draco Malfoy", "ESTJ", 85, ""),
(3, "Hermione Granger", "ESTJ", 75, ""),
(3, "Dolores Umbridge", "ESTJ", 45, ""),
(3, "Lucius Malfoy", "ESTJ", 55, ""),
(3, "Alastor Moody", "ESTJ", 60, ""),
(3, "Vernon Dursley", "ESTJ", 50, ""),
(3, "Harry Potter", "ISFP", 150, ""),
(3, "Rubeus Hagrid", "ISFP", 130, ""),
(3, "Arthur Weasley", "ISTP", 18, ""),
(3, "Lily Evans Potter", "ENFJ", 19, ""),
(3, "Luna Lovegood", "INFP", 155, ""),
(3, "Dooby, un Elfo Libre", "INFP", 170, ""),
(3, "Garrick Olivander", "INTP", 20, ""),
(3, "Severus Snape", "INTJ", 125, ""),
(3, "Tom Riddle", "INTJ", 115, ""),
(3, "Gellert Grindelwaldç", "INTJ", 105, "");
CREATE TABLE usuario (
  user_id int AUTO_INCREMENT not null PRIMARY KEY,
  nombre varchar(100) NOT NULL,
  correo varchar(100) NOT NULL,
  clave varchar(100) DEFAULT NULL,
  saldo int NOT NULL,
  fecha_de_creacion datetime NOT NULL
);
CREATE TABLE moneda (
  CURRENCY_ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  CURRENCY_NAME varchar(100) DEFAULT NULL,
  CURRENCY_SYMBOL char(3) NOT NULL
);

CREATE TABLE transaccion (
  transaction_id int NOT NULL AUTO_INCREMENT primary key,
  sender_user_id int NOT NULL,
  receiver_user_id int NOT NULL,
  valor int NOT NULL,
  transaction_date datetime NOT NULL,
  CONSTRAINT transaccion_ibfk_1 FOREIGN KEY (sender_user_id) REFERENCES usuario (user_id),
  CONSTRAINT transaccion_ibfk_2 FOREIGN KEY (receiver_user_id) REFERENCES usuario (user_id)
  );


alter table transaccion
add column currency_id int not null,
add constraint transaccion_currencyfk foreign key (currency_id) references moneda(currency_id);


select * from usuario;
select * from moneda;
select * from transaccion;

-- INSERT INTO --
insert into usuario (user_id, nombre, correo, clave, saldo, fecha_de_creacion)
values (1, 'Juanita Pérez','jperez@gmail.com',1234, 4000, '2024-03-20 00:13:17'),
(2,	'Gabriel Torres', 'gtorres@gmail.com', 4567, 6000, '2024-01-20 14:00:00'),
(3, 'Manuel Guevara', 'mguevara@gmail.com', 7890, 10000, '2024-01-19 14:00:00'),
(4, 'Ana Rodriguez', 'arodriguez@example.com', 4567, 7500, '2023-07-05 09:30:00'),
(5, 'Carlos Sánchez', 'csanchez@example.com', 1234, 8500, '2022-11-12 18:45:00'),
(6, 'Laura Martínez', 'lmartinez@example.com', 2345, 5500, '2023-02-28 11:15:00'),
(7, 'Pedro López', 'plopez@example.com', 9876, 9200, '2022-09-20 15:20:00'),
(8, 'María Fernández', 'mfernandez@example.com', 5678, 6300, '2023-04-14 10:00:00'),
(9, 'Sofía González', 'sgonzalez@example.com', 3456, 4800, '2024-05-30 13:45:00'),
(10, 'Juan Hernández', 'jhernandez@example.com', 8765, 7200, '2023-10-08 16:55:00'),
(11, 'Isabella Ruiz', 'iruiz@example.com', 6543, 9200, '2022-12-25 07:40:00'),
(12, 'Diego García', 'dgarcia@example.com', 4321, 6800, '2024-02-17 14:30:00'),
(13, 'Marta Pérez', 'mperez@example.com', 7890, 5500, '2023-08-03 09:10:00');

insert into transaccion (transaction_id, sender_user_id, receiver_user_id, valor, transaction_date, currency_id)
values (5, 1, 3, 5000, '2024-02-23 20:30:00', 2),
(6, 2,1, 8000, '2024-01-03 02:40:00', 3),
(7, 4, 3, 5000, '2023-06-15 11:20:00', 1),
(8, 5, 2, 3000, '2022-10-28 08:55:00', 2),
(9, 6, 4, 6500, '2023-03-10 16:30:00', 3),
(10, 7, 5, 4200, '2022-08-17 05:45:00', 1),
(11, 8, 6, 5500, '2023-05-05 14:10:00', 2),
(12, 9, 7, 7800, '2024-04-22 19:25:00', 3),
(13, 10, 8, 3700, '2023-11-30 23:00:00', 1),
(14, 11, 9, 9200, '2023-01-15 17:35:00', 2),
(15, 12, 10, 4800, '2024-03-01 10:50:00', 3),
(16, 13, 11, 6200, '2023-07-10 04:15:00', 1);


insert into moneda (CURRENCY_NAME, CURRENCY_SYMBOL) 
values ('Euro', 'EUR'),
('Yen Japonés', 'JPY'),
('Libra Esterlina', 'GBP'),
('Franco Suizo', 'CHF'),
('Dólar Canadiense', 'CAD'),
('Dólar Australiano', 'AUD'),
('Real Brasileño', 'BRL'),
('Yuan Chino', 'CNY'),
('Rublo Ruso', 'RUB'),
('Peso Mexicano', 'MXN');

-- CONSULTAS --

-- Consulta para obtener el nombre de la moneda elegida por un usuario específico --
select currency_name from moneda as mon
inner join transaccion as trans on mon.currency_id=trans.currency_id
inner join usuario as usu on trans.sender_user_id=usu.user_id
where usu.user_id=1;

select * from transaccion;
select * from moneda;
select * from usuario;

-- Consulta para obtener todas las transacciones registradas
select * from transaccion;


-- Consulta para obtener todas las transacciones realizadas por un usuario específico
select * from transaccion 
where sender_user_id=2;

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico
update usuario 
set correo= 'gmanuel@correo.cl'
where user_id=3;

select * from usuario;

-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
delete from transaccion
where transaction_id=4;

select * from transaccion;









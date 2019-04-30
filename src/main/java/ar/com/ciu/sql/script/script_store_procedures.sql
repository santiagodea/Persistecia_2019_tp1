

use `ciu-persistencia-15`;

-- inicio definicion store procedure
delimiter $$
create procedure nuevo_titular(in p_nombre varchar(256), in p_apellido varchar(256), in p_fecha date, inout id_out bigint)
begin
	declare exit handler for sqlexception rollback;
	start transaction;
		insert into titular (nombre, apellido, fecha_de_nacimiento) values (p_nombre, p_apellido, p_fecha);
		set id_out = last_insert_id();
	commit;
end$$
-- fin store procedure

-- llamar sp
set @ultimo_id = 0;
call `ciu-persistencia-15`.`nuevo_titular`('Camello', 'El Plebello', '1962-04-29', @ultimo_id);
select @ultimo_id;
-- fin llamar sp

-- inicio definicion store procedure
delimiter $$
create procedure nuevo_telefono(in p_id_titular int, in p_codigo_de_pais smallint, in p_codigo_de_area smallint, in p_numero int)
begin
	declare exit handler for sqlexception rollback;
	start transaction;
		insert into telefono (id_titular, codigo_de_pais, codigo_de_area, numero) values (p_id_titular, p_codigo_de_pais, p_codigo_de_area, p_numero);
	commit;
end$$
-- fin store procedure

-- inicio definicion store procedure
delimiter $$
create procedure nuevo_titular_telefono(
	in p_nombre varchar(256), 
    in p_apellido varchar(256), 
    in p_fecha date, 
    in p_telefono_pais int, 
    in p_telefono_area int, 
    in p_telefono_numero int, 
    out id_out int)
begin
	declare exit handler for sqlexception rollback;
	start transaction;
		insert into titular (nombre, apellido, fecha_de_nacimiento) values (p_nombre, p_apellido, p_fecha);
		set id_out = last_insert_id();
        insert into telefono (id_titular, codigo_de_pais, codigo_de_area, numero) values (id_out, p_telefono_pais, p_telefono_area, p_telefono_numero);
	commit;
end$$
-- inicio definicion store procedure


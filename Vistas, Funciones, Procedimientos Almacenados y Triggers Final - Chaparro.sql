USE centrodeportivo

-- ##########      VISTAS      ##############

DROP VIEW IF EXISTS vista_clientes_membresias_activas;
CREATE VIEW vista_clientes_membresias_activas AS
SELECT 
    c.id_cliente,
    CONCAT(c.nombre, ' ', c.apellido) AS nombre_completo,
    p.nombre AS plan,
    m.fecha_inicio,
    m.fecha_fin
FROM Membresias m
JOIN Clientes c ON m.id_cliente = c.id_cliente
JOIN Planes p ON m.id_plan = p.id_plan
WHERE m.estado = 'Activa';

DROP VIEW IF EXISTS vista_clases_programadas;
CREATE VIEW vista_clases_programadas AS
SELECT 
    cl.id_clase,
    cl.nombre AS clase,
    cl.descripcion,
    i.nombre AS instalacion,
    e.nombre AS instructor,
    cl.fecha,
    cl.hora,
    cl.duracion_minutos
FROM Clases cl
JOIN Instalaciones i ON cl.id_instalacion = i.id_instalacion
JOIN Empleados e ON cl.id_empleado = e.id_empleado;

DROP VIEW IF EXISTS vista_reservas_clientes;
CREATE VIEW vista_reservas_clientes AS
SELECT 
    r.id_reserva,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente,
    cl.nombre AS clase,
    cl.fecha,
    cl.hora,
    r.fecha_reserva
FROM Reservas r
JOIN Clientes c ON r.id_cliente = c.id_cliente
JOIN Clases cl ON r.id_clase = cl.id_clase;

DROP VIEW IF EXISTS vista_pagos_realizados;
CREATE VIEW vista_pagos_realizados AS
SELECT 
    p.id_pago,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente,
    pl.nombre AS plan,
    p.fecha_pago,
    p.monto,
    p.metodo_pago
FROM Pagos p
JOIN Clientes c ON p.id_cliente = c.id_cliente
JOIN Membresias m ON p.id_membresia = m.id_membresia
JOIN Planes pl ON m.id_plan = pl.id_plan;

DROP VIEW IF EXISTS vista_empleados_clases;
CREATE VIEW vista_empleados_clases AS
SELECT 
    e.id_empleado,
    CONCAT(e.nombre, ' ', e.apellido) AS empleado,
    cl.nombre AS clase,
    cl.fecha,
    cl.hora,
    i.nombre AS instalacion
FROM Clases cl
JOIN Empleados e ON cl.id_empleado = e.id_empleado
JOIN Instalaciones i ON cl.id_instalacion = i.id_instalacion;

DROP VIEW IF EXISTS vista_membresias_vencidas;
CREATE VIEW vista_membresias_vencidas AS
SELECT 
    c.id_cliente,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente,
    p.nombre AS plan,
    m.fecha_fin
FROM Membresias m
JOIN Clientes c ON m.id_cliente = c.id_cliente
JOIN Planes p ON m.id_plan = p.id_plan
WHERE m.fecha_fin < CURDATE()
  AND m.estado = 'Inactiva';

-- ##########     FUNCIONES     #############

DROP FUNCTION IF EXISTS fn_calcular_edad_cliente;
DELIMITER $$
CREATE FUNCTION fn_calcular_edad_cliente(idCliente INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE edad INT;
    SELECT TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) 
    INTO edad
    FROM Clientes
    WHERE id_cliente = idCliente;
    RETURN edad;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_membresia_vigente;
DELIMITER $$
CREATE FUNCTION fn_membresia_vigente(idCliente INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE vigente BOOLEAN;
    SELECT COUNT(*) > 0 INTO vigente
    FROM Membresias
    WHERE id_cliente = idCliente
      AND estado = 'Activa'
      AND CURDATE() BETWEEN fecha_inicio AND fecha_fin;
    RETURN vigente;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_total_pagado_cliente;
DELIMITER $$
CREATE FUNCTION fn_total_pagado_cliente(idCliente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT COALESCE(SUM(monto), 0) INTO total
    FROM Pagos
    WHERE id_cliente = idCliente;
    RETURN total;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_reservas_cliente_mes;
DELIMITER $$
CREATE FUNCTION fn_reservas_cliente_mes(idCliente INT, anio INT, mes INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM Reservas
    WHERE id_cliente = idCliente
      AND YEAR(fecha_reserva) = anio
      AND MONTH(fecha_reserva) = mes;
    RETURN total;
END$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_capacidad_disponible_clase;
DELIMITER $$
CREATE FUNCTION fn_capacidad_disponible_clase(idClase INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE capacidad INT;
    DECLARE reservados INT;
    DECLARE disponibles INT;

    SELECT i.capacidad INTO capacidad
    FROM Clases c
    JOIN Instalaciones i ON c.id_instalacion = i.id_instalacion
    WHERE c.id_clase = idClase;

    SELECT COUNT(*) INTO reservados
    FROM Reservas
    WHERE id_clase = idClase;

    SET disponibles = capacidad - reservados;
    RETURN disponibles;
END$$
DELIMITER ;

-- ######## PROCEDIMIENTOS #########


DROP PROCEDURE IF EXISTS sp_registrar_cliente;
DELIMITER $$
CREATE PROCEDURE sp_registrar_cliente (
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_fecha_nacimiento DATE,
    IN p_telefono VARCHAR(20),
    IN p_correo VARCHAR(100),
    IN p_direccion VARCHAR(255)
)
BEGIN
    INSERT INTO Clientes (nombre, apellido, fecha_nacimiento, telefono, correo, direccion, fecha_registro)
    VALUES (p_nombre, p_apellido, p_fecha_nacimiento, p_telefono, p_correo, p_direccion, CURDATE());
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_asignar_membresia;
DELIMITER $$
CREATE PROCEDURE sp_asignar_membresia (
    IN p_id_cliente INT,
    IN p_id_plan INT,
    IN p_fecha_inicio DATE
)
BEGIN
    DECLARE duracion INT;
    DECLARE fecha_fin DATE;

    SELECT duracion_dias INTO duracion FROM Planes WHERE id_plan = p_id_plan;
    SET fecha_fin = DATE_ADD(p_fecha_inicio, INTERVAL duracion DAY);

    INSERT INTO Membresias (id_cliente, id_plan, fecha_inicio, fecha_fin, estado)
    VALUES (p_id_cliente, p_id_plan, p_fecha_inicio, fecha_fin, 'Activa');
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_registrar_pago;
DELIMITER $$
CREATE PROCEDURE sp_registrar_pago (
    IN p_id_cliente INT,
    IN p_id_membresia INT,
    IN p_monto DECIMAL(10,2),
    IN p_metodo_pago VARCHAR(50)
)
BEGIN
    INSERT INTO Pagos (id_cliente, id_membresia, fecha_pago, monto, metodo_pago)
    VALUES (p_id_cliente, p_id_membresia, CURDATE(), p_monto, p_metodo_pago);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_reservar_clase;
DELIMITER $$
CREATE PROCEDURE sp_reservar_clase (
    IN p_id_cliente INT,
    IN p_id_clase INT
)
BEGIN
    DECLARE capacidad INT;
    DECLARE reservados INT;

    SELECT i.capacidad INTO capacidad
    FROM Clases c
    JOIN Instalaciones i ON c.id_instalacion = i.id_instalacion
    WHERE c.id_clase = p_id_clase;

    SELECT COUNT(*) INTO reservados
    FROM Reservas
    WHERE id_clase = p_id_clase;

    IF reservados < capacidad THEN
        INSERT INTO Reservas (id_cliente, id_clase, fecha_reserva)
        VALUES (p_id_cliente, p_id_clase, CURDATE());
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Clase completa: no hay cupos disponibles';
    END IF;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_actualizar_estado_membresias;
DELIMITER $$
CREATE PROCEDURE sp_actualizar_estado_membresias ()
BEGIN
    UPDATE Membresias
    SET estado = 'Inactiva'
    WHERE fecha_fin < CURDATE()
      AND estado = 'Activa';
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_listado_clientes_con_deuda;
DELIMITER $$
CREATE PROCEDURE sp_listado_clientes_con_deuda (IN p_dias INT)
BEGIN
    SELECT c.id_cliente, CONCAT(c.nombre, ' ', c.apellido) AS nombre_completo
    FROM Clientes c
    JOIN Membresias m ON c.id_cliente = m.id_cliente
    WHERE m.estado = 'Activa'
      AND NOT EXISTS (
          SELECT 1
          FROM Pagos p
          WHERE p.id_cliente = c.id_cliente
            AND p.fecha_pago >= DATE_SUB(CURDATE(), INTERVAL p_dias DAY)
      );
END$$
DELIMITER ;

-- ##########      TRIGGERS     #############

DROP TRIGGER IF EXISTS trg_membresia_estado_automatico;
DELIMITER $$
CREATE TRIGGER trg_membresia_estado_automatico
BEFORE INSERT ON Membresias
FOR EACH ROW
BEGIN
    IF NEW.fecha_fin >= CURDATE() THEN
        SET NEW.estado = 'Activa';
    ELSE
        SET NEW.estado = 'Inactiva';
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS trg_actualizar_estado_membresia;
DELIMITER $$
CREATE TRIGGER trg_actualizar_estado_membresia
BEFORE UPDATE ON Membresias
FOR EACH ROW
BEGIN
    IF NEW.fecha_fin < CURDATE() THEN
        SET NEW.estado = 'Inactiva';
    ELSE
        SET NEW.estado = 'Activa';
    END IF;
END$$
DELIMITER ;

CREATE TABLE IF NOT EXISTS Pagos_Auditoria (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_pago INT,
    id_cliente INT,
    id_membresia INT,
    fecha_pago DATETIME,
    monto DECIMAL(10,2),
    metodo_pago VARCHAR(50),
    accion VARCHAR(10),
    fecha_auditoria DATETIME DEFAULT NOW()
);

DROP TRIGGER IF EXISTS trg_pago_registro_auditoria;
DELIMITER $$
CREATE TRIGGER trg_pago_registro_auditoria
AFTER INSERT ON Pagos
FOR EACH ROW
BEGIN
    INSERT INTO Pagos_Auditoria (id_pago, id_cliente, id_membresia, fecha_pago, monto, metodo_pago, accion)
    VALUES (NEW.id_pago, NEW.id_cliente, NEW.id_membresia, NEW.fecha_pago, NEW.monto, NEW.metodo_pago, 'INSERT');
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS trg_evitar_reservas_clientes_sin_membresia;
DELIMITER $$
CREATE TRIGGER trg_evitar_reservas_clientes_sin_membresia
BEFORE INSERT ON Reservas
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Membresias
        WHERE id_cliente = NEW.id_cliente
          AND estado = 'Activa'
          AND CURDATE() BETWEEN fecha_inicio AND fecha_fin
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente no tiene una membresía activa';
    END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS trg_clase_sin_empleado;
DELIMITER $$
CREATE TRIGGER trg_clase_sin_empleado
BEFORE INSERT ON Clases
FOR EACH ROW
BEGIN
    IF NEW.id_empleado IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La clase debe tener un instructor asignado';
    END IF;
END$$
DELIMITER ;

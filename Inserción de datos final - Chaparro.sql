use centrodeportivo
-- ==============================================
-- INSERTAR REGISTROS EN LA TABLA CLIENTES
-- ==============================================
INSERT INTO Clientes (nombre, apellido, fecha_nacimiento, telefono, correo, direccion, fecha_registro) VALUES
('Carlos', 'Martínez', '1985-04-12', '3101234567', 'carlos.martinez@email.com', 'Cra 10 #12-34, Bogotá', '2024-09-15'),
('Laura', 'Gómez', '1990-06-25', '3119876543', 'laura.gomez@email.com', 'Calle 45 #23-56, Medellín', '2024-10-10'),
('Andrés', 'Pérez', '1978-11-03', '3124567890', 'andres.perez@email.com', 'Av. Siempre Viva 123, Cali', '2024-08-20'),
('Sofía', 'Rodríguez', '1995-02-18', '3131237890', 'sofia.rod@email.com', 'Carrera 7 #89-20, Bogotá', '2025-01-05'),
('Daniel', 'López', '1983-09-27', '3141112233', 'daniel.lopez@email.com', 'Calle 90 #12-60, Cartagena', '2025-02-11'),
('María', 'Fernández', '1992-12-10', '3154445566', 'maria.fernandez@email.com', 'Calle 13 #45-67, Barranquilla', '2024-12-21'),
('Jorge', 'Sánchez', '1988-07-08', '3166667788', 'jorge.sanchez@email.com', 'Av. Las Palmas 98, Medellín', '2024-11-18'),
('Camila', 'Ruiz', '1999-01-14', '3178889900', 'camila.ruiz@email.com', 'Calle 33 #65-23, Bogotá', '2025-03-01'),
('Felipe', 'Castro', '1981-05-30', '3187776655', 'felipe.castro@email.com', 'Carrera 45 #54-78, Cali', '2025-04-20'),
('Ana', 'Torres', '1993-08-09', '3195566778', 'ana.torres@email.com', 'Calle 20 #50-30, Medellín', '2024-10-02'),
('Luis', 'Ramírez', '1980-03-22', '3109988776', 'luis.ramirez@email.com', 'Cra 1 #2-3, Bucaramanga', '2024-09-08'),
('Diana', 'Mejía', '1987-06-11', '3112233445', 'diana.mejia@email.com', 'Calle 6 #77-88, Manizales', '2025-01-15'),
('Juan', 'Cano', '1991-04-03', '3121122334', 'juan.cano@email.com', 'Av. 30 #40-60, Neiva', '2024-07-20'),
('Isabella', 'Morales', '1994-07-25', '3133344556', 'isabella.morales@email.com', 'Calle 78 #10-20, Bogotá', '2024-11-10'),
('Mateo', 'Gutiérrez', '1986-10-16', '3145566778', 'mateo.gutierrez@email.com', 'Carrera 60 #80-90, Pereira', '2024-12-05'),
('Valentina', 'Jiménez', '1996-11-01', '3156677889', 'valentina.jimenez@email.com', 'Calle 40 #12-30, Cali', '2025-02-20'),
('Sebastián', 'Vargas', '1982-02-14', '3167788990', 'sebastian.vargas@email.com', 'Cra 15 #8-77, Bogotá', '2025-01-25'),
('Paula', 'Navarro', '1997-03-28', '3178899001', 'paula.navarro@email.com', 'Av. Central #55-10, Medellín', '2024-09-30'),
('David', 'Ríos', '1984-08-05', '3189900112', 'david.rios@email.com', 'Calle 90 #23-45, Barranquilla', '2024-10-22'),
('Natalia', 'Salazar', '1998-05-19', '3191011121', 'natalia.salazar@email.com', 'Carrera 70 #40-50, Cartagena', '2025-03-10');

-- ==============================================
-- INSERTAR REGISTROS EN LA TABLA EMPLEADOS
-- ==============================================
INSERT INTO Empleados (nombre, apellido, cargo, telefono, correo, fecha_contratacion) VALUES
('Mariana', 'González', 'Instructor', '3001112233', 'mariana.gonzalez@gym.com', '2022-01-15'),
('Pedro', 'Martínez', 'Recepcionista', '3014445566', 'pedro.martinez@gym.com', '2023-03-10'),
('Claudia', 'Ramírez', 'Nutricionista', '3027778899', 'claudia.ramirez@gym.com', '2022-08-05'),
('Diego', 'Torres', 'Instructor', '3031234567', 'diego.torres@gym.com', '2023-06-12'),
('Sandra', 'Vargas', 'Gerente', '3049876543', 'sandra.vargas@gym.com', '2021-11-20'),
('Luis', 'Salazar', 'Instructor', '3057654321', 'luis.salazar@gym.com', '2022-09-01'),
('Daniela', 'Cortés', 'Entrenador Personal', '3068889990', 'daniela.cortes@gym.com', '2023-02-18'),
('Carlos', 'Mendoza', 'Limpieza', '3072233445', 'carlos.mendoza@gym.com', '2023-01-25'),
('Tatiana', 'Ríos', 'Instructor', '3083344556', 'tatiana.rios@gym.com', '2022-10-30'),
('Andrés', 'Gómez', 'Recepcionista', '3094455667', 'andres.gomez@gym.com', '2023-04-15'),
('Manuel', 'López', 'Contador', '3005566778', 'manuel.lopez@gym.com', '2021-12-10'),
('Sara', 'Castaño', 'Marketing', '3016677889', 'sara.castano@gym.com', '2022-07-22'),
('Natalia', 'Restrepo', 'Instructor', '3027788990', 'natalia.restrepo@gym.com', '2022-03-19'),
('Esteban', 'Jiménez', 'Soporte Técnico', '3038899001', 'esteban.jimenez@gym.com', '2023-05-03'),
('Lorena', 'Quintero', 'Psicóloga Deportiva', '3049900112', 'lorena.quintero@gym.com', '2022-06-14'),
('Felipe', 'Arias', 'Instructor', '3051011121', 'felipe.arias@gym.com', '2023-01-07'),
('Camila', 'Hernández', 'Ventas', '3062122232', 'camila.hernandez@gym.com', '2022-04-09'),
('Julián', 'Pineda', 'Instructor', '3073233343', 'julian.pineda@gym.com', '2022-08-28'),
('Verónica', 'Luna', 'Nutricionista', '3084344454', 'veronica.luna@gym.com', '2023-03-20'),
('Ricardo', 'Moreno', 'Entrenador Personal', '3095455565', 'ricardo.moreno@gym.com', '2023-02-02');

-- ==============================================
-- INSERTAR REGISTROS EN LA TABLA PLANES
-- ==============================================
INSERT INTO Planes (nombre, descripcion, duracion_dias, precio) VALUES
('Básico Mensual', 'Acceso ilimitado durante un mes a todas las instalaciones básicas.', 30, 80000.00),
('Básico Trimestral', 'Plan básico con acceso por tres meses.', 90, 210000.00),
('Básico Semestral', 'Acceso ilimitado durante seis meses al gimnasio.', 180, 390000.00),
('Premium Mensual', 'Incluye clases dirigidas y zonas premium durante un mes.', 30, 120000.00),
('Premium Trimestral', 'Tres meses de acceso total con entrenadores personales.', 90, 330000.00),
('Premium Anual', 'Acceso anual con beneficios VIP, entrenador y nutricionista.', 365, 1100000.00),
('Estudiante Mensual', 'Plan con descuento para estudiantes universitarios.', 30, 60000.00),
('Familiar Trimestral', 'Permite el acceso a 2 adultos y 2 niños durante 3 meses.', 90, 280000.00),
('Pareja Mensual', 'Acceso mensual para 2 personas a todas las zonas.', 30, 150000.00),
('Entrenamiento Funcional', 'Plan mensual enfocado en clases funcionales grupales.', 30, 95000.00),
('Crossfit Trimestral', 'Acceso a clases y zona exclusiva de Crossfit.', 90, 300000.00),
('Senior Mensual', 'Plan con actividades y clases especiales para mayores de 60 años.', 30, 50000.00),
('Plan Día Libre', 'Acceso por un solo día a todas las instalaciones.', 1, 10000.00),
('Plan Semanal', 'Acceso completo durante 7 días.', 7, 25000.00),
('Plan Empresarial', 'Acceso para empleados de empresas afiliadas (mensual).', 30, 70000.00),
('Plan Médico', 'Plan con control de salud, nutrición y entrenamiento.', 30, 130000.00),
('Plan Pilates', 'Acceso exclusivo a clases de Pilates 3 veces por semana.', 30, 85000.00),
('Plan Yoga', 'Acceso a clases de yoga y meditación, incluye 8 clases al mes.', 30, 90000.00),
('Plan Avanzado', 'Para deportistas de alto rendimiento, incluye zona de fuerza.', 90, 350000.00),
('Plan de Recuperación', 'Plan diseñado para recuperación física post-lesión.', 60, 180000.00);

-- ==============================================
-- INSERTAR REGISTROS EN LA TABLA MEMBRESÍAS
-- ==============================================
INSERT INTO membresias (id_cliente, id_plan, fecha_inicio, fecha_fin, estado) VALUES
(1, 1, '2025-01-01', '2025-01-31', 'Activa'),
(2, 2, '2025-02-01', '2025-05-01', 'Activa'),
(3, 4, '2025-01-10', '2025-02-09', 'Inactiva'),
(4, 6, '2024-12-01', '2025-11-30', 'Activa'),
(5, 3, '2025-03-15', '2025-09-11', 'Activa'),
(6, 5, '2025-01-20', '2025-04-20', 'Inactiva'),
(7, 10, '2025-04-01', '2025-04-30', 'Activa'),
(8, 7, '2025-03-01', '2025-03-31', 'Activa'),
(9, 9, '2025-02-10', '2025-03-10', 'Inactiva'),
(10, 8, '2025-01-05', '2025-04-05', 'Activa'),
(11, 11, '2025-03-12', '2025-06-10', 'Activa'),
(12, 13, '2025-04-05', '2025-04-05', 'Activa'),
(13, 12, '2025-02-01', '2025-02-28', 'Activa'),
(14, 14, '2025-01-15', '2025-01-22', 'Inactiva'),
(15, 15, '2025-03-20', '2025-04-19', 'Activa'),
(16, 16, '2025-04-01', '2025-04-30', 'Activa'),
(17, 17, '2025-02-01', '2025-02-28', 'Inactiva'),
(18, 18, '2025-03-01', '2025-03-31', 'Activa'),
(19, 19, '2025-01-10', '2025-04-10', 'Activa'),
(20, 20, '2025-02-20', '2025-04-21', 'Activa');


-- ==============================================
-- INSERTAR REGISTROS EN LA TABLA INSTALACIONES
-- ==============================================
INSERT INTO Instalaciones (nombre, tipo, capacidad) VALUES
('Sala de Spinning', 'Ciclismo Indoor', 25),
('Zona de Cardio', 'Máquinas', 40),
('Zona de Pesas', 'Entrenamiento de fuerza', 30),
('Salón de Yoga', 'Clases Grupales', 20),
('Piscina Semiolímpica', 'Natación', 15),
('Cancha de Squash', 'Deporte', 4),
('Área Funcional', 'Entrenamiento Funcional', 18),
('Salón de CrossFit', 'CrossFit', 25),
('Salón de Zumba', 'Clases Grupales', 30),
('Sauna', 'Relajación', 6),
('Turco', 'Relajación', 8),
('Sala Pilates', 'Pilates', 15),
('Consultorio Médico', 'Salud', 2),
('Oficina Nutrición', 'Salud', 2),
('Área de Estiramiento', 'Libre', 10),
('Zona de Boxeo', 'Deporte', 8),
('Vestidores Hombres', 'Servicios', 20),
('Vestidores Mujeres', 'Servicios', 20),
('Cafetería', 'Servicios', 12),
('Zona al aire libre', 'Entrenamiento Libre', 30);

-- ==============================================
-- INSERTAR REGISTROS EN LA TABLA CLASES
-- ==============================================
INSERT INTO Clases (nombre, descripcion, id_instalacion, id_empleado, fecha, hora, duracion_minutos) VALUES
('Spinning Matutino', 'Clase de alta intensidad en bicicletas estacionarias.', 1, 1, '2025-06-10', '07:00:00', 45),
('Yoga Relajante', 'Sesión de yoga para mejorar la flexibilidad y reducir el estrés.', 4, 3, '2025-06-10', '09:00:00', 60),
('CrossFit Intermedio', 'Entrenamiento funcional para nivel medio.', 8, 4, '2025-06-11', '18:00:00', 50),
('Zumba Fitness', 'Clase rítmica para quemar calorías al ritmo de la música.', 9, 1, '2025-06-11', '17:00:00', 45),
('Natación Libre', 'Entrenamiento libre en piscina bajo supervisión.', 5, 6, '2025-06-12', '08:00:00', 60),
('Pilates Suelo', 'Ejercicios de control corporal y respiración.', 12, 13, '2025-06-12', '10:00:00', 50),
('Boxeo Básico', 'Técnicas iniciales de boxeo.', 16, 17, '2025-06-13', '19:00:00', 60),
('Funcional Express', 'Rutina funcional de alta intensidad.', 7, 4, '2025-06-13', '06:30:00', 30),
('Meditación Guiada', 'Relajación y enfoque mental.', 4, 15, '2025-06-14', '20:00:00', 40),
('Entrenamiento de Fuerza', 'Ejercicios para desarrollar masa muscular.', 3, 17, '2025-06-14', '15:00:00', 60),
('Cardio Extremo', 'Sesión para quemar grasa rápidamente.', 2, 10, '2025-06-15', '07:00:00', 45),
('Clase de Baile', 'Coreografías de diversos estilos para principiantes.', 9, 1, '2025-06-15', '16:00:00', 60),
('CrossFit Avanzado', 'Desafío físico para niveles avanzados.', 8, 17, '2025-06-16', '18:30:00', 60),
('Yoga Restaurativo', 'Enfocado en recuperación muscular.', 4, 3, '2025-06-16', '08:00:00', 60),
('Pilates Avanzado', 'Mejora de control, fuerza y postura.', 12, 13, '2025-06-17', '11:00:00', 55),
('Entrenamiento Funcional', 'Sesión completa en circuito.', 7, 4, '2025-06-17', '06:00:00', 45),
('Clase de HIIT', 'Intervalos de alta intensidad con descanso corto.', 2, 6, '2025-06-18', '12:00:00', 30),
('Clínica de Estiramiento', 'Técnicas para prevenir lesiones.', 15, 13, '2025-06-18', '09:30:00', 45),
('Taller de Respiración', 'Control de respiración para entrenamientos intensos.', 4, 15, '2025-06-19', '10:30:00', 30),
('Natación Avanzada', 'Entrenamiento de técnica y resistencia.', 5, 6, '2025-06-19', '17:00:00', 60);

-- ==============================================
-- INSERTAR REGISTROS EN LA TABLA RESERVAS
-- ==============================================
INSERT INTO Reservas (id_cliente, id_clase, fecha_reserva) VALUES
(1, 1, '2025-06-05'),
(2, 2, '2025-06-05'),
(3, 3, '2025-06-06'),
(4, 4, '2025-06-06'),
(5, 5, '2025-06-07'),
(6, 6, '2025-06-07'),
(7, 7, '2025-06-08'),
(8, 8, '2025-06-08'),
(9, 9, '2025-06-09'),
(10, 10, '2025-06-09'),
(11, 11, '2025-06-10'),
(12, 12, '2025-06-10'),
(13, 13, '2025-06-11'),
(14, 14, '2025-06-11'),
(15, 15, '2025-06-12'),
(16, 16, '2025-06-12'),
(17, 17, '2025-06-13'),
(18, 18, '2025-06-13'),
(19, 19, '2025-06-14'),
(20, 20, '2025-06-14');

-- ==============================================
-- INSERTAR REGISTROS EN LA TABLA PAGOS
-- ==============================================
INSERT INTO Pagos (id_cliente, id_membresia, fecha_pago, monto, metodo_pago) VALUES
(1, 1, '2025-01-01', 50.00, 'Tarjeta de crédito'),
(2, 2, '2025-02-01', 180.00, 'Transferencia'),
(3, 3, '2025-01-10', 60.00, 'Efectivo'),
(4, 4, '2024-12-01', 600.00, 'Tarjeta de crédito'),
(5, 5, '2025-03-15', 300.00, 'Débito automático'),
(6, 6, '2025-01-20', 150.00, 'Transferencia'),
(7, 7, '2025-04-01', 50.00, 'Efectivo'),
(8, 8, '2025-03-01', 70.00, 'Tarjeta de crédito'),
(9, 9, '2025-02-10', 80.00, 'Efectivo'),
(10, 10, '2025-01-05', 200.00, 'Transferencia'),
(11, 11, '2025-03-12', 250.00, 'Débito automático'),
(12, 12, '2025-04-05', 40.00, 'Efectivo'),
(13, 13, '2025-02-01', 50.00, 'Tarjeta de crédito'),
(14, 14, '2025-01-15', 35.00, 'Transferencia'),
(15, 15, '2025-03-20', 90.00, 'Débito automático'),
(16, 16, '2025-04-01', 75.00, 'Efectivo'),
(17, 17, '2025-02-01', 60.00, 'Tarjeta de débito'),
(18, 18, '2025-03-01', 70.00, 'Tarjeta de crédito'),
(19, 19, '2025-01-10', 200.00, 'Transferencia'),
(20, 20, '2025-02-20', 250.00, 'Débito automático');








# Gestión de Turnos

Este proyecto es una aplicación web para la gestión de turnos, diseñada para realizar operaciones CRUD (Crear, Leer, Actualizar y Borrar) con usuarios, trámites y turnos, utilizando Java y JPA para interactuar con la base de datos. La aplicación incorpora programación funcional en ciertas áreas para optimizar el código.

---

### Diagrama UML
![UML](https://github.com/kodkodmx/habobaAlberto_pruebatec2/blob/f485673a3b608972fd0e6a25974995a13c33aa43/TurneroUML.png)

## Capturas de Pantalla

### Menú Principal
![Menú Principal](https://github.com/kodkodmx/habobaAlberto_pruebatec2/blob/dd8050d1b125d38eb6a8a8009f311152b1056cb4/Captura%20de%20pantalla%202025-01-23%20110445.png)

### Login
![Login](https://github.com/kodkodmx/habobaAlberto_pruebatec2/blob/dd8050d1b125d38eb6a8a8009f311152b1056cb4/Captura%20de%20pantalla%202025-01-23%20110445.png)

---

## Funcionalidades

- **Inicio de sesión seguro:** Se requiere autenticación para acceder al sistema.
- **Gestión de turnos:**
  - Crear nuevos turnos.
  - Listar todos los turnos, filtrar por estado (en espera o atendidos).
  - Editar turnos existentes.
  - Cambiar el estado de un turno.
  - Eliminar turnos.
- **Programación funcional:** Utilizada en el método `procesarListadoTurnos` en el servlet `GestorTurnosSv`.

---

## Usuarios y Contraseñas

- **Base de datos:** 
  - Usuario: `vacio`
  - Contraseña: `vacio`
- **Tomcat:** 
  - Usuario: `user`
  - Contraseña: `admin`
- **Administrador de la aplicación:**
  - Correo: `administrador@dominio.com`
  - Contraseña: `admin`

---

## Requisitos Técnicos

- **Lenguaje:** Java 8 o superior
- **Servidor:** Apache Tomcat 9
- **Base de Datos:** MySQL
- **Persistencia:** JPA (EclipseLink)
- **IDE recomendado:** NetBeans

---

## Configuración del Proyecto

### Clonar el repositorio

```bash
git clone https://github.com/kodkodmx/habobaAlberto_pruebatec2.git
cd habobaAlberto_pruebatec2
````
## Configuración del Proyecto

### Configurar la base de datos

1. Abre phpMyAdmin desde XAMPP (`http://localhost/phpmyadmin`).
2. Crea una nueva base de datos con el nombre `turnos`.
3. Importa las tablas necesarias utilizando un archivo `.sql` generado previamente.
4. Si no tienes el archivo `.sql`, contacta al administrador del repositorio.

### Configurar Tomcat

1. Accede al archivo `tomcat-users.xml` en el directorio de configuración de Tomcat (`conf/tomcat-users.xml`).
2. Asegúrate de tener configurado un usuario administrador:

```xml
<role rolename="manager-gui"/>
<user username="user" password="admin" roles="manager-gui"/>
```
### Ejecutar el proyecto

1. Abre el proyecto en NetBeans.
2. Configura el servidor Apache Tomcat y asegúrate de que esté apuntando a la base de datos `turnos`.
3. Ejecuta la aplicación desde el IDE.

### Uso del Sistema

1. Accede al sistema desde `http://localhost:8080/habobaAlberto_pruebatec2`.
2. Inicia sesión con las credenciales del administrador.
3. Usa las opciones del menú para:
   - Listar turnos.
   - Crear, editar o eliminar turnos.
   - Cambiar el estado de los turnos.

### Estructura del Proyecto

- **ControladoraLogica:** Clase que centraliza la lógica de negocio.
- **Servlets:**
  - `GestorTurnosSv`: Gestiona las operaciones principales de la aplicación.
  - `EditarTurnoSv`: Gestiona la edición de un turno.
- **Entidades:**
  - `Turno`: Representa un turno en el sistema.
  - `Ciudadano`: Representa un ciudadano asociado a un turno.
  - `Tramite`: Representa un trámite asociado a un turno.

### Programación Funcional

El método `procesarListadoTurnos` en la clase `GestorTurnosSv` utiliza programación funcional para filtrar y procesar listas de turnos de manera eficiente.

#### Ejemplo de uso:

```java
List<Turno> turnos = "todos".equals(estado)
    ? control.traerTodosLosTurnos()
    : control.traerTurnosPorEstado(estado).stream()
        .filter(turno -> turno.getEstado().toString().equalsIgnoreCase(estado))
        .toList();

session.setAttribute("listaTurnos", turnos);
```
### Contribuciones

1. Realiza un fork del repositorio.
2. Crea una nueva rama:

```bash
git checkout -b feature/nueva-funcionalidad
```
### Realiza tus cambios y súbelos:
```bash
git commit -am 'Agrega nueva funcionalidad'
```
### Abre un Pull Request.
Licencia
Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](https://github.com/kodkodmx/habobaAlberto_pruebatec1/blob/c25cf75b19e180a2341016e2b10b0aacb5c9df93/LICENSE) para más detalles.

Con este formato, el bloque está correctamente estructurado para incluir los comandos en `bash` dentro del código de formato adecuado. Si necesitas más ajustes o detalles, avísame.

# Supuestos

El usuario usa una pantalla con resolucion minima de 1920 x 1080 y en caso de no ser asi ajustara la vista con el zoom del navegador.
Se preparan las clases para usar borrado logico pero por falta de tiempo para cumplir con el dead-line no se implementa la logica.

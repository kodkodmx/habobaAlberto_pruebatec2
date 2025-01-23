<<<<<<< HEAD
# Gestión de Empleados
login https://github.com/kodkodmx/habobaAlberto_pruebatec2/blob/dd8050d1b125d38eb6a8a8009f311152b1056cb4/Captura%20de%20pantalla%202025-01-23%20110445.png
Este proyecto es una aplicación de backend para la gestión de empleados de una empresa. Permite realizar operaciones CRUD (Crear, Leer, Actualizar y Borrar) utilizando JPA para interactuar con una base de datos.

## Video de prueba y foto del Menu ASCII
![image](https://github.com/user-attachments/assets/59b1e1ca-32c5-4635-9495-90ace46e3663)

[Video en YouTube](https://youtu.be/PcpvcGs00jw)

## Funcionalidades

- **Menú ASCII interactivo:** Proporciona un menú atractivo para la interacción del usuario.
- **Agregar un nuevo empleado:** Permite ingresar información sobre un nuevo empleado, incluyendo nombre, apellido, cargo, salario y fecha de inicio.
- **Listar empleados:** Visualiza la lista de todos los empleados en la base de datos.
- **Buscar empleados por cargo:** Busca empleados por su cargo y muestra una lista de los empleados que tienen ese cargo.
- **Actualizar información de un empleado:** Modifica la información de un empleado existente.
- **Eliminar un empleado:** Elimina un empleado de la base de datos.

## Requisitos Técnicos

- **Lenguaje:** Java
- **Persistencia:** JPA (Java Persistence API)
- **Base de Datos:** Nombre de la base de datos: `empleados`
- **Control de Versiones:** GitHub (nombre del repositorio: `albertoHaboba_pruebatec1`)

## Configuración y Ejecución

1. **Clonar el repositorio:**

   ```bash
   git clone https://github.com/kodkodmx/albertoHaboba_pruebatec1.git
   cd albertoHaboba_pruebatec1
   ```
## Configurar la base de datos:

Asegúrate de tener una base de datos llamada empleados.
Ejecuta el archivo [empleados.sql](https://github.com/kodkodmx/habobaAlberto_pruebatec1/blob/46ae5780609ee553a57a638aeabcbb6e5dc6c387/empleado.sql) para configurar las tablas necesarias.

## Compilar el proyecto:

Si estás usando Maven:
  ```bash
  mvn clean install
  ```
Si estás usando Gradle:
  ```bash
  gradle build
  ```          
## Ejecutar la aplicación:
Puedes ejecutar la aplicación desde tu IDE favorito o desde la línea de comandos:
 ```bash
  java -cp target/tu-archivo-jar.jar com.softek.habobaalberto_pruebatec1.HabobaAlberto_pruebatec1
  ```
## Supuestos
- Se utiliza un menú ASCII para mejorar la experiencia del usuario.
- Se asume que los usuarios tienen permisos para acceder y modificar la base de datos.
- La validación de datos realizada asegura que los campos obligatorios no estén vacíos y sean validos.
- Sea asigna automaticamente por la base de datos un numero de identificacion ID a cada empledo que se registra. La cual se maneja como la clave principal (Primary Key) en la base de datos. El numero es unico e irrepetible.
- Se usa la clase BigDecimal en java y Decimal en la base de datos para evitar perdida de exactitud y esto se logra especificando los atributos de esa columna en especifico manualmente con la etiqueta @column.
- No se implementa la busqueda personalizada en la base de datos para cumplir con la consigna "Utiliza colecciones para gestionar los datos antes de interactuar con la base de datos."
- Se cumple con el extra de "La aplicación debe ser capaz de manejar errores y excepciones de manera apropiada, como la gestión de registros duplicados o la búsqueda de empleados que no existen, etc." ademas para la verificacion de formato correcto en salarios, fechas, ids y cargos. **Sin embargo no se usa try and catch en caso de empleado existente ya que eso no es un error o excepcion, sino mas bien es parte del flujo normal de la applicacion ya que en si no son duplicados porque el id lo maneja automaticamente la base de datos.**
- Se cumple con principios de programacion como No te repitas (DRY), Manténlo simple (KISS), No lo vas a necesitar (YAGNI), SOLID, Separación de responsabilidades, Encapsulamiento, Modularidad, Abstracción, Principio de Pareto (80/20), Desarrollo guiado por pruebas (TDD), Consistencia, Programación defensiva, No sobreingeniería, Optimización de código (cuando sea necesario), Refactorización, Principio de la menor sorpresa.
- En el comit fba23d6 "listo para pruebas finales" hay una version lista mucho mas simple con menos clases pero al tratar de hacerla mas profesional se complico todo un poco mas.

## Estructura de archivos

![image](https://github.com/user-attachments/assets/6a41a2e4-9261-4b0a-ad99-dcd2493d480c)

## Classes
1. Paquete com.softek.albertoHaboba_pruebatec1 es el paquete principal y contiene la clase principal:
   1. albertoHaboba_pruebatec1 (main) en donde corre un ciclo while que es el encargado de dirigir el flujo de la aplicacion mediante un switch anidado con 6 opciones.
2. Paquete logica tenemos:
   1. GestorEmpleados es la clase que concentra y administra todos los metodos para trabajar con la clase empleado.
   2. Clase Empleado es la clase o molde de los objetos que son usados en la aplicación la cual contiene todos sus atributos.
3. Paquete persistencia:
   1. EmpleadoJPAController es la clase donde estan definidos los metodos JPA que son los encargados de interactuar con la base de datos.
   2. ControladoraPersistencia es la clase que contiene los emtodos que cree para interactuar con el JPAController y la lagica de mi aplicación.
4. Paquete ui:
   1. CapturaDatos es la clase que implementa los formularios para que el usuario capture la informacion del crud y se penso asi ya que varios metodos repiten el mismo proceso de captura de datos para        realizar sus funciones.
   1. InterfazUsuario es el equivalente al front o la interfaz grafica que en este caso solo implementa en terminal un menu ascii interactivo con su logica para verificar que la opcion elegida sea valida.
5. persistencia.exceptions clase creada automaticamente por JPA con metodos propios.

## Metodos
- crearEmpleado llama a capturarEmpleado que a su ves llama 3 veces a capturarDatos, capturarSalario y a capturarFechaIngles para crear una instancia de Empleado que se lo pasa a la ControladoraPersistencia que jama a create de JPA que se conecta a la base de datos y realiza un INSERT.
- consultarTodos llama directo a la controladora que llama al JPA controller para un SELECT * en la base de datos.
- consultarPorCargo llama a capturaCargo y luego llama a traerTodos (SELECT *) y lo almacena en un List<Empleados> para despues verificar con un for/each si el cargo capturado coincide con el cargo de alguno de los Empleados y de ser asi lo almacena en un ArrayList que muestra al final sus valores.
- modificarEmpleado descarga con traerTodos y almacena en lista para luego llamar a capturarID y si coincide con algun Empleado en el ArrayList llama a capturarEmpeado y para luego se lo pasa a modificarEmpleado en la controladora que usa el metodo edit para reescribir la entrada con la ID coincidente con el nuevo Empleado
- borrarEmpleado llama a capturarID de CapturaDatos y luego se lo pasa a eliminarEmpleado de la controladora que llamam a destroy del JPA controller que usa un DROP en la base de datos.

## Manejo de Excepciones
La aplicación maneja errores y excepciones, como en la busquedad de registros duplicados y búsquedas de empleados inexistentes, para asegurar una experiencia de usuario fluida.
   
## Contribuciones
Las contribuciones son bienvenidas. Por favor, sigue los pasos a continuación para contribuir:

## Haz un fork del proyecto.
Crea una nueva rama (git checkout -b feature/nueva-funcionalidad).
Realiza tus cambios y haz commit (git commit -am 'Agrega nueva funcionalidad').
Sube tus cambios a la rama (git push origin feature/nueva-funcionalidad).
Abre un Pull Request.

## Licencia
Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](https://github.com/kodkodmx/habobaAlberto_pruebatec1/blob/b7ca3724449356290610ba57fa8e9305bd59bf29/LICENSE) para más detalles.
=======
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

El usuario usa una pantalla con resolucion minima de 1920 x 1080 y en caso de no ser asi ajustara la vista con el zoom de navegador.
>>>>>>> e0ab7bfa9a0cd86c39945ab6c5a6bf0f21ffabdc

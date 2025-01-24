# Gestión de Turnos

Este proyecto es una aplicación web para la gestión de turnos, diseñada para realizar operaciones CRUD (Crear, Leer, Actualizar y Borrar) con usuarios, ciudadanos, trámites y turnos, utilizando Java, JSP y JPA para interactuar con la base de datos. La aplicación incorpora programación funcional en ciertas áreas para optimizar el código.

[Video en YouTube](https://youtu.be/lNGV2wPgPpw) Mostrando el funcionamiento.
---
## Capturas de Pantalla

### Login
![Login](https://github.com/kodkodmx/habobaAlberto_pruebatec2/blob/dd8050d1b125d38eb6a8a8009f311152b1056cb4/Captura%20de%20pantalla%202025-01-23%20110445.png)

### Menú Principal
![Menú Principal](https://github.com/kodkodmx/habobaAlberto_pruebatec2/blob/main/Captura%20de%20pantalla%202025-01-23%20111026.png)

### Diagrama UML
![UML](https://github.com/kodkodmx/habobaAlberto_pruebatec2/blob/f485673a3b608972fd0e6a25974995a13c33aa43/TurneroUML.png)
---

## Funcionalidades

- **Inicio de sesión seguro:** Se requiere autenticación para acceder al sistema.
- **Gestión de turnos, ciudadanos, tramites y usuarios:**
  - Crear nuevas entradas.
  - Listar todas las entradas, busquedas personalizadas por entidad y filtrar turnos por estado (en espera o atendidos).
  - Editar entradas existentes.
  - Cambiar el estado de un turno.
  - Eliminar entrdas.

---

### Estructura del Proyecto

- **UI**
- **Servlets**
- **ControladoraLogica:** Clase que centraliza la lógica de negocio.
- **Entidades:**
  - `Turno`: Representa un turno en el sistema.
  - `Ciudadano`: Representa un ciudadano asociado a un turno.
  - `Tramite`: Representa un trámite asociado a un turno.
  - `Usuario`: Representa a la persona que opera el sistema.

 ---

# Cumplimiento con el Modelo de Capas

El proyecto sigue el **modelo de capas** al dividir la aplicación en distintas capas funcionales, cada una responsable de un conjunto específico de tareas. Esto facilita la separación de responsabilidades, la escalabilidad y el mantenimiento del código.

## 1. Capa de Presentación (UI)

En esta capa se encuentran los elementos que interactúan directamente con el usuario, como las páginas JSP (por ejemplo, `listarTurnos.jsp`, `editarTurno.jsp`). Esta capa se encarga de mostrar la información al usuario y recoger la entrada del mismo. Aquí es donde se gestionan las vistas de la aplicación.

- **Responsabilidad:** Presentar la interfaz y gestionar la interacción con el usuario.
- **Archivos implicados:** JSPs, formularios HTML, botones de acción, y mensajes de respuesta.

## 2. Capa de Control (Servlets)

Esta capa gestiona las solicitudes HTTP y la lógica de control del flujo de la aplicación. Los **Servlets** son los encargados de procesar las acciones que realiza el usuario en la interfaz. Se encargan de orquestar las interacciones entre la capa de presentación y la capa de lógica de negocio.

- **Responsabilidad:** Recibir las solicitudes del usuario, procesar las operaciones y redirigir a las vistas correspondientes.
- **Archivos implicados:** `GestorTurnosSv`, `EditarTurnoSv`, etc.
- **Ejemplo:** El servlet `GestorTurnosSv` maneja la creación, actualización, eliminación y listado de turnos, manejando muchas de las operaciones de negocio junto con a la capa lógica.

## 3. Capa de Lógica de Negocio (ControladoraLogica)

Esta capa contiene la lógica central de la aplicación. Es la encargada de aplicar las reglas de negocio y coordinar las operaciones entre las entidades y la base de datos. Esta capa realiza las tareas de validación, procesamiento y preparación de datos antes de enviarlos a la capa de persistencia.

- **Responsabilidad:** Gestionar las reglas de negocio y los procesos que definen el comportamiento de la aplicación.
- **Archivos implicados:** `ControladoraLogica`, clases relacionadas con la lógica de negocio, y otros controladores que gestionan la creación, modificación y eliminación de los turnos y otras entidades.
- **Ejemplo:** El método `procesarListadoTurnos` en el servlet `GestorTurnosSv`, que usa programación funcional para procesar y filtrar la lista de turnos según su estado.

## 4. Capa de Persistencia (JPA y Base de Datos)

Esta capa maneja la interacción con la base de datos. Utiliza JPA (Java Persistence API) para realizar las operaciones de almacenamiento, actualización y eliminación de datos. Esta capa está encargada de abstraer la complejidad de la base de datos, ofreciendo una interfaz sencilla para interactuar con los datos de la aplicación.

- **Responsabilidad:** Gestionar la persistencia de datos, interactuar con la base de datos y realizar las operaciones CRUD.
- **Archivos implicados:** Clases de entidad como `Turno`, `Ciudadano`, `Tramite`, `Usuario` y las clases JPA como `ControladoraPersistencia`.
- **Ejemplo:** La clase `ControladoraPersistencia` que se encarga de la comunicación con la base de datos mediante JPA y la persistencia de objetos de la aplicación.

## 5. Capa de Excepciones

Esta capa se encarga de manejar todas las excepciones y errores que puedan surgir durante la ejecución del programa, asegurando una experiencia de usuario más fluida y controlada. Esta capa se integra con las demás capas para manejar posibles errores como valores inválidos o fallos en la base de datos.

- **Responsabilidad:** Manejar las excepciones y errores de la aplicación de manera controlada.
- **Ejemplo:** Manejo de excepciones en los servlets (`try-catch` en el servlet `GestorTurnosSv` para el procesamiento de turnos).

## Resumen

- **Capa de Presentación:** JSP y HTML, interactúa con el usuario.
- **Capa de Control:** Servlet, maneja las solicitudes y dirige la interacción entre la vista y la lógica.
- **Capa de Lógica de Negocio:** ControladoraLogica, donde reside la lógica que define el comportamiento de la aplicación.
- **Capa de Persistencia:** JPA, maneja la interacción con la base de datos para realizar las operaciones CRUD.
- **Capa de Excepciones:** Gestión de errores y excepciones.

Este enfoque en capas garantiza que cada capa sea responsable de un aspecto específico del flujo de datos en la aplicación, facilitando el mantenimiento y la evolución del proyecto.


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
  - **Configuración de Tomcat:** Debes configurar el archivo `tomcat-users.xml` para roles y usuarios (como se detalla más abajo).
- **Base de Datos:** MySQL
  - **Nombre de la base de datos:** turnero
  - **Configuración:** XAMPP o cualquier otro servidor compatible con MySQL
- **Persistencia:** JPA (EclipseLink)
- **IDE recomendado:** NetBeans
- **Tecnologías Web:**
  - **JSP (JavaServer Pages):** Usado para generar las vistas de la aplicación (las interfaces de usuario).
  - **Servlets:** Usados para manejar las solicitudes del cliente y gestionar la lógica de negocio.
- **Dependencias:**
  - **Maven:** Para la gestión de dependencias, si usas Maven.
  - **JPA (EclipseLink):** Para la persistencia de datos.
  - **JDBC:** Para la conexión con la base de datos MySQL.
  - **Servlets API:** Para el desarrollo de las funcionalidades web.
  - **Tomcat:** Para ejecutar las aplicaciones web JSP y Servlets.
- **Sistema Operativo:** Compatible con cualquier sistema operativo que soporte Java y Tomcat (Windows, Linux, macOS).
- **Configuración de Tomcat:**
  - **Versión recomendada:** Tomcat 9
  - **Configuración del archivo `tomcat-users.xml` para roles y usuarios:**
    ```xml
    <role rolename="manager-gui"/>
    <user username="user" password="admin" roles="manager-gui"/>
    ```

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
2. Crea una nueva base de datos con el nombre `turnero`.
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
2. Configura el servidor Apache Tomcat y asegúrate de que esté apuntando a la base de datos `turnero`.
3. Ejecuta la aplicación desde el IDE.

### Uso del Sistema

1. Accede al sistema desde `http://localhost:8080/habobaAlberto_pruebatec2`.
2. Inicia sesión con las credenciales del administrador.
3. Usa las opciones del menú para:
   - Listar usuarios, ciudadanos, trámites y turnos.
   - Crear, editar o eliminar usuarios, ciudadanos, trámites y turnos.
   - Cambiar el estado de los turnos.

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

1. El usuario usa una pantalla con resolucion minima de 1920 x 1080 y en caso de no ser asi ajustara la vista con el zoom del navegador.
2. Se preparan las clases para usar borrado logico pero se deja para mas adelante la implementación logica.

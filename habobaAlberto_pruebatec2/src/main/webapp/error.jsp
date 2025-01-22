<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            text-align: center;
            margin-top: 50px;
        }
        .error-container {
            padding: 20px;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            display: inline-block;
            background-color: #f8d7da;
        }
        .error-container h1 {
            margin-bottom: 20px;
        }
        .error-container p {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Error</h1>
        <p>Se ha producido un error en el sistema.</p>
        <p><a href="index.jsp">Volver a la página principal</a></p>
    </div>
</body>
</html>

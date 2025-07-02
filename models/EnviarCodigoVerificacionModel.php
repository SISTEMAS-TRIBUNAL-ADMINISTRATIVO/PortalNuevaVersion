<?php
    require_once("../public/PHPMailer/src/PHPMailer.php");
    require_once("../public/PHPMailer/src/SMTP.php");   
    require_once("../public/PHPMailer/src/Exception.php");  

    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;


    class CodigoVerificacion extends Conectar
    {
        public function EnviarCodigoACorreo($correo, $NombreUsuario)
        {
            $codigo_verificacion = rand(100000, 999999);


            $mail = new PHPMailer(true);
            try {
                $mail->isSMTP();
                $mail->Host = 'smtp.gmail.com'; // ej. smtp.gmail.com
                $mail->SMTPAuth = true;
                $mail->Username = 'informaticatapje@gmail.com';
                $mail->Password = 'beki ybgt bwji eyec';
                $mail->SMTPSecure = 'tls'; // o 'ssl'
                $mail->Port = 587; // 465 para ssl

                $mail->setFrom('informaticatapje@gmail.com', 'Tribunal de Justicia Administrativa del Estado de Chiapas');
                $mail->addAddress($correo, $NombreUsuario);

                $mail->isHTML(true);
                $mail->Subject = 'Código de verificación de tu cuenta';
                $mail->CharSet = 'UTF-8';
                $mail->Encoding = 'base64';
                $mail->Body = "
                    <h3>Hola $NombreUsuario,</h3>
                    <p>Gracias por registrarte. Tu código de verificación es:</p>
                    <h2 style='color: #007bff;'>$codigo_verificacion</h2>
                    <p>Por favor ingrésalo en el sistema para activar tu cuenta.</p>
                ";

                $mail->send();
            } catch (Exception $e) 
            {
            }

            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "UPDATE cat_usuario
                    SET 
                        codigo_verificacion = ?
                    WHERE email = ?";


            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $codigo_verificacion);
            $stmt->bindValue(2, $correo);
            $stmt->execute();
        }

        public function verificarCodigo($validacion, $codigo)
        {
            $conectar = parent::conexion("portal_empleado");
            parent::set_names();

            $sql = "SELECT codigo_verificacion
                    FROM cat_usuario
                    WHERE autorizacion = ? AND codigo_verificacion = ?";

            $stmt = $conectar->prepare($sql);
            $stmt->bindValue(1, $validacion);
            $stmt->bindValue(2, $codigo);
            $stmt->execute();
            $stmt->execute();
            $Resultado = $stmt->fetchAll();
            return $Resultado;
        }
    }
?>
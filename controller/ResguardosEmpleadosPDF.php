<?php
require_once("../config/conexion.php");
require_once('../TCPDF/tcpdf_include.php'); 
require_once("../models/ResguardosModel.php");
require_once("../models/EmpleadosModel.php");

    $Resguardo = new Resguardos();
    $Empleados = new Empleados();

    $datos = $Resguardo->ResguardosEmpleadoXid($_SESSION['Enlace']);
    $empleado = $Empleados->EmpleadoXid($_SESSION["Enlace"]);


// Crear clase personalizada que extiende TCPDF
class MYPDF extends TCPDF {

    // Cabecera
    public function Header() {
        // Establecer la fuente para el texto del encabezado
        $this->SetFont('helvetica', 'B', 10);

        // Obtener el ancho de la página
        $w = $this->getPageWidth();

        // Definir las posiciones de las imágenes (en este caso, se colocan más cerca de los bordes)
        $logo_izquierda = '../public/images/logo.png';  // Ruta de la primera imagen
        $logo_derecha = '../public/images/logoPJ.png';   // Ruta de la segunda imagen
        
        // Colocar la primera imagen (más cerca de la orilla izquierda)
        $this->Image($logo_izquierda, 10, 5, 20, 25, '', '', '', false, 300, '', false, false, 0);
        
        // Colocar la segunda imagen (más cerca de la orilla derecha)
        $this->Image($logo_derecha, $w - 35, 5, 20, 25, '', '', '', false, 300, '', false, false, 0);

        // Salto de línea para la separación entre las imágenes y el texto
        $this->Ln(3);

        // Texto de la primera fila (en negrita)
        $this->SetFont('helvetica', 'B', 10);  // Establecer fuente en negrita
        $this->Cell(0, 5, 'TRIBUNAL ADMINISTRATIVO DEL PODER JUDICIAL DEL ESTADO DE CHIAPAS', 0, 1, 'C'); 

        // Texto de la segunda fila (en fuente normal)
        $this->SetFont('helvetica', '', 10);  // Fuente normal
        $this->Cell(0, 5, 'UNIDAD DE APOYO ADMINISTRATIVO / AREA DE INFORMATICA', 0, 1, 'C'); 

        // Texto de la tercera fila (en fuente normal)
        $this->Cell(0, 5, 'SISTEMA DE RESGUARDO DE BIENES INFORMATICOS', 0, 1, 'C');
        
        // Texto de la cuarta fila (en negrita)
        $this->SetFont('helvetica', 'B', 10);  // Fuente en negrita
        $this->Cell(0, 7, 'CONTROL INTERNO', 0, 0.5, 'C'); 

        // Dibujar una línea de color vino debajo del encabezado
        $this->SetDrawColor(139, 0, 0); // Color vino (RGB)
        $this->Line(10, $this->GetY() + 5, $w - 10, $this->GetY() + 5);
        // Línea en el encabezado

        // Salto de línea adicional para separar la línea del cuerpo del documento
        $this->Ln(10); 
        
        // Establecer la fuente del pie de página
        $this->SetFont('helvetica', 'I', 8);

        // Agregar el número de página
        $this->Cell(0, 10, 'Página ' . $this->PageNo(), 0, 0, 'R');
    }


    // Método para agregar el contenido del formulario (dinámico)
    public function contenidoFormulario($empleado) {

        // Extraer los datos del empleado
 $plaza = $empleado['Plaza'];  // Corrected: use $empleado instead of $datosEmpleado
    $personaResguardante = $empleado['Empleado'];  // Corrected: use $empleado instead of $datosEmpleado
    $areaEnFuncion = $empleado['AREA'];  // Corrected: use $empleado instead of $datosEmpleado
    $categoria = $empleado['Categoria'];  // Corrected: use $empleado instead of $datosEmpleado
        $this->Ln(10);
        $this->SetFont('helvetica', '', 10);

        // Iniciar en una posición específica (sin usar tabla, solo texto)


        // Datos de la izquierda (columna 1)
        $this->SetXY(10, $this->GetY()); // Posición en la izquierda
        $this->Cell(0, 5, 'Plaza: $plaza', 0, 1, 'L');
        
        $this->SetXY(10, $this->GetY());
        $this->Cell(0, 5, 'Persona Resguardante: $personaResguardante', 0, 1, 'L');

        $this->SetXY(10, $this->GetY());
        $this->Cell(0, 5, 'Área en Función: $datosEmpleado', 0, 1, 'L');

        $this->SetXY(10, $this->GetY());
        $this->Cell(0, 5, 'Categoría: $categoria', 0, 1, 'L');

        // Espaciado
        $this->Ln(-20);

        // Datos de la derecha (columna 2)
        $w = $this->getPageWidth();  // Ancho de la página
        $this->SetXY($w - 150, $this->GetY()); // Posición a la derecha
        $this->Cell(0, 5, 'Fecha: ' . date('d/m/Y'), 0, 1, 'L'); // Mostrar la fecha actual

        $this->SetXY($w - 150, $this->GetY());
        $this->Cell(0, 5, 'Piso: ____________', 0, 1, 'L');

        $this->SetXY($w - 150, $this->GetY());
        $this->Cell(0, 5, 'Total de Bienes: ____________', 0, 1, 'L');

    
    }
    public function contenidoTabla($datos) {
        
        $this->Ln(10);
        $this->SetFont('helvetica', '', 8);
    
        // Obtener el ancho de la página
        $w = $this->getPageWidth();
        $column_width = ($w - 20) / 7;  // Ancho de las columnas (7 columnas)
    
        // Encabezados de la tabla
        $header = array('No.', 'Descripcion del bien informatico', 'Marca', 'Modelo', 'Numero de serie', 'Numero de inventario', 'Observaciones');
        foreach ($header as $col) {
            $this->Cell($column_width, 6, $col, 1, 0, 'C');
        }
        $this->Ln(); // Nueva línea después del encabezado
    
        // Verifica si hay resultados y los recorre
        $no = 1;
        foreach ($datos as $equipo) {
            $this->Cell($column_width, 5, $no++, 1, 0, 'C');  // Número de fila
            $this->Cell($column_width, 5, $equipo['Descripcion'], 1, 0, 'L');
            $this->Cell($column_width, 5, $equipo['Marca'], 1, 0, 'L');
            $this->Cell($column_width, 5, $equipo['Modelo'], 1, 0, 'L');
            $this->Cell($column_width, 5, $equipo['Serie'], 1, 0, 'L');
            $this->Cell($column_width, 5, $equipo['Inventario'], 1, 0, 'L');
            $this->Cell($column_width, 5, $equipo['Observacion'], 1, 0, 'L');
            $this->Ln();  // Nueva línea después de cada fila
        }
    }

    public function Footer() {
        // Posicionar al final de la página
        $this->SetY(-50);
        $this->Ln(5);

        // Crear 4 columnas debajo de la tabla (Elaboro, Reviso, Vte, Recibe de conformidad)
        $this->SetFont('helvetica', 'B', 8);

        // Obtener el ancho de la página
        $w = $this->getPageWidth();

        // Posicionar en la parte izquierda de la página

        // Columna 1 - ELABORO
        $this->SetXY(16, $this->GetY());
        $this->Cell(10, 5, 'ELABORO', 0, 1, 'C'); // Título
        $this->SetXY(16, $this->GetY());
        $this->Cell(10, 5, '___________', 0, 1, 'L'); // Línea para completar
        $this->SetXY(16, $this->GetY());
        $this->Cell(10, 5, 'Nombre: _______________________', 0, 1, 'L'); // Nombre
        $this->SetXY(16, $this->GetY());
        $this->Cell(10, 5, 'Área: _______________________', 0, 1, 'L'); // Área

        // Columna 2 - REVISO
        $this->SetXY(85, $this->GetY() - 20); // Mueve la posición vertical de la segunda columna
        $this->Cell(30, 5, 'REVISO', 0, 1, 'L');
        $this->SetXY(85, $this->GetY());
        $this->Cell(30, 5, '___________', 0, 1, 'L');
        $this->SetXY(85, $this->GetY());
        $this->Cell(30, 5, 'Nombre: _______________________', 0, 1, 'L');
        $this->SetXY(85, $this->GetY());
        $this->Cell(30, 5, 'Área: _______________________', 0, 1, 'L');

        // Columna 3 - VTE
        $this->SetXY(160, $this->GetY() - 20); // Mueve la posición vertical de la tercera columna
        $this->Cell(50, 5, 'VTE', 0, 1, 'L');
        $this->SetXY(160, $this->GetY());
        $this->Cell(50, 5, '___________', 0, 1, 'L');
        $this->SetXY(160, $this->GetY());
        $this->Cell(50, 5, 'Nombre: _______________________', 0, 1, 'L');
        $this->SetXY(160, $this->GetY());
        $this->Cell(50, 5, 'Área: _______________________', 0, 1, 'L');

        // Columna 4 - RECIBE DE CONFORMIDAD
        $this->SetXY(230, $this->GetY() - 20); // Mueve la posición vertical de la cuarta columna
        $this->Cell(70, 5, 'RECIBE DE CONFORMIDAD', 0, 1, 'L');
        $this->SetXY(230, $this->GetY());
        $this->Cell(70, 5, '___________', 0, 1, 'L');
        $this->SetXY(230, $this->GetY());
        $this->Cell(70, 5, 'Nombre: _______________________', 0, 1, 'L');
        $this->SetXY(230, $this->GetY());
        $this->Cell(70, 5, 'Área: _______________________', 0, 1, 'L');

        $this->Ln(10);
    
        // Establecer la fuente en negrita
        $this->SetFont('helvetica', 'B', 5);
    
        // Usar MultiCell para manejar saltos de línea
        $text = 'NOTA: La firma que aparece al calce, es autentica de Usted que lo compromete a ser la unica persona responsable del trato y del buen uso que les de a estos bienes informaticos resguardados.' . "\n" .'Queda estrictamente prohibido realizar cambios sin previa autorización del Área de Informática.' . "\n" . 'Este documento deja sin efecto cualquier otro resguardo emitido con la fecha anterior.';
        
        // Configuramos la celda multi-linea
        $this->MultiCell(0, 5, $text, 0, 'L', 0, 1, '', '', true);
        
        // Restablecer posición en Y para asegurar el pie de página
        $this->SetY(-15);
        // Añadir una imagen de fondo en el pie de página
         $this->Image('../public/images/fondo_footer.png', 10, $this->GetY(), 190, 40, '', '', '', false, 300, '', false, false, 0);
    }


}

// Crear nuevo documento PDF con la clase personalizada
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// Establecer información del documento
$pdf->setCreator(PDF_CREATOR);
$pdf->setAuthor('TRIBUNAL ADMINISTRATIVO DEL PODER JUDICIAL DE CHIAPAS');
$pdf->setTitle('BIENES INFORMATICOS');
$pdf->setSubject('Reporte de Bienes Informáticos');

// Establecer márgenes y configuraciones por defecto
$pdf->setMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->setHeaderMargin(PDF_MARGIN_HEADER);
$pdf->setFooterMargin(PDF_MARGIN_FOOTER);

// Añadir una página
$pdf->AddPage();

// Llamar al método para agregar el formulario
$pdf->contenidoFormulario($empleado);
// Llamar al método para agregar el formulario y pasar el Enlace (ID del empleado)
$pdf->contenidoTabla($datos);  // Asumiendo que $enlaceEmpleado contiene el id del empleado 
// Generar el PDF
$pdf->Output('reporte_bienes.pdf', 'I');

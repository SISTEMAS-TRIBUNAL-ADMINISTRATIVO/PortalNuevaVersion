function init() {
    // Initialize the DataTable
    tabla = $('#tablanominas').DataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: true,
        colReorder: true,
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
        ],
        "ajax": {
            url: '../../controller/nominasController.php?opcion=NominasEmpleado',
            type: "post",
            dataType: "json",
            error: function(e) {
                console.log(e.responseText);
            }
        },
        "bDestroy": true,
        "responsive": true,
        "bInfo": true,
        "iDisplayLength": 9,
        "autoWidth": true,
        "language": {
            "sProcessing": "Procesando...",
            // ... other language settings
        }
    });

    $('#tablanominas tbody').on('click', 'a.view-file', function() {
        const fileContent = $(this).data('file');
        $('#pdfViewer').attr('src', fileContent); // Directly set the Base64 string
        
        if (fileContent.startsWith('data:application/pdf')) {
            $('#pdfViewer').attr('src', fileContent); // Use the Base64 string directly
            $('#pdfViewer').show();
            $('#fileViewer').hide(); // Hide text viewer
        } else {
            // Handle XML as before
            $('#pdfViewer').hide();
            $('#fileViewer').text(atob(fileContent.split(',')[1]));
            $('#fileViewer').show();
        }
        
        // Setup download link
        $('#downloadLink').attr('data-file', fileContent);
        $('#downloadLink').show();
        $('#fileModal').modal('show');
    });
    
    
    // Handle download
    $('#downloadLink').on('click', function() {
        const fileContent = $(this).attr('data-file');
        const base64Data = fileContent.split(',')[1]; // Get the Base64 part
    
        // Create a Blob from the Base64 data
        const byteCharacters = atob(base64Data);
        const byteNumbers = new Uint8Array(byteCharacters.length);
        
        for (let i = 0; i < byteCharacters.length; i++) {
            byteNumbers[i] = byteCharacters.charCodeAt(i);
        }
    
        const fileType = fileContent.startsWith('data:application/pdf') ? 'application/pdf' : 'text/xml';
        const blob = new Blob([byteNumbers], { type: fileType });
    
        // Create a link element to trigger the download
        const a = document.createElement('a');
        const url = URL.createObjectURL(blob);
        a.href = url;
        a.download = fileContent.startsWith('data:application/pdf') ? 'Nomina.pdf' : 'Nomina.xml'; // Set filename
        document.body.appendChild(a); // Append to the body
        a.click(); // Trigger the download
        document.body.removeChild(a); // Remove from the body
        URL.revokeObjectURL(url); // Free up memory
    });
    
    
}

$(document).ready(function() {
    init();
});
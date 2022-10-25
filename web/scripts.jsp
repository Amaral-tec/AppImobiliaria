<!-- Script para mostrar div do slider aluguel/compra -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#priceSale').hide();
        $('#priceRent').show();

        $('#cb-rent').click(function (event) {
            $('#priceSale').hide();
            $('#priceRent').show();
        })

        $('#cb-sale').click(function (event) {
            $('#priceSale').show();
            $('#priceRent').hide();
        })

    })
</script>

<!-- Listar todos os imoveis após abrir modal -->
<script type="text/javascript">

    $('#btn-cancelar-dismiss').click(function (event) {
        $('#listarTodos').click();
    })


    $('#btn-enviar').click(function (event) {
        $('#listarTodos').click();
    })

</script>

<!-- Importar Scripts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>

<script src="js/mascara.js"></script>
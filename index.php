<html>
    <head>
        <script src="custom/js/jquerymin.js" ></script>
        <script src="custom/js/bootstrap.min.js" ></script>
        <script src='libs/highcharts/highcharts.js'></script>
        <script src="libs/highcharts/modules/variable-pie.js"></script>
        <link rel="stylesheet" href="custom/css/bootstrap.min.css">
        <link rel="stylesheet" href="custom/css/custom.css">
    </head>
    <body>
        <div class="overlay hidden">
            <div class="sk-cube-grid">
                <h4>Generando contenido......</h4>
                <div style="width:150px;margin-left: 25px;">
                <div class="sk-cube sk-cube1"></div>
                <div class="sk-cube sk-cube2"></div>
                <div class="sk-cube sk-cube3"></div>
                <div class="sk-cube sk-cube4"></div>
                <div class="sk-cube sk-cube5"></div>
                <div class="sk-cube sk-cube6"></div>
                <div class="sk-cube sk-cube7"></div>
                <div class="sk-cube sk-cube8"></div>
                <div class="sk-cube sk-cube9"></div>
                </div>
            </div>
        </div>
        <div class="overlay2 hidden">
            <div class="sk-cube-grid">
                <h4>Imprimiendo pdf......</h4>
                <div style="width:150px;margin-left: 20px;">
                <div class="sk-cube sk-cube1"></div>
                <div class="sk-cube sk-cube2"></div>
                <div class="sk-cube sk-cube3"></div>
                <div class="sk-cube sk-cube4"></div>
                <div class="sk-cube sk-cube5"></div>
                <div class="sk-cube sk-cube6"></div>
                <div class="sk-cube sk-cube7"></div>
                <div class="sk-cube sk-cube8"></div>
                <div class="sk-cube sk-cube9"></div>
                </div>
            </div>
        </div>
        <br/>
        <div class="section">
            <div class="container">
                <h1 class="text-center">TECNOLÓGICO DE ESTUDIOS SUPERIORES DE ECATEPEC</h1>
                <hr/>
                <br/>
                <br/>
                <form id="genera" class="form-horizontal">
                <div class="form-group col-xs-12 col-md-offset-3 col-md-6">
                Porcentaje del nivel de confianza
                <input name="nc" type="number" min=1 max="99" class="form-control" value="5" placeholder="Porcentaje" required>
                </div>

                <div class="form-group col-xs-12 text-center">
                    <button type="submit" class="btn btn-primary">Genera reporte</button>
                </div>
                    </form>
            </div>
        </div>
        <hr/>
        <br/>
        <br/>
        <div class="section page-preview hidden">
            <div class="container" id="report">

            </div> 
        </div>
        <br/>
        <br/>
        <script>
            $("#genera").submit(function(es){
                $("#report").html="";
                es.preventDefault();
                $.ajax({
                    type:'POST',
                    url:'actions/start.php',
                    data:$(this).serialize(),
                    beforeSend: function(){
                        $(".overlay").removeClass('hidden');                     
                    },
                    success: function(e){
                        if(e > ""){
                            $("#report").html(e);
                            setTimeout(function(){
                                $(".overlay").addClass('hidden');
                                generapdf();
                            },2000);
                        }
                        else{
                            alert('Algo ha salido mal consulta la consola para verificar el error');
                            $(".overlay").addClass('hidden');
                            console.log(e);
                        }
                    },
                    error:function(e){
                        alert('Algo ha salido mal consulta la consola para verificar el error');
                        $(".overlay").addClass('hidden');
                        console.log(e);
                    }
                });
            });
            
            function generapdf(){
                var reporte=$("#report").html();
                $.ajax({
                    type:'POST',
                    url:'actions/createpdf.php',
                    data:{body:reporte},
                    beforeSend: function(){
                        $(".overlay2").removeClass('hidden');
                    },
                    success: function(en){
                        if(en==true){
                            alert('El pdf se creo correctamente, presiona aceptar para abrirlo');
                            $(".overlay2").addClass('hidden');
                            window.open('reporte.pdf');
                        }
                        else{
                            alert('Algo ha salido mal consulta la consola para verificar el error');
                            $(".overlay2").addClass('hidden');
                            console.log(en);
                        }

                    },
                    error:function(en){
                        alert('Algo ha salido mal consulta la consola para verificar el error');
                        $(".overlay2").addClass('hidden');
                        console.log(en);
                    }
                });
            }
        </script>
    </body>
</html>
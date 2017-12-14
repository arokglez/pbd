<?php
$edad_c='select SUM(if(edad<(media-desviacion),1,0)) as JOVEN,
                    SUM(if(edad>(media-desviacion)and edad<(media+desviacion),1,0)) as ADULTO,
                    SUM(if(edad>(media+desviacion),1,0)) as ADULTO_MAYOR
             FROM persona, edad_d
             where true';

$sexo_c='select SUM(if(s.descripcion="Hombre",1,0)) as HOMBRES,
                    SUM(if(s.descripcion="Mujer",1,0)) as MUJERES
            from persona p,sexo s
            where p.id_sexo=s.id_sexo';

$ns_c='select SUM(if(ns.descripcion="Bajo",1,0)) as BAJO,
                  SUM(if(ns.descripcion="Medio",1,0)) as MEDIO,
                  SUM(if(ns.descripcion="Alto",1,0)) as ALTO
            from persona p,Nivel_Socioeconomico ns
            where p.id_nivel=ns.id_nivel';

$civil_c='select SUM(if(ec.descripcion="Soltero",1,0)) as SOLTERO,
                     SUM(if(ec.descripcion="Casado",1,0)) as CASADO,
                     SUM(if(ec.descripcion="Viudo",1,0)) as VIUDO,
                     SUM(if(ec.descripcion="Divorciado",1,0)) as DIVORCIADO
             from persona p,Estado_Civil ec
             where p.id_estado=ec.id_estado';

$suministro_c='select SUM(if(s.descripcion="Somnifero",1,0)) as SOMNIFERO,
                    SUM(if(s.descripcion="Placebo",1,0)) as PLACEBO
            from persona p,Suministro s
            where p.id_suministro=s.id_suministro';

$calidad_c='select SUM(if(cs.descripcion="Reparador",1,0)) as REPARADOR,
                    SUM(if(cs.descripcion="No Reparador",1,0)) as NO_REPARADOR
            from persona p,Calidad_Sueno cs
            where p.id_calidad=cs.id_calidad';

$sum=array( "S" => " AND id_suministro=(select id_suministro
                                                  from suministro
                                                  where descripcion='Somnifero')",
                  "P"  => " AND id_suministro=(select id_suministro
                                                  from suministro
                                                  where descripcion='Placebo')");

$ca=array( "R" => " AND id_calidad=(select id_calidad 
                                        from calidad_sueno 
                                        where descripcion='Reparador')",
               "NR" =>  " AND id_calidad=(select id_calidad
                                           from calidad_sueno
                                           where descripcion='No Reparador')");

$cont_edad="select edad from persona";

$desv_media="select desviacion as DESVIACION, media as MEDIA
    from edad_d"


?>
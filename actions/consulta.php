<?php

function consulta(){
    require_once('../libs/consultas.php');
    require_once('../libs/conect.php');
    
    $data=array();
    
    /*tabula x-y edad*/
    $result=$conn->query($cont_edad);
    $data["EDAD_XY"]["DATOS"]=mysqli_fetch_all($result,MYSQLI_ASSOC);
    $result->close();
    
    /*tendencias edad*/
    $result=$conn->query($desv_media);
    $data["EDAD_XY"]["DESV_MEDIA"]=mysqli_fetch_assoc($result);
    $result->close();
    
    /*total_edad*/
    $result=$conn->query($edad_c);
    $data["total"]["EDAD"]=mysqli_fetch_assoc($result);
    $result->close();
    
    /*total_sexo*/
    $result=$conn->query($sexo_c);
    $data["total"]["SEXO"]=mysqli_fetch_assoc($result);
    $result->close();
    
    /*total nivel socioeconomico*/
    $result=$conn->query($ns_c);
    $data["total"]["NIVEL SOCIOECONOMICO"]=mysqli_fetch_assoc($result);
    $result->close();
    
    /*total estado civil*/
    $result=$conn->query($civil_c);
    $data["total"]["ESTADO CIVIL"]=mysqli_fetch_assoc($result);
    $result->close();
    
    /*total suministro*/
    $result=$conn->query($suministro_c);
    $data["total"]["SUMINISTRO"]=mysqli_fetch_assoc($result);
    $result->close();
    
    /*total calidad*/
    $result=$conn->query($calidad_c);
    $data["total"]["CALIDAD DE SUEÑO"]=mysqli_fetch_assoc($result);
    $result->close();
    
    /*edad para chi*/
    $result1=$conn->query($edad_c.$casum["RS"]);
    $result2=$conn->query($edad_c.$casum["RP"]);
    $result3=$conn->query($edad_c.$casum["NRS"]);
    $result4=$conn->query($edad_c.$casum["NRP"]);
    $data["chi"]["EDAD"]["REPARADOR"]["SOMNIFERO"]=mysqli_fetch_assoc($result1);
    $data["chi"]["EDAD"]["REPARADOR"]["PLACEBO"]=mysqli_fetch_assoc($result2);
    $data["chi"]["EDAD"]["NO REPARADOR"]["SOMNIFERO"]=mysqli_fetch_assoc($result3);
    $data["chi"]["EDAD"]["NO REPARADOR"]["PLACEBO"]=mysqli_fetch_assoc($result4);
    $result1->close();
    $result2->close();
    $result3->close();
    $result4->close();
    
    /*sexo para chi*/
    $result1=$conn->query($sexo_c.$casum["RS"]);
    $result2=$conn->query($sexo_c.$casum["RP"]);
    $result3=$conn->query($sexo_c.$casum["NRS"]);
    $result4=$conn->query($sexo_c.$casum["NRP"]);
    $data["chi"]["SEXO"]["REPARADOR"]["SOMNIFERO"]=mysqli_fetch_assoc($result1);
    $data["chi"]["SEXO"]["REPARADOR"]["PLACEBO"]=mysqli_fetch_assoc($result2);
    $data["chi"]["SEXO"]["NO REPARADOR"]["SOMNIFERO"]=mysqli_fetch_assoc($result3);
    $data["chi"]["SEXO"]["NO REPARADOR"]["PLACEBO"]=mysqli_fetch_assoc($result4);
    $result1->close();
    $result2->close();
    $result3->close();
    $result4->close();
    
      
    /*nivel socioeconomico para chi*/
    $result1=$conn->query($ns_c.$casum["RS"]);
    $result2=$conn->query($ns_c.$casum["RP"]);
    $result3=$conn->query($ns_c.$casum["NRS"]);
    $result4=$conn->query($ns_c.$casum["NRP"]);
    $data["chi"]["NIVEL SOCIOECONOMICO"]["REPARADOR"]["SOMNIFERO"]=mysqli_fetch_assoc($result1);
    $data["chi"]["NIVEL SOCIOECONOMICO"]["REPARADOR"]["PLACEBO"]=mysqli_fetch_assoc($result2);
    $data["chi"]["NIVEL SOCIOECONOMICO"]["NO REPARADOR"]["SOMNIFERO"]=mysqli_fetch_assoc($result3);
    $data["chi"]["NIVEL SOCIOECONOMICO"]["NO REPARADOR"]["PLACEBO"]=mysqli_fetch_assoc($result4);
    $result1->close();
    $result2->close();
    $result3->close();
    $result4->close();
    
      
    /*nivel socioeconomico para chi*/
    $result1=$conn->query($civil_c.$casum["RS"]);
    $result2=$conn->query($civil_c.$casum["RP"]);
    $result3=$conn->query($civil_c.$casum["NRS"]);
    $result4=$conn->query($civil_c.$casum["NRP"]);
    $data["chi"]["ESTADO CIVIL"]["REPARADOR"]["SOMNIFERO"]=mysqli_fetch_assoc($result1);
    $data["chi"]["ESTADO CIVIL"]["REPARADOR"]["PLACEBO"]=mysqli_fetch_assoc($result2);
    $data["chi"]["ESTADO CIVIL"]["NO REPARADOR"]["SOMNIFERO"]=mysqli_fetch_assoc($result3);
    $data["chi"]["ESTADO CIVIL"]["NO REPARADOR"]["PLACEBO"]=mysqli_fetch_assoc($result4);
    $result1->close();
    $result2->close();
    $result3->close();
    $result4->close();
    
    
    return $data;
}



?>
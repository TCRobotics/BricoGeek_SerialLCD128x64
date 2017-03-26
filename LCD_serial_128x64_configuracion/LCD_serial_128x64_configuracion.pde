//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Sketch realizado por Alex TC (TCRobotics)																//
// web: http://tcrobotics.blogspot.com      																//
// twitter: @TCRobotics                     																//
// email: alex.tc.robotics-AT-gmail.com     																//
//																											//
// Publicado en BricoGeek.com																				//
// http://blog.bricogeek.com/noticias/tutoriales/tutorial-arduino-pantalla-serial-lcd-128x64/				//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

void setup() {
    pinMode(13, OUTPUT); 
  Serial.begin(115200); //por defecto el LCD trabaja a estos bps
  Serial.print(0x00,BYTE);// para setear el LCD a 115200 (da igual como se encuentre configurado)
}

void loop() {
  delay(4000);
  logo();
  //cambiar_baudrate();
  luz_fondo(100);
  cambiar_fondo();
  while(1)
  {
  escribir_LCD("  CONFIGURACION LCD  ");
  escribir_LCD("    BRICOGEEK.COM    ");
  escribir_LCD("                     ");
  escribir_LCD(" AJUSTA EL CONTRASTE ");
  escribir_LCD("                     ");
  escribir_LCD("Apaga el LCD con el  ");
  escribir_LCD("fondo que quieras    ");
  escribir_LCD("                     ");
  delay(10000);
  digitalWrite(13, HIGH); 
  cambiar_fondo();
  }
}



//////////////////////FUNCIONES LCD SERIAL//////////////////////////////////////////////


//escribe caracteres en la pantalla
void escribir_LCD(char *data){
 Serial.print(data);
 delay(20);
}

//invierte el fondo del LCD de claro a oscuro o viceversa
void cambiar_fondo(){
  Serial.print(0x7C,BYTE);
  Serial.print(0x12,BYTE);
  delay(20); 
}

//activa o desactiva el logo preprogramado en el backpack
void logo(){
  Serial.print(0x7C,BYTE);
  Serial.print(0x13,BYTE);
  delay(20); 
}

//permite ajustar la retroiluminacion
void luz_fondo(int luz){ // de 0 a 100
  Serial.print(0x7C,BYTE);
  Serial.print(0x02,BYTE); 
  Serial.print(luz,BYTE); 
  delay(20); 
}

//cambia el baudrate. Si no conseguimos comunicarnos con el display
//podemos solucionarlo mandandole cualquier dato a 115200bps durante el arranque,
//mostrara en la pantalla 115200 y se autoajustara a esa velocidad
void cambiar_baudrate(char frec){  //"1" =  4.800bps "2" =  96,00bps
  Serial.print(0x7C,BYTE);         //"3" = 19,200bps "4" =  38,400bps 
  Serial.print(0x07,BYTE);         //"5" = 57,600bps "6" = 115,200bps
  Serial.print(frec,BYTE); 
  delay(20);
}






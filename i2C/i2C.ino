#include <Wire.h> // Inclusion de la librairie Wire pour la gestion de l'I2C qui nous permettra de communiquer avec le DS1307

#define PSTR2(s) (__extension__({static unsigned char __c[] PROGMEM = (s); &__c[0];})) // Macro permettant de stocker facilement du texte en PROGMEM
#define DS1307_ADDRESS 0x68 // Adresse I2C du module DS1307
 
typedef struct {
  uint8_t secondes;
  uint8_t minutes;
  uint8_t heures; // format 24h
  uint8_t jourDeLaSemaine; // 1~7 => lundi, mardi, ...
  uint8_t jour;
  uint8_t mois; 
  uint8_t annee; // format yy (ex 2012 -> 12)
} Date;
// Fonction de convertion bcd -> décimal
byte bcd2dec(byte bcd) {
  return ((bcd / 16 * 10) + (bcd % 16)); 
}
 
// Fonction de convertion decimal -> bcd
byte dec2bcd(byte dec) {
  return ((dec / 10 * 16) + (dec % 10));
}
 
// Fonction configurant le DS1307 avec la date/heure fourni
void ecrire(Date *date) {
  Wire.beginTransmission(DS1307_ADDRESS); // Début de transaction I2C
  Wire.write(0); // Arrête l'oscillateur du DS1307
  Wire.write(dec2bcd(date->secondes)); // Envoi des données
  Wire.write(dec2bcd(date->minutes));
  Wire.write(dec2bcd(date->heures));
  Wire.write(dec2bcd(date->jourDeLaSemaine));
  Wire.write(dec2bcd(date->jour));
  Wire.write(dec2bcd(date->mois));
  Wire.write(dec2bcd(date->annee));
  Wire.write(0); // Redémarre l'oscillateur du DS1307
  Wire.endTransmission(); // Fin de transaction I2C
}
 
// Fonction récupérant l'heure et la date courante à partir du DS1307
void lire(Date *date) {
  Wire.beginTransmission(DS1307_ADDRESS); // Début de transaction I2C
  Wire.write(0); // Demande les info à partir de l'adresse 0 (soit toutes les info)
  Wire.endTransmission(); // Fin de transaction I2C
 
  Wire.requestFrom(DS1307_ADDRESS, 7); // Récupère les info (7 octets = 7 valeurs correspondant à l'heure et à la date courante)
 
  date->secondes = bcd2dec(Wire.read()); // stockage et conversion des données reçu
  date->minutes = bcd2dec(Wire.read());
  date->heures = bcd2dec(Wire.read() & 0b111111);
  date->jourDeLaSemaine = bcd2dec(Wire.read());
  date->jour = bcd2dec(Wire.read());
  date->mois = bcd2dec(Wire.read());
  date->annee = bcd2dec(Wire.read());
}
 
// Fonction vérifiant la présence d'une demande de synchronisation en provenance du pc et récupérant les données de synchronisation ou à défaut récupérant la date et l'heure courante 
void synchronisation(Date *date) {
  Serial.print("SYNC"); // Envoi de la commande de synchronisation
  int i;
  for(i = 0 ; (Serial.available() < 3) && (i < 6) ; i++) // Attente de 3s max 
    delay(500);
  if(i != 6) { // Il n'y as pas eu de timeout
    if(Serial.read() == 'A') 
      if(Serial.read() == 'C')
        if(Serial.read() == 'K') { // Si le pc à répondu par une commande ACK c'est que la synchronisation peut commencer
          while(Serial.available() < 7); // Attente des 7 octets de configuration
          date->secondes = Serial.read(); // Réception et conversion des données reçu
          date->minutes = Serial.read();
          date->heures = Serial.read();
          date->jourDeLaSemaine = Serial.read();
          date->jour = Serial.read();
          date->mois = Serial.read();
          date->annee = Serial.read();
          ecrire(date); // Stockage dans le DS1307 des donnes reçu
        }
  } 
  else
    lire(date); // Si le pc n'as pas répondu à la demande de synchronisation la fonction ce content de lire les données courante du DS1307
}



 Date date;
// Setup()
void setup() {
  
  Serial.begin(9600); // Initialisation du port série
  Wire.begin(); // Initialisation du bus I2C
  synchronisation(&date); // Tentative de synchronisation avec le pc
}
 
// loop()
void loop() {
  lire(&date);
  Serial.print("**************\n");
  Serial.print("Année : ");
  Serial.print(date.annee);
  Serial.print("\nMois : ");
  Serial.print(date.mois);
  Serial.print("\nJour : ");
  Serial.print(date.jour);
  Serial.print("\nJour de la semaine : ");
  Serial.print(date.jourDeLaSemaine);
  Serial.print("\nHeure : ");
  Serial.print(date.heures);
  Serial.print("\nMinute : ");
  Serial.print(date.minutes);
  Serial.print("\nSeconde : ");
  Serial.print(date.secondes);
  Serial.print("**************\n");

  //delay(1); // Rafraichissement de 1Hz
}

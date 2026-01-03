#define BLYNK_TEMPLATE_ID "TMPL3cuvrq_an"
#define BLYNK_TEMPLATE_NAME "Waste Management System"
#define BLYNK_AUTH_TOKEN "N2GecIWnfFukMOBW8EcpqbJXLIQAh4Uf"
#define BLYNK_PRINT Serial
#include <WiFi.h>
#include <WiFiClient.h>
#include <BlynkSimpleEsp32.h>

char auth[] = BLYNK_AUTH_TOKEN;
char ssid[] = "PROJECT";
char pass[] = "11223344";

#include <LiquidCrystal.h>
#include <Servo.h>
LiquidCrystal lcd(19, 23, 18, 17, 16, 15);

#define m1 25
#define m2 26
#define m3 33
#define m4 32

#define echoPin1 12
#define trigPin1 13

#define echoPin2 21
#define trigPin2 22

long duration1;
int distance1;
long duration2;
int distance2;

Servo myServo;

void setup()
{
  Serial.begin(9600);
  Blynk.begin(auth, ssid, pass);
  pinMode(m1, OUTPUT);
  pinMode(m2, OUTPUT);
  pinMode(m3, OUTPUT);
  pinMode(m4, OUTPUT);
  pinMode(echoPin1, INPUT);
  pinMode(trigPin1, OUTPUT);
  pinMode(echoPin2, INPUT);
  pinMode(trigPin2, OUTPUT);
  myServo.attach(27);
  lcd.begin(16, 2);
  myServo.write(0);
}

void loop()
{
  lcd.setCursor(0, 0);
  lcd.print("    WELCOME TO");
  lcd.setCursor(0, 1);
  lcd.print("     E-WASTE");
  delay(2000);
  lcd.clear();
  while (1) {

    Blynk.run();

    digitalWrite(trigPin1, LOW);
    delayMicroseconds(2);
    digitalWrite(trigPin1, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin1, LOW);
    duration1 = pulseIn(echoPin1, HIGH);
    distance1 = duration1 * 0.034 / 2;

    digitalWrite(trigPin2, LOW);
    delayMicroseconds(2);
    digitalWrite(trigPin2, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin2, LOW);
    duration2 = pulseIn(echoPin2, HIGH);
    distance2 = duration2 * 0.034 / 2;

    lcd.setCursor(0, 0);
    lcd.print("E-WASTE=");
    lcd.setCursor(8, 0);
    lcd.print(distance1);
    lcd.setCursor(0, 1);
    lcd.print("C-WASTE=");
    lcd.setCursor(8, 1);
    lcd.print(distance2);
    delay(500);
    lcd.setCursor(8, 0);
    lcd.print("    ");
    lcd.setCursor(8, 1);
    lcd.print("    ");

    Blynk.virtualWrite(V0, distance1);
    Blynk.virtualWrite(V1, distance2);

    digitalWrite(m1, 1);
    digitalWrite(m2, 0);
    digitalWrite(m3, 1);
    digitalWrite(m4, 0);

    if ((distance1 > 0) && (distance1 < 5))
    {
      lcd.clear();
      delay(10);
      lcd.setCursor(0, 0);
      lcd.print(" Common Waste");
      lcd.setCursor(0, 1);
      lcd.print("   Filled    ");
      Blynk.logEvent("alert", "Common Waste Filled");
      delay(2000);
      digitalWrite(m1, 0);
      digitalWrite(m2, 0);
      digitalWrite(m3, 0);
      digitalWrite(m4, 0);
      delay(3000);
      lcd.clear();
    }
    if ((distance2 > 0) && (distance2 < 5))
    {
      lcd.clear();
      delay(10);
      lcd.setCursor(0, 0);
      lcd.print("E-Waste Filled");
      Blynk.logEvent("alert", "E-Waste Filled");
      delay(2000);
      digitalWrite(m1, 0);
      digitalWrite(m2, 0);
      digitalWrite(m3, 0);
      digitalWrite(m4, 0);
      delay(3000);
      lcd.clear();
    }

    if (Serial.available() > 0) {
      char z = Serial.read();
      if (z == 'B')
      {
        lcd.clear();
        delay(10);
        lcd.setCursor(0, 0);
        lcd.print("Common Waste");
        Blynk.logEvent("info", "Common Waste Detected");
        delay(3000);
        lcd.clear();
        digitalWrite(m1, 1);
        digitalWrite(m2, 0);
        digitalWrite(m3, 1);
        digitalWrite(m4, 0);
      }

      if (z == 'A')
      {
        lcd.clear();
        delay(10);
        lcd.setCursor(0, 0);
        lcd.print(" E- Waste");
        Blynk.logEvent("info", "E- Waste Detected");
        delay(2000);
        digitalWrite(m1, 0);
        digitalWrite(m2, 0);
        digitalWrite(m3, 0);
        digitalWrite(m4, 0);
        myServo.write(90);
        delay(3000);
        myServo.write(0);
        lcd.clear();
      }

    }
    
  }
}

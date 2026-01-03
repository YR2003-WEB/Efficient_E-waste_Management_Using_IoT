#include <Servo.h>
#include <LiquidCrystal.h>
LiquidCrystal lcd(13, 12, 11, 10, 9, 8);

int trig1 = 5;
int echo1 = 4;  //sensor 1

int trig2 = 6;
int echo2 = 7;  //sensor 2

int duration1;
int distance1 ;    // senor 1 distance and duration calculation

int duration2;
int distance2 ;      // senor 2 distance and duration calculation

int m1 = 3;
int m2 = 2;

int m3 = A0;
int m4 = A1;

int sw1 = A2;
int sw2 = A3;

Servo myservo;     ///fil and declared the variable
#define servopin A4   // pin configured2

void setup() {
  pinMode(trig1, OUTPUT); // TRANSMIT (TRIG PIN)
  pinMode(echo1, INPUT);  //RECEIVER  (ECHO PIN)

  pinMode(trig2, OUTPUT); // TRANSMIT (TRIG PIN)
  pinMode(echo2, INPUT);  //RECEIVER  (ECHO PIN)

  pinMode(sw2, INPUT);
  pinMode(sw1, INPUT);

  pinMode(m1, OUTPUT);
  pinMode(m2, OUTPUT);
  pinMode(m3, OUTPUT);
  pinMode(m4, OUTPUT);

  myservo.attach(servopin);
  myservo.write(0);
  Serial.begin(9600);   // TO CHECK COMMUNICATION VALUE IN MONITOR
  lcd.begin(16, 2);
  lcd.setCursor(0, 0);     //1 ST ROW O COLUMN
  lcd.print("welcome to ");
  lcd.setCursor(0, 1);
  lcd.print("E-waste collect");
  delay(5000);    //5 second delay

  lcd.clear();
  delay(10);

}

void loop() {

  forward();

  int S1 = digitalRead(sw1);
  int S2 = digitalRead(sw2);

  digitalWrite(trig1, LOW);   //SQUARE WAVE PULSE GEBERATED
  delay(10);
  digitalWrite(trig1, HIGH);   ///(i.e)DUTY CYCLE
  delay(100);
  digitalWrite(trig1, LOW);
  duration1 = pulseIn(echo1, HIGH); // RECEIVEING DURATION & DISTANCE object detecting

  digitalWrite(trig2, LOW);
  delay(10);
  digitalWrite(trig2, HIGH);   ///(i.e)DUTY CYCLE
  delay(100);
  digitalWrite(trig2, LOW);
  duration2 = pulseIn(echo2, HIGH);

  distance1 = duration1 * (0.034 / 2); // DISTANCE CALCULATING
  distance2 = duration2 * (0.034 / 2); // DISTANCE CALCULATING

  Serial.print(" Ultrasonic sensor1");
  Serial.print( distance1);
  Serial.print(" ||  Ultrasonic sensor2");
  Serial.println(distance2);

  lcd.clear();
  delay(10);

  lcd.setCursor(0, 0);     //1 ST ROW O COLUMN
  lcd.print("S1:");
  lcd.setCursor(6, 0);
  lcd.print( distance1);

  lcd.setCursor(0, 1);
  lcd.print("S2:");
  lcd.setCursor(6, 1);
  lcd.print( distance2);
  delay(500);

  if (( distance1 > 40) && ( distance1 < 150))
  {
    lcd.clear();
    delay(10);
    Stop();
    lcd.setCursor(0, 0);
    lcd.print("E-waste filled..!");
    delay(2000);
    lcd.clear();
    delay(10);
  }

  if (( distance2 > 40) && ( distance2 < 150))
  {
    lcd.clear();
    delay(10);
    Stop();
    lcd.setCursor(0, 0);
    lcd.print("Normal W filled.!");
    delay(2500);
    lcd.clear();
    delay(10);
  }

  if (S1 == 1)
  {
    lcd.clear();
    delay(10);
    forward();
    lcd.setCursor(0, 0);
    lcd.print("Normal Waste..");
    delay(2000);
    lcd.clear();
    delay(10);
  }

  if (S2 == 1)
  {
    lcd.clear();
    delay(10);
    Stop();
    lcd.setCursor(0, 0);
    lcd.print("E-Waste..");
    delay(2000);
    for (int i = 0; i <= 90; i++) {
      myservo.write(i);
      delay(50);
    }
    for (int i = 90; i > 0; i--) {
      myservo.write(i);
      delay(50);
    }
    lcd.clear();
    delay(10);
  }

}

void forward()
{
  digitalWrite(m1, 1);
  digitalWrite(m2, 0);
  digitalWrite(m3, 1);
  digitalWrite(m2, 0);
}


void Stop()
{
  digitalWrite(m1, 0);
  digitalWrite(m2, 0);
  digitalWrite(m3, 0);
  digitalWrite(m2, 0);
}


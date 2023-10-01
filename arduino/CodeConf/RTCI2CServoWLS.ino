#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <RTClib.h>
#include <OneWire.h>
#include <Servo.h>

RTC_DS3231 rtc; // Objek RTC DS3231
LiquidCrystal_I2C lcd(0x27, 16, 2); // Alamat I2C dan ukuran layar
const int waterLevelPin = A0; // Pin sensor level air

const int servoPin = 9; // Pin servo
Servo servoMotor; // Objek Servo

bool servoOn = false; // Status servo (false = OFF, true = ON)

void setup() {
  // Inisialisasi RTC
  Wire.begin();
  rtc.begin();

  // Inisialisasi LCD I2C
  lcd.init();
  lcd.backlight();

  // Inisialisasi Servo
  servoMotor.attach(servoPin); // Hubungkan servo ke pin 9
  servoMotor.write(0); // Set posisi awal servo ke 0 derajat (OFF)

  // Inisialisasi tombol sebagai input
  pinMode(buttonPin, INPUT_PULLUP);

  // Tampilkan pesan awal di LCD
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("SMART AQUARIUM");
  delay(2000); // Tampilkan pesan selama 2 detik

  // Bersihkan layar LCD
  lcd.clear();
}

// Fungsi untuk mengaktifkan servo
void turnServoOn() {
  servoOn = true;
  servoMotor.write(90); // Geser servo ke posisi ON (misalnya, 90 derajat)
}

// Fungsi untuk menonaktifkan servo
void turnServoOff() {
  servoOn = false;
  servoMotor.write(0); // Geser servo ke posisi OFF (0 derajat)
}

void loop() {
  // Baca waktu dari RTC
  DateTime now = rtc.now();

  // Tampilkan waktu di LCD
  lcd.setCursor(0, 0);
  lcd.print("Time: ");
  lcd.print(now.hour(), DEC);
  lcd.print(':');
  lcd.print(now.minute(), DEC);
  lcd.print(':');
  lcd.print(now.second(), DEC);

  // Baca nilai sensor level air
  int waterLevel = analogRead(waterLevelPin);

  // Tampilkan nilai sensor level air di LCD
  lcd.setCursor(0, 1);
  lcd.print("L:");
  lcd.print(waterLevel);

  // Baca suhu dari sensor DS18B20
  sensors.requestTemperatures();
  float temperatureCelsius = sensors.getTempCByIndex(0);

  // Tunggu sejenak
  delay(500); // Tunggu 0.5 detik
}

#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <RTClib.h>

RTC_DS3231 rtc; // Objek RTC DS3231
LiquidCrystal_I2C lcd(0x27, 16, 2); // Alamat I2C dan ukuran layar

void setup() {
  // Inisialisasi RTC
  Wire.begin();
  rtc.begin();

  // Inisialisasi LCD I2C
  lcd.init();
  lcd.backlight();

  // Set waktu RTC jika diperlukan
  // rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));

  // Tampilkan pesan awal di LCD
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("SMART AQUARIUM");
  delay(2000); // Tampilkan pesan selama 2 detik

  // Bersihkan layar LCD
  lcd.clear();
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

  // Tunggu sejenak
  delay(500); // Tunggu 1 detik
}

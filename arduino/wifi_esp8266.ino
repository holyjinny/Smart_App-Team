#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>

/* 1. Define the WiFi credentials */


/* 1-1. Home WiFi credentials */
#define WIFI_SSID "U+Net01A8"
#define WIFI_PASSWORD "DD7A022191"

/* 2. Firebase */
#define FIREBASE_HOST "smart-jtj-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "RV5moDWWYwC0ZNYFJbs8ibyoqcWUwoxPWfsl9Z0y"

/* 3. Relay */
#define relay D8

// Define Firebase Data object
FirebaseData firebaseData;

FirebaseJson json;

void printResult(FirebaseData &data);

// LED
//int LEDPIN = D8;

// MOTOR
//int motorSpeed=D8;
//int motorDis=12;
//int value = 255;

void setup()
{

  Serial.begin(115200);

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Firebase.reconnectWiFi(true);
  
  firebaseData.setBSSLBufferSize(1024,1024);
  firebaseData.setResponseSize(1024);

  Firebase.setReadTimeout(firebaseData,1000*60);
  Firebase.setwriteSizeLimit(firebaseData,"tiny");

  // LED
//  pinMode(LEDPIN, OUTPUT);
//  digitalWrite(LEDPIN, LOW);

  // MOTOR
//  pinMode(motorSpeed, OUTPUT);
//  digitalWrite(motorDis, HIGH);
//  analogWrite(motorSpeed, value);

  // Relay
  pinMode(relay, OUTPUT);


  /*
  String path = "/Motor";

  Serial.println("----------");
  Serial.println("Set String test...");

  
  // FirebaseDatabase에 String 값 넣기
 
    if (Firebase.setString(firebaseData, path + "/State" , "ON"))
    {
      Serial.println("PASSED");
      Serial.println("PATH: " + firebaseData.dataPath());
      Serial.println("TYPE: " + firebaseData.dataType());
      Serial.println("ETag: " + firebaseData.ETag());
      Serial.print("VALUE: ");
      printResult(firebaseData);
      Serial.println("---------------------------------");
      Serial.println();
    }
    else
    {
      Serial.println("FAILED");
      Serial.println("REASON: " + firebaseData.errorReason());
      Serial.println("---------------------------------");
      Serial.println();
    }
  */
  
  
  /*
  String path = "/Test";

  Serial.println("----------");
  Serial.println("Set double test...");

  
  // FirebaseDatabase에 double 값 넣기
  for (uint8_t i = 0; i < 5; i++)
  {
    if (Firebase.setDouble(firebaseData, path + "/Double/Data" + (i + 1), ((i + 1) * 10) + 0.123456789))
    {
      double val = firebaseData.doubleData();
      Serial.println("PASSED");
      Serial.println("PATH: " + firebaseData.dataPath());
      Serial.println("TYPE: " + firebaseData.dataType());
      Serial.println("ETag: " + firebaseData.ETag());
      Serial.print("VALUE: ");
      printResult(firebaseData);
      Serial.println(val);
      Serial.println("---------------------------------");
      Serial.println();
    }
    else
    {
      Serial.println("FAILED");
      Serial.println("REASON: " + firebaseData.errorReason());
      Serial.println("---------------------------------");
      Serial.println();
    }
  }
  */
  

  /*
  // FirebaseDatabase에 int 값 넣기
  Serial.println("----------------------------------------");
  Serial.println("Push integer test....");

  for (uint8_t i = 0; i < 5; i++)
  {
    if (Firebase.pushInt(firebaseData, path + "/Push/Int", (i + 1)))
    {
      Serial.println("PASSED");
      Serial.println("PATH: " + firebaseData.dataPath());
      Serial.print("PUSH NAME: ");
      Serial.println(firebaseData.pushName());
      Serial.println("ETag: " + firebaseData.ETag());
      Serial.println("---------------------------------");
      Serial.println();
    }
    else
    {
      Serial.println("FAILED");
      Serial.println("REASON: " + firebaseData.errorReason());
      Serial.println("---------------------------------");
      Serial.println();
    }
  }
  */

  /*
  // Json
  Serial.println("----------------------------------------");
  Serial.println("Push JSON test....");

  for (uint8_t i = 0; i < 5; i++)
  {
    json.clear().add("Data" + String(i + 1), i + 1);
//    json.add("Data", i + 1);
    
    if (Firebase.pushJSON(firebaseData, path + "/Push/Int", json))
    {
      Serial.println("PASSED");
      Serial.println("PATH: " + firebaseData.dataPath());
      Serial.print("PUSH NAME: ");
      Serial.println(firebaseData.pushName());
      Serial.println("ETag: " + firebaseData.ETag());
      Serial.println("---------------------------------");
      Serial.println();
    }
    else
    {
      Serial.println("FAILED");
      Serial.println("REASON: " + firebaseData.errorReason());
      Serial.println("---------------------------------");
      Serial.println();
    }
  }
  */

  /*
  // Update
  Serial.println("----------------------------------------");
  Serial.println("Update test....");

  for (uint8_t i = 0; i < 5; i++)
  {
    json.set("Data" + String(i + 1), i + 5.5);
    
    if (Firebase.updateNode(firebaseData, path + "/float", json))
    {
      float val = firebaseData.floatData();
      Serial.println("PASSED");
      Serial.println("PATH: " + firebaseData.dataPath());
      Serial.println("TYPE: " + firebaseData.dataType());
      Serial.print("VALUE: ");
      Serial.println(val);
      Serial.println("---------------------------------");
      Serial.println();
    }
    else
    {
      Serial.println("FAILED");
      Serial.println("REASON: " + firebaseData.errorReason());
      Serial.println("---------------------------------");
      Serial.println();
    }
  }
  */
}

void loop()
{
  /*
  // 값 가져오기
   Serial.println("----------");
  Serial.println("Get test...");

  if(WiFi.status() == WL_CONNECTED)
  {
    Firebase.getDouble(firebaseData, "/Humidity");
    Serial.print("습도 : ");
    Serial.println(firebaseData.doubleData());
    delay(2000);
  }
  */

  /*
  // LED 제어하기
  Serial.println("----------");
  Serial.println("Get LED test...");

  if(WiFi.status() == WL_CONNECTED)
  {
    Firebase.getString(firebaseData, "/LED");
    Serial.print("상태 : ");
    Serial.println(firebaseData.stringData());
    String state = firebaseData.stringData();
    delay(2000);

    if(state == "ON")
    {
      digitalWrite(D8, HIGH);
    }
    if(state == "OFF")
    {
      digitalWrite(D8, LOW);
    }
  }
    */

    // Relay (s = D8, + = 5v, - = GND, NC -> GND, NO -> 모터 한 쪽, 남은 모터 한 쪽 -> 5V)
//    digitalWrite(relay, HIGH);
//    delay(3000);
//    digitalWrite(relay, LOW);
//    delay(3000);


    // MOTOR 제어하기
  Serial.println("------------------------------------");
  Serial.println("Get MOTOR test...");

  if(WiFi.status() == WL_CONNECTED)
  {
    Firebase.getString(firebaseData, "/Motor");
    String state = firebaseData.stringData();

    if(state == "true")
    {
      digitalWrite(relay, HIGH);
      Serial.print("동작 : ");
      Serial.print(state);
      delay(2000);
    }
    if(state == "false")
    {

      digitalWrite(relay, LOW);
      Serial.print("동작 : ");
      Serial.print(state);
      delay(2000);
    }
   
  }
  
}

void printResult(FirebaseData &data)
{
  if(data.dataType() == "int")
    Serial.println(data.intData());
  else if(data.dataType() == "float")
    Serial.println(data.floatData(), 5);
  else if(data.dataType() == "double")
    printf("%.91f\n", data.doubleData());
  else if(data.dataType() == "boolean")
    Serial.println(data.boolData() ==1 ? "true" : "false");
  else if(data.dataType() == "String")
    Serial.println(data.stringData());
  else if(data.dataType() == "json")
  {
    Serial.println();
    FirebaseJson &json = data.jsonObject();

    Serial.println("Pretty printed JSON data: ");
    String jsonStr;
    json.toString(jsonStr,true);
    Serial.println(jsonStr);
    Serial.println();
    Serial.println("Iterate JSON data: ");
    Serial.println();
    size_t len = json.iteratorBegin();
    String key, value = "";
    int type = 0;
    for (size_t i = 0; i < len; i++)
    {
      json.iteratorGet(i, type, key, value);
      Serial.print(i);
      Serial.print(", ");
      Serial.print("Type: ");
      Serial.print(type == FirebaseJson::JSON_OBJECT ? "object" : "array");
      if (type == FirebaseJson::JSON_OBJECT)
      {
        Serial.print(", Key: ");
        Serial.print(key);
      }
      Serial.print(", Value: ");
      Serial.println(value);
    }
    json.iteratorEnd();
  }
//  else if (data.dataType() == "array")
//  {
//    Serial.println();
//    FirebaseJsonArray &arr = data.jsonArray();
//    Serial.println("Pretty printed Array: ");
//    String arrStr;
//    arr.toString(arrStr, true);
//    Serial.println(arrStr);
//    Serial.println();
//    Serial.println("Iterate array values: ");
//    Serial.println();
//    for (size_t i = 0; i < arr.size(); i++)
//    {
//      Serial.print(i);
//      Serial.print(", Value: ");
//
//      FirebaseJsonData &jsonData = data.jsonData();
//    }
//  }
}

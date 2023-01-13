int forpin1 = 9;
int backpin1 = 6;
int forpin2 = 10;
int backpin2 =7; 
int echo = 2;
int trig = 3;
int s2 = 8;
int s1 = 5;
void setup() {
  // put your setup code here, to run once:
pinMode(forpin1,OUTPUT);
pinMode(forpin2,OUTPUT);
pinMode(backpin1,OUTPUT);
pinMode(backpin2,OUTPUT);
pinMode(echo, INPUT);
pinMode(trig, OUTPUT);
pinMode(s1,OUTPUT);
pinMode(s2,OUTPUT);
Serial.begin(9600);
}
void Forward(int speedV,int forward,int backward,int speedPin){
digitalWrite(forward, HIGH);
digitalWrite(backward, LOW);
digitalWrite(speedPin, speedV);
}
 
void Backward( int speedV,int forward,int backward,int speedPin){
digitalWrite(forward, LOW);
digitalWrite(backward, HIGH);
digitalWrite(speedPin, speedV);
}
void loop() {
  // put your main code here, to run repeatedly:
digitalWrite(trig,LOW);
delayMicroseconds(2);
long Echoreading;
digitalWrite(trig,HIGH);
delayMicroseconds(5);
digitalWrite(trig,LOW);
Echoreading = pulseIn(echo,HIGH);
int distance = Echoreading*0.034/2;
Serial.print("Distance");
Serial.print(distance);
Serial.println("cm");

if(distance>30){
 
Forward(230,forpin1,backpin1,s1);
Backward(230,forpin2,backpin2,s2);
}else{
if(distance>15){
Forward(230,forpin1,backpin1,s1);
Forward(230,forpin2,backpin2,s2);
}else{
if(distance>5){
Backward(230,forpin1,backpin1,s1);
Forward(230,forpin2,backpin2,s2);
}

}
  }

  

}

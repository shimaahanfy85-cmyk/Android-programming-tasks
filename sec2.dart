import 'dart:math';
void main()
{
Random R =Random();
int grade=R.nextInt(101);
print("Grade:$grade");


if(grade>=95&&grade<=100){
  print("A+");
}
else if(grade>=90&&grade<=94){
  print("A-");
}
else if(grade>=85&&grade<=89){
  print("B+");
}
else if(grade>=80&&grade<=84){
  print("B-");
}
else if(grade>=75&&grade<=79){
  print("C+");
}
else if(grade>=70&&grade<=74){
  print("C-");
}
else if(grade>=65&&grade<=69){
  print("D+");
}
else if(grade>=60&&grade<=64){
  print("D-");
}
else {
  print("fail");
}


}
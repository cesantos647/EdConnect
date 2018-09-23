import java.util.ArrayList;
import java.util.List;

List<Classroom> classes = new ArrayList<Classroom>(); 


int currentClass = 0;
int currentAttribute = 0;
int currentStudent = 0;


Database MUSD = new Database();

Classroom Math = new Classroom("Math", "Tsang", MUSD);
Classroom English = new Classroom("English", "Poopity", MUSD);
Classroom History = new Classroom("History", "HAHA", MUSD);

void setup() {
  classes.add(Math);
  classes.add(English);
  classes.add(History);
  
  size(1200, 739);
  MUSD.addStudent("Santos", "Christian", 16, 12, "male");
  MUSD.addStudent("Tyagi", "Aniket", 16, 11, "male");
  MUSD.addStudent("Le", "Havi", 15, 10, "female");
  
  Math.addAttribute("Critical Thinking");
  Math.addAttribute("Data Analysis");
  Math.addAttribute("Comprehension");
  Math.addAttribute("Arithmatic");
  Math.addAttribute("Memorization");
  
  English.addAttribute("Critical Thinking");
  English.addAttribute("Data Analysis");
  English.addAttribute("Comprehension");
  
  History.addAttribute("Yeet");
  
  Math.addStudent("Santos", "Christian");
  Math.addStudent("Tyagi", "Aniket");
  Math.addStudent("Le", "Havi");
  
  
  English.addStudent("Santos", "Christian");
  English.addStudent("Tyagi", "Aniket");
  
  History.addStudent("Tyagi", "Aniket");
  
  randomMath();
  //randomEnglish();
  //randomHistory();
  
  double[] testWeights = { 0.5, 0.3, 0.1, 0.05, 0.05};
  double[] grades = {Math.gradePredict("Le", "Havi", testWeights), 1};
  double[] attributes = Math.students.get(MUSD.parseStudent("Le", "Havi")).attributeAverages.get(Math.students.get(MUSD.parseStudent("Le", "Havi")).attributeAverages.size() - 1);
  Math.addGrade("Le", "Havi", grades, attributes, month(), day(), year());
  
  double[] testWeights1 = { 0.5, 0.3, 0.1, 0.05, 0.05};
  double[] grades1 = {Math.gradePredict("Tyagi", "Aniket", testWeights1), 1};
  double[] attributes1 = Math.students.get(MUSD.parseStudent("Le", "Havi")).attributeAverages.get(Math.students.get(MUSD.parseStudent("Le", "Havi")).attributeAverages.size() - 1);
  Math.addGrade("Le", "Havi", grades1, attributes1, month(), day(), year());
  
  double[] testWeights2 = { 0.5, 0.3, 0.1, 0.05, 0.05};
  double[] grades2 = {Math.gradePredict("Santos", "Christian", testWeights2), 1};
  double[] attributes2 = Math.students.get(MUSD.parseStudent("Le", "Havi")).attributeAverages.get(Math.students.get(MUSD.parseStudent("Le", "Havi")).attributeAverages.size() - 1);
  Math.addGrade("Le", "Havi", grades2, attributes2, month(), day(), year());
  
}

void draw() {
  background(31, 37, 51);
  
  String lName = classes.get(currentClass).students.get(currentStudent).lastName;
  String fName = classes.get(currentClass).students.get(currentStudent).firstName;
  String attribute = classes.get(currentClass).attributes.get(currentAttribute);
  
  graphData(MUSD, Math, lName, fName, 900, 500, 0, -120, 90);
  drawAttributeScan(960, 189, 230, 270, MUSD, Math, lName, fName, attribute);
  drawAttributeRadar(960, 470, 230, 259, MUSD, Math, lName, fName);
  topBar(10, 10, 1180, 170);
  checkBoxes();
  fill(30, 30, 46);
  strokeWeight(5);
  ellipse(88, 88, 140, 140);
}

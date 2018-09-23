import java.util.ArrayList;
import java.util.List;

boolean mouse = false;

void graphData(Database district, Classroom classroom, String lName, String fName, double w, double h, int ID, int hT, int vT) {
  double wScalar; 
  wScalar = w / classroom.students.get(district.parseStudent(lName, fName)).timeStamp.size();
  
  stroke(20, 20, 36);
  fill(20, 20, 36);
  strokeWeight(1);
  rect((float) (((width - w) / 2 - 20) + hT), (float) (((height - h) / 2 - 20) + vT), (float) (w + 40), (float) (h + 40));
  
  stroke(40, 40, 56);
  strokeWeight(2);
  line((float) ((width - w) / 2 + 20 + hT), (float) (height / 2 + vT), (float) (width - (width - w) / 2 - 20 + hT), (float) (height / 2) + vT);
  line((float) ((width - w) / 2 + 20 + hT), (float) ((height / 2) + (h / 2) + vT), (float) (width - (width - w) / 2 - 20 + hT), (float) ((height / 2) + (h / 2)) + vT);
  line((float) ((width - w) / 2 + 20 + hT), (float) ((height / 2) - (h / 2) + vT), (float) (width - (width - w) / 2 - 20 + hT), (float) ((height / 2) - (h / 2) + vT));
  line((float) ((width - w) / 2 + 20 + hT), (float) ((height / 2) + (h / 4) + vT), (float) (width - (width - w) / 2 - 20 + hT), (float) ((height / 2) + (h / 4)) + vT);
  line((float) ((width - w) / 2 + 20 + hT), (float) ((height / 2) - (h / 4) + vT), (float) (width - (width - w) / 2 - 20 + hT), (float) ((height / 2) - (h / 4) + vT));
  
  fill(108, 114, 126);
  textSize(12);
  text("100", (float) ((width - w) / 2 - 10 + hT), (float) ((height / 2) - (h / 2) + 5 + vT));
  text("50", (float) ((width - w) / 2 - 10 + hT), (float) ((height / 2) + 5 + vT));
  text("0", (float) ((width - w) / 2 - 10 + hT), (float) ((height / 2) + (h / 2) + 5 + vT));
  text("25", (float) ((width - w) / 2 - 10 + hT), (float) ((height / 2) + (h / 4) + 5 + vT));
  text("75", (float) ((width - w) / 2 - 10 + hT), (float) ((height / 2) - (h / 4) + 5 + vT));
  
  for(int i = 0; i < classroom.students.get(district.parseStudent(lName, fName)).timeStamp.size(); i++) {
    if(i != classroom.students.get(district.parseStudent(lName, fName)).timeStamp.size() - 1) {  
      stroke(20, 20, 36);
      fill(255);
      strokeWeight(2);
    } else {
      stroke(20, 20, 36);
      fill(50, 70, 106);
      strokeWeight(2);
    }
    
    if(ID == 0) {  
      ellipse((float) (((width - w) / 2) + i * wScalar + hT), (float) (((height - h) / 2) + (abs((float) (classroom.students.get(district.parseStudent(lName, fName)).rawGrade.get(i) / 100 - 1)) * h) + vT), 7, 7);
      float x1 = (float)(((width - w) / 2) + i * wScalar + hT);
      float y1 = (float) (((height - h) / 2) + (abs((float) (classroom.students.get(district.parseStudent(lName, fName)).rawGrade.get(i) / 100 - 1)) * h) + vT);
      if(i != classroom.students.get(district.parseStudent(lName, fName)).timeStamp.size() - 1) {
        float x2 = (float)(((width - w) / 2) + (i + 1) * wScalar + hT);
        float y2 = (float) (((height - h) / 2) + (abs((float) (classroom.students.get(district.parseStudent(lName, fName)).rawGrade.get(i + 1) / 100 - 1)) * h) + vT);
        stroke(255);
        strokeWeight(1.5);
        line(x1, y1, x2, y2);
      }
      if(mouseHover(x1, y1, 7)) {
        double grade = classroom.students.get(district.parseStudent(lName, fName)).rawGrade.get(i);
        int month = (int)classroom.students.get(district.parseStudent(lName, fName)).timeStamp.get(i)[0];
        int day = (int)classroom.students.get(district.parseStudent(lName, fName)).timeStamp.get(i)[1];
        int year = (int)classroom.students.get(district.parseStudent(lName, fName)).timeStamp.get(i)[2];
        text(round((float)(grade)) + "%" + ", " + month + "-" + day + "-" + year, mouseX, mouseY - 20);
      } else {
      
      }
    } else {
      ellipse((float) (((width - w) / 2) + i * wScalar + hT), (float) (((height - h) / 2) + (abs((float) (classroom.students.get(district.parseStudent(lName, fName)).gradeAverages.get(i) / 100 - 1)) * h) + vT), 7, 7);
    }
  }
}

void drawAttributeScan(int hT, int vT, int w, int h, Database district, Classroom classroom, String lName, String fName, String attribute) {
  stroke(1, 192, 200);
  fill(1, 192, 200);
  strokeWeight(1);
  rect(hT, vT, w, h);
  
  int studentIndex = district.parseStudent(lName, fName);
  int attributeIndex = classroom.parseAttributes(attribute);
  
  if(studentIndex != -1 && attributeIndex != -1) {
    
    stroke(255);
    strokeWeight(10);
    arc(hT + w / 2, vT + h / 2, w - 20, w - 20, 0 - (PI / 2), (float) (2 * PI * classroom.students.get(studentIndex).attributeAverages.get(classroom.students.get(studentIndex).attributeAverages.size() - 1)[attributeIndex] / 100 - (PI / 2)));
    fill(255);
    textSize(32);
    text(str((int)(classroom.students.get(studentIndex).attributeAverages.get(classroom.students.get(studentIndex).attributeAverages.size() - 1)[attributeIndex])) + "%", hT + w / 2 , vT + h / 2 );
  } else {
    System.out.println("UH OHHHHH");
  }
  textSize(13);
  text(lName + ", " + fName + ": " + attribute, hT + w / 2, vT + h / 2 - 127);
} 

void drawAttributeRadar(int hT, int vT, int w, int h, Database district, Classroom classroom, String lName, String fName) {
  stroke(250, 152, 120);
  fill(250, 152, 120);
  strokeWeight(1);
  rect(hT, vT, w, h);
  
  int studentIndex = district.parseStudent(lName, fName);
  
  if(studentIndex != -1) {
    stroke(215);
    strokeWeight(3);
    polygon(hT + w / 2, vT + h / 2, w / 2.5, classroom.attributes.size());
    polygon(hT + w / 2, vT + h / 2, w / 4, classroom.attributes.size());
    polygon(hT + w / 2, vT + h / 2, w / 7, classroom.attributes.size());
    
    radar(hT + w / 2, vT + h / 2,  w / 2.5, district, classroom, lName, fName);
    
    textSize(13);
    text(lName + ", " + fName + ": " + "Overall Attributes", hT + w / 2, vT + h / 2 - 107);
    textAlign(CENTER, CENTER);
  }
}

void polygon(float x, float y, float r, int p) {
  float angle = TWO_PI / p;
  beginShape();
    for(float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * r;
      float sy = y + sin(a) * r;
      vertex(sx, sy);
    }
  endShape(CLOSE);
}

void radar(float x, float y, float m, Database district, Classroom classroom, String lName, String fName) {
  float angle = TWO_PI / classroom.attributes.size();
  int studentIndex = district.parseStudent(lName, fName);
  
  if(studentIndex != -1) {
    stroke(255);
    fill(255);
    beginShape();
      int i = 0;
      for(float a = 0; a < TWO_PI; a += angle) {
        float r = (float) classroom.students.get(studentIndex).attributeAverages.get(classroom.students.get(studentIndex).attributeAverages.size() - 1)[i];
        float sx = x + cos(a) * r;
        float sy = y + sin(a) * r;
        vertex(sx, sy);
        if(mouseHover(sx, sy, 10)) {
          text(classroom.attributes.get(i) + ": " + str((int)(classroom.students.get(studentIndex).attributeAverages.get(classroom.students.get(studentIndex).attributeAverages.size() - 1)[i])) + "%", mouseX, mouseY - 20);
          textAlign(CENTER, CENTER);
        }
        i++;
      }
    endShape(CLOSE);
  }
}

void topBar(int hT, int vT, int w, int h) {
  stroke(20, 20, 36);
  fill(20, 20, 36);
  strokeWeight(1);
  rect(hT, vT, w, h);
}

void checkBoxes() {
  textSize(20);
  stroke(251, 150, 120);
  fill(251, 150, 120);
  text("Classes: ", 235, 40);
  
  for(int i = 0; i < classes.size(); i++) {
    if(mouseHover(200, 67 + i * (100 / classes.size()), 10)) {
      stroke(0, 100, 0);
      fill(0, 100, 0);
      if(mouse) {  
        if(classes.get(currentClass).attributes.size() > classes.get(i).attributes.size()) {
          currentAttribute = classes.get(i).attributes.size() - 1;
        }
        
        if(classes.get(currentClass).students.size() > classes.get(i).students.size()) {
          currentStudent = classes.get(i).students.size() - 1;
        }
        currentClass = i;
      }
    } else {
      stroke(251, 150, 120);
      fill(251, 150, 120);
    }
    ellipse(200, 67 + i * (100 / classes.size()), 10, 10);
    textSize(10);
    text(classes.get(i).subject , 250, 67 + i * (100 / classes.size()));
  }
  
  textSize(20);
  stroke(3, 192, 197);
  fill(3, 192, 197);
  text("Attributes: ", 400, 40);
  
  for(int i = 0; i < classes.get(currentClass).attributes.size(); i++) {
    if(mouseHover(350, 67 + i * (100 / classes.get(currentClass).attributes.size()), 10)) {
      stroke(0, 100, 0);
      fill(0, 100, 0);
      if(mouse) {  
        currentAttribute = i;
      }
    } else {
      stroke(3, 192, 197);
      fill(3, 192, 197);
    }
    ellipse(350, 67 + i * (100 / classes.get(currentClass).attributes.size()), 10, 10);
    textSize(10);
    text(classes.get(currentClass).attributes.get(i), 400, 67 + i * (100 / classes.get(currentClass).attributes.size()));
  }
  
  textSize(20);
  stroke(38, 119, 105);
  fill(38, 119, 105);
  text("Students: ", 545, 40);
  for(int i = 0; i < classes.get(currentClass).students.size(); i++) {
    if(mouseHover(500, 67 + i * (100 / classes.get(currentClass).students.size()), 10)) {
      stroke(0, 100, 0);
      fill(0, 100, 0);
      if(mouse) {  
        currentStudent = i;
      }
    } else {
      stroke(38, 119, 105);
      fill(38, 119, 105);
    }
    ellipse(500, 67 + i * (100 / classes.get(currentClass).students.size()), 10, 10);
    textSize(10);
    text(classes.get(currentClass).students.get(i).lastName + ", " + classes.get(currentClass).students.get(i).firstName, 550, 67 + i * (100 / classes.get(currentClass).students.size()));
  }
}

boolean mouseHover(float x, float y, int r) {
  if(sqrt(pow(mouseX - x, 2) + pow(mouseY - y, 2)) <= r) {
    return true;
  } else {
    return false;
  }
}

double parseDataMax(List<Double> data) {
  double max = 0;
  
  for(int i = 0; i < data.size(); i++) {
    if(data.get(i) > max) {
      max = data.get(i);
    }
  }
  
  return max;
}

void mousePressed() {
  mouse = true;
}

void mouseReleased() {
  mouse = false;
}

//251, 150, 120

//3, 192, 197

//38, 119, 105

void randomMath() {
  for(int i = 0; i < 15; i++) {
    double[] attributes = {random(20)+60, random(20)+30, random(20)+10, random(20)+60, random(20)+30};
    double[] grades = {random(20)+80, 1};
    Math.addGrade("Santos", "Christian", grades, attributes, month(), day(), year());
    Math.studentGradeAverage("Santos", "Christian");
  }
  
  for(int i = 0; i < 15; i++) {
    double[] attributes = {random(20)+60, random(20)+30, random(20)+10, random(20)+60, random(20)+30};
    double[] grades = {random(20)+80, 1};
    Math.addGrade("Tyagi", "Aniket", grades, attributes, month(), day(), year());
    Math.studentGradeAverage("Tyagi", "Aniket");
  }
  
  for(int i = 0; i < 15; i++) {
    double[] attributes = {random(40)+40, random(40)+40, random(40)+40, random(40)+40, random(40)+40};
    double[] grades = {random(20)+80, 1};
    Math.addGrade("Le", "Havi", grades, attributes, month(), day(), year());
    Math.studentGradeAverage("Le", "Havi");
  }
}

void randomEnglish() {
  for(int i = 0; i < 15; i++) {
    double[] attributes = {random(20)+60, random(20)+30, random(20)+10};
    double[] grades = {random(20)+80, 1};
    English.addGrade("Santos", "Christian", grades, attributes, month(), day(), year());
    English.studentGradeAverage("Santos", "Christian");
  }
  
  for(int i = 0; i < 15; i++) {
    double[] attributes = {random(20)+60, random(20)+30, random(20)+10};
    double[] grades = {random(20)+80, 1};
    English.addGrade("Tyagi", "Aniket", grades, attributes, month(), day(), year());
    English.studentGradeAverage("Tyagi", "Aniket");
  }
}

void randomHistory() {
  for(int i = 0; i < 15; i++) {
    double[] attributes = {random(20)+60};
    double[] grades = {random(20)+80, 1};
    History.addGrade("Tyagi", "Aniket", grades, attributes, month(), day(), year());
    History.studentGradeAverage("Tyagi", "Aniket");
  }
}

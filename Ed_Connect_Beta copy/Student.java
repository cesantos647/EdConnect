import java.util.ArrayList;
import java.util.List;

class Student {

  // Basic student information
  String firstName;
  String lastName;
  int age;
  int grade;
  String sex;

  // Student grade and attribute information over time
  List<double[]> grades = new ArrayList<double[]>();
  List<Double> rawGrade = new ArrayList<Double>();
  List<double[]> gradeAttributes = new ArrayList<double[]>();
  
  // Student grade and attribute averages over time
  List<double[]> attributeAverages = new ArrayList<double[]>();
  List<Double> gradeAverages = new ArrayList<Double>();
  
  // Student time of grade upload
  List<double[]> timeStamp = new ArrayList<double[]>();
  

  // Number of attributes
  int attributeNum;
  List<String>attributes;


  Student(String lName, String fName, int a, int g, String s, List<String> atts, int attNum) {
    firstName = fName;
    lastName = lName;
    age = a;
    grade = g;
    sex = s;
    attributeNum = attNum;
    attributes = atts;
    System.out.println("Student successfully initialized in classroom: " + lName + ", " + fName);
  }

  public void addGrade(double[] grade, double[] attributeScores, int month, int day, int year) {
    grades.add(grade);
    rawGrade.add(grade[0]);
    gradeAttributes.add(attributeScores);
    double[] dateData = {month, day, year};
    timeStamp.add(dateData);
    
    System.out.println("Message: Grades are entered for " + lastName + ", " + firstName + ": " + grade + " On: " + month + ", " + day + ", " + year);
  }

  public void editGrade(int gradeIndex, double grade, double[] attributeScores) {
    grades.get(gradeIndex)[0] = grade;
    gradeAttributes.set(gradeIndex, attributeScores);
  }

  public void deleteGrade(int gradeIndex) {
    grades.remove(gradeIndex);
    gradeAttributes.remove(gradeIndex);
  }

  public void deleteAttribute(int attributeIndex) {
    for(int i = 0; i < gradeAttributes.size(); i++) {
      double[] array = new double[attributeNum - 1];
      for(int j = 0; j < attributeNum - 1; j++) {
        int shift = 0;
        if(j != attributeIndex) {
          array[j] = gradeAttributes.get(i)[j + shift];
        } else {
          shift++;
        }
      }
      gradeAttributes.set(i, array);
    }
    attributeNum -= 1;
  }
}

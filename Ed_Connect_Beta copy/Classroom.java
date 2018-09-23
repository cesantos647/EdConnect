import java.util.ArrayList;
import java.util.List;

class Classroom {
  // Primary classroom identification information
  String subject;
  String teacher;
  Database district;

  // Student logging information
  List<Student> students = new ArrayList<Student>();

  // Attribute Information
  List<String> attributes = new ArrayList<String>();

  // Solves average and stuff
  EquationSolver solver = new EquationSolver();
  
  // Grades Uploaded
  int time = 0;

  Classroom(String s, String t, Database dist) {
    subject = s;
    teacher = t;
    district = dist;
  }

  public void addStudent(String lName, String fName) {
    int studentIndexValue = district.parseStudent(lName, fName);

    if(studentIndexValue == -1) {
      System.out.println("Error: No student exists by that name in the district database");
    } else {
      students.add(new Student(district.studentNames.get(studentIndexValue)[0],
                               district.studentNames.get(studentIndexValue)[1],
                               district.studentData.get(studentIndexValue)[0],
                               district.studentData.get(studentIndexValue)[1],
                               district.studentSex.get(studentIndexValue),
                               attributes,
                               attributes.size()
                               )
                  );
    }
  }

  public void addGrade(String lName, String fName, double[] percent, double[] attribute, int month, int day, int year) {
    int studentIndexValue = district.parseStudent(lName, fName);
    if (attribute.length == attributes.size() && studentIndexValue != -1){
      students.get(studentIndexValue).addGrade(percent, attribute, month, day, year);
      studentAttributeAverage(lName, fName);
    } else {
      System.out.println("Error: No student exists by that name in the district database");
    }
    for(int i = 0; i < students.get(studentIndexValue).attributeAverages.size(); i++) { 
      System.out.println(students.get(studentIndexValue).attributeAverages.get(i)[0]);
    }

  }

  public void addAttribute(String attribute) {
    if(parseAttributes(attribute) == -1) {  
      attributes.add(attribute);
    } else {
      System.out.println("Error: Attribute already exists");
    }
  }

  public void deleteAttribute(String attribute) {
    int deleteIndex = parseAttributes(attribute);

    if(deleteIndex != -1) {
      attributes.remove(deleteIndex);
      for(int i = 0; i < students.size(); i++) {
        students.get(i).deleteAttribute(deleteIndex);
      }
    } else{
      System.out.println("Error: No attribute exists by that name in the class attribute list");
    }
  }

  public int parseAttributes(String attribute) {
    int returnVal = -1;

    for(int i = 0; i < attributes.size(); i++) {
      if(attributes.get(i).equals(attribute)) {
        returnVal = i;
      }
    }

    return returnVal;
  }

  public void studentAttributeAverage(String lName, String fName) {
    int studentIndex = district.parseStudent(lName, fName);
    
    if(studentIndex != -1) {
      double[] emptySet = new double[attributes.size()];
      for(int i = 0; i < emptySet.length; i++) {
        emptySet[i] = solver.attributeAverage(i, students.get(studentIndex));
      }
      students.get(studentIndex).attributeAverages.add(emptySet);
    } else if(studentIndex == -1) {
      System.out.println("Error: Misidentified student.");
    } else {
      System.out.println("Error: Misidentified ATTRIBUTE!!!!!");
    }
  }
  
  public void studentGradeAverage(String lName, String fName) {
    int studentIndex = district.parseStudent(lName, fName);
    if(studentIndex != -1) {
      students.get(studentIndex).gradeAverages.add(solver.weightedAverage(students.get(studentIndex).grades));
      System.out.println("Grade average for student: " + lName + ", " + fName + " is " + solver.weightedAverage(students.get(studentIndex).grades));
    } else {
      System.out.println("Error: Misidentified student.");
    }
  }
  
  public double gradePredict(String lName, String fName, double[] testWeights) {
    double returnVal = 0;
    double dividend = 0;
    int studentIndex = district.parseStudent(lName, fName);
    
    for(int i = 0; i < attributes.size(); i++) {
      returnVal += students.get(studentIndex).attributeAverages.get(students.get(studentIndex).attributeAverages.size() - 1)[i] * testWeights[i];
      dividend += testWeights[i];
    }
    
    return returnVal / dividend;
  }
}

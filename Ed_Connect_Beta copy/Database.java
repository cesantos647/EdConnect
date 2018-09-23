import java.util.ArrayList;
import java.util.List;

class Database {

  List<String[]> studentNames = new ArrayList<String[]>();
  List<String> studentSex = new ArrayList<String>();
  List<int[]> studentData = new ArrayList<int[]>();

  public void addStudent(String lName, String fName, int age, int grade, String sex) {
    String[] names = {lName, fName};
    studentNames.add(names);

    int[] data = {age, grade};
    studentData.add(data);

    studentSex.add(sex);

    System.out.println("Student successfully added to district: " + names[0] + ", " + names[1]);
  }

  public int parseStudent(String lName, String fName) {
    int returnVal = -1;

    for(int i = 0; i < studentNames.size(); i++) {
      if(studentNames.get(i)[1].equals(fName)) {
        returnVal = i;
      }
    }

    return returnVal;
  }
}

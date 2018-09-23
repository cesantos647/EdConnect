import java.util.ArrayList;
import java.util.List;

class EquationSolver {

  public double weightedAverage(List<double[]> grades) {
    double returnVal = 0;
    double dividend = 0;

    for(int i = 0; i < grades.size(); i++) {
      returnVal += grades.get(i)[0] * grades.get(i)[1];
      dividend += grades.get(i)[1];
    }

    return returnVal / dividend;
  }

  public double attributeAverage(int attributeIndex, Student sample) {
    double returnVal = 0;

    for(int i = 0; i < sample.gradeAttributes.size(); i++) {
      returnVal += sample.gradeAttributes.get(i)[attributeIndex];
    }

    return returnVal / sample.gradeAttributes.size();
  }
}

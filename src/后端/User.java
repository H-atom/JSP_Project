package 后端;

public class User {
    private String userNumber;
    private String username;
    private String password;
    private String term;
    private  String courseNumber;
    private String courseName;
    private String type;
    private  String teacher;
    private String credit;
    private String classroom;
    private String classTimeWeek;
    private String classTimeNumber;
    private String startTime;
    private String endTime;
    private String introduce;
    private String major;
    private String classes;
    private String courseType;
    private int addTime;
    private String right;
    private int summary;
    private int majorSum;

    public int getAddTime() {
        return addTime;
    }

    public void setAddTime(int addTime) {
        this.addTime = addTime;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }

    public String getClassTimeWeek() {
        return classTimeWeek;
    }

    public void setClassTimeWeek(String classTimeWeek) {
        this.classTimeWeek = classTimeWeek;
    }

    public String getClassTimeNumber() {
        return classTimeNumber;
    }

    public void setClassTimeNumber(String classTimeNumber) {
        this.classTimeNumber = classTimeNumber;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    private String student;
    private String score;
    private String gpa;
    private String gpaLevel;


    public String getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(String userNumber) {
        this.userNumber = userNumber;
    }
    public String getStudent() {
        return student;
    }

    public void setStudent(String student) {
        this.student = student;
    }

    public String getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score+"";
    }

    public String getGpa() {
        return gpa;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa+"";
    }

    public String getGpaLevel() {
        return gpaLevel;
    }

    public void setGpaLevel(String gpaLevel) {
        this.gpaLevel = gpaLevel;
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public String getCourseNumber() {
        return courseNumber;
    }

    public void setCourseNumber(String courseNumber) {
        this.courseNumber = courseNumber+"";
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getTypes() {
        return type;
    }

    public void setTypes(String type) {
        this.type = type;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getCredit() {
        return credit;
    }

    public void setCredit(double credit) {
        this.credit = credit+"";
    }

    public String getClassroom() {
        return classroom;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRight() {
        return right;
    }

    public void setRight(String right) {
        this.right = right;
    }

    public int getSummary() {
        return summary;
    }

    public void setSummary(int summary) {
        this.summary = summary;
    }

    public int getMajorSum() {
        return majorSum;
    }

    public void setMajorSum(int majorSum) {
        this.majorSum = majorSum;
    }
}

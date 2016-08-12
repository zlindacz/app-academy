function Student(fname, lname) {
  this.fname = fname;
  this.lname = lname;
  this.courses = [];
}

Student.prototype.name = () => `${this.fname} ${this.lname}`;

Student.prototype.courses = function () {
  return this.courses;
};

Student.prototype.enroll = function (course) {
  if (this.courses.indexOf(course) === -1 && !this.conflictsWith(course)) {
    this.courses.push(course);
    course.addStudent(this);
  }
};

Student.prototype.conflictsWith = function (otherCourse) {
  this.courses.forEach( course => {
    if (course.conflictsWith(otherCourse)) {
      return true;
    }
  });

  return false;
};

Student.prototype.courseLoad = function () {
  let deptCredits = {};
  this.courses.forEach(course => {
    let dept = course.dept;
    deptCredits[dept] = deptCredits[dept] || 0;
    deptCredits[dept] += course.credits;
  });

  return deptCredits;
};

function Course(name, dept, credits, days, timeBlock) {
  this.name = name;
  this.dept = dept;
  this.credits = credits;
  this.students = [];
  this.days = days;
  this.timeBlock = timeBlock;
}

Course.prototype.students = function () {
  return this.students;
};

Course.prototype.addStudent = function (student) {
  if (this.students.indexOf(student) === -1) {
    this.students.push(student);
    student.enroll(this);
  }
};

Course.prototype.conflictsWith = function (otherCourse) {
  return this.days === otherCourse.days &&
    this.timeBlock === otherCourse.timeBlock;
};

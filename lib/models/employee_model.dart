class EmployeeModel {
  String id;
  String title;
  String imageurl;
  String description;
  String rating;
  String year;
  String duration;
  // String employeeName;
  // String employeeSalary;
  // String employeeAge;
  // String profileImage;

  EmployeeModel(
      {this.id,
      this.title,
      this.imageurl,
      this.description,
      this.rating,
      this.year,
      this.duration
      // this.employeeName,
      // this.employeeSalary,
      // this.employeeAge,
      // this.profileImage

      });

  //FORMAT TO JSON
  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json['id'],
        title: json['title'],
        imageurl: json['imageurl'],
        description: json['description'],
        rating: json['rating'],
        year: json['year'],
        duration: json['duration'],
        // employeeName: json['employee_name'],
        // employeeSalary: json['employee_salary'],
        // employeeAge: json['employee_age'],
        // profileImage: json['profile_image']
      );

  //PARSE JSON
}

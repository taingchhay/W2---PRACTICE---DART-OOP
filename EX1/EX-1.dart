enum Skill { FLUTTER, DART, OTHER }

//class employee
class Employee {

  //skills: A list of skills 
  final String _name; // cannot change next time
  final double _baseSalary;
  final Skill _skills;
  final Address _address;

  //add year of experience
  final int _yearsOfExperience;

  // main constructor
  Employee({
    required String name,
    required double baseSalary,
    required Skill skills,
    required Address address,
    yearsOfExperience = 0,
  }) : _name = name,
       _baseSalary = baseSalary,
       _skills = skills,
       _address = address,
       _yearsOfExperience = yearsOfExperience;

  // Named constructor for mobile developer
  Employee.mobileDeveloper(Address address, int yearsOfExperience)
    : this(
        name: 'mengheng',
        baseSalary: 40000,
        skills: Skill.FLUTTER, // Since _skills is not a List, using FLUTTER
        address: address,
        yearsOfExperience: yearsOfExperience,
      );

  // Getters for private attributes
  String get name => _name;
  double get baseSalary => _baseSalary;
  Skill get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  //compute
  double computeSalary() {
    double totalSalary = _baseSalary;
    if (_skills == Skill.FLUTTER) {
      totalSalary = totalSalary + 5000 + (yearsOfExperience * 2000);
    } else if (_skills == Skill.DART) {
      totalSalary = totalSalary + 3000 + (yearsOfExperience * 2000);
    } else {
      totalSalary = totalSalary + 1000 + (yearsOfExperience * 2000);
    }
    //print('total salary is ${ _baseSalary + }');
    return totalSalary;
  }
  //print detail

  void printDetails() {
    print(
      'Employee: $_name\n'
      'Total Salary: \$${computeSalary()}\n'
      'Address: ${_address.street} ${_address.city} ${_address.zipCode}\n'
      'Experience: $_yearsOfExperience years\n'
      'Skill: $_skills',
    );
  }
}
//address: An Address class that contains street, city, and zipCode attributes
class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);

  // Getters for private attributes
  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;
}

void main() {
  // Create employee using main constructor
  // final emp2 = Employee(
  //   name: 'sokea',
  //   baseSalary: 40000.00,
  //   skills: Skill.FLUTTER,
  //   address: Address('Street 6A', 'Phnom Penh', 'A11'),
  //   yearsOfExperience: 10,
  // );

  final emp1 = Employee.mobileDeveloper(
    Address('123', 'pp', 'abc'), 
    1);
  //emp1._skills;
  emp1.printDetails();

  // print(emp2._baseSalary);
  //emp2.printDetails();
}

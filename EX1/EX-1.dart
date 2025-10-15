enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  final double _baseSalary;
  final Skill _skills;
  final Address _address;
  final int _yearsOfExperience;

  // name constructor
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
  Employee.mobileDeveloper( Address address, int yearsOfExperience)
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

  void printDetails() {
    print(
      'Employee: $_name\n'
      'Base Salary: \$$_baseSalary\n'
      'Address: ${_address.street} ${_address.city} ${_address.zipCode}\n'
      'Experience: $_yearsOfExperience years\n'
      'Skill: $_skills',
    );
  }

  void computeSalary() {
    if (_skills == Skill.FLUTTER) {
      print(
        ' total salary is ${_baseSalary + 5000 + (yearsOfExperience * 2000)}',
      );
    } else if (_skills == Skill.DART) {
      print(
        ' total salary is ${_baseSalary + 3000 + (yearsOfExperience * 2000)}',
      );
    } else {
      print(
        ' total salary is ${_baseSalary + 1000 + (yearsOfExperience * 2000)}',
      );
    }
    //print('total salary is ${ _baseSalary + }');
  }
}

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
  final emp2 = Employee(
    name: 'sokea',
    baseSalary: 40000.00,
    skills: Skill.OTHER,
    address: Address('Street 6A', 'Phnom Penh', 'A11'),
    yearsOfExperience: 10,
  );

  final emp1 = Employee.mobileDeveloper(
    
    Address('123', 'pp', 'abc'),
    20,
    
  );
  //emp1._skills;
  

  print(emp2._baseSalary);
  //emp1.computeSalary();
  emp2.printDetails();
}

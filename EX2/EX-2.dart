class BankAccount {
   // Private attributes for bank account
  final int _accountId;
  final String _accountOwner;
  double _balance;

  //constructor
  BankAccount(this._accountId, this._accountOwner) 
  : _balance = 0.0;

  //method
  // Returns the current balance
  double get balance => _balance;

  // Deducts the given amount from account balance

  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Withdrawal amount must be positive');
    }
    if (_balance - amount < 0) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }

  // Adds the given amount to account balance

  void credit(double amount) {
    if (amount <= 0) {
      throw Exception('Credit amount must be greater than zero !');
    }
    _balance += amount;
  }

  //getter private attri
  int get accountId => _accountId;
  String get accountOwner => _accountOwner;

  // void printAccountInfo() {
  //   print('Account ID: $_accountId');
  //   print('Owner: $_accountOwner');
  //   print('balance : \$$_balance');
  //   print('-------------');
  // }
}

class Bank {
  
  String _name;
  List<BankAccount> _accounts;

  //constructor 
  Bank({required String name}) 
  : _name = name,
    _accounts = [];
  
  //createAccount method

  BankAccount createAccount(int accountId, String accountOwner) {

    //check if acc id already exist 

    for (var account in _accounts) {
      if (account._accountId == accountId) {
        throw Exception(' Account with ID $accountId already exist');
      }
    }
    //create new acc 
    var newAccount = BankAccount(accountId, accountOwner);
    //add acc to bank list
    _accounts.add(newAccount);
    return newAccount;
  }

  //getter bank name
  String get name => _name;
  
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
     ronanAccount.withdraw(75); // This will throw an exception
   } catch (e) {
     print(e); // Output: Insufficient balance for withdrawal!
   }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}

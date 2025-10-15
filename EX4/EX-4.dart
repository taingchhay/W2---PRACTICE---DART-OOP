// Enum for order type
enum OrderType { DELIVERY, PICKUP }

//Class product
class Product {
  final int _id;
  final String _name;
  final double _price;

  //constructor
  Product({
    required int id,
    required String name,
    required double price,
  }) : _id = id, 
       _name = name, 
       _price = price;

  //getter 
  int get id => _id;
  String get name => _name;
  double get price => _price;

  void printProduct(){
    print(
      'Product ID: $_id\n'
      'Name: $_name\n'
      'Price: \$$_price\n'
    );
  }
}

class Customer {
  final int _id;
  final String _name;
  final String _email;

  //constructor 
  Customer({
    required int id,
    required String name,
    required String email,
  }) : _id = id,
       _name = name,
       _email = email;
  
  //getter 
  int get id => _id;
  String get name => _name;
  String get email => _email;

  void printCustomer(){
    print(
      'Customer ID: $_id\n'
      'Name: $_name\n'
      'Email: $_email\n'

    );
  }
}

class Order {
  final int _id;
  final Customer _customer;
  final List<Product> _products;
  final String? _deliveryAddress;
  final OrderType _orderType;
  final DateTime _orderDate;

  // Main constructor
  Order({
    required int id,
    required Customer customer,
    required List<Product> products,
    required OrderType orderType,
    String? deliveryAddress,
  }) : _id = id,
       _customer = customer,
       _products = products,
       _orderType = orderType,
       _deliveryAddress = deliveryAddress,
       _orderDate = DateTime.now();

  // Named constructor for delivery
  Order.delivery({
    required int id,
    required Customer customer,
    required List<Product> products,
    required String deliveryAddress,
  }) : this(
          id: id,
          customer: customer,
          products: products,
          orderType: OrderType.DELIVERY,
          deliveryAddress: deliveryAddress,
        );

  // Named constructor for pickup
  Order.pickup({
    required int id,
    required Customer customer,
    required List<Product> products,
  }) : this(
          id: id,
          customer: customer,
          products: products,
          orderType: OrderType.PICKUP,
        );

  //getter 
  int get id => _id;
  Customer get customer => _customer;
  List<Product> get products => _products;
  OrderType get orderType => _orderType;

  // Calculate total amount
  double getTotalAmount() {
    double total = 0.0;
    for (var product in _products) {
      total += product._price;
    }
    return total;
  }

  void printOrderDetails(){
    print(
      'ORDER DETAILS\n'
      'Order ID: $_id\n'
      'Customer: ${_customer._name} (${_customer._email})\n'
      'Order Type: $_orderType\n'
      'Order Date: $_orderDate\n'
    );
    
    if (_orderType == OrderType.DELIVERY) {
      print('Delivery Address: $_deliveryAddress\n');
    }
    
    print('Products:');
    for (var product in _products) {
      print('  - ${product._name}: \$${product._price}');
    }
    
    print(
      '\nTotal Amount: \$${getTotalAmount()}\n'
      '\n'
    );
  }
}

void main() {
  print('SHOP MANAGEMENT SYSTEM\n');

  // Create products
  var laptop = Product(
    id: 1, 
    name: 'MacBook Pro', 
    price: 1299.99
  );

  var mouse = Product(
    id: 2, 
    name: 'Wireless Mouse', 
    price: 29.99
  );

  var keyboard = Product(
    id: 3, 
    name: 'Mechanical Keyboard', 
    price: 89.99
  );

  var monitor = Product(
    id: 4, 
    name: '27-inch Monitor', 
    price: 299.99
  );

  // Create customers
  var customer1 = Customer(
    id: 1, 
    name: 'Sokea', 
    email: 'sokea@email.com'
  );

  var customer2 = Customer(
    id: 2, 
    name: 'Ronan', 
    email: 'ronan@email.com'
  );

  // Delivery order
  print('TEST 1: DELIVERY ORDER');
  var order1 = Order.delivery(
    id: 1001,
    customer: customer1,
    products: [laptop, mouse],
    deliveryAddress: '123 Main Street, Phnom Penh',
  );
  order1.printOrderDetails();

  // Pickup order
  print('TEST 2: PICKUP ORDER');
  var order2 = Order.pickup(
    id: 1002,
    customer: customer2,
    products: [keyboard, monitor],
  );
  order2.printOrderDetails();

  // Mixed products order
  print('TEST 3: MIXED PRODUCTS ORDER');
  var order3 = Order.delivery(
    id: 1003,
    customer: customer1,
    products: [monitor, keyboard, mouse],
    deliveryAddress: '456 Riverside, Siem Reap',
  );
  order3.printOrderDetails();

  print('ALL TESTS COMPLETED');
}

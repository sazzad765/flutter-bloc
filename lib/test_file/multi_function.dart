import 'package:bloc_example/models/product/product.dart';

class DFunction {
  final _list = [1, 2];

  ({String name, int age}) getNameAge(String id) {
    ({String name, int age}) data;
    data = (name: 'Sazzad', age: 10);
    return data;
  }

  (String name, int age) getNameAgeP(String id) {
    const data = ('Sazzad', 10);
    return data;
  }

  void patternMatch() {
    final Product product = Product(title: 'John', id: 30);
    final Product(:title, :id, :price) = product;
    print('Name $title, age $id');

    final lastElement = _list.lastOrNull;

    final nameAge = getNameAge('1');
    print(nameAge.name);

    final nameAgeP = getNameAgeP('1');
    print(nameAgeP.$1);

    final (name, age, address: addr) = ('Neko', 22, address: 'Nepal');
    print(name); // Neko
    print(age); // 22
    print(addr);
  }

  void switchExpressions() {
    int obtainedMarks = 9;

    final reaction = switch (obtainedMarks) {
      0 => 'Really?',
      1 || 2 || 3 => 'Call your parents',
      >= 4 && <= 6 => 'Good',
      7 || 8 || 9 => 'Noice',
      10 => 'You are OP',
      _ => 'Invalid marks'
    };

    print(reaction);
  }
}

abstract class AbstractClass {
  String name = 'Dave'; // Allowed
  void body() {
    print('body');
  } // Allowed

  int get myField; // Allowed
  void noBody(); // Allowed
}

class DemoUser {
  final String id;
  final String email;
  final String password;
  final String name;

  const DemoUser({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
  });

  factory DemoUser.fromJson(Map<String, dynamic> json) {
    return DemoUser(
      id: json['id'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'password': password, 'name': name};
  }
}

class DemoUsersService {
  static const List<Map<String, dynamic>> _demoUsers = [
    {
      'id': '1',
      'email': 'demo1@gmail.com',
      'password': 'password111',
      'name': 'Demo User 1',
    },
    {
      'id': '2',
      'email': 'demo2@gmail.com',
      'password': 'password222',
      'name': 'Demo User 2',
    },
    {
      'id': '3',
      'email': 'demo3@gmail.com',
      'password': 'password333',
      'name': 'Demo User 3',
    },
    {
      'id': '4',
      'email': 'demo4@gmail.com',
      'password': 'password444',
      'name': 'Demo User 4',
    },
    {
      'id': '5',
      'email': 'demo5@gmail.com',
      'password': 'password555',
      'name': 'Demo User 5',
    },
  ];

  static List<DemoUser> getAllUsers() {
    return _demoUsers.map((user) => DemoUser.fromJson(user)).toList();
  }

  static DemoUser? getUserByEmail(String email) {
    try {
      final userData = _demoUsers.firstWhere((user) => user['email'] == email);
      return DemoUser.fromJson(userData);
    } catch (e) {
      return null;
    }
  }

  static DemoUser? authenticateUser(String email, String password) {
    try {
      final userData = _demoUsers.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
      );
      return DemoUser.fromJson(userData);
    } catch (e) {
      return null;
    }
  }

  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return password.length >= 6;
  }
}

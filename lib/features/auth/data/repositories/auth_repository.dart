import '../../../../core/services/demo_users_service.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity?> getCurrentUser();
  Future<bool> isLoggedIn();
  Future<void> logout();
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<UserEntity> login(String email, String password) async {
    try {
      if (!DemoUsersService.isValidEmail(email)) {
        throw Exception('Please enter a valid email address');
      }
      if (!DemoUsersService.isValidPassword(password)) {
        throw Exception('Password must be at least 6 characters long');
      }

      //  ####=>Authenticate user with demo data
      final demoUser = DemoUsersService.authenticateUser(email, password);
      if (demoUser == null) {
        throw Exception('Invalid email or password');
      }

      //  ####=>Create user entity
      final user = UserEntity(
        id: demoUser.id,
        email: demoUser.email,
        name: demoUser.name,
        token: 'demo_token_${demoUser.id}',
      );

      //  ####=>Save user data to secure storage
      await SecureStorageService.saveUserToken(user.token ?? '');
      await SecureStorageService.saveUserEmail(user.email);
      await SecureStorageService.saveUserName(user.name);
      await SecureStorageService.setLoggedIn(true);

      return user;
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      final isLoggedIn = await SecureStorageService.isLoggedIn();
      if (isLoggedIn) {
        final token = await SecureStorageService.getUserToken();
        final email = await SecureStorageService.getUserEmail();
        final name = await SecureStorageService.getUserName();

        if (token != null && email != null && name != null) {
          return UserEntity(
            id: '1', //  ####=>You might want to get this from storage too
            email: email,
            name: name,
            token: token,
          );
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      return await SecureStorageService.isLoggedIn();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await SecureStorageService.clearAll();
    } catch (e) {
      throw Exception('Error logging out: ${e.toString()}');
    }
  }
}

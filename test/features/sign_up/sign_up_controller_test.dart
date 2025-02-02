import 'package:financy_app/common/models/user_model.dart';
import 'package:financy_app/features/sign_up/sign_up_controller.dart';
import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_classes.dart';

void main() {
  late SignUpController signUpController;
  late MockSecureStorage mockSecureStorage;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel userModel;

  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    mockSecureStorage = MockSecureStorage();
    signUpController =
        SignUpController(mockFirebaseAuthService, mockSecureStorage);
    userModel = UserModel(
      id: '1a2b3c4d5e',
      name: 'User',
      email: 'user@email.com',
    );
  });

  test('Tests Sign Up Controller Success State', () async {
    expect(signUpController.state, isInstanceOf<SignUpStateInitial>());

    when(
      () => mockSecureStorage.write(
        key: "CURRENT_USER",
        value: userModel.toJson(),
      ),
    ).thenAnswer((_) async {});

    when(
      () => mockFirebaseAuthService.signUp(
        name: 'User',
        email: 'user@email.com',
        password: 'user@123',
      ),
    ).thenAnswer((_) async => userModel);

    await signUpController.doSignUp(
      name: 'User',
      email: 'user@email.com',
      password: 'user@123',
    );

    expect(signUpController.state, isInstanceOf<SignUpStateSuccess>());
  });

  test('Tests Sign Up Controller Error State', () async {
    expect(signUpController.state, isInstanceOf<SignUpStateInitial>());

    when(
      () => mockSecureStorage.write(
        key: "CURRENT_USER",
        value: userModel.toJson(),
      ),
    ).thenAnswer((_) async {});

    when(
      () => mockFirebaseAuthService.signUp(
        name: 'User',
        email: 'user@email.com',
        password: 'user@123',
      ),
    ).thenThrow(
      Exception(),
    );

    await signUpController.doSignUp(
      name: 'User',
      email: 'user@email.com',
      password: 'user@123',
    );

    expect(signUpController.state, isInstanceOf<SignUpStateError>());
  });
}

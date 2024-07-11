import 'package:final_assignment/features/auth/domain/usecases/auth_usecase.dart';
import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
// import 'package:final_assignment/features/auth/presentation/navigator/register_navigator.dart';
import 'package:final_assignment/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'auth_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(), //mock class for authusecase
  MockSpec<LoginViewNavigator>(), // mock class for login view
  // MockSpec<RegisterViewNavigator>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthUseCase;
  late ProviderContainer container;
  late LoginViewNavigator mockLoginViewNavigator;
  setUp(() {
    mockAuthUseCase = MockAuthUseCase();
    mockLoginViewNavigator = MockLoginViewNavigator();
    container = ProviderContainer(overrides: [
      authViewModelProvider.overrideWith(
        (ref) => AuthViewModel(mockLoginViewNavigator, mockAuthUseCase),
      )
    ]);
  });
  test("check for the inital state in auth state", () {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, isNull);
  });

  test('login test with valid email and password', () async {
    const correctEmail = 'biraj@gmail.com';
    const correctPassword = 'biraj123';
    //Arrange

    when(mockAuthUseCase.loginUser(any, any)).thenAnswer((invocation) {
      final email = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return Future.value(
        email == correctEmail && password == correctPassword
            ? const Right(true)
            : Left(Failure(error: 'Invalid')),
      );
    });

    //Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser('biraj@gmail.com', 'biraj123');

    final authState = container.read(authViewModelProvider);

    //Assert
    expect(authState.error, isNull);
  });

  // test("registration tesr with valid credentials", (){
  //   const fname='biraj';
  //   const lname='bogati';
  //   const email='biraj@gmail.com';
  //   const phone='9863477408';
  //   const password ='1234567890';
  //   const cpassword='1234567890';

  //   // Arrange
  //   when(mockAuthUseCase.registerUser(any, any)).thenAnswer((invocation) {
  //     final fname=invocation.positionalArguments[0] as String;
  //     final lname=invocation.positionalArguments[1] as String;
  //     final phone=invocation.positionalArguments[2] as String;
  //     final email = invocation.positionalArguments[0] as String;
  //     final password = invocation.positionalArguments[1] as String;
  //     // return Future.value(
  //     //   email == correctEmail && password == correctPassword
  //     //       ? const Right(true)
  //     //       : Left(Failure(error: 'Invalid')),
  //     // );
  //   });

  //   // Act

  //   // Assert
  //   expect(authState.error, isNull);

  // }
  // );

  tearDown(() {
    container.dispose();
  });
}

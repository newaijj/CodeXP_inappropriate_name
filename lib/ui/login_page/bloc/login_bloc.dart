import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codexp_inapporpriate_name/ui/login_page/repository/UserRepository.dart';
import 'package:meta/meta.dart';

import '../../../validators.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    }
    if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    } else if (event is LoginWithFacebookPressed) {
      yield* _mapLoginWithFacebookPressedToState();
    } else if (event is LoginWithCredentialsPressed) {
      print(event.toString());
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    } else if (event is SignUpWithCredentialsPressed) {
      print(event.toString());
      yield* _mapSignUpWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    } else if (event is VerifyEmailCodePressed) {
      print(event.toString());
      yield* _mapVerificationCodePressedToState(
        email: event.email,
        verificationCode: event.verificationCode,
      );
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<LoginState> _mapLoginWithFacebookPressedToState() async* {
    yield LoginState.loading();
    print("not yet implement");
    // TODO: implement facebook login?
    // await this.userRepository.signInWithFacebook();
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    yield LoginState.loading();
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      await _userRepository.signInWithCredentials(email, password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapSignUpWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      await _userRepository.signUp(email: email, password: password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapVerificationCodePressedToState({
    String email,
    String verificationCode,
  }) async* {
    yield LoginState.loading();
    try {
      if (await _userRepository.verifyAccount(
          email: email, verificationCode: verificationCode)) {
        yield LoginState.success();
      } else {
        yield LoginState.failure();
      }
    } catch (_) {
      yield LoginState.failure();
    }
  }
}

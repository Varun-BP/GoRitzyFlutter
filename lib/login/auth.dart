import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_listener.dart';

class FirebasePhoneUtil {
  static final FirebasePhoneUtil _instance = new FirebasePhoneUtil.internal();
  FirebaseAuthListener _view;

  FirebasePhoneUtil.internal();

  factory FirebasePhoneUtil() {
    return _instance;
  }

  setScreenListener(FirebaseAuthListener view) {
    _view = view;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId;
  String _message = '';

  Future<void> verifyPhone(String phoneNumber) async {
    print('Verify number '+ phoneNumber);

    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      _view.onError(verificationId);
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      print('Code sent Verification id : '+verId);
      print('Code sent this.Verification id : '+this.verificationId);
      print('code sent _auth : '+ _auth.toString());
      _view.verificationCodeSent(forceCodeResend);
        print('Signed in');
    };

    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
    };

    final PhoneVerificationFailed veriFailed = (AuthException authException) {
      _message =
      'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
      print(_message);
      _view.onError(authException.message);
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: '+91' + phoneNumber,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
  }

  signIn(String smsCode) async {
    print('code verify Verification id : '+verificationId);
    print('code verify this.Verification id : '+this.verificationId);
    print('code verify OTP is : '+smsCode);
    print('code sent _auth : '+ _auth.toString());
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: this.verificationId,
      smsCode: smsCode,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
      if (user != null) {
        onLoginUserVerified(currentUser);

      } else {
        _message = 'Sign in failed';
      }
  }

  void onLoginUserVerified(FirebaseUser currentUser) {
    print('OTP verification sucessful');
    _view.onLoginUserVerified(currentUser);
  }

  onTokenError(String string) {
    print("libs "+string);
  }
}
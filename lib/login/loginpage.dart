import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_listener.dart';
import 'auth.dart';
import '../view/widgets/progress_hud.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    implements FirebaseAuthListener {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebasePhoneUtil firebasePhoneUtil;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  String phoneNo;
  String smsCode;
  String verificationId;
  String _message = '';

  @override
  void initState() {
    super.initState();
    firebasePhoneUtil = FirebasePhoneUtil();
    firebasePhoneUtil.setScreenListener(this);
  }

  void _submit() {
    {
      setState(() {
        _isLoading = true;
        firebasePhoneUtil.verifyPhone(this.phoneNo);
      });
    }
  }

  /*Future<void> verifyPhone() async {
    print('Verify number '+this.phoneNo);

    setState(() {
      _message = '';
    });

    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsCodeDialog(context).then((value) {
        print('Signed in');
      });
    };

    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        _message = 'Received phone auth credential: $phoneAuthCredential';
      });
    };

    final PhoneVerificationFailed veriFailed = (AuthException authException) {
      setState(() {
        _message =
        'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
        print(_message);
      });
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: this.phoneNo,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
  } */

  /* Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter sms Code'),
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                child: Text('Done'),
                onPressed: () {
                  _auth.currentUser().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/Nextscreen');
                    } else {
                      Navigator.of(context).pop();
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  } */

  /*signIn() async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        _message = 'Successfully signed in, uid: ' + user.uid;
        Navigator.of(context).pushReplacementNamed('/Nextscreen');
      } else {
        _message = 'Sign in failed';
      }
    });
  } */

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Scaffold(
      body: Stack(
          children: <Widget>[
            Container(
              color: const Color(0xf6f6f6ff),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 185.0,
                width: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/top_curve.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 150.0,
                width: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bottom_curve.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top:110.0),
                    alignment: Alignment.center,
                    width: 250.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  new Text('Welcome Back, Log In!', style: TextStyle(fontSize: 18.0, color: Colors.black),textAlign: TextAlign.center),
                  SizedBox(height: 25.0),
                  new Container(
                    height: 50.0,
                    width: 300.0,
                    child: new Stack(
                      children: <Widget>[
                        new Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/edit_text_background.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        TextField(
                        textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0, color: Colors.black, ),
                          decoration: InputDecoration.collapsed(
                            hintText: 'Enter Phone number',
                          ),
                          onChanged: (value) {
                            this.phoneNo = value;
                            print(value);
                          },
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    )
                  ),
                  GestureDetector(
                      child: Container(
                          width:160.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:AssetImage("assets/button_img1.png"),
                                  fit:BoxFit.cover
                              ),
                               // button text
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                      )
                      ),onTap:(){
                        _submit();
                  }
                  )
                ],
              )
            )
          ],
        ),
      );
    /*var screenRoot = new Container(
      height: double.maxFinite,
      alignment: FractionalOffset.center,
      child: new SingleChildScrollView(
        child: new Center(
          child: loginscreen,
        ),
      ),
    );*/

    /*return new Scaffold(
      backgroundColor: const Color(0xFF2B2B2B),
      appBar: null,
      key: _scaffoldKey,
      body: ProgressHUD(
        child: screenRoot,
        inAsyncCall: _isLoading,
        opacity: 0.0,
      ),
    );*/
  }

  @override
  void onLoginError(String errorTxt) {
    setState(() => _isLoading = false);
  }

  @override
  void closeLoader() {
    setState(() => _isLoading = false);
  }

  @override
  void showAlert(String msg) {
    setState(() {
      print(msg);
    });
  }

  @override
  void showLoader() {
    setState(() => _isLoading = true);
  }

  @override
  verificationCodeSent(int forceResendingToken) {
    moveOtpVerificationScreen();
  }

  @override
  onLoginUserVerified(FirebaseUser currentUser) {
    moveUserDashboardScreen(currentUser);
  }

  @override
  onError(String msg) {
    showAlert(msg);
    setState(() {
      _isLoading = false;
    });
  }

  loginError(e) {
    setState(() {
     print(e);
      _isLoading = false;
    });
  }

  void moveOtpVerificationScreen() {
    closeLoader();
    Navigator.of(context).pushReplacementNamed('/OtpScreen');
  }

  @override
  void moveUserDashboardScreen(FirebaseUser currentUser) {
    closeLoader();
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed('/Nextscreen');
  }

}
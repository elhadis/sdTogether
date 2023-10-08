import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../Services/global_variables.dart';
import 'package:flutter/animation.dart';
import '../ForgetPassword/forget_password_screen.dart';
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {

  late Animation<double> _animation; // Removed 'final'
  late AnimationController _animationController; // Removed 'final'
  final _loginFormKey = GlobalKey<FormState>();
  late   bool _obsecureText = true;
  final FocusNode _passFocusNode = FocusNode();
  final TextEditingController _emailTextController = TextEditingController(text: '');
  final TextEditingController _passTextController = TextEditingController(text: '');

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: 20));

    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.linear)
      ..addListener(() {
        setState(() {}); // Forces widget rebuild for animation
      })
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {
          _animationController.reset();
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // CachedNetworkImage(
          //   imageUrl: logoUrlImage,
          //   placeholder: (context, url) => Image.asset(
          //     'assets/images/login1.png',
          //     fit: BoxFit.contain,
          //   ),
          //   errorWidget: (context, url, error) => Icon(Icons.error),
          //   width: double.infinity,
          //   height: double.infinity,
          //   fit: BoxFit.contain,
          //   alignment: FractionalOffset(_animation.value, 0),
          // ),
          // You can add your login form or other widgets here.

          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18,vertical: 60),
              child: ListView(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 80,right: 80),
                    child: Image.asset('assets/images/login1.png'),
                  ),
                  const SizedBox(height: 5),
                  Form(
                    key:_loginFormKey ,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: ()=>FocusScope.of(context).requestFocus(_passFocusNode),
                          keyboardType: TextInputType.emailAddress,
                          controller:_emailTextController,
                          validator: (value){
                            if(value!.isEmpty || !value.contains('@')){
                              return "Please enter a valid Email Address";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            // No "decoration" property here
                          ),
                        ),

                        const SizedBox(height: 20),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: ()=>FocusScope.of(context).requestFocus(_passFocusNode),
                          keyboardType: TextInputType.visiblePassword,
                          controller:_passTextController,
                          obscureText: !_obsecureText,
                          validator: (value){
                            if(value!.isEmpty || value.length < 7){
                              return "Please enter a valid password";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _obsecureText = !_obsecureText;
                                });
                              },
                              child: Icon(
                                _obsecureText
                                ? Icons.visibility
                                    :Icons.visibility_off,
                                color: Colors.black45,
                              ),
                            ),
                            hintText: 'password',
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            // No "decoration" property here
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                            },
                            child: Text(
                              "Forget password?",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        MaterialButton(
                          onPressed: (){},
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),


                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "Login",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight:FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

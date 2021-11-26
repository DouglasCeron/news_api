import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/presentations/login/controller/login_controller.dart';
import 'package:news_app/shared/base/base_state/screen_base_state.dart';
import 'package:news_app/structure/assetsHelper/assets_helper.dart';

class LoginPage extends GetWidget<LoginController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        initState: (_){
          controller.setInitVariables();
        },
        builder: (_) => Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0.0,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                      image: AssetImage(AssetsHelper.loginBackgroundPath),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textInputField('Login', controller.emailController),
                  textInputField('Senha', controller.passwordController, isObscureText: true),
                  smallText(Alignment.centerRight,  EdgeInsets.only(right: 30), EdgeInsets.only(top: 20), 'Esqueceu a Senha ?'),
                  primaryButton(() => controller.onLoginButtonPressed(), Colors.white, 'Login', controller.screenState, context)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget smallText(AlignmentGeometry alignment, EdgeInsetsGeometry padding, EdgeInsetsGeometry margin, String text) {
    return Container(
                alignment: alignment,
                padding: padding,
                margin: margin ,
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.w800),
                ),
              );
  }

  Widget primaryButton(Function execute, Color buttonColor, String buttonText, BaseState screenState, BuildContext context) {
    return Container(
                width: double.infinity,
                height: 48,
                margin: EdgeInsets.only(top:20),
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: RaisedButton(
                  onPressed: (){
                    FocusScope.of(context).unfocus();
                    execute();
                  },
                  color: buttonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.all(Radius.circular(30))
                    ),
                  child: (screenState == BaseState.initState || screenState == BaseState.done) ? Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ) : CircularProgressIndicator(),
                ),
              );
  }

  Widget textInputField(String labelText, TextEditingController controller, {bool isObscureText = false}) {
    return Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  obscureText: isObscureText,
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: labelText,
                      labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w800)),
                  cursorColor: Colors.black,
                ),
              );
  }
}

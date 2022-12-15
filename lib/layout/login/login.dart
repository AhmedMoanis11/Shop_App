import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/layout/Regist/Registor.dart';
import 'package:shop_app/layout/home/ShopLayOut.dart';
import 'package:shop_app/layout/login/cubitLogin.dart';
import 'package:shop_app/shared/shared_pre.dart';

import 'StatesLogin.dart';

class LoginShopApp extends StatelessWidget {
  const LoginShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passcontroller = TextEditingController();
    bool Ispass = true;
    var keyform = GlobalKey<FormState>();
    return BlocConsumer<CubitSc, ShoppingApp>(
      listener: (context, state) {
        if(state is onsucessLogin) {
          if (state.LoginMode.status) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ShopLatOut()), (route) => false);
            print(state.LoginMode.message);
            print(state.LoginMode.data?.token);
            CacheHelper.saveData(key: 'token', value: state.LoginMode.data?.token);
            Fluttertoast.showToast(
                msg: state.LoginMode.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
          else
            {
              print(state.LoginMode.message);
              Fluttertoast.showToast(
                  msg: state.LoginMode.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
        }
      },
      builder: (context, state) {
        return Scaffold(

          body: Form(
            key: keyform,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image:AssetImage(
                              'images/imag55.jpg',
                          ) ,
                        height: 200.0,
                        width: 200.0,
                      ),
                      Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Login now to get hot offers',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                          'Terms  of  Privacy',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        child: TextFormField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            hintText: 'email address',
                            prefixIcon: Icon(
                              Icons.email,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter your email";
                            }

                            return null;
                          },
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadiusDirectional.circular(20.0),
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        child: TextFormField(
                          obscureText: CubitSc.get(context).shown,
                          controller: passcontroller,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                CubitSc.get(context).isshow,
                              ),
                              onPressed: () {
                                CubitSc.get(context).PasswordShow();
                              },
                            ),
                          ),
                          onFieldSubmitted: (value)
                          {
                            CubitSc.get(context).GetDataLogin(
                                Email: emailcontroller.text,
                                Password: passcontroller.text);
                            if (keyform.currentState!.validate()) {
                              print(emailcontroller.text);
                              print(passcontroller.text);
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadiusDirectional.circular(10.0),
                          color: Colors.grey.shade200,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.teal,
                        child: TextButton(
                          onPressed: () {
                            CubitSc.get(context).GetDataLogin(
                                Email: emailcontroller.text,
                                Password: passcontroller.text);
                            if (keyform.currentState!.validate()) {
                              print(emailcontroller.text);
                              print(passcontroller.text);
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegistorSc()));
                            },
                            child: Text(
                              'Regist',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

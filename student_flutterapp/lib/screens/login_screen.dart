import 'package:flutter/material.dart';
import 'package:student_flutterapp/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget{
  LoginScreenState createState()=>LoginScreenState();
}
class LoginScreenState extends State<LoginScreen>{
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final GlobalKey<ScaffoldState> _globalScaffoldKey = new GlobalKey<ScaffoldState>();
bool isNameFilled=true;
bool isEmailFIlled=true;
bool isPasswordFilled=true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      key: _globalScaffoldKey,
      appBar: AppBar(title:Center(child: Text("Login Screen")),backgroundColor: Colors.purpleAccent,elevation: 0.0,),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:100.0,horizontal:16.0),
              child: Card(
                child: Column( children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: flexibleTextfield(controller: nameController,hintText: "Name"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: flexibleTextfield(controller: emailController,hintText: "Email-ID"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: flexibleTextfield(controller:passwordController,hintText: "Password",obscure: true),
                  ),
                  RaisedButton(onPressed:(){done();}
//                    Navigator.pushReplacement(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => HomeScreen(),
//                      ),
//                    );
                  ,child: Text("Done"),color:Colors.purpleAccent,)
                ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }


  Widget flexibleTextfield({TextEditingController controller,String hintText ,bool obscure:false }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(child: TextField(
        controller: controller,
        decoration: InputDecoration.collapsed(hintText: hintText),
        obscureText: obscure,)),
    );
  }
  void done(){
    print("tapped");

    print(nameController.text);
    if(nameController.text.isEmpty)
    {
      setState(() {
        isPasswordFilled = false;
        print(isPasswordFilled);
        showInSnackBar("Please Enter UserName");
      });
    }
    print(emailController.text);
    if(emailController.text.isEmpty)
    {
      setState(() {
        isPasswordFilled = false;
        print(isPasswordFilled);
        showInSnackBar("Please Enter Email-ID");
      });
    }

    print(passwordController.text);
    if(passwordController.text.isEmpty) {
      setState(() {
        isPasswordFilled = false;
        print(isPasswordFilled);
        showInSnackBar("Please Enter the passsword");
      });
    }
 if(nameController.text.isNotEmpty&& emailController.text.isNotEmpty&& passwordController.text.isNotEmpty){
   setState(() {
     print("Sucessfully LogedIn");
     SharedPreferences.getInstance().then((prefs) {
       //  print('USER ID: ${model.userId}');
       prefs.setString("name", nameController.text);
       prefs.setString("emailId",emailController.text);
       prefs.setString("password",passwordController.text);
       Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(name: nameController.text,),
                      ),
                    );

     });

   });
 }

  }

  void showInSnackBar(String value) {
    _globalScaffoldKey.currentState.showSnackBar(
        new SnackBar(key: Key("message"), content: new Text(value)));
  }
}
import 'package:flutter/material.dart';
import 'package:flutterPractice/recipes/recipeBook.dart';
import 'package:flutterPractice/recipeGridPrac/recipeBookGrid.dart';
import 'APIcalls/apicall.dart';
import 'home/HomeScreen.dart';
import 'IntegerAndCalPractice/search.dart';
import 'featured/featured.dart';
import 'settings/settings.dart';
import 'resumePrac/resumeBuilderLab6.dart';
import 'recipes/recipeBook.dart';
import 'recipeGridPrac/recipeBookGrid.dart';
import 'calculatorPrac/Calculator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isRememberMe = true;
  bool _isObscure = true;

  String myName = 'Hello User';

  final emailValueHolder = TextEditingController();
  final passwordValueHolder = TextEditingController();

  changeText() {
    setState(() {
      myName = 'Hello 222301';
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailValueHolder.dispose();
    passwordValueHolder.dispose();
    super.dispose();
  }

  Widget buildEmail() {
    return (TextFormField(
      // validator: EmailValidator(errorText: "Enter valid email id"),
      controller: emailValueHolder,
      //keyboardType: TextInputType.emailAddress,
      validator: (name) {
        Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(name))
          return 'Only use alphanumeric characters';
        else
          return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black54,
          ),
          hintText: 'Username',
          hintStyle: TextStyle(color: Colors.black54)),
    ));
  }

  Widget buildPassword() {
    return TextFormField(
      controller: passwordValueHolder,
      validator: (value) {
        if (value.isEmpty) {
          return "* Required";
        } else if (value.length < 6) {
          return "Password should be atleast 6 characters";
        } else if (value.length > 15) {
          return "Password should not be greater than 15 characters";
        } else
          return null;
      },
      // obscureText: true,
      obscureText: _isObscure,
      style: TextStyle(color: Colors.black54),
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.black54,
          ),
          suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              }),
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.black54)),
    );
  }

  Widget buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("Forgot Password pressed"),
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'Forgot Password',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildRememberMe() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Text(
            'Remember Me',
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.black,
                activeColor: Colors.black12,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value;
                  });
                },
              ))
        ],
      ),
    );
  }

  Widget loginBtn() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        //onPressed: () => changeText(),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            print("Validated");
            String textToSend = emailValueHolder.text;
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    search(username: textToSend)));
          } else {
            print("Not Validated");
          }
        },
        padding: EdgeInsets.all(15),
        color: Color(0xff185a37),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget LoginPageBody() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff5ac48e),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Form(
          key: _formKey,
          // ignore: deprecated_member_use
          autovalidate: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //image,
              Image.asset(
                'assets/images/like1in.png',
                height: 80,
                width: 80,
              ),
              SizedBox(height: 50),
              buildEmail(),
              SizedBox(height: 20),
              buildPassword(),
              buildForgotPasswordBtn(),
              buildRememberMe(),
              SizedBox(height: 20),
              loginBtn(),
              SizedBox(height: 20),
              //textChange(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/person.png'),
              ),
            ),
            Container(
              child: Text('Qurat Ul Ain'),
              padding: EdgeInsets.all(7),
            )
          ],
        ),
        backgroundColor: Color(0xff185a37),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              child: UserAccountsDrawerHeader(
                accountName: Text("Qurat Ul Ain"),
                accountEmail: Text("quratulain@gmail.com"),
                decoration: BoxDecoration(
                  color: Color(0xff185a37),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/person.png'),
                  /*child: Text(
                    "QA",
                    style: TextStyle(fontSize: 40.0),
                  ),*/
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.featured_play_list),
              title: Text("Featured"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Featured()));
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Search"),
              onTap: () {
                Navigator.of(context).pop();
                String textToSend = emailValueHolder.text;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => search(
                          username: textToSend,
                        )));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Settings()));
              },
            ),
            ListTile(
              title: Text("Resume Builder"),
              leading: Icon(Icons.next_plan),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => resumeBuilderLab6()));
              },
            ),
            ListTile(
              title: Text("Recipe Book"),
              leading: Icon(Icons.next_plan),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => recipeBook()));
              },
            ),
            ListTile(
              title: Text("Recipe Book Grid"),
              leading: Icon(Icons.next_plan),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => recipeBookGrid()));
              },
            ),
            ListTile(
              title: Text("Calculator"),
              leading: Icon(Icons.next_plan),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Calculator()));
              },
            ),
            ListTile(
              title: Text("API calls"),
              leading: Icon(Icons.next_plan),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ApiCalls()));
              },
            ),
          ],
        ),
      ),
      body: LoginPageBody(),
    );
  }
}

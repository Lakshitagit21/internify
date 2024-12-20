import 'package:flutter/material.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
            
                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
            
                const SizedBox(height: 30),
            
                // welcome back, you've been missed!
                const Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Color.fromRGBO(97, 97, 97, 1),
                    fontSize: 16,
                  ),
                ),
            
                const SizedBox(height: 25),
            
                //Text for email
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10.0),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
            
                //Text for password
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10.0),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
            
                const SizedBox(height: 10),
            
                //forgot password
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color.fromRGBO(97, 97, 97, 1),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 25),
                //sign in
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Container(
                      height: 70,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                        child: Text(
                          'Sign In',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            
                //or continue with
            
                const SizedBox(height: 25),
            
                const Text(
                  'Or continue with',
                  style: TextStyle(
                    color: Color.fromRGBO(97, 97, 97, 1),
                    fontSize: 16,
                  ),
                ),
            
                const SizedBox(height: 30),
            
                //apple+google
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200],
                      ),
                      child: Image.asset(
                        'lib/icons/google.png',
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200],
                      ),
                      child: Image.asset(
                        'lib/icons/apple.png',
                        height: 40,
                      ),
                    ),
                  ],
                ),
            
                //not a member ? register now
                const SizedBox(height: 30),
            
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(97, 97, 97, 1),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Register now',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

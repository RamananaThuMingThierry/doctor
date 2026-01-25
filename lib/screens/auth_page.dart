import 'package:doctor/components/login_form.dart';
import 'package:doctor/utils/config.dart';
import 'package:doctor/utils/text.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget{
  const AuthPage({Key? key}): super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Text(
                AppText.enText['welcome_text']!,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold
                ),  
              ),
              Config.spaceSmall,
              Text(
                AppText.enText['signIn_text']!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                ),
              ),
              Config.spaceSmall,
              LoginForm(),
              Config.spaceSmall,
              Center(
                child: TextButton(child: Text(
                    AppText.enText['forgot-password']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    )
                  ),
                onPressed: () => {},),
              )
            ]),
        ),
      ),
    );
  }
}
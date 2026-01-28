import 'package:doctor/components/login_form.dart';
import 'package:doctor/components/social_button.dart';
import 'package:doctor/main_layout.dart';
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

    Config.init(context);

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
              const LoginForm(),
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
              ),
              const Spacer(),
              Center(
                child: Text(
                  AppText.enText['social-login']!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal
                  ),
                ),
              ),
              Config.spaceSmall,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialButton(social: 'google'),
                  SocialButton(social: 'facebook'),
                ],),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppText.enText['signUp_text']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey
                    ),
                  ),
                  const SizedBox(width: 2,),
                  TextButton(onPressed: (){
                  }, child: const Text('Sign Up', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),))
                ])
          ],)  
        ),
      ),
    );
  }
}
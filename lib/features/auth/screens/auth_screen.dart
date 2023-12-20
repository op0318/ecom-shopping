import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth
{
  signup,
  signin
}


class AuthScreen extends StatefulWidget {
  static const String  routeName='/auth-screen';


  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  Auth _auth=Auth.signup;
  final _signupFormKey=GlobalKey<FormState>();
  final _signInFormKey=GlobalKey<FormState>();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _nameController=TextEditingController();

  @override
  void dispose()
  {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: SafeArea(
           child: Column(children: [
             const Text('Welcome',style:
           TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
           ListTile(
             leading: Radio(
               groupValue: _auth,//this is for the default value
               activeColor: GlobalVariables.secondaryColor,
               value: Auth.signup,//This was value after selected,
               onChanged: (value) => setState(()
               {
                 _auth=value!;
               }
               ),
             ),
             title: const Text('Create Account',style: TextStyle(fontWeight: FontWeight.bold)),
           ),
             if(_auth==Auth.signup)
               Container(
                 color: GlobalVariables.backgroundColor,
                 padding: const EdgeInsets.all(8),
                 child: Form(key:_signupFormKey,
                 child: Column(
                   children: [
                     CustomTextField(controller:_nameController ,hintext: 'Name',),
                     SizedBox(height: 10),
                     CustomTextField(controller:_emailController ,hintext: 'Email',),
                     SizedBox(height: 10,),
                     CustomTextField(controller:_passwordController,hintext: 'Password',)
                   ],
                 )),
               ),
             ListTile(
               leading: Radio(
                 groupValue: _auth,//this is for the default value
                 activeColor: GlobalVariables.secondaryColor,
                 value: Auth.signin,//This was value after selected,
                 onChanged: (value) => setState(() {
                   _auth=value!;
                 }),
               ),
               title: const Text('Sign-In',style: TextStyle(fontWeight: FontWeight.bold)),
             )]),
         ),
       ),
    );
  }
}

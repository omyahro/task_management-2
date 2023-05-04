import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management/core/res/color.dart';
import 'package:task_management/core/routes/routes.dart';
import 'package:task_management/userprovider.dart';
import 'package:task_management/pages/home.dart';
import 'package:task_management/pages/signup.dart';
//import 'package:task_management/server/authservices.dart';
//import 'package:provider/provider.dart';


void main() {
  runApp(
    
      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new  UserProvider()),
      ],

      )
    
    
    
    const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  } 

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Task Management',
        debugShowCheckedModeBanner: false,
        theme: AppColors.getTheme,
        initialRoute: Routes.onBoarding,
        onGenerateRoute: RouterGenerator.generateRoutes,
        home: Provider.of<UserProvider>(context).user.token.isEmpty ? const SignupScreen() : const HomeScreen(),
        
      );
    });
  }
}

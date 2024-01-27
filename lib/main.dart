import 'package:clean_architecture/dependency_injection.dart';
import 'package:clean_architecture/features/auth/presentation/sigin/bloc/signin_bloc.dart';
import 'package:clean_architecture/features/auth/presentation/sigin/signin_screen.dart';
import 'package:clean_architecture/features/auth/presentation/signup/bloc/signup_bloc.dart';
import 'package:clean_architecture/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => SigninBloc(loginUserUseCase: loginUserUseCase)),
        BlocProvider(
            create: (_) =>
                SignupBloc(createUserAccountUseCase: createUserAccountUseCase)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SignInScreen(),
      ),
    );
  }
}

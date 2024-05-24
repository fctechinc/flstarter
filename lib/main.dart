import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:starter/controllers/approuter.dart';
import 'package:starter/controllers/data.controllers/main.data.controller.dart';
import 'package:starter/screens/base.screen.dart';
import 'package:starter/utils/context.helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => MainDataController()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: MediaQuery.textScalerOf(context).clamp(
          minScaleFactor: 1,
          maxScaleFactor: 1,
        ),
      ),
      child: MaterialApp(
        navigatorKey: ContextHelper.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: "App",
        initialRoute: BaseScreen.id,
        onGenerateRoute: AppRouter.generateRoute,
        theme: ThemeData.light(useMaterial3: true).copyWith(
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
      ),
    );
  }
}

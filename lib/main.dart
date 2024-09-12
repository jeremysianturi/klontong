import 'package:flutter/material.dart';
import 'package:ready_pagination/core/services/services_locator.dart';
import 'package:ready_pagination/pagination/ui/navigation/AppRouter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServiceLocator.initAppServiceLocator();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      title: 'Pagination App',
      onGenerateRoute: _appRouter.generateRoute,
      initialRoute: AppRouter.postsOverview, // Start at the overview screen
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/tabs_screen.dart';
import 'package:flutter_tasks_app/services/app_router.dart';
import 'package:flutter_tasks_app/services/app_theme.dart';
import 'bloc/bloc_exports.dart';
import 'screens/todo_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Tasks App',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: SafeArea(
              child: TabsScreen(),
            ),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}

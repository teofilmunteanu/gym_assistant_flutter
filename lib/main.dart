import 'package:flutter/material.dart';
import 'services/muscle_service.dart';
import 'screens/main_menu.dart';
import 'screens/screen_1_exercise_library.dart';
import 'screens/screen_2_workout_templates.dart';
import 'screens/screen_3_workouts_history.dart';
import 'screens/screen_4_settings.dart';
import 'screens/screen_5_add_exercise.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MuscleService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainMenu(),
      routes: {
        '/screen1': (context) => const Screen1ExerciseLibrary(),
        '/screen2': (context) => const Screen2WorkoutTemplates(),
        '/screen3': (context) => const Screen3WorkoutsHistory(),
        '/screen4': (context) => const Screen4Settings(),
        '/screen5': (context) => const Screen5AddExercise(),
      },
    );
  }
}

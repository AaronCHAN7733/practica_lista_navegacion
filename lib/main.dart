import 'package:flutter/material.dart';
import 'package:practica_lista_navegacion/model/taks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoListScreen(tasks: lista),
    );
  }
}

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar (
        title: const Text('Lista de tareas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].title),
            onTap: () {
              Navigator.push(context,
               MaterialPageRoute(builder: (context)=> DetailsScreen(task: tasks[index])));
            },
          );
        },
      ),



    );

  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen ({super.key,required this.task});
  final Task task;

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),


      ),
      body: Center(
        child: Text(task.description),
        ),
    );
  }
}

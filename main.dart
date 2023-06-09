import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Date Picker"),
        ),
        body:
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: ()async{
                  DateTime? datepicked=await showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2024));
                  if (datepicked!=null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Select date is ${datepicked.day}: ${datepicked.month}: ${datepicked.year}"),
                    ));
                  }
                }, child: Text("Date picker")),
                ElevatedButton(onPressed: ()async{
                  TimeOfDay? pickedtime =await showTimePicker(context: context, initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.input,
                  );
                  if (pickedtime!=null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Select time is ${pickedtime.hour}: ${pickedtime.minute}"),
                    ));
                  }


                }, child: Text("show time")),

              ],
            ))
    );

  }

}
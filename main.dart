import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  TodoListScreenState createState() => TodoListScreenState();
}

class TodoListScreenState extends State<TodoListScreen> {
  List<String> todoItems = [];

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('TODO LIST APP', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
        flexibleSpace:  Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  //begin: Alignment.topCenter,
                 end: Alignment.bottomLeft,
                  colors:[Colors.red, Colors.black]),
            ),
          ),
      ),

    body: Stack(
         children: [
    // Stylish background
             Container(
               decoration: BoxDecoration(
                gradient: LinearGradient(
                 colors: [Colors.black, Colors.red],
                   begin: Alignment.topLeft,
               end: Alignment.bottomRight,
        ),
       ),
      ),
            // Todo list
         Padding(
             padding: const EdgeInsets.all(22.0),
              child: SingleChildScrollView(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                   children:[TextField(
                 controller: textController,
                decoration: InputDecoration(
             labelText: 'Add Todo Item',
           labelStyle: TextStyle(color: Colors.white), // Changed here
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
    ),
      focusedBorder: OutlineInputBorder(
       borderSide: BorderSide(color: Colors.white),
    ),
    ),
    style: TextStyle(color: Colors.white),
    ),
        SizedBox(height: 10),
        ElevatedButton(
         onPressed: () {
          setState(() {
           todoItems.add(textController.text);
            textController.clear();
           });
    },
        child: Text('Add', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
       ),
    SizedBox(height: 20),
    ListView.builder(
    shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
          itemCount: todoItems.length,
           itemBuilder: (context, index) {
            return ListTile(
            title: Text(todoItems[index], style: TextStyle(color: Colors.white)),
              trailing: IconButton(
               icon: Icon(Icons.delete, color: Colors.white),
              onPressed: () {
               setState(() {
                todoItems.removeAt(index);
                                             });
                                           },
                                        ),
                                    );
                                 },
                               ),
                             ],
                          ),
                        ),
                      ),
                    ],
                  ),
               );
            }
          }

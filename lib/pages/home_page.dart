import 'package:app_notes/services/admin_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List notes = [];
  List<dynamic> notes = [];
  
  @override
  
  void initState(){
    super.initState();
    notesGet();
  }

  notesGet() async {
    // notes = await AdminService().getNotes();
    // print(notes);
    // setState(() {      
    // });
    try {
      notes = await AdminService().getNotes();

      setState(() {
          notes = notes;
        });

    } catch (e) {
      print('Error: $e');
    }
  }

  colorGet(String color){
    switch(color){
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'grey':
        return Colors.grey;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      default:
        return Colors.white;        
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page 123'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: notesGet, 
                child: const Text('Actualizar')
              )
            ],
          ),
          for(var note in notes)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(    
                tileColor: colorGet(note['color']),    
                textColor: Colors.white,      
                title: Text(note['title']),
                subtitle: Text(note['content']),
              ),
            ),
        ],
      )
    );
  }
}
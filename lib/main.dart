import 'package:flutter/material.dart';
import 'database_helper.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud Example App'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 140.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  int i = await DatabaseHelper.instance.insert({
                    DatabaseHelper.columnName: 'Saheb',
                  });

                  // ignore: avoid_print
                  print('the inserted id is $i');
                },
                child: const Text('Insert'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                )),
            ElevatedButton(
                onPressed: () async {
                  List<Map<String, dynamic>> queryRows =
                      await DatabaseHelper.instance.queryAll();

                  print(queryRows);
                },
                child: const Text('Query'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green))),
            ElevatedButton(
                onPressed: () async {
                  int updatedId = await DatabaseHelper.instance.update({
                    DatabaseHelper.columnId: 2,
                    DatabaseHelper.columnName: 'Mark',
                  });
                  // ignore: avoid_print
                  print(updatedId);
                },
                child: Text('Update'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue))),
            ElevatedButton(
                onPressed: () async {
                  int rowsEffected = await DatabaseHelper.instance.delete(4);

                  print(rowsEffected);
                },
                child: Text('Delete'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red))),
          ],
        ),
      ),
    );
  }
}

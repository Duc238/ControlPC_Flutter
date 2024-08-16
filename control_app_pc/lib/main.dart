import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PC Controller',
      home: ControlPage(),
    );
  }
}

class ControlPage extends StatelessWidget {
  Future<void> sendCommand(String command) async {
    final response = await http.post(
      Uri.parse('https://localhost:7259/api/control/$command'),
    );

    if (response.statusCode == 200) {
      print('Command sent: $command');
    } else {
      throw Exception('Failed to send command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'PC Controller',
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => sendCommand('shutdown'),
              child: Text('Shutdown PC'),
            ),
            ElevatedButton(
              onPressed: () => sendCommand('restart'),
              child: Text('Restart PC'),
            ),
            ElevatedButton(
                onPressed: () => sendCommand('OpenNotpad'),
                child: Text('Mở Notepad'))
            // Các nút điều khiển khác
          ],
        ),
      ),
    );
  }
}

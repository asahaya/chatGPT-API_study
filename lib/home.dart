import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'const.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _apiText;

  String searchText = "";
  @override
  void initState() {
    callAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(searchText ?? ""),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Builder(
              builder: (context) {
                final text = _apiText;
                if (text == null) {
                  return Center(child: const CircularProgressIndicator());
                }
                return Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                );
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '検索したいことは？',
              ),
              onChanged: (textValue) {
                setState(() {
                  searchText = textValue;
                });
              },
            ),
            ElevatedButton(
              onPressed: callAPI,
              child: const Text('検索'),
            )
          ],
        ),
      ),
    );
  }

  void callAPI() async {
    setState(() {
      _apiText = null;
    });

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $api',
      },
      body: jsonEncode(<String, dynamic>{
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": searchText}
          // {"role":"assistant","content":}
        ]
      }),
    );
    final body = response.bodyBytes;
    final jsonString = utf8.decode(body);
    final json = jsonDecode(jsonString);
    final content = json['choices'][0]['message']['content'];

    setState(() {
      _apiText = content;
      print(jsonString);
    });
  }
}

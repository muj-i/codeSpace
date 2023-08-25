
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        inputDecorationTheme:
            const InputDecorationTheme(border: OutlineInputBorder())),
    home: const CrudApiPractice(),
  ));
}

class CrudApiPractice extends StatefulWidget {
  const CrudApiPractice({super.key});

  @override
  State<CrudApiPractice> createState() => _CrudApiPracticeState();
}

class _CrudApiPracticeState extends State<CrudApiPractice> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _code = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _unitPrice = TextEditingController();
  final TextEditingController _totalPrice = TextEditingController();
  final TextEditingController _img = TextEditingController();

  void postRequest() async {
    Response response = await post(
      Uri.parse("https://task.teamrabbil.com/api/v1/registration"),
      headers: {'Content-type': 'application/json'},
      body: jsonEncode({
        "email": _name.text.trim(),
        "firstName": _code.text.trim(),
        "lastName": _quantity.text.trim(),
        "mobile": _totalPrice.text.trim(),
        "password": _unitPrice.text.trim(),
        "photo": _img.text.trim(),
      }),
    );
    if (response.statusCode == 200) {
      final decodedBody = jsonDecode(response.body);
      if (decodedBody['status'] == 'success') {
        if (mounted) {
          _code.clear();
          _name.clear();
          _quantity.clear();
          _img.clear();
          _totalPrice.clear();
          _unitPrice.clear();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Success!!")));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Faild!!")));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Column(
          children: [
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(hintText: 'email Name'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Fill it";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _code,
              decoration: const InputDecoration(hintText: 'first Code'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Fill it";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _quantity,
              decoration: const InputDecoration(hintText: 'last '),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Fill it";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _totalPrice,
              decoration: const InputDecoration(hintText: 'mobi price'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Fill it";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _unitPrice,
              decoration: const InputDecoration(hintText: 'pass price'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Fill it";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _img,
              decoration: const InputDecoration(hintText: 'Image'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Fill it";
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_globalKey.currentState!.validate()) {
                    postRequest();
                  }
                },
                child: const Icon(Icons.arrow_forward_ios))
          ],
        ),
      ),
    );
  }
}
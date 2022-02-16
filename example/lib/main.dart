import 'package:flutter/material.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plugin Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '디미고인 플러터 플러그인 Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DimigoinLogin _dimigoinLogin = DimigoinLogin();
  late double _height, _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: _height * 0.4,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.login),
                    title: Text('로그인'),
                    onTap: () => _showLoginDialog(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dimigoinLogin.refreshAccessToken(),
        child: Icon(Icons.refresh_rounded),
      ),
    );
  }

  void _showLoginDialog(BuildContext context) {
    final userIdTextController = TextEditingController();
    final passwordTextController = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('로그인 Dialog'),
            content: SizedBox(
              height: _height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: _width * 0.5,
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: userIdTextController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        labelText: "아이디",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _width * 0.5,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: passwordTextController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        labelText: "비밀번호",
                      ),
                    ),
                  ),
                  SizedBox(height: _height * 0.075),
                  GestureDetector(
                    onTap: () async {
                      bool isLogin = await _dimigoinLogin.login(userIdTextController.text, passwordTextController.text);
                      isLogin ? showToast("로그인에 성공하였습니다.") : showToast("로그인에 실패하였습니다.");
                    },
                    child: Container(
                      width: _width * 0.4,
                      height: _height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(child: Text("로그인하기", style: TextStyle(color: Colors.white))),
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  void showToast(String content) => Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xE6FFFFFF),
      textColor: Colors.black,
      fontSize: 13.0
  );
}

import 'package:flutter/material.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DimigoinFlutterPlugin().initializeApp();

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
      home: const MyHomePage(title: '디미고인 플러터 플러그인 예제'),
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
  DimigoinAccount _dimigoinAccount = DimigoinAccount();
  DimigoinMeal _dimigoinMeal = DimigoinMeal();
  DalgeurakService _dalgeurakService = DalgeurakService();

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
            StreamBuilder(
                stream: _dimigoinAccount.userChangeStream,
                builder: (context, snapshot) => Text("현재 로그인 되어있는 유저 이름: ${(snapshot.data as DimigoinUser?)?.name.toString()}")
            ),
            SizedBox(height: _height * 0.075),
            SizedBox(
              height: _height * 0.4,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.login),
                    title: Text('로그인'),
                    onTap: () => _showLoginDialog(context),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('로그아웃'),
                    onTap: () {
                      _dimigoinAccount.logout();
                      _showToast("로그아웃 되었습니다.");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('로그인 후, 유저 관련 정보 조회'),
                    onTap: () async => _showToast((_dimigoinAccount.currentUser.toJson()).toString()),
                  ),
                  ListTile(
                    leading: Icon(Icons.fastfood_rounded),
                    title: Text('주간 급식 정보 조회'),
                    onTap: () async => _showToast((await _dimigoinMeal.getWeeklyMeal()).toString()),
                  ),
                  ListTile(
                    leading: Icon(Icons.fastfood_rounded),
                    title: Text('오늘 급식 정보 조회'),
                    onTap: () async => _showToast((await _dimigoinMeal.getDailyMeal(true)).toString()),
                  ),
                  ListTile(
                    leading: Icon(Icons.fastfood_rounded),
                    title: Text('달그락 API - 현재 학생 현재 입장 여부, 선/후밥 여부 확인하기'),
                    onTap: () async => _showToast((await _dalgeurakService.getUserMealInfo()).toString()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dimigoinAccount.refreshAccessToken(),
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
                      bool isLogin = await _dimigoinAccount.login(userIdTextController.text, passwordTextController.text);
                      isLogin ? _showToast("로그인에 성공하였습니다.") : _showToast("로그인에 실패하였습니다.");
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

  void _showToast(String content) => Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xE6FFFFFF),
      textColor: Colors.black,
      fontSize: 13.0
  );
}

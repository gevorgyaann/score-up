import 'package:application/net/network.dart';
import 'package:application/requestes/screens/request_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _hidePassword = false;

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();


  String name = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/request_list': (context) => const RequestList(),
      },
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          backgroundColor: Colors.blue,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: const Text(
            'Մուտք',
            style: TextStyle(
                fontSize: 18,
                height: 44,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ListView(
              children: [
              const SizedBox(
              height: 35,
            ),
            Image.asset('assets/images/your_image.png',
                width: 150, height: 150),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Հեռախոսահամար",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  errorStyle: const TextStyle(color: Colors.red),
                  errorText: phoneController.text.length < 8
                      ? "Նվազագույնը 8 թիվ"
                      : null,
                  errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                  Radius.circular(15),
            ),
          ),
          hintText: ("+374 ** *** ***"),
          fillColor: Colors.white70,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        onChanged: (val) {
          setState(() {
            var name = val;
          });
        },
      ),

      const SizedBox(
        height: 15,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Գաղտնաբառ",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Մոռացե՞լ եք գաղտնաբառը",
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),

      TextField(
        obscureText: _hidePassword ? false : true,
        controller: passwordController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _hidePassword = !_hidePassword;
                });
              },
              icon: _hidePassword
                  ? Image.asset('assets/icons/Frame.png')
                  : Image.asset("assets/icons/invi.png")),
    errorStyle: const TextStyle(color: Colors.red),
    errorText: passwordController.text.length < 8
    ? "Նվազագույնը 8 նիշ"
        : null,
    errorBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(
    Radius.circular(15),
    ),
    ),
    hintText: ("Լրացնել գաղտնաբառը"),
    fillColor: Colors.white70,
    filled: true,
    border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(
    Radius.circular(15),
    ),
    ),
    ),
    onChanged: (val) {
    setState(() {
    var name = val;
    });
    }
      ),

      const SizedBox(
        height: 30,
      ),
      ElevatedButton(
        onPressed: () async {
          onLogin();
        },
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blue),
            minimumSize: WidgetStateProperty.all(const Size(344, 58)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ))),
        child: const Text(
          'Մուտք',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),

      ),
      const SizedBox(
        height: 30,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Դեռ չե՞ք գրանցվել։",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Գրանցվել",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      ],
    ),)
    ,
    )
    ,
    )
    ,
    );
  }

  void onLogin() async {
    String phone = phoneController.text.toString();
    String password = passwordController.text.toString();
    if (phone == "37495555589" && password == "Aa123456@") {
      //Navigation to RequestList
      AuthService auth = AuthService();
      auth.login(phone, password, context);
      //Navigator.pushNamed(context, '/request_list');
    } else {
      if (phone.length > 20 || password.length > 20) {
        warningAlertDialog();
      }
      else {
        incorrectInputData();
      }
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextEditingController>(
        'passwordController', passwordController));
  }

  void warningAlertDialog() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
          title: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/warning.png",
                width: 48,
                height: 48,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Ուշադրություն",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),

              const Text(
                textAlign: TextAlign.center,
                "Ձեր տվյալները մուտք են արվել թույլատրելի քանակից շատ։",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Վերականգնել գաղտնաբառը",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          )
      );
    },
    );
  }

  void incorrectInputData() {
    showDialog(context: context, builder: (context) {
      return const AlertDialog(
          title: Column(children: [
            Text(
              "Սխալ մուտքային տվյալներ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              textAlign: TextAlign.center,
              "Մուտքային տվյալները սխալ են լրացված։",
              style: TextStyle(
                  fontSize: 14
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Փորձել կրկին",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
          )
      );
    },
    );
  }
}

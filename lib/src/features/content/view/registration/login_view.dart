import 'package:beaverbasketball/src/src.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "ADMIN LOGIN",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            ...[
              "Username",
              "Password",
            ].map((e) => TextFieldCustom(label: e)),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Center(
                  child: Text("SUBMIT"),
                ),
              ),
            ),
            FooterWidget()
          ]),
        ),
      ),
    );
  }
}

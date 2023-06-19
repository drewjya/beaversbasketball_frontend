import 'package:beaverbasketball/src/src.dart';
import 'package:go_router/go_router.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = useTextEditingController();
    final passwor = useTextEditingController();

    ref.listen(authProvider, (previous, next) {
      next.maybeWhen(
        orElse: () {},
        onSuccess: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: "Berhasil Login".toWidget()));
          context.pushReplacementNamed("home");
        },
        onError: (value, error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: error.toWidget()));
        },
      );
    });

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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                children: [
                  TextFieldCustom(
                    label: "Username",
                    controller: userName,
                  ),
                  TextFieldCustom(
                    label: "Password",
                    controller: passwor,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(authProvider.notifier).login(
                            email: userName.text, password: passwor.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: NAVBAR,
                      ),
                      child: Center(
                        child: Text("SUBMIT"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            FooterWidget()
          ]),
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beaverbasketball/src/src.dart';

class RegisterView extends HookConsumerWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            ...[
              "Nama lengkap",
              "Tempat tanggal lahir",
              "Jenis kelamin",
              "Alamat tempat tingga",
              "Asal sekolah",
              "Nomor whatsapp aktif",
              "Nama orang tua (bapak",
              "Nomor hp orang tua (bapak)",
              "Nama orang tua (ibu",
              "Nomor hp orang tua (ibu)",
              "Ukuran Jersey Anak",
              "Dokument KK & AKTA lahir",
              "Cabang pendaftaran ( jakarta / bekasi )",
            ].map((e) => TextFieldCustom(label: e)),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                  fillColor: MaterialStatePropertyAll(Colors.red),
                ),
                Text(
                  "Baca Peraturan & Tata Tertib",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
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

class TextFieldCustom extends StatelessWidget {
  final String label;
  const TextFieldCustom({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label:"),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.grey,
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beaverbasketball/src/features/content/view/registration/peraturan_screen.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends HookConsumerWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final namaLengkap = useTextEditingController();
    final tempatTanggalLahir = useTextEditingController();
    final jenisKelamin = useTextEditingController(text: "Laki-Laki");
    final cabangPendaftaran = useTextEditingController(text: "Jakarta");
    final alamatTempatTinggal = useTextEditingController();
    final asalSekolah = useTextEditingController();
    final nomorWhatsappAktif = useTextEditingController();
    final namaBapak = useTextEditingController();
    final noHpBapak = useTextEditingController();
    final namaIbu = useTextEditingController();
    final noHpIbu = useTextEditingController();
    final ukuranJersey = useTextEditingController();

    return Container(
      child: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            TitlePage(text: "Registration"),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  children: [
                    TextFieldCustom(
                      label: "Nama lengkap",
                      controller: namaLengkap,
                    ),
                    TextFieldCustom(
                      label: "Tempat tanggal lahir",
                      isDateTime: true,
                      controller: tempatTanggalLahir,
                    ),
                    TextFieldCustom(
                      label: "Jenis kelamin",
                      dropdownValue: ["Laki-Laki", "Perempuan"],
                      controller: jenisKelamin,
                    ),
                    TextFieldCustom(
                      label: "Alamat tempat tinggal",
                      controller: alamatTempatTinggal,
                    ),
                    TextFieldCustom(
                      label: "Asal sekolah",
                      controller: asalSekolah,
                    ),
                    TextFieldCustom(
                      label: "Nomor whatsapp aktif",
                      controller: nomorWhatsappAktif,
                    ),
                    TextFieldCustom(
                      label: "Nama orang tua (bapak)",
                      controller: namaBapak,
                    ),
                    TextFieldCustom(
                      label: "Nomor hp orang tua (bapak)",
                      controller: noHpBapak,
                    ),
                    TextFieldCustom(
                      label: "Nama orang tua (ibu)",
                      controller: namaIbu,
                    ),
                    TextFieldCustom(
                      label: "Nomor hp orang tua (ibu)",
                      controller: noHpIbu,
                    ),
                    TextFieldCustom(
                      label: "Ukuran Jersey Anak",
                      controller: ukuranJersey,
                    ),
                    TextFieldCustom(
                      label: "Dokument KK & AKTA lahir",
                    ),
                    TextFieldCustom(
                      label: "Cabang pendaftaran ( jakarta / bekasi )",
                      controller: cabangPendaftaran,
                      dropdownValue: ["Jakarta", "Bekasi"],
                    ),
                    GestureDetector(
                      onTap: () {
                        context.goNamed('tata-tertib');
                      },
                      child: Row(
                        children: [
                          Checkbox(
                            value: ref.watch(isAcceptProvider),
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
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: NAVBAR,
                        ),
                        child: Center(
                          child: Text("SUBMIT"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                )),
            FooterWidget()
          ]),
        ),
      ),
    );
  }
}

class TextFieldCustom extends StatefulWidget {
  final List<String>? dropdownValue;
  final bool isDateTime;
  final String label;
  final TextEditingController? controller;
  const TextFieldCustom({
    Key? key,
    this.dropdownValue,
    this.isDateTime = false,
    required this.label,
    this.controller,
  }) : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  late TextEditingController tempatController;
  late TextEditingController tanggalController;
  String? date;

  @override
  void initState() {
    if (widget.isDateTime) {
      tempatController = TextEditingController();
      tanggalController = TextEditingController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dropdownValue != null) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: BACKGROUND_CONTENT,
          ),
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
            value: widget.controller?.value.text ?? "",
            items: widget.dropdownValue!
                .map((e) => DropdownMenuItem(
                      child: Text(
                        e,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        widget.controller?.text = e;
                        setState(() {});
                      },
                      value: e,
                    ))
                .toList(),
            dropdownColor: BACKGROUND_CONTENT,
            onChanged: (value) {
              widget.controller?.text = value ?? "";
            },
            isDense: true,
          )),
        ),
      );
    }
    if (widget.isDateTime) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) {
                  widget.controller?.text =
                      "${tempatController.text}, ${tanggalController.text}";
                },
                controller: tempatController,
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  labelText: "Tempat Lahir",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  fillColor: BACKGROUND_CONTENT,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  final a = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (a != null) {
                    
                    tanggalController.text = a.toString();
                    widget.controller?.text =
                        "${tempatController.text}, ${tanggalController.text}";
                  } else {
                    tanggalController.text = "";
                    widget.controller?.text =
                        "${tempatController.text}, ${tanggalController.text}";
                  }
                },
                child: TextField(
                  controller: tanggalController,
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabled: false,
                    isDense: true,
                    filled: true,
                    labelText: "Tanggal Lahir",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    fillColor: BACKGROUND_CONTENT,
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              flex: 2,
            )
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: widget.controller,
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          labelText: widget.label,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          floatingLabelStyle: TextStyle(
            color: Colors.white,
          ),
          fillColor: BACKGROUND_CONTENT,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
        ),
      ),
    );
  }
}

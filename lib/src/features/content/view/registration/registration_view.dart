// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beaverbasketball/src/features/auth/providers/register_provider.dart';
import 'package:beaverbasketball/src/features/content/view/registration/peraturan_screen.dart';
import 'package:beaverbasketball/src/src.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

showLoading(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

class RegisterView extends HookConsumerWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jenisKelamin = useTextEditingController(text: "Laki-Laki");
    final cabangPendaftaran = useTextEditingController(text: "Jakarta");
    final namaLengkap = useTextEditingController();
    final tempatLahir = useTextEditingController();
    final tanggalLahir = useTextEditingController();
    final alamatTempatTinggal = useTextEditingController();
    final asalSekolah = useTextEditingController();
    final nomorWhatsappAktif = useTextEditingController();
    final namaBapak = useTextEditingController();
    final noHpBapak = useTextEditingController();
    final namaIbu = useTextEditingController();
    final noHpIbu = useTextEditingController();
    final ukuranJersey = useTextEditingController();
    final dokumenKK = useState<PlatformFile?>(null);
    final akteKelahiran = useState<PlatformFile?>(null);
    ref.listen(registerProvider, (previous, next) {
      next.maybeWhen(
        orElse: () {},
        onSuccess: (value) {
          Navigator.pop(context);
          showToast(context, "Selamat Anda Berhasil Mendaftar");
          context.pushReplacementNamed("home");
        },
        onLoading: (value) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
        onError: (value, error) {
          Navigator.pop(context);
          showToast(context, error);
        },
      );
    });
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
                      label: "Tanggal lahir",
                      isDateTime: true,
                      tangalController: tanggalLahir,
                      tempatController: tempatLahir,
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
                    ImageWidget(
                      label: "Dokumen KK",
                      file: (file) {
                        dokumenKK.value = file;
                      },
                    ),
                    ImageWidget(
                      label: "Dokumen Akte Kelahiran",
                      file: (file) {
                        akteKelahiran.value = file;
                      },
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
                        onPressed: () {
                          if (namaLengkap.text.isEmpty) {
                            showToast(
                                context, "Nama Lengkap Tidak Boleh Kosong");
                            return;
                          }
                          if (tempatLahir.text.isEmpty ||
                              tanggalLahir.text.isEmpty) {
                            showToast(context,
                                "Tempat Tanggal Lahir Tidak Boleh Kosong");
                            return;
                          }
                          if (jenisKelamin.text.isEmpty) {
                            showToast(
                                context, "Jenis Kelamin Tidak Boleh Kosong");
                            return;
                          }
                          if (cabangPendaftaran.text.isEmpty) {
                            showToast(context,
                                "Cabang Pendaftaran Tidak Boleh Kosong");
                            return;
                          }
                          if (alamatTempatTinggal.text.isEmpty) {
                            showToast(context,
                                "Alamat Tempat Tinggal Tidak Boleh Kosong");
                            return;
                          }
                          if (asalSekolah.text.isEmpty) {
                            showToast(
                                context, "Asal Sekolah Tidak Boleh Kosong");
                            return;
                          }
                          if (nomorWhatsappAktif.text.isEmpty) {
                            showToast(context,
                                "Nomor Whatsapp Aktif Tidak Boleh Kosong");
                            return;
                          }
                          if (namaBapak.text.isEmpty) {
                            showToast(context, "Nama Bapak Tidak Boleh Kosong");
                            return;
                          }
                          if (noHpBapak.text.isEmpty) {
                            showToast(
                                context, "No Hp Bapak Tidak Boleh Kosong");
                            return;
                          }
                          if (namaIbu.text.isEmpty) {
                            showToast(context, "Nama Ibu Tidak Boleh Kosong");
                            return;
                          }
                          if (noHpIbu.text.isEmpty) {
                            showToast(context, "No Hp Ibu Tidak Boleh Kosong");
                            return;
                          }
                          if (ukuranJersey.text.isEmpty) {
                            showToast(
                                context, "Ukuran Jersey Tidak Boleh Kosong");
                            return;
                          }
                          if (dokumenKK.value == null) {
                            showToast(context, "Dokumen Kk Tidak Boleh Kosong");
                            return;
                          }
                          if (akteKelahiran.value == null) {
                            showToast(
                                context, "Akte Kelahiran Tidak Boleh Kosong");
                            return;
                          }
                          ref.read(registerProvider.notifier).register(
                              namaLengkap: namaLengkap.text,
                              tanggalLahir: tanggalLahir.text,
                              tempatLahir: tempatLahir.text,
                              jenisKelamin: jenisKelamin.text,
                              cabangPendaftaran: cabangPendaftaran.text,
                              alamatTempatTinggal: alamatTempatTinggal.text,
                              asalSekolah: asalSekolah.text,
                              nomorWhatsappAktif: nomorWhatsappAktif.text,
                              namaBapak: namaBapak.text,
                              noHpBapak: noHpBapak.text,
                              namaIbu: namaIbu.text,
                              noHpIbu: noHpIbu.text,
                              ukuranJersey: ukuranJersey.text,
                              dokumenKK: dokumenKK.value!,
                              akteKelahiran: akteKelahiran.value!);
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

class ImageWidget extends HookWidget {
  final String label;
  final Function(PlatformFile file) file;
  final bool isExpanded;

  ImageWidget({
    this.isExpanded = true,
    required this.label,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    final fileDtaa = useState<Uint8List?>(null);
    final controller = useTextEditingController();

    return GestureDetector(
      onTap: () async {
        final result = await FilePickerWeb.platform.pickFiles();
        if (result != null) {
          final data = result.files.first;
          file(data);
          fileDtaa.value = data.bytes;
          controller.text = result.files.first.name;
        }
      },
      child: AbsorbPointer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldCustom(
              label: label,
              controller: controller,
            ),
            if (fileDtaa.value != null && isExpanded)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.memory(
                  fileDtaa.value!,
                  width: 200,
                  height: 200,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

String formatDate(DateTime date, {bool isRecieved = false}) {
  DateFormat format;
  if (!isRecieved) {
    format = DateFormat("yyyy-MM-dd");
  } else {
    format = DateFormat("dd-MM-yyyy");
  }
  return format.format(date);
}

String formatDateNormal(String date, {bool isRecieved = false}) {
  DateFormat format;
  if (!isRecieved) {
    format = DateFormat("yyyy-MM-dd");
  } else {
    format = DateFormat("dd-MM-yyyy");
  }
  return DateFormat("yyyy-MM-dd").format(format.parse(date));
}

class TextFieldCustom extends StatefulWidget {
  final List<String>? dropdownValue;
  final bool isDateTime;
  final String label;
  final TextEditingController? controller;
  final TextEditingController? tempatController;
  final TextEditingController? tangalController;
  final bool isPassword;
  final bool maxLines;

  const TextFieldCustom({
    Key? key,
    this.dropdownValue,
    this.isDateTime = false,
    required this.label,
    this.controller,
    this.tempatController,
    this.tangalController,
    this.isPassword = false,
    this.maxLines = false,
  }) : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  String? date;
  bool enabled = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      enabled = widget.isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dropdownValue != null) {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: BACKGROUND_CONTENT,
                  border: Border.all(
                    color: Colors.black,
                  )),
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
          ),
          Align(
            alignment: Alignment(-0.95, 0),
            child:
                widget.label.toWidget(textAlign: TextAlign.start, fontSize: 12),
          ),
        ],
      );
    }
    if (widget.isDateTime) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            if (widget.tempatController != null) ...[
              Expanded(
                child: TextField(
                  controller: widget.tempatController,
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
              )
            ],
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
                    widget.tangalController?.text = formatDate(a);
                  } else {
                    widget.tangalController?.text = "";
                  }
                },
                child: TextField(
                  controller: widget.tangalController,
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabled: false,
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
        obscureText: enabled,
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
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      enabled = !enabled;
                    });
                  },
                  child: Icon(enabled
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined),
                )
              : null,
          fillColor: BACKGROUND_CONTENT,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
        ),
        maxLines: widget.maxLines ? null : 1,
      ),
    );
  }
}

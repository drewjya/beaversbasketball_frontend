// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:beaverbasketball/src/src.dart';
import 'package:go_router/go_router.dart';

class PeraturanContent extends HookConsumerWidget {
  const PeraturanContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TitlePage(
              fontSize: 25,
              text:
                  "PERATURAN DAN  TATA TERTIB ANGGOTA BEAVERS BASKETBALL CLUB"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: BACKGROUND_CONTENT,
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...[
                      "Untuk menjadi anggota resmi, calon anggota harus melakukan tahapan registrasi.",
                      "Selama aktif menjadi anggota, harus menjaga nama baik keluarga besar Beavers Basketball Club.",
                      "Anggota semaksimal mungkin harus mengikuti latihan rutin setiap minggunya.",
                      "Anggota harus berkomitmen menjaga dari sisi akademik maupun kemampuan dalam bola basket.",
                      "Pengaturan kategori kelas & nama di pertandingan MUTLAK ditentukan oleh kepala pelatih di setiap kategori kelompok umur.",
                      "Mematuhi arahan dari pelatih dan manajemen.",
                      "Menjaga setiap barang bawaan pribadi di setiap latihan maupun pertandingan. ( kehilangan atau kerusakan bukan tanggung jawab pelatih & manajemen).",
                      "Menggunakan seragam latihan di setiap latihan rutin .",
                      "Wajib membayar iuran bulan tepat waktu, sesuai ketentuan Beavers Basketball Club.",
                      "anggota tidak boleh pindah atau keluar ke club basket lain 3 bulan sebelum kompetisi resmi.",
                      "Apabila anggota ingin keluar dan pindah ke perkumpulan bola basket lain maka akan dikenakan peraturan yang ditetapkan oleh PP Perbasi.",
                      "Bila anggota ingin keluar dan pindah ke klub bola basket lain maka Beavers Basketball Club akan memberikan surat keluar,setelah pemain menyelesaikan administrasi yang telah ditentukan.",
                      "Apabila anggota mengundurkan diri dan tidak pindah ke klub lain, maka diharapkan membuat surat penggunduran diri dan tidak akan dibuatkan surat keluar.",
                    ].mapIndexed(
                      (index, e, f, c) => "$e".toWidget(
                        index: index + 1,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          ref
                              .read(isAcceptProvider.notifier)
                              .update((state) => true);
                          context.pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: NAVBAR,
                        ),
                        child: Center(
                          child: Text("SETUJU"),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
        FooterWidget(),
      ],
    );
  }
}

final isAcceptProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

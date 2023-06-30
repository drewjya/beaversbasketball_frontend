import 'package:beaverbasketball/src/features/content/model/schedule_model.dart';
import 'package:beaverbasketball/src/features/content/providers/schedule_providers.dart';
import 'package:beaverbasketball/src/src.dart';

class ScheduleView extends HookConsumerWidget {
  const ScheduleView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    final schedules = ref.watch(scheduleProvider).value ?? [];
    final user = ref.watch(authProvider).value;
    final isEdit = useState(false);
    final isAdd = useState(false);
    final split = schedules.groupByType();
    if (isEdit.value) {
      return Container(
        color: BACKGROUND_CONTENT,
        margin: EdgeInsets.all(30),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    isEdit.value = false;
                  },
                  child: Text("Kembali"),
                ),
                OutlinedButton(
                  onPressed: () {
                    isAdd.value = true;
                  },
                  child: Text("Tambah"),
                ),
              ],
            ),
            if (isAdd.value) AddSchedule(isEdit: isEdit),
            ...schedules.mapFixed((element, index) => EditSchedule(
                  schedule: element,
                  isEdit: isEdit,
                ))
          ],
        ),
      );
    }
    return ListView(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Center(child: TitlePage(text: "JADWAL RUTIN")),
            if (user != null)
              Align(
                alignment: Alignment(
                    Alignment.centerRight.x - 0.1, Alignment.centerRight.y),
                child: IconButton(
                  onPressed: () {
                    isEdit.value = !isEdit.value;
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              )
          ],
        ),
        if (split["Rutin"] != null)
          ...(split["Rutin"]!.groupByDay()).map((key, value) {
            return MapEntry(
                key,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: BACKGROUND_CONTENT,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "$key",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ...value.mapFixed(
                        (value, index) => Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: NAVBAR,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                value.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: !isActionEnabled ? 8 : 12,
                              ),
                              Text(
                                value.description,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }).values,
        TitlePage(text: "EVENTS"),
        if (split["Event"] != null)
          ...split["Event"]!
              .groupByDay()
              .map((key, value) => MapEntry(
                    key,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: NAVBAR,
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          ...value
                              .mapFixed((element, index) => [
                                    Center(
                                      child: Text(
                                        "${element.tanggal} - ${element.day}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 40),
                                      decoration: BoxDecoration(
                                        color: BACKGROUND_CONTENT,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            element.title,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(element.description)
                                        ],
                                      ),
                                    ),
                                  ])
                              .expand((element) => element),
                        ],
                      ),
                    ),
                  ))
              .values,
        SizedBox(
          height: 35,
        ),
        FooterWidget(),
      ],
    );
  }
}

class EditSchedule extends HookConsumerWidget {
  final ScheduleModel schedule;
  final ValueNotifier<bool> isEdit;
  const EditSchedule({
    super.key,
    required this.isEdit,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context, ref) {
    final editActivate = useState(false);
    final tipe = useTextEditingController();
    final jam = useTextEditingController();
    final tanggal = useTextEditingController();
    final deskripsi = useTextEditingController();
    final hari = useTextEditingController();
    final tipeState = useState("");
    useEffect(() {
      tipe.text = schedule.tipe;
      jam.text = schedule.title;
      tipeState.value = tipe.text;
      tanggal.text = formatDateNormal(schedule.tanggal, isRecieved: true);
      deskripsi.text = schedule.description;
      hari.text = schedule.day;
      tipe.addListener(() {
        tipeState.value = tipe.text;
      });
    }, [isEdit.value]);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: BACKGROUND_CONTENT.withAlpha(226),
        border: Border.all(
          color: NAVBAR,
        ),
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      child: Stack(
        children: [
          if (editActivate.value == false)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ("Jam : " + schedule.title).toWidget(),
                SizedBox(
                  height: 8,
                ),
                if (schedule.tipe == "Event") ...[
                  ("Tanggal : " + schedule.tanggal).toWidget(),
                  SizedBox(
                    height: 8,
                  ),
                ],
                ("Hari : " + schedule.day).toWidget(),
                SizedBox(
                  height: 8,
                ),
                ("Deskripsi: \n" + schedule.description).toWidget(),
                SizedBox(
                  height: 8,
                ),
                ("Tipe: \n" + schedule.tipe).toWidget(),
                SizedBox(
                  height: 8,
                ),
              ],
            )
          else
            Column(
              children: [
                TextFieldCustom(
                    controller: tipe,
                    label: "Tipe",
                    dropdownValue: ["Event", "Rutin"]),
                TextFieldCustom(
                  controller: hari,
                  dropdownValue: [
                    "Senin",
                    "Selasa",
                    "Rabu",
                    "Kamis",
                    "Jumat",
                    "Sabtu",
                    "Minggu",
                  ],
                  label: "Hari",
                ),
                TextFieldCustom(controller: jam, label: "Jam"),
                if (tipeState.value == "Event")
                  TextFieldCustom(
                      tangalController: tanggal,
                      label: "Tanggal",
                      isDateTime: true),
                TextFieldCustom(
                    controller: deskripsi, label: "Deskripsi", maxLines: true),
              ],
            ),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                if (editActivate.value)
                  ElevatedButton(
                    onPressed: () {
                      if (tipe.isEmpty) {
                        showToast(context, "Tipe tidak boleh kosong");
                        return;
                      }
                      if (jam.isEmpty) {
                        showToast(context, "Jam tidak boleh kosong");
                        return;
                      }
                      if (tipeState.value == "Event" && tanggal.isEmpty) {
                        showToast(context, "Tanggal tidak boleh kosong");
                        return;
                      }
                      if (deskripsi.isEmpty) {
                        showToast(context, "Deskripsi tidak boleh kosong");
                        return;
                      }
                      if (hari.isEmpty) {
                        showToast(context, "Hari tidak boleh kosong");
                        return;
                      }
                      ref
                          .read(scheduleProvider.notifier)
                          .editSchedule(id: "${schedule.id}", bodyString: {
                        "day": hari.text,
                        "title": jam.text,
                        "tanggal": tanggal.isEmpty
                            ? DateTime.now().toString()
                            : tanggal.text,
                        "description": deskripsi.text,
                        "tipe": tipe.text,
                      });
                      editActivate.value = false;
                    },
                    child: SizedBox(
                      width: 50,
                      child: Center(
                        child: Text("Save"),
                      ),
                    ),
                  ),
                if (editActivate.value == false)
                  ElevatedButton(
                    onPressed: () {
                      editActivate.value = true;
                    },
                    child: SizedBox(
                      width: 50,
                      child: Center(
                        child: Text("Edit"),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 5,
                ),
                if (editActivate.value == false)
                  ElevatedButton(
                    onPressed: () {
                      ref.read(scheduleProvider.notifier).deleteSchedule(
                          id: "${schedule.id}",
                          auth: ref.read(authProvider).value ?? "");
                    },
                    child: SizedBox(
                      width: 50,
                      child: Center(
                        child: Text("Hapus"),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AddSchedule extends HookConsumerWidget {
  final ValueNotifier<bool> isEdit;
  const AddSchedule({
    super.key,
    required this.isEdit,
  });

  @override
  Widget build(BuildContext context, ref) {
    final editActivate = useState(false);
    final tipe = useTextEditingController(text: "Rutin");
    final jam = useTextEditingController();
    final tanggal = useTextEditingController();
    final deskripsi = useTextEditingController();
    final hari = useTextEditingController(text: "Senin");
    final tipeState = useState("");
    useEffect(() {
      tipe.addListener(() {
        tipeState.value = tipe.text;
      });
    }, [isEdit.value]);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: BACKGROUND_CONTENT.withAlpha(226),
        border: Border.all(
          color: NAVBAR,
        ),
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      child: Stack(
        children: [
          Column(
            children: [
              TextFieldCustom(
                  controller: tipe,
                  label: "Tipe",
                  dropdownValue: ["Event", "Rutin"]),
              TextFieldCustom(
                controller: hari,
                dropdownValue: [
                  "Senin",
                  "Selasa",
                  "Rabu",
                  "Kamis",
                  "Jumat",
                  "Sabtu",
                  "Minggu",
                ],
                label: "Hari",
              ),
              TextFieldCustom(controller: jam, label: "Jam"),
              if (tipeState.value == "Event")
                TextFieldCustom(
                    tangalController: tanggal,
                    label: "Tanggal",
                    isDateTime: true),
              TextFieldCustom(
                  controller: deskripsi, label: "Deskripsi", maxLines: true),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (tipe.isEmpty) {
                      showToast(context, "Tipe tidak boleh kosong");
                      return;
                    }
                    if (jam.isEmpty) {
                      showToast(context, "Jam tidak boleh kosong");
                      return;
                    }
                    if (tipeState.value == "Event" && tanggal.isEmpty) {
                      showToast(context, "Tanggal tidak boleh kosong");
                      return;
                    }
                    if (deskripsi.isEmpty) {
                      showToast(context, "Deskripsi tidak boleh kosong");
                      return;
                    }
                    if (hari.isEmpty) {
                      showToast(context, "Hari tidak boleh kosong");
                      return;
                    }
                    ref
                        .read(scheduleProvider.notifier)
                        .insertSchedule(bodyString: {
                      "day": hari.text,
                      "title": jam.text,
                      "tanggal": tanggal.isEmpty
                          ? DateTime.now().toString()
                          : tanggal.text,
                      "description": deskripsi.text,
                      "tipe": tipe.text,
                    });
                    isEdit.value = false;
                  },
                  child: SizedBox(
                    width: 50,
                    child: Center(
                      child: Text("Save"),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

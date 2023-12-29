import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kotak_saran_kp/common/widgets/custom_drawer.dart';
import 'package:kotak_saran_kp/common/widgets/custom_app_bar.dart';
import 'package:kotak_saran_kp/myAdmin/admin_model.dart';
import 'package:card_swiper/card_swiper.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final Future<ListAdmin> allData = fetchData();

  @override
  void initState() {
    super.initState();
    allData;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar("List Saran Admin"),
        drawer: CustomDrawer(context: context),
        body: FutureBuilder<ListAdmin>(
          future: allData,
          builder: (context, snapshot) {
            ConnectionState state = snapshot.connectionState;
            if (state != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Swiper(
                loop: false,
                control: const SwiperControl(),
                itemCount: snapshot.data!.data.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data?.data[index];
                  return _buildAdminList(context, data!);
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
}

Widget _buildAdminList(BuildContext context, AllData data) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "FORMULIR PENGADUAN KRITIK DAN SARAN KPU",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                // Text(DateFormat("EEEE, d MMMM yyyy", "id_ID",data.createdAt.toString())
                //     .format(DateTime.now())),
                Text(formattedDate(data.createdAt)),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          SizedBox(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 2 +
                MediaQuery.of(context).size.height / 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dataForm(context, "nama", data.name),
                dataForm(context, "Alamat", data.address),
                dataForm(context, "No. Telepon", data.phone),
                dataForm(context, "Email", data.userEmail),
                dataForm(context, "Pekerjaan", data.occupation),
                dataForm(context, "No. KTP", data.ktp),
                dataForm(
                  context,
                  "Aduan, Kritik, Saran",
                  data.message,
                  height: MediaQuery.of(context).size.height / 10,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Container dataForm(BuildContext context, String formulir, String keterangan,
    {double? height}) {
  height ??= MediaQuery.of(context).size.height / 22;
  return Container(
    width: double.maxFinite,
    height: height,
    margin: const EdgeInsets.only(bottom: 5),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(formulir),
        ),
        const Text(": "),
        Expanded(
          flex: 2,
          child: Text(keterangan),
        ),
      ],
    ),
  );
}

String formattedDate(String utcDateString) {
  DateTime utcDateTime = DateTime.parse(utcDateString).toLocal();
  DateTime wibDateTime = utcDateTime.add(const Duration(hours: 7));
  final Map<String, String> indonesianDayNames = {
    'Monday': 'Senin',
    'Tuesday': 'Selasa',
    'Wednesday': 'Rabu',
    'Thursday': 'Kamis',
    'Friday': 'Jumat',
    'Saturday': 'Sabtu',
    'Sunday': 'Minggu',
  };

  final Map<String, String> indonesianMonthNames = {
    'January': 'Januari',
    'February': 'Februari',
    'March': 'Maret',
    'April': 'April',
    'May': 'Mei',
    'June': 'Juni',
    'July': 'Juli',
    'August': 'Agustus',
    'September': 'September',
    'October': 'Oktober',
    'November': 'November',
    'December': 'Desember',
  };

  String dayName = indonesianDayNames[DateFormat('EEEE').format(wibDateTime)]!;
  String dateName = DateFormat('dd').format(wibDateTime);
  String monthName =
      indonesianMonthNames[DateFormat('MMMM').format(wibDateTime)]!;

  String formattedDate = DateFormat('yyyy, HH:mm').format(wibDateTime);

  return '$dayName, $dateName $monthName $formattedDate';
}

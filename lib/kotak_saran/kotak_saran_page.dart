import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_saran_kp/common/widgets/custom_app_bar.dart';
import 'package:kotak_saran_kp/common/widgets/custom_drawer.dart';
import 'package:kotak_saran_kp/kotak_saran/bloc/kotak_saran_blocs.dart';
import 'package:kotak_saran_kp/kotak_saran/bloc/kotak_saran_events.dart';
import 'package:kotak_saran_kp/kotak_saran/bloc/kotak_saran_states.dart';
import 'package:kotak_saran_kp/kotak_saran/controller/kotak_saran_page_controller.dart';

import '../common/widgets/build_text_field.dart';

class KotakSaranPage extends StatelessWidget {
  const KotakSaranPage({super.key});

  static TextEditingController namaController = TextEditingController();

  static TextEditingController alamatController = TextEditingController();

  static TextEditingController noTelpController = TextEditingController();

  static TextEditingController pekerjaanController = TextEditingController();

  static TextEditingController noKtpController = TextEditingController();

  static TextEditingController saranController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KotakSaranBloc, KotakSaranState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: customAppBar("Kotak Saran"),
            drawer: CustomDrawer(context: context),
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 21, right: 21),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/KPU_logo.png",
                                  fit: BoxFit.fill,
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  width: MediaQuery.of(context).size.width / 4,
                                ),
                                const FittedBox(
                                  child: Text(
                                    "KOMISI PEMILIHAN UMUM",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                const FittedBox(
                                  child: Text(
                                    "SUMATERA UTARA",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const FittedBox(
                              child: Text(
                                "FORMULIR KOTAK SARAN",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height / 2 + 70,
                        child: PageView(
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              height: double.maxFinite,
                              child: Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 20,
                                        top: 10,
                                      ),
                                      child: SizedBox(
                                        height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3 -
                                            MediaQuery.of(context).size.height /
                                                17,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                BuildTextField(
                                                    context: context,
                                                    controller: noKtpController,
                                                    placeHolder:
                                                        "Masukkan Nomor KTP",
                                                    func: (value) {
                                                      context
                                                          .read<
                                                              KotakSaranBloc>()
                                                          .add(NoKtpEvent(
                                                              value));
                                                    }),
                                                BuildTextField(
                                                    context: context,
                                                    controller: namaController,
                                                    placeHolder:
                                                        "Masukkan Nama",
                                                    func: (value) {
                                                      context
                                                          .read<
                                                              KotakSaranBloc>()
                                                          .add(
                                                              NamaEvent(value));
                                                    }),
                                                BuildTextField(
                                                    context: context,
                                                    controller:
                                                        noTelpController,
                                                    placeHolder:
                                                        "Masukkan Nomor Telepon",
                                                    func: (value) {
                                                      context
                                                          .read<
                                                              KotakSaranBloc>()
                                                          .add(
                                                              NoHpEvent(value));
                                                    }),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                top: 7,
                                                bottom: 5,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "GESER",
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                  Icon(Icons.arrow_forward),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: double.maxFinite,
                              height: double.maxFinite,
                              child: Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 20,
                                        top: 10,
                                      ),
                                      child: SizedBox(
                                        height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3 -
                                            MediaQuery.of(context).size.height /
                                                17,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                BuildTextField(
                                                    context: context,
                                                    controller:
                                                        pekerjaanController,
                                                    placeHolder:
                                                        "Masukkan Pekerjaan",
                                                    func: (value) {
                                                      context
                                                          .read<
                                                              KotakSaranBloc>()
                                                          .add(PekerjaanEvent(
                                                              value));
                                                    }),
                                                BuildTextField(
                                                    context: context,
                                                    controller:
                                                        alamatController,
                                                    placeHolder:
                                                        "Masukkan Alamat",
                                                    func: (value) {
                                                      context
                                                          .read<
                                                              KotakSaranBloc>()
                                                          .add(AlamatEvent(
                                                              value));
                                                    }),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                top: 7,
                                                bottom: 5,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "GESER",
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                  Icon(Icons.arrow_forward),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: double.maxFinite,
                              height: double.maxFinite,
                              child: Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 20,
                                        top: 10,
                                      ),
                                      child: SizedBox(
                                        height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3 -
                                            MediaQuery.of(context).size.height /
                                                17,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                BuildTextField(
                                                    context: context,
                                                    controller: saranController,
                                                    placeHolder:
                                                        "Masukkan Saran",
                                                    func: (value) {
                                                      context
                                                          .read<
                                                              KotakSaranBloc>()
                                                          .add(SaranEvent(
                                                              value));
                                                    }),
                                              ],
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                foregroundColor: Colors.white,
                                              ),
                                              onPressed: () async {
                                                await KotakSaranController(
                                                        context: context)
                                                    .handleKirimSaran();
                                                await clear();
                                              },
                                              child: const Text("KIRIM EMAIL"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> clear() async {
    namaController.clear();
    alamatController.clear();
    noTelpController.clear();
    pekerjaanController.clear();
    noKtpController.clear();
    saranController.clear();
  }
}

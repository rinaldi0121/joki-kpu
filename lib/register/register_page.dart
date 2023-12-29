import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_saran_kp/common/widgets/build_text_field.dart';
import 'package:kotak_saran_kp/register/bloc/register_blocs.dart';
import 'package:kotak_saran_kp/register/bloc/register_events.dart';
import 'package:kotak_saran_kp/register/bloc/register_states.dart';
import 'package:kotak_saran_kp/register/controller/register_page_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/vector_background.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 21, right: 21),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "REGISTER",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              child: SizedBox(
                                width: double.maxFinite,
                                height: MediaQuery.of(context).size.height / 3,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.4),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(60),
                                              bottomRight: Radius.circular(60),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 21, left: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                BuildTextField(
                                                  context: context,
                                                  placeHolder: "Masukkan Email",
                                                  func: (value) {
                                                    context
                                                        .read<RegisterBlocs>()
                                                        .add(EmailEvent(value));
                                                  },
                                                ),
                                                BuildTextField(
                                                  context: context,
                                                  placeHolder:
                                                      "Masukkan Password",
                                                  func: (value) {
                                                    context
                                                        .read<RegisterBlocs>()
                                                        .add(PasswordEvent(
                                                            value));
                                                  },
                                                ),
                                                BuildTextField(
                                                  context: context,
                                                  placeHolder:
                                                      "Konfirmasi Password",
                                                  func: (value) {
                                                    context
                                                        .read<RegisterBlocs>()
                                                        .add(RePasswordEvent(
                                                            value));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: double.maxFinite,
                                      width:
                                          MediaQuery.of(context).size.width / 6,
                                      child: Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            RegisterPageController(
                                                    context: context)
                                                .handleRegister();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: const CircleBorder(),
                                            padding: const EdgeInsets.all(20),
                                            backgroundColor: Colors.redAccent,
                                          ),
                                          child: const Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/LoginPage");
                                  },
                                  child: const Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

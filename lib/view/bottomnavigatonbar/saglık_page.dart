import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/view/bottomnavigatonbar/home_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SaglikPage extends StatefulWidget {
  const SaglikPage({Key? key}) : super(key: key);

  @override
  _SaglikPageState createState() => _SaglikPageState();
}

class _SaglikPageState extends State<SaglikPage> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        actions: const [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.notifications_outlined),
          )
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Colors.amber,
        elevation: 1,
      ),
      body: Stack(children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(color: Colors.indigo),
        ),
        SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, -0.75),
                            child: CircularPercentIndicator(
                              percent: 0.8,
                              radius: 60,
                              lineWidth: 5,
                              animation: true,
                              progressColor: const Color(0xFF00FF49),
                              backgroundColor: Colors.white,
                              center: const Text(
                                '80 \nGood',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const Text(
                            'Good Health',
                          ),
                          const Text(
                            'Your Financial condition is in good health',
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircularPercentIndicator(
                                    progressColor: Colors.blue,
                                    percent: 0.65,
                                    radius: 35,
                                    lineWidth: 2,
                                    animation: true,
                                    backgroundColor: const Color(0xFFF1F4F8),
                                    center: const Icon(
                                      Icons.ac_unit_rounded,
                                      color: Colors.blue,
                                    )),
                                CircularPercentIndicator(
                                    progressColor: Colors.indigo,
                                    percent: 0.5,
                                    radius: 35,
                                    lineWidth: 2,
                                    animation: true,
                                    backgroundColor: const Color(0xFFF1F4F8),
                                    center: const Icon(
                                      Icons.description,
                                      color: Colors.indigo,
                                    )),
                                CircularPercentIndicator(
                                    progressColor: Colors.pink,
                                    percent: 0.75,
                                    radius: 35,
                                    lineWidth: 2,
                                    animation: true,
                                    backgroundColor: const Color(0xFFF1F4F8),
                                    center: const Icon(
                                      Icons.gpp_good,
                                      color: Colors.pink,
                                    )),
                                CircularPercentIndicator(
                                    progressColor: Colors.orange,
                                    percent: 0.5,
                                    radius: 35,
                                    lineWidth: 2,
                                    animation: true,
                                    backgroundColor: const Color(0xFFF1F4F8),
                                    center: const Icon(
                                      Icons.paypal,
                                      color: Colors.orange,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.85, 0),
                    child: Text(
                      'Meet Mr. Bagus',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.22,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/seed/725/600',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                '\"Hi Ika. Your score is better\n than other 40% users out there. \nKeep improving!\"',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Ask More',
                                  style: TextStyle(color: Colors.deepPurple),
                                )),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.deepPurple.shade800,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

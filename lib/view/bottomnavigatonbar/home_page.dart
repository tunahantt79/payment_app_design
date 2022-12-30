import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:payment_app/view/bottomnavigatonbar/imageSlider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DrawerHeader(
                duration: const Duration(milliseconds: 100),
                child: ListView(
                  children: [
                    const Center(child: Text('Giriş yapılan e-mail')),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                onPressed: () => FirebaseAuth.instance.signOut(),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 32,
                ),
                label: const Text(
                  'Çıkış',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.amber,
        elevation: 1,
      ),
      body: Stack(children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(color: Colors.indigo),
        ),
        Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    height: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('My Balance',
                                  style: TextStyle(color: Colors.grey)),
                              Text(
                                'Rp 1.000.000',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(
                              Icons.access_alarm_rounded,
                              size: 18,
                            ),
                            Icon(
                              Icons.access_alarm_rounded,
                              size: 18,
                            ),
                            Icon(
                              Icons.access_alarm_rounded,
                              size: 18,
                            ),
                            Icon(
                              Icons.access_alarm_rounded,
                              size: 18,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text('aaa'),
                              Text('aaa'),
                              Text('aaa'),
                              Text('aaa')
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.purple.shade400,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('E-Shopping')
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          IconlyBold.heart,
                          color: Colors.pink.shade400,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Charity')
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          IconlyBold.document,
                          color: Colors.blue.shade300,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Split Bills')
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.description,
                          color: Colors.indigo.shade400,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Bill Payment')
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.card_giftcard,
                          color: Colors.orange,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Send Gif')
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.paypal,
                          color: Colors.green,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Cash Back')
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(child: imageSlider())
          ],
        )
      ]),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 140);
    path.quadraticBezierTo(size.width / 3, 180 /*180*/, size.width / 2, 175);
    path.quadraticBezierTo(3 / 4 * size.width, 175, size.width, 140);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

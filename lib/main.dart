import 'package:flutter/material.dart';
import 'package:flutter_getx_reactive_ble/pages/pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Pemberitahuan',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Text(
              'Aplikasi ini membutuhkan bluetooth\n Silahkan Nyalakan Bluetooth Anda',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBluePlus.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return const ConnectBluetoohPage();
            }
            return _buildPopupDialog(context);
          }),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final BleController c = Get.put(BleController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('BLE TEST')),
//       body: Column(children: [
//         SizedBox(height: 50),
//         Obx((() => Text('${c.status}'))),
//         SizedBox(height: 50),
//         Obx((() => Text('${c.temperature}'))),
//         SizedBox(height: 50),
//         Obx(((() => Container(
//             child: c.status != 'connected'
//                 ? ElevatedButton(onPressed: c.connect, child: Text("CONNECt"))
//                 : null)))),
//         ElevatedButton(
//             onPressed: () {
//               Get.to(DetailPage(angka: c.temperature.toString()));
//             },
//             child: Text("Terima")),
//       ]),
//     );
//   }
// }



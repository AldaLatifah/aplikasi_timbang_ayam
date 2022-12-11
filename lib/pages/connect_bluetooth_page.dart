part of 'pages.dart';

class ConnectBluetoohPage extends StatefulWidget {
  const ConnectBluetoohPage({Key? key}) : super(key: key);

  @override
  State<ConnectBluetoohPage> createState() => _ConnectBluetoohPageState();
}

class _ConnectBluetoohPageState extends State<ConnectBluetoohPage> {
  final frb = FlutterReactiveBle();
  late StreamSubscription<ConnectionStateUpdate> connection;
  late QualifiedCharacteristic rx;
  String status = 'not connected';

  void connect() {
    setState(() {
      status = 'connecting';
    });

    connection = frb.connectToDevice(id: '8C:AA:B5:8C:41:FE').listen((state) {
      print(state.connectionState);
      if (state.connectionState == DeviceConnectionState.connected) {
        setState(() {
          status = 'success';
        });
        Get.to(MainPage());
      } else {
        setState(() {
          status = 'failed';
        });
      }
    });
  }

  // void scan() {
  //   frb.scanForDevices(
  //       withServices: [Uuid.parse('4fafc201-1fb5-459e-8fcc-c5c9c331914b')],
  //       scanMode: ScanMode.lowLatency,
  //       requireLocationServicesEnabled: false).listen((device) {
  //     if (device.serviceUuids ==
  //         Uuid.parse("4fafc201-1fb5-459e-8fcc-c5c9c331914b")) {
  //       print('found device');
  //     }
  //     //code for handling results
  //   });
  // }

  @override
  void initState() {
    connect();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (status != 'success') {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  connect();
                  if (status == 'success') {
                    Get.snackbar("BERHASIL", "Selamat Menimbang Ayam");
                    Get.to(MainPage());
                  } else {
                    Get.snackbar("GAGAL", "Silahkan Coba Lagi");
                    Get.to(ConnectBluetoohPage());
                  }
                },
                child: Text('Sambungkan'),
              ),
            )
          ],
        ),
      );
    } else {
      return MainPage();
    }
  }
}



// AlertDialog(
//       title: const Text('Sambungkan Ke Perangkat IOT'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 2.0),
//             child: Text(
//               'TIMBANGAN AYAM IIOT',
//               style: GoogleFonts.poppins(
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 15,
//               ),
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         Obx((((() => TextButton(
//               onPressed: () {
                // c.connect();
                // if (c.status == 'connected') {
                //   Get.snackbar("BERHASIL", "Selamat Menimbang Ayam");
                //   Get.to(MainPage());
                // } else {
                //   Get.snackbar("GAGAL", "Silahkan Coba Lagi");
                //   Get.to(ConnectBluetoohPage());
                // }
//               }, //masuk ke service insert data cage
//               child: Text('Sambungkan'),
//             )))))
//       ],
//     );

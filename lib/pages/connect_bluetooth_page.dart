part of 'pages.dart';

class ConnectBluetoohPage extends StatefulWidget {
  const ConnectBluetoohPage({Key? key}) : super(key: key);

  @override
  State<ConnectBluetoohPage> createState() => _ConnectBluetoohPageState();
}

class _ConnectBluetoohPageState extends State<ConnectBluetoohPage> {
  final BleController c = Get.put(BleController());
  @override
  Widget build(BuildContext context) {
    return Obx(((() => c.status != 'connected'
        ? Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      c.connect();
                      if (c.status == 'connected') {
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
          )
        : const MainPage())));
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

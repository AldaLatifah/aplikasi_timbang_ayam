part of 'pages.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;

  Future<void> initializeCamera() async {
    var cameras = await availableCameras();
    final firstCamera = cameras.first;
    controller = CameraController(firstCamera, ResolutionPreset.max);
    await controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final frb = FlutterReactiveBle();
  late StreamSubscription<ConnectionStateUpdate> connection;
  late QualifiedCharacteristic rx;
  String status = 'not connected';
  String temperature = '';

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
      } else {
        setState(() {
          status = 'failed';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: initializeCamera(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
      // jika statusnya != success maka jalankan c.connect,
      //tapi jika statusnya itu sama dengan success maka ambil nilai c.weight aja
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          rx = QualifiedCharacteristic(
              serviceId: Uuid.parse("4fafc201-1fb5-459e-8fcc-c5c9c331914b"),
              characteristicId:
                  Uuid.parse("beb5483e-36e1-4688-b7f5-ea07361b26a8"),
              deviceId: '8C:AA:B5:8C:41:FE');

          frb.subscribeToCharacteristic(rx).listen((data) {
            print("tes subscribe");
            setState(() {
              temperature = String.fromCharCodes(data);
            });
          });
          try {
            await initializeCamera();

            final image = await controller.takePicture();

            if (!mounted) return;

            await Get.off(
              DisplayResultCameraPage(
                imagePath: image.path,
                weight: temperature.toString(),
              ),
            );
          } catch (e) {
            print(e);
          }
          // c.connect();
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

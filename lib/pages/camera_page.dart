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

  @override
  Widget build(BuildContext context) {
    final BleController c = Get.put(BleController());

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
        //tapi jika statusnya itu sama dengan success maka ambil nilai c.temperature aja
        floatingActionButton: Obx(
          () => FloatingActionButton(
            onPressed: () async {
              if (c.status == 'success') {
                try {
                  await initializeCamera();

                  final image = await controller.takePicture();

                  if (!mounted) return;

                  await Get.off(
                    DisplayResultCameraPage(
                      imagePath: image.path,
                      weight: c.weight.toString(),
                    ),
                  );
                } catch (e) {
                  print(e);
                }
                // c.connect();
              } else {
                c.connect();
              }
            },
            child: const Icon(Icons.camera_alt),
          ),
        ));
  }
}
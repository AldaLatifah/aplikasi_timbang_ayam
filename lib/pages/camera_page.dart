part of 'pages.dart';

class CameraPage extends StatefulWidget {
  final CameraDescription camera;
  const CameraPage({Key? key, required this.camera}) : super(key: key);
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  var isCameraReady = false;
  var showCapturedPhoto = false;
  var ImagePath;

  // Future<void> initializeCamera() async {
  //   var cameras = await availableCameras();
  //   final firstCamera = cameras.first;
  //   controller = CameraController(firstCamera, ResolutionPreset.max);
  //   await controller.initialize();
  // }

  // Future<void> _initializeCamera() async {

  //   _controller = CameraController(firstCamera, ResolutionPreset.high);
  //   _initializeControllerFuture = _controller.initialize();
  //   if (!mounted) {
  //     return;
  //   }
  //   setState(() {
  //     isCameraReady = true;
  //   });
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     _controller != null
  //         ? _initializeControllerFuture = _controller.initialize()
  //         : null; //on pause camera is disposed, so we need to call again "issue is only for android"
  //   }
  // }
  final BleController c = Get.put(BleController());

  @override
  void initState() {
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.max,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final frb = FlutterReactiveBle();
  late StreamSubscription<ConnectionStateUpdate> connection;
  late QualifiedCharacteristic rx;
  String status = 'not connected';
  String temperature = '';

  // Future<void> test() async {

  // }
  // void connect() {
  //   setState(() {
  //     status = 'connecting';
  //   });

  //   // 8C:AA:B5:8C:41:FE Bluetooth Timbangan
  //   connection = frb.connectToDevice(id: '8C:AA:B5:85:B0:3A').listen((state) {
  //     print(state.connectionState);
  //     if (state.connectionState == DeviceConnectionState.connected) {
  //       setState(() {
  //         status = 'success';
  //       });
  //     } else {
  //       setState(() {
  //         status = 'failed';
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    c.read();
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
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
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();

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
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, prefer_const_literals_to_create_immutables

part of 'pages.dart';

class DisplayResultCameraPage extends StatelessWidget {
  final String imagePath;
  final String weight;
  const DisplayResultCameraPage(
      {Key? key, required this.imagePath, required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: (File(imagePath) != null
                ? Image.file(File(imagePath))
                : SizedBox()),
          ),
          Positioned(
            top: 36,
            left: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  // Obtain a list of the available cameras on the device.
                  final cameras = await availableCameras();

                  // Get a specific camera from the list of available cameras.
                  final firstCamera = cameras.first;
                  Get.offAll(CameraPage(
                    camera: firstCamera,
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.teal.shade900,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        "Ambil Ulang",
                        style: GoogleFonts.poppins(
                            fontSize: 8, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 48.0,
            left: 5.0,
            right: 5.0,
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Berat : $weight",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Jumlah Ayam',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, bottom: 10.0),
                    child: TextField(
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Tulis Jumlah Ayam',
                        labelStyle: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 200,
                        height: 43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.teal.shade900,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                width: 170,
                                height: 22,
                                child: Text(
                                  "Simpan Data",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
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
          )
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

part of 'widgets.dart';

class HarvestDetailCard extends StatelessWidget {
  const HarvestDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // Obtain a list of the available cameras on the device.
        final cameras = await availableCameras();

        // Get a specific camera from the list of available cameras.
        final firstCamera = cameras.first;
        // Get.to(CameraPage());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) {
              return CameraPage(
                camera: firstCamera,
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No SPPA",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Peternak ',
                      children: [
                        TextSpan(
                            text: "Akil ABD Jalil",
                            style: GoogleFonts.poppins(
                              color: Colors.blue.shade300,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ))
                      ],
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green.shade900,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 7,
                          ),
                          child: Text(
                            "1960 Ekor Ayam",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green.shade900,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 7,
                          ),
                          child: Text(
                            "SUM SUBANG",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status :',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Dikerjakan',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Icon(
                Icons.arrow_right,
                size: 24,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey,
          ),
          SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}

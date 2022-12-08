// ignore_for_file: prefer_const_constructors

part of 'widgets.dart';

class HarvestCard extends StatelessWidget {
  const HarvestCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(HarvestPage());
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return HarvestPage();
            // }));
          },
          child: Container(
              padding: EdgeInsets.all(8),
              width: 134,
              height: 52,
              decoration: BoxDecoration(
                color: Color(0xff78A18D),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Panen",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Container(
                        width: 37,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text(
                          "2 hari lagi",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Color(0xff78A18D),
                            fontWeight: FontWeight.w500,
                            fontSize: 6,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Tanggal 23 November 2022",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 8,
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

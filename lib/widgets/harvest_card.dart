// ignore_for_file: prefer_const_constructors

part of 'widgets.dart';

class HarvestCard extends StatelessWidget {
  final Harvest harvest;
  const HarvestCard({Key? key, required this.harvest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    var tglpanen = DateTime.parse(harvest.dummytgl);

    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(HarvestPage(
              harvest: harvest,
            ));
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
                        harvest.name,
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
                          "... hari lagi",
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
                    harvest.tglPanen,
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

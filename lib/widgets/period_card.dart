// ignore_for_file: prefer_const_constructors

part of 'widgets.dart';

class PeriodCard extends StatelessWidget {
  final Period period;
  PeriodCard({Key? key, required this.period}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: InkWell(
        onTap: () async {},
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
                      period.name,
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
                        text: "${period.tglawal} - ${period.tglakhir} ",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
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
              height: 12,
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
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

part of 'widgets.dart';

class CageCard extends StatelessWidget {
  final String name;
  final String lantai;
  const CageCard({Key? key, required this.name, required this.lantai})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xff75A479),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              lantai,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
        Text(
          name,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff386829)),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          color: Colors.green.shade900,
          width: 50,
          height: 2,
        ),
      ],
    );
  }
}

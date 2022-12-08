// ignore_for_file: prefer_const_constructors

part of 'widgets.dart';

class CageCard extends StatelessWidget {
  const CageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xff75A479),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Icon(
              Icons.abc,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
        Text(
          "Kandang A",
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

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CageService cageService = CageService();
  TextEditingController namaKandangController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    refreshCage();
    super.initState();
  }

  late Future<List<Cage>> cage;
  void refreshCage() {
    setState(() {
      cage = cageService.fetchMemos();
    });
  }

  //POPUP DIALOG TAMBAH DATA KANDANG
  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Tambah Data Kandang'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Text(
              'Nama Kandang',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.0),
            child: TextField(
              controller: namaKandangController,
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                hintText: 'Tulis Nama Kandang',
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
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            await cageService.addItem(Cage(namaKandangController.text));
            Get.to(MainPage());
          }, //masuk ke service insert data cage
          child: Text('OK'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                //Header
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color(0xffB9DFBA),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Timbang Ayam",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xff386829),
                            letterSpacing: 5,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Selamat Datang",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            color: Color(0xff3F414E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Semoga harimu menyenangkan",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Color(0xff3F414E),
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                //-----BATAS HEADER-------//

                Container(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kandang Saya",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Color(0xff386829),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "2 Kandang",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Color(0xffC8C8C8),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildPopupDialog(context));
                            },
                            child: Container(
                              width: 133,
                              height: 27,
                              decoration: BoxDecoration(
                                  color: Color(0xff75A479),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle_outline,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Tambah Kandang",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 90,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              FutureBuilder<List<Cage>>(
                                future: cage,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Row(
                                        children: snapshot.data!
                                            .map((todo) =>
                                                CageCard(name: todo.name))
                                            .toList());
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              )
                            ]),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously
part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CageService cageService = CageService();
  HarvestService harvestService = HarvestService();
  TextEditingController namaKandangController = TextEditingController();
  TextEditingController lantaiKandangController = TextEditingController();
  int? _selectedIndex, index;
  bool tampilPanen = false;

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

  late Future<List<Harvest>> harvest;
  // void refreshHarvest() {
  //   setState(() {
  //     harvest = harvestService.fetchMemos();
  //   });
  // }

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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Text(
              'Lantai Kandang',
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
              controller: lantaiKandangController,
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Tulis Lantai Kandang',
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
            await cageService.addItem(
                Cage(namaKandangController.text, lantaiKandangController.text));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return MainPage();
                },
              ),
            );
          }, //masuk ke service insert data cage
          child: Text('OK'),
        ),
      ],
    );
  }

  //WIDGET KANDANG

  Widget _buildDataCage(BuildContext context, Cage cage) {
    return Stack(children: [
      Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = cage.id;
                tampilPanen = true;
                harvest = harvestService.fetchData(cage.id);
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xff75A479),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                cage.lantai,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
          ),
          Text(
            cage.name,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff386829)),
          ),
          SizedBox(
            height: 5,
          ),
          _selectedIndex == index
              ? Container(
                  color: Colors.green.shade900,
                  width: 50,
                  height: 2,
                )
              : Container(),
        ],
      ),
      Align(alignment: Alignment.topLeft, child: _simplePopup(cage)),
    ]);
  }

  Widget _simplePopup(Cage cage) => PopupMenuButton<int>(
      onSelected: (x) {
        // id = memb.perusahaan_id;
        // url = memb.perusahaan.picture_path;
        // typeUser = memb.type_user;
        // user_id = memb.user.id;
        if (x == 1) {
          Get.to(CagePage(
            cage: cage,
          ));
        }
        // else{
        //   Get.to(RutinitasPage(id:id, user_id: user_id,  url:url, typeUser: typeUser));
        // }
      },
      elevation: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Text("Detail Kandang"),
            ),
          ],
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          color: Colors.green, // border color
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.edit,
            size: 10,
          ),
        ),
      ));

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
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<Cage>>(
                            future: cage,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Row(
                                    children: snapshot.data!.map((todo) {
                                  index = todo.id;
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      // left: (todo.id == 1) ? 0 : 0,
                                      right: 10,
                                    ),
                                    child: _buildDataCage(context, todo),
                                  );
                                }).toList());
                              } else {
                                return SizedBox();
                              }
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
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
                                      "Panen Mendatang",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Color(0xff386829),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "2 Panen",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Color(0xffC8C8C8),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                // Container(
                                //   width: 133,
                                //   height: 27,
                                //   decoration: BoxDecoration(
                                //       color: Color(0xff75A479),
                                //       borderRadius:
                                //           BorderRadius.all(Radius.circular(8))),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Icon(
                                //         Icons.add_circle_outline,
                                //         size: 14,
                                //         color: Colors.white,
                                //       ),
                                //       Text(
                                //         "Tambah Kandang",
                                //         style: GoogleFonts.poppins(
                                //             color: Colors.white,
                                //             fontWeight: FontWeight.normal,
                                //             fontSize: 10),
                                //       )
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            tampilPanen == true
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: FutureBuilder<List<Harvest>>(
                                      future: harvest,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Row(
                                              children: snapshot.data!
                                                  .map((todo) => HarvestCard(
                                                      harvest: todo))
                                                  .toList());
                                        } else {
                                          return SizedBox();
                                        }
                                      },
                                    ))
                                : Text(
                                    "silahkan pilih data kandang terlebih dahulu")
                          ],
                        ),
                      )
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

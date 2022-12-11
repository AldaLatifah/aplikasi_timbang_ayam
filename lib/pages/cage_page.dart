part of 'pages.dart';

class CagePage extends StatefulWidget {
  final Cage cage;
  const CagePage({Key? key, required this.cage}) : super(key: key);

  @override
  State<CagePage> createState() => _CagePageState();
}

class _CagePageState extends State<CagePage> {
  PeriodService periodService = PeriodService();
  TextEditingController namaPeriodController = TextEditingController();
  TextEditingController tglAwalPeriodController = TextEditingController();
  TextEditingController tglAkhirPeriodController = TextEditingController();
  DateTime tanggal = DateTime.now();
  DateTime tgl = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    refreshPeriod();
    super.initState();
  }

  late Future<List<Period>> period;
  void refreshPeriod() {
    setState(() {
      period = periodService.fetchMemos();
    });
  }

  //POPUP DIALOG TAMBAH DATA KANDANG
  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Tambah Data Periode'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.0),
            child: TextField(
              controller: namaPeriodController,
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.abc),
                hintText: 'Tulis Nama Periode',
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
            padding: EdgeInsets.only(left: 2.0),
            child: TextField(
              controller: tglAwalPeriodController,
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                hintText: 'Tanggal Awal Periode',
                labelStyle: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                icon: Icon(Icons.calendar_today),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    tglAwalPeriodController.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.0),
            child: TextField(
              controller: tglAkhirPeriodController,
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                hintText: 'Tanggal Akhir Periode',
                labelStyle: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                icon: Icon(Icons.calendar_today),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    tglAkhirPeriodController.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
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
            await periodService.addItem(
              Period(
                namaPeriodController.text,
                tglAwalPeriodController.text,
                tglAkhirPeriodController.text,
                widget.cage.id,
              ),
            );
            print("tes");
            Get.to(CagePage(
              cage: widget.cage,
            ));
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xff386829),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_left,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Text(
                          "${widget.cage.name}",
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Text(
                          "Lantai ${widget.cage.lantai} ",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Data Periode',
                            style: GoogleFonts.poppins(
                              color: Color(0xff386829),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    _buildPopupDialog(context));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff386829),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 7,
                                horizontal: 16,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add_circle_outline,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Tambah Periode',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                FutureBuilder<List<Period>>(
                  future: period,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                          children: snapshot.data!
                              .map((todo) => PeriodCard(
                                    period: todo,
                                  ))
                              .toList());
                    } else {
                      return SizedBox();
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

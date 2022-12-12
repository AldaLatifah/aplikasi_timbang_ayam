// ignore_for_file: prefer_const_constructors

part of 'pages.dart';

class CreateSppaPage extends StatefulWidget {
  final Harvest harvest;
  const CreateSppaPage({Key? key, required this.harvest}) : super(key: key);

  @override
  State<CreateSppaPage> createState() => _CreateSppaPageState();
}

class _CreateSppaPageState extends State<CreateSppaPage> {
  SppaService sppaService = SppaService();
  TextEditingController namaCustomerController = TextEditingController();
  TextEditingController peternakController = TextEditingController();
  TextEditingController ekorController = TextEditingController();
  TextEditingController kgController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noTrukController = TextEditingController();
  TextEditingController namaSopirController = TextEditingController();
  TextEditingController tglController = TextEditingController();
  TextEditingController jamController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.green.shade900,
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.offAll(() => HomePage());
                      },
                      child: const Icon(
                        Icons.arrow_left,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Text(
                      'Tambah SPPA',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 2.0),
                        child: TextField(
                          controller: namaCustomerController,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(Icons.abc),
                            hintText: 'Tulis Nama Customer',
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
                          controller: peternakController,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(Icons.abc),
                            hintText: 'Tulis Nama Peternak',
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
                          controller: ekorController,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(Icons.abc),
                            hintText: 'Tulis Jumlah Ekor Ayam',
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
                          controller: kgController,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(Icons.abc),
                            hintText: 'Tulis Kg Ayam',
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
                          controller: alamatController,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(Icons.abc),
                            hintText: 'Tulis Alamat Customer',
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
                          controller: noTrukController,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(Icons.abc),
                            hintText: 'Tulis No Truk Pengangkut',
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
                          controller: namaSopirController,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(Icons.abc),
                            hintText: 'Tulis Nama Sopir',
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
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.0),
                        child: TextField(
                          controller: tglController,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Tanggal SPPA',
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
                                tglController.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          onPressed: () async {
                            var rnd = new Random();
                            var next = rnd.nextDouble() * 1000000;
                            while (next < 100000) {
                              next *= 10;
                            }
                            int no_sppa = next.toInt();
                            DateTime now = DateTime.now();
                            var formatter = new DateFormat('dd-MM-yyyy');
                            String date = formatter.format(now);
                            await sppaService.addItem(
                              Sppa(
                                no_sppa.toString(),
                                peternakController.text,
                                namaCustomerController.text,
                                int.parse(ekorController.text),
                                int.parse(kgController.text),
                                alamatController.text,
                                noTrukController.text,
                                namaSopirController.text,
                                tglController.text,
                                "15:00",
                                widget.harvest.id,
                              ),
                            );

                            Get.to(HarvestPage(
                              harvest: widget.harvest,
                            ));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: Colors.green.shade900,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              'Tambah Data',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

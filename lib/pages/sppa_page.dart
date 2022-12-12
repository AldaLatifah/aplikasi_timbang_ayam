part of 'pages.dart';

class SppaPage extends StatefulWidget {
  const SppaPage({Key? key}) : super(key: key);

  @override
  State<SppaPage> createState() => _SppaPageState();
}

class _SppaPageState extends State<SppaPage> {
  SppaService sppaService = SppaService();
  @override
  void initState() {
    // TODO: implement initState
    refreshPeriod();
    super.initState();
  }

  late Future<List<Sppa>> sppa;

  void refreshPeriod() {
    setState(() {
      sppa = sppaService.fetchMemos();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data SPPA ",
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffB9DFBA),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder<List<Sppa>>(
            future: sppa,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    children: snapshot.data!
                        .map((todo) => HarvestDetailCard(
                              sppa: todo,
                            ))
                        .toList());
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}

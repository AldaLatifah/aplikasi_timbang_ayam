part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<BottomNavigationBarItem> _myItem = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: "Kandang",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.pending_actions_rounded),
      label: "Periode",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Laporan",
    ),
  ];

  final List<Widget> _myPages = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _myPages.elementAt(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffB9DFBA),
        selectedItemColor: Color(0xff386829),
        unselectedItemColor: Colors.black,
        currentIndex: _pageIndex,
        items: _myItem,
        onTap: (int newIndex) {
          setState(() {
            _pageIndex = newIndex;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:learn_clean_architecture/presentation/home/home.screen.dart';
import 'package:learn_clean_architecture/presentation/screens.dart';

import 'navbar.screen.dart';

class MainPageView extends StatefulWidget {
  final int? initialPage;
  final int? index;
  const MainPageView({
    super.key,
    this.initialPage,
    this.index,
  });

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  int index = 0;
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    index = widget.index!;
    selectedPage = widget.initialPage!;
    pageController = PageController(initialPage: widget.initialPage!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 14, 18, 22),
          ),
          SafeArea(
            child: Container(
              color: Colors.black12,
            ),
          ),
          SafeArea(
              child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedPage = index;
              });
            },
            children: [
              Center(
                child: HomeScreen(),
              ),
              Center(
                child: PesananScreen(),
              ),
              Center(
                child: PengeluaranScreen(),
              ),
              Center(
                child: Text('Akun'),
              ),
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: NavbarScreen(
              selectedIndex: selectedPage,
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          )
        ],
      ),
    );
  }
}

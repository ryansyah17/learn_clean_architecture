import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'controllers/navbar.controller.dart';

class NavbarScreen extends GetView<NavbarController> {
  final int? selectedIndex;
  final Function(int index)? onTap;
  const NavbarScreen({super.key, this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    TextStyle titleNavbar1 = GoogleFonts.montserrat(
      fontSize: 12,
      color: Colors.black,
    );
    TextStyle titleNavbar2 = GoogleFonts.montserrat(
      fontSize: 12,
      color: Colors.blue,
    );
    return Stack(
      children: [
        Positioned(
          height: 8.h,
          bottom: 3.h,
          left: 6.w,
          right: 6.w,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            height: 8.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              shape: BoxShape.rectangle,
              color: Colors.grey[300],
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (onTap != null) {
                            onTap!(0);
                          }
                        },
                        child: Column(
                          children: [
                            Text(
                              'Home',
                              style: (selectedIndex == 0)
                                  ? titleNavbar2
                                  : titleNavbar1,
                              // ignore: deprecated_member_use
                              textScaleFactor: 1.0,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (onTap != null) {
                            onTap!(1);
                          }
                        },
                        child: Column(
                          children: [
                            Text(
                              'Pesanan',
                              style: (selectedIndex == 1)
                                  ? titleNavbar2
                                  : titleNavbar1,
                              // ignore: deprecated_member_use
                              textScaleFactor: 1.0,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (onTap != null) {
                            onTap!(2);
                          }
                        },
                        child: Column(
                          children: [
                            Text(
                              'Laporan',
                              style: (selectedIndex == 2)
                                  ? titleNavbar2
                                  : titleNavbar1,
                              // ignore: deprecated_member_use
                              textScaleFactor: 1.0,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (onTap != null) {
                            onTap!(3);
                          }
                        },
                        child: Column(
                          children: [
                            Text(
                              'Akun',
                              style: (selectedIndex == 3)
                                  ? titleNavbar2
                                  : titleNavbar1,
                              // ignore: deprecated_member_use
                              textScaleFactor: 1.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

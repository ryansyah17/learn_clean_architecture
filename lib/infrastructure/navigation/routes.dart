class Routes {
  static Future<String> get initialRoute async {
    return HOME;
  }

  static Future<String> get loginRoute async {
    return LOGIN;
  }

  static Future<String> get navBarRoute async {
    return MAINPAGE;
  }

  static const DETAIL = '/detail';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const MAINPAGE = '/mainpage';
  static const NAVBAR = '/navbar';
  static const PESANAN = '/pesanan';
  static const PENGELUARAN = '/pengeluaran';
}

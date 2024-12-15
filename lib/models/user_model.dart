class User {
  final String id;
  final double penjualan;
  final double pengeluaran;
  late final double keuntungan;

  User({
    required this.id,
    required this.penjualan,
    required this.pengeluaran,
  }) {
    keuntungan = penjualan - pengeluaran;
  }
}

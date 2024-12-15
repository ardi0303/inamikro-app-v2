class Barang {
  final String namaBarang;
  final int hargaBarang;
  final String? tanggalKadaluarsa;
  late int quantity;
  final String? satuan;

  Barang({required this.namaBarang, required this.hargaBarang, this.tanggalKadaluarsa, required this.quantity, required this.satuan});
}
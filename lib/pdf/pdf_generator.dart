import 'dart:io';
import 'package:pdf/widgets.dart' as pw;

Future<String> generateInvoicePdf({
  required String invoiceNumber,
  required String date,
  required String time,
  required String customerName,
  required List<Map<String, dynamic>> items,
  required double totalPrice,
  required double umkmTax,
}) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Invoice',
              style:
                  pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 20),
          pw.Text('Invoice Number: #$invoiceNumber',
              style: const pw.TextStyle(fontSize: 16)),
          pw.Text('Date & Time: $date, $time',
              style: const pw.TextStyle(fontSize: 16)),
          pw.Text('Pelanggan: $customerName',
              style: const pw.TextStyle(fontSize: 16)),
          pw.SizedBox(height: 20),
          pw.Table.fromTextArray(
            headers: ['Item', 'Quantity', 'Price'],
            data: items
                .map((item) => [
                      item['name'],
                      item['quantity'],
                      item['price'],
                    ])
                .toList(),
            cellStyle: const pw.TextStyle(fontSize: 16),
            headerStyle:
                pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
          ),
          pw.SizedBox(height: 20),
          pw.Text('Subtotal: Rp $totalPrice',
              style:
                  pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
          pw.Text('Pajak UMKM 0.5%: Rp $umkmTax',
              style:
                  pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
          pw.Text('Total: Rp ${totalPrice + umkmTax}',
              style:
                  pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
        ],
      ),
    ),
  );

  // Path ke folder Download
  final directory = Directory('/storage/emulated/0/Download');
  if (!await directory.exists()) {
    await directory.create(recursive: true); // Buat folder jika belum ada
  }
  final filePath = '${directory.path}/invoice_$invoiceNumber.pdf';
  final file = File(filePath);

  try {
    await file.writeAsBytes(await pdf.save());
    print("PDF berhasil disimpan di $filePath");
  } catch (e) {
    print("Error saving PDF: $e");
  }

  return filePath;
}

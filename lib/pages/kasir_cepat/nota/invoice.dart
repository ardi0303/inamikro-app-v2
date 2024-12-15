import 'package:flutter/material.dart';
import 'package:inamikro_app_v2/app_palette.dart';
import 'package:inamikro_app_v2/pdf/pdf_generator.dart';
import 'package:inamikro_app_v2/provider/kasir_cepat_provider.dart';
import 'package:inamikro_app_v2/widget/custom_button.dart';
import 'package:inamikro_app_v2/widget/info_row.dart';
import 'package:inamikro_app_v2/widget/item_row.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KasirCepatProvider>(
      builder: (context, cart, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              // Invoice Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoRow(
                    label: 'Invoice Number',
                    value: '#${cart.invoiceNumber}',
                    boldValue: true,
                  ),
                  const SizedBox(height: 20),
                  InfoRow(
                    label: 'Date & time',
                    value: '${cart.date}, ${cart.time}',
                    boldValue: true,
                  ),
                  const SizedBox(height: 20),
                  const InfoRow(
                    label: 'Pelanggan',
                    value: 'Name',
                    boldValue: true,
                  ),
                ],
              ),
              const SizedBox(height: 40),

              Column(
                children: cart.items.map((item) {
                  return ItemRow(
                    name: item.namaBarang,
                    price: item.hargaBarang,
                    quantity: item.quantity,
                    satuan: item.satuan!,
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              const InfoRow(
                label: 'Metode pembayaran',
                value: 'Metode',
                boldValue: true,
              ),
              const SizedBox(height: 40),

              Column(
                children: [
                  InfoRow(
                    label: 'Sub total item',
                    value: 'Rp ${cart.totalPrice}',
                    boldValue: true,
                  ),
                  const SizedBox(height: 20),
                  InfoRow(
                    label: 'Pajak UMKM 0,5%',
                    value: 'Rp ${cart.umkmTax}',
                    boldValue: true,
                  ),
                  const SizedBox(height: 40),
                  InfoRow(
                    label: 'Total',
                    value: 'Rp ${cart.totalPrice + cart.umkmTax}',
                    boldLabel: true,
                    boldValue: true,
                  ),
                ],
              ),
              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.only(bottom: 40.0, top: 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomButton(
                            label: 'Cetak',
                            color: AppPalette.white2,
                            textColor: Colors.black,
                            borderColor: AppPalette.black2.withOpacity(0.1),
                            onPressed: () {
                              generateInvoicePdf(
                                invoiceNumber: cart.invoiceNumber,
                                date: cart.date,
                                time: cart.time,
                                customerName:
                                    'Name', // Replace with dynamic customer name
                                items: cart.items
                                    .map((item) => {
                                          'name': item.namaBarang,
                                          'quantity': item.quantity,
                                          'price': item.hargaBarang,
                                        })
                                    .toList(),
                                totalPrice: cart.totalPrice,
                                umkmTax: cart.umkmTax,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: CustomButton(
                            label: 'Bagikan',
                            color: AppPalette.white2,
                            textColor: Colors.black,
                            borderColor: AppPalette.black2.withOpacity(0.1),
                            onPressed: () async {
                              final filePath = await generateInvoicePdf(
                                invoiceNumber: cart.invoiceNumber,
                                date: cart.date,
                                time: cart.time,
                                customerName:
                                    'Name', // Replace with dynamic customer name
                                items: cart.items
                                    .map((item) => {
                                          'name': item.namaBarang,
                                          'quantity': item.quantity,
                                          'price': item.hargaBarang,
                                        })
                                    .toList(),
                                totalPrice: cart.totalPrice,
                                umkmTax: cart.umkmTax,
                              );
                              print('Invoice saved at $filePath');
                              // Share the PDF file
                              Share.share(
                                filePath,
                                subject: 'Invoice #${cart.invoiceNumber}',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        label: 'Selesai',
                        color: AppPalette.red,
                        textColor: Colors.white,
                        isBold: true,
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

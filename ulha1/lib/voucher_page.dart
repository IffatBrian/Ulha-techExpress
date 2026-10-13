import 'package:flutter/material.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> vouchers = [
      {
        'title': 'Diskon 10%',
        'code': 'TECH10',
        'desc': 'Potongan harga 10% untuk semua produk',
      },
      {
        'title': 'Diskon 20%',
        'code': 'TECH20',
        'desc': 'Potongan harga 20% khusus gadget',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Voucher'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: vouchers.length,
        itemBuilder: (context, index) {
          final voucher = vouchers[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.local_offer,
                color: Colors.orange,
                size: 36,
              ),
              title: Text(
                voucher['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text('${voucher['desc']}\nKode: ${voucher['code']}'),
              isThreeLine: true,
              trailing: ElevatedButton(
                onPressed: () {
                  // Mengembalikan string voucher ke DetailGadgetPage
                  Navigator.pop(
                    context,
                    '${voucher['title']} (${voucher['code']})',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Pilih'),
              ),
            ),
          );
        },
      ),
    );
  }
}

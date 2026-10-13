import 'package:flutter/material.dart';
import 'voucher_page.dart';

class DetailGadgetPage extends StatefulWidget {
  final String name;
  final String price;
  final IconData icon;

  const DetailGadgetPage({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
  });

  @override
  State<DetailGadgetPage> createState() => _DetailGadgetPageState();
}

class _DetailGadgetPageState extends State<DetailGadgetPage> {
  String selectedVoucher = 'Belum Ada Voucher';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(widget.icon, size: 80, color: Colors.orange),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Nama: ${widget.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Harga: ${widget.price}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.confirmation_number_outlined,
                  color: Colors.orange,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Voucher Terpilih: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    selectedVoucher,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selectedVoucher == 'Belum Ada Voucher'
                          ? Colors.grey
                          : Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  // Menggunakan await untuk menunggu hasil pilihan dari VoucherPage
                  final result = await Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VoucherPage(),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      selectedVoucher = result;
                    });
                  }
                },
                icon: const Icon(Icons.card_giftcard),
                label: const Text('Klaim Kode Voucher'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

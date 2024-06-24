import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Биз жөнүндө маалымат'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '  Биздин "өсүмдүктөрдү өстүрүү" колдонмосу үйүн жашыл оазиске айлантууну каалагандар үчүн жасалган. Дени сак жана кооз гүлдөрдү жана бак-дарактарды өстүрүүгө жардам берүүчү шаймандарды жана өсүмдүктөргө кам көрүү боюнча кеңештерди сунуштайбыз. Биз менен жаратылыштан шыктанып, өстүрүү процессинен ырахат алыңыз!',
            ),
            const SizedBox(height: 40),
            const Text(
              'Биз менен байланыш:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "WhatsApp",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {
                    whatsapp();
                  },
                  child: const Text('+996 779 355 794'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> whatsapp() async {
    const contact = '+996779355794';
    const text = 'Салам';
    final iosUrl = 'https://wa.me/$contact?text=${Uri.parse(text)}';
    const webUrl = 'https://api.whatsapp.com/send/?phone=$contact&text=hi';

    try {
      if (await canLaunchUrl(Uri.parse(iosUrl))) {
        await launchUrl(Uri.parse(iosUrl));
      }
    } catch (e) {
      await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
    }
  }
}

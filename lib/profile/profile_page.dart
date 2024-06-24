import 'package:diplom/favorites/pages/favorites_page.dart';
import 'package:diplom/profile/about_us_page.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              surfaceTintColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: const BorderSide(
                  width: 1,
                  color: Colors.green,
                ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUsPage(),
                    ),
                  );
                },
                leading: const Text(''),
                title: const Text('Биз жөнүндө маалымат'),
                trailing: const Icon(
                  Icons.info_outline,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              surfaceTintColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: const BorderSide(
                  width: 1,
                  color: Colors.green,
                ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoritesPage(),
                    ),
                  );
                },
                leading: const Text(''),
                title: const Text('Тандалган өсүмдүктөр'),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              surfaceTintColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: const BorderSide(
                  width: 1,
                  color: Colors.green,
                ),
              ),
              child: ListTile(
                onTap: () {
                  Share.share('Салам', subject: 'салам');
                },
                leading: const Text(''),
                title: const Text('Бөлүшүү'),
                trailing: const Icon(
                  Icons.share,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

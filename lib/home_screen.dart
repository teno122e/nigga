import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_settings.dart';
import 'coptic_date_widget.dart';
import 'settings_drawer.dart';
import 'prayer_content.dart'; // Import the file with prayer content
import 'prayer_detail_screen.dart'; // Import the PrayerDetailScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);

    final prayers = [
      {'name': 'صلاة باكر', 'image': 'assets/morning.png'},
      {'name': 'صلاة الساعة الثالثة', 'image': 'assets/third_hour.png'},
      {'name': 'صلاة الساعة السادسة', 'image': 'assets/sixth_hour.png'},
      {'name': 'صلاة الساعة التاسعة', 'image': 'assets/ninth_hour.png'},
      {'name': 'صلاة الساعة الحادية عشر (الغروب)', 'image': 'assets/eleventh_hour.png'},
      {'name': 'صلاة الساعة الثانية عشر (النوم)', 'image': 'assets/twelfth_hour.png'},
      {'name': 'صلاة نصف الليل ', 'image': 'assets/midnight_first_service.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Agpeya'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CopticDateWidget(), // Add the CopticDateWidget here
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: prayers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    final prayerName = prayers[index]['name']!;
                    Navigator.of(context).push(
                      _createRoute(
                        prayerName,
                        prayers[index]['image']!,
                        introductoryTexts[prayerName]!,
                        agpeyaContent[prayerName]!,
                      ),
                    );
                  },
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              prayers[index]['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            prayers[index]['name']!,
                            style: TextStyle(
                              fontSize: appSettings.fontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 3.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }

  Route _createRoute(String prayerName, String prayerImage, String introText, String content) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PrayerDetailScreen(
        name: prayerName,
        image: prayerImage,
        introText: introText,
        content: content,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }
}

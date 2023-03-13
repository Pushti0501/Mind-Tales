import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mind_tales/screens/HomeScreen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/models.dart';

class QuickandEasyScreen extends StatefulWidget {
  const QuickandEasyScreen({super.key});

  @override
  State<QuickandEasyScreen> createState() => _QuickandEasyScreenState();
}

class _QuickandEasyScreenState extends State<QuickandEasyScreen> {
  List<QuickandEasy> QuickandEasylist = [
    QuickandEasy(
      title: 'Good Vibe',
      subtitle: 'Healing Meditation',
      url: 'https://open.spotify.com/track/2UXZYkbYUY64hIjK1S2m1z',
    ),
    QuickandEasy(
      title: 'Lost in Thought',
      subtitle: 'Peaceful Meditation',
      url: 'https://open.spotify.com/track/1warTb25JYDzFGmudQGvBS',
    ),
    QuickandEasy(
      title: 'Quiet Morning',
      subtitle: 'Peaceful Meditation',
      url: 'https://open.spotify.com/track/381kfIJRGnutT5xDRmzVJ5',
    ),
    QuickandEasy(
      title: 'Tranquility',
      subtitle: 'Meditation Music',
      url: 'https://open.spotify.com/track/4Iu8dJygqsDjoGMC4EyOem',
    ),
    QuickandEasy(
      title: 'Positive Thinking',
      subtitle: 'Postive Meditation Music',
      url: 'https://open.spotify.com/track/66KL79kEj6c6iOz16ub3i7',
    ),
    QuickandEasy(
      title: 'Sleeping Pills',
      subtitle: 'Relaxing Meditation',
      url: 'https://open.spotify.com/album/2OYK88BHWyMKsZ0moeRDp0',
    ),
    QuickandEasy(
      title: 'Restful Mind',
      subtitle: 'Relaxing Meditation',
      url: 'https://open.spotify.com/track/36PBzxDSXYQGd0HwQrx4vI',
    ),
    QuickandEasy(
        title: "Relax yourself",
        subtitle: "Relaxing meditation music",
        url: "https://open.spotify.com/track/6J9QAkeiCYJrQZ97aYCG6l"),
    QuickandEasy(
        title: "Earth meditaion",
        subtitle: "Meditation music",
        url: "https://open.spotify.com/track/61DdnDLTKwCQyQsfk4ZvXs"),
    QuickandEasy(
        title: "Where Mountains Reign",
        subtitle: "Mountain meditaion",
        url: "https://open.spotify.com/track/2ud8PfizwtkZ0IKrCyhZkC"),
    QuickandEasy(
        title: "Quiet Times",
        subtitle: "Slow Meditation",
        url: "https://open.spotify.com/track/0DnhhwJ9zw3xjRHGB7eo7R"),
    QuickandEasy(
        title: "Nature Walk",
        subtitle: "Meditation music",
        url: "https://open.spotify.com/album/30D4GKQhH9M54NvGCxBTKs"),
    QuickandEasy(
        title: "Meditation",
        subtitle: "Monoman",
        url: "https://open.spotify.com/track/3g5WzY6ed3Ts70ipWTpxZ0"),
    QuickandEasy(
        title: "Relaxing Meditation with Birds",
        subtitle: "Bird Meditation",
        url: "https://open.spotify.com/track/4jUsERvh75Ba1EUyQzqMnG"),
    QuickandEasy(
        title: "Ambient Meditation",
        subtitle: "Meditation music",
        url: "https://open.spotify.com/track/30F776pa6WiH5ROuVJ7eri"),
    QuickandEasy(
        title: "Om Namah Shivay",
        subtitle: "Shiv Meditation",
        url: "https://open.spotify.com/track/2lmpK3c1qHPBCffqCSe4yE"),
    QuickandEasy(
        title: "Lucid Dreaming",
        subtitle: "Meditation Music",
        url: "https://open.spotify.com/track/377augUBzuMc3feuDtd7VT"),
  ];
  _launchURL(String link) async {
    print(link);
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
      
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Quick and Easy Music",
          style: GoogleFonts.inter(
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
          itemCount: QuickandEasylist.length,
          itemBuilder: (context, index) {
            final quickandeasy = QuickandEasylist[index];
            return Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      _launchURL(quickandeasy.url);
                    },
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r)),
                      tileColor: const Color(0xFFD6E5EB),
                      leading: CircleAvatar(
                        radius: 24.r,
                        backgroundImage: const NetworkImage(
                            "https://deow9bq0xqvbj.cloudfront.net/dir-logo/698420/698420_300x300.jpg"),
                      ),
                      title: Text(quickandeasy.title),
                      subtitle: Text(quickandeasy.subtitle),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  )
                ],
              ),
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

import '../models/models.dart';

class PodcastScreen extends StatefulWidget {
  const PodcastScreen({super.key});

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  List<PodcastModel> podcasts = [
    PodcastModel(
        title: "Acceptance",
        img:
            'https://cdn.pixabay.com/photo/2021/02/16/21/48/woman-6022486_960_720.jpg',
        host: "Sang Chang",
        url: "https://open.spotify.com/episode/66srwGKH7RFxcgchfUSRCd"),
    PodcastModel(
        title: "Find Positivity",
        img:
            "https://cdn.pixabay.com/photo/2017/11/26/15/16/smiley-2979107_960_720.jpg",
        host: "Sang Chang",
        url: "https://open.spotify.com/episode/48wIVwoun1ibzK6izg6ZeT"),
    PodcastModel(
        title: "Calming Anxiety",
        img:
            "https://images.wallpaperscraft.com/image/single/keep_calm_calm_motivation_145723_1600x1200.jpg",
        host: "Martin Hewlett",
        url: "https://open.spotify.com/show/2BLdPSFfzWaYKiXYV0Nqvo"),
    PodcastModel(
        title: "Find Happiness",
        img:
            "https://c4.wallpaperflare.com/wallpaper/346/742/395/photography-children-happy-wallpaper-preview.jpg",
        host: "Sang Chang",
        url: "https://open.spotify.com/episode/6ggpduuTMO7Yn9LKFcoGtH"),
    PodcastModel(
        title: "Panic & Anxiety Relief",
        img:
            "https://images.unsplash.com/photo-1607827448452-6fda561309d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1153&q=80",
        host: "Aida Beco",
        url: "https://open.spotify.com/show/6kGIumtSZxFsKOqU1wr9R5"),
    PodcastModel(
        title: "Eat Right Sleep Less",
        img:
            "https://images.unsplash.com/photo-1531353826977-0941b4779a1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        host: "Sadhguru",
        url: "https://open.spotify.com/episode/1eyZ4nL2HriC9Q6huEzO5L"),
    PodcastModel(
        title: "Forgivness",
        img:
            "https://images.unsplash.com/photo-1638866412154-71a64b5e46c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80",
        host: "Sang Chang",
        url: "https://open.spotify.com/episode/2brsZJwS2A3eEfdnm0GHJ6"),
    PodcastModel(
        title: "Soothing Sleep",
        img:
            "https://images.unsplash.com/photo-1520206183501-b80df61043c2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
        host: "Matt Ridenour",
        url: "https://open.spotify.com/episode/3A0J7cpp8weHdws67hdHME"),
    PodcastModel(
        title: "Be Good",
        img:
            "https://wallpapers.com/images/hd/wallpaper-words-inscription-good-wall-stripes-rer21roa4dlxsc3a.webp",
        host: "Sang Chang",
        url: "https://open.spotify.com/episode/4k573c4bUWnTHVy17HJ5xv"),
    PodcastModel(
        title: "Live your Life",
        img:
            "https://images.unsplash.com/photo-1445307806294-bff7f67ff225?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80",
        host: "Aditi Surana",
        url: "https://open.spotify.com/episode/2WDnYVZrHqejMeZYyRS7Vp"),
    PodcastModel(
        title: "Your Time",
        img:
            "https://images.unsplash.com/photo-1495704907664-81f74a7efd9b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        host: "Guided Meditations Podcastification",
        url: "https://open.spotify.com/track/6LFnijghQGljKIdpzSRcC9"),
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
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Podcast",
            style: GoogleFonts.inter(
                fontSize: 20.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: podcasts.length,
            itemBuilder: (BuildContext context, int index) {
              final podcast = podcasts[index];
              return Container(
                height: 64.h,
                width: 360.w,
                child: Row(
                  children: [
                    Container(
                      height: 56.h,
                      width: 56.w,
                      child: Image.network(podcast.img),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            podcast.title,
                            style: GoogleFonts.inter(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            podcast.host,
                            style: GoogleFonts.inter(
                                fontSize: 12.sp, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        _launchURL(podcast.url);
                      },
                      child: SvgPicture.asset("images/icons/Play.svg",
                          width: 35.w, height: 35.h),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}

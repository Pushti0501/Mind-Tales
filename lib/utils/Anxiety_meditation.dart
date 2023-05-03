import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_tales/models/models.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/uri_controller.dart';

class Anxiety extends StatefulWidget {
  const Anxiety({super.key});

  @override
  State<Anxiety> createState() => _AnxietyState();
}

class _AnxietyState extends State<Anxiety> {
  List<Anxietymodel> anxiety = [
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/6wl4j4gd2WI/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBNTSMlfGa1UBprNkt-rGWndA484w",
        url: "https://www.youtube.com/watch?v=6wl4j4gd2WI"),
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/xShv7mMmfW4/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAbWiBb1MmJOXrnuzlzQfekO-eojQ",
        url: "https://www.youtube.com/watch?v=xShv7mMmfW4"),
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/Ivbkx4GUzAY/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLC-cZvLNALNRgUEJryA6RdbnIJwpA",
        url: "https://www.youtube.com/watch?v=Ivbkx4GUzAY"),
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/pU80BEm43JM/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCGiuI3C9opo7s4dEDTg4ApEhjflA",
        url: "https://www.youtube.com/watch?v=pU80BEm43JM"),
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/w4tlGeSrcNw/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLA1wlazLtA9_tBu_txJkZg9lQOQEA",
        url: "https://www.youtube.com/watch?v=w4tlGeSrcNw"),
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/pxWOpGm4d7U/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAh_iBttjrScMm5Z7wVEsY1SiAWpg",
        url: "https://www.youtube.com/watch?v=pxWOpGm4d7U"),
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/9PxE3Fy68Ao/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDP0WaDWozIRz9sq498exSEdA8fYw",
        url: "https://www.youtube.com/watch?v=9PxE3Fy68Ao"),
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/cfVPQWprfjY/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLA6GcvoFmOv3bY_156bkIxqqykqEQ",
        url: "https://www.youtube.com/watch?v=cfVPQWprfjY"),
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/vIQjYiQFhQw/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDENsrRaKlTf1aiAYHMBumDwtd7iw",
        url: "https://www.youtube.com/watch?v=vIQjYiQFhQw"),
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/4pLUleLdwY4/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBOBPmgOVxAaaCMs4fTlo0eUaU7Aw",
        url: "https://www.youtube.com/watch?v=4pLUleLdwY4"),
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/lRSB4n3wxCA/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBTW2OhEqh2wEEkrF1bYXpV_a24bA",
        url: "https://www.youtube.com/watch?v=lRSB4n3wxCA"),
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/1dbYduxIpwE/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCYlf901wYP_RVhBZFaKnrlh32FIg",
        url: "https://www.youtube.com/watch?v=1dbYduxIpwE"),
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/gvlKzSusC9o/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBFbBBUjccNewpzG1qrKdWhNoeQNQ",
        url: "https://www.youtube.com/watch?v=gvlKzSusC9o"),
    Anxietymodel(
        imgurl:
            "https://i.ytimg.com/vi/_19sQY5pna8/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAthJ5lfXxoOsX5-UDX5im4g4dSCA",
        url: "https://www.youtube.com/watch?v=_19sQY5pna8"),
  ];
  // _launchURL(String link) async {
  //   print(link);
  //   final uri = Uri.parse(link);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri);
  //   } else {
  //     throw 'Could not launch $uri';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<Launch>(
      
      builder: (context, value, child) { 
        return SizedBox(
        height: 143.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: anxiety.length,
            itemBuilder: (context, index) {
              final anxiety_mediatation = anxiety[index];
    
              return Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Stack(alignment: Alignment.center, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(anxiety_mediatation.imgurl,
                        height: 147.h, width: 143.w, fit: BoxFit.fill),
                  ),
                  InkWell(
                    onTap: () {
                  Provider.of<Launch>(context,listen:false).launchURL(anxiety_mediatation.url);
                    },
                    child: SvgPicture.asset("images/icons/Play.svg",
                        width: 35.w, height: 35.h),
                  ),
                ]),
              );
            }),
      ); },
    
    );
  }
}

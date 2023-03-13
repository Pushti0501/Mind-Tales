class Articlemodel{
  final String title;
  final String subtitle;
  final String imgurl;
  final String url;
  Articlemodel({required this.title,required this.subtitle,required this.imgurl,required this.url});
}
class Anxietymodel{
  late final String imgurl;
  late final String url;
  Anxietymodel({required this.imgurl,required this.url});
}
class Consultant{
   late final String name;
  late final String department;
  late final String experience;
  late final String urlavatar;
  late final String rating;
  late final int fees;
  late final String availablity;
  Consultant(
      {required this.name,
      required this.department,
      required this.experience,
      required this.urlavatar,
      required this.rating,
      required this.fees,
      required this.availablity});
}
class PodcastModel{
  late final String title;
  late final String img;
  late final String host;
  late final String url;
  PodcastModel({required this.title,required this.img,required this.host,required this.url});
}
class QuickandEasy{
  final String title;
 final String subtitle;

 final String url;
  QuickandEasy({required this.title,required this.subtitle,required this.url});
}
class YogaModel{
  late final String img;
  late final String url;
  late final String description;
  YogaModel({required this.img,required this.url,required this.description});
}
class Mood{
  late final String url;
   bool isSelect;
  Mood({required this.url,required this.isSelect});

}
class SleepbetterModel{
 
  late final String imgurl;
  late final String url;
  SleepbetterModel({required this.imgurl,required this.url});
}
class RecommendationsModel{
final String title;
final String imgurl;
final String subtitle;
final String url;

RecommendationsModel({required this.title,required this.imgurl,required this.subtitle,required this.url});
}
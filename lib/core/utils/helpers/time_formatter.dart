import 'package:timeago/timeago.dart' as timeago;

String getPostTimeFormatted(String postTimeAndDate) {
  var currentTime = DateTime.now();
  var postTime = DateTime.parse(postTimeAndDate);
  var date = currentTime.toString().split(" ")[0].replaceAll("-", "");
  var postDate = postTime.toString().split(" ")[0].replaceAll("-", "");

  print("postDate =>> $postDate , postTime =>> $postTime");

  var finalTime = currentTime.subtract(Duration(
    days: int.parse(date) - int.parse(postDate),
    hours: int.parse(currentTime.toString().split(" ")[1].split(":")[0]) -
        int.parse(postTime.toString().split(" ")[1].split(":")[0]),
    minutes: int.parse(currentTime.toString().split(" ")[1].split(":")[1]) -
        int.parse(postTime.toString().split(" ")[1].split(":")[1]),
  ));
  // print("finalTime =>> ${timeago.format(finalTime)}");

  return timeago.format(finalTime);
}

import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String getUserID(int numberOfItems) {
  int uid = numberOfItems + 1;
  String paddedUid = uid.toString().padLeft(8, '0');
  return paddedUid;
}

int getStringLength(String str) {
  return str.length;
}

bool isUsernameCharValid(String str) {
  final specialChars = RegExp(r'[^a-zA-Z0-9_.]');
  return specialChars.hasMatch(str);
}

bool checkBirthday(DateTime dob) {
  DateTime currentDate = DateTime.now();
  Duration ageDifference = currentDate.difference(dob);
  int years = (ageDifference.inDays / 365).floor();

  return years >= 13;
}

String usernameStripper(String input) {
  String pattern = r'[^A-Za-z0-9_.]';
  RegExp regExp = RegExp(pattern);
  String strippedString = input.replaceAll(regExp, '');
  strippedString = strippedString.toLowerCase();

  if (strippedString.length <= 15) {
    return strippedString;
  } else {
    return strippedString.substring(0, 15);
  }
}

String stringClipper(
  String input,
  int start,
  int stop,
) {
  return input.substring(start, stop);

  if (input.length <= stop - start) {
    return input;
  } else {
    return input.substring(start, stop);
  }
}

String listToString(List<String> stringList) {
  return stringList.join(' ');
}

bool checkLink(String link) {
  Uri uri;

  try {
    uri = Uri.parse(link);
  } catch (e) {
    return false; // Invalid link
  }

  return uri.scheme == 'https';
}

bool stringInArr(
  String text,
  List<String> arr,
) {
  if (arr.contains(text)) {
    return true;
  } else {
    return false;
  }
}

double pollDivider(
  int number1,
  int total,
) {
  if (number1 / (total) < 0.01) {
    return 0;
  }
  return number1 / (total);
}

String? percentFinder(
  int total,
  int number,
) {
  if (total == 0) {
    return 'N/A';
  }

  double quotient = number / total;
  double percentage = quotient * 100;
  double roundedPercentage = double.parse(percentage.toStringAsFixed(1));
  if (roundedPercentage < 0.01) {
    return '0%';
  } else {
    return '$roundedPercentage%';
  }
}

String cutURL(String input) {
  final urlPattern = RegExp(
      r'(https?://)?(www\.)?([a-zA-Z0-9]+([\-\.]{1}[a-zA-Z0-9]+)*\.[a-zA-Z]{2,5}([:0-9]{1,5})?(/.*)?)',
      caseSensitive: false);

  // Search for the first URL in the input string
  final match = urlPattern.firstMatch(input);

  if (match == null) {
    // No URL found, return an empty string
    return '';
  }

  // Extract the matched URL from the input
  final url = match.group(0);

  // Cut the matched URL from the input
  final cutInput = input.replaceFirst(url!, '');

  // Return the matched URL
  return url;
}

String threadTextStripper(String input) {
  // Regex pattern to match a URL
  final urlPattern = RegExp(
      r'(https?://)?(www\.)?([a-zA-Z0-9]+([\-\.]{1}[a-zA-Z0-9]+)*\.[a-zA-Z]{2,5}([:0-9]{1,5})?(/.*)?)',
      caseSensitive: false);

  // Replace all URLs in the input string with an empty string
  final removedUrlsInput = input.replaceAll(urlPattern, '');

  var arr = removedUrlsInput.split(" ");
  var result = "";
  for (String i in arr) {
    if (!i.contains("#")) {
      result = result + " " + i;
    }
  }

  // Return the input string with URLs and hashtags removed
  return result.trim();
}

List<String> extractHashtags(String input) {
  List<String> hashtags = [];
  RegExp regex = RegExp(r'\#\w+');
  Iterable<Match> matches = regex.allMatches(input);

  for (Match match in matches) {
    String hashtag = match.group(0) as String;
    hashtags.add(hashtag);
  }

  return hashtags;
}

int stringToInt(String inputString) {
// Iterate over each character in the input string
  for (var char in inputString.runes) {
    // Check if the character is a digit
    if (char >= 48 && char <= 57) {
      // Convert the character code to a string and parse it as an integer
      return int.parse(String.fromCharCode(char));
    }
  }

  // No number found, return -2
  return -2;
}

String substringerGPT(String str) {
  // Remove any occurrences of newline characters
  str = str.replaceAll(r'\n\n', '').replaceAll(r'\n', '');

  // Remove first and last character if it is a quote
  if (str.isNotEmpty) {
    if (str[0] == '"' || str[0] == "'") {
      str = str.substring(1);
    }
    if (str.isNotEmpty &&
        (str[str.length - 1] == '"' || str[str.length - 1] == "'")) {
      str = str.substring(0, str.length - 1);
    }
  }

  return str;
}

double heightIncrementer(
  String string,
  int initialNum,
  double increment,
) {
  int numChars = string.length;
  int numIncrements = (numChars / 40).ceil();
  return initialNum + (numIncrements * increment);
}

String? decideWhoToLoad(
  String? userIDparamIN,
  String? currentuserIDIN,
) {
  if (userIDparamIN == "0") {
    return currentuserIDIN;
  } else {
    return userIDparamIN;
  }
}

String getFirstletter(String str) {
  return str.substring(0, 1);
}

int sum(
  int number1,
  int number2,
) {
  return number1 + number2;
}

String nameClipper(String name) {
  if (name.length <= 25) {
    return name;
  } else {
    return name.substring(0, 25);
  }
}

List<ChatsRecord> decideChatstoLoad(
  List<ChatsRecord> allchats,
  DocumentReference userloggedin,
) {
  List<ChatsRecord> rtrn = [];

  for (ChatsRecord chat in allchats) {
    if (chat.userA == userloggedin || chat.userB == userloggedin) {
      rtrn.add(chat);
    }
  }
  return rtrn;
}

int detwhichchatuser(
  DocumentReference userloggedin,
  ChatsRecord chat,
) {
  if (chat.userA == userloggedin) {
    return 1;
  } else {
    return 2;
  }
}

ChatsRecord? findpreexistingchatifpossible(
  List<ChatsRecord> allchats,
  DocumentReference userloggedin,
  DocumentReference usertobemsged,
) {
  for (ChatsRecord chat in allchats) {
    if ((chat.userA == userloggedin && chat.userB == usertobemsged) ||
        (chat.userA == usertobemsged && chat.userB == usertobemsged)) {
      return chat;
    }
  }
}

List<String> appendlists(
  List<String> list1,
  List<String> list2,
) {
  list1.addAll(list2);
  return list1;
}

String arrtostr(List<String> array) {
  return array.toString();
}

List<String> emptylist() {
  return [];
}

String randomImage(
  String str1,
  String str2,
  String str3,
  String str4,
) {
  int randomNumber = math.Random().nextInt(4);
  List<String> urls = [str1, str2, str3, str4];

  return urls[randomNumber];
}

int identifySocialMediaPlatform(String link) {
  if (link.contains('twitter.com') ||
      link.contains('t.co') ||
      link.contains('x.com')) {
    if (link.contains("reddit.com")) {
      return -1;
    } else {
      return 10; // Twitter
    }
  } else if (link.contains('instagram.com')) {
    return 1; // Instagram
  } else if (link.contains('facebook.com')) {
    return 2; // Facebook
  } else if (link.contains('youtube.com') || link.contains('youtu.be')) {
    return 3; // YouTube
  } else if (link.contains('tiktok.com')) {
    return 4; // TikTok
  } else if (link.contains('gettr.com')) {
    return 5; // Gettr
  } else if (link.contains('linkedin.com')) {
    return 7; // LinkedIn
  } else if (link.contains('rumble.com')) {
    return 8; // Rumble
  } else if (link.contains('reddit.com')) {
    return -1; // Reddit
  } else {
    return -1; // Unrecognized or other platform
  }
}

String errorFixer(
  String errorstr,
  UsersRecord user,
) {
  return " ";
}

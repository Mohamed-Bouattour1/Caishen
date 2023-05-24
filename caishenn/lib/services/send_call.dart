import 'package:url_launcher/url_launcher.dart';

Future<void> call(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
  Future<void> send_mail(String mail) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: mail,
    );
    await launchUrl(launchUri);
  }
  Future<void> open_url(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
  Future<void> open_maps(gurl,aurl) async {
    if (await canLaunchUrl(gurl))
    {
      await launchUrl(gurl);
    }
    if (await canLaunchUrl(aurl)) {
      await launchUrl(aurl);
    } else {
      throw "Could not Launch";
    }
  }



import 'package:url_launcher/url_launcher.dart';

const String getStartedFormUrl = 'https://forms.gle/cK8VG6s3TUKPmagb9';

Future<void> openGetStartedForm() async {
  final uri = Uri.parse(getStartedFormUrl);
  final opened = await launchUrl(
    uri,
    mode: LaunchMode.platformDefault,
    webOnlyWindowName: '_blank',
  );

  if (!opened) {
    await launchUrl(uri, webOnlyWindowName: '_self');
  }
}

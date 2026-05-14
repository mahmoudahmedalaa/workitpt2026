import 'package:webview_flutter/webview_flutter.dart';
import 'package:workitpt/core/export.dart';

import '../../../../core/widgets/base_view.dart';

@RoutePage()
class TermsWebView extends StatelessWidget {
  final String url;
  TermsWebView({super.key, required this.url});

  final WebViewController controller = WebViewController();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      color: Colors.white,
      titleText: '',
      appBarColor: Colors.white,
      padding: EdgeInsets.zero,
      elevation: 0,
      body: WebViewWidget(
        controller: controller
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..loadRequest(
            Uri.parse(url),
          ),
      ),
    );
  }
}

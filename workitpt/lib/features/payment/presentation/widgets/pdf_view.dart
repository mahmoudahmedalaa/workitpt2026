import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:workitpt/core/export.dart';
import 'package:workitpt/core/widgets/base_view.dart';

@RoutePage()
class AppPDFView extends StatelessWidget {
  final String path;
  const AppPDFView({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      titleText: '',
      appBarColor: Colors.white,
      elevation: 0,
      body: PDFView(
        filePath: path,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        // onRender: (_pages) {
        //   setState(() {
        //     pages = _pages;
        //     isReady = true;
        //   });
        // },
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        // onViewCreated: (PDFViewController pdfViewController) {
        //   _controller.complete(pdfViewController);
        // },
        // onPageChanged: (int page, int total) {
        //   print('page change: $page/$total');
        // },
      ),
    );
  }
}

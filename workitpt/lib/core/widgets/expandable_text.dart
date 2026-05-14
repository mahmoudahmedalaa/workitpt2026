// ignore_for_file: cascade_invocations

import 'package:flutter/gestures.dart';

import '../../config/typography.dart';
import '../constants/app_colors.dart';
import '../export.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;
  const ExpandableText(
      {super.key, required this.text, required this.trimLines});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    final link = TextSpan(
      text: _readMore ? '... ' : '',
      children: [
        TextSpan(
            text: _readMore ? 'Read more' : ' Read less',
            style: AppTextStyle.bodyMDSemiBold.copyWith(color: colorPrimary),
            recognizer: TapGestureRecognizer()..onTap = _onTapLink)
      ],
    );
    final Widget result = LayoutBuilder(
      builder: (context, constraints) {
        assert(constraints.hasBoundedWidth, '');
        final maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
        );
        // Layout and measure link
        final textPainter = TextPainter(
          text: link,
          textDirection: TextDirection
              .rtl, //better to pass this from master widget if ltr and rtl both supported
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        // Get the endIndex of data
        int? endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset);
        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text.substring(0, endIndex) : widget.text,
            style: AppTextStyle.bodyMDRegular.copyWith(
              color: const Color(0xFF444444),
              letterSpacing: 0.28,
            ),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
            style: AppTextStyle.bodyMDRegular.copyWith(
              color: const Color(0xFF444444),
              letterSpacing: 0.28,
            ),
          );
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}

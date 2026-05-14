import 'package:flutter/material.dart';

import '../../../../core/widgets/colum_with_padding.dart';
import '../../../../core/widgets/shimmer_container.dart';
import '../../../../core/widgets/shimmer_instance.dart';

class ChatUserListShimmerView extends StatelessWidget {
  const ChatUserListShimmerView({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        children: List.generate(
            10,
            (index) => const Padding(
                  padding: EdgeInsets.all(8),
                  child: ShimmerInstanceWidget(
                    child: ColumnEachChildPadding(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      padding: EdgeInsets.only(bottom: 06),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShimmerContainer(
                              height: 10,
                              width: 100,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShimmerContainer(
                              height: 10,
                              width: 100,
                            ),
                            ShimmerContainer(
                              height: 10,
                              width: 100,
                            ),
                          ],
                        ),
                        ShimmerContainer(
                          height: 20,
                          width: 200,
                        ),
                        Divider()
                      ],
                    ),
                  ),
                )).toList(),
      );
}

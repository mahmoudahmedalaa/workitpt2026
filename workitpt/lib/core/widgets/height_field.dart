// import 'package:workitpt/core/constants/app_colors.dart';

// import '../export.dart';
// import 'app_text_field.dart';

// class HeightField extends StatefulWidget {
//   final TextEditingController heightController;
//   const HeightField({super.key, required this.heightController});

//   @override
//   State<HeightField> createState() => _HeightFieldState();
// }

// class _HeightFieldState extends State<HeightField> {
//   String heightUnit = 'ft';

//   int _currentValue = 0;

//   getMinValue() {
//     if (heightUnit == 'ft') {
//       return '';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         AppTextField(
//           controller: widget.heightController,
//           labelText: 'Height (Optional)',
//           hintText: 'Enter Height',
//           prefixIcon: Assets.icons.height.path,
//           textColor: colorPrimary,
//           textInputType: TextInputType.number,
//         ).flexible(),
//         DropdownButton<String>(
//           isExpanded: false,
//           isDense: true,
//           value: heightUnit,
//           style: TextStyle(fontSize: 14, color: darkText),
//           icon: Icon(
//             Icons.keyboard_arrow_down_rounded,
//             color: darkText,
//           ),
//           underline: SizedBox(),
//           onChanged: (val) {
//             setState(() {
//               heightUnit = val!;
//             });
//           },
//           items: ['ft', 'cm']
//               .map((e) => DropdownMenuItem<String>(
//                     child: Text(e),
//                     value: e,
//                   ))
//               .toList(),
//         ),
//       ],
//     );

//     // return Column(
//     //   children: [
//     //     Row(
//     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //       children: [
//     //         Row(
//     //           children: [
//     //             Image.asset(
//     //               Assets.icons.height.path,
//     //               height: 24,
//     //               width: 24,
//     //             ),
//     //             horizontalMargin8,
//     //             Text('Height(Optional)'),
//     //           ],
//     //         ).padding(horizontal: 12),
//     //         DropdownButton<String>(
//     //           isExpanded: false,
//     //           isDense: true,
//     //           value: heightUnit,
//     //           style: TextStyle(fontSize: 14, color: darkText),
//     //           icon: Icon(
//     //             Icons.keyboard_arrow_down_rounded,
//     //             color: darkText,
//     //           ),
//     //           underline: SizedBox(),
//     //           onChanged: (val) {
//     //             setState(() {
//     //               heightUnit = val!;
//     //             });
//     //           },
//     //           items: ['ft', 'cm']
//     //               .map((e) => DropdownMenuItem<String>(
//     //                     child: Text(e),
//     //                     value: e,
//     //                   ))
//     //               .toList(),
//     //         ),
//     //       ],
//     //     ),
//     //     NumberPicker(
//     //       value: _currentValue,
//     //       minValue: 0,
//     //       maxValue: 100,
//     //       step: 1,
//     //       itemHeight: 80,
//     //       itemWidth: 80,
//     //       axis: Axis.horizontal,
//     //       onChanged: (value) => setState(() => _currentValue = value),
//     //       decoration: BoxDecoration(
//     //         borderRadius: BorderRadius.circular(16),
//     //         border: Border.all(color: Colors.black26),
//     //       ),
//     //     ).padding(vertical: 16),
//     //   ],
//     // );
//   }
// }

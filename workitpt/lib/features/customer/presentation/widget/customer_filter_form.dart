import 'package:workitpt/features/customer/data/model/customer_filter_model.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/widgets/app_button.dart';

class CustomerFilterItemModel {
  String title;
  bool isSelected;
  int value;
  String titleValue;

  CustomerFilterItemModel(
      {required this.isSelected,
      required this.title,
      required this.value,
      required this.titleValue});
}

class CustomerFilterForm extends StatefulWidget {
  final int? selectedIndex;

  const CustomerFilterForm({super.key, this.selectedIndex});

  @override
  State<CustomerFilterForm> createState() => _CustomerFilterFormState();
}

class _CustomerFilterFormState extends State<CustomerFilterForm> {
  final List<CustomerFilterItemModel> filterList = [
    CustomerFilterItemModel(
      isSelected: false,
      title: 'Sort By A to Z',
      value: 1,
      titleValue: 'sort',
    ),
    CustomerFilterItemModel(
      isSelected: false,
      title: 'Sort By Z to A',
      value: -1,
      titleValue: 'sort',
    ),
    CustomerFilterItemModel(
      isSelected: false,
      title: 'Sort By Price (High to Low)',
      value: -1,
      titleValue: 'price',
    ),
    CustomerFilterItemModel(
      isSelected: false,
      title: 'Sort By Price (Low to High)',
      value: 1,
      titleValue: 'price',
    ),
  ];

  final decoration = const InputDecoration(
    fillColor: Color.fromRGBO(0, 0, 0, 0),
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: darkText)),
    filled: true,
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: colorPrimary)),
  );

  _setIntialValue() {
    if (widget.selectedIndex != null) {
      setState(() {
        filterList[widget.selectedIndex!].isSelected = true;
      });
    }
  }

  @override
  void initState() {
    _setIntialValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .9),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            verticalMargin24,
            Text(
              'Search Filter',
              style: AppTextStyle.subHeadLgSemiBold,
            ),
            Container(
              decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 200,
              height: 4,
            ),
            // verticalMargin24,
            Flexible(
              child: ListView.builder(
                itemCount: filterList.length,
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: RadioListTile(
                    dense: true,
                    visualDensity: VisualDensity.standard,
                    value: true,
                    groupValue: filterList[index].isSelected,
                    onChanged: (value) {
                      for (final element in filterList) {
                        element.isSelected = false;
                      }
                      setState(() {
                        filterList[index].isSelected = value!;
                      });
                    },
                    activeColor: colorPrimary,
                    selectedTileColor: darkText,
                    title: Text(
                      filterList[index].title,
                      style: AppTextStyle.bodySMSemiBold,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: AppButton(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    buttonText: 'Cancel',
                    textColor: blackText,
                    suffixWidget: const SizedBox(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Flexible(
                  child: AppButton(
                    buttonText: 'Filter',
                    onPressed: () {
                      final value = filterList.firstWhere(
                          (element) => element.isSelected,
                          orElse: () => CustomerFilterItemModel(
                              isSelected: false,
                              title: 'title',
                              value: 1,
                              titleValue: ''));
                      if (value.isSelected) {
                        Navigator.pop(
                            context,
                            CustomerFilterModel(
                              sort: value.titleValue == 'sort'
                                  ? value.value
                                  : null,
                              price: value.titleValue == 'price'
                                  ? value.value
                                  : null,
                            ));
                      } else {
                        EasyLoading.showInfo('Please select filters');
                      }
                    },
                    suffixWidget: const SizedBox(),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}

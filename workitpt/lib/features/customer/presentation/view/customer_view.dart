import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/core/injection/injection.dart';
import 'package:workitpt/features/customer/presentation/bloc/customer_bloc.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/export.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/base_view.dart';
import '../../../sessions/presentation/widgets/search_filter_widget.dart';
import '../../data/model/customer_filter_model.dart';
import '../widget/customer_card.dart';
import '../widget/customer_filter_form.dart';

@RoutePage()
class CustomerView extends StatefulWidget {
  const CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  final searchController = TextEditingController();

  CustomerBloc customerBloc = getIt<CustomerBloc>();

  CustomerFilterModel? filterModel;
  List<String> filterList = [];
  int? selectedIndex;

  @override
  void initState() {
    customerBloc.add(CustomerEvent.getCustomerList());
    super.initState();
  }

  _setIndex(int val) {
    setState(() {
      selectedIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => customerBloc,
        child: BaseView(
          titleText: 'Customers',
          padding: EdgeInsets.zero,
          automaticallyImplyiLeading: false,
          elevation: 0,
          appBarColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchFilterWidget(
                title: 'Search Customers',
                controller: searchController,
                isPrevious: true,
                onSearch: (val) {
                  setState(() {
                    filterModel = CustomerFilterModel(search: val);
                  });
                  customerBloc
                      .add(CustomerEvent.getCustomerList(filter: filterModel));
                },
                onReset: () {
                  customerBloc.add(CustomerEvent.getCustomerList());
                },
                onFilterPressed: () async {
                  final filterItems = await SideSheet.right(
                    barrierDismissible: true,
                    body: CustomerFilterForm(
                      selectedIndex: selectedIndex,
                    ),
                    width: 90.w,
                    context: context,
                  );
                  if (filterItems != null && filterItems != '') {
                    filterModel = filterItems as CustomerFilterModel;
                    if (filterItems.sort != null || filterItems.price != null) {
                      filterList = [];
                      if (filterItems.sort == 1) {
                        filterList.add('Sorted By A to Z');
                        _setIndex(0);
                      }
                      if (filterItems.sort == -1) {
                        filterList.add('Sorted By Z to A');
                        _setIndex(1);
                      }
                      if (filterItems.price == -1) {
                        filterList.add('Sorted By Price (High to Low)');
                        _setIndex(2);
                      }
                      if (filterItems.price == 1) {
                        filterList.add('Sorted By Price (Low to High)');
                        _setIndex(3);
                      }
                      setState(() {});
                      customerBloc.add(
                          CustomerEvent.getCustomerList(filter: filterModel));
                    }
                  }
                },
              ).padding(all: 16),
              if (filterList.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter By',
                      style: AppTextStyle.tinySMRegular,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          filterList = [];
                          filterModel = CustomerFilterModel();
                          selectedIndex = null;
                          customerBloc
                              .add(const CustomerEvent.getCustomerList());
                        });
                      },
                      child: Text(
                        'Clear Filter',
                        style: AppTextStyle.tinySMMedium
                            .copyWith(color: colorPrimary),
                      ),
                    ),
                  ],
                ).padding(horizontal: 16),
              if (filterList.isNotEmpty)
                Wrap(
                  children: List<Widget>.generate(
                    filterList.length,
                    (index) {
                      final chips = filterList[index];
                      return Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.5.w, horizontal: 2.w),
                        margin: const EdgeInsets.only(right: 6, top: 8),
                        decoration: BoxDecoration(
                          color: lightPrimary,
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        child: Text(
                          chips,
                          style: AppTextStyle.tinySMRegular
                              .copyWith(color: colorPrimary),
                        ),
                      );
                    },
                  ).toList(),
                ).padding(bottom: 16, horizontal: 16),
              BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => SizedBox(),
                    onFailure: (msg) {
                      EasyLoading.showError(msg!);
                      return SizedBox();
                    },
                    onLoading: () {
                      EasyLoading.show();
                      return SizedBox();
                    },
                    onGetCustomerListSuccess: (model) {
                      EasyLoading.dismiss();
                      return model.isEmpty
                          ? Center(
                              child: Text(
                              'No Customers found!',
                              style: AppTextStyle.bodyLgRegular
                                  .copyWith(color: colorLightGrey),
                            ))
                          : ListView.builder(
                              itemCount: model.length,
                              itemBuilder: (context, index) => CustomerCard(
                                model: model[index],
                                onPressed: () => context.router.push(
                                  CustomerDetailRoute(model: model[index]),
                                ),
                              ),
                            );
                    },
                  );
                },
              ).expanded(),
            ],
          ),
        ),
      );
}

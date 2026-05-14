import 'package:side_sheet/side_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../data/models/session_filter_model.dart';
import '../bloc/session_bloc.dart';
import '../widgets/filter_icon_button.dart';

class SearchFilterWidget extends StatefulWidget {
  final bool isPrevious;
  final bool isUser;
  final TextEditingController controller;
  final VoidCallback? onFilterPressed;
  final VoidCallback? onReset;
  final Function(String)? onSearch;
  final SessionBloc? sessionBloc;
  final String title;

  const SearchFilterWidget({
    super.key,
    required this.controller,
    this.sessionBloc,
    this.isPrevious = false,
    this.onFilterPressed,
    this.isUser = false,
    this.title = 'Search Sessions',
    this.onSearch,
    this.onReset,
  });

  @override
  State<SearchFilterWidget> createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends State<SearchFilterWidget> {
  List<String> filterList = [];
  SessionFilterModel model = SessionFilterModel();

  void _getSessions() {
    if (widget.isPrevious) {
      widget.sessionBloc!.add(const SessionEvent.getPreviousSession());
    } else {
      widget.sessionBloc!.add(SessionEvent.getUpcomingSession(filter: model));
    }
  }

  void _handleSearch({required String value}) {
    setState(() {
      model.search = value;
    });
    if (widget.isPrevious) {
      if (model.search != '')
        widget.sessionBloc!.add(SessionEvent.getPreviousSession(filter: model));
    } else {
      if (model.search != '') {
        widget.sessionBloc!.add(SessionEvent.getUpcomingSession(filter: model));
      }
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  bottomMargin: 0,
                  isDense: true,
                  controller: widget.controller,
                  onChanged: (value) {
                    setState(() {});
                  },
                  onSend: (val) {
                    if (widget.onSearch != null)
                      widget.onSearch!(val);
                    else
                      _handleSearch(value: val);
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: darkText,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    suffixIcon: widget.controller.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                widget.controller.text = '';
                              });
                              if (widget.onReset != null)
                                widget.onReset!();
                              else
                                _getSessions();
                            },
                            icon: Icon(
                              Icons.clear,
                              color: Colors.black,
                            ))
                        : IconButton(
                            onPressed: null,
                            icon: const Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: darkText,
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    hintText: widget.title,
                    hintStyle: const TextStyle(fontSize: 14, color: darkText),
                  ),
                ),
              ),
              horizontalMargin8,
              FilterIconButton(
                icon: Assets.images.filter.path,
                onPressed: widget.onFilterPressed ??
                    () async {
                      final filterItems = (await SideSheet.right(
                          barrierDismissible: true,
                          body: FilterForm(
                            model: model,
                            isUser: widget.isUser,
                          ),
                          width: 90.w,
                          context: context));
                      if (filterItems != null && filterItems != '') {
                        model = filterItems as SessionFilterModel;
                        if (filterItems.session != null ||
                            filterItems.booked != null ||
                            filterItems.difficult != null ||
                            filterItems.sessionType != null ||
                            filterItems.workoutLocation != null ||
                            filterItems.minPrice != null ||
                            filterItems.maxPrice != null) {
                          filterList = [];
                          if (filterItems.session!.isNotEmpty) {
                            filterList.addAll(filterItems.session!);
                          }
                          if (filterItems.workoutLocation!.isNotEmpty) {
                            filterList.addAll(filterItems.workoutLocation!);
                          }
                          if (filterItems.sessionType!.isNotEmpty) {
                            filterList.add(filterItems.sessionType!);
                          }
                          if (filterItems.difficult!.isNotEmpty) {
                            filterList.add(filterItems.difficult!);
                          }
                          if (filterItems.booked != null &&
                              filterItems.booked != '') {
                            filterList.add(filterItems.booked!);
                          }
                          if (filterItems.minPrice != null &&
                              filterItems.minPrice! > 0 &&
                              filterItems.maxPrice != null &&
                              filterItems.maxPrice! > 0) {
                            filterList.add(
                                '${filterItems.minPrice}> ${filterItems.maxPrice}');
                          }
                          if (filterList.isNotEmpty) {
                            if (widget.isPrevious) {
                              widget.sessionBloc!.add(
                                  SessionEvent.getPreviousSession(
                                      filter: model));
                            } else {
                              widget.sessionBloc!.add(
                                  SessionEvent.getUpcomingSession(
                                      filter: model));
                            }
                          } else {
                            _getSessions();
                          }
                          setState(() {});
                        }
                      }
                    },
              ),
              horizontalMargin4,
              if (widget.isPrevious)
                const SizedBox.shrink()
              else
                FilterIconButton(
                  icon: Assets.images.previous.path,
                  onPressed: () => context.router
                      .push(PreviousSessionRoute(isUser: widget.isUser)),
                )
            ],
          ),
          if (filterList.isNotEmpty) verticalMargin20,
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
                      model = SessionFilterModel();
                      widget.controller.text = '';
                      if (widget.onReset != null)
                        widget.onReset!();
                      else
                        _getSessions();
                    });
                  },
                  child: Text(
                    'Clear Filter',
                    style:
                        AppTextStyle.tinySMMedium.copyWith(color: colorPrimary),
                  ),
                ),
              ],
            ),
          if (filterList.isNotEmpty)
            Wrap(
              children: List<Widget>.generate(
                filterList.length,
                (index) {
                  final chips = filterList[index];
                  return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.5.w, horizontal: 2.w),
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
            )
        ],
      );
}

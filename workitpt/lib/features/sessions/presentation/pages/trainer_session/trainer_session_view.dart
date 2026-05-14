import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workitpt/core/widgets/base_view.dart';
import 'package:workitpt/features/sessions/presentation/widgets/session_item_widget.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../data/models/session_filter_model.dart';
import '../../../data/models/session_response_model.dart';
import '../../bloc/session_bloc.dart';
import '../../widgets/search_filter_widget.dart';

@RoutePage()
class TrainerSessionView extends StatefulWidget {
  const TrainerSessionView({super.key});

  @override
  State<TrainerSessionView> createState() => _TrainerSessionViewState();
}

class _TrainerSessionViewState extends State<TrainerSessionView> {
  final searchController = TextEditingController();
  List<SessionResponseModel> upcommingSessions = [];
  SessionBloc sessionBloc;
  final ScrollController _scrollController =
      ScrollController(keepScrollOffset: true);
  int totalPage = 1;
  int currentPage = 1;

  _TrainerSessionViewState() : sessionBloc = getIt<SessionBloc>();

  @override
  void initState() {
    getSession();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPage) {
          setState(() {
            currentPage++;
          });
          getSession(model: SessionFilterModel(page: currentPage));
        }
      }
    });
    super.initState();
  }

  void getSession({SessionFilterModel? model}) {
    sessionBloc.add(SessionEvent.getUpcomingSession(filter: model));
  }

  Future<void> _pullRefresh() async {
    getSession();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<SessionBloc>(
        create: (context) => sessionBloc,
        child: BlocListener<SessionBloc, SessionState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: EasyLoading.show,
              onGetSessionSuccess: (sessions) {
                EasyLoading.dismiss();
                setState(() {
                  if (sessions.currentPage != 1) {
                    upcommingSessions.addAll(sessions.data!);
                  } else {
                    upcommingSessions = sessions.data!;
                  }
                  totalPage = sessions.totalPage!;
                  currentPage = sessions.currentPage!;
                });
              },
              onFailure: (error) {
                EasyLoading.showError(error ?? '');
              },
              onUpdateSessionSuccess: (session) {
                EasyLoading.showSuccess(
                  'Session updated successfully.',
                  duration: const Duration(milliseconds: 1600),
                );
                context.router.pop();
                Future.delayed(const Duration(milliseconds: 800), getSession);
              },
              onDeleteSessionSuccess: (session) {
                EasyLoading.showSuccess('Session deleted successfully.');
                context.router.pop();
                Future.delayed(const Duration(milliseconds: 800), getSession);
              },
              onAddSessionSuccess: (session) {},
              onGetUpcomingSessionSuccess: (sessions) {
                EasyLoading.dismiss();
                setState(() {
                  if (sessions.currentPage != 1) {
                    upcommingSessions.addAll(sessions.data!);
                  } else {
                    upcommingSessions = sessions.data!;
                  }
                  totalPage = sessions.totalPage!;
                  currentPage = sessions.currentPage!;
                });
              },
            );
          },
          child: BaseView(
            floatingActionButton: FloatingActionButton(
              onPressed: () => context.router.push(const AddSesssionRoute()),
              backgroundColor: colorPrimary,
              child: const Icon(Icons.add),
            ),
            titleText: 'Sessions',
            appBarColor: Colors.white,
            color: Colors.white,
            automaticallyImplyiLeading: false,
            elevation: 0,
            padding: EdgeInsets.zero,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchFilterWidget(
                  sessionBloc: sessionBloc,
                  controller: searchController,
                ).padding(horizontal: 16),
                verticalMargin24,
                Text(
                  'My Upcoming Sessions',
                  style: AppTextStyle.subHeadLgSemiBold,
                ).padding(horizontal: 16),
                verticalMargin8,
                BlocBuilder<SessionBloc, SessionState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      onGetUpcomingSessionSuccess: (model) {
                        return upcommingSessions.isEmpty
                            ? Center(
                                child: Text(
                                  'No sessions found.',
                                  style: AppTextStyle.bodyLgRegular
                                      .copyWith(color: colorLightGrey),
                                ),
                              ).expanded()
                            : RefreshIndicator.adaptive(
                                onRefresh: _pullRefresh,
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  controller: _scrollController,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  key: PageStorageKey<String>('controllerA'),
                                  itemCount: upcommingSessions.length,
                                  itemBuilder: (context, index) =>
                                      SessionItemWidget(
                                    role: 'TRAINER',
                                    model: upcommingSessions[index],
                                    onPressed: () => context.router.push(
                                      TrainerSessionDetailRoute(
                                        model: upcommingSessions[index],
                                        sessionBloc: sessionBloc,
                                      ),
                                    ),
                                    // isPaid: upcommingSessions[index].booked!
                                    //     ? 'Paid'
                                    //     : null,
                                    // isLarge: true,
                                  ),
                                ),
                              ).expanded();
                      },
                      orElse: () => SizedBox(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
}

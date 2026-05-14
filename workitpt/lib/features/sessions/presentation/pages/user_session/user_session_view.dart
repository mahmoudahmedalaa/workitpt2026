import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/widgets/base_view.dart';
import '../../../data/models/session_filter_model.dart';
import '../../../data/models/session_response_model.dart';
import '../../bloc/session_bloc.dart';
import '../../widgets/search_filter_widget.dart';
import '../../widgets/session_item_widget.dart';

@RoutePage()
class UserSessionView extends StatefulWidget {
  const UserSessionView({super.key});

  @override
  State<UserSessionView> createState() => _UserSessionViewState();
}

class _UserSessionViewState extends State<UserSessionView> {
  final searchController = TextEditingController();
  final SessionFilterModel? filterModel = SessionFilterModel();
  List<SessionResponseModel> totalSessions = [];
  SessionBloc sessionBloc;
  final ScrollController _scrollController =
      ScrollController(keepScrollOffset: true);
  int totalPage = 1;
  int currentPage = 1;

  _UserSessionViewState() : sessionBloc = getIt<SessionBloc>();
  @override
  void initState() {
    sessionBloc.add(const SessionEvent.getUpcomingSession());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPage) {
          setState(() {
            currentPage++;
          });
          sessionBloc.add(SessionEvent.getUpcomingSession(
              filter: SessionFilterModel(page: currentPage)));
        }
      }
    });
    super.initState();
  }

  Future<void> _pullRefresh() async {
    sessionBloc.add(SessionEvent.getUpcomingSession());
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sessionBloc,
        child: BlocListener<SessionBloc, SessionState>(
          listener: (context, state) {
            state.whenOrNull(
                onLoading: EasyLoading.show,
                onGetSessionSuccess: (sessions) {
                  EasyLoading.dismiss();
                  setState(() {
                    if (sessions.currentPage != 1) {
                      totalSessions.addAll(sessions.data!);
                    } else {
                      totalSessions = sessions.data!;
                    }
                    totalPage = sessions.totalPage!;
                    currentPage = sessions.currentPage!;
                  });
                },
                onFailure: (error) {
                  EasyLoading.showError(error ?? '');
                },
                onUpdateSessionSuccess: (session) {},
                onAddSessionSuccess: (session) {},
                onDeleteSessionSuccess: (session) {},
                onGetUpcomingSessionSuccess: (sessions) {
                  EasyLoading.dismiss();
                  setState(() {
                    if (sessions.currentPage != 1) {
                      totalSessions.addAll(sessions.data!);
                    } else {
                      totalSessions = sessions.data!;
                    }
                    totalPage = sessions.totalPage!;
                    currentPage = sessions.currentPage!;
                  });
                });
          },
          child: BaseView(
            titleText: 'Sessions',
            appBarColor: Colors.white,
            color: Colors.white,
            automaticallyImplyiLeading: false,
            elevation: 0,
            padding: EdgeInsets.zero,
            body: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SearchFilterWidget(
                    sessionBloc: sessionBloc,
                    controller: searchController,
                    isUser: true,
                  ),
                ),
                verticalMargin12,
                BlocBuilder<SessionBloc, SessionState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      onGetUpcomingSessionSuccess: (model) {
                        return totalSessions.isEmpty
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
                                  key: PageStorageKey<String>('controllerA'),
                                  controller: _scrollController,
                                  itemCount: totalSessions.length,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  itemBuilder: (context, index) =>
                                      SessionItemWidget(
                                    role: 'USER',
                                    model: totalSessions[index],
                                    onPressed: () => context.router.push(
                                      UserSessionDetailRoute(
                                        model: totalSessions[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ).expanded();
                      },
                      orElse: () {
                        return SizedBox();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workitpt/features/sessions/presentation/widgets/session_item_widget.dart';

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

@RoutePage()
class PreviousSessionView extends StatefulWidget {
  final bool isUser;
  const PreviousSessionView({super.key, required this.isUser});

  @override
  State<PreviousSessionView> createState() => _PreviousSessionViewState();
}

class _PreviousSessionViewState extends State<PreviousSessionView> {
  List<SessionResponseModel> previousSessions = [];
  TextEditingController searchController = TextEditingController();

  SessionBloc sessionBloc;

  _PreviousSessionViewState() : sessionBloc = getIt<SessionBloc>();

  final ScrollController _scrollController = ScrollController();
  int totalPage = 1;
  int currentPage = 1;

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
          sessionBloc.add(SessionEvent.getPreviousSession(
              filter: SessionFilterModel(page: currentPage)));
        }
      }
    });
    super.initState();
  }

  void getSession() {
    sessionBloc.add(const SessionEvent.getPreviousSession());
  }

  Future<void> _pullRefresh() async {
    getSession();
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
                      previousSessions.addAll(sessions.data!);
                    } else {
                      previousSessions = sessions.data!;
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
                onGetPreviousSessionSuccess: (sessions) {
                  EasyLoading.dismiss();
                  setState(() {
                    if (sessions.currentPage != 1) {
                      previousSessions.addAll(sessions.data!);
                    } else {
                      previousSessions = sessions.data!;
                    }
                    totalPage = sessions.totalPage!;
                    currentPage = sessions.currentPage!;
                  });
                });
          },
          child: BaseView(
            titleText: 'My Previous Session',
            appBarColor: Colors.white,
            elevation: 0,
            body: Column(
              children: <Widget>[
                SearchFilterWidget(
                  sessionBloc: sessionBloc,
                  controller: searchController,
                  isPrevious: true,
                  isUser: widget.isUser,
                ),
                verticalMargin16,
                BlocBuilder<SessionBloc, SessionState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => SizedBox(),
                      onGetPreviousSessionSuccess: (sessions) {
                        return previousSessions.isEmpty
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
                                  shrinkWrap: true,
                                  key: PageStorageKey<String>('controllerA'),
                                  controller: _scrollController,
                                  itemCount: previousSessions.length,
                                  itemBuilder: (context, index) =>
                                      SessionItemWidget(
                                    model: previousSessions[index],
                                    role: 'TRAINER',
                                    onPressed: () => context.router.push(
                                      TrainerSessionDetailRoute(
                                        model: previousSessions[index],
                                        sessionBloc: sessionBloc,
                                        isPrevious: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ).expanded();
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      );
}

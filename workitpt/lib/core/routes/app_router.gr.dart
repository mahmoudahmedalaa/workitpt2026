// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddCardRoute.name: (routeData) {
      final args = routeData.argsAs<AddCardRouteArgs>(
          orElse: () => const AddCardRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddCardView(key: args.key),
      );
    },
    AddSesssionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddSesssionView(),
      );
    },
    AllDoneRoute.name: (routeData) {
      final args = routeData.argsAs<AllDoneRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AllDoneView(
          key: args.key,
          desc: args.desc,
          role: args.role,
          image: args.image,
        ),
      );
    },
    AnalyticsRoute.name: (routeData) {
      final args = routeData.argsAs<AnalyticsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AnalyticsView(
          key: args.key,
          model: args.model,
        ),
      );
    },
    AppPDFRoute.name: (routeData) {
      final args = routeData.argsAs<AppPDFRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AppPDFView(
          key: args.key,
          path: args.path,
        ),
      );
    },
    BookingDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BookingDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookingDetailsView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    BookingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookingView(),
      );
    },
    CalendarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CalendarView(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangePasswordView(),
      );
    },
    ChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatView(),
      );
    },
    CompletedSessionRoute.name: (routeData) {
      final args = routeData.argsAs<CompletedSessionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CompletedSessionView(
          key: args.key,
          completedSessions: args.completedSessions,
        ),
      );
    },
    ContactRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactView(),
      );
    },
    CustomerDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CustomerDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomerDetailView(
          key: args.key,
          model: args.model,
        ),
      );
    },
    CustomerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerView(),
      );
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashboardView(
          key: args.key,
          role: args.role,
        ),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditProfileView(
          key: args.key,
          model: args.model,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    InChatRoute.name: (routeData) {
      final args = routeData.argsAs<InChatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: InChatView(
          key: args.key,
          sessionId: args.sessionId,
          sessionTitle: args.sessionTitle,
          avatar: args.avatar,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginView(
          key: args.key,
          continueAfterSuccess: args.continueAfterSuccess,
        ),
      );
    },
    MapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MapView(),
      );
    },
    NotificationRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationView(
          key: args.key,
          hasNotification: args.hasNotification,
        ),
      );
    },
    OTPVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<OTPVerificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OTPVerificationView(
          key: args.key,
          email: args.email,
          keyData: args.keyData,
        ),
      );
    },
    OTPVerifiedRoute.name: (routeData) {
      final args = routeData.argsAs<OTPVerifiedRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OTPVerifiedView(
          key: args.key,
          role: args.role,
        ),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnBoardingView(),
      );
    },
    PaymentCardRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentCardRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PaymentCardView(
          key: args.key,
          bookingId: args.bookingId,
        ),
      );
    },
    PaymentDetailFormRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentDetailFormRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PaymentDetailFormView(
          key: args.key,
          paymentUrl: args.paymentUrl,
        ),
      );
    },
    PaymentReceiptRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PaymentReceiptView(),
      );
    },
    PaymentReviewRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentReviewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PaymentReviewView(
          key: args.key,
          bookingId: args.bookingId,
          cardID: args.cardID,
        ),
      );
    },
    PaymentSuccessRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentSuccessRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PaymentSuccessView(
          key: args.key,
          role: args.role,
          id: args.id,
        ),
      );
    },
    PendingPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<PendingPaymentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PendingPaymentView(
          key: args.key,
          totalSessions: args.totalSessions,
        ),
      );
    },
    PreviousSessionRoute.name: (routeData) {
      final args = routeData.argsAs<PreviousSessionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PreviousSessionView(
          key: args.key,
          isUser: args.isUser,
        ),
      );
    },
    ProfileHelpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileHelpView(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileView(
          key: args.key,
          isTrainerApproved: args.isTrainerApproved,
        ),
      );
    },
    RatingListRoute.name: (routeData) {
      final args = routeData.argsAs<RatingListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RatingListView(
          key: args.key,
          completedSessions: args.completedSessions,
        ),
      );
    },
    RatingRoute.name: (routeData) {
      final args = routeData.argsAs<RatingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RatingView(
          key: args.key,
          session: args.session,
        ),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResetPasswordView(
          key: args.key,
          token: args.token,
        ),
      );
    },
    SessionBookingRoute.name: (routeData) {
      final args = routeData.argsAs<SessionBookingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SessionBookingView(
          key: args.key,
          model: args.model,
          isPaid: args.isPaid,
        ),
      );
    },
    SignupAdditionalRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupAdditionalView(),
      );
    },
    SignupTrainerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupTrainerView(),
      );
    },
    SignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignupView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    TermsRoute.name: (routeData) {
      final args = routeData.argsAs<TermsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TermsView(
          key: args.key,
          profileModel: args.profileModel,
          fileList: args.fileList,
        ),
      );
    },
    TermsWebRoute.name: (routeData) {
      final args = routeData.argsAs<TermsWebRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TermsWebView(
          key: args.key,
          url: args.url,
        ),
      );
    },
    TrainerDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TrainerDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TrainerDetailView(
          key: args.key,
          model: args.model,
        ),
      );
    },
    TrainerImageRoute.name: (routeData) {
      final args = routeData.argsAs<TrainerImageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TrainerImageView(
          key: args.key,
          images: args.images,
          profileModel: args.profileModel,
        ),
      );
    },
    TrainerSessionDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TrainerSessionDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TrainerSessionDetailView(
          key: args.key,
          model: args.model,
          sessionBloc: args.sessionBloc,
          isPrevious: args.isPrevious,
        ),
      );
    },
    TrainerSessionEditRoute.name: (routeData) {
      final args = routeData.argsAs<TrainerSessionEditRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TrainerSessionEditView(
          key: args.key,
          model: args.model,
        ),
      );
    },
    TrainerSessionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TrainerSessionView(),
      );
    },
    TrainerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TrainerView(),
      );
    },
    UpcomingSessionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpcomingSessionView(),
      );
    },
    UserHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserHomeView(),
      );
    },
    UserSessionDetailRoute.name: (routeData) {
      final args = routeData.argsAs<UserSessionDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserSessionDetailView(
          key: args.key,
          model: args.model,
          isPaid: args.isPaid,
        ),
      );
    },
    UserSessionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserSessionView(),
      );
    },
    VerifyNumberRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyNumberRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerifyNumberView(
          key: args.key,
          role: args.role,
          mail: args.mail,
        ),
      );
    },
    WalletRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WalletView(),
      );
    },
    WithdrawSummaryRoute.name: (routeData) {
      final args = routeData.argsAs<WithdrawSummaryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WithdrawSummaryView(
          key: args.key,
          bankDetails: args.bankDetails,
          withdrawAmount: args.withdrawAmount,
          walletBloc: args.walletBloc,
        ),
      );
    },
    WithdrawRoute.name: (routeData) {
      final args = routeData.argsAs<WithdrawRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WithdrawView(
          key: args.key,
          name: args.name,
          accNumber: args.accNumber,
          bankName: args.bankName,
        ),
      );
    },
  };
}

/// generated route for
/// [AddCardView]
class AddCardRoute extends PageRouteInfo<AddCardRouteArgs> {
  AddCardRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddCardRoute.name,
          args: AddCardRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddCardRoute';

  static const PageInfo<AddCardRouteArgs> page =
      PageInfo<AddCardRouteArgs>(name);
}

class AddCardRouteArgs {
  const AddCardRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddCardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AddSesssionView]
class AddSesssionRoute extends PageRouteInfo<void> {
  const AddSesssionRoute({List<PageRouteInfo>? children})
      : super(
          AddSesssionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddSesssionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AllDoneView]
class AllDoneRoute extends PageRouteInfo<AllDoneRouteArgs> {
  AllDoneRoute({
    Key? key,
    String? desc,
    required String role,
    String? image,
    List<PageRouteInfo>? children,
  }) : super(
          AllDoneRoute.name,
          args: AllDoneRouteArgs(
            key: key,
            desc: desc,
            role: role,
            image: image,
          ),
          initialChildren: children,
        );

  static const String name = 'AllDoneRoute';

  static const PageInfo<AllDoneRouteArgs> page =
      PageInfo<AllDoneRouteArgs>(name);
}

class AllDoneRouteArgs {
  const AllDoneRouteArgs({
    this.key,
    this.desc,
    required this.role,
    this.image,
  });

  final Key? key;

  final String? desc;

  final String role;

  final String? image;

  @override
  String toString() {
    return 'AllDoneRouteArgs{key: $key, desc: $desc, role: $role, image: $image}';
  }
}

/// generated route for
/// [AnalyticsView]
class AnalyticsRoute extends PageRouteInfo<AnalyticsRouteArgs> {
  AnalyticsRoute({
    Key? key,
    required AnalyticsModel model,
    List<PageRouteInfo>? children,
  }) : super(
          AnalyticsRoute.name,
          args: AnalyticsRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'AnalyticsRoute';

  static const PageInfo<AnalyticsRouteArgs> page =
      PageInfo<AnalyticsRouteArgs>(name);
}

class AnalyticsRouteArgs {
  const AnalyticsRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final AnalyticsModel model;

  @override
  String toString() {
    return 'AnalyticsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [AppPDFView]
class AppPDFRoute extends PageRouteInfo<AppPDFRouteArgs> {
  AppPDFRoute({
    Key? key,
    required String path,
    List<PageRouteInfo>? children,
  }) : super(
          AppPDFRoute.name,
          args: AppPDFRouteArgs(
            key: key,
            path: path,
          ),
          initialChildren: children,
        );

  static const String name = 'AppPDFRoute';

  static const PageInfo<AppPDFRouteArgs> page = PageInfo<AppPDFRouteArgs>(name);
}

class AppPDFRouteArgs {
  const AppPDFRouteArgs({
    this.key,
    required this.path,
  });

  final Key? key;

  final String path;

  @override
  String toString() {
    return 'AppPDFRouteArgs{key: $key, path: $path}';
  }
}

/// generated route for
/// [BookingDetailsView]
class BookingDetailsRoute extends PageRouteInfo<BookingDetailsRouteArgs> {
  BookingDetailsRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          BookingDetailsRoute.name,
          args: BookingDetailsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'BookingDetailsRoute';

  static const PageInfo<BookingDetailsRouteArgs> page =
      PageInfo<BookingDetailsRouteArgs>(name);
}

class BookingDetailsRouteArgs {
  const BookingDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'BookingDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [BookingView]
class BookingRoute extends PageRouteInfo<void> {
  const BookingRoute({List<PageRouteInfo>? children})
      : super(
          BookingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CalendarView]
class CalendarRoute extends PageRouteInfo<void> {
  const CalendarRoute({List<PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangePasswordView]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatView]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompletedSessionView]
class CompletedSessionRoute extends PageRouteInfo<CompletedSessionRouteArgs> {
  CompletedSessionRoute({
    Key? key,
    required List<SessionResponseModel> completedSessions,
    List<PageRouteInfo>? children,
  }) : super(
          CompletedSessionRoute.name,
          args: CompletedSessionRouteArgs(
            key: key,
            completedSessions: completedSessions,
          ),
          initialChildren: children,
        );

  static const String name = 'CompletedSessionRoute';

  static const PageInfo<CompletedSessionRouteArgs> page =
      PageInfo<CompletedSessionRouteArgs>(name);
}

class CompletedSessionRouteArgs {
  const CompletedSessionRouteArgs({
    this.key,
    required this.completedSessions,
  });

  final Key? key;

  final List<SessionResponseModel> completedSessions;

  @override
  String toString() {
    return 'CompletedSessionRouteArgs{key: $key, completedSessions: $completedSessions}';
  }
}

/// generated route for
/// [ContactView]
class ContactRoute extends PageRouteInfo<void> {
  const ContactRoute({List<PageRouteInfo>? children})
      : super(
          ContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomerDetailView]
class CustomerDetailRoute extends PageRouteInfo<CustomerDetailRouteArgs> {
  CustomerDetailRoute({
    Key? key,
    required CustomerModel model,
    List<PageRouteInfo>? children,
  }) : super(
          CustomerDetailRoute.name,
          args: CustomerDetailRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomerDetailRoute';

  static const PageInfo<CustomerDetailRouteArgs> page =
      PageInfo<CustomerDetailRouteArgs>(name);
}

class CustomerDetailRouteArgs {
  const CustomerDetailRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final CustomerModel model;

  @override
  String toString() {
    return 'CustomerDetailRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [CustomerView]
class CustomerRoute extends PageRouteInfo<void> {
  const CustomerRoute({List<PageRouteInfo>? children})
      : super(
          CustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    Key? key,
    required String role,
    List<PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          args: DashboardRouteArgs(
            key: key,
            role: role,
          ),
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<DashboardRouteArgs> page =
      PageInfo<DashboardRouteArgs>(name);
}

class DashboardRouteArgs {
  const DashboardRouteArgs({
    this.key,
    required this.role,
  });

  final Key? key;

  final String role;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key, role: $role}';
  }
}

/// generated route for
/// [EditProfileView]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Key? key,
    required ProfileModel model,
    List<PageRouteInfo>? children,
  }) : super(
          EditProfileRoute.name,
          args: EditProfileRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<EditProfileRouteArgs> page =
      PageInfo<EditProfileRouteArgs>(name);
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final ProfileModel model;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [ForgotPasswordView]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InChatView]
class InChatRoute extends PageRouteInfo<InChatRouteArgs> {
  InChatRoute({
    Key? key,
    required String sessionId,
    String? sessionTitle,
    String? avatar,
    List<PageRouteInfo>? children,
  }) : super(
          InChatRoute.name,
          args: InChatRouteArgs(
            key: key,
            sessionId: sessionId,
            sessionTitle: sessionTitle,
            avatar: avatar,
          ),
          initialChildren: children,
        );

  static const String name = 'InChatRoute';

  static const PageInfo<InChatRouteArgs> page = PageInfo<InChatRouteArgs>(name);
}

class InChatRouteArgs {
  const InChatRouteArgs({
    this.key,
    required this.sessionId,
    this.sessionTitle,
    this.avatar,
  });

  final Key? key;

  final String sessionId;

  final String? sessionTitle;

  final String? avatar;

  @override
  String toString() {
    return 'InChatRouteArgs{key: $key, sessionId: $sessionId, sessionTitle: $sessionTitle, avatar: $avatar}';
  }
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    bool continueAfterSuccess = false,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            continueAfterSuccess: continueAfterSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.continueAfterSuccess = false,
  });

  final Key? key;

  final bool continueAfterSuccess;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, continueAfterSuccess: $continueAfterSuccess}';
  }
}

/// generated route for
/// [MapView]
class MapRoute extends PageRouteInfo<void> {
  const MapRoute({List<PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationView]
class NotificationRoute extends PageRouteInfo<NotificationRouteArgs> {
  NotificationRoute({
    Key? key,
    required ValueNotifier<bool> hasNotification,
    List<PageRouteInfo>? children,
  }) : super(
          NotificationRoute.name,
          args: NotificationRouteArgs(
            key: key,
            hasNotification: hasNotification,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<NotificationRouteArgs> page =
      PageInfo<NotificationRouteArgs>(name);
}

class NotificationRouteArgs {
  const NotificationRouteArgs({
    this.key,
    required this.hasNotification,
  });

  final Key? key;

  final ValueNotifier<bool> hasNotification;

  @override
  String toString() {
    return 'NotificationRouteArgs{key: $key, hasNotification: $hasNotification}';
  }
}

/// generated route for
/// [OTPVerificationView]
class OTPVerificationRoute extends PageRouteInfo<OTPVerificationRouteArgs> {
  OTPVerificationRoute({
    Key? key,
    String? email,
    required String keyData,
    List<PageRouteInfo>? children,
  }) : super(
          OTPVerificationRoute.name,
          args: OTPVerificationRouteArgs(
            key: key,
            email: email,
            keyData: keyData,
          ),
          initialChildren: children,
        );

  static const String name = 'OTPVerificationRoute';

  static const PageInfo<OTPVerificationRouteArgs> page =
      PageInfo<OTPVerificationRouteArgs>(name);
}

class OTPVerificationRouteArgs {
  const OTPVerificationRouteArgs({
    this.key,
    this.email,
    required this.keyData,
  });

  final Key? key;

  final String? email;

  final String keyData;

  @override
  String toString() {
    return 'OTPVerificationRouteArgs{key: $key, email: $email, keyData: $keyData}';
  }
}

/// generated route for
/// [OTPVerifiedView]
class OTPVerifiedRoute extends PageRouteInfo<OTPVerifiedRouteArgs> {
  OTPVerifiedRoute({
    Key? key,
    required String role,
    List<PageRouteInfo>? children,
  }) : super(
          OTPVerifiedRoute.name,
          args: OTPVerifiedRouteArgs(
            key: key,
            role: role,
          ),
          initialChildren: children,
        );

  static const String name = 'OTPVerifiedRoute';

  static const PageInfo<OTPVerifiedRouteArgs> page =
      PageInfo<OTPVerifiedRouteArgs>(name);
}

class OTPVerifiedRouteArgs {
  const OTPVerifiedRouteArgs({
    this.key,
    required this.role,
  });

  final Key? key;

  final String role;

  @override
  String toString() {
    return 'OTPVerifiedRouteArgs{key: $key, role: $role}';
  }
}

/// generated route for
/// [OnBoardingView]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PaymentCardView]
class PaymentCardRoute extends PageRouteInfo<PaymentCardRouteArgs> {
  PaymentCardRoute({
    Key? key,
    required List<String> bookingId,
    List<PageRouteInfo>? children,
  }) : super(
          PaymentCardRoute.name,
          args: PaymentCardRouteArgs(
            key: key,
            bookingId: bookingId,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentCardRoute';

  static const PageInfo<PaymentCardRouteArgs> page =
      PageInfo<PaymentCardRouteArgs>(name);
}

class PaymentCardRouteArgs {
  const PaymentCardRouteArgs({
    this.key,
    required this.bookingId,
  });

  final Key? key;

  final List<String> bookingId;

  @override
  String toString() {
    return 'PaymentCardRouteArgs{key: $key, bookingId: $bookingId}';
  }
}

/// generated route for
/// [PaymentDetailFormView]
class PaymentDetailFormRoute extends PageRouteInfo<PaymentDetailFormRouteArgs> {
  PaymentDetailFormRoute({
    Key? key,
    required String paymentUrl,
    List<PageRouteInfo>? children,
  }) : super(
          PaymentDetailFormRoute.name,
          args: PaymentDetailFormRouteArgs(
            key: key,
            paymentUrl: paymentUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentDetailFormRoute';

  static const PageInfo<PaymentDetailFormRouteArgs> page =
      PageInfo<PaymentDetailFormRouteArgs>(name);
}

class PaymentDetailFormRouteArgs {
  const PaymentDetailFormRouteArgs({
    this.key,
    required this.paymentUrl,
  });

  final Key? key;

  final String paymentUrl;

  @override
  String toString() {
    return 'PaymentDetailFormRouteArgs{key: $key, paymentUrl: $paymentUrl}';
  }
}

/// generated route for
/// [PaymentReceiptView]
class PaymentReceiptRoute extends PageRouteInfo<void> {
  const PaymentReceiptRoute({List<PageRouteInfo>? children})
      : super(
          PaymentReceiptRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentReceiptRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PaymentReviewView]
class PaymentReviewRoute extends PageRouteInfo<PaymentReviewRouteArgs> {
  PaymentReviewRoute({
    Key? key,
    required List<String> bookingId,
    required String cardID,
    List<PageRouteInfo>? children,
  }) : super(
          PaymentReviewRoute.name,
          args: PaymentReviewRouteArgs(
            key: key,
            bookingId: bookingId,
            cardID: cardID,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentReviewRoute';

  static const PageInfo<PaymentReviewRouteArgs> page =
      PageInfo<PaymentReviewRouteArgs>(name);
}

class PaymentReviewRouteArgs {
  const PaymentReviewRouteArgs({
    this.key,
    required this.bookingId,
    required this.cardID,
  });

  final Key? key;

  final List<String> bookingId;

  final String cardID;

  @override
  String toString() {
    return 'PaymentReviewRouteArgs{key: $key, bookingId: $bookingId, cardID: $cardID}';
  }
}

/// generated route for
/// [PaymentSuccessView]
class PaymentSuccessRoute extends PageRouteInfo<PaymentSuccessRouteArgs> {
  PaymentSuccessRoute({
    Key? key,
    required String role,
    required List<String> id,
    List<PageRouteInfo>? children,
  }) : super(
          PaymentSuccessRoute.name,
          args: PaymentSuccessRouteArgs(
            key: key,
            role: role,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentSuccessRoute';

  static const PageInfo<PaymentSuccessRouteArgs> page =
      PageInfo<PaymentSuccessRouteArgs>(name);
}

class PaymentSuccessRouteArgs {
  const PaymentSuccessRouteArgs({
    this.key,
    required this.role,
    required this.id,
  });

  final Key? key;

  final String role;

  final List<String> id;

  @override
  String toString() {
    return 'PaymentSuccessRouteArgs{key: $key, role: $role, id: $id}';
  }
}

/// generated route for
/// [PendingPaymentView]
class PendingPaymentRoute extends PageRouteInfo<PendingPaymentRouteArgs> {
  PendingPaymentRoute({
    Key? key,
    required List<BookingModel> totalSessions,
    List<PageRouteInfo>? children,
  }) : super(
          PendingPaymentRoute.name,
          args: PendingPaymentRouteArgs(
            key: key,
            totalSessions: totalSessions,
          ),
          initialChildren: children,
        );

  static const String name = 'PendingPaymentRoute';

  static const PageInfo<PendingPaymentRouteArgs> page =
      PageInfo<PendingPaymentRouteArgs>(name);
}

class PendingPaymentRouteArgs {
  const PendingPaymentRouteArgs({
    this.key,
    required this.totalSessions,
  });

  final Key? key;

  final List<BookingModel> totalSessions;

  @override
  String toString() {
    return 'PendingPaymentRouteArgs{key: $key, totalSessions: $totalSessions}';
  }
}

/// generated route for
/// [PreviousSessionView]
class PreviousSessionRoute extends PageRouteInfo<PreviousSessionRouteArgs> {
  PreviousSessionRoute({
    Key? key,
    required bool isUser,
    List<PageRouteInfo>? children,
  }) : super(
          PreviousSessionRoute.name,
          args: PreviousSessionRouteArgs(
            key: key,
            isUser: isUser,
          ),
          initialChildren: children,
        );

  static const String name = 'PreviousSessionRoute';

  static const PageInfo<PreviousSessionRouteArgs> page =
      PageInfo<PreviousSessionRouteArgs>(name);
}

class PreviousSessionRouteArgs {
  const PreviousSessionRouteArgs({
    this.key,
    required this.isUser,
  });

  final Key? key;

  final bool isUser;

  @override
  String toString() {
    return 'PreviousSessionRouteArgs{key: $key, isUser: $isUser}';
  }
}

/// generated route for
/// [ProfileHelpView]
class ProfileHelpRoute extends PageRouteInfo<void> {
  const ProfileHelpRoute({List<PageRouteInfo>? children})
      : super(
          ProfileHelpRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileHelpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    required ValueNotifier<bool> isTrainerApproved,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            isTrainerApproved: isTrainerApproved,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.isTrainerApproved,
  });

  final Key? key;

  final ValueNotifier<bool> isTrainerApproved;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, isTrainerApproved: $isTrainerApproved}';
  }
}

/// generated route for
/// [RatingListView]
class RatingListRoute extends PageRouteInfo<RatingListRouteArgs> {
  RatingListRoute({
    Key? key,
    required List<SessionResponseModel> completedSessions,
    List<PageRouteInfo>? children,
  }) : super(
          RatingListRoute.name,
          args: RatingListRouteArgs(
            key: key,
            completedSessions: completedSessions,
          ),
          initialChildren: children,
        );

  static const String name = 'RatingListRoute';

  static const PageInfo<RatingListRouteArgs> page =
      PageInfo<RatingListRouteArgs>(name);
}

class RatingListRouteArgs {
  const RatingListRouteArgs({
    this.key,
    required this.completedSessions,
  });

  final Key? key;

  final List<SessionResponseModel> completedSessions;

  @override
  String toString() {
    return 'RatingListRouteArgs{key: $key, completedSessions: $completedSessions}';
  }
}

/// generated route for
/// [RatingView]
class RatingRoute extends PageRouteInfo<RatingRouteArgs> {
  RatingRoute({
    Key? key,
    required SessionResponseModel session,
    List<PageRouteInfo>? children,
  }) : super(
          RatingRoute.name,
          args: RatingRouteArgs(
            key: key,
            session: session,
          ),
          initialChildren: children,
        );

  static const String name = 'RatingRoute';

  static const PageInfo<RatingRouteArgs> page = PageInfo<RatingRouteArgs>(name);
}

class RatingRouteArgs {
  const RatingRouteArgs({
    this.key,
    required this.session,
  });

  final Key? key;

  final SessionResponseModel session;

  @override
  String toString() {
    return 'RatingRouteArgs{key: $key, session: $session}';
  }
}

/// generated route for
/// [ResetPasswordView]
class ResetPasswordRoute extends PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    Key? key,
    required String token,
    List<PageRouteInfo>? children,
  }) : super(
          ResetPasswordRoute.name,
          args: ResetPasswordRouteArgs(
            key: key,
            token: token,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<ResetPasswordRouteArgs> page =
      PageInfo<ResetPasswordRouteArgs>(name);
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    this.key,
    required this.token,
  });

  final Key? key;

  final String token;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [SessionBookingView]
class SessionBookingRoute extends PageRouteInfo<SessionBookingRouteArgs> {
  SessionBookingRoute({
    Key? key,
    required SessionResponseModel model,
    String? isPaid,
    List<PageRouteInfo>? children,
  }) : super(
          SessionBookingRoute.name,
          args: SessionBookingRouteArgs(
            key: key,
            model: model,
            isPaid: isPaid,
          ),
          initialChildren: children,
        );

  static const String name = 'SessionBookingRoute';

  static const PageInfo<SessionBookingRouteArgs> page =
      PageInfo<SessionBookingRouteArgs>(name);
}

class SessionBookingRouteArgs {
  const SessionBookingRouteArgs({
    this.key,
    required this.model,
    this.isPaid,
  });

  final Key? key;

  final SessionResponseModel model;

  final String? isPaid;

  @override
  String toString() {
    return 'SessionBookingRouteArgs{key: $key, model: $model, isPaid: $isPaid}';
  }
}

/// generated route for
/// [SignupAdditionalView]
class SignupAdditionalRoute extends PageRouteInfo<void> {
  const SignupAdditionalRoute({List<PageRouteInfo>? children})
      : super(
          SignupAdditionalRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupAdditionalRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignupTrainerView]
class SignupTrainerRoute extends PageRouteInfo<void> {
  const SignupTrainerRoute({List<PageRouteInfo>? children})
      : super(
          SignupTrainerRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupTrainerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignupView]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsView]
class TermsRoute extends PageRouteInfo<TermsRouteArgs> {
  TermsRoute({
    Key? key,
    required ProfileModel profileModel,
    required List<File?> fileList,
    List<PageRouteInfo>? children,
  }) : super(
          TermsRoute.name,
          args: TermsRouteArgs(
            key: key,
            profileModel: profileModel,
            fileList: fileList,
          ),
          initialChildren: children,
        );

  static const String name = 'TermsRoute';

  static const PageInfo<TermsRouteArgs> page = PageInfo<TermsRouteArgs>(name);
}

class TermsRouteArgs {
  const TermsRouteArgs({
    this.key,
    required this.profileModel,
    required this.fileList,
  });

  final Key? key;

  final ProfileModel profileModel;

  final List<File?> fileList;

  @override
  String toString() {
    return 'TermsRouteArgs{key: $key, profileModel: $profileModel, fileList: $fileList}';
  }
}

/// generated route for
/// [TermsWebView]
class TermsWebRoute extends PageRouteInfo<TermsWebRouteArgs> {
  TermsWebRoute({
    Key? key,
    required String url,
    List<PageRouteInfo>? children,
  }) : super(
          TermsWebRoute.name,
          args: TermsWebRouteArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'TermsWebRoute';

  static const PageInfo<TermsWebRouteArgs> page =
      PageInfo<TermsWebRouteArgs>(name);
}

class TermsWebRouteArgs {
  const TermsWebRouteArgs({
    this.key,
    required this.url,
  });

  final Key? key;

  final String url;

  @override
  String toString() {
    return 'TermsWebRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [TrainerDetailView]
class TrainerDetailRoute extends PageRouteInfo<TrainerDetailRouteArgs> {
  TrainerDetailRoute({
    Key? key,
    required TrainerModel model,
    List<PageRouteInfo>? children,
  }) : super(
          TrainerDetailRoute.name,
          args: TrainerDetailRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'TrainerDetailRoute';

  static const PageInfo<TrainerDetailRouteArgs> page =
      PageInfo<TrainerDetailRouteArgs>(name);
}

class TrainerDetailRouteArgs {
  const TrainerDetailRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final TrainerModel model;

  @override
  String toString() {
    return 'TrainerDetailRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [TrainerImageView]
class TrainerImageRoute extends PageRouteInfo<TrainerImageRouteArgs> {
  TrainerImageRoute({
    Key? key,
    required List<String> images,
    required ProfileModel profileModel,
    List<PageRouteInfo>? children,
  }) : super(
          TrainerImageRoute.name,
          args: TrainerImageRouteArgs(
            key: key,
            images: images,
            profileModel: profileModel,
          ),
          initialChildren: children,
        );

  static const String name = 'TrainerImageRoute';

  static const PageInfo<TrainerImageRouteArgs> page =
      PageInfo<TrainerImageRouteArgs>(name);
}

class TrainerImageRouteArgs {
  const TrainerImageRouteArgs({
    this.key,
    required this.images,
    required this.profileModel,
  });

  final Key? key;

  final List<String> images;

  final ProfileModel profileModel;

  @override
  String toString() {
    return 'TrainerImageRouteArgs{key: $key, images: $images, profileModel: $profileModel}';
  }
}

/// generated route for
/// [TrainerSessionDetailView]
class TrainerSessionDetailRoute
    extends PageRouteInfo<TrainerSessionDetailRouteArgs> {
  TrainerSessionDetailRoute({
    Key? key,
    required SessionResponseModel model,
    required SessionBloc sessionBloc,
    bool isPrevious = false,
    List<PageRouteInfo>? children,
  }) : super(
          TrainerSessionDetailRoute.name,
          args: TrainerSessionDetailRouteArgs(
            key: key,
            model: model,
            sessionBloc: sessionBloc,
            isPrevious: isPrevious,
          ),
          initialChildren: children,
        );

  static const String name = 'TrainerSessionDetailRoute';

  static const PageInfo<TrainerSessionDetailRouteArgs> page =
      PageInfo<TrainerSessionDetailRouteArgs>(name);
}

class TrainerSessionDetailRouteArgs {
  const TrainerSessionDetailRouteArgs({
    this.key,
    required this.model,
    required this.sessionBloc,
    this.isPrevious = false,
  });

  final Key? key;

  final SessionResponseModel model;

  final SessionBloc sessionBloc;

  final bool isPrevious;

  @override
  String toString() {
    return 'TrainerSessionDetailRouteArgs{key: $key, model: $model, sessionBloc: $sessionBloc, isPrevious: $isPrevious}';
  }
}

/// generated route for
/// [TrainerSessionEditView]
class TrainerSessionEditRoute
    extends PageRouteInfo<TrainerSessionEditRouteArgs> {
  TrainerSessionEditRoute({
    Key? key,
    required SessionResponseModel model,
    List<PageRouteInfo>? children,
  }) : super(
          TrainerSessionEditRoute.name,
          args: TrainerSessionEditRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'TrainerSessionEditRoute';

  static const PageInfo<TrainerSessionEditRouteArgs> page =
      PageInfo<TrainerSessionEditRouteArgs>(name);
}

class TrainerSessionEditRouteArgs {
  const TrainerSessionEditRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final SessionResponseModel model;

  @override
  String toString() {
    return 'TrainerSessionEditRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [TrainerSessionView]
class TrainerSessionRoute extends PageRouteInfo<void> {
  const TrainerSessionRoute({List<PageRouteInfo>? children})
      : super(
          TrainerSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrainerSessionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TrainerView]
class TrainerRoute extends PageRouteInfo<void> {
  const TrainerRoute({List<PageRouteInfo>? children})
      : super(
          TrainerRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrainerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpcomingSessionView]
class UpcomingSessionRoute extends PageRouteInfo<void> {
  const UpcomingSessionRoute({List<PageRouteInfo>? children})
      : super(
          UpcomingSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpcomingSessionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserHomeView]
class UserHomeRoute extends PageRouteInfo<void> {
  const UserHomeRoute({List<PageRouteInfo>? children})
      : super(
          UserHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserSessionDetailView]
class UserSessionDetailRoute extends PageRouteInfo<UserSessionDetailRouteArgs> {
  UserSessionDetailRoute({
    Key? key,
    required SessionResponseModel model,
    String? isPaid,
    List<PageRouteInfo>? children,
  }) : super(
          UserSessionDetailRoute.name,
          args: UserSessionDetailRouteArgs(
            key: key,
            model: model,
            isPaid: isPaid,
          ),
          initialChildren: children,
        );

  static const String name = 'UserSessionDetailRoute';

  static const PageInfo<UserSessionDetailRouteArgs> page =
      PageInfo<UserSessionDetailRouteArgs>(name);
}

class UserSessionDetailRouteArgs {
  const UserSessionDetailRouteArgs({
    this.key,
    required this.model,
    this.isPaid,
  });

  final Key? key;

  final SessionResponseModel model;

  final String? isPaid;

  @override
  String toString() {
    return 'UserSessionDetailRouteArgs{key: $key, model: $model, isPaid: $isPaid}';
  }
}

/// generated route for
/// [UserSessionView]
class UserSessionRoute extends PageRouteInfo<void> {
  const UserSessionRoute({List<PageRouteInfo>? children})
      : super(
          UserSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserSessionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyNumberView]
class VerifyNumberRoute extends PageRouteInfo<VerifyNumberRouteArgs> {
  VerifyNumberRoute({
    Key? key,
    required String role,
    required String mail,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyNumberRoute.name,
          args: VerifyNumberRouteArgs(
            key: key,
            role: role,
            mail: mail,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyNumberRoute';

  static const PageInfo<VerifyNumberRouteArgs> page =
      PageInfo<VerifyNumberRouteArgs>(name);
}

class VerifyNumberRouteArgs {
  const VerifyNumberRouteArgs({
    this.key,
    required this.role,
    required this.mail,
  });

  final Key? key;

  final String role;

  final String mail;

  @override
  String toString() {
    return 'VerifyNumberRouteArgs{key: $key, role: $role, mail: $mail}';
  }
}

/// generated route for
/// [WalletView]
class WalletRoute extends PageRouteInfo<void> {
  const WalletRoute({List<PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WithdrawSummaryView]
class WithdrawSummaryRoute extends PageRouteInfo<WithdrawSummaryRouteArgs> {
  WithdrawSummaryRoute({
    Key? key,
    required BankDetails bankDetails,
    required double withdrawAmount,
    required WalletBloc walletBloc,
    List<PageRouteInfo>? children,
  }) : super(
          WithdrawSummaryRoute.name,
          args: WithdrawSummaryRouteArgs(
            key: key,
            bankDetails: bankDetails,
            withdrawAmount: withdrawAmount,
            walletBloc: walletBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'WithdrawSummaryRoute';

  static const PageInfo<WithdrawSummaryRouteArgs> page =
      PageInfo<WithdrawSummaryRouteArgs>(name);
}

class WithdrawSummaryRouteArgs {
  const WithdrawSummaryRouteArgs({
    this.key,
    required this.bankDetails,
    required this.withdrawAmount,
    required this.walletBloc,
  });

  final Key? key;

  final BankDetails bankDetails;

  final double withdrawAmount;

  final WalletBloc walletBloc;

  @override
  String toString() {
    return 'WithdrawSummaryRouteArgs{key: $key, bankDetails: $bankDetails, withdrawAmount: $withdrawAmount, walletBloc: $walletBloc}';
  }
}

/// generated route for
/// [WithdrawView]
class WithdrawRoute extends PageRouteInfo<WithdrawRouteArgs> {
  WithdrawRoute({
    Key? key,
    required String name,
    required String accNumber,
    required String bankName,
    List<PageRouteInfo>? children,
  }) : super(
          WithdrawRoute.name,
          args: WithdrawRouteArgs(
            key: key,
            name: name,
            accNumber: accNumber,
            bankName: bankName,
          ),
          initialChildren: children,
        );

  static const String name = 'WithdrawRoute';

  static const PageInfo<WithdrawRouteArgs> page =
      PageInfo<WithdrawRouteArgs>(name);
}

class WithdrawRouteArgs {
  const WithdrawRouteArgs({
    this.key,
    required this.name,
    required this.accNumber,
    required this.bankName,
  });

  final Key? key;

  final String name;

  final String accNumber;

  final String bankName;

  @override
  String toString() {
    return 'WithdrawRouteArgs{key: $key, name: $name, accNumber: $accNumber, bankName: $bankName}';
  }
}

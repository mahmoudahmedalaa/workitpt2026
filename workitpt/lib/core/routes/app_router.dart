import 'dart:io';

import 'package:workitpt/features/payment/presentation/ui/payment_detail_form_view.dart';
import 'package:workitpt/features/payment/presentation/ui/payment_receipt_view.dart';
import 'package:workitpt/features/payment/presentation/ui/review_payment_view.dart';
import 'package:workitpt/features/wallet/presentation/ui/wallet_view.dart';
import 'package:workitpt/features/wallet/presentation/ui/withdraw_view.dart';

import '../../features/authentication/forgot_password/presentation/ui/forgot_password_view.dart';
import '../../features/authentication/login/presentation/ui/login_view.dart';
import '../../features/authentication/reset_password/presentation/ui/reset_password.dart';
import '../../features/authentication/session/i_session_manager.dart';
import '../../features/authentication/signup/presentation/pages/all_done_view.dart';
import '../../features/authentication/signup/presentation/pages/signup_additional_view.dart';
import '../../features/authentication/signup/presentation/pages/signup_view.dart';
import '../../features/authentication/signup/presentation/widget/map_page.dart';
import '../../features/authentication/signup_trainer/presentation/pages/signup_trainer_view.dart';
import '../../features/authentication/signup_trainer/presentation/pages/terms_view.dart';
import '../../features/authentication/verify_number/verify_number/presentation/pages/otp_verification_view.dart';
import '../../features/authentication/verify_number/verify_number/presentation/pages/otp_verified_page.dart';
import '../../features/authentication/verify_number/verify_number/presentation/pages/verify_number_view.dart';
import '../../features/booking/data/model/booking_model.dart';
import '../../features/booking/presentation/booking_detail_view.dart';
import '../../features/booking/presentation/booking_view.dart';
import '../../features/booking/presentation/pending_payment_view.dart';
import '../../features/calendar/presentation/view/calendar_view.dart';
import '../../features/chat/presentation/pages/chat_view.dart';
import '../../features/chat/presentation/pages/in_chat_view.dart';
import '../../features/customer/data/model/customer_model.dart';
import '../../features/customer/presentation/view/customer_detail_view.dart';
import '../../features/customer/presentation/view/customer_view.dart';
import '../../features/dashboard/presentation/ui/dashboard_view.dart';
import '../../features/home/data/model/analytics_model.dart';
import '../../features/home/presentation/pages/analytics_view.dart';
import '../../features/home/presentation/pages/completed_session_view.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/home/presentation/pages/upcoming_session_view.dart';
import '../../features/home/presentation/pages/user_home_view.dart';
import '../../features/notifications/presentation/ui/notification_view.dart';
import '../../features/onboarding/presentation/on_boarding_view.dart';
import '../../features/payment/presentation/ui/add_card_view.dart';
import '../../features/payment/presentation/ui/payment_card_view.dart';
import '../../features/payment/presentation/ui/payment_success_view.dart';
import '../../features/payment/presentation/widgets/pdf_view.dart';
import '../../features/profile/data/models/profile_model.dart';
import '../../features/profile/presentation/pages/change_password_view.dart';
import '../../features/profile/presentation/pages/contact_view.dart';
import '../../features/profile/presentation/pages/edit_profile_view.dart';
import '../../features/profile/presentation/pages/profile_help_view.dart';
import '../../features/profile/presentation/pages/profile_view.dart';
import '../../features/profile/presentation/pages/terms_web_view.dart';
import '../../features/profile/presentation/pages/trainer_image_view.dart';
import '../../features/sessions/data/models/session_response_model.dart';
import '../../features/sessions/presentation/bloc/session_bloc.dart';
import '../../features/sessions/presentation/pages/trainer_session/add_session_view.dart';
import '../../features/sessions/presentation/pages/trainer_session/previous_session_view.dart';
import '../../features/sessions/presentation/pages/trainer_session/trainer_session_detail_view.dart';
import '../../features/sessions/presentation/pages/trainer_session/trainer_session_edit_view.dart';
import '../../features/sessions/presentation/pages/trainer_session/trainer_session_view.dart';
import '../../features/sessions/presentation/pages/user_session/rating_list_view.dart';
import '../../features/sessions/presentation/pages/user_session/rating_view.dart';
import '../../features/sessions/presentation/pages/user_session/session_booking_view.dart';
import '../../features/sessions/presentation/pages/user_session/user_session_detail_view.dart';
import '../../features/sessions/presentation/pages/user_session/user_session_view.dart';
import '../../features/splash/splash_view.dart';
import '../../features/trainer/data/models/trainer_model.dart';
import '../../features/trainer/presentation/view/trainer_detail_view.dart';
import '../../features/trainer/presentation/view/trainer_view.dart';
import '../../features/wallet/data/models/withdraw_model.dart';
import '../../features/wallet/presentation/bloc/wallet_bloc.dart';
import '../../features/wallet/presentation/ui/withdraw_summary_view.dart';
import '../export.dart';
import 'auth_guard.dart';

part 'app_router.gr.dart';

// @AutoRouterConfig()
// class AppRouter extends $AppRouter {
//   @override
//   RouteType get defaultRouteType => const RouteType.adaptive();
//   final List<AutoRoute> routes = [
//     AutoRoute(page: DashboardView.page, guards: [AuthGuard], path: '/'),
//     AutoRoute(page: LoginView.page, path: '/'),
//     AutoRoute(page: SignupView.page, path: '/'),
//     AutoRoute(page: VerifyNumberPage.page, path: '/'),
//   ];
// }

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  final ISessionManager _sessionManager;

  AppRouter(this._sessionManager);

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        // AutoRoute(
        //     page: DashboardView.page, guards: const [AuthGuard], path: '/'),
        // AutoRoute(page: LoginView.page, path: '/'),
        // AutoRoute(page: SignupView.page, path: '/'),
        // AutoRoute(page: VerifyNumberPage.page, path: '/'),
        AutoRoute(
          page: SplashRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: SignupAdditionalRoute.page,
        ),
        AutoRoute(
          page: MapRoute.page,
        ),
        // AutoRoute(
        //   page: EReceiptRoute.page,
        // ),
        AutoRoute(
          page: OnBoardingRoute.page,
        ),
        AutoRoute(
          page: CompletedSessionRoute.page,
        ),
        AutoRoute(
          page: UpcomingSessionRoute.page,
        ),
        AutoRoute(
          page: RatingRoute.page,
        ),
        AutoRoute(
          page: RatingListRoute.page,
        ),
        AutoRoute(
          page: LoginRoute.page,
          guards: [
            AuthGuard(_sessionManager),
          ],
        ),
        AutoRoute(
          page: SignupRoute.page,
          guards: [
            AuthGuard(_sessionManager),
          ],
        ),
        AutoRoute(
          page: SignupTrainerRoute.page,
        ),
        AutoRoute(
          page: ProfileHelpRoute.page,
        ),
        AutoRoute(
          page: TrainerImageRoute.page,
        ),
        AutoRoute(
          page: ChatRoute.page,
        ),
        AutoRoute(
          page: NotificationRoute.page,
        ),
        AutoRoute(
          page: InChatRoute.page,
        ),
        AutoRoute(
          page: PendingPaymentRoute.page,
        ),
        AutoRoute(
          page: BookingDetailsRoute.page,
        ),
        AutoRoute(
          page: TrainerSessionEditRoute.page,
        ),
        AutoRoute(
          page: SessionBookingRoute.page,
        ),
        AutoRoute(
          page: AllDoneRoute.page,
        ),
        AutoRoute(
          page: PaymentSuccessRoute.page,
        ),
        AutoRoute(
          page: OTPVerifiedRoute.page,
        ),
        AutoRoute(
          page: AnalyticsRoute.page,
        ),
        AutoRoute(
          page: TermsRoute.page,
        ),
        AutoRoute(
          page: VerifyNumberRoute.page,
        ),
        AutoRoute(
          page: BookingRoute.page,
        ),
        AutoRoute(
          page: WalletRoute.page,
        ),
        AutoRoute(
          page: WithdrawRoute.page,
        ),
        AutoRoute(
          page: WithdrawSummaryRoute.page,
        ),
        //Payment Routes
        AutoRoute(
          page: PaymentCardRoute.page,
        ),
        AutoRoute(
          page: AppPDFRoute.page,
        ),
        AutoRoute(
          page: AddCardRoute.page,
        ),
        AutoRoute(
          page: PaymentReviewRoute.page,
        ),
        AutoRoute(
          page: PaymentDetailFormRoute.page,
        ),
        AutoRoute(
          page: PaymentReceiptRoute.page,
        ),
        AutoRoute(
          page: EditProfileRoute.page,
        ),
        AutoRoute(
          page: AddSesssionRoute.page,
        ),
        AutoRoute(
          // path: 'posts',
          page: UserSessionDetailRoute.page,
        ),
        AutoRoute(
          // path: 'posts',
          page: PreviousSessionRoute.page,
        ),
        AutoRoute(
          // path: 'posts',
          page: TrainerSessionDetailRoute.page,
        ),
        AutoRoute(
          page: CustomerDetailRoute.page,
        ),
        AutoRoute(
          page: TrainerDetailRoute.page,
        ),
        AutoRoute(
          page: TermsWebRoute.page,
        ),
        AutoRoute(page: OTPVerificationRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(
          page: ContactRoute.page,
        ),
        AutoRoute(page: DashboardRoute.page, children: [
          AutoRoute(
            // path: 'users',
            page: HomeRoute.page,
          ),
          AutoRoute(
            // path: 'posts',
            page: UserHomeRoute.page,
          ),
          AutoRoute(
            // path: 'posts',
            page: TrainerSessionRoute.page,
          ),
          AutoRoute(
            // path: 'users',
            page: CustomerRoute.page,
          ),
          AutoRoute(
            // path: 'users',
            page: TrainerRoute.page,
          ),
          AutoRoute(
            // path: 'posts',
            page: CalendarRoute.page,
          ),
          AutoRoute(
            // path: 'posts',
            page: UserSessionRoute.page,
          ),
          AutoRoute(
            // path: 'users',
            page: ProfileRoute.page,
          ),
        ]),
      ];
}

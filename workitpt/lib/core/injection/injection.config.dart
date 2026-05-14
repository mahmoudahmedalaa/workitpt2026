// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_rest_client/flutter_rest_client.dart' as _i13;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;
import 'package:workitpt/config/app_config.dart' as _i3;
import 'package:workitpt/core/injection/local_module.dart' as _i76;
import 'package:workitpt/core/injection/register_module.dart' as _i77;
import 'package:workitpt/core/network/file_upload_config.dart' as _i15;
import 'package:workitpt/core/network/http_config.dart' as _i16;
import 'package:workitpt/core/network/http_helper_event_listener.dart' as _i14;
import 'package:workitpt/core/routes/auth_guard.dart' as _i10;
import 'package:workitpt/core/widgets/localization/bloc/localization_bloc.dart'
    as _i7;
import 'package:workitpt/core/widgets/theme/bloc/theme_switch_bloc.dart' as _i9;
import 'package:workitpt/features/authentication/forgot_password/data/repositories/forgot_password_repository.dart'
    as _i42;
import 'package:workitpt/features/authentication/forgot_password/domain/controller/forgot_password_controller.dart'
    as _i66;
import 'package:workitpt/features/authentication/forgot_password/domain/repositories/i_forgot_password_repository.dart'
    as _i41;
import 'package:workitpt/features/authentication/forgot_password/presentation/bloc/forgot_password_bloc.dart'
    as _i74;
import 'package:workitpt/features/authentication/login/data/repositories/auth_remote_repository.dart'
    as _i34;
import 'package:workitpt/features/authentication/login/domain/controller/auth_login_controller.dart'
    as _i62;
import 'package:workitpt/features/authentication/login/domain/repositories/i_auth_repository.dart'
    as _i33;
import 'package:workitpt/features/authentication/login/presentation/bloc/auth_bloc.dart'
    as _i70;
import 'package:workitpt/features/authentication/login/social/data/repository/i_social_repository.dart'
    as _i50;
import 'package:workitpt/features/authentication/login/social/data/repository/social_auth_repository.dart'
    as _i51;
import 'package:workitpt/features/authentication/login/social/presentation/social_bloc.dart'
    as _i58;
import 'package:workitpt/features/authentication/session/app_manager.dart'
    as _i12;
import 'package:workitpt/features/authentication/session/i_app_manager.dart'
    as _i11;
import 'package:workitpt/features/authentication/session/i_session_manager.dart'
    as _i5;
import 'package:workitpt/features/authentication/session/session_manager.dart'
    as _i6;
import 'package:workitpt/features/authentication/signup/data/repository/user_signup_repository.dart'
    as _i26;
import 'package:workitpt/features/authentication/signup/domain/controller/i_user_signup_controller.dart'
    as _i27;
import 'package:workitpt/features/authentication/signup/domain/repository/i_user_signup_repository.dart'
    as _i25;
import 'package:workitpt/features/authentication/signup/presentation/bloc/user_signup_bloc.dart'
    as _i32;
import 'package:workitpt/features/authentication/verify_number/verify_number/data/repositories/verify_number_repository.dart'
    as _i29;
import 'package:workitpt/features/authentication/verify_number/verify_number/domain/controller/verify_number_controller.dart'
    as _i53;
import 'package:workitpt/features/authentication/verify_number/verify_number/domain/repositories/i_verify_number_repository.dart'
    as _i28;
import 'package:workitpt/features/authentication/verify_number/verify_number/presentation/bloc/verify_number_bloc.dart'
    as _i60;
import 'package:workitpt/features/booking/data/repository/booking_repository.dart'
    as _i36;
import 'package:workitpt/features/booking/domain/controller/i_booking_controller.dart'
    as _i63;
import 'package:workitpt/features/booking/domain/repository/i_booking_repository.dart'
    as _i35;
import 'package:workitpt/features/booking/presentation/bloc/booking_bloc.dart'
    as _i71;
import 'package:workitpt/features/chat/data/repository/chat_repo.dart' as _i38;
import 'package:workitpt/features/chat/domain/controller/i_chat_cont.dart'
    as _i64;
import 'package:workitpt/features/chat/domain/repository/i_chat_repo.dart'
    as _i37;
import 'package:workitpt/features/chat/presentation/bloc/chat_bloc.dart'
    as _i72;
import 'package:workitpt/features/customer/data/repository/customer_repository.dart'
    as _i40;
import 'package:workitpt/features/customer/domain/controller/i_customer_controller.dart'
    as _i65;
import 'package:workitpt/features/customer/domain/repository/i_customer_repository.dart'
    as _i39;
import 'package:workitpt/features/customer/presentation/bloc/customer_bloc.dart'
    as _i73;
import 'package:workitpt/features/home/data/repository/home_repository.dart'
    as _i44;
import 'package:workitpt/features/home/domain/controller/i_home_controller.dart'
    as _i67;
import 'package:workitpt/features/home/domain/repository/i_home_repository.dart'
    as _i43;
import 'package:workitpt/features/home/presentation/bloc/home_bloc.dart'
    as _i75;
import 'package:workitpt/features/notifications/data/repository/notification_repository.dart'
    as _i18;
import 'package:workitpt/features/notifications/domain/controller/i_notification_controller.dart'
    as _i45;
import 'package:workitpt/features/notifications/domain/repository/i_notification_repository.dart'
    as _i17;
import 'package:workitpt/features/notifications/presentation/bloc/notification_bloc.dart'
    as _i55;
import 'package:workitpt/features/payment/data/repository/payment_repository.dart'
    as _i20;
import 'package:workitpt/features/payment/domain/controller/i_payment_controller.dart'
    as _i46;
import 'package:workitpt/features/payment/domain/repository/i_payment_repository.dart'
    as _i19;
import 'package:workitpt/features/payment/presentation/bloc/payment_bloc.dart'
    as _i56;
import 'package:workitpt/features/profile/data/repository/profile_repository.dart'
    as _i48;
import 'package:workitpt/features/profile/domain/controller/i_profile_controller.dart'
    as _i68;
import 'package:workitpt/features/profile/domain/repository/i_profile_repository.dart'
    as _i47;
import 'package:workitpt/features/profile/presentation/bloc/profile_bloc.dart'
    as _i69;
import 'package:workitpt/features/sessions/data/repository/session_repository.dart'
    as _i22;
import 'package:workitpt/features/sessions/domain/controller/i_session_controller.dart'
    as _i49;
import 'package:workitpt/features/sessions/domain/repository/i_session_repository.dart'
    as _i21;
import 'package:workitpt/features/sessions/presentation/bloc/session_bloc.dart'
    as _i57;
import 'package:workitpt/features/trainer/data/repository/trainer_repository.dart'
    as _i24;
import 'package:workitpt/features/trainer/domain/controller/i_trainer_controller.dart'
    as _i52;
import 'package:workitpt/features/trainer/domain/repository/i_trainer_repository.dart'
    as _i23;
import 'package:workitpt/features/trainer/presentation/bloc/trainer_bloc.dart'
    as _i59;
import 'package:workitpt/features/wallet/data/repository/wallet_repository.dart'
    as _i31;
import 'package:workitpt/features/wallet/domain/controller/i_wallet_controller.dart'
    as _i54;
import 'package:workitpt/features/wallet/domain/repository/i_wallet_repository.dart'
    as _i30;
import 'package:workitpt/features/wallet/presentation/bloc/wallet_bloc.dart'
    as _i61;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final localModule = _$LocalModule();
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AppConfig>(() => _i3.AppConfig());
    gh.singleton<_i4.FlutterSecureStorage>(localModule.secureStorage());
    gh.factory<_i5.ISessionManager>(
        () => _i6.SessionManager(gh<_i4.FlutterSecureStorage>()));
    gh.factory<_i7.LocalizationBloc>(
        () => _i7.LocalizationBloc(gh<_i5.ISessionManager>()));
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => localModule.prefs,
      preResolve: true,
    );
    gh.factory<_i9.ThemeSwitchBloc>(
        () => _i9.ThemeSwitchBloc(gh<_i5.ISessionManager>()));
    gh.factory<_i10.AuthGuard>(() => _i10.AuthGuard(gh<_i5.ISessionManager>()));
    gh.factory<_i11.IAppManager>(
        () => _i12.AppManager(gh<_i8.SharedPreferences>()));
    gh.factory<_i13.IHttpHelperEventListening>(
        () => _i14.HttpHelperEventListener(gh<_i5.ISessionManager>()));
    gh.factory<_i13.IHttpConfig>(
      () => _i15.FileUploadConfig(
        gh<_i3.AppConfig>(),
        gh<_i5.ISessionManager>(),
        gh<_i13.IHttpHelperEventListening>(),
      ),
      instanceName: 'uploadConfig',
    );
    gh.singleton<_i13.IHttpConfig>(
      _i16.HttpConfig(
        gh<_i3.AppConfig>(),
        gh<_i5.ISessionManager>(),
        gh<_i13.IHttpHelperEventListening>(),
      ),
      instanceName: 'httpConfig',
    );
    gh.factory<_i13.IHttpHelper>(() => registerModule
        .httpHelper(gh<_i13.IHttpConfig>(instanceName: 'httpConfig')));
    gh.factory<_i17.INotificationRepository>(
        () => _i18.NotificationRepository(gh<_i13.IHttpHelper>()));
    gh.factory<_i19.IPaymentRepository>(() => _i20.PaymentRepository(
          gh<_i13.IHttpHelper>(),
          gh<_i3.AppConfig>(),
        ));
    gh.factory<_i21.ISessionRepository>(
        () => _i22.SessionRepository(gh<_i13.IHttpHelper>()));
    gh.factory<_i23.ITrainerRepository>(
        () => _i24.TrainerRepository(gh<_i13.IHttpHelper>()));
    gh.factory<_i25.IUserSignUpRepository>(
        () => _i26.CheckoutRepository(gh<_i13.IHttpHelper>()));
    gh.factory<_i27.IUserSignupController>(() => _i27.UserSignUpController(
          gh<_i25.IUserSignUpRepository>(),
          gh<_i5.ISessionManager>(),
        ));
    gh.factory<_i28.IVerifyNumberRepository>(
        () => _i29.VerifyNumberRepository(gh<_i13.IHttpHelper>()));
    gh.factory<_i30.IWalletRepository>(
        () => _i31.WalletRepository(gh<_i13.IHttpHelper>()));
    gh.factory<_i32.UserSignupBloc>(() => _i32.UserSignupBloc(
          gh<_i27.IUserSignupController>(),
          gh<_i5.ISessionManager>(),
        ));
    gh.factory<_i33.IAuthRepository>(
        () => _i34.AuthRemoteRepository(gh<_i13.IHttpHelper>()));
    gh.factory<_i35.IBookingRepository>(
        () => _i36.BookingRepository(gh<_i13.IHttpHelper>()));
    gh.factory<_i37.IChatRepository>(() => _i38.ChatRepository(
          gh<_i13.IHttpHelper>(),
          gh<_i5.ISessionManager>(),
        ));
    gh.factory<_i39.ICustomerRepository>(
        () => _i40.CustomerRepository(gh<_i13.IHttpHelper>()));
    gh.factory<_i13.IFileUploadRepository>(() =>
        registerModule.fileUploadRepository(
            gh<_i13.IHttpConfig>(instanceName: 'uploadConfig')));
    gh.factory<_i41.IForgotPasswordRepository>(
        () => _i42.ForgotPasswordRepository(gh<_i13.IHttpHelper>()));
    gh.factory<_i43.IHomeRepository>(
        () => _i44.HomeRepository(gh<_i13.IHttpHelper>()));
    gh.factory<_i45.INotificationController>(
        () => _i45.NotificationController(gh<_i17.INotificationRepository>()));
    gh.factory<_i46.IPaymentController>(
        () => _i46.PaymentController(gh<_i19.IPaymentRepository>()));
    gh.factory<_i47.IProfileRepository>(() => _i48.ProfileRepository(
          gh<_i13.IHttpHelper>(),
          gh<_i13.IFileUploadRepository>(),
        ));
    gh.factory<_i49.ISessionController>(
        () => _i49.SessionController(gh<_i21.ISessionRepository>()));
    gh.factory<_i50.ISocialAuthRepository>(() => _i51.SocialAuthRepository(
          gh<_i33.IAuthRepository>(),
          gh<_i5.ISessionManager>(),
        ));
    gh.factory<_i52.ITrainerController>(
        () => _i52.TrainerController(gh<_i23.ITrainerRepository>()));
    gh.factory<_i53.IVerifyNumberController>(
        () => _i53.VerifyNumberController(gh<_i28.IVerifyNumberRepository>()));
    gh.factory<_i54.IWalletController>(
        () => _i54.WalletController(gh<_i30.IWalletRepository>()));
    gh.factory<_i55.NotificationBloc>(
        () => _i55.NotificationBloc(gh<_i45.INotificationController>()));
    gh.factory<_i56.PaymentBloc>(
        () => _i56.PaymentBloc(gh<_i46.IPaymentController>()));
    gh.factory<_i57.SessionBloc>(
        () => _i57.SessionBloc(gh<_i49.ISessionController>()));
    gh.factory<_i58.SocialBloc>(() => _i58.SocialBloc(
          gh<_i50.ISocialAuthRepository>(),
          gh<_i5.ISessionManager>(),
        ));
    gh.factory<_i59.TrainerBloc>(
        () => _i59.TrainerBloc(gh<_i52.ITrainerController>()));
    gh.factory<_i60.VerifyNumberBloc>(
        () => _i60.VerifyNumberBloc(gh<_i53.IVerifyNumberController>()));
    gh.factory<_i61.WalletBloc>(
        () => _i61.WalletBloc(gh<_i54.IWalletController>()));
    gh.factory<_i62.IAuthLoginController>(() => _i62.AuthLoginController(
          gh<_i33.IAuthRepository>(),
          gh<_i5.ISessionManager>(),
        ));
    gh.factory<_i63.IBookingController>(
        () => _i63.BookingController(gh<_i35.IBookingRepository>()));
    gh.factory<_i64.IChatController>(
        () => _i64.ChatController(gh<_i37.IChatRepository>()));
    gh.factory<_i65.ICustomerController>(
        () => _i65.CustomerController(gh<_i39.ICustomerRepository>()));
    gh.factory<_i66.IForgotPasswordController>(
        () => _i66.ForgotPasswordController(
              gh<_i41.IForgotPasswordRepository>(),
              gh<_i5.ISessionManager>(),
            ));
    gh.factory<_i67.IHomeController>(
        () => _i67.HomeController(gh<_i43.IHomeRepository>()));
    gh.factory<_i68.IProfileController>(
        () => _i68.ProfileController(gh<_i47.IProfileRepository>()));
    gh.factory<_i69.ProfileBloc>(() => _i69.ProfileBloc(
          gh<_i68.IProfileController>(),
          gh<_i5.ISessionManager>(),
        ));
    gh.factory<_i70.AuthBloc>(() => _i70.AuthBloc(
          gh<_i62.IAuthLoginController>(),
          gh<_i5.ISessionManager>(),
        ));
    gh.factory<_i71.BookingBloc>(
        () => _i71.BookingBloc(gh<_i63.IBookingController>()));
    gh.factory<_i72.ChatBloc>(() => _i72.ChatBloc(gh<_i64.IChatController>()));
    gh.factory<_i73.CustomerBloc>(
        () => _i73.CustomerBloc(gh<_i65.ICustomerController>()));
    gh.factory<_i74.ForgotPasswordBloc>(
        () => _i74.ForgotPasswordBloc(gh<_i66.IForgotPasswordController>()));
    gh.factory<_i75.HomeBloc>(() => _i75.HomeBloc(gh<_i67.IHomeController>()));
    return this;
  }
}

class _$LocalModule extends _i76.LocalModule {}

class _$RegisterModule extends _i77.RegisterModule {}

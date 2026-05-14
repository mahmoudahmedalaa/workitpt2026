import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workitpt/core/utils/concat_image_url.dart';
import 'package:workitpt/features/customer/data/model/customer_model.dart';
import 'package:workitpt/features/home/presentation/widgets/pending_payment_card.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/widgets/base_view.dart';
import '../../../profile/data/models/profile_model.dart';
import '../../../trainer/presentation/widgets/specialization_chip.dart';
import '../bloc/customer_bloc.dart';

@RoutePage()
class CustomerDetailView extends StatefulWidget {
  final CustomerModel model;
  const CustomerDetailView({super.key, required this.model});

  @override
  State<CustomerDetailView> createState() => _CustomerDetailViewState();
}

class _CustomerDetailViewState extends State<CustomerDetailView> {
  CustomerBloc customerBloc = getIt<CustomerBloc>();

  @override
  void initState() {
    customerBloc.add(CustomerEvent.getCustomerDetail(widget.model.id!));
    super.initState();
  }

  Widget getChip(String chipTitle) {
    return Chip(
      label: Container(
        constraints: BoxConstraints(
          maxWidth: 100,
        ),
        margin: EdgeInsets.only(),
        child: Text(
          chipTitle,
          style: AppTextStyle.tinySMRegular.copyWith(color: colorPrimary),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      padding: const EdgeInsets.all(2),
      backgroundColor: colorPrimary.withOpacity(0.2),
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      visualDensity: const VisualDensity(
        vertical: VisualDensity.minimumDensity,
        horizontal: VisualDensity.minimumDensity,
      ),
    );
  }

  List<Widget> getSpecializationChipList(Location? location) {
    List<Widget> chipList = [];
    if (location != null) {
      if (location.home!.name != null && location.home!.name!.isNotEmpty) {
        chipList.add(getChip('Home').padding(right: 4));
      }
      if (location.gym!.name != null && location.gym!.name!.isNotEmpty) {
        chipList.add(getChip('Gym').padding(right: 4));
      }
      if (location.outdoor!.name != null &&
          location.outdoor!.name!.isNotEmpty) {
        chipList.add(getChip('Outdoor').padding(right: 4));
      }
      if (location.online != null && location.online!.isNotEmpty) {
        chipList.add(getChip('Online').padding(right: 4));
      }
    }
    return chipList;
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => customerBloc,
        child: BaseView(
          titleText: 'Customer Details',
          padding: EdgeInsets.zero,
          elevation: 0,
          appBarColor: Colors.white,
          body: BlocBuilder<CustomerBloc, CustomerState>(
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
                onGetCustomerDetailSuccess: (model) {
                  EasyLoading.dismiss();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: CachedNetworkImage(
                              imageUrl:
                                  concatImageUrl(widget.model.avatar ?? ''),
                              fit: BoxFit.cover,
                              height: 180,
                            ).clipRRect(all: 8),
                          ).expanded(flex: 50),
                          horizontalMargin16,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${model.info?.customerName}',
                                style: AppTextStyle.headlineSMSemiBold.copyWith(
                                  color: const Color(0xFF1A1A1A),
                                ),
                              ).padding(bottom: 8),
                              Visibility(
                                visible: model.info!.occupation != null &&
                                    model.info!.occupation!.isNotEmpty,
                                child: Text(
                                  '${model.info?.occupation}',
                                  style: AppTextStyle.bodyMDRegular.copyWith(
                                    color: const Color(0xFF444444),
                                    letterSpacing: 0.28,
                                  ),
                                ).padding(bottom: 8),
                              ),
                              Visibility(
                                visible: model.info!.intro != null &&
                                    model.info!.intro!.isNotEmpty,
                                child: Text(
                                  '${model.info?.intro}',
                                  style: AppTextStyle.tinySMRegular.copyWith(
                                    color: darkText,
                                    letterSpacing: 0.20,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ).padding(bottom: 8),
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  ...getSpecializationChipList(
                                      model.info!.location),
                                ],
                              ),
                              verticalMargin12,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        Assets.icons.height.path,
                                        height: 22,
                                      ),
                                      horizontalMargin8,
                                      Text(
                                        '${model.info?.height ?? 'N/A'}',
                                        style: AppTextStyle.bodyLgBold,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        Assets.icons.weight.path,
                                        height: 22,
                                      ),
                                      horizontalMargin8,
                                      Text(
                                        '${model.info?.weight ?? 'N/A'}',
                                        style: AppTextStyle.bodyLgBold,
                                      )
                                    ],
                                  ),
                                ],
                              ).padding(right: 16)
                            ],
                          ).padding(top: 16).expanded(flex: 55),
                        ],
                      ),
                      verticalMargin12,
                      Text(
                        'Fitness Interest',
                        style: AppTextStyle.bodyMDSemiBold.copyWith(
                          letterSpacing: 0.28,
                        ),
                      ).padding(horizontal: 16),
                      verticalMargin8,
                      Wrap(
                        children: [
                          ...List.generate(
                            model.info?.fitnessInterest?.length ?? 0,
                            (index) => SpecializationChip(
                              chipTitle: model.info!.fitnessInterest![index],
                            ),
                          )
                        ],
                      ).padding(horizontal: 16),
                      verticalMargin16,
                      Text(
                        'Fitness Goal',
                        style: AppTextStyle.bodyMDSemiBold.copyWith(
                          letterSpacing: 0.28,
                        ),
                      ).padding(horizontal: 16),
                      verticalMargin8,
                      Text(
                        model.info?.fitnessGoal ?? 'Not added yet.',
                        maxLines: 3,
                        style: AppTextStyle.bodySMRegular
                            .copyWith(letterSpacing: 0.28, color: darkText),
                      ).padding(horizontal: 16),
                      verticalMargin16,
                      Text(
                        'Medical Conditions',
                        style: AppTextStyle.bodyMDSemiBold
                            .copyWith(letterSpacing: 0.28),
                      ).padding(horizontal: 16),
                      verticalMargin8,
                      Text(
                        model.info?.medicalCondition ?? 'Not added yet.',
                        maxLines: 3,
                        style: AppTextStyle.bodySMRegular
                            .copyWith(letterSpacing: 0.28, color: darkText),
                      ).padding(horizontal: 16),
                      verticalMargin24,
                      Text(
                        'Booked Sessions',
                        style: AppTextStyle.bodyMDSemiBold.copyWith(
                          letterSpacing: 0.28,
                        ),
                      ).padding(horizontal: 16),
                      verticalMargin16,
                      model.booking == null || model.booking!.isEmpty
                          ? Center(
                              child: Text(
                              'No Sessions found!',
                              style: AppTextStyle.bodyLgRegular
                                  .copyWith(color: colorLightGrey),
                            ))
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(
                                  right: 16, left: 16, bottom: 16),
                              itemCount: model.booking?.length,
                              itemBuilder: (context, index) =>
                                  PendingPaymentCard(
                                model: model.booking![index],
                                isTrainer: true,
                              ),
                            ),
                    ],
                  ).scrollable();
                },
              );
            },
          ),
        ),
      );
}

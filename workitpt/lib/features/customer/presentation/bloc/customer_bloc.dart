import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/customer/data/model/customer_filter_model.dart';

import '../../data/model/customer_detail_model.dart';
import '../../data/model/customer_model.dart';
import '../../domain/controller/i_customer_controller.dart';

part 'customer_bloc.freezed.dart';
part 'customer_event.dart';
part 'customer_state.dart';

@injectable
class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final ICustomerController _controller;
  CustomerBloc(this._controller) : super(_Initial()) {
    on<CustomerEvent>(
      (event, emit) async {
        emit(const CustomerState.onLoading());
        await event.when<FutureOr<void>>(
          getCustomerList: (filter) async {
            try {
              final data = await _controller.getCustomerList(filter: filter);
              data.fold((l) => emit(CustomerState.onFailure(l)), (data) {
                emit(CustomerState.onGetCustomerListSuccess(data));
              });
            } on Exception catch (e) {
              emit(CustomerState.onFailure(e.toString()));
            }
          },
          getCustomerDetail: (String id) async {
            try {
              final data = await _controller.getCustomerDetail(id);
              data.fold((l) => emit(CustomerState.onFailure(l)), (data) {
                emit(CustomerState.onGetCustomerDetailSuccess(data));
              });
            } on Exception catch (e) {
              emit(CustomerState.onFailure(e.toString()));
            }
          },
        );
      },
    );
  }
}

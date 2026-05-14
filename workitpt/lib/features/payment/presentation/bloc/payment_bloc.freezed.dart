// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AddCardModel model) addCard,
    required TResult Function() getCardList,
    required TResult Function(CheckoutCardModel model) checkoutWithCard,
    required TResult Function(GetPaymentLinkModel model) getPaymentLink,
    required TResult Function(List<String> id) getPaymentReceipt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AddCardModel model)? addCard,
    TResult? Function()? getCardList,
    TResult? Function(CheckoutCardModel model)? checkoutWithCard,
    TResult? Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult? Function(List<String> id)? getPaymentReceipt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AddCardModel model)? addCard,
    TResult Function()? getCardList,
    TResult Function(CheckoutCardModel model)? checkoutWithCard,
    TResult Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult Function(List<String> id)? getPaymentReceipt,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_onAddCard value) addCard,
    required TResult Function(_onGetCardList value) getCardList,
    required TResult Function(_onCheckoutWithCard value) checkoutWithCard,
    required TResult Function(_onGetPaymentLink value) getPaymentLink,
    required TResult Function(_onGetPaymentReceipt value) getPaymentReceipt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_onAddCard value)? addCard,
    TResult? Function(_onGetCardList value)? getCardList,
    TResult? Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult? Function(_onGetPaymentLink value)? getPaymentLink,
    TResult? Function(_onGetPaymentReceipt value)? getPaymentReceipt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_onAddCard value)? addCard,
    TResult Function(_onGetCardList value)? getCardList,
    TResult Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult Function(_onGetPaymentLink value)? getPaymentLink,
    TResult Function(_onGetPaymentReceipt value)? getPaymentReceipt,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentEventCopyWith<$Res> {
  factory $PaymentEventCopyWith(
          PaymentEvent value, $Res Function(PaymentEvent) then) =
      _$PaymentEventCopyWithImpl<$Res, PaymentEvent>;
}

/// @nodoc
class _$PaymentEventCopyWithImpl<$Res, $Val extends PaymentEvent>
    implements $PaymentEventCopyWith<$Res> {
  _$PaymentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'PaymentEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AddCardModel model) addCard,
    required TResult Function() getCardList,
    required TResult Function(CheckoutCardModel model) checkoutWithCard,
    required TResult Function(GetPaymentLinkModel model) getPaymentLink,
    required TResult Function(List<String> id) getPaymentReceipt,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AddCardModel model)? addCard,
    TResult? Function()? getCardList,
    TResult? Function(CheckoutCardModel model)? checkoutWithCard,
    TResult? Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult? Function(List<String> id)? getPaymentReceipt,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AddCardModel model)? addCard,
    TResult Function()? getCardList,
    TResult Function(CheckoutCardModel model)? checkoutWithCard,
    TResult Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult Function(List<String> id)? getPaymentReceipt,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_onAddCard value) addCard,
    required TResult Function(_onGetCardList value) getCardList,
    required TResult Function(_onCheckoutWithCard value) checkoutWithCard,
    required TResult Function(_onGetPaymentLink value) getPaymentLink,
    required TResult Function(_onGetPaymentReceipt value) getPaymentReceipt,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_onAddCard value)? addCard,
    TResult? Function(_onGetCardList value)? getCardList,
    TResult? Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult? Function(_onGetPaymentLink value)? getPaymentLink,
    TResult? Function(_onGetPaymentReceipt value)? getPaymentReceipt,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_onAddCard value)? addCard,
    TResult Function(_onGetCardList value)? getCardList,
    TResult Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult Function(_onGetPaymentLink value)? getPaymentLink,
    TResult Function(_onGetPaymentReceipt value)? getPaymentReceipt,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PaymentEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$onAddCardImplCopyWith<$Res> {
  factory _$$onAddCardImplCopyWith(
          _$onAddCardImpl value, $Res Function(_$onAddCardImpl) then) =
      __$$onAddCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddCardModel model});
}

/// @nodoc
class __$$onAddCardImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$onAddCardImpl>
    implements _$$onAddCardImplCopyWith<$Res> {
  __$$onAddCardImplCopyWithImpl(
      _$onAddCardImpl _value, $Res Function(_$onAddCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onAddCardImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AddCardModel,
    ));
  }
}

/// @nodoc

class _$onAddCardImpl implements _onAddCard {
  const _$onAddCardImpl(this.model);

  @override
  final AddCardModel model;

  @override
  String toString() {
    return 'PaymentEvent.addCard(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onAddCardImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onAddCardImplCopyWith<_$onAddCardImpl> get copyWith =>
      __$$onAddCardImplCopyWithImpl<_$onAddCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AddCardModel model) addCard,
    required TResult Function() getCardList,
    required TResult Function(CheckoutCardModel model) checkoutWithCard,
    required TResult Function(GetPaymentLinkModel model) getPaymentLink,
    required TResult Function(List<String> id) getPaymentReceipt,
  }) {
    return addCard(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AddCardModel model)? addCard,
    TResult? Function()? getCardList,
    TResult? Function(CheckoutCardModel model)? checkoutWithCard,
    TResult? Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult? Function(List<String> id)? getPaymentReceipt,
  }) {
    return addCard?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AddCardModel model)? addCard,
    TResult Function()? getCardList,
    TResult Function(CheckoutCardModel model)? checkoutWithCard,
    TResult Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult Function(List<String> id)? getPaymentReceipt,
    required TResult orElse(),
  }) {
    if (addCard != null) {
      return addCard(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_onAddCard value) addCard,
    required TResult Function(_onGetCardList value) getCardList,
    required TResult Function(_onCheckoutWithCard value) checkoutWithCard,
    required TResult Function(_onGetPaymentLink value) getPaymentLink,
    required TResult Function(_onGetPaymentReceipt value) getPaymentReceipt,
  }) {
    return addCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_onAddCard value)? addCard,
    TResult? Function(_onGetCardList value)? getCardList,
    TResult? Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult? Function(_onGetPaymentLink value)? getPaymentLink,
    TResult? Function(_onGetPaymentReceipt value)? getPaymentReceipt,
  }) {
    return addCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_onAddCard value)? addCard,
    TResult Function(_onGetCardList value)? getCardList,
    TResult Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult Function(_onGetPaymentLink value)? getPaymentLink,
    TResult Function(_onGetPaymentReceipt value)? getPaymentReceipt,
    required TResult orElse(),
  }) {
    if (addCard != null) {
      return addCard(this);
    }
    return orElse();
  }
}

abstract class _onAddCard implements PaymentEvent {
  const factory _onAddCard(final AddCardModel model) = _$onAddCardImpl;

  AddCardModel get model;
  @JsonKey(ignore: true)
  _$$onAddCardImplCopyWith<_$onAddCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetCardListImplCopyWith<$Res> {
  factory _$$onGetCardListImplCopyWith(
          _$onGetCardListImpl value, $Res Function(_$onGetCardListImpl) then) =
      __$$onGetCardListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$onGetCardListImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$onGetCardListImpl>
    implements _$$onGetCardListImplCopyWith<$Res> {
  __$$onGetCardListImplCopyWithImpl(
      _$onGetCardListImpl _value, $Res Function(_$onGetCardListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$onGetCardListImpl implements _onGetCardList {
  const _$onGetCardListImpl();

  @override
  String toString() {
    return 'PaymentEvent.getCardList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$onGetCardListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AddCardModel model) addCard,
    required TResult Function() getCardList,
    required TResult Function(CheckoutCardModel model) checkoutWithCard,
    required TResult Function(GetPaymentLinkModel model) getPaymentLink,
    required TResult Function(List<String> id) getPaymentReceipt,
  }) {
    return getCardList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AddCardModel model)? addCard,
    TResult? Function()? getCardList,
    TResult? Function(CheckoutCardModel model)? checkoutWithCard,
    TResult? Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult? Function(List<String> id)? getPaymentReceipt,
  }) {
    return getCardList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AddCardModel model)? addCard,
    TResult Function()? getCardList,
    TResult Function(CheckoutCardModel model)? checkoutWithCard,
    TResult Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult Function(List<String> id)? getPaymentReceipt,
    required TResult orElse(),
  }) {
    if (getCardList != null) {
      return getCardList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_onAddCard value) addCard,
    required TResult Function(_onGetCardList value) getCardList,
    required TResult Function(_onCheckoutWithCard value) checkoutWithCard,
    required TResult Function(_onGetPaymentLink value) getPaymentLink,
    required TResult Function(_onGetPaymentReceipt value) getPaymentReceipt,
  }) {
    return getCardList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_onAddCard value)? addCard,
    TResult? Function(_onGetCardList value)? getCardList,
    TResult? Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult? Function(_onGetPaymentLink value)? getPaymentLink,
    TResult? Function(_onGetPaymentReceipt value)? getPaymentReceipt,
  }) {
    return getCardList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_onAddCard value)? addCard,
    TResult Function(_onGetCardList value)? getCardList,
    TResult Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult Function(_onGetPaymentLink value)? getPaymentLink,
    TResult Function(_onGetPaymentReceipt value)? getPaymentReceipt,
    required TResult orElse(),
  }) {
    if (getCardList != null) {
      return getCardList(this);
    }
    return orElse();
  }
}

abstract class _onGetCardList implements PaymentEvent {
  const factory _onGetCardList() = _$onGetCardListImpl;
}

/// @nodoc
abstract class _$$onCheckoutWithCardImplCopyWith<$Res> {
  factory _$$onCheckoutWithCardImplCopyWith(_$onCheckoutWithCardImpl value,
          $Res Function(_$onCheckoutWithCardImpl) then) =
      __$$onCheckoutWithCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CheckoutCardModel model});
}

/// @nodoc
class __$$onCheckoutWithCardImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$onCheckoutWithCardImpl>
    implements _$$onCheckoutWithCardImplCopyWith<$Res> {
  __$$onCheckoutWithCardImplCopyWithImpl(_$onCheckoutWithCardImpl _value,
      $Res Function(_$onCheckoutWithCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onCheckoutWithCardImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CheckoutCardModel,
    ));
  }
}

/// @nodoc

class _$onCheckoutWithCardImpl implements _onCheckoutWithCard {
  const _$onCheckoutWithCardImpl(this.model);

  @override
  final CheckoutCardModel model;

  @override
  String toString() {
    return 'PaymentEvent.checkoutWithCard(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onCheckoutWithCardImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onCheckoutWithCardImplCopyWith<_$onCheckoutWithCardImpl> get copyWith =>
      __$$onCheckoutWithCardImplCopyWithImpl<_$onCheckoutWithCardImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AddCardModel model) addCard,
    required TResult Function() getCardList,
    required TResult Function(CheckoutCardModel model) checkoutWithCard,
    required TResult Function(GetPaymentLinkModel model) getPaymentLink,
    required TResult Function(List<String> id) getPaymentReceipt,
  }) {
    return checkoutWithCard(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AddCardModel model)? addCard,
    TResult? Function()? getCardList,
    TResult? Function(CheckoutCardModel model)? checkoutWithCard,
    TResult? Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult? Function(List<String> id)? getPaymentReceipt,
  }) {
    return checkoutWithCard?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AddCardModel model)? addCard,
    TResult Function()? getCardList,
    TResult Function(CheckoutCardModel model)? checkoutWithCard,
    TResult Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult Function(List<String> id)? getPaymentReceipt,
    required TResult orElse(),
  }) {
    if (checkoutWithCard != null) {
      return checkoutWithCard(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_onAddCard value) addCard,
    required TResult Function(_onGetCardList value) getCardList,
    required TResult Function(_onCheckoutWithCard value) checkoutWithCard,
    required TResult Function(_onGetPaymentLink value) getPaymentLink,
    required TResult Function(_onGetPaymentReceipt value) getPaymentReceipt,
  }) {
    return checkoutWithCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_onAddCard value)? addCard,
    TResult? Function(_onGetCardList value)? getCardList,
    TResult? Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult? Function(_onGetPaymentLink value)? getPaymentLink,
    TResult? Function(_onGetPaymentReceipt value)? getPaymentReceipt,
  }) {
    return checkoutWithCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_onAddCard value)? addCard,
    TResult Function(_onGetCardList value)? getCardList,
    TResult Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult Function(_onGetPaymentLink value)? getPaymentLink,
    TResult Function(_onGetPaymentReceipt value)? getPaymentReceipt,
    required TResult orElse(),
  }) {
    if (checkoutWithCard != null) {
      return checkoutWithCard(this);
    }
    return orElse();
  }
}

abstract class _onCheckoutWithCard implements PaymentEvent {
  const factory _onCheckoutWithCard(final CheckoutCardModel model) =
      _$onCheckoutWithCardImpl;

  CheckoutCardModel get model;
  @JsonKey(ignore: true)
  _$$onCheckoutWithCardImplCopyWith<_$onCheckoutWithCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetPaymentLinkImplCopyWith<$Res> {
  factory _$$onGetPaymentLinkImplCopyWith(_$onGetPaymentLinkImpl value,
          $Res Function(_$onGetPaymentLinkImpl) then) =
      __$$onGetPaymentLinkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetPaymentLinkModel model});
}

/// @nodoc
class __$$onGetPaymentLinkImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$onGetPaymentLinkImpl>
    implements _$$onGetPaymentLinkImplCopyWith<$Res> {
  __$$onGetPaymentLinkImplCopyWithImpl(_$onGetPaymentLinkImpl _value,
      $Res Function(_$onGetPaymentLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetPaymentLinkImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as GetPaymentLinkModel,
    ));
  }
}

/// @nodoc

class _$onGetPaymentLinkImpl implements _onGetPaymentLink {
  const _$onGetPaymentLinkImpl(this.model);

  @override
  final GetPaymentLinkModel model;

  @override
  String toString() {
    return 'PaymentEvent.getPaymentLink(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetPaymentLinkImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetPaymentLinkImplCopyWith<_$onGetPaymentLinkImpl> get copyWith =>
      __$$onGetPaymentLinkImplCopyWithImpl<_$onGetPaymentLinkImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AddCardModel model) addCard,
    required TResult Function() getCardList,
    required TResult Function(CheckoutCardModel model) checkoutWithCard,
    required TResult Function(GetPaymentLinkModel model) getPaymentLink,
    required TResult Function(List<String> id) getPaymentReceipt,
  }) {
    return getPaymentLink(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AddCardModel model)? addCard,
    TResult? Function()? getCardList,
    TResult? Function(CheckoutCardModel model)? checkoutWithCard,
    TResult? Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult? Function(List<String> id)? getPaymentReceipt,
  }) {
    return getPaymentLink?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AddCardModel model)? addCard,
    TResult Function()? getCardList,
    TResult Function(CheckoutCardModel model)? checkoutWithCard,
    TResult Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult Function(List<String> id)? getPaymentReceipt,
    required TResult orElse(),
  }) {
    if (getPaymentLink != null) {
      return getPaymentLink(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_onAddCard value) addCard,
    required TResult Function(_onGetCardList value) getCardList,
    required TResult Function(_onCheckoutWithCard value) checkoutWithCard,
    required TResult Function(_onGetPaymentLink value) getPaymentLink,
    required TResult Function(_onGetPaymentReceipt value) getPaymentReceipt,
  }) {
    return getPaymentLink(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_onAddCard value)? addCard,
    TResult? Function(_onGetCardList value)? getCardList,
    TResult? Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult? Function(_onGetPaymentLink value)? getPaymentLink,
    TResult? Function(_onGetPaymentReceipt value)? getPaymentReceipt,
  }) {
    return getPaymentLink?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_onAddCard value)? addCard,
    TResult Function(_onGetCardList value)? getCardList,
    TResult Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult Function(_onGetPaymentLink value)? getPaymentLink,
    TResult Function(_onGetPaymentReceipt value)? getPaymentReceipt,
    required TResult orElse(),
  }) {
    if (getPaymentLink != null) {
      return getPaymentLink(this);
    }
    return orElse();
  }
}

abstract class _onGetPaymentLink implements PaymentEvent {
  const factory _onGetPaymentLink(final GetPaymentLinkModel model) =
      _$onGetPaymentLinkImpl;

  GetPaymentLinkModel get model;
  @JsonKey(ignore: true)
  _$$onGetPaymentLinkImplCopyWith<_$onGetPaymentLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetPaymentReceiptImplCopyWith<$Res> {
  factory _$$onGetPaymentReceiptImplCopyWith(_$onGetPaymentReceiptImpl value,
          $Res Function(_$onGetPaymentReceiptImpl) then) =
      __$$onGetPaymentReceiptImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> id});
}

/// @nodoc
class __$$onGetPaymentReceiptImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$onGetPaymentReceiptImpl>
    implements _$$onGetPaymentReceiptImplCopyWith<$Res> {
  __$$onGetPaymentReceiptImplCopyWithImpl(_$onGetPaymentReceiptImpl _value,
      $Res Function(_$onGetPaymentReceiptImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$onGetPaymentReceiptImpl(
      null == id
          ? _value._id
          : id // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$onGetPaymentReceiptImpl implements _onGetPaymentReceipt {
  const _$onGetPaymentReceiptImpl(final List<String> id) : _id = id;

  final List<String> _id;
  @override
  List<String> get id {
    if (_id is EqualUnmodifiableListView) return _id;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_id);
  }

  @override
  String toString() {
    return 'PaymentEvent.getPaymentReceipt(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetPaymentReceiptImpl &&
            const DeepCollectionEquality().equals(other._id, _id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_id));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetPaymentReceiptImplCopyWith<_$onGetPaymentReceiptImpl> get copyWith =>
      __$$onGetPaymentReceiptImplCopyWithImpl<_$onGetPaymentReceiptImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AddCardModel model) addCard,
    required TResult Function() getCardList,
    required TResult Function(CheckoutCardModel model) checkoutWithCard,
    required TResult Function(GetPaymentLinkModel model) getPaymentLink,
    required TResult Function(List<String> id) getPaymentReceipt,
  }) {
    return getPaymentReceipt(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AddCardModel model)? addCard,
    TResult? Function()? getCardList,
    TResult? Function(CheckoutCardModel model)? checkoutWithCard,
    TResult? Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult? Function(List<String> id)? getPaymentReceipt,
  }) {
    return getPaymentReceipt?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AddCardModel model)? addCard,
    TResult Function()? getCardList,
    TResult Function(CheckoutCardModel model)? checkoutWithCard,
    TResult Function(GetPaymentLinkModel model)? getPaymentLink,
    TResult Function(List<String> id)? getPaymentReceipt,
    required TResult orElse(),
  }) {
    if (getPaymentReceipt != null) {
      return getPaymentReceipt(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_onAddCard value) addCard,
    required TResult Function(_onGetCardList value) getCardList,
    required TResult Function(_onCheckoutWithCard value) checkoutWithCard,
    required TResult Function(_onGetPaymentLink value) getPaymentLink,
    required TResult Function(_onGetPaymentReceipt value) getPaymentReceipt,
  }) {
    return getPaymentReceipt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_onAddCard value)? addCard,
    TResult? Function(_onGetCardList value)? getCardList,
    TResult? Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult? Function(_onGetPaymentLink value)? getPaymentLink,
    TResult? Function(_onGetPaymentReceipt value)? getPaymentReceipt,
  }) {
    return getPaymentReceipt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_onAddCard value)? addCard,
    TResult Function(_onGetCardList value)? getCardList,
    TResult Function(_onCheckoutWithCard value)? checkoutWithCard,
    TResult Function(_onGetPaymentLink value)? getPaymentLink,
    TResult Function(_onGetPaymentReceipt value)? getPaymentReceipt,
    required TResult orElse(),
  }) {
    if (getPaymentReceipt != null) {
      return getPaymentReceipt(this);
    }
    return orElse();
  }
}

abstract class _onGetPaymentReceipt implements PaymentEvent {
  const factory _onGetPaymentReceipt(final List<String> id) =
      _$onGetPaymentReceiptImpl;

  List<String> get id;
  @JsonKey(ignore: true)
  _$$onGetPaymentReceiptImplCopyWith<_$onGetPaymentReceiptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(List<CardModel> model) onGetCardListSuccess,
    required TResult Function(CardModel model) onAddCardSuccess,
    required TResult Function(String message) onCheckoutWithCardSuccess,
    required TResult Function(String model) onGetPaymentLinkSuccess,
    required TResult Function(File model) onGetPaymentReceiptSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CardModel> model)? onGetCardListSuccess,
    TResult? Function(CardModel model)? onAddCardSuccess,
    TResult? Function(String message)? onCheckoutWithCardSuccess,
    TResult? Function(String model)? onGetPaymentLinkSuccess,
    TResult? Function(File model)? onGetPaymentReceiptSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CardModel> model)? onGetCardListSuccess,
    TResult Function(CardModel model)? onAddCardSuccess,
    TResult Function(String message)? onCheckoutWithCardSuccess,
    TResult Function(String model)? onGetPaymentLinkSuccess,
    TResult Function(File model)? onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetCardListSuccess value) onGetCardListSuccess,
    required TResult Function(_onAddCardSuccess value) onAddCardSuccess,
    required TResult Function(_onCheckoutWithCardSuccess value)
        onCheckoutWithCardSuccess,
    required TResult Function(_onGetPaymentLinkSuccess value)
        onGetPaymentLinkSuccess,
    required TResult Function(_onGetPaymentReceiptSuccess value)
        onGetPaymentReceiptSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult? Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult? Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult? Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult? Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res, PaymentState>;
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PaymentState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(List<CardModel> model) onGetCardListSuccess,
    required TResult Function(CardModel model) onAddCardSuccess,
    required TResult Function(String message) onCheckoutWithCardSuccess,
    required TResult Function(String model) onGetPaymentLinkSuccess,
    required TResult Function(File model) onGetPaymentReceiptSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CardModel> model)? onGetCardListSuccess,
    TResult? Function(CardModel model)? onAddCardSuccess,
    TResult? Function(String message)? onCheckoutWithCardSuccess,
    TResult? Function(String model)? onGetPaymentLinkSuccess,
    TResult? Function(File model)? onGetPaymentReceiptSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CardModel> model)? onGetCardListSuccess,
    TResult Function(CardModel model)? onAddCardSuccess,
    TResult Function(String message)? onCheckoutWithCardSuccess,
    TResult Function(String model)? onGetPaymentLinkSuccess,
    TResult Function(File model)? onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetCardListSuccess value) onGetCardListSuccess,
    required TResult Function(_onAddCardSuccess value) onAddCardSuccess,
    required TResult Function(_onCheckoutWithCardSuccess value)
        onCheckoutWithCardSuccess,
    required TResult Function(_onGetPaymentLinkSuccess value)
        onGetPaymentLinkSuccess,
    required TResult Function(_onGetPaymentReceiptSuccess value)
        onGetPaymentReceiptSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult? Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult? Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult? Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult? Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PaymentState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$onLoadingImplCopyWith<$Res> {
  factory _$$onLoadingImplCopyWith(
          _$onLoadingImpl value, $Res Function(_$onLoadingImpl) then) =
      __$$onLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$onLoadingImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$onLoadingImpl>
    implements _$$onLoadingImplCopyWith<$Res> {
  __$$onLoadingImplCopyWithImpl(
      _$onLoadingImpl _value, $Res Function(_$onLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$onLoadingImpl implements _onLoading {
  const _$onLoadingImpl();

  @override
  String toString() {
    return 'PaymentState.onLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$onLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(List<CardModel> model) onGetCardListSuccess,
    required TResult Function(CardModel model) onAddCardSuccess,
    required TResult Function(String message) onCheckoutWithCardSuccess,
    required TResult Function(String model) onGetPaymentLinkSuccess,
    required TResult Function(File model) onGetPaymentReceiptSuccess,
  }) {
    return onLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CardModel> model)? onGetCardListSuccess,
    TResult? Function(CardModel model)? onAddCardSuccess,
    TResult? Function(String message)? onCheckoutWithCardSuccess,
    TResult? Function(String model)? onGetPaymentLinkSuccess,
    TResult? Function(File model)? onGetPaymentReceiptSuccess,
  }) {
    return onLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CardModel> model)? onGetCardListSuccess,
    TResult Function(CardModel model)? onAddCardSuccess,
    TResult Function(String message)? onCheckoutWithCardSuccess,
    TResult Function(String model)? onGetPaymentLinkSuccess,
    TResult Function(File model)? onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetCardListSuccess value) onGetCardListSuccess,
    required TResult Function(_onAddCardSuccess value) onAddCardSuccess,
    required TResult Function(_onCheckoutWithCardSuccess value)
        onCheckoutWithCardSuccess,
    required TResult Function(_onGetPaymentLinkSuccess value)
        onGetPaymentLinkSuccess,
    required TResult Function(_onGetPaymentReceiptSuccess value)
        onGetPaymentReceiptSuccess,
  }) {
    return onLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult? Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult? Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult? Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult? Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
  }) {
    return onLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading(this);
    }
    return orElse();
  }
}

abstract class _onLoading implements PaymentState {
  const factory _onLoading() = _$onLoadingImpl;
}

/// @nodoc
abstract class _$$onFailureImplCopyWith<$Res> {
  factory _$$onFailureImplCopyWith(
          _$onFailureImpl value, $Res Function(_$onFailureImpl) then) =
      __$$onFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$onFailureImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$onFailureImpl>
    implements _$$onFailureImplCopyWith<$Res> {
  __$$onFailureImplCopyWithImpl(
      _$onFailureImpl _value, $Res Function(_$onFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$onFailureImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$onFailureImpl implements _onFailure {
  const _$onFailureImpl(this.message);

  @override
  final String? message;

  @override
  String toString() {
    return 'PaymentState.onFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onFailureImplCopyWith<_$onFailureImpl> get copyWith =>
      __$$onFailureImplCopyWithImpl<_$onFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(List<CardModel> model) onGetCardListSuccess,
    required TResult Function(CardModel model) onAddCardSuccess,
    required TResult Function(String message) onCheckoutWithCardSuccess,
    required TResult Function(String model) onGetPaymentLinkSuccess,
    required TResult Function(File model) onGetPaymentReceiptSuccess,
  }) {
    return onFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CardModel> model)? onGetCardListSuccess,
    TResult? Function(CardModel model)? onAddCardSuccess,
    TResult? Function(String message)? onCheckoutWithCardSuccess,
    TResult? Function(String model)? onGetPaymentLinkSuccess,
    TResult? Function(File model)? onGetPaymentReceiptSuccess,
  }) {
    return onFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CardModel> model)? onGetCardListSuccess,
    TResult Function(CardModel model)? onAddCardSuccess,
    TResult Function(String message)? onCheckoutWithCardSuccess,
    TResult Function(String model)? onGetPaymentLinkSuccess,
    TResult Function(File model)? onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetCardListSuccess value) onGetCardListSuccess,
    required TResult Function(_onAddCardSuccess value) onAddCardSuccess,
    required TResult Function(_onCheckoutWithCardSuccess value)
        onCheckoutWithCardSuccess,
    required TResult Function(_onGetPaymentLinkSuccess value)
        onGetPaymentLinkSuccess,
    required TResult Function(_onGetPaymentReceiptSuccess value)
        onGetPaymentReceiptSuccess,
  }) {
    return onFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult? Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult? Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult? Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult? Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
  }) {
    return onFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onFailure != null) {
      return onFailure(this);
    }
    return orElse();
  }
}

abstract class _onFailure implements PaymentState {
  const factory _onFailure(final String? message) = _$onFailureImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$onFailureImplCopyWith<_$onFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetCardListSuccessImplCopyWith<$Res> {
  factory _$$onGetCardListSuccessImplCopyWith(_$onGetCardListSuccessImpl value,
          $Res Function(_$onGetCardListSuccessImpl) then) =
      __$$onGetCardListSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CardModel> model});
}

/// @nodoc
class __$$onGetCardListSuccessImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$onGetCardListSuccessImpl>
    implements _$$onGetCardListSuccessImplCopyWith<$Res> {
  __$$onGetCardListSuccessImplCopyWithImpl(_$onGetCardListSuccessImpl _value,
      $Res Function(_$onGetCardListSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetCardListSuccessImpl(
      null == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<CardModel>,
    ));
  }
}

/// @nodoc

class _$onGetCardListSuccessImpl implements _onGetCardListSuccess {
  const _$onGetCardListSuccessImpl(final List<CardModel> model)
      : _model = model;

  final List<CardModel> _model;
  @override
  List<CardModel> get model {
    if (_model is EqualUnmodifiableListView) return _model;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_model);
  }

  @override
  String toString() {
    return 'PaymentState.onGetCardListSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetCardListSuccessImpl &&
            const DeepCollectionEquality().equals(other._model, _model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_model));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetCardListSuccessImplCopyWith<_$onGetCardListSuccessImpl>
      get copyWith =>
          __$$onGetCardListSuccessImplCopyWithImpl<_$onGetCardListSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(List<CardModel> model) onGetCardListSuccess,
    required TResult Function(CardModel model) onAddCardSuccess,
    required TResult Function(String message) onCheckoutWithCardSuccess,
    required TResult Function(String model) onGetPaymentLinkSuccess,
    required TResult Function(File model) onGetPaymentReceiptSuccess,
  }) {
    return onGetCardListSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CardModel> model)? onGetCardListSuccess,
    TResult? Function(CardModel model)? onAddCardSuccess,
    TResult? Function(String message)? onCheckoutWithCardSuccess,
    TResult? Function(String model)? onGetPaymentLinkSuccess,
    TResult? Function(File model)? onGetPaymentReceiptSuccess,
  }) {
    return onGetCardListSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CardModel> model)? onGetCardListSuccess,
    TResult Function(CardModel model)? onAddCardSuccess,
    TResult Function(String message)? onCheckoutWithCardSuccess,
    TResult Function(String model)? onGetPaymentLinkSuccess,
    TResult Function(File model)? onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onGetCardListSuccess != null) {
      return onGetCardListSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetCardListSuccess value) onGetCardListSuccess,
    required TResult Function(_onAddCardSuccess value) onAddCardSuccess,
    required TResult Function(_onCheckoutWithCardSuccess value)
        onCheckoutWithCardSuccess,
    required TResult Function(_onGetPaymentLinkSuccess value)
        onGetPaymentLinkSuccess,
    required TResult Function(_onGetPaymentReceiptSuccess value)
        onGetPaymentReceiptSuccess,
  }) {
    return onGetCardListSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult? Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult? Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult? Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult? Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
  }) {
    return onGetCardListSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onGetCardListSuccess != null) {
      return onGetCardListSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetCardListSuccess implements PaymentState {
  const factory _onGetCardListSuccess(final List<CardModel> model) =
      _$onGetCardListSuccessImpl;

  List<CardModel> get model;
  @JsonKey(ignore: true)
  _$$onGetCardListSuccessImplCopyWith<_$onGetCardListSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onAddCardSuccessImplCopyWith<$Res> {
  factory _$$onAddCardSuccessImplCopyWith(_$onAddCardSuccessImpl value,
          $Res Function(_$onAddCardSuccessImpl) then) =
      __$$onAddCardSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CardModel model});
}

/// @nodoc
class __$$onAddCardSuccessImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$onAddCardSuccessImpl>
    implements _$$onAddCardSuccessImplCopyWith<$Res> {
  __$$onAddCardSuccessImplCopyWithImpl(_$onAddCardSuccessImpl _value,
      $Res Function(_$onAddCardSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onAddCardSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CardModel,
    ));
  }
}

/// @nodoc

class _$onAddCardSuccessImpl implements _onAddCardSuccess {
  const _$onAddCardSuccessImpl(this.model);

  @override
  final CardModel model;

  @override
  String toString() {
    return 'PaymentState.onAddCardSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onAddCardSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onAddCardSuccessImplCopyWith<_$onAddCardSuccessImpl> get copyWith =>
      __$$onAddCardSuccessImplCopyWithImpl<_$onAddCardSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(List<CardModel> model) onGetCardListSuccess,
    required TResult Function(CardModel model) onAddCardSuccess,
    required TResult Function(String message) onCheckoutWithCardSuccess,
    required TResult Function(String model) onGetPaymentLinkSuccess,
    required TResult Function(File model) onGetPaymentReceiptSuccess,
  }) {
    return onAddCardSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CardModel> model)? onGetCardListSuccess,
    TResult? Function(CardModel model)? onAddCardSuccess,
    TResult? Function(String message)? onCheckoutWithCardSuccess,
    TResult? Function(String model)? onGetPaymentLinkSuccess,
    TResult? Function(File model)? onGetPaymentReceiptSuccess,
  }) {
    return onAddCardSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CardModel> model)? onGetCardListSuccess,
    TResult Function(CardModel model)? onAddCardSuccess,
    TResult Function(String message)? onCheckoutWithCardSuccess,
    TResult Function(String model)? onGetPaymentLinkSuccess,
    TResult Function(File model)? onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onAddCardSuccess != null) {
      return onAddCardSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetCardListSuccess value) onGetCardListSuccess,
    required TResult Function(_onAddCardSuccess value) onAddCardSuccess,
    required TResult Function(_onCheckoutWithCardSuccess value)
        onCheckoutWithCardSuccess,
    required TResult Function(_onGetPaymentLinkSuccess value)
        onGetPaymentLinkSuccess,
    required TResult Function(_onGetPaymentReceiptSuccess value)
        onGetPaymentReceiptSuccess,
  }) {
    return onAddCardSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult? Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult? Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult? Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult? Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
  }) {
    return onAddCardSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onAddCardSuccess != null) {
      return onAddCardSuccess(this);
    }
    return orElse();
  }
}

abstract class _onAddCardSuccess implements PaymentState {
  const factory _onAddCardSuccess(final CardModel model) =
      _$onAddCardSuccessImpl;

  CardModel get model;
  @JsonKey(ignore: true)
  _$$onAddCardSuccessImplCopyWith<_$onAddCardSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onCheckoutWithCardSuccessImplCopyWith<$Res> {
  factory _$$onCheckoutWithCardSuccessImplCopyWith(
          _$onCheckoutWithCardSuccessImpl value,
          $Res Function(_$onCheckoutWithCardSuccessImpl) then) =
      __$$onCheckoutWithCardSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$onCheckoutWithCardSuccessImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$onCheckoutWithCardSuccessImpl>
    implements _$$onCheckoutWithCardSuccessImplCopyWith<$Res> {
  __$$onCheckoutWithCardSuccessImplCopyWithImpl(
      _$onCheckoutWithCardSuccessImpl _value,
      $Res Function(_$onCheckoutWithCardSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$onCheckoutWithCardSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onCheckoutWithCardSuccessImpl implements _onCheckoutWithCardSuccess {
  const _$onCheckoutWithCardSuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'PaymentState.onCheckoutWithCardSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onCheckoutWithCardSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onCheckoutWithCardSuccessImplCopyWith<_$onCheckoutWithCardSuccessImpl>
      get copyWith => __$$onCheckoutWithCardSuccessImplCopyWithImpl<
          _$onCheckoutWithCardSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(List<CardModel> model) onGetCardListSuccess,
    required TResult Function(CardModel model) onAddCardSuccess,
    required TResult Function(String message) onCheckoutWithCardSuccess,
    required TResult Function(String model) onGetPaymentLinkSuccess,
    required TResult Function(File model) onGetPaymentReceiptSuccess,
  }) {
    return onCheckoutWithCardSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CardModel> model)? onGetCardListSuccess,
    TResult? Function(CardModel model)? onAddCardSuccess,
    TResult? Function(String message)? onCheckoutWithCardSuccess,
    TResult? Function(String model)? onGetPaymentLinkSuccess,
    TResult? Function(File model)? onGetPaymentReceiptSuccess,
  }) {
    return onCheckoutWithCardSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CardModel> model)? onGetCardListSuccess,
    TResult Function(CardModel model)? onAddCardSuccess,
    TResult Function(String message)? onCheckoutWithCardSuccess,
    TResult Function(String model)? onGetPaymentLinkSuccess,
    TResult Function(File model)? onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onCheckoutWithCardSuccess != null) {
      return onCheckoutWithCardSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetCardListSuccess value) onGetCardListSuccess,
    required TResult Function(_onAddCardSuccess value) onAddCardSuccess,
    required TResult Function(_onCheckoutWithCardSuccess value)
        onCheckoutWithCardSuccess,
    required TResult Function(_onGetPaymentLinkSuccess value)
        onGetPaymentLinkSuccess,
    required TResult Function(_onGetPaymentReceiptSuccess value)
        onGetPaymentReceiptSuccess,
  }) {
    return onCheckoutWithCardSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult? Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult? Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult? Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult? Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
  }) {
    return onCheckoutWithCardSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onCheckoutWithCardSuccess != null) {
      return onCheckoutWithCardSuccess(this);
    }
    return orElse();
  }
}

abstract class _onCheckoutWithCardSuccess implements PaymentState {
  const factory _onCheckoutWithCardSuccess(final String message) =
      _$onCheckoutWithCardSuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$onCheckoutWithCardSuccessImplCopyWith<_$onCheckoutWithCardSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetPaymentLinkSuccessImplCopyWith<$Res> {
  factory _$$onGetPaymentLinkSuccessImplCopyWith(
          _$onGetPaymentLinkSuccessImpl value,
          $Res Function(_$onGetPaymentLinkSuccessImpl) then) =
      __$$onGetPaymentLinkSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String model});
}

/// @nodoc
class __$$onGetPaymentLinkSuccessImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$onGetPaymentLinkSuccessImpl>
    implements _$$onGetPaymentLinkSuccessImplCopyWith<$Res> {
  __$$onGetPaymentLinkSuccessImplCopyWithImpl(
      _$onGetPaymentLinkSuccessImpl _value,
      $Res Function(_$onGetPaymentLinkSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetPaymentLinkSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onGetPaymentLinkSuccessImpl implements _onGetPaymentLinkSuccess {
  const _$onGetPaymentLinkSuccessImpl(this.model);

  @override
  final String model;

  @override
  String toString() {
    return 'PaymentState.onGetPaymentLinkSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetPaymentLinkSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetPaymentLinkSuccessImplCopyWith<_$onGetPaymentLinkSuccessImpl>
      get copyWith => __$$onGetPaymentLinkSuccessImplCopyWithImpl<
          _$onGetPaymentLinkSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(List<CardModel> model) onGetCardListSuccess,
    required TResult Function(CardModel model) onAddCardSuccess,
    required TResult Function(String message) onCheckoutWithCardSuccess,
    required TResult Function(String model) onGetPaymentLinkSuccess,
    required TResult Function(File model) onGetPaymentReceiptSuccess,
  }) {
    return onGetPaymentLinkSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CardModel> model)? onGetCardListSuccess,
    TResult? Function(CardModel model)? onAddCardSuccess,
    TResult? Function(String message)? onCheckoutWithCardSuccess,
    TResult? Function(String model)? onGetPaymentLinkSuccess,
    TResult? Function(File model)? onGetPaymentReceiptSuccess,
  }) {
    return onGetPaymentLinkSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CardModel> model)? onGetCardListSuccess,
    TResult Function(CardModel model)? onAddCardSuccess,
    TResult Function(String message)? onCheckoutWithCardSuccess,
    TResult Function(String model)? onGetPaymentLinkSuccess,
    TResult Function(File model)? onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onGetPaymentLinkSuccess != null) {
      return onGetPaymentLinkSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetCardListSuccess value) onGetCardListSuccess,
    required TResult Function(_onAddCardSuccess value) onAddCardSuccess,
    required TResult Function(_onCheckoutWithCardSuccess value)
        onCheckoutWithCardSuccess,
    required TResult Function(_onGetPaymentLinkSuccess value)
        onGetPaymentLinkSuccess,
    required TResult Function(_onGetPaymentReceiptSuccess value)
        onGetPaymentReceiptSuccess,
  }) {
    return onGetPaymentLinkSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult? Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult? Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult? Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult? Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
  }) {
    return onGetPaymentLinkSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onGetPaymentLinkSuccess != null) {
      return onGetPaymentLinkSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetPaymentLinkSuccess implements PaymentState {
  const factory _onGetPaymentLinkSuccess(final String model) =
      _$onGetPaymentLinkSuccessImpl;

  String get model;
  @JsonKey(ignore: true)
  _$$onGetPaymentLinkSuccessImplCopyWith<_$onGetPaymentLinkSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onGetPaymentReceiptSuccessImplCopyWith<$Res> {
  factory _$$onGetPaymentReceiptSuccessImplCopyWith(
          _$onGetPaymentReceiptSuccessImpl value,
          $Res Function(_$onGetPaymentReceiptSuccessImpl) then) =
      __$$onGetPaymentReceiptSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File model});
}

/// @nodoc
class __$$onGetPaymentReceiptSuccessImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$onGetPaymentReceiptSuccessImpl>
    implements _$$onGetPaymentReceiptSuccessImplCopyWith<$Res> {
  __$$onGetPaymentReceiptSuccessImplCopyWithImpl(
      _$onGetPaymentReceiptSuccessImpl _value,
      $Res Function(_$onGetPaymentReceiptSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$onGetPaymentReceiptSuccessImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$onGetPaymentReceiptSuccessImpl implements _onGetPaymentReceiptSuccess {
  const _$onGetPaymentReceiptSuccessImpl(this.model);

  @override
  final File model;

  @override
  String toString() {
    return 'PaymentState.onGetPaymentReceiptSuccess(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onGetPaymentReceiptSuccessImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onGetPaymentReceiptSuccessImplCopyWith<_$onGetPaymentReceiptSuccessImpl>
      get copyWith => __$$onGetPaymentReceiptSuccessImplCopyWithImpl<
          _$onGetPaymentReceiptSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onLoading,
    required TResult Function(String? message) onFailure,
    required TResult Function(List<CardModel> model) onGetCardListSuccess,
    required TResult Function(CardModel model) onAddCardSuccess,
    required TResult Function(String message) onCheckoutWithCardSuccess,
    required TResult Function(String model) onGetPaymentLinkSuccess,
    required TResult Function(File model) onGetPaymentReceiptSuccess,
  }) {
    return onGetPaymentReceiptSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onLoading,
    TResult? Function(String? message)? onFailure,
    TResult? Function(List<CardModel> model)? onGetCardListSuccess,
    TResult? Function(CardModel model)? onAddCardSuccess,
    TResult? Function(String message)? onCheckoutWithCardSuccess,
    TResult? Function(String model)? onGetPaymentLinkSuccess,
    TResult? Function(File model)? onGetPaymentReceiptSuccess,
  }) {
    return onGetPaymentReceiptSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onLoading,
    TResult Function(String? message)? onFailure,
    TResult Function(List<CardModel> model)? onGetCardListSuccess,
    TResult Function(CardModel model)? onAddCardSuccess,
    TResult Function(String message)? onCheckoutWithCardSuccess,
    TResult Function(String model)? onGetPaymentLinkSuccess,
    TResult Function(File model)? onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onGetPaymentReceiptSuccess != null) {
      return onGetPaymentReceiptSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_onLoading value) onLoading,
    required TResult Function(_onFailure value) onFailure,
    required TResult Function(_onGetCardListSuccess value) onGetCardListSuccess,
    required TResult Function(_onAddCardSuccess value) onAddCardSuccess,
    required TResult Function(_onCheckoutWithCardSuccess value)
        onCheckoutWithCardSuccess,
    required TResult Function(_onGetPaymentLinkSuccess value)
        onGetPaymentLinkSuccess,
    required TResult Function(_onGetPaymentReceiptSuccess value)
        onGetPaymentReceiptSuccess,
  }) {
    return onGetPaymentReceiptSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_onLoading value)? onLoading,
    TResult? Function(_onFailure value)? onFailure,
    TResult? Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult? Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult? Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult? Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult? Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
  }) {
    return onGetPaymentReceiptSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_onLoading value)? onLoading,
    TResult Function(_onFailure value)? onFailure,
    TResult Function(_onGetCardListSuccess value)? onGetCardListSuccess,
    TResult Function(_onAddCardSuccess value)? onAddCardSuccess,
    TResult Function(_onCheckoutWithCardSuccess value)?
        onCheckoutWithCardSuccess,
    TResult Function(_onGetPaymentLinkSuccess value)? onGetPaymentLinkSuccess,
    TResult Function(_onGetPaymentReceiptSuccess value)?
        onGetPaymentReceiptSuccess,
    required TResult orElse(),
  }) {
    if (onGetPaymentReceiptSuccess != null) {
      return onGetPaymentReceiptSuccess(this);
    }
    return orElse();
  }
}

abstract class _onGetPaymentReceiptSuccess implements PaymentState {
  const factory _onGetPaymentReceiptSuccess(final File model) =
      _$onGetPaymentReceiptSuccessImpl;

  File get model;
  @JsonKey(ignore: true)
  _$$onGetPaymentReceiptSuccessImplCopyWith<_$onGetPaymentReceiptSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

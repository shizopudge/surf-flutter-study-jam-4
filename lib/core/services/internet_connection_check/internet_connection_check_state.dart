part of 'internet_connection_check_cubit.dart';

@freezed
class InternetConnectionCheckState with _$InternetConnectionCheckState {
  const factory InternetConnectionCheckState.loading() = _LoadingState;
  const factory InternetConnectionCheckState.connected() = _ConnectedState;
  const factory InternetConnectionCheckState.disconnected() =
      _DisconnectedState;
}

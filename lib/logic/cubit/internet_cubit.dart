// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:equatable/equatable.dart';
// import 'package:ylla_harik/constants/enums.dart';

// part 'internet_state.dart';

// class InternetCubit extends Cubit<InternetState> {
//   Connectivity connectivity;
//   late StreamSubscription streamSubscriptionConnectivity;
//   InternetCubit({required this.connectivity}) : super(InternetLoading()) {
//     monitorInternetConnection();
//   }

//   StreamSubscription<ConnectivityResult> monitorInternetConnection() {
//     return (streamSubscriptionConnectivity =
//         connectivity.onConnectivityChanged.listen((connectivityResult) {
//       if (connectivityResult == ConnectivityResult.wifi) {
//         emitInternetConnected(ConnectionType.Wifi);
//       } else if (connectivityResult == ConnectivityResult.mobile) {
//         emitInternetConnected(ConnectionType.Mobile);
//       } else {
//         emitInternetDisconnected();
//       }
//     }));
//   }

//   void emitInternetConnected(ConnectionType connectionType) {
//     emit(InternetConnected(connectionType: connectionType));
//   }

//   void emitInternetDisconnected() {
//     emit(InternetDisconnected());
//   }

//   @override
//   Future<void> close() async {
//     streamSubscriptionConnectivity.cancel();
//     super.close();
//   }
// }

import 'package:login/model/app_state.dart';
import 'package:redux/redux.dart';

// Subscriptions

// Proof of concept. To be replaced with Brian Egan's reselectors library.

authErrorMessage(Store<AppState> store) => store.state.authErrorMessage;
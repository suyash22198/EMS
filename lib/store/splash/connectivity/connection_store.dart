import 'package:flutter_boiler_plate/utils/device/internet_connectivity.dart';
import 'package:mobx/mobx.dart';
part 'connection_store.g.dart';

///Created by Naman Gupta on 20/4/21.
//  this store listen for the internet connection change.

class ConnectionStore = _ConnectionStore with _$ConnectionStore;

abstract class _ConnectionStore with Store {
  @observable
  ObservableStream connectionStream =
      ObservableStream(InternetConnectivity().checkStatus());

  void dispose() {}
}

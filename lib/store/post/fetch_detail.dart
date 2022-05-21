import 'package:flutter_boiler_plate/data/network/api_repository.dart';
import 'package:flutter_boiler_plate/models/agent_detail_model.dart';
import 'package:mobx/mobx.dart';

///Created by Naman Gupta on 26/4/21.
part "fetch_detail.g.dart";

class FetchDetail = _FetchDetailStore with _$FetchDetail;

abstract class _FetchDetailStore with Store {
  @observable
  ObservableFuture<AgentDetail>? _agentDetail;

  @action
  ObservableFuture<AgentDetail> fetchAgentDetail() =>
      _agentDetail = ObservableFuture(ApiRepository().getAgentDetails());
}

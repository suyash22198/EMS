import 'package:dio/dio.dart';
import 'package:flutter_boiler_plate/constants/api_constants.dart';
import 'package:flutter_boiler_plate/models/agent_detail_model.dart';
import 'package:mobx/mobx.dart';
import 'api_service.dart';
import 'response_listener.dart';

///Created by Naman Gupta on 19/4/21.
class ApiRepository extends ApiService {
  Future<AgentDetail> getAgentDetails() async {
    var data = await get(
      ApiConstants.GET_AGENT_DETAILS,
      {"agentCode": "12345678"},
    );
    return ObservableFuture.value(AgentDetail.fromMap(data.data));
  }
}

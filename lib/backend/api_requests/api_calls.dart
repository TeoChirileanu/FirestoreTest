import 'api_manager.dart';

Future<dynamic> getRandomNumberCall() => ApiManager.instance.makeApiCall(
      callName: 'Get Random Number',
      apiDomain: 'europe-central2-guessing-game-backend.cloudfunctions.net',
      apiEndpoint: 'GetRandomNumber',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );

Future<dynamic> checkGuessCall({
  int guess,
  int answer,
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Check Guess',
      apiDomain: 'europe-central2-guessing-game-backend.cloudfunctions.net',
      apiEndpoint: 'check-guess',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'guess': guess,
        'answer': answer,
      },
      returnResponse: true,
    );

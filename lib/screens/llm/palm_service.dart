import 'package:dio/dio.dart';
import 'package:rescue/screens/llm/llm_model.dart';

// abstract class IPaLMDataSource {
//   Future<PaLMModel> generateText(String text);
// }

// @override
// Future<PaLMModel> generateText(String text) async {
//  return await dioClient.onRequest(() async {
//    const url = 'https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generateText';

//    final queryParameters = {'key': 'AIzaSyA_p_Itn6vHBRTEo0HvikUArsBRv0Tqunk'};
//    final body = {'prompt': {'text': text}};

//    final response = await dioClient.post(url, queryParameters: queryParameters, data: body);

//    return PaLMModel.fromJson(response.data);
//  });
// }

Future<String> makeApiRequest(String text) async {
  final dio = Dio();

  // Define the URL
  const url =
      'https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generateText';

  // Define query parameters
  final queryParameters = {'key': 'AIzaSyA_7kORLAIIWOqAh9qXh5lJ636baiYm2Ac'};

  // Define request body
  final body = {
    'prompt': {'text': text}
  };

  print(body);

  try {
    // Make the POST request
    final response = await dio.post(
      url,
      queryParameters: queryParameters,
      data: body,
    );
    print(response);

    // Handle the response data
    PaLMModel paLMModel = PaLMModel.fromJson(response.data);
    print(paLMModel.candidates[0].output);
    return paLMModel
        .candidates[0].output; // Replace with your logic to handle the response
  } catch (error) {
    // Handle errors
    return 'Error: $error';
  }
}

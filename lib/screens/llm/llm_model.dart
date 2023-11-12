import 'package:json_annotation/json_annotation.dart';

part 'llm_model.g.dart'; // Add this line
@JsonSerializable(createToJson: false)
class PaLMModel {
 @JsonKey(name: 'candidates')
 final List<OutputModel> candidates;


 PaLMModel({required this.candidates});


 factory PaLMModel.fromJson(Map<String, dynamic> json) => _$PaLMModelFromJson(json);
}


@JsonSerializable(createToJson: false)
class OutputModel {
 @JsonKey(name: 'output')
 final String output;


 OutputModel({required this.output});


 factory OutputModel.fromJson(Map<String, dynamic> json) => _$OutputModelFromJson(json);
}
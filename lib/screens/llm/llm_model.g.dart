// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'llm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaLMModel _$PaLMModelFromJson(Map<String, dynamic> json) => PaLMModel(
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => OutputModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

OutputModel _$OutputModelFromJson(Map<String, dynamic> json) => OutputModel(
      output: json['output'] as String,
    );

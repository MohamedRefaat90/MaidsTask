// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: (json['id'] as num?)?.toInt(),
      task: json['todo'] as String?,
      completed: json['completed'],
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'todo': instance.task,
      'completed': instance.completed,
      'userId': instance.userId,
    };

import 'package:hamster/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends BaseModel<RegisterModel>{
  String? uId;
  final String? mail;
  final String? password;
  final String? name;
  final String? dateOfBirth;
  final String? phoneNumber;

  RegisterModel({
    this.uId,
    this.mail,
    this.password,
    this.name,
    this.dateOfBirth,
    this.phoneNumber,
  });

  @override
  RegisterModel fromJson(Map<String, dynamic> json) {
    return _$RegisterModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterModelToJson(this);
  }
}

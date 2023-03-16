// ignore_for_file: prefer_const_constructors_in_immutables

part of 'switch_bloc.dart';

@immutable
class SwitchState {
  final bool switchValue;

  SwitchState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return {
      'switchValue': switchValue,
    };
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(
      switchValue: map['switchValue'] ?? false,
    );
  }
}

class SwitchInitial extends SwitchState {
  SwitchInitial({required bool switchValue}) : super(switchValue: switchValue);
}

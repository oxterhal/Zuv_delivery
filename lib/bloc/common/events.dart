import 'package:equatable/equatable.dart';

abstract class CommonEvent extends Equatable {}

class CommonLogin extends CommonEvent {
  final String username, password;
  CommonLogin(this.username, this.password);
  @override
  List<Object?> get props => [username, password];
}

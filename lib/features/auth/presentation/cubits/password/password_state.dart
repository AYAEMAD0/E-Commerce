part of 'password_cubit.dart';

class PasswordState extends Equatable {
  final bool isObscurePassword;
  final bool isObscureConfirmPassword;

  const PasswordState({this.isObscurePassword = true,this.isObscureConfirmPassword= true});

  PasswordState copyWith({
    bool? isObscurePassword,
    bool? isObscureConfirmPassword,
  }) {
    return PasswordState(
      isObscurePassword: isObscurePassword ?? this.isObscurePassword,
      isObscureConfirmPassword: isObscureConfirmPassword ?? this.isObscureConfirmPassword,
    );
  }
  @override
  List<Object> get props => [isObscurePassword,isObscureConfirmPassword];
}
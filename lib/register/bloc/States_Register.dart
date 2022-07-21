import 'dart:io';

abstract class RegisterState{}

class initialState extends RegisterState{}

class ImageLoaded extends RegisterState{
  final File ProfileImage;
  ImageLoaded(this.ProfileImage);

}
class SuccessState extends RegisterState{
  final File profileImage;

  SuccessState(this.profileImage);
}

class ErrorState extends RegisterState{}

class LoadingState extends RegisterState{}
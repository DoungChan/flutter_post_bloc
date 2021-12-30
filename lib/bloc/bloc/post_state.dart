part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostLoadingState extends PostState {}

class SuccessState extends PostState {
  final List<PostModel> posts;

  SuccessState({required this.posts});
}

class ErorrState extends PostState {
  final String messageErorr;

  ErorrState({required this.messageErorr});
}

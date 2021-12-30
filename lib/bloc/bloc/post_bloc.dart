import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_post/models/post_molde.dart';
import 'package:flutter_bloc_post/repository/post_repository.dart';
import 'package:flutter_bloc_post/services/psot_services.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final postRepository = PostRepository();
  PostBloc() : super(PostLoadingState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is GetPostEvent) {
      yield PostLoadingState();
      try {
        List<PostModel> json = await postRepository.getPosts();
        yield SuccessState(posts: json);
      } catch (ex) {
        print(ex);
        yield ErorrState(messageErorr: ex.toString());
      }
    }
  }

  // @override
  // on<PostEvent>((event, emit) async* {
  //   if (event is GetPostEvent) {
  //     yield PostLoadingState();
  //     try {
  //       List<PostService> listpost = await postRepository.getAllPost();
  //       yield SuccessState(data: listpost);
  //     } catch (ex) {
  //       print(ex);
  //       yield ErorrState(messageErorr: ex.toString());
  //     }
  //   }
  // });

}

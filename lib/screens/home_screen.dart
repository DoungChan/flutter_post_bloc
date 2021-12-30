import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_post/bloc/bloc/post_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Event"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(
              child: Text("Hello"),
            );
          } else if (state is SuccessState) {
            return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(state.posts[index].title ?? "-"),
                      subtitle: Text(state.posts[index].body ?? "-"),
                    ),
                  );
                });
          } else if (state is ErorrState) {
            return Center(
              child: Text(state.messageErorr),
            );
          }
          return Container();
        },
      ),
    );
  }
}

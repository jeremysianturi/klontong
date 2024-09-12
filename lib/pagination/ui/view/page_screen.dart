import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready_pagination/core/services/services_locator.dart';
import '../../data/model/post.dart';
import '../bloc/pagination_bloc.dart';
import '../navigation/AppRouter.dart';
import '../widgets/error_dialog.dart';
import '../widgets/post_item.dart';

class PostsOverviewScreen extends StatelessWidget {
  const PostsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          appServiceLocator<PaginationBloc>()..add(const LoadPageEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Blog App"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Add New Menu',
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.postNewMenu);
              },
            ),
          ],
        ),
        body: BlocBuilder<PaginationBloc, PaginationState>(
          builder: (context, state) {
            if (context.read<PaginationBloc>().posts.isEmpty) {
              if (state == PaginationLoadingState()) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator(),
                ));
              } else if (state == PaginationErrorState()) {
                return Center(
                    child: errorDialog(
                        size: 20,
                        onPressed: () {
                          context
                              .read<PaginationBloc>()
                              .add(const LoadPageEvent());
                        }));
              }
            }
            return ListView.builder(
                itemCount: context.read<PaginationBloc>().posts.length +
                    (context.read<PaginationBloc>().isLastPage ? 0 : 1),
                itemBuilder: (context, index) {
                  context
                      .read<PaginationBloc>()
                      .add(CheckIfNeedMoreDataEvent(index: index));
                  if (index == context.read<PaginationBloc>().posts.length) {
                    if (state == PaginationErrorState()) {
                      return Center(
                          child: errorDialog(
                              size: 15,
                              onPressed: () {
                                context
                                    .read<PaginationBloc>()
                                    .add(const LoadPageEvent());
                              }));
                    } else {
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(),
                      ));
                    }
                  }

                  final Post post = context.read<PaginationBloc>().posts[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to PostDetailScreen when PostItem is clicked
                      Navigator.pushNamed(
                        context,
                        AppRouter.postDetail,
                        arguments: post, // Pass the selected post
                      );
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: PostItem(post.name, post.description)),
                  );
                });
          },
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/domain/posts/entities/post_entity.dart';
import 'package:posts_app/presentation/blocs/add_edit_post_bloc/add_edit_post_bloc.dart';
import 'package:posts_app/presentation/core/utils/validator.dart';
import 'package:posts_app/presentation/core/widgets/screen_util.dart';

import '../../../injection.dart';
import '../../core/utils/base_state.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> with ScreenUtil {
  AddEditPostBloc bloc = getIt<AddEditPostBloc>();
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
      ),
      body: BlocListener<AddEditPostBloc, BaseState>(
        listener: (context, state) {
          if (state.progress) {
            showLoading(context);
          }
          if (state.fail) {
            stopLoading(context);
            showErrorFlushMessage(context, state.failure!.message);
          }
          if (state.success) {
            stopLoading(context);
            showSuccessFlushMessage(context, "Added Post Successfully");
            context.router.pop();
          }
        },
        bloc: bloc,
        child: Form(
          key: key,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Title"),
                    controller: title,
                    validator: (txt) {
                      if (!Validator.checkString(txt ?? "")) {
                        return "invalid title";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: TextFormField(
                      controller: content,
                      decoration: const InputDecoration(hintText: "Text"),
                      textAlignVertical: TextAlignVertical.top,
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      validator: (txt) {
                        if (!Validator.checkString(txt ?? "")) {
                          return "invalid Content";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (key.currentState!.validate()) {
            FocusScope.of(context).unfocus();
            bloc.add(AddPostEvent(
                entity: PostEntity(
                    body: content.text, title: title.text, userId: 1)));
          }
        },
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.done),
      ),
    );
  }
}

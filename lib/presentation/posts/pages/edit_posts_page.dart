import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/injection.dart';
import 'package:posts_app/presentation/blocs/add_edit_post_bloc/add_edit_post_bloc.dart';
import 'package:posts_app/presentation/core/utils/validator.dart';
import 'package:posts_app/presentation/core/widgets/error/error.dart';
import 'package:posts_app/presentation/core/widgets/loading.dart';
import 'package:salem_package/bloc/base_state.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/widgets/screen_util.dart';

class EditPostsPage extends StatefulWidget {
  final int id;
  const EditPostsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<EditPostsPage> createState() => _EditPostsPageState();
}

class _EditPostsPageState extends State<EditPostsPage> with ScreenUtil {
  AddEditPostBloc bloc = getIt<AddEditPostBloc>();
  AddEditPostBloc bloc2 = getIt<AddEditPostBloc>();
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  bool loaded = false;
  GlobalKey<FormState> key = GlobalKey();
  @override
  void initState() {
    errorMessages = {
      FailureType.networkError : "No Network",
      FailureType.serverError : "Server Error",
      FailureType.invalidArguments : "Error Data",
      FailureType.unAuthorized : "Un Authorized"
    };
    bloc.add(GetPostEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Scaffold(
        appBar: AppBar(title: const Text("Edit Posts")),
        body: BlocConsumer<AddEditPostBloc, BaseState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.success) {
              setState(() {
                if (!loaded) {
                  title = TextEditingController(text: state.item.title);
                  content = TextEditingController(text: state.item.body);
                  loaded = true;
                }
              });
            }
            if (state.progress) {
              setState(() {
                loaded = false;
              });
            }
            if (state.fail) {
              setState(() {
                loaded = false;
              });
            }
          },
          builder: (context, state) {
            if (state.progress) {
              return const LoadingWidget();
            } else if (state.success) {
              return Container(
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
                            return "invalid Title";
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
              );
            } else if (state.fail) {
              return DisplayErrorWidget(
                  type: state.failure!.type,
                  message: errorMessages[state.failure?.type] ?? "",
                  retry: () {
                    bloc.add(GetPostEvent(id: widget.id));
                  });
            }
            return const SizedBox();
          },
        ),
        floatingActionButton: BlocListener<AddEditPostBloc, BaseState>(
            bloc: bloc2,
            listener: (context, state) {
              if (state.progress) {
                showLoading(context);
              }
              if (state.success) {
                stopLoading(context);
                showSuccessSnackMessage(context, "Edited Post Successfully");
                context.router.pop();
              }
              if (state.fail) {
                stopLoading(context);
                showErrorSnackMessage(context, state.failure!.type);
              }
            },
            child: loaded
                ? FloatingActionButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        bloc2.add(UpdatePostEvent(entity: bloc.state.item));
                      }
                    },
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(Icons.done),
                  )
                : const Center()),
      ),
    );
  }
}

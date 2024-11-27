import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanarchetectureflutterguy/Presentation/details_screen/ui/details_screen.dart';
import 'package:cleanarchetectureflutterguy/Presentation/home_screen/widgets/topwidgets/bloc/topwidgets_bloc.dart';
import 'package:cleanarchetectureflutterguy/Presentation/home_screen/widgets/topwidgets/ui/topwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/homepage_bloc.dart';

class Homepagewrappwer extends StatelessWidget {
  const Homepagewrappwer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomepageBloc()..add(Loadhomedata()),
        ),
        BlocProvider(
          create: (context) => TopwidgetsBloc()..add(TopwidgetEvents()),
        ),
      ],
      child: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
           context.read<HomepageBloc>().add(Loadhomedata());
           context.read<TopwidgetsBloc>().add(TopwidgetEvents());
          },
          child: Center(
            child: BlocBuilder<HomepageBloc, HomepageState>(
              builder: (context, state) {
                if (state is HomepageInitial) {
                  return Text("waiting");
                } else if (state is HomepageLoading) {
                  return CircularProgressIndicator(
                    color: Colors.red,
                  );
                } else if (state is HomepageLoaded) {
                  return Column(
                    children: [
                      const Topwidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: state.homepageentity.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:3,
                            childAspectRatio: .7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            final imageUrl =
                                state.homepageentity.products[index].images[0];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DetailsScreenWrapper(id: "${state.homepageentity.products[index].id}",),));
                              },
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(5),
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: imageUrl,
                                      fit: BoxFit.contain,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) {
                                        final progress =
                                            downloadProgress.progress ?? 0.0;
                                        return Center(
                                          child: CircularProgressIndicator(
                                              value: progress),
                                        );
                                      },
                                      errorWidget: (context, url, error) {
                                        return const Center(
                                          child: Icon(Icons.error, color: Colors.red),
                                        );
                                      },
                                    ),
                                    Expanded(
                                        child: Text(state
                                            .homepageentity.products[index].title,textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,maxLines: 2,))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else if (state is HomepageError) {
                  return Text("error ${state.errormsg}");
                } else {
                  return const Text("error");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

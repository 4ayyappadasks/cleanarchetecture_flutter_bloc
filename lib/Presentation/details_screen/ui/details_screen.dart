import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanarchetectureflutterguy/Presentation/details_screen/bloc/details_screen_bloc.dart';
import 'package:cleanarchetectureflutterguy/Presentation/home_screen/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreenWrapper extends StatelessWidget {
  const DetailsScreenWrapper({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailsScreenBloc()..add(Detailsscreenloadevent(id: id)),
      child: DetailsScreen(
        id: id,
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Homepagewrappwer(),
              ));
            },
            icon: const Icon(Icons.arrow_back_outlined)),
        centerTitle: true,
        title: BlocBuilder<DetailsScreenBloc, DetailsScreenState>(
          builder: (context, state) {
            if (state is DetailsScreenInitial) {
              return const Text("Details Screen");
            } else if (state is DetailsScreenLoading) {
              return const LinearProgressIndicator(
                color: Colors.green,
              );
            } else if (state is DetailsScreenLoaded) {
              return Text(state.detailsEntity.title);
            } else if (state is DetailsScreenError) {
              return const Text("Details Screen");
            } else {
              return const Text("Details Screen");
            }
          },
        ),
      ),
      body: BlocBuilder<DetailsScreenBloc, DetailsScreenState>(
        builder: (context, state) {
          if (state is DetailsScreenInitial) {
            return const Text("waiting");
          } else if (state is DetailsScreenLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          } else if (state is DetailsScreenLoaded) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(imageUrl: state.detailsEntity.images[0]),
                  Text(
                    state.detailsEntity.description,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "price : ${state.detailsEntity.price.toString()}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ));
          } else if (state is DetailsScreenError) {
            return const Center(child: Text("data is error"));
          } else {
            return const Center(child: Text("error in loading"));
          }
        },
      ),
    );
  }
}

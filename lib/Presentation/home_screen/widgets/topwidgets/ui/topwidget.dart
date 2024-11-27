import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleanarchetectureflutterguy/Presentation/home_screen/widgets/topwidgets/bloc/topwidgets_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../main.dart';


class Topwidget extends StatelessWidget {
  const Topwidget({super.key});

  @override
  Widget build(BuildContext context) {
    // IconButton(onPressed: () {
    //   context.read<TopwidgetsBloc>().add(TopwidgetEvents());
    // }, icon: Icon(Icons.dangerous)),
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      height: MyApp.height * .2,
      width: MyApp.width,
      child: Center(child: BlocBuilder<TopwidgetsBloc, TopwidgetsState>(
        builder: (context, state) {
          if (state is TopwidgetsInitial) {
            return const Text("Top widget loading");
          } else if (state is TopwidgetsLoading) {
            return const CircularProgressIndicator(
              color: Colors.blue,
            );
          } else if (state is TopwidgetsLoaded) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.topwidgetentity.products.length,
              itemBuilder: (context, index) {
                final topimageurl = state.topwidgetentity.products[index].images[0];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                      elevation: 5,
                      child: CachedNetworkImage(imageUrl: topimageurl)),
                );
              },
            );
          } else if (state is TopwidgetsError) {
            return Text(state.ermsg);
          } else {
            return Text("error");
          }
        },
      )),
    );
  }
}

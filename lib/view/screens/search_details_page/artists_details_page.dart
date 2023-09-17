import 'package:audio_player/common_widgets/heading_text.dart';
import 'package:audio_player/core/constants.dart';
import 'package:audio_player/models/artist_model.dart';
import 'package:audio_player/models/recordings_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class ArtistsDetailsPage extends StatelessWidget {
  final ArtistM recordingModel;
  const ArtistsDetailsPage({super.key,required this.recordingModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: HeadingText(name: recordingModel.name),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(profile),
              ),
            ),
           
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText(name: "About",fontsize: 20,fontweight: FontWeight.bold,),
              const SizedBox(height: 10,),
              if(recordingModel.disambiguation!=null)
             HeadingText(name: recordingModel.disambiguation.toString()),
           ],),
         ),
          Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,children: [
              const HeadingText(name: "Aliases",fontsize: 20,fontweight: FontWeight.bold,),
             Column(children: recordingModel.aliases!.map((e) => ListTile(
              leading: const CircleAvatar(backgroundImage: AssetImage(profile),),
              title: HeadingText(name: e.name),
              subtitle: HeadingText(name: e.sortName.toString(),fontsize: 10,),
             
             )).toList(),)
           ],),
         )
          ],
        ),
      ),
    );
  }
}
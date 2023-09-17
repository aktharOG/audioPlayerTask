import 'package:audio_player/common_widgets/heading_text.dart';
import 'package:audio_player/core/constants.dart';
import 'package:audio_player/models/recordings_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class RecordingsDetailsPage extends StatelessWidget {
  final Recording recordingModel;
  const RecordingsDetailsPage({super.key,required this.recordingModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: HeadingText(name: recordingModel.title),),
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
                child: CachedNetworkImage(imageUrl: guitar,height: 200,
                width: double.infinity,),
              ),
            ),
           
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText(name: "Artists",fontsize: 20,fontweight: FontWeight.bold,),
             Column(
              
              children: recordingModel.artistCredit.map((e) => ListTile(
              leading: const CircleAvatar(backgroundImage: AssetImage(profile),),
              title: HeadingText(name: e.name),
              subtitle: HeadingText(name: e.artist.name,fontsize: 10,),
            //  trailing: HeadingText(name: e.artist.sortName),
             )).toList(),)
           ],),
         ),
          Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,children: [
              const HeadingText(name: "Latest Releases",fontsize: 20,fontweight: FontWeight.bold,),
             Column(children: recordingModel.releases.map((e) => ListTile(
              leading: const CircleAvatar(backgroundImage: AssetImage(profile),),
              title: HeadingText(name: e.title),
              subtitle: HeadingText(name: e.date.toString(),fontsize: 10,),
              trailing: CircleAvatar(
                                    backgroundColor: white,
                                    child: Icon(Icons.play_arrow),
                                  ),
             )).toList(),)
           ],),
         )
          ],
        ),
      ),
    );
  }
}
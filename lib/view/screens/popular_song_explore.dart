import 'package:flutter/material.dart';

import '../../common_widgets/heading_text.dart';
import '../../services/audio_services/models/song.dart';
import '../widgets/custom_button.dart';
import '../widgets/popular_tile.dart';

class PopularSongExplore extends StatelessWidget {
  const PopularSongExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(children: [
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const HeadingText(
                        name: "Popular songs",
                        fontsize: 20,
                      ),
                      CustomButton(btnName: "Explore",onTap: (){},)
                    ],
                  ),
        
                  ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        final data = Song.songs[index];
                        return  PopularTile(song: data,);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: Song.songs.length)
          ],),
        ),
      ),
    );
  }
}
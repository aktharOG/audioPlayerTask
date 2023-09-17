import 'dart:developer';

import 'package:audio_player/helpers/navigation_helpers.dart';
import 'package:audio_player/theme/app_theme.dart';
import 'package:audio_player/view/screens/search_details_page/artists_details_page.dart';
import 'package:audio_player/view/screens/search_details_page/recordings_details_page.dart';
import 'package:audio_player/view/widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../../../common_widgets/heading_text.dart';
import '../../../common_widgets/svg_icon.dart';
import '../../../providers/home_providerWF.dart';
import '../../widgets/heading_with_button.dart';
import '../../widgets/popular_genres_tile.dart';
import '../../widgets/recent_search_tile.dart';
import '../../widgets/search_result_tile.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProviderWF>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 30,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios)),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.only(left: 10, bottom: 5),
                    decoration: BoxDecoration(
                        color: backgroundDark,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        const SvgIcon(
                          icon: "search",
                          color: white,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) {
                              log(value);
                              homePro.search();
                            },
                            controller: homePro.searchController,
                            style: const TextStyle(color: white),
                            decoration: const InputDecoration(
                                fillColor: white,
                                focusColor: white,
                                border: InputBorder.none,
                                hintText: "What do you want to listen to?",
                                hintStyle:
                                    TextStyle(fontSize: 12, color: white)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                children: [
                  CustomButton(
                    btnName: "Recodings",
                    onTap: () {
                      homePro.switchToRecordings();
                    },
                    color: !homePro.isSwitch ? appBlue : backgroundDark,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    btnName: "Artists",
                    onTap: () {
                      homePro.switchToArtists();
                    },
                    color: homePro.isSwitch ? appBlue : backgroundDark,
                  )
                ],
              ),
            ),
          ),
        ),
        body: homePro.isSearchLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!homePro.isSwitch)
                      ListView.builder(
                        itemCount: homePro.recordingslist.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final data = homePro.recordingslist[index];
                          return GestureDetector(
                            onTap: () {
                              push(context,
                                  RecordingsDetailsPage(recordingModel: data));
                            },
                            child: SearchResultTile(
                              title: data.title,
                            ),
                          );
                        },
                      ),
                    if (homePro.isSwitch)
                      ListView.builder(
                        itemCount: homePro.artistList.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final data = homePro.artistList[index];
                          return ListTile(
                            onTap: () {
                              push(context,
                                  ArtistsDetailsPage(recordingModel: data));
                            },
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage(profile),
                            ),
                            title: HeadingText(
                              name: data.name,
                              fontweight: FontWeight.bold,
                              fontsize: 18,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (data.disambiguation != null)
                                  HeadingText(
                                    name: "${data.disambiguation}",
                                    fontsize: 15,
                                  ),
                                if (data.gender != null)
                                  HeadingText(
                                    name: "Gender : ${data.gender}",
                                    fontsize: 12,
                                  ),
                                if (data.country != null)
                                  HeadingText(
                                    name: "Country : ${data.country}",
                                    fontsize: 12,
                                  ),
                                Wrap(
                                  children: data.aliases!
                                      .map((e) => HeadingText(
                                            name: e.name,
                                            fontsize: 13,
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                  ],
                ),
              ));
  }
}

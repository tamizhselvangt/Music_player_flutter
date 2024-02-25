import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:audioplayers/audioplayers.dart';

class AddMusic extends StatefulWidget {
  @override
  State<AddMusic> createState() => _AddMusicState();
}

class _AddMusicState extends State<AddMusic> {

  List<String>  songs = [];
  List<String>  songsPath = [];
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  Future<void> play() async {
    FilePickerResult? result1 = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav', 'dev'],
    );
    if (result1 != null && result1.files.isNotEmpty) {
      final PlatformFile songFile = result1.files.first;
      if (songFile.path != null) {
          String filePath = songFile.path!;
           songsPath.add(filePath);
          setState(() {
            songs.add(songFile.name);
          });// var result = await audioPlayer.play(filePath, isLocal: true);
      }
    }
  }
    @override
    void dispose() {
      audioPlayer.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add Music'),
        ),
        body: ListView.builder(
            itemBuilder: (context , index){
          return ListTile(
            title: Text(songs[index]),
            trailing: Icon(Icons.music_note),
            onTap: () async{
              var result = await audioPlayer.play(songsPath[index], isLocal: true);
            },
            onLongPress: (){
              audioPlayer.pause();
            },
          );
        },
        itemCount: songs.length,) ,
        bottomNavigationBar: SafeArea(
          child: IconButton(onPressed:(){
              play();
          },
          icon: Icon(Icons.playlist_add),),
        ),
      );
    }
  }

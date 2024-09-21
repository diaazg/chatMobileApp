import 'package:chat/config.dart';
import 'package:flutter/widgets.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen(
      {super.key,
      required this.uid,
      required this.roomID,
      required this.userName});
  final String uid;
  final String roomID;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appSign:
           Config.appSign,
        appID: Config.appID,
        callID: roomID,
        userID: uid,
        userName: userName,
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall());
  }
}

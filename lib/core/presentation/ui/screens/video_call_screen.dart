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
            '703212403ec970c4d6e53a0a3bfa0240e0960d5d4fe165129ee8ceaac1448a82',
        appID: 1553092569,
        callID: roomID,
        userID: uid,
        userName: userName,
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall());
  }
}

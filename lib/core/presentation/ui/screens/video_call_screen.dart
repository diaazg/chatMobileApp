import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
           dotenv.env['APP_SIGN']!,
        appID: int.parse(dotenv.env['APP_ID']!),
        callID: roomID,
        userID: uid,
        userName: userName,
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall());
  }
}

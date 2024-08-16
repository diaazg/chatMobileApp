import 'package:chat/utils/sizes.dart';

extension StringExtension on String{
    String getWord(int wordNumber){
      
     List<String> allWords = split(' ');
     String concate = '${allWords[2]} ${allWords[3]}';
     allWords.replaceRange(2, 3, [concate]);
     allWords.removeAt(3);

     if(allWords.length<wordNumber){
      return "check the index";
     }else{
      return allWords[wordNumber];
     }

  }
}


extension DoubleExtension on double {
  double responsiveHeight(double screenHeight){
    double facotr = screenHeight / mainScreenHeight;
    double responsiveHeight = this * facotr;
    return responsiveHeight;
  }
}
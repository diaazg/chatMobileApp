
class TokenModel {
  String? accessToken;
  String? refreshToken;
  TokenModel({this.accessToken,this.refreshToken});
  
  factory TokenModel.fromJson(Map<String, dynamic> json)=>TokenModel(
    accessToken: json['access'] as String,
    refreshToken: json['refresh'] as String
  );

  Map<String, dynamic> toJson()=>{
    'access':accessToken,
    'refresh':refreshToken
  };

  bool tokenEmpty(){
    if(accessToken == null || refreshToken == null){
      return true;
    }else{
      return false;
    }
  }




}
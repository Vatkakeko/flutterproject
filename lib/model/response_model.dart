// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResposeModel {
  bool _isSuccess;
  String _message;
  ResposeModel(this._isSuccess, this._message);

  bool get isSuccess => _isSuccess;
  String get message => _message;
}

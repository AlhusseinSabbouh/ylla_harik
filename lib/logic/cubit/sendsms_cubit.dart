import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sms/flutter_sms.dart';
part 'sendsms_state.dart';

class SendsmsCubit extends Cubit<SendsmsState> {
  SendsmsCubit() : super(SendsmsInitial());
  String? number;
  String? msgContent;

  Future<void> sendSms() async {
    String _result =
        await sendSMS(message: msgContent ?? "", recipients: [number!])
            .catchError((onError) {});
  }
}

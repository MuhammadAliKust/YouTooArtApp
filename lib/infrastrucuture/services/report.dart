import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_2_art/infrastrucuture/models/report.dart';

class PostServices {
  ///Add Report
  Future addReport(ReportModel reportModel) async {
    return await FirebaseFirestore.instance
        .collection('reportCollection')
        .add(reportModel.toJson(reportModel.docId.toString()));
  }
}

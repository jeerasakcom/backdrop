import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tdvp/models/amount_book_model.dart';
import 'package:tdvp/models/amount_print_model.dart';
import 'package:tdvp/models/binding_book_model.dart';
import 'package:tdvp/models/format_paper_model.dart';
import 'package:tdvp/models/size_paper_model.dart';
import 'package:tdvp/models/type_print_model.dart';
import 'package:tdvp/utility/app_controller.dart';

class AppService {
  Future<void> readSizePapter() async {
    AppController appController = Get.put(AppController());
    await FirebaseFirestore.instance
        .collection('sizePaper')
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          SizePaperModel model = SizePaperModel.fromMap(element.data());
          appController.sizePaperModels.add(model);
        }
      }
    });
  }

  Future<void> readFormatPapter() async {
    AppController appController = Get.put(AppController());
    await FirebaseFirestore.instance
        .collection('formatPaper')
        .get()
        .then((value) {
      print('## value at readRormatPaper --> ${value.docs.length}');
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          FormatPaperModel model = FormatPaperModel.fromMap(element.data());
          print('## model at readFormatPaper --> ${model.toMap()}');
          appController.formatPaperModels.add(model);
        }
        print(
            '## appController.formatPaperModels ---> ${appController.formatPaperModels.length}');
      }
    });
  }

  Future<void> readAmountPrint() async {
    AppController appController = Get.put(AppController());
    await FirebaseFirestore.instance
        .collection('amoutPrint')
        // .orderBy('amount', descending: true)
        .orderBy('amount', descending: false)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          AmountPrintModel model = AmountPrintModel.fromMap(element.data());
          appController.amountPrintModels.add(model);
        }
      }
    });
  }

  Future<void> readAmountBook() async {
    AppController appController = Get.put(AppController());
    await FirebaseFirestore.instance
        .collection('amountBook')
        .orderBy('amount', descending: false)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          AmountBookModel model = AmountBookModel.fromMap(element.data());
          appController.amountBookModels.add(model);
        }
      }
    });
  }

  Future<void> readBindingBook() async {
    AppController appController = Get.put(AppController());
    await FirebaseFirestore.instance
        .collection('bindingBook')
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          BindingBookModel model = BindingBookModel.fromMap(element.data());
          appController.bindingBookModels.add(model);
        }
      }
    });
  }

  Future<void> readTypePrint() async {
    AppController appController = Get.put(AppController());
    await FirebaseFirestore.instance
        .collection('typePrint')
        .orderBy('typeprint', descending: false)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          TypePrintModel model = TypePrintModel.fromMap(element.data());
          appController.typePrintModels.add(model);
        }
      }
    });
  }

  //
}

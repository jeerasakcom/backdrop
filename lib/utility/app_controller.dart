import 'package:get/get.dart';
import 'package:tdvp/models/amount_book_model.dart';
import 'package:tdvp/models/amount_print_model.dart';
import 'package:tdvp/models/binding_book_model.dart';
import 'package:tdvp/models/format_paper_model.dart';
import 'package:tdvp/models/size_paper_model.dart';
import 'package:tdvp/models/type_print_model.dart';

class AppController extends GetxController {
  RxList sizePaperModels = <SizePaperModel>[].obs;
  RxList chooseSizePaperModels = <SizePaperModel?>[null].obs;

  RxList formatPaperModels = <FormatPaperModel>[].obs;
  RxList chooseFormatPaperModels = <FormatPaperModel?>[null].obs;

  RxList amountPrintModels = <AmountPrintModel>[].obs;
  RxList chooseAmountPrintModels = <AmountPrintModel?>[null].obs;

  RxList amountBookModels = <AmountBookModel>[].obs;
  RxList chooseAmountBookModels = <AmountBookModel?>[null].obs;

  RxList bindingBookModels = <BindingBookModel>[].obs;
  RxList chooseBindingBookModels = <BindingBookModel?>[null].obs;

  RxList typePrintModels = <TypePrintModel>[].obs;
  RxList chooseTypePrintModels = <TypePrintModel?>[null].obs;

  RxDouble price = 0.0.obs;
}

import 'package:e_commerce_app/core/theme/custom/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MallType { market, beauty }

class MallTypeCubit extends Cubit<MallType> {
  MallTypeCubit() : super(MallType.market);

  void changeIndex(int index) => emit(MallType.values[index]);
}

extension MallTypeX on MallType {
  String get toName {
    switch (this) {
      case MallType.market:
        return '마캣패캠';
      case MallType.beauty:
        return '부티패캠';
    }
  }

  CustomAppBarTheme get theme {
    switch(this){
      case MallType.market:
        return CustomAppBarTheme.market;
      case MallType.beauty:
        return CustomAppBarTheme.beauty;
    }
  }

  bool get isMarket => this == MallType.market;

  bool get isBeauty => this == MallType.beauty;
}

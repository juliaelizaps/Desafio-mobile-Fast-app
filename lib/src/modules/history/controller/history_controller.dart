import 'package:mobx/mobx.dart';
import '../../home/model/address_model.dart';
import '../../home/repositories/local_repository.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  final LocalRepository localRepository;

  _HistoryControllerBase(this.localRepository) {
    loadHistory();
  }

  @observable
  ObservableList<AddressModel> history = ObservableList<AddressModel>();

  @action
  void loadHistory() {
    final data = localRepository.getAllAddresses();
    history = ObservableList<AddressModel>.of(data);
  }
}

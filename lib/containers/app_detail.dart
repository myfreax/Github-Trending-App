import 'package:GTA/models/app_state.dart';
import 'package:GTA/models/models.dart';
import 'package:GTA/presentation/widgets/readme_detail.dart';
import 'package:GTA/selectors/selectors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AppDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return ReadmeDetail(
          html: vm.html,
          loading: vm.loading,
        );
      },
    );
  }
}

class _ViewModel {
  final String html;
  final bool loading;
  _ViewModel({@required this.html, @required this.loading});
  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        html: detailSelector(store), loading: loadingSelector(store));
  }
}

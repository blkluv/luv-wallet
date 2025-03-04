import 'package:equatable/equatable.dart';
import 'package:fusecash/models/app_state.dart';
import 'package:fusecash/models/tokens/token.dart';
import 'package:redux/redux.dart';

class TokenTileViewModel extends Equatable {
  final Map<String, String> tokensImages;
  final Map<String, Token> tokens;

  const TokenTileViewModel({
    required this.tokens,
    required this.tokensImages,
  });

  static TokenTileViewModel fromStore(Store<AppState> store) {
    return TokenTileViewModel(
      tokens: {
        ...store.state.swapState.tokens,
        ...store.state.cashWalletState.tokens
      },
      tokensImages: store.state.swapState.tokensImages,
    );
  }

  @override
  List<Object?> get props => [
        tokens,
        tokensImages,
      ];
}

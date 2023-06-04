import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/model/shopping_item_model.dart';

final shoppingListProvider = StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>((ref) => ShoppingListNotifier());

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // super안에는 ShoppingListProvider의 상태를 초기화하는 값이 들어간다.
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '라면',
              quantity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '삼겹살',
              quantity: 10,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '수박',
              quantity: 2,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '카스테라',
              quantity: 5,
              hasBought: false,
              isSpicy: false,
            ),
          ],
        );

  void toggleHasBought({required String name}) {
    // state는 StateNotifire를 상속받으면 자동으로 제공되는 값이다.
    state = state
        .map(
          (e) => e.name == name
              ? ShoppingItemModel(
                  name: e.name,
                  quantity: e.quantity,
                  hasBought: !e.hasBought,
                  isSpicy: e.isSpicy,
                )
              : e,
        )
        .toList();
  }
}

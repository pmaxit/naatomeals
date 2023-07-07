import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../utils/provider/response_state.dart';
import '../../utils/provider/restaurant_list_provider.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rlprovider = ref.read(restaurantListProvider);

    useEffect(() {
      rlprovider.fetchRestaurantList();
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Naato Meals'),
      ),
      body: rlprovider.responseState == ResponseState.loading
          ? const Center(child: CircularProgressIndicator())
          : rlprovider.responseState == ResponseState.hasData
              ? ListView.builder(
                  itemCount:
                      rlprovider.restaurantListResponse?.restaurants?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(rlprovider.restaurantListResponse
                              ?.restaurants?[index].name ??
                          ''),
                      subtitle: Text(rlprovider.restaurantListResponse
                              ?.restaurants?[index].description ??
                          ''),
                    );
                  },
                )
              : Center(
                  child: Text(rlprovider.message),
                ),
    );
  }
}

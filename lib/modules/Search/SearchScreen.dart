import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/modules/Search/Cubit/SearchCubit.dart';
import 'package:shopapp/modules/Search/Cubit/SearchState.dart';

import 'package:shopapp/widgets/formField.dart';

import '../../widgets/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var SearchText = TextEditingController();
    int itemCount = 0;
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          itemCount =
              SearchCubit.get(context).searchmodel?.SearchData?.data?.length ??
                  0;
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    formField(
                      controller: SearchText,
                      labelText: "Search",
                      text_input_action: TextInputAction.search,
                      prefixicon: const Icon(Icons.search),
                      keyboardtype: TextInputType.text,
                      onsubmit: (value) {
                        SearchCubit.get(context).getSearchData(value);
                      },
                    ),
                    const SizedBox(height: 15),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(),
                    const SizedBox(height: 15),
                    if (state is SearchSuccessState && itemCount != 0)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => BuildProductsItemes(
                              ProductData: SearchCubit.get(context)
                                  .searchmodel!
                                  .SearchData!
                                  .data![index],
                              context: context,
                              oldPrice: false),
                          separatorBuilder: (context, index) => const Divider(
                            color: Colors.grey,
                          ),
                          itemCount: itemCount,
                        ),
                      )
                    else if (state is SearchSuccessState && itemCount == 0)
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Expanded(
                            child: Text(
                          "We Can't found any Proudcts with this Search Words ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              height: 1.5,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        )),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

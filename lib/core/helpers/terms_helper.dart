import 'package:flutter/material.dart';

void showTerms(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => Wrap(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Términos y condiciones',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // large lorem ipsum
                  const Text(
                    '''
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a diam laoreet, imperdiet tortor quis, elementum velit. Quisque suscipit quam quis turpis posuere, vel finibus nulla fringilla. In hac habitasse platea dictumst. Nam in maximus nisl. Nunc viverra urna eu orci consequat, eu aliquam massa scelerisque. Sed venenatis lacinia lobortis. Pellentesque iaculis, eros at pretium sollicitudin, urna arcu ultricies ex, eget laoreet sapien ante et nisi. Maecenas gravida ipsum ut tortor volutpat, in auctor libero tempor. Praesent sagittis, velit sed efficitur finibus, dui neque varius nibh, non fermentum urna odio nec elit.
            
            Sed ac lectus eu turpis blandit rutrum. Suspendisse volutpat sem in suscipit facilisis. Curabitur eget dolor nisl. Donec congue eleifend odio vel venenatis. Nullam et finibus massa. Donec quis tristique lectus, a volutpat leo. Aenean efficitur dolor vel sagittis scelerisque. Quisque ultricies, augue sed dapibus fringilla, nisi felis feugiat lorem, eu dictum purus urna in augue. Morbi tempus ultricies pulvinar. Praesent nibh ex, malesuada vestibulum nulla eu, viverra cursus dui. Sed non sollicitudin dui. In non blandit orci.
            
            Nulla eget metus a metus varius pellentesque. Morbi malesuada placerat elit, non vehicula ligula pharetra quis. Sed et ex ultrices, fringilla nulla ac, dapibus nibh. Integer porta tellus ante, quis tristique purus blandit vitae. Nam rutrum cursus velit, pellentesque pulvinar sem ullamcorper non. Fusce blandit nunc sit amet mauris consectetur, ac volutpat ligula rutrum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam tempus sit amet nibh vel porttitor. Aenean vitae risus ut neque iaculis interdum. Cras nibh metus, ullamcorper hendrerit dolor vitae, commodo sagittis nisl. Suspendisse ac congue elit. Duis vitae nisi ligula. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas malesuada felis nec lorem consequat, condimentum tempor neque egestas. Maecenas venenatis volutpat tellus id auctor.
            
            Donec lacus nisi, imperdiet eget diam ornare, imperdiet vulputate lectus. Aliquam auctor risus ac velit consectetur interdum. Integer laoreet metus nisl, a fermentum nisi ultrices quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sem justo, feugiat in blandit non, consectetur nec mauris. Cras molestie nunc ac maximus cursus. Vestibulum feugiat magna eget finibus congue. Mauris ut ligula nec ante eleifend finibus. Fusce auctor vestibulum neque at tempor.
            
            Aenean varius sem id eleifend porta. Phasellus aliquet nisi ac nulla ornare, nec porta nunc eleifend. Sed efficitur orci quis auctor vehicula. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean volutpat justo tortor, a blandit dolor placerat eu. Morbi ullamcorper varius purus at bibendum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus a congue mi, vitae vulputate turpis. Morbi volutpat, enim quis luctus interdum, magna nunc mattis urna, porta ornare lacus dolor quis dui.
            
            Pellentesque sit amet venenatis velit, non porttitor leo. Morbi convallis purus egestas velit sollicitudin, et scelerisque justo semper. Nullam euismod porttitor tortor et blandit. Morbi ultrices in urna consectetur faucibus. Nunc vel ligula efficitur, dignissim mi sit amet, mollis mi. Pellentesque pellentesque rhoncus egestas. Quisque dignissim risus vel diam rutrum tincidunt. Nunc dapibus nisl in velit elementum interdum. In hac habitasse platea dictumst. Etiam rhoncus non erat id scelerisque. Sed a elit libero. Nulla in lacinia sem, sed tempus lorem. Sed auctor magna sit amet odio sagittis ultricies. Sed molestie porta nisl vel vulputate. Nam gravida vulputate velit in tincidunt. Mauris sagittis sed nibh eget venenatis.
            
            Nunc placerat sem vitae nulla molestie sagittis. Suspendisse potenti. Sed vitae ligula dui. Nam malesuada velit sit amet sodales auctor. Vivamus varius quis tellus at dignissim. Nunc odio sapien, ornare non nunc porta, laoreet posuere tortor. Nullam sit amet dui sed dui ultricies sollicitudin et a augue.
            
            Vestibulum est mi, finibus aliquam fermentum id, vulputate vel eros. Praesent malesuada enim erat, eget suscipit nisl condimentum in. Curabitur ante mi, sodales vitae nunc convallis, ultrices pharetra nulla. Sed condimentum ex fermentum arcu consectetur, a vulputate odio interdum. Aenean efficitur et orci et volutpat. Phasellus ac purus finibus, gravida tellus non, dictum nisl. Nunc eget finibus urna, at finibus leo. Sed fringilla vehicula sapien id dapibus. Integer sed iaculis nunc.
            
            Donec vitae lectus nulla. Nullam pellentesque lacus mi, vitae congue ex malesuada non. Suspendisse sed risus turpis. Proin vel nunc hendrerit, facilisis risus sed, congue risus. Duis non ex sodales, tincidunt tortor sed, sollicitudin lacus. Morbi maximus neque nec odio pretium, et tempus ante semper. Sed tempus lacus eget velit dignissim, in porttitor mauris tincidunt.
            
            Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras non feugiat quam, et molestie lacus. Sed quis nisl tincidunt, tristique enim a, rhoncus ligula. Proin dapibus sed lectus et placerat. Nulla sed diam velit. Proin at eros facilisis, suscipit nunc eget, finibus nibh. Integer molestie lectus nec orci porttitor elementum.
                    ''',
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

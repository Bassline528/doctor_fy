import 'package:doctor_fy/core/widgets/no_data.dart';
import 'package:doctor_fy/features/chat/presentation/screens/categorias_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ConsultasScreen extends StatefulWidget {
  const ConsultasScreen({super.key});

  static const String routeName = 'consultas';

  @override
  State<ConsultasScreen> createState() => _ConsultasScreenState();
}

class _ConsultasScreenState extends State<ConsultasScreen> {
  late bool _hasChats;

  @override
  void initState() {
    _hasChats = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/${CategoriasScreen.routeName}');
        },
        child: const FaIcon(FontAwesomeIcons.paperPlane),
      ),
      body: _hasChats
          ? _AvailableChats()
          : const NoDataToShow(
              noDataText: 'No hay chats disponibles, empieza una consulta!',
              child: Icon(
                Icons.chat_bubble_outlined,
                size: 100,
              ),
            ),
    );
  }
}

class _AvailableChats extends StatelessWidget {
  const _AvailableChats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.woolha.com/media/2020/03/eevee.png'),
            ),
            title: const Text('Dr. Eevee'),
            subtitle: const Text('Hola, ¿en que puedo ayudarte?'),
            trailing: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 10.r,
              child: Text(
                '3',
                style: TextStyle(fontSize: 10.sp),
              ),
            ),
            onTap: () {
              context.push('/chat');
            },
          ),
        ],
      ),
    );
  }
}

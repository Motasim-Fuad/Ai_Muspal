import 'package:ai_muspal/resource/asseets/image_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../View_Model/Controller/all_chat_model/all_chat_list_view_model.dart';
import '../../../models/All_conversions/all_chat_model.dart';

class ChatItemTile extends StatefulWidget {
  final AllChatModel chat;
  final int index;

  const ChatItemTile({super.key, required this.chat, required this.index});

  @override
  State<ChatItemTile> createState() => _ChatItemTileState();
}

class _ChatItemTileState extends State<ChatItemTile>
    with SingleTickerProviderStateMixin {
  double _dragExtent = 0;
  bool _isDeleteVisible = false;

  final double deleteWidth = 50.0;

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragExtent += details.primaryDelta!;
      _dragExtent = _dragExtent.clamp(-deleteWidth, 0);
      _isDeleteVisible = _dragExtent.abs() == deleteWidth;
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_dragExtent.abs() >= deleteWidth * 0.5) {
      setState(() {
        _dragExtent = -deleteWidth;
        _isDeleteVisible = true;
      });
    } else {
      setState(() {
        _dragExtent = 0;
        _isDeleteVisible = false;
      });
    }
  }

  Future<void> _showConfirmDialog(BuildContext context) async {
    final confirmed = await showCupertinoModalPopup<bool>(
      context: context,
      builder:
          (BuildContext context) => CupertinoActionSheet(
            title: const Text('確認刪除'),
            message: const Text('您確定要刪除此對話嗎？此操作無法撤銷。'),
            actions: [
              CupertinoActionSheetAction(
                isDestructiveAction: true,
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('刪除'),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('取消'),
            ),
          ),
    );

    if (confirmed == true) {
      final viewModel = Get.find<AllChatListViewModel>();
      viewModel.deleteChat(widget.index);
    } else {
      setState(() {
        _dragExtent = 0;
        _isDeleteVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: Stack(
        children: [
          // RED BACKGROUND DELETE BUTTON
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: deleteWidth,
                color: Colors.red,
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.white, size: 20),
                  onPressed: () => _showConfirmDialog(context),
                ),
              ),
            ),
          ),

          // FOREGROUND (LIST TILE)
          Transform.translate(
            offset: Offset(_dragExtent, 0),
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading:
                    Get.find<AllChatListViewModel>().selectedTabIndex.value == 0
                        ? null
                        : SizedBox(
                          height: 40,
                          child: SvgPicture.asset(ImageAssets.analyze_profile1),
                        ),
                title: Text(widget.chat.title),
                subtitle: Text(
                  widget.chat.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  widget.chat.time,
                  style: const TextStyle(fontSize: 12),
                ),
                onTap: () => Get.snackbar("Tapped", widget.chat.title),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

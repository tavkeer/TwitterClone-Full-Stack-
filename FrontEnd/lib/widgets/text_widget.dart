import 'package:twitterclone/exports.dart';

class TextWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function() ontap;
  final Widget? trailing;
  final bool readonly;
  final void Function(String) onchanged;
  final bool? obsecureText;

  const TextWidget({
    super.key,
    required this.controller,
    required this.readonly,
    required this.hintText,
    required this.ontap,
    required this.onchanged,
    this.trailing,
    this.obsecureText,
  });

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      readOnly: widget.readonly,
      onChanged: widget.onchanged,
      controller: widget.controller,
      onTap: widget.ontap,
      obscureText: widget.obsecureText ?? false,
      style: TextStyle(
        color: Colors.grey[300],
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 12,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: _isFocused ? Colors.blue : Colors.grey,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: Colors.grey.shade600,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.red),
        ),
        suffixIcon: widget.trailing,
        label: Text(
          widget.hintText,
          style: TextStyle(
            fontSize: 18,
            color: _isFocused ? Colors.blue : Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

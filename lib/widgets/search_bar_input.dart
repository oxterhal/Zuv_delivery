import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onChanged;
  final Function()? onClear;
  final bool enabled;
  final Widget? prefixIcon;
  final Color borderColor;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const SearchInput({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.onClear,
    this.enabled = true,
    this.prefixIcon,
    this.borderColor = Colors.orange,
    this.backgroundColor = Colors.white,
    this.borderRadius = 16.0,
    this.padding,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late TextEditingController _controller;
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
    _showClearButton = _controller.text.isNotEmpty;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onTextChanged);
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _showClearButton = _controller.text.isNotEmpty;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
  }

  void _clearText() {
    _controller.clear();
    if (widget.onClear != null) {
      widget.onClear!();
    }
    if (widget.onChanged != null) {
      widget.onChanged!('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          widget.padding ?? EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Search Icon
          widget.prefixIcon ??
              SvgPicture.asset(
                'assets/SearchIcon.svg',
                width: 24,
                height: 24,
                semanticsLabel: 'Search Icon',
                colorFilter: ColorFilter.mode(
                  Colors.grey.shade600,
                  BlendMode.srcIn,
                ),
              ),
          SizedBox(width: 12),

          // Text Field
          Expanded(
            child: TextField(
              controller: _controller,
              enabled: widget.enabled,
              style: TextStyle(fontSize: 16, color: Colors.black87),
              decoration: InputDecoration(
                hintText:
                    widget.hintText ?? 'Утас эсвэл дэлгүүрийн нэрээр хайх',
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),

          // Clear Button
          if (_showClearButton)
            GestureDetector(
              onTap: _clearText,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, size: 16, color: Colors.grey.shade600),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomSidebar extends StatefulWidget {
  final Widget child;
  final double? width;
  final double changeToResponsiveWidth;
  final List<Widget> sideBarItems;
  final Widget? header;
  final Widget? footer;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final double? collapsedWidth;
  final Color? sidebarBackgroundColor;
  final Color? drawerBackgroundColor;
  final Color? drawerIconColor;
  final Icon? drawerIcon;
  final bool expandable;
  final Widget? expansionButton;

  const CustomSidebar({
    super.key,
    this.width,
    this.header,
    this.footer,
    this.changeToResponsiveWidth = 700,
    this.collapsedWidth,
    this.sidebarBackgroundColor,
    this.drawerBackgroundColor,
    this.drawerIconColor,
    this.drawerIcon,
    this.expansionButton,
    required this.scaffoldKey,
    required this.child,
    required this.sideBarItems,
    required this.expandable,
  });

  @override
  State<CustomSidebar> createState() => _CustomSidebarState();
}

class _CustomSidebarState extends State<CustomSidebar> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final double expandedWidth =
        widget.width ?? MediaQuery.of(context).size.width * 0.2;

    final responsive =
        MediaQuery.sizeOf(context).width > widget.changeToResponsiveWidth;

    return Scaffold(
      key: widget.scaffoldKey,
      drawer: mobileSidebar(),
      body: responsive
          ? Row(
        children: <Widget>[
          widget.expandable
              ? AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isExpanded
                ? expandedWidth
                : widget.collapsedWidth ?? 60,
            color: widget.sidebarBackgroundColor ?? Colors.blue,
            child: Column(
              children: [
                expansionButton(),
                if (_isExpanded)
                  widget.header ?? const SizedBox.shrink(),
                Expanded(
                  child: ListView(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 3),
                    children: widget.sideBarItems,
                  ),
                ),
                if (_isExpanded)
                  widget.footer ?? const SizedBox.shrink(),
              ],
            ),
          )
              : Container(
            width: expandedWidth,
            color: widget.sidebarBackgroundColor ?? Colors.blue,
            child: Column(
              children: [
                widget.header ?? const SizedBox.shrink(),
                Expanded(
                  child: ListView(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 3),
                    children: widget.sideBarItems,
                  ),
                ),
                widget.footer ?? const SizedBox.shrink(),
              ],
            ),
          ),
          Expanded(child: widget.child),
        ],
      )
          : mobileView(),
    );
  }

  Drawer mobileSidebar() {
    return Drawer(
        backgroundColor: widget.drawerBackgroundColor,
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Column(
          children: [
            widget.header ?? const SizedBox.shrink(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                children: widget.sideBarItems,
              ),
            ),
            widget.footer ?? const SizedBox.shrink(),
          ],
        ));
  }

  Align buildDrawerButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          color: widget.drawerIconColor ?? Colors.black,
          iconSize: 45,
          onPressed: () {
            widget.scaffoldKey.currentState?.openDrawer();
          },
          icon: widget.drawerIcon ?? const Icon(Icons.menu),
        ),
      ),
    );
  }

  Align expansionButton() {
    return Align(
      alignment: _isExpanded ? Alignment.topRight : Alignment.center,
      child: InkWell(
        child: widget.expansionButton ??
            Icon(
              size: 15,
              _isExpanded ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
              color: Colors.white,
            ),
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
      ),
    );
  }

  Column mobileView() {
    return Column(
      children: [
        buildDrawerButton(),
        Expanded(child: widget.child),
      ],
    );
  }
}

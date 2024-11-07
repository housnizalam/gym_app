import 'package:flutter/material.dart';

class AmazingTabBarView extends StatefulWidget {
  final Duration? duration;
  final int initialSeite;
  final int pageHeitToBar;
  final double indikatorWeight;
  final List<Widget> labelWidgets;
  final List<Widget> pageWidgets;
  final Color? unselectedLabelColor;
  final Color? selectedLabelColor;
  final Color? indikatorColor;
  final TextStyle? unselectedLabelStyle;
  final TextStyle? selectedLabelStyle;
  final bool lowerBar;
  const AmazingTabBarView({
    this.initialSeite = 0,
    this.pageHeitToBar = 10,
    this.indikatorWeight = 4,
    this.indikatorColor,
    this.lowerBar = false,
    this.duration,
    this.unselectedLabelColor,
    this.selectedLabelColor,
    this.unselectedLabelStyle,
    this.selectedLabelStyle,
    required this.labelWidgets,
    required this.pageWidgets,
    super.key,
  });

  @override
  State<AmazingTabBarView> createState() => _AmazingTabBarViewState();
}

class _AmazingTabBarViewState extends State<AmazingTabBarView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      animationDuration: widget.duration ?? const Duration(milliseconds: 400),
      initialIndex: widget.initialSeite,
      length: widget.pageWidgets.length,
      vsync: this,
    );
    return Material(
      child: Column(
        children: [
          if (widget.lowerBar)
            Expanded(
              flex: widget.pageHeitToBar,
              child: TabBarView(
                controller: tabController,
                children: widget.pageWidgets,
              ),
            ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[900]!, Colors.black],
              )),
              child: TabBar(
                labelPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                indicatorWeight: widget.indikatorWeight,
                indicatorColor: widget.indikatorColor ?? Colors.black,
                controller: tabController,
                unselectedLabelColor:
                    widget.unselectedLabelColor ?? Colors.white,
                labelColor: widget.selectedLabelColor ?? Colors.yellow,
                labelStyle: widget.selectedLabelStyle ??
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                unselectedLabelStyle: widget.unselectedLabelStyle ??
                    const TextStyle(fontSize: 15),
                tabs: widget.labelWidgets,
              ),
            ),
          ),
          if (!widget.lowerBar)
            Expanded(
              flex: widget.pageHeitToBar,
              child: TabBarView(
                controller: tabController,
                children: widget.pageWidgets,
              ),
            ),
        ],
      ),
    );
  }
}

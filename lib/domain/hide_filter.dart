enum HideFilter { display, hide }

extension FilterEmptyExt on HideFilter {
  bool isHideEmpty() => this == HideFilter.hide;
}

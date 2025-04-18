enum CurvedNavigationBarType {
  inwards,
  outwards;

  const CurvedNavigationBarType();

  bool get isInwards => this == CurvedNavigationBarType.inwards;
}

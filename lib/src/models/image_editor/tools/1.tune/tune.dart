class Tune {
  const Tune({
    required this.brightness,
    required this.contrast,
    required this.saturation,
    required this.ambiance,
    required this.hightlights,
    required this.shadows,
    required this.warmth,
  });

  static const Tune defaultValue = Tune(brightness: 0, contrast: 0, saturation: 0, ambiance: 0, hightlights: 0, shadows: 0, warmth: 0);

  final int brightness;
  final int contrast;
  final int saturation;
  final int ambiance;
  final int hightlights;
  final int shadows;
  final int warmth;

  Tune copyWith({
    int? brightness,
    int? contrast,
    int? saturation,
    int? ambiance,
    int? hightlights,
    int? shadows,
    int? warmth,
  }) =>
      Tune(
        brightness: brightness ?? this.brightness,
        contrast: contrast ?? this.contrast,
        saturation: saturation ?? this.saturation,
        ambiance: ambiance ?? this.ambiance,
        hightlights: hightlights ?? this.hightlights,
        shadows: shadows ?? this.shadows,
        warmth: warmth ?? this.warmth,
      );

  factory Tune.fromJson(Map<String, dynamic> json) => Tune(
        brightness: json["brightness"],
        contrast: json["contrast"],
        saturation: json["saturation"],
        ambiance: json["ambiance"],
        hightlights: json["hightlights"],
        shadows: json["shadows"],
        warmth: json["warmth"],
      );

  Map<String, dynamic> toJson() => {
        "brightness": brightness,
        "contrast": contrast,
        "saturation": saturation,
        "ambiance": ambiance,
        "hightlights": hightlights,
        "shadows": shadows,
        "warmth": warmth,
      };
}

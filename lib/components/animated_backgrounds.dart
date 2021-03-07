import 'package:simple_animations/simple_animations.dart';
import 'package:flutter/material.dart';

class DrawerAnimatedBackground extends StatelessWidget {
  final Widget menu;
  const DrawerAnimatedBackground({
    this.menu,
  });
  @override
  Widget build(BuildContext context) {
    return PlasmaRenderer(
      type: PlasmaType.infinity,
      particles: 10,
      color: const Color(0x44150fdf),
      blur: 0.4,
      size: 0.69,
      speed: 1,
      offset: 0,
      blendMode: BlendMode.screen,
      variation1: 0,
      variation2: 0,
      variation3: 0,
      rotation: 0,
      child: PlasmaRenderer(
        type: PlasmaType.infinity,
        particles: 4,
        color: const Color(0x44e42323),
        blur: 0.4,
        size: 1,
        speed: 1,
        offset: 0,
        blendMode: BlendMode.plus,
        variation1: 0,
        variation2: 0,
        variation3: 0,
        rotation: 0,
        child: PlasmaRenderer(
          type: PlasmaType.infinity,
          particles: 10,
          color: const Color(0x440fbcdf),
          blur: 0.4,
          size: 1,
          speed: 1,
          offset: 0,
          blendMode: BlendMode.screen,
          variation1: 0,
          variation2: 0,
          variation3: 0,
          rotation: 0,
          child: PlasmaRenderer(
            type: PlasmaType.infinity,
            particles: 5,
            color: const Color(0x44e423db),
            blur: 0.51,
            size: 2.37,
            speed: 1,
            offset: 0,
            blendMode: BlendMode.colorBurn,
            variation1: 0,
            variation2: 0,
            variation3: 0,
            rotation: 0,
            child: menu,
          ),
        ),
      ),
    );
  }
}

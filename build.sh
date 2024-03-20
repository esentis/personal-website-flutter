fvm flutter clean
fvm flutter pub get
clear
fvm flutter build web --release --web-renderer=canvaskit
firebase deploy
echo "Cleaning up the build folder"
fvm flutter clean
echo "Getting the dependencies"
fvm flutter pub get
clear
echo "Building the web app"
fvm flutter build web --release --web-renderer=canvaskit
echo "Deploying the web app"
firebase deploy
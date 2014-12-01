TabBarOrientationExample
========================

A sample app to demo orientation lock on one of tabs in TabBarController. 

It uses private API `-[UIDevice setOrientation:]` to enforce interface orientation because tab bar controller does not rotate controllers when switching between tabs even if particular tab does not support current orientation.

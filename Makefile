test-prelude: 
	xcodebuild test -scheme Prelude-iOS -destination platform='iOS Simulator',name='iPhone 14 Pro Max',OS=16.2
test-prelude-uikit: 
	xcodebuild test -scheme Prelude-UIKit-iOS -destination platform='iOS Simulator',name='iPad Air (5th generation)',OS=16.2
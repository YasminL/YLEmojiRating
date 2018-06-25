# YLEmojiRating

Use YLEmojiRating to improve your Appstore rating (with a fun twist!). 

## How it works
YLEmojiRating shows a view where the users rates the app in emojis. The emojis 😱😨 and 😐 represents 1-3 stars and will redirect the user to the mail client to leave feedback. The emojis 🙂 and 😀 will redirect the user to Appstore to leave a review.

## Usage
1. Create an instance of the ViewModel:

```
let viewModel = EmojiRatingViewViewModel(appStoreID: "the ID",
email: "your email",
chosenStar: .none,
title: "CoffeMaker",
description: "Tap on an Emoji to give us feedback!",
cancelButtonText: "Cancel",
submitButtonText: "Submit")
```

2. Create an instance of the ViewController:

```
let emojiViewController = EmojiRatingViewController()
```

3. Choose  Modal Presentation Style

```
emojiViewController.modalPresentationStyle = .overCurrentContext
```

4. Present the ViewController

```
present(emojiViewController, animated: false, completion: nil)
```

5. Assign the ViewModel property in the ViewController:

```
emojiViewController.viewModel = viewModel
```

## License 
This project is available under the MIT license. See LICENSE file for more info.








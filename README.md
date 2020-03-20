# SwiftUI News App

iOS app developed using SwiftUI to display top headlines of the day using News API (https://newsapi.org)

Makes use of the excellent [`URLImage`](https://github.com/dmytro-anokhin/url-image) package for asynchronously loading images from remote urls.

## Building the project
You will need a API Key from [NewsAPI](https://newsapi.org) to build this project.

Once you get the API key, create a new file `Constants.swift` and add the following variable with your API key as the value

```swift
let NEWS_API_KEY = "<API KEY HERE>"
```

Once this is done, the app can be built without errors.

## Screenshots

![](./InitialView.png)
![](./ScrollView.png)
![](./DetailView.png)
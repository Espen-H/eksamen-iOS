# PG5600 iOS programmering

This is a half finished project, where I decided to prioritize to finish features that was the most important (in my assumption). Not really sure whats supposed to be written here, as it asks for comments and assumptions. Instances where code was taken directly/small modification is sourced, whereas explainations and examples that was used to get a understanding of how something worked is not sourced.

## Complete features:
Top 50 albums

Detailed album page

Favorite tracklist with the ability to add/remove tracks.

## Not completed features:
Different presentation of same data:
Not completed, segmented control added, but not enabled as there is no functionality.

Search
View and navigation exists, but no functionality implemented.

Recommendations
Not implemented

## Cocoapods frameworks

Alamofire made it super easy to handel the http requests and responses. Somewhat overkill for what was needed for this project most likely, but I wanted to use it. 

Kingfisher downloads the image from the url, adding it to memory- and disk cache then shows it using the imageView. Next time the url is used instead of getting the picture again from the source, you get the image from cache. No the need to wait however long it would have taken normally.

While the full potential of the pods havent been achived as of this time, but just by having it from the start makes it a lot easier for further development in the future if applicable.

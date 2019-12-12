## PG5600 iOS programmering

This is a half finished project, where I decided to prioritize to finish features that was the most important (in my assumption). Not really sure whats supposed to be written here, as it asks for comments and assumptions. Instances where code was taken directly/small modification is sourced, whereas explainations and examples that was used to get a understanding of how something worked is not sourced.

Complete features:
Top 50 albums
Detailed album page
Favorite tracks list with the ability to add/remove tracks.

Not completed features:
Different presentation of same data ?
Search
Recommendations


● Cocoapods frameworks

Alamofire made it super easy to deal with making http requests to the api and working with the return data. Somewhat overkill for what was needed for this project most likely. 

Kingfisher downloads the image from the url, adding it to memory- and disk cache then shows it using the imageView. Next time the url is used instead of getting the picture again from the source, you get the image from cache. No the need to wait however long it would have taken normally. 


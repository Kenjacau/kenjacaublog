blog_post = 
[
  [ "New Raspberry Pi 3 Out Now!", 
  "The new Raspberry Pi comes with baked in wifi 802.11n and bluetooth 4.1. It's processor has also been updated to 1.2GHz, 64-bit quad-core ARM Cortex-A53 CPU.",
  "https://cloud.githubusercontent.com/assets/12632927/13461330/b81a9c0c-e04e-11e5-91e3-7a511c053e77.png",
  "https://cloud.githubusercontent.com/assets/12632927/13461330/b81a9c0c-e04e-11e5-91e3-7a511c053e77.png"],
  [ "New MOBA game", "Cool new 3rd person MOBA game is coming out soon. Looks interesting. It's called Paragon by Epic Games.",
  "https://cloud.githubusercontent.com/assets/12632927/13376680/4a12c6dc-dd90-11e5-85b2-179d652cdcab.png", "https://www.epicgames.com/paragon/"]
]

blog_post.each do |title, content, filesrc, hreflink|
  Blogpost.create( title: title, content: content,filesrc: filesrc,hreflink: hreflink )
end

comments = 
[
  ["anon", "hello world",1],
 ["anon2", "hello world2",1],
 ["anon3", "hello world3",1],
]

comments.each do |user, comment, blogposts_id|
  Comment.create(user: user, comment: comment,blogposts_id: blogposts_id )
end

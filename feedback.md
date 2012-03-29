# Making new entries p.27 PDF version

First, let’s specify that #new_post method. Clearly it needs to return some
kind of blog post object which is associated with the Blog object. However, we
want to keep our tests isolated, and we only want to test one model at a time.
So we’ll make the process by which new posts are created easy to swap out:

We will introduce a post_source which our #new_post method will use to get
posts. By making this a writeable attribute we can easily swap it out for
something else. Finally we will provide a default implementation using
`Post.public_method(:new)` this syntax if you are unfamiliar with it ...

-- code snippet goes here
...




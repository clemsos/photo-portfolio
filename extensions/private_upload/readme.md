# Private File Upload #

## What does this extension do? ##

Ever asked private data from your visitors in a upload form? Stuff like a resume? Or pictures? Or a copy of their
drivers licence? Or do you need to store some data somewhere safe to be sure it doesn't get found or indexed?

Then you'd better make sure to store it properly! Don't store it in your `workspace/uploads`-folder, since that is
publicly accessible, but store it on a folder on your server on a lower leven than your `public_html` or `httpdocs`-folder.
This way, it's not accessible by just entering the URL to it.

## How does it work? ##

It's a mod of a regular upload-field, with the difference that instead of selecting a location to store your file, you
can enter the exact path on your server, allowing for storing in folders outside of your `public_html` or `httpdocs`.

The file is only downloadable in Symphony, when you're logged in, by clicking in the URL in the publish screen.

## Please note ##

- Not all servers allow storing content outside your `public_html` folder. Check your specific host for more information about this.
- Don't forget to change the server location when you move your site from development to production environment.
- If you wish to access the files on the frontend (for example, after a member login), you need to write some custom event-code for that. Check the file `content/content.index.php` for more information on this.
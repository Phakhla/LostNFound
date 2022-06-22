import { Autocomplete } from 'stimulus-autocomplete';

import { application } from './application';

import HelloController from './hello_controller';
import MapsController from './maps_controller';
import searchPostsController from './search_posts_controller';
import MyPostsController from "./my_posts_controller.js"
import ClipboardController from "./clipboard_controller.js"

application.register('hello', HelloController);
application.register('maps', MapsController);
application.register('search-posts', searchPostsController);
application.register('autocomplete', Autocomplete);
application.register("my-posts", MyPostsController)
application.register("clipboard", ClipboardController);

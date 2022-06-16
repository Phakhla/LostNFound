import application from './application';

import HelloController from './hello_controller';
import MapsController from './maps_controller';
import searchPostsController from './search_posts_controller';

application.register('hello', HelloController);
application.register('maps', MapsController);
application.register('search-posts', searchPostsController);

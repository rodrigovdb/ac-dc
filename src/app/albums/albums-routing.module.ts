import { Routes } from '@angular/router';

import { InsertAlbumComponent } from './insert-album/insert-album.component';
import { ListAlbumComponent } from './list-album/list-album.component';

export const AlbumsRoutes: Routes = [
    {
        path: 'albums',
        component: ListAlbumComponent
    },
    {
        path: 'albums/new',
        component: InsertAlbumComponent
    }
];

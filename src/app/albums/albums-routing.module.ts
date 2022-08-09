import { Routes } from '@angular/router';

import { ListAlbumComponent } from './list-album/list-album.component';
import { InsertAlbumComponent } from './insert-album/insert-album.component';
import { ShowAlbumComponent } from './show-album/show-album.component';
import { EditAlbumComponent } from './edit-album/edit-album.component';

export const AlbumsRoutes: Routes = [
    {
        path: 'albums',
        component: ListAlbumComponent
    },
    {
        path: 'albums/new',
        component: InsertAlbumComponent
    },
    {
        path: 'albums/:id',
        component: ShowAlbumComponent
    },
    {
        path: 'albums/:id/edit',
        component: EditAlbumComponent
    }
];

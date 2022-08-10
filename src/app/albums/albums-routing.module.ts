import { Routes } from '@angular/router';

import { AuthGuard } from '../auth/auth.guard';
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
        canActivate: [AuthGuard],
        data: {
            role: 'admin',
        },
        component: InsertAlbumComponent
    },
    {
        path: 'albums/:id',
        component: ShowAlbumComponent
    },
    {
        path: 'albums/:id/edit',
        canActivate: [AuthGuard],
        data: {
            role: 'admin',
        },
        component: EditAlbumComponent
    }
];

import { Routes } from '@angular/router';
import { ListAlbumComponent } from './list-album/list-album.component';

export const AlbumsRoutes: Routes = [
    {
        path: 'albums',
        component: ListAlbumComponent
    }
];

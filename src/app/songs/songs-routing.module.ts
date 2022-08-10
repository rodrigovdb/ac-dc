import { Routes } from '@angular/router';
import { AuthGuard } from '../auth/auth.guard';

import { ListSongsComponent } from './list-songs/list-songs.component';
import { InsertSongComponent } from './insert-song/insert-song.component';
import { EditSongComponent } from './edit-song/edit-song.component';

export const SongsRoutes: Routes = [
    {
        path: 'albums/:albumId/songs',
        component: ListSongsComponent
    },
    {
        path: 'albums/:albumId/songs/new',
        canActivate: [AuthGuard],
        data: {
            role: 'admin',
        },
        component: InsertSongComponent
    },
    {
        path: 'albums/:albumId/songs/:id/edit',
        canActivate: [AuthGuard],
        data: {
            role: 'admin',
        },
        component: EditSongComponent
    },
];
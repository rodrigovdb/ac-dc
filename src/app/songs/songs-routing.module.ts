import { Routes } from '@angular/router';
import { AuthGuard } from '../auth/auth.guard';

import { InsertSongComponent } from './insert-song/insert-song.component';

export const SongsRoutes: Routes = [
    {
        path: 'albums/:albumId/songs/new',
        canActivate: [AuthGuard],
        data: {
            role: 'admin',
        },
        component: InsertSongComponent
    },
];
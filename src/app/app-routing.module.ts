import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { AlbumsRoutes } from './albums/albums-routing.module';
import { AuthRoutes } from './auth/auth-routing.module';
import { SongsRoutes } from './songs/songs-routing.module';

const routes: Routes = [
  {
    path: '',
    redirectTo: '/albums',
    pathMatch: 'full'
  },
  ...AlbumsRoutes,
  ...AuthRoutes,
  ...SongsRoutes,
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

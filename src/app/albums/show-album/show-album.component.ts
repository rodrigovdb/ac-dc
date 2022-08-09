import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { LoginService } from 'src/app/auth/services/login.service';

import { Album, Login } from 'src/app/shared';
import { AlbumService } from '../services/album.service';

@Component({
  selector: 'app-show-album',
  templateUrl: './show-album.component.html',
  styleUrls: ['./show-album.component.scss']
})
export class ShowAlbumComponent implements OnInit {
    album: Album = new Album();
    loading: boolean = true;

  constructor(
    private albumService: AlbumService,
    private loginService: LoginService,
    private router: Router,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    const id = +this.route.snapshot.params['id'];

    this
      .albumService
      .find(id)
      .subscribe(({data, loading}) => {
        this.loading = loading;
        this.album = data.album;
      })
  }

  currentUser(): Login | null {
    return this.loginService.currentUser;
  }

  destroy(id: any): void {
    if(this.currentUser() && confirm("Are you sure?")) {
      const album = this.fetchAlbum();

      this.albumService.delete(id);
      this.router.navigate(['/albums'])
    }
  }

  private fetchAlbum(): Album {
    const id = +this.route.snapshot.params['id'];
    const album = this.albumService.findFromStorage(id);
    if(album == undefined){
      throw new Error(`Album ${id} does not exist`)
    }

    return album;
  }
}
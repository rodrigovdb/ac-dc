import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { AlbumService } from '../services/album.service';
import { LoginService } from 'src/app/auth/services/login.service';
import { Album, Login } from 'src/app/shared';

@Component({
  selector: 'app-list-album',
  templateUrl: './list-album.component.html',
  styleUrls: ['./list-album.component.scss']
})
export class ListAlbumComponent implements OnInit {
  albums: Album[] = []

  constructor(
    private albumService: AlbumService,
    private loginService: LoginService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.albums = this.listAll();
  }

  currentUser(): Login {
    return this.loginService.currentUser;
  }

  onSelect(album: Album): void {
    this.router.navigate(['/albums', album.id])
  }

  listAll(): Album[] {
    return this.albumService.list()
  }
}
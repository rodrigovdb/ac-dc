import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

import { Album } from 'src/app/shared';
import { AlbumService } from '../services/album.service';

@Component({
  selector: 'app-edit-album',
  templateUrl: '../insert-album/insert-album.component.html',
  styleUrls: ['../insert-album/insert-album.component.scss']
})
export class EditAlbumComponent implements OnInit {
  @ViewChild('formAlbum') formAlbum!: NgForm;
  album: Album = new Album();
  action: string = 'Edit';

  constructor(
    private albumService: AlbumService,
    private router: Router,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    const id = +this.route.snapshot.params['id'];
    const album = this.albumService.find(id);
    if(album == undefined){
      throw new Error(`Album ${id} does not exist`)
    }

    this.album = album;
  }

  save(): void {
    if(this.formAlbum.form.valid){
      this.albumService.update(this.album)
      this.router.navigate(['/albums'])
    }
  }
}
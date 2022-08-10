import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';

import { Album } from 'src/app/shared';
import { AlbumService } from '../services/album.service';

@Component({
  selector: 'app-insert-album',
  templateUrl: './insert-album.component.html',
  styleUrls: ['./insert-album.component.scss']
})
export class InsertAlbumComponent implements OnInit {
  @ViewChild('formAlbum') formAlbum!: NgForm;
  album!: Album;
  action: string = 'Create';
  loading: boolean = false;

  constructor(
    private albumService: AlbumService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.album = new Album();
  }

  save(): void {
    if(this.formAlbum.form.valid){
      this
        .albumService
        .insert(this.album)
        .subscribe(({data, loading}) => {
          this.router.navigate(['/albums'])
        })
    }
  }
}
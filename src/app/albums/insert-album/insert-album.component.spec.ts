import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InsertAlbumComponent } from './insert-album.component';

describe('InsertAlbumComponent', () => {
  let component: InsertAlbumComponent;
  let fixture: ComponentFixture<InsertAlbumComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InsertAlbumComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InsertAlbumComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

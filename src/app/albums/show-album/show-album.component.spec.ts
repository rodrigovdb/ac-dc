import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ShowAlbumComponent } from './show-album.component';

describe('ShowAlbumComponent', () => {
  let component: ShowAlbumComponent;
  let fixture: ComponentFixture<ShowAlbumComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ShowAlbumComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ShowAlbumComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

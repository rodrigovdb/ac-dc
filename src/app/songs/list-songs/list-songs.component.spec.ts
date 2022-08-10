import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListSongsComponent } from './list-songs.component';

describe('ListSongsComponent', () => {
  let component: ListSongsComponent;
  let fixture: ComponentFixture<ListSongsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListSongsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListSongsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

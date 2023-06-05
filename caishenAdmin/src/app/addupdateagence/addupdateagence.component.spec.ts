import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddupdateagenceComponent } from './addupdateagence.component';

describe('AddupdateagenceComponent', () => {
  let component: AddupdateagenceComponent;
  let fixture: ComponentFixture<AddupdateagenceComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AddupdateagenceComponent]
    });
    fixture = TestBed.createComponent(AddupdateagenceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

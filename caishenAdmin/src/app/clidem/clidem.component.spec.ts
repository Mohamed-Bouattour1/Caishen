import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClidemComponent } from './clidem.component';

describe('ClidemComponent', () => {
  let component: ClidemComponent;
  let fixture: ComponentFixture<ClidemComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ClidemComponent]
    });
    fixture = TestBed.createComponent(ClidemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { Component, OnInit, OnDestroy } from '@angular/core';
import { Subject } from 'rxjs';

@Component({
  selector: 'mgmt-main-{{dashCase targetFolder}}',
  templateUrl: './{{dashCase targetFolder}}.component.html',
  styleUrls: ['./{{dashCase targetFolder}}.component.scss']
})
export class Main{{pascalCase targetFolder}}Component implements OnInit, OnDestroy {
  ngUnSubscribe: Subject<void> = new Subject<void>();

  constructor() { }

  ngOnInit(): void {
  }

  ngOnDestroy(): void {
    this.ngUnSubscribe.next();
    this.ngUnSubscribe.complete();
  }
}

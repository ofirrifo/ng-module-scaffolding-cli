import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'mgmt-main-{{dashCase targetFolder}}',
  templateUrl: './{{dashCase targetFolder}}.component.html',
  styleUrls: ['./{{dashCase targetFolder}}.component.scss']
})
export class Main{{pascalCase targetFolder}}Component implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}

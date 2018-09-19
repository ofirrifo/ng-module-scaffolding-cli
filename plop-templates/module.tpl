import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EffectsModule } from '@ngrx/effects';
import { routing } from './{{dashCase targetFolder}}.routing';
import { {{pascalCase targetFolder}}Effects } from './store/{{dashCase targetFolder}}.effects';
import { Main{{pascalCase targetFolder}}Component } from './main-{{dashCase targetFolder}}/{{dashCase targetFolder}}.component';

@NgModule({
  imports: [
    CommonModule,
    routing,
    EffectsModule.forFeature([{{pascalCase targetFolder}}Effects]),

  ],
  declarations: [
    Main{{pascalCase targetFolder}}Component
  ],
  exports: [Main{{pascalCase targetFolder}}Component],
  entryComponents: [],
  providers: []
})
export class {{pascalCase targetFolder}}Module {}




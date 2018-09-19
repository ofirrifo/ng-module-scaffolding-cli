import { ModuleWithProviders } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Main{{pascalCase targetFolder}}Component } from './main-{{dashCase targetFolder}}/{{dashCase targetFolder}}.component';

const routes: Routes = [{ path: '', component: Main{{pascalCase targetFolder}}Component, canActivate: [] }];

export const routing: ModuleWithProviders = RouterModule.forChild(routes);

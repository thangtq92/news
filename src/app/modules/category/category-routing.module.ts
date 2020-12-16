import { NgModule } from '@angular/core';

import { Routes, RouterModule } from '@angular/router';

import { IndexComponent } from './index/index.component';

import { ViewComponent } from './view/view.component';

import { EditComponent } from './edit/edit.component';

  

const routes: Routes = [

  { path: '', redirectTo: 'index', pathMatch: 'full'},

  { path: 'index', component: IndexComponent },

  { path: ':id/view', component: ViewComponent },

  { path: 'create', component: EditComponent },

  { path: ':id/edit', component: EditComponent } 

];

  

@NgModule({

  imports: [RouterModule.forChild(routes)],

  exports: [RouterModule]

})

export class CategoryRoutingModule { }
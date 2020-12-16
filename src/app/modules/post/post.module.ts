import { NgModule } from "@angular/core";

import { CommonModule } from "@angular/common";

import { PostRoutingModule } from "./post-routing.module";

import { IndexComponent } from "./index/index.component";

import { ViewComponent } from "./view/view.component";

import { EditComponent } from "./edit/edit.component";

import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { InlineSVGModule } from "ng-inline-svg";

import { CRUDTableModule } from "../../_metronic/shared/crud-table";

import { CKEditorModule } from 'ng2-ckeditor';

import {
  NgbDatepickerModule,
  NgbModalModule,
} from "@ng-bootstrap/ng-bootstrap";

@NgModule({
  declarations: [IndexComponent, ViewComponent, EditComponent],

  imports: [
    CommonModule,
    PostRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    InlineSVGModule,
    CRUDTableModule,
    NgbModalModule,
    NgbDatepickerModule,
    CKEditorModule,
  ],
})
export class PostModule {}

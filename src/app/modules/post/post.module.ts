import { NgModule } from "@angular/core";

import { CommonModule } from "@angular/common";

import { PostRoutingModule } from "./post-routing.module";

import { IndexComponent } from "./index/index.component";

import { ViewComponent } from "./view/view.component";

import { EditComponent } from "./edit/edit.component";

import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { InlineSVGModule } from "ng-inline-svg";

import { CRUDTableModule } from "../../_metronic/shared/crud-table";

import { CKEditorModule } from "ng2-ckeditor";

import { MatSelectModule } from "@angular/material/select";
import { MatFormFieldModule } from "@angular/material/form-field";
import { MatExpansionModule } from "@angular/material/expansion";
import { MatChipsModule } from '@angular/material/chips'; //Use for Tags
import { MatIconModule } from '@angular/material/icon';



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
    MatSelectModule,
    MatFormFieldModule,
    MatExpansionModule,
    MatChipsModule,
    MatIconModule
  ],
})
export class PostModule { }

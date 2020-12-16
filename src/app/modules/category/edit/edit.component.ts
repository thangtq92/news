import { Component, OnInit } from "@angular/core";

import { CategoryService } from "../category.service";

import { ActivatedRoute, Router } from "@angular/router";

import { Category } from "../category";

import { FormGroup, FormControl, Validators } from "@angular/forms";

const EMPTY_POST: Category = {
  id: undefined,
  name: "",
  content: "",
  seoAlias: "",
  seoTitle: "",
  seoKeyword: "",
  seoDescription: "",
};
@Component({
  selector: "app-edit",

  templateUrl: "./edit.component.html",

  styleUrls: ["./edit.component.scss"],
})
export class EditComponent implements OnInit {
  id: number;

  category: Category;

  form: FormGroup;

  constructor(
    public categoryService: CategoryService,

    private route: ActivatedRoute,

    private router: Router
  ) {}

  ngOnInit(): void {
    this.id = parseInt(this.route.snapshot.params["id"]);
    if (!this.id) {
      this.category = EMPTY_POST;
      this.loadForm();
    } else {
      this.categoryService.find(this.id).subscribe((data: Category) => {
        console.log("data", data);
        this.category = data;
        this.loadForm();
      });
    }
  }

  loadForm() {
    this.form = new FormGroup({
      name: new FormControl(this.category.name, [Validators.required]),
      content: new FormControl(this.category.content),
      seoAlias: new FormControl(this.category.seoAlias),
      seoTitle: new FormControl(this.category.seoTitle),
      seoKeyword: new FormControl(this.category.seoKeyword),
      seoDescription: new FormControl(this.category.seoDescription),
    });
  }

  get f() {
    return this.form.controls;
  }

  save() {
    console.log(this.form.value);
    if (this.category.id) {
      this.edit();
    } else {
      this.create();
    }
  }

  edit() {
    this.categoryService.update(this.id, this.form.value).subscribe((res) => {
      console.log("Category updated successfully!");

      this.router.navigateByUrl("category/index");
    });
  }
  create() {
    this.categoryService.create(this.form.value).subscribe((res) => {
      console.log("Category created successfully!");

      this.router.navigateByUrl("category/index");
    });
  }
}

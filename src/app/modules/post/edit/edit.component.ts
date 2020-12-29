import { COMMA, ENTER } from '@angular/cdk/keycodes';
import { Component, OnInit } from "@angular/core";
import { MatChipInputEvent } from '@angular/material/chips';

import { PostService } from "../post.service";
import { CategoryService } from "../../category/category.service";
import { TagService } from "../../tag/tag.service";

import { ActivatedRoute, Router } from "@angular/router";

import { Post } from "../post";
import { Category } from "../../category/category";
import { Tag } from "../../tag/tag";

import { FormGroup, FormControl, Validators } from "@angular/forms";

const EMPTY_POST: Post = {
  id: undefined,
  title: "",
  content: "",
  description: "",
  sourceWeb: "",
  seoAlias: "",
  seoTitle: "",
  seoKeyword: "",
  seoDescription: "",
  categoryIds: [],
  tagNames: [],
};
@Component({
  selector: "app-edit",

  templateUrl: "./edit.component.html",

  styleUrls: ["./edit.component.scss"],
})
export class EditComponent implements OnInit {
  id: number;

  post: Post;

  form: FormGroup;

  categoryOptions: Category[];
  readonly separatorKeysCodes: number[] = [ENTER, COMMA];

  constructor(
    public postService: PostService,
    public categoryService: CategoryService,
    public tagService: TagService,

    private route: ActivatedRoute,

    private router: Router
  ) { }

  ngOnInit(): void {
    this.loadCategoryOptions();
    this.id = parseInt(this.route.snapshot.params["postId"]);
    if (!this.id) {
      this.post = EMPTY_POST;
      this.loadForm();
    } else {
      this.postService.find(this.id).subscribe((data: Post) => {
        console.log("data", data);
        this.post = data;
        this.loadForm();
      });
    }
  }

  loadCategoryOptions() {
    this.categoryService.getAll().subscribe((data: Category[]) => {
      this.categoryOptions = data;
    });
  }

  getCatNameFromId(catId) {
    try {
      return this.categoryOptions.find((e) => e.id == catId).name;
    } catch (error) {
      console.log(`error in get cat name with catId: ${catId}: ${error}`);
      return null;
    }
  }

  loadForm() {
    this.form = new FormGroup({
      title: new FormControl(this.post.title, [Validators.required]),
      content: new FormControl(this.post.content, [Validators.required]),
      description: new FormControl(this.post.description),
      sourceWeb: new FormControl(this.post.sourceWeb),
      seoAlias: new FormControl(this.post.seoAlias),
      seoTitle: new FormControl(this.post.seoTitle),
      seoKeyword: new FormControl(this.post.seoKeyword),
      seoDescription: new FormControl(this.post.seoDescription),
      categoryIds: new FormControl(this.post.categoryIds, [Validators.required]),
      tagNames: new FormControl(this.post.tagNames, [Validators.required]),
    });
  }

  addTag(event: MatChipInputEvent): void {
    const input = event.input;
    const value = event.value;

    // Add our fruit
    if ((value || '').trim()) {
      this.tagNames.value.push(value);
      this.tagNames.updateValueAndValidity();
    }

    // Reset the input value
    if (input) {
      input.value = '';
    }
  }

  removeTag(tag: string): void {
    const index = this.tagNames.value.indexOf(tag);

    if (index >= 0) {
      this.tagNames.value.splice(index, 1);
      this.tagNames.updateValueAndValidity();
    }
  }

  get f() {
    return this.form.controls;
  }

  get tagNames() {
    return this.form.get('tagNames');
  }

  save() {
    console.log(this.form.value);
    if (this.post.id) {
      this.edit();
    } else {
      this.create();
    }
  }

  edit() {
    this.postService.update(this.id, this.form.value).subscribe((res) => {
      console.log("Post updated successfully!");

      this.router.navigateByUrl("post/index");
    });
  }
  create() {
    this.postService.create(this.form.value).subscribe((res) => {
      console.log("Post created successfully!");

      this.router.navigateByUrl("post/index");
    });
  }
}





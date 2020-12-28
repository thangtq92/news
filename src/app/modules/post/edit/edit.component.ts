import { Component, OnInit } from "@angular/core";

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
  tagIds: [],
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
  tagOptions: Tag[];

  constructor(
    public postService: PostService,
    public categoryService: CategoryService,
    public tagService: TagService,

    private route: ActivatedRoute,

    private router: Router
  ) { }

  ngOnInit(): void {
    this.loadCategoryTagOptions();
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

  loadCategoryTagOptions() {
    this.categoryService.getAll().subscribe((data: Category[]) => {
      this.categoryOptions = data;
    });
    this.tagService.getAll().subscribe((data: Tag[]) => {
      this.tagOptions = data;
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

  getTagNameFromId(tagId) {
    try {
      return this.tagOptions.find((e) => e.id == tagId).name;
    } catch (error) {
      console.log(`error in get tag name with tagId: ${tagId}: ${error}`);
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
      tagIds: new FormControl(this.post.tagIds, [Validators.required]),
    });
  }

  get f() {
    return this.form.controls;
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





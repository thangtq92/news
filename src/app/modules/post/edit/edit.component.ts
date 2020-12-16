import { Component, OnInit } from "@angular/core";

import { PostService } from "../post.service";

import { ActivatedRoute, Router } from "@angular/router";

import { Post } from "../post";

import { FormGroup, FormControl, Validators } from "@angular/forms";

const EMPTY_POST: Post = {
  id: undefined,
  title: "",
  content: "<p>Hello, world!</p>",
  description: "",
  sourceWeb: "",
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

  post: Post;

  form: FormGroup;

  constructor(
    public postService: PostService,

    private route: ActivatedRoute,

    private router: Router
  ) {}

  ngOnInit(): void {
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

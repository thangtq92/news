import { Component, OnInit } from "@angular/core";

import { TagService } from "../tag.service";

import { ActivatedRoute, Router } from "@angular/router";

import { Tag } from "../tag";

import { FormGroup, FormControl, Validators } from "@angular/forms";

const EMPTY_POST: Tag = {
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

  tag: Tag;

  form: FormGroup;

  constructor(
    public tagService: TagService,

    private route: ActivatedRoute,

    private router: Router
  ) {}

  ngOnInit(): void {
    this.id = parseInt(this.route.snapshot.params["id"]);
    if (!this.id) {
      this.tag = EMPTY_POST;
      this.loadForm();
    } else {
      this.tagService.find(this.id).subscribe((data: Tag) => {
        console.log("data", data);
        this.tag = data;
        this.loadForm();
      });
    }
  }

  loadForm() {
    this.form = new FormGroup({
      name: new FormControl(this.tag.name, [Validators.required]),
      content: new FormControl(this.tag.content),
      seoAlias: new FormControl(this.tag.seoAlias),
      seoTitle: new FormControl(this.tag.seoTitle),
      seoKeyword: new FormControl(this.tag.seoKeyword),
      seoDescription: new FormControl(this.tag.seoDescription),
    });
  }

  get f() {
    return this.form.controls;
  }

  save() {
    console.log(this.form.value);
    if (this.tag.id) {
      this.edit();
    } else {
      this.create();
    }
  }

  edit() {
    this.tagService.update(this.id, this.form.value).subscribe((res) => {
      console.log("Tag updated successfully!");

      this.router.navigateByUrl("tag/index");
    });
  }
  create() {
    this.tagService.create(this.form.value).subscribe((res) => {
      console.log("Tag created successfully!");

      this.router.navigateByUrl("tag/index");
    });
  }
}

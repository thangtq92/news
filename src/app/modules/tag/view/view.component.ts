import { Component, OnInit } from "@angular/core";

import { TagService } from "../tag.service";

import { ActivatedRoute, Router } from "@angular/router";

import { Tag } from "../tag";

@Component({
  selector: "app-view",

  templateUrl: "./view.component.html",

  styleUrls: ["./view.component.scss"],
})
export class ViewComponent implements OnInit {
  id: number;

  tag: Tag;

  constructor(
    public tagService: TagService,

    private route: ActivatedRoute,

    private router: Router
  ) {}

  ngOnInit(): void {
    this.id = this.route.snapshot.params["id"];

    this.tagService.find(this.id).subscribe((data: Tag) => {
      this.tag = data;
    });
  }
}

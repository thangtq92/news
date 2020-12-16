import { Component, OnInit } from "@angular/core";

import { TagService } from "../tag.service";

import { Tag } from "../tag";

@Component({
  selector: "app-index",

  templateUrl: "./index.component.html",

  styleUrls: ["./index.component.scss"],
})
export class IndexComponent implements OnInit {
  tags: Tag[] = [];

  constructor(public tagService: TagService) {}

  ngOnInit(): void {
    this.tagService.getAll().subscribe((data: Tag[]) => {
      this.tags = data;

      console.log(this.tags);
    });
  }

  deleteTag(id) {
    this.tagService.delete(id).subscribe((res) => {
      this.tags = this.tags.filter((item) => item.id !== id);

      console.log("Tag deleted successfully!");
    });
  }
}

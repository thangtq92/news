import { Injectable } from "@angular/core";

import { HttpClient, HttpHeaders } from "@angular/common/http";

import { Observable, throwError } from "rxjs";

import { catchError } from "rxjs/operators";

import { Tag } from "./tag";

@Injectable({
  providedIn: "root",
})
export class TagService {
  private apiURL = "http://localhost:4000";

  httpOptions = {
    headers: new HttpHeaders({
      "Content-Type": "application/json",
    }),
  };

  constructor(private httpClient: HttpClient) {}

  getAll(): Observable<Tag[]> {
    return this.httpClient
      .get<Tag[]>(this.apiURL + "/tags/")

      .pipe(catchError(this.errorHandler));
  }

  create(tag): Observable<Tag> {
    return this.httpClient
      .post<Tag>(
        this.apiURL + "/tags/",
        JSON.stringify(tag),
        this.httpOptions
      )

      .pipe(catchError(this.errorHandler));
  }

  find(id): Observable<Tag> {
    return this.httpClient
      .get<Tag>(this.apiURL + "/tags/" + id)

      .pipe(catchError(this.errorHandler));
  }

  update(id: number, tag): Observable<Tag> {
    return this.httpClient
      .put<Tag>(
        this.apiURL + "/tags/",
        JSON.stringify({
          ...tag,
          id,
        }),
        this.httpOptions
      )

      .pipe(catchError(this.errorHandler));
  }

  delete(id) {
    return this.httpClient
      .delete<Tag>(this.apiURL + "/tags/" + id, this.httpOptions)

      .pipe(catchError(this.errorHandler));
  }

  errorHandler(error) {
    let errorMessage = "";

    if (error.error instanceof ErrorEvent) {
      errorMessage = error.error.message;
    } else {
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }

    return throwError(errorMessage);
  }
}

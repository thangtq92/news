export interface Post {
  id: number;
  title: string;
  content: string;
  description: string;
  sourceWeb: string;
  seoAlias: string;
  seoTitle: string;
  seoKeyword: string;
  seoDescription: string;
  categoryIds: number[];
  tagNames: string[];
}

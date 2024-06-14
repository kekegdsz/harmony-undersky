export class ExampleData {
  name: string;
  id: string;
  clickCallback?: () => void

  constructor(id: string, name: string, func?: () => void) {
    this.id = id;
    this.name = name;
    this.clickCallback = func
  }
}
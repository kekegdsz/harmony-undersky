import { exampleDataList } from '../model/DataModel';
import { ExampleData } from '../viewmodel/ExampleData';
import { ListItemComponent } from './ListItemComponent';

@Entry
@Component
export struct GroupListView {
  private list: ExampleData[] = exampleDataList

  build() {
    List() {
      ForEach(this.list,
        (item: ExampleData, index?: number) => {
          ListItem() {
            ListItemComponent({
              index: (Number(index) + 1), name: item.name, callback: item.clickCallback
            })
          }
          .padding({ left: 16, right: 16 })
          .height(48)
          .width('100%')
          .onClick((e) => {

          })
        }, (item: ExampleData) => JSON.stringify(item))
    }
  }
}
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
          .height(48)
          .width('100%')
          .stateStyles({
            pressed: {
              .backgroundColor("#f0f0f0")
            },
            normal: {
              .backgroundColor(Color.White)
            }
          })
          .onClick((e) => {

          })
        }, (item: ExampleData) => JSON.stringify(item))
    }
  }
}
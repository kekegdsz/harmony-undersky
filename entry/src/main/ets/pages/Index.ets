import { TopBar } from '../view/TopBar';
import { ToastUtil } from '../utils/ToastUtil';
import { GroupListView } from '../view/GroupListView';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      TopBar({
        title: "harmony",
        rightClick: (msg: string): void => {
          ToastUtil.showToast({ message: msg })
        },
        hasBack: false
      })
      GroupListView()
    }
    .width('100%')
    .height('100%')
  }
}
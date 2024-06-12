import { TopBar } from '../view/TopBar';
import { prompt } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {

    Column() {
      TopBar({
        title: "harmony",
        rightText: "设置",
        rightClick: (value: string): void => {
          prompt.showToast({
            message: value,
            duration: 2000 // 持续时间，单位毫秒
          });
        }
      })
    }
    .width('100%')
    .height('100%')
  }
}
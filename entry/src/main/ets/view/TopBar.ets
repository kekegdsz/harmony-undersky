/**
 * 顶部topBar
 */
import { router } from '@kit.ArkUI';

@Entry
@Component
export struct TopBar {
  private title?: string;
  private rightText?: string;
  private rightClick?: (value: string) => void;
  private hasBack?: boolean = true;

  build() {
    Row() {
      Row() {
        if (this.hasBack) {
          Image($r('app.media.ic_public_back'))
            .height(21)
            .width(21)
            .onClick(() => {
              console.info(`Succeeded in clicking the 'Back' button.`)
              try {
                // 返回第一页
                router.back()
                console.info('Succeeded in returning to the first page.')
              } catch (err) {
                console.error(`Failed to return to the first page.Code is ${err.code}, message is ${err.message}`)
              }
            })
        }
      }
      .width('20%')
      .height('100%')
      .justifyContent(FlexAlign.Start)

      Row() {
        Text(this.title)
          .fontWeight(FontWeight.Bold)
          .fontSize(20)
      }
      .width('60%')
      .height('100%')
      .justifyContent(FlexAlign.Center)


      Row() {
        if (this.rightText) {
          Text(this.rightText)
            .fontSize(18)
            .onClick(() => {
              if (this.rightClick !== undefined) {
                this.rightClick("rightText");
              }
            })
        }
      }
      .width('20%')
      .height('100%')
      .justifyContent(FlexAlign.End)

    }
    .width('100%')
    .padding({ left: 16, right: 16 })
    .margin({ top: 10 })
    .height(48)
    .justifyContent(FlexAlign.SpaceAround)
  }
}

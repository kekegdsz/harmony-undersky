/**
 * 顶部topbar
 */
import { router } from '@kit.ArkUI';

@Entry
@Component
export struct TopBar {
  private title?: string;

  build() {
    Row() {
      Row() {
        Image($r('app.media.ic_public_back'))
          .height(21)
          .width(21)
          .margin({ right: 18 })
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
        Text(this.title)
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .padding({ left: 26, right: 26 })
    .margin({ top: 10 })
    .height(48)
    .justifyContent(FlexAlign.SpaceAround)
  }
}
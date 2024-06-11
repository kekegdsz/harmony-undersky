/**
 * 顶部topbar
 */
@Entry
@Component
export struct TopBar {
  private title?: string;

  build() {
    Row() {
      Text(this.title)
        .fontSize(16)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .fontWeight(FontWeight.Bold)
    }
    .justifyContent(FlexAlign.Center)
    .height(44)
    .backgroundColor('#FFFFFF')
    .width('100%')
  }
}
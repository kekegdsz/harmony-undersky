/**
 * @Author zhuyingfa
 * @Date 2024/2/27
 * @Description
 */
import promptAction from '@ohos.promptAction';
import { BusinessError } from '@ohos.base';
import display from '@ohos.display';

export class ToastUtil {
  /**
   * 展示toast
   * @param message   文案
   * @param duration  时间 默认值1500ms，取值区间：1500ms-10000ms。若小于1500ms则取默认值，若大于10000ms则取上限值10000ms。
   * @param gravity   位置 Gravity TOP CENTER BOTTOM(默认)
   * @param padding   边距 。默认值：离底部80vp
   * @param showMode  展示模式，0展示app内（默认），1展示顶层
   */

  static showToast(
    options: ShowToastOptions
  ) {
    try {
      console.log("yvan showToast getGravity", ToastUtil.getGravity(options.gravity, options.padding))
      promptAction.showToast({
        message: options.message,
        duration: options.duration,
        bottom: ToastUtil.getGravity(options.gravity, options.padding),
        showMode: options.showMode == 0 ? promptAction.ToastShowMode.DEFAULT : promptAction.ToastShowMode.TOP_MOST
      })
    } catch (error) {
      let message = (error as BusinessError).message
      let code = (error as BusinessError).code
      console.error(`showToast args error code is ${code}, message is ${message}`);
    }
  }


  static getGravity(gravity?: number, padding?: number): number {
    let height = px2vp(display.getDefaultDisplaySync().height);
    if (height > 0) {
      switch (gravity) {
        case 1:
          return height - (padding ? padding : 80);
        case 2:
          return height / 2 - (padding ? padding : 0);
      }
    } else {
      console.log("yvan showToast height is 0!")
    }
    return (padding ? padding : 80)
  }
}

interface ShowToastOptions {

  /**
   * 文案
   */
  message: string | Resource;

  /**
   * 时间 默认值1500ms，取值区间：1500ms-10000ms。若小于1500ms则取默认值，若大于10000ms则取上限值10000ms。
   */
  duration?: number;

  /**
   * 位置 1:TOP 2:CENTER 0:BOTTOM（默认值）
   * 注意：同时设置gravity和padding，则按照gravity方向偏差padding
   */
  gravity?: number;

  /**
   * 边界 默认值：离底部80vp
   */
  padding?: number;

  /**
   * 0展示app内（默认），1展示顶层
   */
  showMode?: number;

}
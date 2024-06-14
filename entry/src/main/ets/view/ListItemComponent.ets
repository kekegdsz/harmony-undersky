/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { FontSize, FontWeight, WEIGHT } from '../common/Constants';

@Component
export struct ListItemComponent {
  index?: number;
  name?: string;
  callback?: () => void

  build() {
    Column() {
      Column() {
        Text(this.name)
          .width(WEIGHT)
          .fontWeight(FontWeight.BOLDER)
          .fontSize(FontSize.MIDDLE)
      }
      .width(WEIGHT)
      .justifyContent(FlexAlign.SpaceAround)
      .onClick(() => {
        hilog.info(0x0000, 'ListItemComponent', "name: " + this.name + ", callback: " + this.callback);
        if (this.callback) {
          this.callback()
        }
      })

    }
    .padding({ left: 16, right: 16 })
  }
}
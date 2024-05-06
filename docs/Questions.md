---
2024-5-6
**问题**：在`BCI_car_stimu.m`文件中，代码59行`Screen('DrawText',w,'↑',80+(wrct(3)-side)/2,80,0)`会报错
**原因**：初步发现是因为我们使用了箭头(应该是`PSYCHTOOLBOX`更新了,会提示`mxGetstring failed to get the string`)
**解决方法**：使用者可以更换为其他字母代替
感谢清华大学黄嘉玮同学的指正。
---

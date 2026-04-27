---
name: weather-fetcher
description: 从 Open-Meteo API 获取阿联酋迪拜当前天气温度数据的说明
user-invocable: false
---

# 天气获取器技能 (Weather Fetcher)

本技能提供获取当前天气数据的说明。

## 任务

获取阿联酋迪拜的当前温度，单位为请求的温度单位（摄氏度或华氏度）。

## 指令

### 1. 获取天气数据

使用 `WebFetch` 工具从 Open-Meteo API 获取迪拜的当前天气数据。

**摄氏度**：
```
URL: https://api.open-meteo.com/v1/forecast?latitude=25.2048&longitude=55.2708&current=temperature_2m&temperature_unit=celsius
```

**华氏度**：
```
URL: https://api.open-meteo.com/v1/forecast?latitude=25.2048&longitude=55.2708&current=temperature_2m&temperature_unit=fahrenheit
```

### 2. 提取温度

从 JSON 响应中提取当前温度：

| 字段 | 说明 |
|------|------|
| `current.temperature_2m` | 温度数值 |
| `current_units.temperature_2m` | 单位标签 |

### 3. 返回结果

清晰返回温度值和单位。

## 预期输出

完成技能指令后：
```
迪拜当前温度：[X]°[C/F]
单位：[摄氏度/华氏度]
```

## 注意事项

| 注意事项 | 说明 |
|----------|------|
| 仅获取温度 | 不执行任何转换或写入文件 |
| Open-Meteo 特点 | 免费、无需 API 密钥、基于坐标查询、高可靠性 |
| 迪拜坐标 | 纬度 25.2048，经度 55.2708 |
| 返回格式 | 清晰返回数值温度和单位 |
| 单位支持 | 根据调用者请求支持摄氏度和华氏度 |

## 数据流程

```
┌─────────────┐      ┌──────────────────┐      ┌─────────────┐
│  发起请求    │ ───► │  Open-Meteo API  │ ───► │  解析 JSON  │
│ (WebFetch)  │      │  返回天气数据     │      │  提取温度    │
└─────────────┘      └──────────────────┘      └──────┬──────┘
                                                      │
                                                      ▼
                                              ┌─────────────┐
                                              │  返回结果   │
                                              │ 温度 + 单位  │
                                              └─────────────┘
```

---

*本技能专注于数据获取，配合 weather-svg-creator 实现完整的天气展示功能*

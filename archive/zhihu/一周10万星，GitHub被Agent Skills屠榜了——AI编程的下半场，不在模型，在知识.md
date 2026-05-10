---
title: "一周10万星，GitHub被Agent Skills屠榜了——AI编程的下半场，不在模型，在知识"
source: "https://zhuanlan.zhihu.com/p/2034745148249208733"
created: 2026-05-08
description: "一周10万星，GitHub被Agent Skills屠榜了——AI编程的下半场，不在模型，在知识 mattpocock/skills 一周34848星，forrestchang/andrej-karpathy-skills 一周18662星。一个把自己的.claude目录开源的仓库，一个CLAU…"
tags:
  - "zhihu"
  - "clippings"
---
9 人赞同了该文章

> mattpocock/skills 一周34848星，forrestchang/andrej-karpathy-skills 一周18662星。一个把自己的.claude目录开源的仓库，一个CLAUDE.md文件。两个加起来五万三千颗星，一周。这不是GitHub star通胀，这是一个新范式的信号。

## 引入

上周GitHub Trending出现了一个极其诡异的现象：前十名里，有四个仓库跟 [Claude Code](https://zhida.zhihu.com/search?content_id=274236399&content_type=Article&match_order=1&q=Claude+Code&zhida_source=entity) 的skill直接相关。

一个TypeScript工程师把自己的.claude目录打包开源，七天拿了三万五千星。一个fork出来的CLAUDE.md文件，七天快两万星。一个整理别人skill的awesome-list，七天四千多星。

如果你还觉得AI编程只是"模型更强了就能写更好的代码"，那这组数据值得你停下来想想。

这篇文章想聊清楚三件事：这波skill爆发到底意味着什么，Claude Code生态正在发生什么结构性变化，以及为什么我说"知识编码"是2026年最被低估的趋势。

---

## 一、背景：为什么一个配置文件能拿三万星？

### 1.1 先搞清楚skill是什么

AI编程助手（Cursor、Claude Code、Codex）已经从"玩具"变成了"生产力工具"，这一点基本没有争议。但有一个问题一直没解决： **这些工具不知道你的项目是什么规矩。**

你的代码风格是什么，团队约定是什么，测试怎么跑，部署流程长什么样——它什么都不知道。每次对话都从零开始。

于是社区开始写一种叫"rules"或"skill"的东西。本质就是给AI写操作手册：在我的项目里，你应该这样做，不要那样做。

Karpathy那个CLAUDE.md就是这么个东西。他用多年的工程直觉，总结了LLM写代码最容易犯的错，写成一份精确的、结构化的、可执行的指令。mattpocock做的事情更直接，把日常用的skill文件全部开源——TypeScript类型体操、测试编写、API设计，每一条都是踩坑后的总结。

### 1.2 为什么是现在？

三个因素叠加：

1. **Claude Code用户量突破临界点。** 当足够多的人在用同一个工具，围绕这个工具的知识资产就有了巨大的分发基础。
2. **[prompt engineering](https://zhida.zhihu.com/search?content_id=274236399&content_type=Article&match_order=1&q=prompt+engineering&zhida_source=entity) 的天花板显现。** 大家发现，光靠聊天式prompt不够用了，需要持久化的、结构化的知识注入。
3. **开源社区的飞轮效应。** 一个人分享skill，其他人fork修改再分享，知识资产的复利开始滚动。

---

## 二、核心分析：三件事同时在发生

### 2.1 Skills：编程agent从通用工具变成领域专家

以前用Copilot，它什么都能写一点，但什么都不精。现在不一样了——你给它一份skill，它就变成了一个有十年TypeScript经验的工程师；你再给它另一份skill，它又变成了一个精通测试的QA。

**这不是简单的prompt engineering，这是一种新的知识编码方式。**

把人类的领域经验压缩成机器可以消费的格式，然后灌进AI的脑子里。知识不再只存在于人的脑子里，它变成了一种可分发、可复用、可组合的软件资产。

上周的数据验证了这一点：

| 仓库 | 一周新增星数 | 核心内容 |
| --- | --- | --- |
| mattpocock/skills | 34,848 | .claude目录下的skill文件全集 |
| forrestchang/andrej-karpathy-skills | 18,662 | Karpathy的CLAUDE.md文件 |
| ComposioHQ/awesome-codex-skills | 4,279 | Codex skill的awesome-list |
| Alishahryar1/free-claude-code | 8,276 | 免费使用Claude Code的方案 |

注意awesome-codex-skills——连"整理别人写的skill"这件事本身，都能拿到四千多星。需求是真实的，而且是饥渴的。

### 2.2 多Agent协作：从单兵作战到编队作战

ruvnet/ruflo（4,321星/周）是一个Claude的 [多智能体编排平台](https://zhida.zhihu.com/search?content_id=274236399&content_type=Article&match_order=1&q=%E5%A4%9A%E6%99%BA%E8%83%BD%E4%BD%93%E7%BC%96%E6%8E%92%E5%B9%B3%E5%8F%B0&zhida_source=entity) ，可以部署swarm让多个agent协同工作。

更值得关注的是TauricResearch/TradingAgents（11,252星/周）。这是一个用多智能体做金融交易的框架——一个agent分析基本面，一个看技术指标，一个做情绪分析，一个管风险。四个agent互相讨论，最后给出交易建议。

**金融交易是信息密集型决策，需要同时处理大量不同维度的数据。** 人类交易员干这个活已经很吃力了，多agent协作反而是一个很自然的解法。而且金融领域容错率极低——如果这个方向跑通了，其他领域的多agent应用就更有信心了。

把这两个仓库串起来看：ruflo提供编排基础设施，TradingAgents在垂直领域验证商业模式。从单agent到多agent，这是2026年最明显的技术跃迁之一。

### 2.3 知识管理：代码和文档的图谱化

知识管理这条线也很活跃。

GitNexus（5,423星/周）做的事情是，扔一个GitHub仓库进去，在浏览器里直接生成 [知识图谱](https://zhida.zhihu.com/search?content_id=274236399&content_type=Article&match_order=1&q=%E7%9F%A5%E8%AF%86%E5%9B%BE%E8%B0%B1&zhida_source=entity) ，还带Graph RAG Agent，可以跟代码库对话。Tolaria（3,337星/周）是桌面应用，专门管理markdown格式的知识库。

一个管代码，一个管文档，本质上是同一件事： **让知识变得可搜索、可连接、可对话。**

一个工程师脑子里有多少隐性知识？这个函数为什么这么写，这个架构为什么这么设计，这个bug当初怎么修的——这些东西从来不写在文档里，只存在于少数人的记忆中。GitNexus把代码库变成一张图，新来的工程师不用再到处问人了。

**知识图谱+RAG，这可能是今年最被低估的技术组合。**

---

## 三、横向分析：本周GitHub全景

除了Claude Code生态和多agent，还有几个方向值得单独拎出来说。

### 3.1 AI视频自动化

Pixelle-Video（2,659星/周）是一个全自动短视频引擎。给一个主题，自动写脚本、选素材、配音、剪辑，输出可以直接发抖音的短视频。

数字不算特别炸裂，但这个方向的天花板极高。AI视频赛道从Sora到各种开源方案每个月都有新东西，但Pixelle-Video的思路不是做单点模型，而是做完整pipeline——从"视频生成"到"内容生产自动化"，这是质变。

### 3.2 安全与OSINT

hackingtool（6,104星/周）是老牌all-in-one黑客工具包，一直在涨，说明安全领域的需求是持续性的。

maigret（3,729星/周）更有意思：给一个用户名，从3000多个网站搜集公开信息，生成完整画像。企业做背景调查、安全研究员做OSINT、普通人查自己的数字足迹——用途广泛。这种工具双刃剑属性很强，但技术本身中性。

### 3.3 API协议适配

ds2api（1,660星/周）是DeepSeek兼容的中间件，用Go写的，把不同Web协议转换成标准化格式。

数字不大，但这类基础设施工具往往是慢热型的。HTTP之所以统治互联网，就是因为它是一个所有人都遵守的标准。AI领域现在缺的就是这个——当API碎片化问题越来越严重，协议适配层的价值会显现出来。

---

## 四、预判：这波趋势会怎么走

基于以上分析，有几个判断：

**第一，Skills会成为AI编程的标准配置。** 就像.gitignore、.editorconfig一样，skill文件会成为项目标配。半年内，主流AI编程工具都会内置skill管理功能。

**第二，会出现skill的"npm时刻"。** 现在skill还是散落在各个仓库里，但一定会有人做一个集中的skill注册中心——就像npm之于Node.js包。谁能做成这件事，谁就掌握了AI编程的知识分发渠道。

**第三，多agent协作会先在金融和代码领域跑通。** 这两个领域有明确的评估指标（收益率、测试通过率），agent的表现可以量化。其他领域会跟进，但需要更长时间。

**第四，"会写skill"会成为一种新的核心竞争力。** 谁能把领域经验编码成AI能消费的格式，谁就是下一个时代的超级个体。这不是编程能力，是知识压缩能力。

如果后续Claude Code、Cursor等工具推出官方的skill marketplace，上述判断的节奏可能会加快。

---

## 五、总结

- **Skills爆发不是star通胀，是知识编码范式的信号。** 一个CLAUDE.md文件拿18662星，背后的逻辑是"人类经验可以变成可分发的软件资产"。
- **Claude Code生态正在快速成熟：** Skills解决"怎么做"，free-claude-code解决"用得上"，ruflo解决"一起干"。三块拼图，三万颗星。
- **多agent协作是2026年最确定的技术跃迁。** TradingAgents在金融领域的验证，说明多agent不只是概念，是真的能解决实际问题的架构。
- **知识图谱+RAG是最被低估的技术组合。** GitNexus和Tolaria代表了一个方向：让代码和文档变成可对话的知识资产。
- **AI编程的下半场，不在模型，在知识。** 模型能力会趋同，但谁拥有更好的领域知识编码，谁就有不可复制的竞争优势。

---

## 参考来源

- [mattpocock/skills — GitHub](https://link.zhihu.com/?target=https%3A//github.com/mattpocock/skills)
- [forrestchang/andrej-karpathy-skills — GitHub](https://link.zhihu.com/?target=https%3A//github.com/forrestchang/andrej-karpathy-skills)
- [ComposioHQ/awesome-codex-skills — GitHub](https://link.zhihu.com/?target=https%3A//github.com/ComposioHQ/awesome-codex-skills)
- [Alishahryar1/free-claude-code — GitHub](https://link.zhihu.com/?target=https%3A//github.com/Alishahryar1/free-claude-code)
- [ruvnet/ruflo — GitHub](https://link.zhihu.com/?target=https%3A//github.com/ruvnet/ruflo)
- [TauricResearch/TradingAgents — GitHub](https://link.zhihu.com/?target=https%3A//github.com/TauricResearch/TradingAgents)
- [abhigyanpatwari/GitNexus — GitHub](https://link.zhihu.com/?target=https%3A//github.com/abhigyanpatwari/GitNexus)
- [refactoringhq/tolaria — GitHub](https://link.zhihu.com/?target=https%3A//github.com/refactoringhq/tolaria)
- [AIDC-AI/Pixelle-Video — GitHub](https://link.zhihu.com/?target=https%3A//github.com/AIDC-AI/Pixelle-Video)
- [Z4nzu/hackingtool — GitHub](https://link.zhihu.com/?target=https%3A//github.com/Z4nzu/hackingtool)
- [soxoj/maigret — GitHub](https://link.zhihu.com/?target=https%3A//github.com/soxoj/maigret)
- [CJackHwang/ds2api — GitHub](https://link.zhihu.com/?target=https%3A//github.com/CJackHwang/ds2api)
- [GitHub Trending](https://link.zhihu.com/?target=https%3A//github.com/trending)

---

*作者：硅基新智讯 | AI领域观察*  
*同步更新于微信公众号「硅基新智讯」*

还没有人送礼物，鼓励一下作者吧

编辑于 2026-05-04 21:27・山东
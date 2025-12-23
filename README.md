[![Infra Base](https://github.com/11soat-f3-lanches-caieiras/lncr-iac/actions/workflows/infra-base.yml/badge.svg?branch=develop)](https://github.com/11soat-f3-lanches-caieiras/lncr-iac/actions/workflows/infra-base.yml)

# 🏗️ Lanches Caieiras Infrastructure as Code (IaC)

Este repositório contém a infraestrutura completa como código para o projeto Lanches Caieiras (lncr), implementando uma arquitetura moderna e escalável na AWS usando Terraform. A solução inclui VPC, EKS, OpenVPN, API Gateway, ECR, CodeBuild e outros serviços essenciais.

> **📚 Contexto Acadêmico**: Este repositório faz parte dos entregáveis do trabalho da **Fase 3** do curso de **Pós-graduação em Software Architecture** da **FIAP**, demonstrando a aplicação prática de conceitos de arquitetura de software, infraestrutura como código e DevOps em um ambiente cloud-native.

## 📋 Índice

- [Visão Geral da Arquitetura](#-visão-geral-da-arquitetura)
- [Recursos Provisionados](#-recursos-provisionados)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Pré-requisitos](#-pré-requisitos)
- [Início Rápido](#-início-rápido)
- [Workflows CI/CD](#-workflows-cicd)
- [Módulos Detalhados](#-módulos-detalhados)
- [Variáveis de Configuração](#-variáveis-de-configuração)
- [Outputs](#-outputs)
- [Segurança](#-segurança)
- [Monitoramento](#-monitoramento)
- [Troubleshooting](#-troubleshooting)
- [Contribuição](#-contribuição)

## 🏛️ Visão Geral da Arquitetura

A infraestrutura foi projetada seguindo as melhores práticas de segurança e escalabilidade:

[![Arquitetura LNCR](docs/Diagrama%20de%20Infraestrutura.drawio.png)]([https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=Diagrama%20de%20Infraestrutura.drawio&dark=auto#Uhttps%3A%2F%2Fdrive.google.com%2Fuc%3Fid%3D1rKZRqcxGfWoqetAgKH6eO4vvN72eppjw%26export%3Ddownload](https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22P%C3%A1gina-1%22%20id%3D%22phlAd238XfS2d-BJzYwy%22%3E7V1Zd6JKEP4185g57MsjIOCGiiiKL3PYBJRNQEB%2B%2FW0SzUQ0e8xNMubO9UALTdv1fVXVVd3NL5QLSjHRY1eKLNv%2FhUBW%2BQtt%2FUIQgsbBZ12wuyuAqfq0LnESz7org%2F4WKF5l7y88lG49y073ZXdFWRT5mRcfF5pRGNpmdlSmJ0lUHF%2B2jHzrqCDWHfuoGXWBYuq%2BfXLZzLMy966UQsi%2F5W3bc9zDk2GCvvsm0A8X7ytOXd2KigdFKP8L5ZIoyu6OgpKz%2FbrzjvtFeOTb%2B4Yldpi95IZs%2B4eT5uQkJfIMGcv4cj3PbvAz1eyL0mx36IQ48sLstiNxFvwDz%2BGgXzj4hqvPfiN4o6B5Th4XwKdndR3HBc1z8rgAblYPN54PNxv4oODk7Kh6qPF86EEDwT%2BUjbaZ74U2dw85CBQ6iW55oA%2B5yI8SUBZGIeg91s0CH5zB4LBwvcxWYt2se7UAdAFlyyjM9qCHkcP5vuPrWgGsMx08K9nXcSsJO%2BFz%2B04gd9f4vh6nnnF%2FV2Kb2yT1cntsp3eV16UAgHF9HJROzdXfepFiv50k2sa3ze%2BAZ5399o9umtG2RgebZkm0tg8%2F8ReCci1AcqxuuOf7jZ%2Be20nmASYxvufUNWdR%2FSB9f2ba9Q%2Bp6wQ94oVO317WXYlC%2B1449xBLT13b2v%2BcO5Tmur%2Fdo1ToMKMbUDSLkrUf6RY4%2FEVy4JPzo621vxy0yS4f4HzPFdGOAjtLduAS9wGdaWrP8%2BIv92GIJO4KD%2FXgNHZXsFdyNwi157y%2B1z7OffV%2FCQoO9hx9DV%2FpU74%2BSewHLD4johN5whjJs8zDroYflWQTqw2p3Vd1DvcPaHEiRybXPV83PN%2FLanks6qYiEPMmAVIQ8hs%2FESEK0ccSRKkjAdLohcRHYW8X31UJP6%2BEf4K2TevqAPT%2F%2FL1YuaXpoeImZy3CIHCioYNB%2BXK5REzzWUXs3yrec2r4aXXb0jMdlChbI7SzN5ETPqjJB9RECOiYmtgxNUkIPxD649kJXdl5dZE%2Bh7Qkw4CxwilpBUQgeOodpG1YYQSjKPh532m0NXzPrCH9uXSGCfhSZD4zsnmS9Q%2FInK7tzHT3fXUWys1eRhGhbttjEG8ImeIwQRBOYLG%2F%2BEhSBxj0dcP2R1HqZd4tBo0oy6Lg5V72A5I9Ryg9je9%2B6NIr63acMAp%2BjCmhnv1x9Mwu9N05kA10ACxI1LP6%2B7cgDDsFGNbA1yFucG8uLgQv4morrrbik2wFBDEYc8ZW8IRACOTH2YrTwd95W5F4OSD5BYwFhT5pLDD0cr4fTlz5fOXzlc8fymeSOuIzgUGfxmcCvfL5yuc38TmPTeQcbe%2B99lfHul%2FMWIZhSZZ6lrHqCJCC0IP6GaGRxrfXEH79DMvLwaFTH8LQ79v%2FAH%2FASHP%2FPTh5cMkbY6rUCdVp5NgPJxvDPOSClht%2FIdMPKuHHhMTfKr7zIXH8SIB4Q1ffoOjldPU%2ByWJbh1zsS8fuZ0RaV3IQQZRkbuREoe7zf0tZQPLQuifX32v6US3DWwGs7Czb7RWVvs2iY%2FEcAaE%2BGekZ0FI1DADsIepegpmeOPaT7cfOyyuxfT0DCu2oN871%2B%2F7WUa0n%2FwoPI46FdzIMTqNtYtr7uxrSu2%2FGiwS6glpcKa8nwxGppjeLaL1Y928Q%2FHsJ9FRa53%2FW50gLx8km1T5OXk%2FA8G3iOYqVnfWcznpP5zyos17UqSd1dNmtb3PmCc3Cc2XkaSF8etnBHTotPFd2zvdr3g2fuRtu3P245%2FVY6LE5mGiRMHR2%2BLG8%2FfuKgcazLlti36H%2FzmEDzl56znWz1%2Bk5w8n3lDcZSfx0NIMfezhg8HI8mPmInP9NHFW9YsfZsmKXEDbj2wl1g%2F1PyhR%2BmzIFvnh%2Bj6o3mUpkrPSCdUZ221i1YKpyyv%2Fp3RAfoXuZJKlDz%2FcX7PXVo6oZh46FDGONOVYnqhx%2B6npwcNeCFz4NepnZftaiwDQYBkAQTlAwQdEQDjfMy13nX8y80NTVvPw08%2FJICuunmhc99p7KbDGjzl1my75cagujGgbnUvYG%2FV725gUm5sgkfWV7g8GfaW9OnvZD7A3xjojQNfb75tjv1w34cgfr8eQsZ6BZ%2FqTAAnmhcy6VA58zdoJA0yj6lpjwvUVrGNwWRRAw2tRr%2B9Dx5FYnAvk8Ey6slSQCKXc%2FprZMtz%2FnTXkd9NQwkY2hEHXMfhT%2FAMt0NgDz4jAFfsLrU2fgoWN5zpxAB0inx5B%2BoyfT8J8QisT5s2mGe%2F%2BpqYqASr1VLr9rtXWkdPZ6pVFKny095wvT9CMVk7d3g%2B9f4O4iVOPaWwXSJOV6awDbbINe%2Fe0BKtY9EB9IGUfWCZSD9GbtAUHZ4U2UWIAwb3KuThMWDQifDL3oC0H4xabpCuEfBOEwyrwl6NDbfr4QgmnycxD80okyVwT%2FJAQvo8i6AXIILgRfgqI%2BB77IFb7%2FIHzNbQo69mLuA018OHjPBiVeOqnpGkg9Ht9%2B4UDqP5an8%2FXAsPRzg9Y7it6AYbgbJaA1b%2BTqs3FUlD529T8ijvp4BPEDyHpdgPLyBSh2VkTJ%2Bk%2B9%2FPuPoft6aN4%2B%2FARsg%2F7bJk%2B9IEzfmDh1v5PFh0%2BbIvdW5h2B%2BlvCPnUhdgLNz84g26WXzfdf1MdaXf4b35%2B1ygeXtXYPTkZ24oF%2Bvo0sviIT%2FdkRf%2FKw1vww%2BWcfiHhhxrg5deitEfxmMzD0ZA7ShYP25PvnjH1NNB8ADL0TwG%2BZV%2FHZaEYg%2BB1oRnH8Y9DcbMb%2FgOb3T2n9mmj%2BDigk4KZWfA0Km3djKP3Z4KH%2BBfD8dMMOIe8x7ORHGfZGMzCUuhyan5g1fQ1a%2FKSgxf3uFf9G0GKZlucGkYJS%2Fqq3FEzA5zC2w4XwtsnGrx9UEhD8EatxzvOVvPL1p%2FG11UIxjPtn%2BJraZmJn6Z9AD3XnfADob0Lgbl2kkfxdE3myknJf3weuoXzBTibUcT4XOR3DfBzlrxO0r5T%2FZyh%2FmEj0RYmPkMjnEf%2Bl24leiX8l%2FrclfmMC4RflPU7Dn8Z7%2FDqR4Mr7H8%2F741mXX5T2BPWJtL%2BG4q60%2F%2FG0fzBV9YtynryMi38%2BmfTm7QPud0b7msmkfymvjpLHRoJAX7POs3k3TjTAdul8JnGF4LeHINyYNvk6CGLI8fR%2B4nRDuJdmNJsN%2BWw0U8hrwXtdXdxwsZ70e37wzpLXtwS87C0BBP5pbwl4aSDkwPrriOjLj4j%2BsRUV9u1utSdcrSckqKPBhUYwn%2FaeBfLVruJ1FcV7V1HcXgb0%2B1M7HnXE2YWghcONl7HBF3zjE%2F5B6Lqq%2Fy%2Bj%2Fjkawc9v1vIj1X9ind34MtZ3QQ3p04DXuKV87kSWw8qOg6k4BJffw2a45yHOBqr%2B4DRuGBXXwhPp5qNMxZXMX4bM1%2Bh2k9jKIV4NSfuLLkNbij42w8gHeHhnk1LvYO11Q4YnNM%2FX3pDh3j69BbzP7scAN5ZPYDR2saTqYXPDd0S3v%2FwKrhdsjg%2Bj5wX3zs3xT3MXjb01Lvwqg3e8Ruiqnb6tdmpOFb2IkkKx411jLqmk3rxVwP%2Bjo0Cbkt1tZu0um1afanuC3J78za3dnu0enr1hgeAzGwQ%2FETv439NwBPEQHK%2B9%2Fpm03WmujfxU7Qsj3wu374fa%2BW54RN9ceDH%2FYYORw8B97%2Bk8uur%2B6eufgVrz7pO07qWhdo0e%2FLjowT8WCrQic1sPqizjT%2BFl7p8gCp0InJhREAM9sX993AsWwz0ICrb2dbbYz10E08gAf0jQ8Ilxy5X3V95%2FW94%2FkgJ4w3q3z84NoAdSXZ7m1%2Fd7X3TW1j85PcsiDAI%2FMz0LqBjENJ%2FVG49Pz3p6GlZLz3RQonz0JKyn39ZN0Bfj5pkdJ54k8dUEX03wtzDBr195%2BtkWuDEv%2ByPmcZ1faX5meH3l%2BJXj35%2Fjr1tu9un8huHPITj85k0LrymGpx2jD8%2BpNt%2B18dk51cNUku8ClUtJl76IdMnG69g%2BPWfz0j1lrgG1q6X%2FVpb%2B63vzZON9sJeLpyHfLDN7oVlPj4ntnTqcas56OmwY8FkW%2Bh3R0qsO%2F5o6%2FDqVuqnPH18j8f9s%2BHnst6EX092H1yxc2f1z2P2PeWhmZNnG1vOtF%2FD6r4fGgbvY27suReFjBh%2FG2R%2FP4Kt9vjL4BzP48d25P5nCl5yTjb90o%2F0ria8k%2FsYkfixe8slUJg4vBft4Ir90%2B%2Fwrka9E%2FoZEfibueXEeQyd%2BNXYhJh%2F2oboy%2Bcrkn8jkp3fE%2FnQiX9K7PmRCrlS%2BUvknUvmJaUfc%2FX2fxGOc%2FgCDfJach%2FWnT6YZv0VC8UPnG%2F06yU4iY6UXrDOy28aqBVOVU%2F5P7%2BZDtmR49bJRGMWP0HFz2Dvm8dc100%2Ff8dzS0ZMn3q8ref2bo8njRfk3cHPjmwtvLwwfhqlfD%2FIXWkh%2Ft9HQ58O0sb4BgOYZmJ7c8SywYeq9wKabbXwZsD8KjfSZRMMz%2FtIFNtq8vbx1Yve%2F%2FUab29ROzs40mt5%2B8RbrTZ5uO0Ier%2BsB2rYBKgz%2FAPN9E0dVr9hxtqzYJYTN%2BHZC3dAvUl3X9XVfYVd06AxyP2XZnW6awDJl59x66PavoRD2P%2F0jtj637KW%2BvZv88eSKO9HL3K0Byhiz1idvpCZ66lnfT%2Fq43wWDaFol7ANGyOfJeWYayHUsfB0Lf7%2Bx8KUDVwiFPuL5XYCV5MXdf%2Bht7v%2F%2F4qVTGP0bP34TNvwaD%2FrR%2B18%2FNDxTFdWo6%2BPGhuex8ZJt3P4XbHx4dONyQHtawERzwAVB74BLs7YTtXFhwMCH1l8RcyHVRND3f8eq4WYfE31anbz09hepuccrg7GXrfB7dcXNlYMfh%2BezAc3DYtafA%2Bf%2FB7mNbXcO8HgcBc0b8OfAjSNP3fAsnB9p4Bvwi8O%2FcQjCYBTHEZo6JCoOm5oj8G%2BapkiYoCiYpFGqMeX%2B4ur5RfC9DsG%2B5hDsn3vR1NlVNDw3%2FnWxYdexFmnS8y2DrvN2BXmFXXnwLtJHWI18Nwt0nKV5IpT7DlP1rlHxfZ8%2BrSkB%2FrLjXjkhT5NjgWdZdwKog5n63yjnsaKtdUXd5%2FuA52ng5UzmYl90whjRy9p1NPENpDkTQiSapEEasQoMvVSsAobObJ55tV%2FfxX5dQ4hnQog3LTv2o93lTFqDnfv92D%2Fepr1IYR7J97mNHU8E6TeAcKJkX4mUpnAL2%2FCBFUx%2FO%2Fv8S0NonyYkjPgAFXre8zgz4%2FiMBt13jBfojv2S%2Fr2VDKuba%2BfWrzjNdz1C1Sbdbh%2FIHEqhQ0ldVb0JJcrcnSJCHDpAL3kqOxwXUE90Igb8DZSpy08dcDTkwUfL5RipLu8aSrdTH%2BgqK6n8vO7C238Uk0g8s%2BljTEwSKTZc8UDbsRCTUDITG9UWnOQ56PR6RXZl06MlsD%2FCCF3TuQOuGVH3FUnkSCTwbQEOcxNZItuRTC67TmkpPYgmEtC97LjaZSaxlTYRutUn8JYB127TLQxGiGwyp0ZjNafocmfpHDTYydCgxKsswmXaaoOGS%2BXU52V1jIVD2CK03iphO1ZnkZFl7OT6ptsF41UBDMEFXFBXQOdOx7IKiM6GCfiojLG4CthMENS71gaVlortlutAxmBTDMBvFtTdpEOzvbm%2BLiUS6rFjb0JASkm3oOFgwmZIgiXbgN3wXR4tyu4ijNaey0BTxF24MEV4s%2BVOm66GcWp7bNJWOyuNFrxZ3R0a4QoLx17JsanwtgxK1hthPeElZTYmBlxcaKURk6C4kDlEGybmBNIF2dHspTyoIJ2VnWGfH3j2yunxbIuhWHvD4SbnessJBq%2BXXWolSxVi03abzqs2BRmipIDaZBW3umh%2Fgbe64AwlkHW%2BHMhLsrMT%2BW7SGUJSPzfbdQ%2Fhs%2BFoFnQoGk5Svuz3vemA9JQS1sB93dkgWov92RB1qrIzlB12wa18HEAVYTdQASuc1xZ1QwqcdVoIrWCtwoXc2fJm5pbKymUdmYqUVVmW1WYmui4Br3c9E0X6LLmlMtsda3x7Qsg5XE56JumCSm1nApOQ2M4cIygIUVYHJmhGu6Lak2S0pSQzdV1Qwpr9AWSTQxOiDVSjhqkPk8HKjwTUBbBirU2vY1qxOvTTblGoLo%2FGul7jrZoG4JPdwGi2riiZmG6d5XqrqG5uaDsqYPhsBikjEe1jsRNS3QRTh1wS0F1%2FpSynCiG3F8vuBI7mstZpI8jWwcXQXRcC0ufvOKJ07Om809%2FCrmHZOgfLOGl2pxjiqBAaTMNpl6gFLXqz2A6wAcXJit4DanMrY2sVJWuNNgEVpQNhMuLHskeHltahl30vZemE9xUdXODaPAs0s9CqhceBPhN0rmt4Qv27c0HmaygN0c6ak8uogHcTgU2EUcDrRunL3dYwWGFiJjo4llidfhUtMjefkfJ260rsqlju4BE08Wg4GlDjyQ5bFxnF5gi5hOkheCare7lq7RYFpxeJNQQFkt3OXHfSCuQVeGykqcqIr49wk%2BL64xxcMez4ejcqBzLRHdleb9hBvW0PKDC2q3dqZAo0zVLBwN3VOm1X9uQg3E3aAJFID7Go0Fv0u%2BNolK6WzABc0ZvUlkIY5C2ecGMYyzxMLUFly3QlW5tRH9EtR5Umo26%2BrtlPp9HOHE9r1YB222WxoGoFMIFVu%2BhjY0Ll8yiqUWfKI1ia412vg45Sv6rbpbR7Y4fyrbBf5soI0JZdoKmrMGatrtY6upmRFOb1UWQRJaSawwsHIIvd9q3h2psOnW5eosRAjPFWWxhLa7qfyO5y4JEbdRxOscm4YywHZJDzbQk8y6QHUb8rlfhsUYTmWBPRWvF2g0rh%2FIonDa6WO2547izmkaCFrsa6Ivoc32Z8VfO4WBzmhG%2BOsn6EEXoRCdJuwKB5RXRyqJvXvTYuRglR9GjNMRRyExJtOakcCKN7awATyesQDNzu5IrdS%2F3CAw2ZCeJ0JQtdUZjyJqzYwmZrFQ44XyiyvnRQfZXFDD%2FlVDfy7HWvlqegtjFbX9lWpIHbEVJHRHTSnbeLIXNHDV%2Bc1z0k1NIqCBddzHOLbJMSpKyWRgwEag46SifoQHG%2Fk2ptMkqViYYb%2FC5wXZtYIxWDE2EQWtOOScsIVmj8Nq9kio%2F7dJFJ%2FVa%2FZ4yiQVZg2kCsdAmLJ9vhRjHzLGVbA3TegvQlYjOxVnfIQoEyvk1MaDIeteeCwC36pb3ZSkW73OFU16htRFfVamW9hB2jA%2ByoSY3tnTUaMjlNZqNR4opia8rVsCgphqExKbJrJKGJmxYVCyuSNJ14m5qoE9xc7nRPLlk%2FwUy54tqdUeGVBoMC5Ao0Wfh5dKuIoaEJQBJOpbo7%2B8F8UQKTzNS19kRY7MSjecCJo4XfstFd1xPFKNyJY432JjV3cF4tXU8ZLDyl3%2BaGPUHopcMatlDfqY1vUbWkECVYNRAHXdbddjuDVa3FyUw2fDRHmHIVeKWriBJR1HpYATa4wmecJztyT4S6RTwdR%2FpEGG%2FF6QBi6nmK7HrW7yyVNmO5TDERc5IS2t6yRea1Lc4L0wkWxixauMnWhmVh2okpetvh3CHlyJuNUiKjjHMDLoeHee10oIoIPgchgnGJusM52oHrRyilZ3dXHVNBbaElTXGujSR%2BC83Q7sjrBVq07BvotHRrBwNzgEoSYHNhAAbNx4Xa4u2hMNLKRQtr9XMh9TkBG6zwjiCTGxmdSrfOAJutkC5hYybVXa06UyWqKiXuB2k8dnUydCNY3LX4kFqayG6YO%2BOxFcKsT2ka403qCvS5ApOcLgtVFmi7BVurX1tbWp18npulyyHFJIRISarw2irXunGNUo7p1NgSdTIhW1QIV11hgzprxbKVpDVlHFYuyimxFsXOZNuez3ehpHgW7CiutVq25MjQ5irR78gFXYnjSDKTfMrmO1LpZOrcQpFJ7Y9JfQ8MrpxdnGyddOcNpM6kBqPNU246dn1gqZcIs96YcHQLPk0znRSoVjaCNM%2FqaqjGj90V11erzrRX0DNtQbr%2B0KfrHpbmqOEMc0iKJoS5q1iPlAxlsIXMGBv1QRWuE4gsUeN2Ys8xLYO781IEfjiDjaGVWXhLKR64wmS5iaOICBV5II%2FVYKYZNJtCazcGTyB3bV51%2FbnkTNY%2BcDnZOaTWrS8sGjP5FV0r6JUetbb4cGF7c6UXGxu8blpFpygXtocL1cXxFhqq2xxSpEXkz7jOhlqwcwTRsIWbS3NbVcONj6MlbIylnTOjum7u8DXxamXlDRdyZypt3YzCulTNr%2B7Y9VqlSySOpqnbYbevTVAjkyl35fWk8S6EzGGBrpeBOxN8uh9Vot4Dd20CAeMFrC8Ki13HbJHRXOWpltKPpjI0tSQT9rDeMEV3Iy9h2jGrFW0G6yQ7Plq6G75nx6AWym3bg97KwDW53dJa3CbBQncIy0yxVgfDNTBuLEAV24bCxRqMflif0zvyaj3A2sIOiqSYIBUbnrdjzvepTZkG2TLZBWPJxQZzv1wuiSgzLCzzEbaImOVsECTmogo6UTod6RpuI%2BW2DEVUlDWr1vGG5a3cnVik3qi2UIB5eMvpiLNORzSAoa8tLVVwU81M1toIU1zUXgTZuDanM6diO1JRkoMehTjScoQVbt%2Fh4cAWQpkw1NaSbCdxJZkiKa5ZQpyr4RwP3EWGAz03FHlCsjctSfI2Y45cykMZGc7sME6jsuLmWn%2BVLNSVrpYzjZlWqhBKi0m2Gs800Y1alVi1Ql6cKXJntjUmC27Y4gdh7VUiUIul6TSU2QIvTGKctzvgV02rlFlWeXvYh6Tal%2Bx3MFjvwjSqwtZ2teE2hDAwK2ynFtiyovKFqWUVRsMT1rLV0S4JtluaRMmWJbrDXPDhtHZ24Fm6bcVbe4DPc3VKzIUc%2BMBugS2WjCb1tJ7tZ12x9rDaG2LU5jFhOi61hYRqQTKOsaBC%2BxmKyit%2FUQM04VvL8QhDt%2FGOsAk%2FMreUHsQ1eekQGWlqVKz0NEstXLCxIE37Y69QNX0qhGw5a9MDrVZROxZbbXu7UnbtdErgEioJMCNOpwafjRdlOc7ieMDtph26WJTrfDrvT%2BcYvFVSeVBi3qYvsIqsmpZC1w0aD0pz0BNItxdsRHJFhJvxkN4leVFkm3BIp0nClfh6LWZexu7qh%2BsrMO4ygffQW4NGq6bDZXDh6jSweBMVIciyz5McnoAvhZmYzzAmq9r6FlTHd7F5h1gY7dqGt7dyV6jA0VylZxOmNjq0o1SUmEFGSIWbYFeu3XWmzKSsVxbqeI6nfWusOl2MnewqtU3MjZFBrmJt1uqP%2FdECckmo285nfRw1cWs2D2W0lGgwmHaX8GK9tqWNP8an9FgsDU8kNjhQQiyoVvTKYOdqubabh4Ub2M68JCdpMSa2ndKLd0i8TEebqbWOanJOyLxc1maXGCJzCkVUBh1krtqpECnYOh2E6EJta7jsckG7Vnv%2BnetUTPOhaFPhiAAEdNpLQh6a2SCDWn7cKZ1MQpa6Nc1plIlwTFJ4I9BRPOxbmZEy85qnHSMQetW0nXHxvNjOqnVLMVC4IEpFjHaeNTIIE23xvV5G9FkDqvJhqo5qMHYdBd%2FIy9CDjMkGt1KTUM2F06d9ZwAs43xH0fxq6DJhiS3anYos50xfZ7dzqTYooBe76wWbRy0CX6YtQgzVnaH1nFG4sKUq6flxXLmFX2DrnTHdKuuui%2Btph6aDxTolVJjE%2BRWztHR9wBhDbTOg0awfL9k83URkjOr1VFqB5sq0J%2BpBCjnchMPgEl1PpwLf72XQ4M60LzinhHKehIH9m%2FRcc4P6ZL9dIwV1qHnVH9V2ZCpUI63CZhTobQGi2%2BoQmrXabbPNbCe7raTX44sgmk1Ep61hHOm3piNbbmfJGhlZZI%2BvRqEFc6IzUfg87%2BfsrGvIxQxTJ1pKjTfeYilDJnCYsm4cj2Ztrax5GiJOyrXGfL9bLtweT7rMIid4YScac0jSW5riwWRZMRVsBlkq29agz0AitsTX267hmgjW7erGlAwpO%2B30WxoiYqEvh1Uh9MV1Wg9nwP8iNtuU1jAPNp3aCzQ5JMPGrjXdBVW%2BmmMQa6UbUM4yuel1OsaujNaT5QzYYWBIS7Enjkqin6d1PzI5A%2BUFESdlzjIBWho7rmB4aUBv1G3VX96OSUMGZtBJBPMsJtg6MmanLYFFStXrrfgN0D4oPJ7gMJPJy1qjtgMY3jHxph6Lpzjk8siS9heUG5SzJMbEmDEmfVgY15at3VuHlcEt3K5n6dxi3EZJZ5CU6Cq9o8a6n2eQqrNqJi384aY2NfV7DdloZmNaPRJYpEi%2FxQ5GWJsHngUbDyV7UZupOj7GMMpUHY57OKd1OnXg70ycum37oJnQIUgN3F4UrsNyTBxfMBr6G3rxFAry%2FYFSuOchzgaq%2FuA0bhgV18IT6RDO%2FpAM7WHm%2B%2F%2B04%2Fz9iXacrf3gHeePszp%2FQ7%2FPrNE72%2Fuflfw9%2B%2FB9ktG8y0vsU7S%2F7udSHiHgCeg0pH0bO79csvg061u%2FqwlSDjuLvpCrZ3t4fwv0G4WeWBzyyIwo9Ji%2BjcRGtFym9isnO4HTJIqyh5fX6RspsuoO5v8D%3C%2Fdiagram%3E%3C%2Fmxfile%3E))


## 🚀 Recursos Provisionados

### Infraestrutura de Rede
- **VPC** com subnets públicas, privadas e de dados
- **Internet Gateway** e **NAT Gateways**
- **Route Tables** e associações
- **Security Groups** com regras específicas
- **VPC Endpoints** para S3

### Compute e Container
- **EKS Cluster** (Kubernetes 1.33) com managed node groups
- **EC2 Instance** para OpenVPN Server
- **Lambda Functions** para custom authorizer
- **ALB Controller** para load balancing

### Storage e Dados
- **ECR Repositories** para imagens Docker
- **FSx OpenZFS** para storage compartilhado
- **S3 Buckets** para artefatos e certificados

### CI/CD e DevOps
- **CodeBuild Projects** para automação
- **GitHub Actions** workflows
- **Secrets Manager** para credenciais

### API e Networking
- **API Gateway HTTP v2** com CORS e throttling
- **VPC Links** para integração privada
- **Custom Authorizer** com Lambda

### Monitoramento
- **CloudWatch Log Groups** para logs
- **KMS Keys** para criptografia
- **IAM Roles e Policies** para segurança

## 📁 Estrutura do Projeto

```
lncr-iac/
├── .github/
│   └── workflows/              # GitHub Actions workflows
│       ├── bootstrap.yml       # Deploy inicial (VPC + CodeBuild)
│       ├── infra-base.yml      # Deploy base infrastructure
│       └── infra-complete.yml  # Deploy completo com API Gateway
├── modules/                    # Módulos Terraform reutilizáveis
│   ├── vpc/                   # Infraestrutura de rede
│   ├── eks/                   # Cluster Kubernetes
│   ├── openvpn/               # Servidor VPN
│   ├── api-gateway/           # API Gateway HTTP v2
│   ├── ecr/                   # Container Registry
│   ├── codebuild/             # CI/CD Projects
│   ├── lambda/                # Functions serverless
│   ├── alb-controller/        # Load Balancer Controller
│   ├── secrets-manager/       # Gerenciamento de segredos
│   └── fsx-openzfs/          # Storage compartilhado
├── main.tf                    # Configuração principal
├── variables.tf               # Definições de variáveis
├── locals.tf                  # Valores locais
├── providers.tf               # Configuração de providers
├── prd.tfvars                # Variáveis do ambiente produção
└── README.md                  # Esta documentação
```


## 🔄 Workflows CI/CD

### Bootstrap Workflow
**Arquivo**: `.github/workflows/bootstrap.yml`
- **Trigger**: Manual (workflow_dispatch)
- **Função**: Deploy inicial da VPC e CodeBuild
- **Uso**: Primeira execução para criar infraestrutura base

### Infra Base Workflow
**Arquivo**: `.github/workflows/infra-base.yml`
- **Trigger**: Push para branch `develop` ou manual
- **Recursos**: VPC, EKS, ECR, Secrets Manager, FSx, OpenVPN, Lambda
- **Runner**: CodeBuild personalizado
- **Integração**: Dispara deploys em outros repositórios

### Infra Complete Workflow
**Arquivo**: `.github/workflows/infra-complete.yml`
- **Trigger**: Push para `develop`, repository_dispatch ou manual
- **Recursos**: API Gateway com integrações NLB e Lambda
- **Dependências**: Requer infraestrutura base já implantada

### Configuração de Secrets
Configure os seguintes secrets no GitHub:
```
AWS_ACCESS_KEY_ID       # Chave de acesso AWS
AWS_SECRET_ACCESS_KEY   # Chave secreta AWS
REPO_TOKEN             # Token para disparar workflows em outros repos
```

## 📦 Módulos Detalhados

### Módulo VPC (`modules/vpc/`)
**Recursos Criados:**
- VPC com CIDR configurável
- Subnets públicas, privadas (app) e de dados
- Internet Gateway e NAT Gateways
- Route Tables e associações
- Security Groups
- VPC Endpoints (S3)
- DB Subnet Groups

**Características:**
- Suporte a múltiplas AZs
- IPv6 opcional
- NAT Gateway com HA opcional
- Tags para EKS e Karpenter

### Módulo EKS (`modules/eks/`)
**Recursos Criados:**
- EKS Cluster com versão configurável
- Managed Node Groups
- Security Groups específicos
- IAM Roles e Policies
- KMS Key para criptografia
- Storage Classes (GP3)
- Namespaces customizados
- AWS Auth ConfigMap

**Add-ons Inclusos:**
- kube-proxy
- eks-pod-identity-agent
- vpc-cni
- aws-ebs-csi-driver
- coredns

### Módulo OpenVPN (`modules/openvpn/`)
**Recursos Criados:**
- EC2 Instance com OpenVPN Access Server
- Security Group (portas 8080/TCP, 1194/UDP)
- IAM Role com políticas S3 e SSM
- Key Pair para acesso SSH
- S3 Bucket para certificados
- Secrets Manager para credenciais
- User Data script para configuração

### Módulo API Gateway (`modules/api-gateway/`)
**Recursos Criados:**
- API Gateway HTTP v2
- Stage padrão com auto-deploy
- CORS configuration
- Throttling settings
- VPC Link para EKS
- Custom Authorizer com Lambda
- CloudWatch Log Groups
- Rotas protegidas e abertas

### Módulo ECR (`modules/ecr/`)
**Recursos Criados:**
- Repositórios ECR
- Lifecycle policies
- Image scanning
- Tag mutability settings

### Módulo CodeBuild (`modules/codebuild/`)
**Recursos Criados:**
- Projetos CodeBuild
- IAM Roles e Policies
- Security Groups
- VPC Configuration
- GitHub Webhooks
- GitHub Actions Runners

### Módulo Lambda (`modules/lambda/`)
**Recursos Criados:**
- Lambda Functions
- IAM Roles
- Environment Variables
- Deployment Packages

### Módulo ALB Controller (`modules/alb-controller/`)
**Recursos Criados:**
- Helm Release para AWS Load Balancer Controller
- Service Account com IRSA
- IAM Roles e Policies
- Kubernetes Namespace

### Módulo Secrets Manager (`modules/secrets-manager/`)
**Recursos Criados:**
- Secrets para aplicações
- Recovery window configurável
- Tags padronizadas

### Módulo FSx OpenZFS (`modules/fsx-openzfs/`)
**Recursos Criados:**
- FSx OpenZFS File System
- Security Groups
- Backup configuration
- Performance settings


## 📤 Outputs

### Outputs Principais
```hcl
# VPC
vpc_id                    # ID da VPC
public_subnet_ids         # IDs das subnets públicas
app_subnet_ids           # IDs das subnets privadas
data_subnet_ids          # IDs das subnets de dados

# EKS
cluster_name             # Nome do cluster EKS
cluster_endpoint         # Endpoint do cluster
cluster_security_group_id # ID do security group
oidc_provider_arn        # ARN do OIDC provider

# API Gateway
api_gateway_id           # ID do API Gateway
api_gateway_endpoint     # Endpoint da API
api_execution_arn        # ARN de execução

# ECR
ecr_repository_urls      # URLs dos repositórios ECR

# CodeBuild
codebuild_project_names  # Nomes dos projetos CodeBuild
```

## 🔒 Segurança

### Práticas Implementadas

#### Rede
- **Isolamento**: Subnets separadas por função (pública, privada, dados)
- **NAT Gateway**: Acesso internet controlado para subnets privadas
- **Security Groups**: Regras restritivas de ingress/egress
- **VPC Endpoints**: Comunicação privada com serviços AWS

#### Identidade e Acesso
- **IAM Roles**: Princípio do menor privilégio
- **IRSA**: Service Accounts com roles específicas
- **Custom Authorizer**: Autenticação/autorização customizada
- **Secrets Manager**: Armazenamento seguro de credenciais

#### Criptografia
- **KMS**: Chaves gerenciadas para EKS
- **EBS Encryption**: Volumes criptografados
- **S3 Encryption**: Buckets com criptografia
- **TLS**: Comunicação criptografada

#### Monitoramento
- **CloudWatch Logs**: Logs centralizados
- **VPC Flow Logs**: Monitoramento de tráfego de rede
- **API Gateway Logs**: Logs de requisições
- **EKS Audit Logs**: Logs de auditoria Kubernetes


import Foundation

enum PlayCatalog {
    static let ideas: [PlayIdea] = {
        var result: [PlayIdea] = []
        let ageBands = [(1, 3), (4, 6), (7, 10)]

        struct Seed {
            let key: String
            let title: String
            let description: String
            let place: PlayPlace
            let minutes: Int
            let energy: Int
            let materials: String
            let parentRole: String
        }

        let indoor: [Seed] = [
            .init(key:"color", title:"色さがし", description:"家の中から指定した色のものを見つけよう。見つけたら持ってくるか、指さして教えて。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"座ったまま色を指定"),
            .init(key:"shape", title:"かたち探偵", description:"丸・四角・三角のものを家の中から探して、いくつ見つかるか挑戦しよう。", place:.indoor, minutes:10, energy:0, materials:"なし", parentRole:"形を1つ指定"),
            .init(key:"sound", title:"音あてゲーム", description:"見えないところで物を鳴らして、何の音か当てよう。", place:.indoor, minutes:5, energy:1, materials:"家にある物", parentRole:"音を出す"),
            .init(key:"tower", title:"なんでもタワー", description:"安全な物を積んで、どこまで高くできるか挑戦しよう。", place:.indoor, minutes:10, energy:1, materials:"積める物", parentRole:"見守り"),
            .init(key:"tape", title:"床ラインミッション", description:"床に線を作って、線から落ちずに進めるか挑戦しよう。", place:.indoor, minutes:10, energy:1, materials:"マスキングテープ", parentRole:"コースを作る"),
            .init(key:"treasure", title:"3つの宝さがし", description:"家の中に小さな宝を3つ隠して探してもらおう。", place:.indoor, minutes:10, energy:1, materials:"小物3つ", parentRole:"隠すだけ"),
            .init(key:"pose", title:"まねっこポーズ", description:"親が作った変なポーズを子どもが真似。次は子どもが先生役。", place:.indoor, minutes:5, energy:1, materials:"なし", parentRole:"最初のポーズだけ作る"),
            .init(key:"story", title:"1文ずつ物語", description:"一人1文ずつ交代で話して、へんてこな物語を作ろう。", place:.indoor, minutes:10, energy:0, materials:"なし", parentRole:"1文ずつ答える"),
            .init(key:"guess", title:"私はだれでしょう", description:"動物や食べ物を1つ思い浮かべて、ヒントを出して当ててもらおう。", place:.indoor, minutes:10, energy:0, materials:"なし", parentRole:"ヒントを出す"),
            .init(key:"paperball", title:"紙ボール投げ", description:"紙を丸めてボールにして、箱やかごをゴールにして投げよう。", place:.indoor, minutes:10, energy:1, materials:"紙・箱", parentRole:"得点係"),
            .init(key:"memory", title:"なくなったのはどれ？", description:"物を数個並べ、目を閉じている間に1つ隠す。何が消えたか当てよう。", place:.indoor, minutes:10, energy:0, materials:"小物3〜6個", parentRole:"1つ隠す"),
            .init(key:"clap", title:"手拍子コピー", description:"パン・パンパンなどのリズムを作って、同じように真似してもらおう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"手拍子をする"),
            .init(key:"drawing", title:"お題お絵かき", description:"『空を飛ぶねこ』などのお題を1つ決めて自由に描こう。", place:.indoor, minutes:20, energy:0, materials:"紙・ペン", parentRole:"お題を出す"),
            .init(key:"fold", title:"紙だけ工作", description:"紙1枚だけを使って、好きな生き物や乗り物を作ってみよう。", place:.indoor, minutes:20, energy:0, materials:"紙", parentRole:"作品を見る"),
            .init(key:"shop", title:"おうちのお店屋さん", description:"家の物を商品にして、お店屋さんとお客さんを交代しよう。", place:.indoor, minutes:20, energy:1, materials:"家にある物", parentRole:"お客さん役"),
            .init(key:"balance", title:"片足チャレンジ", description:"片足で何秒立てるか挑戦。左右やポーズを変えて記録更新を狙おう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"数える"),
            .init(key:"mission", title:"5分ミッション", description:"『四角い物を3つ』『柔らかい物を2つ』など、短いミッションを出そう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"ミッションを読む"),
            .init(key:"shadow", title:"影あそび", description:"ライトや部屋の明かりを使って、手や物の影で形を作ってみよう。", place:.indoor, minutes:10, energy:0, materials:"ライト", parentRole:"見守り")
        ]

        let outdoor: [Seed] = [
            .init(key:"cloud", title:"雲の形さがし", description:"空を見て、雲が何に見えるか順番に言ってみよう。", place:.outdoor, minutes:10, energy:0, materials:"なし", parentRole:"一緒に見る"),
            .init(key:"naturecolor", title:"自然の色さがし", description:"赤・黄・緑など、指定した色を外で探してみよう。", place:.outdoor, minutes:10, energy:0, materials:"なし", parentRole:"色を指定"),
            .init(key:"step", title:"ぴったり10歩", description:"目標物まで何歩か予想してから歩き、予想と実際を比べよう。", place:.outdoor, minutes:5, energy:1, materials:"なし", parentRole:"数える"),
            .init(key:"leaf", title:"葉っぱコレクション", description:"形や大きさの違う落ち葉を3種類見つけよう。生きている植物は取らずに観察だけでもOK。", place:.outdoor, minutes:10, energy:1, materials:"袋（任意）", parentRole:"見守り"),
            .init(key:"soundwalk", title:"音さがし散歩", description:"鳥、車、風、足音など、聞こえた音を5種類見つけよう。", place:.outdoor, minutes:10, energy:1, materials:"なし", parentRole:"一緒に聞く"),
            .init(key:"shadowtag", title:"影ふみ", description:"相手の影を踏めたら1点。安全な広い場所で遊ぼう。", place:.outdoor, minutes:10, energy:2, materials:"なし", parentRole:"少し一緒に動く"),
            .init(key:"linewalk", title:"白線バランス", description:"安全な場所の線や縁石の横を、落ちないようにゆっくり進もう。", place:.outdoor, minutes:10, energy:1, materials:"なし", parentRole:"安全確認"),
            .init(key:"stone", title:"お気に入り石さがし", description:"面白い形や模様の石を3つ探して、どこが気に入ったか話そう。", place:.outdoor, minutes:10, energy:0, materials:"なし", parentRole:"話を聞く"),
            .init(key:"photo", title:"写真ミッション", description:"『丸いもの』『赤いもの』『面白い影』などのお題を写真で集めよう。", place:.outdoor, minutes:20, energy:0, materials:"スマートフォン", parentRole:"撮影を手伝う"),
            .init(key:"race", title:"ゆっくり競走", description:"いちばん遅くゴールした人が勝ち。ただし止まるのは禁止。", place:.outdoor, minutes:5, energy:1, materials:"なし", parentRole:"スタート係"),
            .init(key:"jump", title:"ジャンプ記録", description:"線からどこまで跳べるか挑戦。毎回少しずつ記録を伸ばそう。", place:.outdoor, minutes:10, energy:1, materials:"目印", parentRole:"記録係"),
            .init(key:"animalwalk", title:"動物歩き", description:"ペンギン、カニ、うさぎなどを決めて、その動物の動きで進もう。", place:.outdoor, minutes:10, energy:1, materials:"なし", parentRole:"動物を指定"),
            .init(key:"findnumber", title:"数字さがし散歩", description:"看板や家の番号から1〜9の数字を順番に見つけよう。", place:.outdoor, minutes:20, energy:1, materials:"なし", parentRole:"一緒に探す"),
            .init(key:"alphabet", title:"文字さがし", description:"看板やポスターから、決めた文字を何個見つけられるか挑戦しよう。", place:.outdoor, minutes:20, energy:1, materials:"なし", parentRole:"文字を指定"),
            .init(key:"naturebingo", title:"自然ビンゴ", description:"鳥・花・虫・石・雲など5つのお題を決め、見つけたらクリア。", place:.outdoor, minutes:30, energy:1, materials:"メモ（任意）", parentRole:"お題を決める"),
            .init(key:"parkmission", title:"公園3ミッション", description:"『すべり台1回・木を3本見つける・ベンチまで歩く』など3つ達成しよう。", place:.outdoor, minutes:20, energy:1, materials:"なし", parentRole:"ミッションを出す"),
            .init(key:"follow", title:"隊長についていけ", description:"隊長が決めた歩き方やルートをみんなで真似。途中で隊長交代。", place:.outdoor, minutes:10, energy:2, materials:"なし", parentRole:"最初の隊長"),
            .init(key:"season", title:"季節を3つ見つける", description:"今の季節らしいものを3つ探して、理由も話してみよう。", place:.outdoor, minutes:20, energy:0, materials:"なし", parentRole:"話を聞く")
        ]

        func adjustedDescription(_ seed: Seed, bandIndex: Int) -> String {
            switch bandIndex {
            case 0: return seed.description + " 小さい子は数を少なくして、できたらすぐ成功にしよう。"
            case 1: return seed.description
            default: return seed.description + " 大きい子は回数・得点・制限時間をつけると盛り上がります。"
            }
        }

        func add(_ seeds: [Seed]) {
            for seed in seeds {
                for (index, band) in ageBands.enumerated() {
                    let ageSuffix = ["little", "middle", "big"][index]
                    let durationBoost = index == 2 && seed.minutes < 30 ? min(30, seed.minutes + 5) : seed.minutes
                    result.append(
                        PlayIdea(
                            id: "\(seed.key)-\(ageSuffix)",
                            title: seed.title,
                            description: adjustedDescription(seed, bandIndex: index),
                            minAge: band.0,
                            maxAge: band.1,
                            place: seed.place,
                            minutes: durationBoost,
                            parentEnergy: seed.energy,
                            materials: seed.materials,
                            parentRole: seed.parentRole
                        )
                    )
                }
            }
        }

        add(indoor)
        add(outdoor)
        return result
    }()
}

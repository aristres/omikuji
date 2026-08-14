import Foundation

enum PlayCatalog {
    static let ideas: [PlayIdea] = {
        var result: [PlayIdea] = []
        let ageBands = [(3, 3), (4, 6), (7, 10)]

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

        let ageZero: [Seed] = [
            .init(key:"zero-gaze", title:"おめめでこんにちは", description:"子どもが楽な姿勢のとき、顔を30cmほど離して目線を合わせよう。目が合ったら微笑み、そらしたら静かに待とう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"楽な姿勢で目線と表情を返す"),
            .init(key:"zero-smile", title:"にこにこ返し", description:"子どもの表情をよく見て、口を動かしたり笑ったりしたら同じ表情をゆっくり返そう。反応を求めず、見つめるだけでも大丈夫。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"表情をそのまま返す"),
            .init(key:"zero-name", title:"お名前のうた", description:"子どもの名前をゆっくり呼び、短い鼻歌にして繰り返そう。子どもの声が聞こえたら、その音をまねして返そう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"名前を歌い、声を返す"),
            .init(key:"zero-holdhand", title:"おててをそっと", description:"子どもの手のひらに指をそっと触れ、握ってきたらそのまま待とう。こちらから強く握らず、手が離れたら終わりにしよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"指を添えて反応を待つ"),
            .init(key:"zero-palm", title:"てのひらなでなで", description:"子どもの手が開いているとき、手のひらを親の指で中央から外へゆっくりなでよう。嫌がる様子があればすぐにやめよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"手のひらをやさしくなでる"),
            .init(key:"zero-fingerwalk", title:"ゆびでてくてく", description:"親の指2本を、子どもの腕や手の上でゆっくり歩かせよう。服の上からでもOK。くすぐったそうなら休もう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"指を小さくゆっくり動かす"),
            .init(key:"zero-foot", title:"あんよにこんにちは", description:"子どもが楽な姿勢のとき、足の裏に親の手のひらをそっと当てよう。押したり脚を曲げたりせず、温かさを伝えよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"足裏に手をそっと当てる"),
            .init(key:"zero-tap", title:"やさしくトントン", description:"子どもを安全な場所に寝かせるか安定して抱き、服の上から胸や背中をゆっくりトントンしよう。顔や首は避けよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"安全な姿勢でやさしくたたく"),
            .init(key:"zero-hum", title:"だっこで鼻歌", description:"頭と首を発達に合わせて支え、安全に抱いて小さな声で鼻歌を歌おう。大きく揺らさず、親は座ったままでも楽しめるよ。", place:.indoor, minutes:10, energy:0, materials:"なし", parentRole:"頭と体を支えて歌う"),
            .init(key:"zero-breathe", title:"ぴったり深呼吸", description:"子どもを安全に抱き、親がゆっくり呼吸しながら背中に手のひらを当てよう。圧迫せず、静かな時間を一緒に過ごそう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"座って抱き、ゆっくり呼吸する"),
            .init(key:"zero-peekaboo", title:"ゆっくりいないいないばあ", description:"親の顔を手で隠し、ゆっくり見せよう。布は使わず、子どもの顔を覆わないで遊ぼう。疲れた様子ならすぐ終えよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"手で自分の顔を隠して見せる"),
            .init(key:"zero-follow", title:"お顔をゆっくり追いかけよう", description:"子どもが安全に横になっているとき、親の顔を左右へゆっくり動かそう。首を無理に動かさず、目で追わなくても大丈夫。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"顔をゆっくり左右へ動かす"),
            .init(key:"zero-voice", title:"こえはどっち？", description:"子どもの近くで、右側、左側から順にやさしく名前を呼ぼう。耳元で大声を出さず、顔や目の動きを静かに見守ろう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"少し離れてやさしく呼ぶ"),
            .init(key:"zero-body", title:"からだにこんにちは", description:"「おてて」「おなか」「あんよ」と声を添え、服の上からそっと触れよう。答えや動きを求めず、触れる前に顔を見よう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"名前を言ってそっと触れる"),
            .init(key:"zero-clap", title:"ちいさな手拍子", description:"子どもの前で小さくゆっくり手をたたこう。子どもの手は無理に動かさず、音に気づいた表情や動きに笑顔で応えよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"小さな手拍子を見せる"),
            .init(key:"zero-talk", title:"今日のことをお話し", description:"抱っこや横になった子どものそばで、「おむつ替えたね」など今していることをゆっくり話そう。内容より声と表情を届けよう。", place:.indoor, minutes:10, energy:0, materials:"なし", parentRole:"そばでゆっくり話しかける"),
            .init(key:"zero-pat-a-cake", title:"親の手でパチパチ", description:"子どもに見える位置で、歌に合わせて親の手だけをゆっくりたたこう。子どもの手を持って動かさず、見たり聞いたりするだけで楽しもう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"手遊びをゆっくり見せる"),
            .init(key:"zero-outdoor-hold", title:"抱っこで外の空気", description:"気温と天候が穏やかなとき、安全に抱いて外の空気を短く感じよう。頭と首を支え、直射日光や強い風を避けよう。", place:.outdoor, minutes:5, energy:0, materials:"なし", parentRole:"安全に抱き、環境を確認する"),
            .init(key:"zero-outdoor-sit", title:"座って空を見よう", description:"日陰の安全な場所に座り、子どもの頭と体を支えて空や木を一緒に見よう。立ったり歩いたりする必要はないよ。", place:.outdoor, minutes:10, energy:0, materials:"なし", parentRole:"座って体を支え、一緒に見る"),
            .init(key:"zero-outdoor-sound", title:"外の音とトントン", description:"安全な場所に座って子どもを支え、鳥や風の音を聞きながら背中をゆっくりトントンしよう。大きな音の場所は避けよう。", place:.outdoor, minutes:5, energy:0, materials:"なし", parentRole:"座って支え、音を一緒に聞く")
        ]

        let ageOne: [Seed] = [
            .init(key:"one-clap", title:"おててパチパチ", description:"向かい合って、親がゆっくり手をたたこう。子どもが手を動かしたら笑顔で応え、できなくても音と表情を一緒に楽しもう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"座って手拍子と笑顔を見せる"),
            .init(key:"one-peekaboo", title:"いないいないばあ", description:"両手で親の顔を隠してから、ゆっくり顔を見せよう。子どもの表情に合わせて速さや回数を変えよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"顔を隠して見せる"),
            .init(key:"one-hands", title:"おててこんにちは", description:"子どもの手のひらに親の手のひらをそっと合わせて、離したり合わせたりしよう。握らず、子どもが手を引いたら休もう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"手のひらをやさしく合わせる"),
            .init(key:"one-fingerwalk", title:"ゆびのおさんぽ", description:"親の指2本を子どもの手や腕の上で、てくてく歩かせよう。くすぐったそうなら場所を変えるか、すぐにやめよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"指をゆっくり動かす"),
            .init(key:"one-cheek", title:"ほっぺでこんにちは", description:"親のほっぺを子どものほっぺに一瞬だけ、そっと近づけよう。子どもが顔をそらしたら追いかけず、笑顔を見せよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"顔を見ながらやさしく触れる"),
            .init(key:"one-hug", title:"ぎゅっとこんにちは", description:"子どもが腕を伸ばしたり近づいてきたら、短くやさしく抱きしめよう。離れたがったらすぐ腕をゆるめよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"子どもの反応に合わせて抱く"),
            .init(key:"one-rock", title:"おひざでゆらゆら", description:"親が安定して座り、子どもの体を支えて膝の上で左右に小さくゆれよう。大きく揺らさず、ゆっくり楽しもう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"座って体を支え、小さく揺れる"),
            .init(key:"one-bus", title:"おひざバス", description:"子どもの体をしっかり支えて膝に座らせ、「ぶーぶー」と声を添えてごく小さく上下しよう。勢いをつけず、親は座ったまま遊ぼう。", place:.indoor, minutes:5, energy:1, materials:"なし", parentRole:"座って体を支え、小さく動く"),
            .init(key:"one-sway", title:"抱っこでゆっくりダンス", description:"低い姿勢で子どもを安定して抱き、歌や鼻歌に合わせて左右にゆっくり揺れよう。回転したり大きく上下したりしないで楽しもう。", place:.indoor, minutes:5, energy:1, materials:"なし", parentRole:"安全に抱いてゆっくり揺れる"),
            .init(key:"one-song", title:"だっこで鼻歌", description:"座って子どもを抱き、好きな歌を小さな声で歌おう。歌詞はなくても大丈夫。呼吸に合わせて背中をやさしくトントンしよう。", place:.indoor, minutes:10, energy:0, materials:"なし", parentRole:"座って抱き、歌う"),
            .init(key:"one-backtap", title:"せなかトントン", description:"抱っこか膝の上で、子どもの背中を手のひらでゆっくりトントンしよう。心地よさそうな速さを表情から見つけよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"背中をやさしく一定にたたく"),
            .init(key:"one-trace", title:"せなかにまるまる", description:"服の上から背中に大きな丸や波を指でゆっくり描こう。くすぐったそう、嫌そうな様子ならすぐにやめよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"服の上からやさしくなぞる"),
            .init(key:"one-body", title:"からだをちょん", description:"「おてて」「おなか」「あんよ」と声を添え、子どもの体を服の上からそっと触れよう。言葉を答えさせず、目線や笑顔に応えよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"名前を言ってやさしく触れる"),
            .init(key:"one-pittanko", title:"ぴったんこ遊び", description:"「おててとおてて」のように、親と子の同じ場所をそっと合わせよう。子どもが離れたらそこでおしまいにしよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"同じ体の場所をそっと合わせる"),
            .init(key:"one-foot", title:"あんよトントン", description:"子どもが楽な姿勢のときに、足の裏へ親の手のひらをそっと当てよう。交互に触れ、押したり無理に動かしたりしないで楽しもう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"足裏に手をそっと当てる"),
            .init(key:"one-roll", title:"ごろんでまねっこ", description:"安全な床で親がごろんと横になり、寝返りするようにゆっくり向きを変えよう。子どもには動きを求めず、目が合ったら笑顔を返そう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"床でゆっくり動きを見せる"),
            .init(key:"one-face", title:"にこにこまねっこ", description:"子どもの顔を見ながら、にっこり、びっくり、口をすぼめる表情をゆっくり見せよう。子どもの表情もそのまま真似して返そう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"表情を見せて反応を返す"),
            .init(key:"one-pat", title:"なでなで交代", description:"親が自分の腕をなでて見せてから、子どもの腕を服の上からやさしくなでよう。子どもが親に触れたら笑顔で応えよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"やさしい触れ方を見せる"),
            .init(key:"one-tunnel", title:"おひざのトンネル", description:"親が床に座って膝を少し立て、子どもが近づいたら腕で低いトンネルを作ろう。くぐらせようと引っ張らず、自由な動きを見守ろう。", place:.indoor, minutes:10, energy:1, materials:"なし", parentRole:"床に座って腕のトンネルを作る"),
            .init(key:"one-goodnight", title:"おやすみトントン", description:"明るい部屋で横になった子どものそばに座り、服の上から背中やおなかをゆっくりトントンしよう。眠らせるルールはなく、落ち着く時間を楽しもう。", place:.indoor, minutes:10, energy:0, materials:"なし", parentRole:"そばでゆっくりトントンする"),
            .init(key:"one-wind", title:"抱っこで風こんにちは", description:"安全な場所で子どもを安定して抱き、頬に当たる風を一緒に感じよう。立ったまま揺らさず、疲れたらベンチなどに座ろう。", place:.outdoor, minutes:5, energy:0, materials:"なし", parentRole:"安全に抱いて風を感じる"),
            .init(key:"one-sky", title:"おひざで空を見よう", description:"安全な場所のベンチなどに座り、子どもの体を支えて膝の上で空を見よう。雲や鳥を見つけたら指さすだけで楽しめるよ。", place:.outdoor, minutes:10, energy:0, materials:"なし", parentRole:"座って体を支え、一緒に見る"),
            .init(key:"one-handwalk", title:"おててでゆっくり散歩", description:"平らで車の来ない安全な場所で、子どもが歩きたがったら手をやさしくつないで数歩だけ進もう。引っ張らず、立ち止まったら一緒に止まろう。", place:.outdoor, minutes:5, energy:1, materials:"なし", parentRole:"手を添えて歩調を合わせる"),
            .init(key:"one-outdoor-song", title:"ベンチでふれあい歌", description:"安全な場所に座り、子どもを膝の上で支えながら手拍子や鼻歌を楽しもう。子どもの声や動きが返ってきたら同じように返そう。", place:.outdoor, minutes:10, energy:0, materials:"なし", parentRole:"座って支え、歌と手拍子を返す")
        ]

        let ageTwo: [Seed] = [
            .init(key:"two-clap", title:"パチパチまねっこ", description:"向かい合って親がゆっくり手をたたこう。子どもが同じ動きをしなくても、声や体の動きに合わせて親がまねを返そう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"手拍子を見せ、反応を返す"),
            .init(key:"two-highfive", title:"やさしくタッチ", description:"手のひらを子どもの前に出し、触れてきたら「タッチ」と笑顔で応えよう。手をつかんだり、強く打ち合わせたりしないで楽しもう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"手を出して反応を待つ"),
            .init(key:"two-hug", title:"ぎゅっする？", description:"腕を広げて待ち、子どもが近づいてきたら短くやさしく抱きしめよう。来なければ笑顔だけでOK。離れたらすぐ腕をゆるめよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"子どもが選ぶのを待って抱く"),
            .init(key:"two-hand", title:"おててつないでゆらゆら", description:"子どもが手を出したらやさしくつなぎ、立つか座ったままで左右に小さく揺れよう。腕を引っ張らず、子どもの動きに合わせよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"手を軽くつなぎ動きを合わせる"),
            .init(key:"two-knee", title:"おひざでガタンゴトン", description:"親が安定して座り、子どもの体を支えて膝の上でごく小さく動こう。勢いをつけず、「ガタンゴトン」と声を添えよう。", place:.indoor, minutes:5, energy:1, materials:"なし", parentRole:"座って体を支え、小さく動く"),
            .init(key:"two-face", title:"へんな顔交換", description:"親がにっこり、びっくりなどの表情を見せよう。子どもが作った表情や声も親がそのまま返し、正解なしで楽しもう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"表情と声をまねして返す"),
            .init(key:"two-body", title:"からだをぴったんこ", description:"親が「おてて」と言って手のひらをそっと合わせよう。次は肘や足先など、子どもが触れたがる場所だけで楽しもう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"体の場所をそっと合わせる"),
            .init(key:"two-finger", title:"ゆびのおさんぽ", description:"親の指を子どもの腕や背中の服の上で歩かせよう。子どもが笑ったら繰り返し、逃げたり嫌がったりしたら追わずに終えよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"指をゆっくり動かす"),
            .init(key:"two-back", title:"せなかにぐるぐる", description:"服の上から背中に大きな丸や波をゆっくり描こう。子どもが親の背中に触れてきたら交代し、自由な線を楽しもう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"背中をやさしくなぞる"),
            .init(key:"two-feet", title:"つま先こんにちは", description:"向かい合って座り、親のつま先を子どものつま先へそっと近づけよう。足を押さえず、触れる・離れるをゆっくり繰り返そう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"座って足先をそっと合わせる"),
            .init(key:"two-sway", title:"手つなぎダンス", description:"好きな歌や鼻歌に合わせ、手を軽くつないで小さく揺れよう。回転やジャンプはせず、子どもが手を離したら自由に動かそう。", place:.indoor, minutes:5, energy:1, materials:"なし", parentRole:"手を軽くつなぎ小さく揺れる"),
            .init(key:"two-train", title:"せなかで電車ごっこ", description:"床に座って親の前に子どもが座ったら、体を支えながら「しゅっしゅ」と小さく前後しよう。乗りたがらなければ親だけ動こう。", place:.indoor, minutes:5, energy:1, materials:"なし", parentRole:"座って体を支え、小さく動く"),
            .init(key:"two-tunnel", title:"うでのトンネル", description:"親が床に座り、腕で低いトンネルを作ろう。子どもが自分から近づいたら「こんにちは」と迎え、くぐるよう促したり引っ張ったりしないでね。", place:.indoor, minutes:10, energy:1, materials:"なし", parentRole:"床に座って腕のトンネルを作る"),
            .init(key:"two-copy", title:"ひとつだけまねっこ", description:"親が手を上げる、頭を触るなど1つの動きをゆっくり見せよう。子どもの別の動きも親がまねし、ルールなしで交代を楽しもう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"簡単な動きを見せてまねを返す"),
            .init(key:"two-song", title:"おひざでふれあい歌", description:"親が座り、子どもが来たら膝の上や隣で歌おう。歌に合わせて手や背中をやさしくトントンし、動きたいときは自由にさせよう。", place:.indoor, minutes:10, energy:0, materials:"なし", parentRole:"座って歌い、やさしく触れる"),
            .init(key:"two-pat", title:"なでなで交代", description:"親が自分の腕をなでてから、子どもの腕を服の上からやさしくなでよう。子どもが親に触れたら「ありがとう」と笑顔で応えよう。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"やさしい触れ方を見せる"),
            .init(key:"two-peek", title:"いないいない、ぎゅっ", description:"親が手で自分の顔を隠して「ばあ」。子どもが近づいてきたら、望んだときだけ短く抱きしめよう。布は使わないでね。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"顔を見せ、抱っこは反応を待つ"),
            .init(key:"two-walk", title:"おててでゆっくり散歩", description:"平らで車の来ない安全な場所で、子どもが望んだら手をつないで歩こう。腕を引かず、立ち止まったら一緒に止まろう。", place:.outdoor, minutes:10, energy:1, materials:"なし", parentRole:"手を添えて歩調を合わせる"),
            .init(key:"two-bench", title:"ベンチでパチパチ", description:"安全なベンチなどに並んで座り、外の音に合わせて手拍子をしよう。子どもの音や動きを親がまねして返そう。", place:.outdoor, minutes:5, energy:0, materials:"なし", parentRole:"隣に座って手拍子を返す"),
            .init(key:"two-wind", title:"風とゆらゆら", description:"安全な場所で手を軽くつなぎ、風を感じながら立つか座って小さく揺れよう。手を離したら追わず、そばで見守ろう。", place:.outdoor, minutes:5, energy:0, materials:"なし", parentRole:"そばで手を添え、小さく揺れる")
        ]

        let indoor: [Seed] = [
            .init(key:"color", title:"色さがし", description:"家の中から指定した色のものを見つけよう。見つけたら持ってくるか、指さして教えて。", place:.indoor, minutes:5, energy:0, materials:"なし", parentRole:"座ったまま色を指定"),
            .init(key:"shape", title:"かたち探偵", description:"丸・四角・三角のものを家の中から探して、いくつ見つかるか挑戦しよう。", place:.indoor, minutes:10, energy:0, materials:"なし", parentRole:"形を1つ指定"),
            .init(key:"sound", title:"音あてゲーム", description:"見えないところで物を鳴らして、何の音か当てよう。", place:.indoor, minutes:5, energy:1, materials:"家にある物", parentRole:"音を出す"),
            .init(key:"tower", title:"なんでもタワー", description:"安全な物を積んで、どこまで高くできるか挑戦しよう。", place:.indoor, minutes:10, energy:1, materials:"積める物", parentRole:"見守り"),
            .init(key:"tape", title:"床ラインミッション", description:"床に線を作って、線から落ちずに進めるか挑戦しよう。", place:.indoor, minutes:10, energy:1, materials:"マスキングテープ", parentRole:"コースを作る"),
            .init(key:"treasure", title:"3つの宝さがし", description:"家の中に、誤飲できない大きさの安全な宝を3つ隠して探してもらおう。", place:.indoor, minutes:10, energy:1, materials:"大きめの安全な物3つ", parentRole:"そばで見守る"),
            .init(key:"pose", title:"まねっこポーズ", description:"親が作った変なポーズを子どもが真似。次は子どもが先生役。", place:.indoor, minutes:5, energy:1, materials:"なし", parentRole:"最初のポーズだけ作る"),
            .init(key:"story", title:"1文ずつ物語", description:"一人1文ずつ交代で話して、へんてこな物語を作ろう。", place:.indoor, minutes:10, energy:0, materials:"なし", parentRole:"1文ずつ答える"),
            .init(key:"guess", title:"私はだれでしょう", description:"動物や食べ物を1つ思い浮かべて、ヒントを出して当ててもらおう。", place:.indoor, minutes:10, energy:0, materials:"なし", parentRole:"ヒントを出す"),
            .init(key:"paperball", title:"紙ボール投げ", description:"紙を丸めてボールにして、箱やかごをゴールにして投げよう。", place:.indoor, minutes:10, energy:1, materials:"紙・箱", parentRole:"得点係"),
            .init(key:"memory", title:"なくなったのはどれ？", description:"誤飲できない大きさの安全な物を数個並べ、目を閉じている間に1つ隠す。何が消えたか当てよう。", place:.indoor, minutes:10, energy:0, materials:"大きめの安全な物3〜6個", parentRole:"1つ隠して、そばで見守る"),
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
                    let ageSuffix = ["age-three", "middle", "big"][index]
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

        func addInfant(_ seeds: [Seed], age: Int) {
            for seed in seeds {
                result.append(
                    PlayIdea(
                        id: "\(seed.key)-age-\(age)",
                        title: seed.title,
                        description: seed.description,
                        minAge: age,
                        maxAge: age,
                        place: seed.place,
                        minutes: seed.minutes,
                        parentEnergy: seed.energy,
                        materials: seed.materials,
                        parentRole: seed.parentRole
                    )
                )
            }
        }

        addInfant(ageZero, age: 0)
        addInfant(ageOne, age: 1)
        addInfant(ageTwo, age: 2)
        add(indoor)
        add(outdoor)
        return result
    }()
}

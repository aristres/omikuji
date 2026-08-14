import SwiftUI

struct ContentView: View {
    @State private var age = 1
    @State private var place: PlayPlace = .indoor
    @State private var duration: PlayDuration = .ten
    @State private var energy: ParentEnergy = .tired
    @State private var currentIdea: PlayIdea?
    @State private var didTryDrawing = false
    @AppStorage("favoritePlayIDs") private var favoritePlayIDs = ""

    private var favoriteIDs: Set<String> {
        Set(favoritePlayIDs.split(separator: ",").map(String.init))
    }

    private var isInfant: Bool { age <= 2 }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    header
                    filterCard
                    drawButton
                    if let idea = currentIdea {
                        resultCard(idea)
                    } else if didTryDrawing {
                        noMatchCard
                    } else {
                        emptyCard
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("あそびくじ")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        FavoritesView()
                    } label: {
                        Image(systemName: favoriteIDs.isEmpty ? "heart" : "heart.fill")
                    }
                    .accessibilityLabel("お気に入り一覧")
                    .accessibilityValue("\(favoriteIDs.count)件")
                }
            }
            .onChange(of: age) { resetResult() }
            .onChange(of: place) { resetResult() }
            .onChange(of: duration) { resetResult() }
            .onChange(of: energy) { resetResult() }
        }
    }

    private var header: some View {
        VStack(spacing: 8) {
            Image(systemName: "sparkles")
                .font(.system(size: 42))
            Text(isInfant ? "ことばはいらない。今日のふれあいを見つけよう。" : "考えなくていい。今日の遊びはくじにおまかせ。")
                .font(.headline)
                .multilineTextAlignment(.center)
            Text(isInfant ? "言葉やルールがなくても楽しめる、今日のふれあいを1つ出します。" : "いまの状況を選ぶだけで、すぐできる遊びを1つ出します。")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.top, 8)
    }

    private var filterCard: some View {
        VStack(spacing: 18) {
            filterRow(title: "子どもの年齢") {
                Picker("年齢", selection: $age) {
                    ForEach(0...10, id: \.self) { value in
                        Text("\(value)歳").tag(value)
                    }
                }
                .pickerStyle(.menu)
            }

            HStack(spacing: 6) {
                Image(systemName: isInfant ? "figure.and.child.holdinghands" : "figure.play")
                Text(isInfant ? "乳児向け：ふれあいを提案" : "3歳以上：条件に合う遊びを提案")
            }
            .font(.caption)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)

            filterRow(title: "場所") {
                Picker("場所", selection: $place) {
                    ForEach(PlayPlace.allCases) { item in
                        Text(item.rawValue).tag(item)
                    }
                }
                .pickerStyle(.segmented)
            }

            filterRow(title: isInfant ? "ふれあう時間" : "遊べる時間") {
                Picker("時間", selection: $duration) {
                    ForEach(PlayDuration.allCases) { item in
                        Text(item.rawValue).tag(item)
                    }
                }
                .pickerStyle(.menu)
            }

            filterRow(title: "親の元気度") {
                Picker("元気度", selection: $energy) {
                    ForEach(ParentEnergy.allCases) { item in
                        Text(item.rawValue).tag(item)
                    }
                }
                .pickerStyle(.menu)
            }
        }
        .padding()
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private func filterRow<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        HStack {
            Text(title)
                .font(.subheadline.weight(.semibold))
            Spacer()
            content()
        }
    }

    private var drawButton: some View {
        Button(action: drawIdea) {
            Label(isInfant ? "今日のふれあいを選ぶ" : "今日の遊びを引く", systemImage: isInfant ? "heart.circle.fill" : "dice.fill")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }

    private var emptyCard: some View {
        VStack(spacing: 10) {
            Image(systemName: "hand.tap")
                .font(.largeTitle)
                .foregroundStyle(.secondary)
            Text(isInfant ? "条件を選んで、ふれあいを見つけてください" : "条件を選んで、くじを引いてください")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 38)
    }

    private var noMatchCard: some View {
        VStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.largeTitle)
                .foregroundStyle(.secondary)
            Text(isInfant ? "この条件に合うふれあいはありませんでした" : "この条件に合う遊びはありませんでした")
                .font(.headline)
                .multilineTextAlignment(.center)
            Text("時間や親の元気度を変えて、もう一度引いてみてください。")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 32)
        .padding(.horizontal)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private func resultCard(_ idea: PlayIdea) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(isInfant ? "今日のふれあい" : "今日の遊び")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                    Text(idea.title)
                        .font(.title2.bold())
                }
                Spacer()
                Button(action: { toggleFavorite(idea.id) }) {
                    Image(systemName: favoriteIDs.contains(idea.id) ? "heart.fill" : "heart")
                        .font(.title2)
                }
                .accessibilityLabel(favoriteIDs.contains(idea.id) ? "お気に入りから削除" : "お気に入りに追加")
            }

            Text(idea.description)
                .font(.body)

            Divider()

            Label("必要なもの：\(idea.materials)", systemImage: "shippingbox")
            Label("親の役割：\(idea.parentRole)", systemImage: "person.crop.circle")
            Label("目安：\(idea.minutes)分", systemImage: "clock")

            if isInfant {
                Label("反応や発達に合わせ、嫌がったら休みましょう", systemImage: "checkmark.shield")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Button(action: drawIdea) {
                Label(isInfant ? "ほかのふれあい" : "もう一回", systemImage: "arrow.triangle.2.circlepath")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .padding(.top, 4)
        }
        .padding()
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private func drawIdea() {
        let matches = PlayCatalog.ideas.filter {
            $0.minAge <= age && $0.maxAge >= age &&
            $0.place == place &&
            $0.minutes <= duration.minutes &&
            $0.parentEnergy <= energy.level
        }

        didTryDrawing = true
        let alternatives = matches.filter { $0.id != currentIdea?.id }
        currentIdea = (alternatives.isEmpty ? matches : alternatives).randomElement()
    }

    private func resetResult() {
        currentIdea = nil
        didTryDrawing = false
    }

    private func toggleFavorite(_ id: String) {
        var ids = favoriteIDs
        if ids.contains(id) {
            ids.remove(id)
        } else {
            ids.insert(id)
        }
        favoritePlayIDs = ids.sorted().joined(separator: ",")
    }
}

private struct FavoritesView: View {
    @AppStorage("favoritePlayIDs") private var favoritePlayIDs = ""

    private var favoriteIDs: Set<String> {
        Set(favoritePlayIDs.split(separator: ",").map(String.init))
    }

    private var favoriteIdeas: [PlayIdea] {
        PlayCatalog.ideas
            .filter { favoriteIDs.contains($0.id) }
            .sorted {
                if $0.title == $1.title {
                    return $0.minAge < $1.minAge
                }
                return $0.title.localizedStandardCompare($1.title) == .orderedAscending
            }
    }

    var body: some View {
        Group {
            if favoriteIdeas.isEmpty {
                ContentUnavailableView(
                    "お気に入りはまだありません",
                    systemImage: "heart",
                    description: Text("くじの結果にあるハートを押すと、ここでいつでも確認できます。")
                )
            } else {
                List(favoriteIdeas) { idea in
                    favoriteRow(idea)
                        .swipeActions {
                            Button(role: .destructive) {
                                removeFavorite(idea.id)
                            } label: {
                                Label("削除", systemImage: "trash")
                            }
                        }
                }
                .listStyle(.insetGrouped)
            }
        }
        .navigationTitle("お気に入り")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func favoriteRow(_ idea: PlayIdea) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .firstTextBaseline) {
                Text(idea.title)
                    .font(.headline)
                Spacer()
                Text(idea.ageLabel)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Text(idea.description)
                .font(.subheadline)

            HStack(spacing: 12) {
                Label(idea.place.rawValue, systemImage: idea.place == .indoor ? "house" : "figure.walk")
                Label("\(idea.minutes)分", systemImage: "clock")
            }
            .font(.caption)
            .foregroundStyle(.secondary)

            Label("必要なもの：\(idea.materials)", systemImage: "shippingbox")
                .font(.caption)
        }
        .padding(.vertical, 6)
    }

    private func removeFavorite(_ id: String) {
        var ids = favoriteIDs
        ids.remove(id)
        favoritePlayIDs = ids.sorted().joined(separator: ",")
    }
}

#Preview {
    ContentView()
}

#Preview("お気に入り") {
    NavigationStack {
        FavoritesView()
    }
}

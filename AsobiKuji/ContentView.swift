import SwiftUI

struct ContentView: View {
    @State private var age = 5
    @State private var place: PlayPlace = .indoor
    @State private var duration: PlayDuration = .ten
    @State private var energy: ParentEnergy = .tired
    @State private var currentIdea: PlayIdea?
    @AppStorage("favoritePlayIDs") private var favoritePlayIDs = ""

    private var favoriteIDs: Set<String> {
        Set(favoritePlayIDs.split(separator: ",").map(String.init))
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    header
                    filterCard
                    drawButton
                    if let idea = currentIdea {
                        resultCard(idea)
                    } else {
                        emptyCard
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("あそびくじ")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var header: some View {
        VStack(spacing: 8) {
            Image(systemName: "sparkles")
                .font(.system(size: 42))
            Text("考えなくていい。今日の遊びはくじにおまかせ。")
                .font(.headline)
                .multilineTextAlignment(.center)
            Text("いまの状況を選ぶだけで、すぐできる遊びを1つ出します。")
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
                    ForEach(1...10, id: \.self) { value in
                        Text("\(value)歳").tag(value)
                    }
                }
                .pickerStyle(.menu)
            }

            filterRow(title: "場所") {
                Picker("場所", selection: $place) {
                    ForEach(PlayPlace.allCases) { item in
                        Text(item.rawValue).tag(item)
                    }
                }
                .pickerStyle(.segmented)
            }

            filterRow(title: "遊べる時間") {
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
            Label("今日の遊びを引く", systemImage: "dice.fill")
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
            Text("条件を選んで、くじを引いてください")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 38)
    }

    private func resultCard(_ idea: PlayIdea) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("今日の遊び")
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
                .accessibilityLabel("お気に入り")
            }

            Text(idea.description)
                .font(.body)

            Divider()

            Label("必要なもの：\(idea.materials)", systemImage: "shippingbox")
            Label("親の役割：\(idea.parentRole)", systemImage: "person.crop.circle")
            Label("目安：\(idea.minutes)分", systemImage: "clock")

            Button(action: drawIdea) {
                Label("もう一回", systemImage: "arrow.triangle.2.circlepath")
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

        let relaxed = PlayCatalog.ideas.filter {
            $0.minAge <= age && $0.maxAge >= age && $0.place == place
        }

        let pool = matches.isEmpty ? relaxed : matches
        let alternatives = pool.filter { $0.id != currentIdea?.id }
        currentIdea = (alternatives.isEmpty ? pool : alternatives).randomElement()
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

#Preview {
    ContentView()
}

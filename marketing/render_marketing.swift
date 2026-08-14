import AppKit
import Foundation

struct CardSpec {
    let source: String
    let output: String
    let title: String
    let subtitle: String
    let topColor: NSColor
    let bottomColor: NSColor
}

let root = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)

let appStoreSpecs: [CardSpec] = [
    .init(
        source: "marketing/app-store/raw/01-infant-home.png",
        output: "marketing/app-store/promotional/01-infant-mode.jpg",
        title: "0〜2歳は、ふれあいを提案",
        subtitle: "言葉やルールがなくても大丈夫",
        topColor: NSColor(calibratedRed: 0.97, green: 0.91, blue: 0.98, alpha: 1),
        bottomColor: NSColor(calibratedRed: 0.86, green: 0.91, blue: 1.00, alpha: 1)
    ),
    .init(
        source: "marketing/app-store/raw/02-infant-result.png",
        output: "marketing/app-store/promotional/02-one-touch.jpg",
        title: "今の親子に、ひとつだけ",
        subtitle: "年齢・時間・元気度に合わせて選びます",
        topColor: NSColor(calibratedRed: 1.00, green: 0.94, blue: 0.88, alpha: 1),
        bottomColor: NSColor(calibratedRed: 1.00, green: 0.86, blue: 0.85, alpha: 1)
    ),
    .init(
        source: "marketing/app-store/raw/03-play-home.png",
        output: "marketing/app-store/promotional/03-play-mode.jpg",
        title: "3歳からは、遊びくじ",
        subtitle: "場所・時間・親の元気度で絞り込み",
        topColor: NSColor(calibratedRed: 0.88, green: 0.96, blue: 1.00, alpha: 1),
        bottomColor: NSColor(calibratedRed: 0.77, green: 0.88, blue: 1.00, alpha: 1)
    ),
    .init(
        source: "marketing/app-store/raw/04-play-result.png",
        output: "marketing/app-store/promotional/04-instant-result.jpg",
        title: "考えずに、すぐ遊べる",
        subtitle: "必要なものと親の役割までひと目で",
        topColor: NSColor(calibratedRed: 0.90, green: 1.00, blue: 0.95, alpha: 1),
        bottomColor: NSColor(calibratedRed: 0.75, green: 0.94, blue: 0.88, alpha: 1)
    ),
    .init(
        source: "marketing/app-store/raw/05-favorites.png",
        output: "marketing/app-store/promotional/05-favorites.jpg",
        title: "好きな遊びは、いつでも",
        subtitle: "お気に入りに残して何度でも",
        topColor: NSColor(calibratedRed: 0.95, green: 0.93, blue: 1.00, alpha: 1),
        bottomColor: NSColor(calibratedRed: 0.83, green: 0.84, blue: 0.98, alpha: 1)
    )
]

func paragraphStyle(alignment: NSTextAlignment = .center, lineSpacing: CGFloat = 0) -> NSMutableParagraphStyle {
    let style = NSMutableParagraphStyle()
    style.alignment = alignment
    style.lineSpacing = lineSpacing
    return style
}

func drawTopText(_ text: String, top: CGFloat, height: CGFloat, canvasHeight: CGFloat, attributes: [NSAttributedString.Key: Any]) {
    let rect = NSRect(x: 70, y: canvasHeight - top - height, width: 1180, height: height)
    (text as NSString).draw(in: rect, withAttributes: attributes)
}

func makeBitmap(width: Int, height: Int) -> NSBitmapImageRep {
    guard let bitmap = NSBitmapImageRep(
        bitmapDataPlanes: nil,
        pixelsWide: width,
        pixelsHigh: height,
        bitsPerSample: 8,
        samplesPerPixel: 4,
        hasAlpha: true,
        isPlanar: false,
        colorSpaceName: .deviceRGB,
        bitmapFormat: [],
        bytesPerRow: 0,
        bitsPerPixel: 0
    ) else { fatalError("Unable to create bitmap") }
    bitmap.size = NSSize(width: width, height: height)
    return bitmap
}

func writeJPEG(_ bitmap: NSBitmapImageRep, to relativePath: String) {
    let destination = root.appendingPathComponent(relativePath)
    try? FileManager.default.createDirectory(at: destination.deletingLastPathComponent(), withIntermediateDirectories: true)
    guard let data = bitmap.representation(using: .jpeg, properties: [.compressionFactor: 0.94]) else {
        fatalError("Unable to encode JPEG")
    }
    try! data.write(to: destination)
}

func renderAppStoreCard(_ spec: CardSpec) {
    let width = 1320
    let height = 2868
    let bitmap = makeBitmap(width: width, height: height)
    guard let context = NSGraphicsContext(bitmapImageRep: bitmap) else { fatalError("Unable to create context") }

    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = context

    let canvas = NSRect(x: 0, y: 0, width: width, height: height)
    NSGradient(starting: spec.bottomColor, ending: spec.topColor)!.draw(in: canvas, angle: 90)

    let titleAttributes: [NSAttributedString.Key: Any] = [
        .font: NSFont.systemFont(ofSize: 70, weight: .heavy),
        .foregroundColor: NSColor(calibratedWhite: 0.10, alpha: 1),
        .paragraphStyle: paragraphStyle()
    ]
    let subtitleAttributes: [NSAttributedString.Key: Any] = [
        .font: NSFont.systemFont(ofSize: 36, weight: .medium),
        .foregroundColor: NSColor(calibratedWhite: 0.30, alpha: 1),
        .paragraphStyle: paragraphStyle()
    ]
    drawTopText(spec.title, top: 82, height: 100, canvasHeight: CGFloat(height), attributes: titleAttributes)
    drawTopText(spec.subtitle, top: 205, height: 70, canvasHeight: CGFloat(height), attributes: subtitleAttributes)

    let sourceURL = root.appendingPathComponent(spec.source)
    guard let screenshot = NSImage(contentsOf: sourceURL) else { fatalError("Missing \(spec.source)") }
    let cardRect = NSRect(x: 130, y: 35, width: 1060, height: 2304)
    let path = NSBezierPath(roundedRect: cardRect, xRadius: 78, yRadius: 78)

    NSGraphicsContext.saveGraphicsState()
    let shadow = NSShadow()
    shadow.shadowColor = NSColor(calibratedWhite: 0, alpha: 0.20)
    shadow.shadowBlurRadius = 38
    shadow.shadowOffset = NSSize(width: 0, height: -10)
    shadow.set()
    NSColor.white.setFill()
    path.fill()
    NSGraphicsContext.restoreGraphicsState()

    NSGraphicsContext.saveGraphicsState()
    path.addClip()
    screenshot.draw(in: cardRect, from: .zero, operation: .copy, fraction: 1.0, respectFlipped: true, hints: [.interpolation: NSImageInterpolation.high])
    NSGraphicsContext.restoreGraphicsState()

    NSGraphicsContext.restoreGraphicsState()
    writeJPEG(bitmap, to: spec.output)
}

func renderSocialCard(_ spec: CardSpec, index: Int) {
    let width = 1080
    let height = 1350
    let bitmap = makeBitmap(width: width, height: height)
    guard let context = NSGraphicsContext(bitmapImageRep: bitmap) else { fatalError("Unable to create context") }

    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = context
    let canvas = NSRect(x: 0, y: 0, width: width, height: height)
    NSGradient(starting: spec.bottomColor, ending: spec.topColor)!.draw(in: canvas, angle: 90)

    let titleAttributes: [NSAttributedString.Key: Any] = [
        .font: NSFont.systemFont(ofSize: 54, weight: .heavy),
        .foregroundColor: NSColor(calibratedWhite: 0.10, alpha: 1),
        .paragraphStyle: paragraphStyle()
    ]
    let subtitleAttributes: [NSAttributedString.Key: Any] = [
        .font: NSFont.systemFont(ofSize: 28, weight: .medium),
        .foregroundColor: NSColor(calibratedWhite: 0.30, alpha: 1),
        .paragraphStyle: paragraphStyle()
    ]
    let titleRect = NSRect(x: 40, y: 1210, width: 1000, height: 80)
    (spec.title as NSString).draw(in: titleRect, withAttributes: titleAttributes)
    let subtitleRect = NSRect(x: 40, y: 1150, width: 1000, height: 50)
    (spec.subtitle as NSString).draw(in: subtitleRect, withAttributes: subtitleAttributes)

    guard let screenshot = NSImage(contentsOf: root.appendingPathComponent(spec.source)) else { fatalError("Missing screenshot") }
    let cardRect = NSRect(x: 300, y: 25, width: 480, height: 1044)
    let path = NSBezierPath(roundedRect: cardRect, xRadius: 44, yRadius: 44)
    NSGraphicsContext.saveGraphicsState()
    let shadow = NSShadow()
    shadow.shadowColor = NSColor(calibratedWhite: 0, alpha: 0.22)
    shadow.shadowBlurRadius = 28
    shadow.shadowOffset = NSSize(width: 0, height: -8)
    shadow.set()
    NSColor.white.setFill()
    path.fill()
    NSGraphicsContext.restoreGraphicsState()
    NSGraphicsContext.saveGraphicsState()
    path.addClip()
    screenshot.draw(in: cardRect, from: .zero, operation: .copy, fraction: 1.0, respectFlipped: true, hints: [.interpolation: NSImageInterpolation.high])
    NSGraphicsContext.restoreGraphicsState()

    NSGraphicsContext.restoreGraphicsState()
    writeJPEG(bitmap, to: String(format: "marketing/social/%02d.jpg", index))
}

for spec in appStoreSpecs {
    renderAppStoreCard(spec)
}

for (index, spec) in [appStoreSpecs[1], appStoreSpecs[3], appStoreSpecs[4]].enumerated() {
    renderSocialCard(spec, index: index + 1)
}

print("Rendered \(appStoreSpecs.count) App Store images and 3 social images")

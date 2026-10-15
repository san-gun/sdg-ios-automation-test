import SwiftUI
import ShoplDesignGuide

struct SDGIconLabelDemoView: View {
  private let longLabel = "텍스트가 길어질 경우 가용 폭을 모두 사용한 뒤 자연스럽게 줄바꿈됩니다."

  var body: some View {
    VStack(alignment: .leading, spacing: 24) {
      sizeExamples("Medium", normal: .medium(isBold: false), bold: .medium(isBold: true))
      sizeExamples("Small", normal: .small(isBold: false), bold: .small(isBold: true))
      sizeExamples("XSmall", normal: .xsmall(isBold: false), bold: .xsmall(isBold: true))

      VStack(alignment: .leading, spacing: 16) {
        Text(sdg: "긴 라벨 · 전체 노출 / 한 줄 말줄임")
          .typo(.body3_SB, .neutral350)

        // A narrow proposal makes wrapping, icon retention and label expansion reviewable.
        VStack(alignment: .leading, spacing: 16) {
          label(size: .small(isBold: false), spacing: .two,
                left: true, right: false, title: longLabel)
          label(size: .small(isBold: false), spacing: .four,
                left: false, right: true, title: longLabel, lineLimit: 1)
          label(size: .small(isBold: true), spacing: .four,
                left: true, right: true, title: longLabel)
          label(size: .small(isBold: true), spacing: .two,
                left: true, right: true, title: longLabel, lineLimit: 1)
        }
        .frame(width: 200, alignment: .leading)
      }
    }
    .padding(16)
    .padding(.bottom, 24)
    .frame(maxWidth: .infinity, alignment: .leading)
  }

  private func sizeExamples(
    _ title: String,
    normal: SDGIconLabel.Size,
    bold: SDGIconLabel.Size
  ) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      Text(sdg: title)
        .typo(.body3_SB, .neutral350)

      VStack(alignment: .leading, spacing: 16) {
        label(size: normal, spacing: .two, left: true, right: true, title: "Label")
        label(size: bold, spacing: .four, left: true, right: true, title: "Label")
        label(size: normal, spacing: .four, left: true, right: false, title: "Label")
        label(size: bold, spacing: .two, left: false, right: true, title: "Label")
      }
      .padding(16)
      .frame(maxWidth: .infinity, alignment: .leading)
      .overlay {
        RoundedRectangle(cornerRadius: SDGCornerRadius.radius8.rawValue)
          .stroke(Color.neutral200, lineWidth: 1)
      }
    }
  }

  private func label(
    size: SDGIconLabel.Size,
    spacing: SDGIconLabel.Spacing,
    left: Bool,
    right: Bool,
    title: String,
    lineLimit: Int? = nil
  ) -> some View {
    SDGIconLabel(
      size: size,
      spacing: spacing,
      leftImage: left ? Image(sdg: .icCommonWarning) : nil,
      rightImage: right ? Image(sdg: .icView) : nil,
      title: title,
      imageForegroundColor: .neutral700,
      titleColor: .neutral700,
      lineLimit: lineLimit
    )
  }
}

#Preview {
  SDGIconLabelDemoView()
}

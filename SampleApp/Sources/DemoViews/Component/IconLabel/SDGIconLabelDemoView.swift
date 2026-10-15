import SwiftUI
import ShoplDesignGuide

struct SDGIconLabelDemoView: View {
  private let longLabel = "긴 라벨은 남은 가용 너비에 맞춰 전체 내용을 여러 줄로 보여주거나 한 줄 말줄임으로 표시합니다."

  var body: some View {
    VStack(alignment: .leading, spacing: 24) {
      sizeSection("Medium", regular: .medium(isBold: false), semibold: .medium(isBold: true))
      sizeSection("Small", regular: .small(isBold: false), semibold: .small(isBold: true))
      sizeSection("XSmall", regular: .xsmall(isBold: false), semibold: .xsmall(isBold: true))

      section("Icon placement · Single icon fills available width") {
        label(size: .small(isBold: false), title: "Left icon", left: true, right: false)
        label(size: .small(isBold: false), title: "Right icon", left: false, right: true)
        label(size: .small(isBold: false), title: "Both icons", left: true, right: true)
      }

      section("Long label · Full text") {
        longLabelExamples(lineLimit: nil)
      }

      section("Long label · One line") {
        longLabelExamples(lineLimit: 1)
      }
    }
    .padding(.horizontal, 16)
    .padding(.top, 16)
    .padding(.bottom, 40)
    .frame(maxWidth: .infinity, alignment: .leading)
  }

  private func sizeSection(
    _ title: String,
    regular: SDGIconLabel.Size,
    semibold: SDGIconLabel.Size
  ) -> some View {
    section(title) {
      weightExamples("Regular", size: regular)
      weightExamples("SemiBold", size: semibold)
    }
  }

  private func weightExamples(_ title: String, size: SDGIconLabel.Size) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      Text(sdg: title)
        .typo(.body3_R, .neutral400)
      label(size: size, spacing: .two, title: "Label · Spacing2", left: true, right: true)
      label(size: size, spacing: .four, title: "Label · Spacing4", left: true, right: true)
    }
  }

  private func longLabelExamples(lineLimit: Int?) -> some View {
    VStack(alignment: .leading, spacing: 16) {
      label(size: .medium(isBold: false), title: longLabel, left: true, right: false, lineLimit: lineLimit)
      label(size: .small(isBold: false), title: longLabel, left: false, right: true, lineLimit: lineLimit)
      label(size: .xsmall(isBold: true), title: longLabel, left: true, right: true, lineLimit: lineLimit)
    }
  }

  private func label(
    size: SDGIconLabel.Size,
    spacing: SDGIconLabel.Spacing = .four,
    title: String,
    left: Bool,
    right: Bool,
    lineLimit: Int? = nil
  ) -> some View {
    SDGIconLabel(
      size: size,
      spacing: spacing,
      leftImage: left ? Image(sdg: .icCommonWarning) : nil,
      rightImage: right ? Image(sdg: .icView) : nil,
      title: title,
      imageForegroundColor: .neutral400,
      titleColor: .neutral700,
      lineLimit: lineLimit
    )
  }

  private func section<Content: View>(
    _ title: String,
    @ViewBuilder content: () -> Content
  ) -> some View {
    VStack(alignment: .leading, spacing: 16) {
      Text(sdg: title)
        .typo(.body3_SB, .neutral350)
      VStack(alignment: .leading, spacing: 20, content: content)
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.neutral0)
        .overlay {
          RoundedRectangle(cornerRadius: SDGCornerRadius.radius8.rawValue)
            .stroke(Color.neutral200, lineWidth: 1)
        }
    }
  }
}

#Preview {
  ScrollView {
    SDGIconLabelDemoView()
  }
}

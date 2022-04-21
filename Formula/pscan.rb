# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Pscan < Formula
  desc "Fast TCP Port Scanner."
  homepage "https://github.com/zhuima/pScan"
  version "1.1.14"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zhuima/pScan/releases/download/v1.1.14/pscan_1.1.14_Darwin_x86_64.tar.gz"
      sha256 "66e846bdd4c7f13bc89c19526b2c7bf5a0e8258f240c389a8465c719ff16aee0"

      def install
        bin.install "pscan"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/zhuima/pScan/releases/download/v1.1.14/pscan_1.1.14_Darwin_arm64.tar.gz"
      sha256 "6dd564da4668982d9aab780ea9fb2b5763aa458cec51e77e0dcab1df060148a8"

      def install
        bin.install "pscan"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zhuima/pScan/releases/download/v1.1.14/pscan_1.1.14_Linux_x86_64.tar.gz"
      sha256 "70652c958747fbba727241b243566f677c017d88459f902fc64426c2387a3fa4"

      def install
        bin.install "pscan"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zhuima/pScan/releases/download/v1.1.14/pscan_1.1.14_Linux_arm64.tar.gz"
      sha256 "de61adb288fb678406ad116d9902e807c4e1834345a4d619fb46e2e70a1213e3"

      def install
        bin.install "pscan"
      end
    end
  end
end

# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Pscan < Formula
  desc "Fast TCP Port Scanner."
  homepage "https://github.com/zhuima/pScan"
  version "1.1.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zhuima/pScan/releases/download/v1.1.19/pscan_1.1.19_Darwin_arm64.tar.gz"
      sha256 "76caf9b0bdee71b349c0c9675bc93a5ca03f72dbf71800c70651af7e8f1197f8"

      def install
        bin.install "pscan"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/zhuima/pScan/releases/download/v1.1.19/pscan_1.1.19_Darwin_x86_64.tar.gz"
      sha256 "8839955b78389764b681b91330427dc94c6d77afa2806d36e40a27461a375b28"

      def install
        bin.install "pscan"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zhuima/pScan/releases/download/v1.1.19/pscan_1.1.19_Linux_arm64.tar.gz"
      sha256 "2c873147535ee74be2c7a06c04c06d0c740f31973009723862e7f31148f78f8b"

      def install
        bin.install "pscan"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/zhuima/pScan/releases/download/v1.1.19/pscan_1.1.19_Linux_x86_64.tar.gz"
      sha256 "7d784e0743b23e991e1e82200a4de8f41cc17191dbba85167d26cbce36c209c5"

      def install
        bin.install "pscan"
      end
    end
  end
end

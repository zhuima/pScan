# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Pscan < Formula
  desc "Fast TCP Port Scanner."
  homepage "https://github.com/zhuima/pScan"
  version "1.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zhuima/pScan/releases/download/v1.1.1/pscan_1.1.1_Darwin_x86_64.tar.gz"
      sha256 "a87f5c311d851eef21be0b91ba98c9225f5cc096c05cda6d48d99f0451c0a525"

      def install
        bin.install "pscan"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/zhuima/pScan/releases/download/v1.1.1/pscan_1.1.1_Darwin_arm64.tar.gz"
      sha256 "011ef1bd338472c94b0ac6bd88791b771a04bd22daee3bc757188003d25d15c8"

      def install
        bin.install "pscan"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zhuima/pScan/releases/download/v1.1.1/pscan_1.1.1_Linux_arm64.tar.gz"
      sha256 "8abc6c61a2e7499a298a482dac17b73391877ccfe54b03c591a3316e713bbe41"

      def install
        bin.install "pscan"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/zhuima/pScan/releases/download/v1.1.1/pscan_1.1.1_Linux_x86_64.tar.gz"
      sha256 "c0f44546cbc2cbc46cdb8af76f4b634972cb5ef3e61933a08ba29bc6fdce903d"

      def install
        bin.install "pscan"
      end
    end
  end
end
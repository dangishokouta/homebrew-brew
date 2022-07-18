VERSION = "0.1.1"

class Nupoi < Formula
  desc "Check for null in the dataset"
  homepage "https://github.com/dangishokouta/nupoi"
  url "https://github.com/dangishokouta/nupoi/archive/refs/tags/v0.1.1.tar.gz"
  version VERSION
  sha256 "f503227fa5db75d0cd155d78822a239e323c6de7cf7ad7633e9fe924080c2bf6"
  license "MIT"

  option "without-completions", "Disable bash completions"
  depends_on "rustup" => :build
  depends_on "bash-completion@2" => :optional

  # depends_on "cmake" => :build

  def install
    bin.install "nupoi"
    prefix.install "README.md"
    prefix.install "LICENSE"

    bash_completion.install "completions/bash/nupoi" if build.with? "completions"
    zsh_completion.install  "completions/zsh/_nupoi" if build.with? "completions"
    fish_completion.install "completions/fish/nupoi" if build.with? "completions"
  end
end

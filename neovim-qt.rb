class NeovimQt < Formula
  desc "Neovim GUI in Qt5"
  homepage "https://github.com/reaper/neovim-qt"
  url "https://github.com/equalsraf/neovim-qt/archive/v0.2.15.tar.gz"
  sha256 "0e36c911b312a639140834d570a856294eb4b5830c4b86f99347deb02c0f5ca4"
  head "https://github.com/reaper/neovim-qt.git"

  depends_on "cmake" => :build
  depends_on "qt"
  depends_on "neovim"

  def install
    mkdir "build" do
      system "cmake", "-DCMAKE_BUILD_TYPE=Release", ".."
      system "make"
      prefix.install "bin/nvim-qt.app"
      bin.install_symlink prefix/"nvim-qt.app/Contents/MacOS/nvim-qt"
    end
  end

  test do
    system bin/"nvim-qt", "--help"
  end
end

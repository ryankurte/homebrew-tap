class Googletest < Formula
  desc "Google test framework"
  homepage "https://github.com/google/googletest"
  url "https://github.com/google/googletest/archive/release-1.7.0.tar.gz"
  version "1.7.0"
  sha256 "f73a6546fdf9fce9ff93a5015e0333a8af3062a152a9ad6bcb772c96687016cc"

  depends_on "cmake" => :build

  def install
    system "cmake", "-DBUILD_SHARED_LIBS=1", "-Dgtest_build_samples=ON", *std_cmake_args
    system "make"
    include.install Dir["include/"]
    lib.install "libgtest.dylib"
  end

  test do
    system "./sample1_unittest"
  end
end

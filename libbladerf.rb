class Libbladerf < Formula
  desc "libbladeRF USB 3.0 Superspeed Software Defined Radio library"
  homepage "https://github.com/Nuand/bladeRF"
  url "https://github.com/Nuand/bladeRF/archive/2015.07.tar.gz"
  version "2015.07"
  sha256 "9e15911ab39ba1eb4aa1bcbf518a0eac5396207fc4a58c32b2550fe0a65f9d22"

  depends_on "libusb" => :build
  depends_on "pkgconfig" => :build
  depends_on "libtecla" => :build 
  depends_on "cmake" => :build

  def install
    cd "host" do
    system "mkdir", "build"
    cd "build" do
        system "cmake", "..", *std_cmake_args
        system "make", "install" 
        end
    end
 end

  test do
    system "bladerf-cli"
  end
end

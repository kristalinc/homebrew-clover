# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Ipmiview < Formula
  desc "Supermicro IPMIView Utility"
  homepage "https://www.supermicro.com/SwDownload/SwSelect_Free.aspx"
  url "http://files.dev.clover.com/install/IPMIView_2.12.0_build.160804_bundleJRE_Linux_x64.tar.gz"
  version "2.12.0"
  sha256 "787a060413451a4a5993c31805f55a221087b7199bbaf20e9fe1254e2a76db42"

  # depends_on "cmake" => :build

  def install
    # Get rid of the JRE directory so it'll use the system JRE
    system "rm", "-rf", "jre"

    # There's probably a more correct way to do this
    system "cp", "-a", ".", "#{libexec}"

    # Link in the actual commands
    bin.install_symlink "../libexec/IPMIView20"
    bin.install_symlink "../libexec/JViewerX9"
    bin.install_symlink "../libexec/TrapReceiver"
    bin.install_symlink "../libexec/iKVM"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test ipmiview`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end

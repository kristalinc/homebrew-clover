# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Smcipmitool < Formula
  desc "Supermicro SMC IPMITool Utility"
  homepage "https://www.supermicro.com/SwDownload/SwSelect_Free.aspx"
  url "http://files.dev.clover.com/install/SMCIPMITool_2.17.0_build.161222_bundleJRE_Linux_x64.tar.gz"
  version "2.17.0"
  sha256 "edc9c5fea2375273953aea679964d557d4a535f1e8c461ce2be6fb363d573910"

  # depends_on "cmake" => :build

  def install
    # Get rid of the JRE directory so it'll use the system JRE
    system "rm", "-rf", "jre"

    # There's probably a more correct way to do this
    system "cp", "-a", ".", "#{libexec}"

    # Link in the actual commands
    bin.install_symlink "../libexec/SMCIPMITool"
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
